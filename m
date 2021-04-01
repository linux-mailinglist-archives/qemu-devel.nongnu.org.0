Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 335243514DD
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 14:46:21 +0200 (CEST)
Received: from localhost ([::1]:49060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRwiJ-0007sn-LC
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 08:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRwgn-0007L5-PV
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:44:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRwgl-0004gI-5P
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:44:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617281080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=387rRRbaZYvckk2VXgApdJdhzNgMkGbtwQW7p9oVLDg=;
 b=g3mUXd9drJsi+ZCSOuouBH30BepnUpQnq6wARFb7tElKFpwAdsee+rRaKS+VUncajdXe4G
 h3+OT4N61bCeIF0OokQjUKCFvJzLDcT0WSDClongUd+xVD5X9QFRBhU39Vap7uM7R1XEni
 vfiE6pZ8UZZ4kLQ1giOkVDeYO0iv62g=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-7xZUFLLuN5SSd4RQi1h_aQ-1; Thu, 01 Apr 2021 08:44:38 -0400
X-MC-Unique: 7xZUFLLuN5SSd4RQi1h_aQ-1
Received: by mail-ed1-f70.google.com with SMTP id r19so2780722edv.3
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 05:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=387rRRbaZYvckk2VXgApdJdhzNgMkGbtwQW7p9oVLDg=;
 b=HFZxDpJE2zResVWuLU1f77HVBPJ4MtCRCseoJ82bNzTsymVLL9CXxVlcw5eP2EGbZc
 kAw2x7u03FPE1sMHfLIGmJTqleE8xoeiPaJRHv8MoV5m1dLWgFEIxDYpFXLtqqGmVTpK
 JaGxcWUgdmRARI7CEB6pRgkdoG/028se/FQB8hov81h2DRgPfWBZhJL0r33+cV0QaAcF
 QoKRHzRIlrpYYocMmDkR19Tv8luRXcNyxNTIj4VkZJP3neyvawWj/Bws+fwNrALTUOvQ
 CmTcbA9UOUh34/Ask/VsZ2hb8CRCN0iX21tjbooKEX8MUzjVZJXpzv9TYHu00udMfQsD
 /gUA==
X-Gm-Message-State: AOAM5324CBz+cnU0tmBHkOIcai41PXwpM0v9s/NVy44VpSPmeHX/VzE6
 FLXKD0mVGVnPzdx+IkZ811lz4+UmVEXcEitcJFlU2YmZ3In8cmRCEiZHDoJs4dr5XQ+jPnjqkPS
 0sqPuekRvsUaF8JA=
X-Received: by 2002:a05:6402:b2a:: with SMTP id
 bo10mr9456462edb.144.1617281077632; 
 Thu, 01 Apr 2021 05:44:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxrO1rOlQBo7/fUH5p0M8s2FjLU6C+CHPKUpgAt7hKjHCcqLdHFWkr5favXj1buhGOWELC4g==
X-Received: by 2002:a05:6402:b2a:: with SMTP id
 bo10mr9456447edb.144.1617281077481; 
 Thu, 01 Apr 2021 05:44:37 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v15sm3452842edw.28.2021.04.01.05.44.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 05:44:36 -0700 (PDT)
Subject: Re: [PATCH v6 1/4] Add NVMM accelerator: configure and build logic
To: Reinoud Zandijk <reinoud@NetBSD.org>
References: <20210331200800.24168-1-reinoud@NetBSD.org>
 <20210331200800.24168-2-reinoud@NetBSD.org>
 <5251852d-19ac-11d1-6343-6e1156d81f3e@redhat.com>
 <YGW50ugBOV+GIe+3@diablo.13thmonkey.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cf8800fa-d854-c475-aae7-bd9a96a31f74@redhat.com>
Date: Thu, 1 Apr 2021 14:44:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YGW50ugBOV+GIe+3@diablo.13thmonkey.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kamil Rytarowski <kamil@NetBSD.org>, Ryo ONODERA <ryoon@netbsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/04/21 14:17, Reinoud Zandijk wrote:
> Hi Paolo,
> 
> thanks for the review!
> 
> On Thu, Apr 01, 2021 at 10:28:19AM +0200, Paolo Bonzini wrote:
>> On 31/03/21 22:07, Reinoud Zandijk wrote:
>>> Signed-off-by: Reinoud Zandijk <reinoud@NetBSD.org>
>>> Signed-off-by: Kamil Rytarowski <kamil@NetBSD.org>
>>
>> Incorrect order for the S-o-b headers, you should be last.
> 
> Oops? there is a prescribed order in those? Will change the order!

The second got the patch from the first, the third from the second etc.

> Will try to fix it and go for version 7 soon.
> 
> Is there a way for `qemu format-patch' to preserve the comments made in the
> previous run? It would be handy if it would paste in the old patchset's
> comments in the new patchset :)

Hmm, not sure what you mean.  There is "git notes".

Paolo


