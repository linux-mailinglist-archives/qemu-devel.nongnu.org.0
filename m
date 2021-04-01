Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82ADE35116A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 11:04:34 +0200 (CEST)
Received: from localhost ([::1]:41384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRtFh-0003rY-35
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 05:04:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRtAD-0000ij-NE
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:58:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRtA9-0001PM-A1
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:58:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617267528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SU46m+WCWDrJ2rmP14gpnskRlcAQUcrzbiu90F/SU9g=;
 b=f85XswcKqwYodk1xlH9QlmRgrXeTyp+kqlcambY4J3e5DrzzC862hCu+60TlTYPrE77ZAL
 /XAiBjfdb0VDgHrB9d90XSLbWpWapUVs7gflw0PLzw5gpLveiiWQyf7lEhbEQ++tWLgWXV
 5c+C3K0PEmkRNwPwRNSY/HX/4KIRlyg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-U9sadhdgNKaiycw4RZnwvg-1; Thu, 01 Apr 2021 04:58:44 -0400
X-MC-Unique: U9sadhdgNKaiycw4RZnwvg-1
Received: by mail-ed1-f71.google.com with SMTP id h5so2501420edf.17
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 01:58:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SU46m+WCWDrJ2rmP14gpnskRlcAQUcrzbiu90F/SU9g=;
 b=J/0/QSd/gm6SQG15f2bKePIqwhfFHm0jiU75WyhcvmZ/mWs1m3enNmvPyyvO2m5cxi
 CuOJLTV17Usp3veZ+X532DbSn4AOvlqtU/Olx+/RFpp1ylY9F4N1FPx3u4+nFKHu16jh
 /oDL/g8aUoj/M960nibNNqTZdEeNTJqz1abG73WkTg4btwUucVgnmJgiWveBaJPYnUIH
 irKdwMZul7eDqcyLOvPnCemXYCKnxP+pXHUIXo2GNnOpucopQK7J+6Gs2vnrV3URq346
 RlRhnPGrI7S75XaCiHnEsdbFRjEZ89Imt0dlGHSXbiy/ZD43L+FcCfW8VYlAH4Can0tA
 jjyg==
X-Gm-Message-State: AOAM530ypw0Pz7XC4M4iUlreR40no7+6ThFagJmK54P0AxqmBL/lmzOL
 Q60UeWLcJ9CzRau/fL5uBizwWXydj/2cWFVsfow/ulGrzHlwMTIHfjIyC2vv0XADoCLBS8YLJR6
 BFc3/E9BsPr+iQmQ=
X-Received: by 2002:a17:907:766f:: with SMTP id
 kk15mr8111985ejc.24.1617267523606; 
 Thu, 01 Apr 2021 01:58:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3vQJfDPGlUG37BcyY/4b5Hd1OB4frkmVcUSF3IM4MHfwRTV1XEXtxXKnD2Jq3rbfKsQGDqQ==
X-Received: by 2002:a17:907:766f:: with SMTP id
 kk15mr8111975ejc.24.1617267523446; 
 Thu, 01 Apr 2021 01:58:43 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w18sm2505529ejn.23.2021.04.01.01.58.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 01:58:42 -0700 (PDT)
Subject: Re: [PATCH v3 2/4] block: check for sys/disk.h
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Joelle van Dyne <j@getutm.app>
References: <20210315180341.31638-1-j@getutm.app>
 <20210315180341.31638-3-j@getutm.app>
 <CA+E+eSAc7mvmxfrafgL4RYoSpj-M2T7WCXYXgFw3YOwxwWx+Rw@mail.gmail.com>
 <9181c138-d39e-7d28-d19a-8a46b118fb23@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <945069b6-1d8f-a898-5f93-8780fc02ac84@redhat.com>
Date: Thu, 1 Apr 2021 10:58:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <9181c138-d39e-7d28-d19a-8a46b118fb23@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/04/21 10:03, Philippe Mathieu-Daudé wrote:
> On 4/1/21 7:08 AM, Joelle van Dyne wrote:
>> On Mon, Mar 15, 2021 at 11:03 AM Joelle van Dyne <j@getutm.app> wrote:
>>>
>>> Some BSD platforms do not have this header.
>>>
>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> Signed-off-by: Joelle van Dyne <j@getutm.app>
>>
>> Please bear with me as I am still new to this, but what happens to the
>> three patches that are reviewed if the last patch does not get
>> reviewed? Do the reviewed patches still get to make it into 6.0? I am
>> willing to drop the unreviewed patch if there are issues. Thanks.
> 
> I guess this is bad timing, as this time in year various maintainers
> are on vacations. Cc'ing Paolo as he sometimes take generic/block
> patches.

I didn't notice this series before, and it was posted a bit late (one 
day before feature freeze).  I have queued it, so Joelle need not do 
anything else, but I won't include it in my pull request for 6.0.

Paolo


