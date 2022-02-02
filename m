Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D699F4A7155
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 14:15:47 +0100 (CET)
Received: from localhost ([::1]:57362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFFUA-0001xp-9J
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 08:15:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nFExs-0001gG-Hr
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 07:42:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nFExf-0008FN-1N
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 07:42:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643805623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dWYjWpaLphCTZ6dhHNEC2hT5VCO00/XB6QbQd62Uwpk=;
 b=UNdiyJ/aQ8DEjJytWEmlwVTU+Wo6o2TIQ/LtlaLs09YE8FtqOVKyZjhGPOA2VLW8YqMXn8
 x58szRn3C3RspqPv7GWEsnIfI6uFarioeSWjnEauy+PJLRNHqp+frrZOoKQwzxstJZLfae
 3fyN9GlOFVe5cCbDlErLV4C7UNViMSk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-__RbGtBiOKiIpVc1MR9cGA-1; Wed, 02 Feb 2022 07:40:20 -0500
X-MC-Unique: __RbGtBiOKiIpVc1MR9cGA-1
Received: by mail-wm1-f72.google.com with SMTP id
 r132-20020a1c448a000000b00352cf8b74dcso114602wma.0
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 04:40:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dWYjWpaLphCTZ6dhHNEC2hT5VCO00/XB6QbQd62Uwpk=;
 b=DLC66eVjBO1ujsziOGG6AyWcvW5XlG/In1FTln3CzxFc9vVdC68+04+n/FywKys8Xs
 Ar/WJ1s5x3kHDXMxs9mfzFiIYdbnQP3RSpckLfdHrb4GwB7x5BaP2rT3m/j/CmZe18l1
 yhs95VVWkhVC14BT3qiZPbSMO+6CcdJny+5B0UR+4R6m8lMOCs1c5ZHBMHezNlzC6WdB
 JzFmEtS3sHM+W/fhUetuva/euNhPF+70IVhYV+W95cvQFl64xn9kNoQ7OvnmsXTiH5H9
 DA9cTtrEKtmmClcaIaJPB26E3UsIXYzxYVakkE9gHMJGcfZ9Z8Hh9FEFBC0TDhERsmoS
 9YnQ==
X-Gm-Message-State: AOAM533SN1TKzKCcMBj7UBzC6X87b+VntIAy+/sfjl5qAize95KNaXX7
 um2MNpyR3akSI8XX9aruXrYmyrO5JFI4VgET9zT0gwI0rv1cResW83JM3mW1dGcqFH6TLNor9hk
 VHJIVxqHj4g1uvis=
X-Received: by 2002:a5d:698f:: with SMTP id g15mr24846187wru.273.1643805619400; 
 Wed, 02 Feb 2022 04:40:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3oeKWdcTUnMTGeZ++YTakRizguO2I8mL7dzxgsXeJ8T7kGD2evfZqBmd9PZRFRtn2LBqILg==
X-Received: by 2002:a5d:698f:: with SMTP id g15mr24846171wru.273.1643805619167; 
 Wed, 02 Feb 2022 04:40:19 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id c8sm5637359wmq.34.2022.02.02.04.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 04:40:18 -0800 (PST)
Date: Wed, 2 Feb 2022 13:40:16 +0100
From: Andrew Jones <drjones@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH] arm: force flag recalculation when messing with DAIF
Message-ID: <20220202124016.hr5i3m2xxhsacb6p@gator>
References: <20220202122353.457084-1-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20220202122353.457084-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 02, 2022 at 12:23:53PM +0000, Alex Bennée wrote:
> The recently introduced debug tests in kvm-unit-tests exposed an error
> in our handling of singlestep cause by stale hflags. This is caught by
> --enable-debug-tcg when running the tests.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Andrew Jones <drjones@redhat.com>

s/Cc: Andrew/Reported-by: Andrew/

and now also

Tested-by: Andrew Jones <drjones@redhat.com>

Thanks,
drew

> ---
>  target/arm/helper-a64.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
> index d6a6fd73d9..7cf953b1e6 100644
> --- a/target/arm/helper-a64.c
> +++ b/target/arm/helper-a64.c
> @@ -83,12 +83,14 @@ void HELPER(msr_i_daifset)(CPUARMState *env, uint32_t imm)
>  {
>      daif_check(env, 0x1e, imm, GETPC());
>      env->daif |= (imm << 6) & PSTATE_DAIF;
> +    arm_rebuild_hflags(env);
>  }
>  
>  void HELPER(msr_i_daifclear)(CPUARMState *env, uint32_t imm)
>  {
>      daif_check(env, 0x1f, imm, GETPC());
>      env->daif &= ~((imm << 6) & PSTATE_DAIF);
> +    arm_rebuild_hflags(env);
>  }
>  
>  /* Convert a softfloat float_relation_ (as returned by
> -- 
> 2.30.2
> 


