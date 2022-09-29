Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 126775EF7DF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 16:42:33 +0200 (CEST)
Received: from localhost ([::1]:51266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odukC-0002MD-35
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 10:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods6B-00022V-PV
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:53:08 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods68-00034D-Es
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:53:03 -0400
Received: by mail-wr1-x434.google.com with SMTP id h7so1769486wru.10
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=9CKp4+MliHDX49kndl7AwsM9I9vkkBHIOpOCuRYd2sA=;
 b=cpOkTctVuUd5UmzRp4d6HnHjpSw+U70YBdfuBUbwzIhYQov6Ojn/xOCXgXi8qjLiGz
 Lx7D6b7KfpUlJxVZb0cqfLkql20FnYm8iGVKRCbqRxbXZgjZ6Hp0R4RAeoAStpm/envs
 yoc+66tETwMhK6G4eQTxsQwVx7/mV6QcI8+gpg8RNL/XiubhHWkVKy7ZFRkadhUcQaat
 6856bQcpm4nVcYxJM5WAaEkt53iPqgS65WTafwzYgnqEu8RTuGfv6tnzS1w59nzbKnjU
 oFoA0peNjgKruEQOIw7Fs1sQH3YauZ62ygXyYyaEsSb3grkdTUbpdP8LP4bhbN2BsAJc
 AI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=9CKp4+MliHDX49kndl7AwsM9I9vkkBHIOpOCuRYd2sA=;
 b=nN/uPF+rRq+hraV9VO2UjkN6K0fN+J7SubdpRZQIj5y6sQq+aJIu2lJrIPPu1cG4AL
 c1Y/jfd/hYSH63S4e/lBAuArQGE5UqjZkurm+HQcwkuoPuNcrIrP9AT1tCDQXm6wvHm9
 Q6axsKfptwYrOHQbN+9Z3IgLcwidS8bPghqcenIW2nkPFUHc0i6OZKJQ/fAkPBtjcd4C
 3N7YvSOmh5O0yhS+BqNkqN2YT81931YpPCVDTuIzcHJ+0ce+eO/2vundMMktgDLvFu4p
 uHJD+P5tDTQEDegZ1+0utYleQblJ9kR/RvJQEG203yzmopbNJmwlFPXwO77DKSj5Rb1T
 u7dg==
X-Gm-Message-State: ACrzQf2ISWQ1By5Qk9llsoNTPMTCdcdfha307gphZ7wr6HKee/Le8+FX
 RmQTjepjawW6YcN8ndWfak9Rww==
X-Google-Smtp-Source: AMsMyM522VFNRg+nrdRZDxke5nFm1X0Md+5Az1TqKXkdTaYRE/5jCB9PEo0DMwC0gZtfgPHb5VTlbw==
X-Received: by 2002:a05:6000:18d1:b0:22c:c347:8f9d with SMTP id
 w17-20020a05600018d100b0022cc3478f9dmr2197376wrq.358.1664452353896; 
 Thu, 29 Sep 2022 04:52:33 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n43-20020a05600c502b00b003a83ca67f73sm4430671wmr.3.2022.09.29.04.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:52:33 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9AED71FFB8;
 Thu, 29 Sep 2022 12:52:32 +0100 (BST)
References: <20220925105124.82033-1-richard.henderson@linaro.org>
 <20220925105124.82033-5-richard.henderson@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-D?=
 =?utf-8?Q?aud=C3=A9?= <f4bug@amsat.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 04/17] accel/tcg: Introduce probe_access_full
Date: Thu, 29 Sep 2022 12:51:45 +0100
In-reply-to: <20220925105124.82033-5-richard.henderson@linaro.org>
Message-ID: <87czbe1jpb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Add an interface to return the CPUTLBEntryFull struct
> that goes with the lookup.  The result is not intended
> to be valid across multiple lookups, so the user must
> use the results immediately.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/exec-all.h | 11 ++++++++++
>  accel/tcg/cputlb.c      | 47 +++++++++++++++++++++++++----------------
>  2 files changed, 40 insertions(+), 18 deletions(-)
>
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index bcad607c4e..758cf6bcc7 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -434,6 +434,17 @@ int probe_access_flags(CPUArchState *env, target_ulo=
ng addr,
>                         MMUAccessType access_type, int mmu_idx,
>                         bool nonfault, void **phost, uintptr_t retaddr);
>=20=20
> +#ifndef CONFIG_USER_ONLY
> +/**
> + * probe_access_full:
> + * Like probe_access_flags, except also return into @pfull.
> + */

That lifetime requirement on @pfull really should be documented here as
well as the commit message.

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

