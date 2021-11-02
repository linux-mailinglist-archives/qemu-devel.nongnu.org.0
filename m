Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 145E5442E14
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:31:33 +0100 (CET)
Received: from localhost ([::1]:52814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhswu-0004dn-5c
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:31:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mhs6k-000548-L9
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:37:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mhs6i-0006ni-VR
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:37:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635853056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5e/GN4m5UMJiRITL91VaISwZ8Cwxwv1MeV/2U6vNd3c=;
 b=Hz6s09EJKmvMHDEaHR8zmmDPJKM+Px5OfA9Ptnk9Ywji317TcSe65iuJlV0smxhChGFI3I
 Q2tYBKhzmzcMEdVCJ6w/rgBN5Uq+LZxxT/b1/U4gZeCagb4OCzHpiXqJsxzkfpsG14RZaF
 dqm2c8gQA0DTzuvN8+eIDBGlCN4iA1Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-hFIbtgzyOo-uk5pS2sIL2g-1; Tue, 02 Nov 2021 07:37:35 -0400
X-MC-Unique: hFIbtgzyOo-uk5pS2sIL2g-1
Received: by mail-wr1-f71.google.com with SMTP id
 d13-20020adf9b8d000000b00160a94c235aso7350105wrc.2
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5e/GN4m5UMJiRITL91VaISwZ8Cwxwv1MeV/2U6vNd3c=;
 b=IJrZbDqnhQhNRcWGSuYgN1QlSRb9IFExwlQaCA0WXRqEq4wSkElbWdbQZsq+ZZ0TIv
 HAlI2alooEJjXkELnpvpUAcIgJ/tkMqfdbzVKDC3vnEA5IuKnx6HGK4SYKEd88Juqlce
 tQWYlbMCLeFi47QMZM6ffy5aE2wOY3ldTUV6GppbIKHN7cT9rNo2dNrsyTp7CPwi4iPg
 Qfn8fYtlayfWjZKpzisYWsqpbjCkaka3PV8RYLLaqUraj6ZtsOzuvsecFCDu++BEM33R
 bj68A0qlyp/UfnF3uxL+DTxbzM2Nnf6RjVctgiAx24IDBC34hO1DuymnC7UPpFOrFv28
 Yhow==
X-Gm-Message-State: AOAM530qOAMjHkKPORKUZFNMRAvNWqZlnmkNLz+qRJS/dasERM8Wso1v
 QmLoRsXr31EAn25QMAarER+B5o2JUpev6nQRuXvyg4ZONkvdLlc56nzAXFdqEXwl+nX3iGCOYiB
 c85emv9xwFQr1xdU=
X-Received: by 2002:a05:600c:1990:: with SMTP id
 t16mr6684792wmq.124.1635853054019; 
 Tue, 02 Nov 2021 04:37:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHsMI5K6qGgFPLmCnfTNwzKyDAQQgDbaY2fAJnRecSxBYqD5+UfKvnXcEExjkLAaMAHhUtHQ==
X-Received: by 2002:a05:600c:1990:: with SMTP id
 t16mr6684774wmq.124.1635853053827; 
 Tue, 02 Nov 2021 04:37:33 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e18sm15221199wrs.48.2021.11.02.04.37.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 04:37:32 -0700 (PDT)
Message-ID: <ff2f9054-2c2d-7da7-314c-20828291210b@redhat.com>
Date: Tue, 2 Nov 2021 12:37:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/4] configure: Remove the check for the __thread keyword
To: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211028185910.1729744-1-thuth@redhat.com>
 <20211028185910.1729744-2-thuth@redhat.com>
 <1db9ea51-2813-2720-3ab8-fff88ffff134@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <1db9ea51-2813-2720-3ab8-fff88ffff134@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/10/21 18:48, Richard Henderson wrote:
> On 10/28/21 11:59 AM, Thomas Huth wrote:
>> We recently bumped our minimum required version of GCC to 7.4
>> and Clang to 6.0, and those compiler versions should support
>> the __thread keyword already.
>>
>> Signed-off-by: Thomas Huth<thuth@redhat.com>
>> ---
>>   configure | 11 -----------
>>   1 file changed, 11 deletions(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> r~
> 

Queued, thanks.

Paolo


