Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D02B267EC24
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 18:11:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLSEc-0007zy-KN; Fri, 27 Jan 2023 12:09:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pLSEa-0007zV-IJ
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:09:52 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pLSEZ-0002YM-0u
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:09:52 -0500
Received: by mail-wr1-x432.google.com with SMTP id d14so5552573wrr.9
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 09:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S4iXjVhQjC/3Nv7obSQnGkFxQi6CuszxP1e6E3fwHgg=;
 b=ViRiAtLfZoY/kiF7wMkEpAykQgGc/hoNcznTniTSaHwhRKBt7aduiBHFOUd/7aeacR
 Y+Inzv+SL0JdHneisvu6B8PgnFsCEhs0JdaCGmtDl+TpDUWlasDnfvOr+3xBvqxP7jN6
 qiqLiNg2GoDmzxeQcowTb9BeIfhrUFUpT9YMROHoeDsthV+NbQQkC2BLv6r297X0DWxJ
 +kIRoV++nZJpxZa6Tb475HBCtgVtn0t7Gb9xAQHgNKy+q5Xp8ndo4JewvPT7jnGrPsaX
 Zgvxvz0luTKo4+WoBi27wPryJVD3/sCLXbLBLm/SoOmX7D0u5nBcg3vK2j3IE3FxPHv9
 jVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=S4iXjVhQjC/3Nv7obSQnGkFxQi6CuszxP1e6E3fwHgg=;
 b=at2/45gDavSnoT1u2ozjeHgnJxnjrYXtjanoSiTXfFwwm7I0ldyPP+p6+CVL8C/1hg
 8tgz3eCZCgHrdd7UzjN4LjNGzaNVDlnCCFXoaOMjmkMsTG4Legym7ib6c/EqgjHawIGZ
 R0/S1u3786FLpeuRe33YfOLM3ua15Bvi02aPv80G7x59i++c0Ol05YC/5GqYDD34vcrj
 oIfRtkB9C1IEnqSz0OgqkP/fIKXDS2sK5PYUrsujHFBwQFRHlqrMEEdralL3FgG3ZzKY
 m6a1DCBA+NE5CQhjtx1AroaqexRNIY4SohHzeiD4kiNU5LRCPSFEN36Zv/Bu2ivLx7nD
 cFvg==
X-Gm-Message-State: AFqh2kqLZyPCnQAr2pbu5iaC9NiZoi2l2Ewdg7xlJaxi3NAtjkBNaLdK
 MTevVmBnj2+1yC2cNtdRJ5yz1Q==
X-Google-Smtp-Source: AMrXdXskRBzuABxCSHBTgF+KNWJKC445RDCPAFnm3AoTMBESUPRaJBAkTL6EWNneBXC5822WlKkjHg==
X-Received: by 2002:adf:b604:0:b0:2bd:f35f:1b5e with SMTP id
 f4-20020adfb604000000b002bdf35f1b5emr34031438wre.4.1674839389310; 
 Fri, 27 Jan 2023 09:09:49 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a5d6781000000b002b9b9445149sm5061004wru.54.2023.01.27.09.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:09:48 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 740871FFB7;
 Fri, 27 Jan 2023 17:09:48 +0000 (GMT)
References: <20230126043824.54819-1-richard.henderson@linaro.org>
 <20230126043824.54819-14-richard.henderson@linaro.org>
User-agent: mu4e 1.9.16; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: Re: [PATCH v5 13/36] tcg: Add temp allocation for TCGv_i128
Date: Fri, 27 Jan 2023 17:08:36 +0000
In-reply-to: <20230126043824.54819-14-richard.henderson@linaro.org>
Message-ID: <87a623oqeb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> This enables allocation of i128.  The type is not yet
> usable, as we have not yet added data movement ops.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg.h | 32 +++++++++++++++++++++++++
>  tcg/tcg.c         | 60 +++++++++++++++++++++++++++++++++--------------
>  2 files changed, 74 insertions(+), 18 deletions(-)
>
> diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
> index 8b7e61e7a5..7a8e4bbdd7 100644
> --- a/include/tcg/tcg.h
> +++ b/include/tcg/tcg.h
> @@ -685,6 +685,11 @@ static inline TCGTemp *tcgv_i64_temp(TCGv_i64 v)
>      return tcgv_i32_temp((TCGv_i32)v);
>  }
>=20=20
> +static inline TCGTemp *tcgv_i128_temp(TCGv_i128 v)
> +{
> +    return tcgv_i32_temp((TCGv_i32)v);
> +}
> +

Why do we have all these different allocate functions if TCGTemp's are a
shared abstract type anyway?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

