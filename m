Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB119475753
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:05:11 +0100 (CET)
Received: from localhost ([::1]:54838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxS5u-0007dF-Ow
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:05:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxReX-0001xi-SR
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:36:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxReV-0007uT-L9
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:36:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639564610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ptKoSAfT5SsWIhv5lmYV8KPEM4zjV9bjMbcaoWPndEY=;
 b=R7gR8gjGzMN9Cyd5vApRyburHobYgRRfZbDp5dkzsOt4PzXmOeVEjfqsrtfqHkjmVPPDG0
 SWrkp8MkYYIoeQPqOkW/TOwEDkFC/+55KNooXZpB2CDT5q77nWxbV3YeminPQ74q1gtHWe
 xxRhhkUD0xU/fC8EO9IcYfBRTbqR0eQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-O95k_qqSMEOkr8f4eDiImA-1; Wed, 15 Dec 2021 05:36:50 -0500
X-MC-Unique: O95k_qqSMEOkr8f4eDiImA-1
Received: by mail-wm1-f69.google.com with SMTP id
 v23-20020a05600c215700b0034566adb612so690393wml.0
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:36:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ptKoSAfT5SsWIhv5lmYV8KPEM4zjV9bjMbcaoWPndEY=;
 b=vu09KgaoOyvup7/BhPxVKdsc0TAxeSA+BP1+3CT7yHi6evi4piG8TU2Xp5ioQZytji
 XZmB7+OJm63rqwwDKJRpztLPn8Lp6jBKRmc4epP5jEaOHS/bYdKTM48bu4AvL/KPdbmx
 dAfIuf0rauTGqq8aI4L5vZG/0mWjW6HhCCjqM/dK9ta3kHG6XyW/xgHo7gMO52KiEsjd
 AFQbcr4fycgW8k4g3ElpGalJwTiGukdwgouOW1pF3I7gZ1zSGlU94N3tNaPuEEs+DOY1
 0iGgsu7tb4fEYrG1xgz+H0Hs5vOqsTWuZG8Gmibq79VAYEkIVTFkO7GEml2isJd8maPX
 P7tg==
X-Gm-Message-State: AOAM531+a9b4W5UmUOmBExnCEiFzHjyY4aCoZm3Qd6a/hZkO14eZNgqx
 IcG/ef+NX6Ye2shr24RPMAiayiUJLzQ9w6PUqayJDr3e8h0qfxGxjmw48tqDddinax3xDOwiHCA
 0WKN5jQp7+K92xVuUr0nS1iKow51U3ub3F9qaXzlt0QRtx6kvaDSOj8YJPmxgENsO
X-Received: by 2002:adf:e545:: with SMTP id z5mr3752097wrm.444.1639564608443; 
 Wed, 15 Dec 2021 02:36:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBnUf22YjzKJbcPC/wjehGcYrBCnzHHS+4oHxIIgmKjGoySZZ7bBKyLwVNBvgSyN8jPjVkHw==
X-Received: by 2002:adf:e545:: with SMTP id z5mr3752079wrm.444.1639564608279; 
 Wed, 15 Dec 2021 02:36:48 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id t8sm1902442wmq.32.2021.12.15.02.36.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:36:47 -0800 (PST)
Message-ID: <03770439-52cd-ba59-8ae2-643671d3b682@redhat.com>
Date: Wed, 15 Dec 2021 11:36:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-for-7.0] target/i386/kvm: Replace use of __u32 type
To: qemu-devel@nongnu.org
References: <20211116193955.2793171-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211116193955.2793171-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laurent,

This patch is reviewed, can it go via your trivial tree?

On 11/16/21 20:39, Philippe Mathieu-Daudé wrote:
> QEMU coding style mandates to not use Linux kernel internal
> types for scalars types. Replace __u32 by uint32_t.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  target/i386/kvm/kvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 5a698bde19a..13f8e30c2a5 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -1406,7 +1406,7 @@ static int hyperv_fill_cpuids(CPUState *cs,
>      c->edx = cpu->hyperv_limits[2];
>  
>      if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)) {
> -        __u32 function;
> +        uint32_t function;
>  
>          /* Create zeroed 0x40000006..0x40000009 leaves */
>          for (function = HV_CPUID_IMPLEMENT_LIMITS + 1;
> 


