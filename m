Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 043B4492537
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 12:51:13 +0100 (CET)
Received: from localhost ([::1]:41030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9n15-0005Qs-Vk
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 06:51:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9myz-0002um-HP
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 06:49:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9myx-0003cJ-N0
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 06:49:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642506538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rJmhMQAPAUE8DIJMTuZiG1cJplgetpIYbgCV1zDAJrA=;
 b=YqCH1YBvietvUANNR46T1jTsms2nrW8A1BKhYAViAxMepHiwgqqRYBnULFLulfs+KlkA5D
 qQRvqKkL3RbViQfZMoMRO5RLFDEoxkcplIN79X7jfed8ZmsVEexS0rlfF1cV4qMlV5xBjs
 EsGayyQUTCrTFa24kI+8mvZrW6pxKlk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-T65ccb-WOM-82LNh8e0EJg-1; Tue, 18 Jan 2022 06:48:55 -0500
X-MC-Unique: T65ccb-WOM-82LNh8e0EJg-1
Received: by mail-wm1-f70.google.com with SMTP id
 r11-20020a1c440b000000b0034d79edde84so44605wma.0
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 03:48:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rJmhMQAPAUE8DIJMTuZiG1cJplgetpIYbgCV1zDAJrA=;
 b=nZRKvzNkUSIwM5uwWCRpQeM0fX6bmlA+EUxHcl7GYOSG+14kQMdaMcbQacO3VRucwF
 I48r9KAOB5y+2zf8bDDTh7h/tB1wVfOsiQ9Naya32pV4ur0zja1Kp//G2RLLaxm1DFhu
 hX2F90j+WDTETvy7SZgHCP+1E9kUGL7VvV3nBdAb96xjSGuh3LUeTMKSM3lt6kzzsle0
 fNkfVwrHQMSCLPWBxa/T2/+yC10glGvSqfPBeGjWw7269/AhII1Fky5IE30sZLH63jhO
 kr8VSXKkixOEakDGj5wkpREqYU+5XlGUeIG8F+DqQk2WnXeIIvFiTQpQwDolHf/9c/XS
 6MjA==
X-Gm-Message-State: AOAM532LWl4NR52KCehWw4UgAvrNqkB60aJCG86UyOGwVAgQZgBLDMaV
 TZZFRrOHDLmnhN+X6Dh4dWIWdiwc1PWH7fYAgW2NcgwXpQC4OQRXQu67/bjU93sq7QBo6QpTrMb
 DcaEhRih2Ar3VFqA=
X-Received: by 2002:a5d:64a5:: with SMTP id m5mr7118957wrp.503.1642506533843; 
 Tue, 18 Jan 2022 03:48:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMH4zwqeYteYIWMDvBNxrX+TqOqhvWYTsHoMjav5uT9XcDgnVv1YavvpD6dA17me6xlzQFPQ==
X-Received: by 2002:a5d:64a5:: with SMTP id m5mr7118937wrp.503.1642506533643; 
 Tue, 18 Jan 2022 03:48:53 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-68.customers.d1-online.com.
 [80.187.98.68])
 by smtp.gmail.com with ESMTPSA id f15sm437820wrd.45.2022.01.18.03.48.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 03:48:53 -0800 (PST)
Message-ID: <081e99da-75cf-f93d-2500-deeece254f1d@redhat.com>
Date: Tue, 18 Jan 2022 12:48:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH] linux-user: expand reserved brk space for 64bit guests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220113165550.4184455-1-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220113165550.4184455-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-s390x@nongnu.org, cohuck@redhat.com,
 richard.henderson@linaro.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/01/2022 17.55, Alex Bennée wrote:
> A recent change to fix commpage allocation issues on 32bit hosts
> revealed another intermittent issue on s390x. The root cause was the
> headroom we give for the brk space wasn't enough causing the guest to
> attempt to map something on top of QEMUs own pages. We do not
> currently do anything to protect from this (see #555).
> 
> By inspection the brk mmap moves around and top of the address range
> has been measured as far as 19Mb away from the top of the binary. As
> we chose a smallish number to keep 32bit on 32 bit feasible we only
> increase the gap for 64 bit guests. This does mean that 64-on-32
> static binaries are more likely to fail to find a hole in the address
> space but that is hopefully a fairly rare situation.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   linux-user/elfload.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 64b87d37e8..9628a38361 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2800,11 +2800,17 @@ static void load_elf_image(const char *image_name, int image_fd,
>            * and the stack, lest they be placed immediately after
>            * the data segment and block allocation from the brk.
>            *
> -         * 16MB is chosen as "large enough" without being so large
> -         * as to allow the result to not fit with a 32-bit guest on
> -         * a 32-bit host.
> +         * 16MB is chosen as "large enough" without being so large as
> +         * to allow the result to not fit with a 32-bit guest on a
> +         * 32-bit host. However some 64 bit guests (e.g. s390x)
> +         * attempt to place their heap further ahead and currently
> +         * nothing stops them smashing into QEMUs address space.
>            */
> +#if TARGET_LONG_BITS == 64
> +        info->reserve_brk = 32 * MiB;
> +#else
>           info->reserve_brk = 16 * MiB;
> +#endif
>           hiaddr += info->reserve_brk;
>   
>           if (ehdr->e_type == ET_EXEC) {

Should be ok as a temporary work-around at least, I guess...

FWIW,
Reviewed-by: Thomas Huth <thuth@redhat.com>


