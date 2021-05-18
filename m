Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF1138768D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:31:41 +0200 (CEST)
Received: from localhost ([::1]:40542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lix0l-0008Mw-8H
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwV3-0003up-5Q
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:58:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwV1-0002Bg-EX
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:58:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621331930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gj119yVjDXfPUSXhn3ohArMqO7iVxxG3bee6PNjrIao=;
 b=QLAnCuGdT5Fz6E2yVamOb8r2KPdFn1Ch8+O8FnKaFEwFoEyO5Qavi++dmcrXnwhkCIdpy3
 smVy7KBjgdhaW39b9ek8k7aF3P+KO4AypeG5N12MADU6fattuccWV1dA5IqypzfI/tY+54
 4x8xn41CF8Z7pxtGSfsZyba2bIZd6H4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-0hUpnFD0NV2Hv21Np34kCw-1; Tue, 18 May 2021 05:58:48 -0400
X-MC-Unique: 0hUpnFD0NV2Hv21Np34kCw-1
Received: by mail-ed1-f70.google.com with SMTP id
 q18-20020a0564025192b02903888712212fso5448241edd.19
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gj119yVjDXfPUSXhn3ohArMqO7iVxxG3bee6PNjrIao=;
 b=PXH2Y0i13QYPsmX86wRmgmZTjOizrsRuZLSgkEigUgkSLNj1uKWRFOQ+JHk2C4BVzQ
 KZ9NE290OhYCM1Y7sbXvCemgovVzoKfE6MFgwzNyPHiV4MjOfkbaiVJ2XPUSYkow8k2j
 21h/Iz/TXAKRmMfGQ7MbVEm61GCZJGtkTWh1RVf9RM1Znj639W6y4LEcNQkwmNWc+YJO
 dn43TdQZUPzqyo0QMoMo/l0NA/Iwe7als7NPyiPehgJnSxlQW7RbZK2vXXTUbG8fy/js
 MeiTIjWY0Cr83jjHiQDRJnfLZJ2tfVbDWgDl2xdITLfuarc7O54wCuJGeLbtPQ88W5/W
 YEew==
X-Gm-Message-State: AOAM531cnkgUFMPMJ3eXxZX5Ekutd7DFv8zSK5rPpcVhwxdx2jmwDASW
 9HB15rwOeOjP+NfRt4CuVK2ZxneJL2ocxp2siPktWgX7K2xGPodyEmizXJMDmPMq6BTctxguH8D
 8xZvUxMfaxHf4HYk=
X-Received: by 2002:a05:6402:46:: with SMTP id
 f6mr6046888edu.252.1621331926804; 
 Tue, 18 May 2021 02:58:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0iXWaofe7AeYqYp4rETI3GPWQDQeO1OSWvkho4f1zUaBKlqRvhTDdOtMswOHvZCiWLjFl9Q==
X-Received: by 2002:a05:6402:46:: with SMTP id
 f6mr6046876edu.252.1621331926622; 
 Tue, 18 May 2021 02:58:46 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id da14sm2789906edb.44.2021.05.18.02.58.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:58:46 -0700 (PDT)
Subject: Re: [PATCH v2 38/50] target/i386: Remove user stub for cpu_vmexit
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-39-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a2a48d6e-08cc-837a-0d44-fa1baebe9383@redhat.com>
Date: Tue, 18 May 2021 11:58:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-39-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 17:13, Richard Henderson wrote:
> This function is only called from tcg/sysemu/.
> There is no need for a stub in tcg/user/.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/helper-tcg.h     | 4 +++-
>   target/i386/tcg/user/svm_stubs.c | 6 ------
>   2 files changed, 3 insertions(+), 7 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


