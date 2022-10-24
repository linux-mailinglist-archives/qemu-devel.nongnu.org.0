Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8DC60B484
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 19:50:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omyCn-0000fr-1E; Mon, 24 Oct 2022 10:13:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1omyCi-0000fS-6i
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:13:25 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1omyCf-0003oq-Sb
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:13:23 -0400
Received: by mail-wr1-x435.google.com with SMTP id j15so5934498wrq.3
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 07:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PtmqCieWIsT0up/9ewZKR1k/Nlo4HihK+EnvKTG+kr8=;
 b=MCtghc+f8Wg6CaMBL1qxA4I0TuK2iDE8YCU/fEextAfYojFgBh5DQCW4e0dGWMM31A
 6dfqSD02ZEqF9LzUd0veH9lJTvSw+UQGwU1q8gqpwJdCvHMa5KkUde540JI37x2NPk7e
 4h14UDzgHLicvHjJ72/9MPt/Y8YZcErRD2Qk5p/bgeIAkStgltSpGPwdyWGb0aNNsTos
 GLOflHSgZVXDkcQha4P38ZbyCwu8zFF9qS8LzCG5sDf71+LajA68SOVdsQwsAWysGI63
 Cah1tKoJJ6iXTuU94am25mUO6KJ9UIWoyyAFhujNk02dJQGD7JouiMjaoy//5exITnkQ
 1SLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PtmqCieWIsT0up/9ewZKR1k/Nlo4HihK+EnvKTG+kr8=;
 b=GAnKSUYn0VvHhJNj0VbwuK3uPpGjz+dakXsN/uFf9l9WqLK5E5piMxjv4MelgyChYO
 7S45HfHeNXo/epgHSyDQI5lmIqNqT1DmYvqEEKdpNFTQ0v6WIdbCVHQzS++PLUzVh8jp
 TQaohstWPvTmDwJx3WAkl35lZDImv78V2jgK4+vaTcCBeK45PQkOZvNJtPn1hTbR9n2H
 hvQEpbr7R3IHivp+HyNNAbgbRwVKF5N69E6PpRH1jbjjNvO+ITxrZIDFZxKmW3Ojcjbg
 PV+9Q7tvobAV3CoMassVdl0jjJGYe3nmCjJDcx2/MLlgmA/R0jiNvcmdKmp6SzLlUY6c
 wkxA==
X-Gm-Message-State: ACrzQf0YNPdUwRN4zopwJeCG5CExDjZUZ4maTJObooctXPnK58nerKO6
 V1YSaDhe3FnxRN6KWJlKA87FKQ==
X-Google-Smtp-Source: AMsMyM5O0RazgBWEyEnRqy3LnL60IuwLpTHRXpUrpSUDd68zi+tQx8xXZn5n+pFyXJlndxYcAnv0TQ==
X-Received: by 2002:a5d:584d:0:b0:230:c250:603e with SMTP id
 i13-20020a5d584d000000b00230c250603emr21171210wrf.143.1666620800118; 
 Mon, 24 Oct 2022 07:13:20 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i17-20020a5d6311000000b0022e035a4e93sm26150983wru.87.2022.10.24.07.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 07:13:19 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 344A21FFB7;
 Mon, 24 Oct 2022 15:13:19 +0100 (BST)
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
 <20221024051851.3074715-3-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 02/14] target/arm: Add ptw_idx to S1Translate
Date: Mon, 24 Oct 2022 15:09:32 +0100
In-reply-to: <20221024051851.3074715-3-richard.henderson@linaro.org>
Message-ID: <87o7u19uo0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> Hoist the computation of the mmu_idx for the ptw up to
> get_phys_addr_with_struct and get_phys_addr_twostage.
> This removes the duplicate check for stage2 disabled
> from the middle of the walk, performing it only once.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 71 ++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 54 insertions(+), 17 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 004375e02b..161b7922e3 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -17,6 +17,7 @@
>=20=20
>  typedef struct S1Translate {
>      ARMMMUIdx in_mmu_idx;
> +    ARMMMUIdx in_ptw_idx;

I could use a comment here to explain the difference between mmu and ptr
indexes here because...

<snip>
> @@ -2527,10 +2536,32 @@ static bool get_phys_addr_with_struct(CPUARMState=
 *env, S1Translate *ptw,
>                                        ARMMMUFaultInfo *fi)
>  {
>      ARMMMUIdx mmu_idx =3D ptw->in_mmu_idx;
> -    ARMMMUIdx s1_mmu_idx =3D stage_1_mmu_idx(mmu_idx);
>      bool is_secure =3D ptw->in_secure;
> +    ARMMMUIdx s1_mmu_idx;
>=20=20
> -    if (mmu_idx !=3D s1_mmu_idx) {
> +    switch (mmu_idx) {
> +    case ARMMMUIdx_Phys_S:
> +    case ARMMMUIdx_Phys_NS:
> +        /* Checking Phys early avoids special casing later vs regime_el.=
 */
> +        return get_phys_addr_disabled(env, address, access_type, mmu_idx,
> +                                      is_secure, result, fi);
> +
> +    case ARMMMUIdx_Stage1_E0:
> +    case ARMMMUIdx_Stage1_E1:
> +    case ARMMMUIdx_Stage1_E1_PAN:
> +        /* First stage lookup uses second stage for ptw. */
> +        ptw->in_ptw_idx =3D is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_S=
tage2;
> +        break;
> +
> +    case ARMMMUIdx_E10_0:
> +        s1_mmu_idx =3D ARMMMUIdx_Stage1_E0;
> +        goto do_twostage;
> +    case ARMMMUIdx_E10_1:
> +        s1_mmu_idx =3D ARMMMUIdx_Stage1_E1;
> +        goto do_twostage;
> +    case ARMMMUIdx_E10_1_PAN:
> +        s1_mmu_idx =3D ARMMMUIdx_Stage1_E1_PAN;
> +    do_twostage:
>          /*
>           * Call ourselves recursively to do the stage 1 and then stage 2
>           * translations if mmu_idx is a two-stage regime, and EL2 presen=
t.
> @@ -2541,6 +2572,12 @@ static bool get_phys_addr_with_struct(CPUARMState =
*env, S1Translate *ptw,
>              return get_phys_addr_twostage(env, ptw, address, access_type,
>                                            result, fi);
>          }
> +        /* fall through */

following this I got confused as to what might be overwritten or
ignored. I assume for v8-A (ARM_FEATURE_EL2) we won't be falling through
anyway?

Anyway I think I understand it now:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


> +
> +    default:
> +        /* Single stage and second stage uses physical for ptw. */
> +        ptw->in_ptw_idx =3D is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phy=
s_NS;
> +        break;
>      }
>=20=20
>      /*


--=20
Alex Benn=C3=A9e

