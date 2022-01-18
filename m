Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2559492C94
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 18:41:34 +0100 (CET)
Received: from localhost ([::1]:55420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9sU8-0007YW-Ez
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 12:41:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n9s4e-0008SC-5S
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 12:15:21 -0500
Received: from [2a00:1450:4864:20::335] (port=38554
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n9s4b-00040J-8T
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 12:15:10 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 ay14-20020a05600c1e0e00b0034d7bef1b5dso834903wmb.3
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 09:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=7plVrRY9GuPNRTiIynN1Q6nUDZRwQr+Qz5AWXh4h23E=;
 b=REl11ySAlYsBtD92dE9Z9EFcFpfVZaVk4R6pVrQDMyIcZRU0dYkf030xQcKnmcPwGg
 VsmXhjfg/Hf2lDEHNHW17prRVwC9LQhjtMuSVbVB7DZ8D0mV8RY0f5Z6RLKQG+LQI/nw
 AlpEX2ueJgh57ZtJ02vkDfyNTpYaeNIusN8oCZKE+5vE9pQF7VxoWqanT5ZvbISO9wmj
 32727dLlaDQzOtO2BKH9QpvDWgovDkauMAy0UaDHfjOza1BHEYGsiMl+V9QgBTODgSvO
 yYaQ4VHmfv1CRgWRavs5pu8wxkArjH/78aznfjeSeCTdA6g5O9N5Ds/MkZ7kvdd8k6xm
 1+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=7plVrRY9GuPNRTiIynN1Q6nUDZRwQr+Qz5AWXh4h23E=;
 b=tC8HzpHcU+bduOIYImtdqVHaDZxlu4LgEZ9DikRCdAkYN8kFMe4jEkYTPpsDfWyAz/
 sSBnXeg4cpVdsood6xzQGGhn68tVnj0pMZuueZF8hkAMTkHXkbUHmHnIl3r5Wibj8GdR
 TaSUj3VG889knt1srUwGF3ZJ6ICb8lKGF78zpJDl9Yhrgv2n1IVUGx54HqIw99dorHUv
 3hQWTlK+zoe05PbYcxptaOp3k4bvSizhpVikLRPXEulHKJyEOYvZv4b8mKyZ8FvbYCJ7
 FPdd/rKQtWaBKgCHxpR9M91y9A8t1MySJ3XCHWO71uPAizi5HmjmrLKcvPHRbUhu5BW9
 47vw==
X-Gm-Message-State: AOAM530rVzkBtLUtP6luR0eYVQVGM63h/6zwiblEV6bGJ10vOS+wyfAT
 b1AIl7Q54zgM3T7dyTln4mxT5g==
X-Google-Smtp-Source: ABdhPJzilMZL3EfjaIh3R1KMFixnDyIhGz4A7/izb73S2mHjSLm2RYACm20K5iYXNwJzkBNCUiS0zQ==
X-Received: by 2002:a7b:c4c8:: with SMTP id g8mr4373896wmk.158.1642526105028; 
 Tue, 18 Jan 2022 09:15:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c3sm20572877wrd.54.2022.01.18.09.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 09:15:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 60F581FFB7;
 Tue, 18 Jan 2022 17:15:03 +0000 (GMT)
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
 <20220111171048.3545974-2-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 01/13] hw/intc/arm_gicv3_its: Fix event ID bounds checks
Date: Tue, 18 Jan 2022 17:13:58 +0000
In-reply-to: <20220111171048.3545974-2-peter.maydell@linaro.org>
Message-ID: <877dax9d9k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> In process_its_cmd() and process_mapti() we must check the
> event ID against a limit defined by the size field in the DTE,
> which specifies the number of ID bits minus one. Convert
> this code to our num_foo convention:
>  * change the variable names
>  * use uint64_t and 1ULL when calculating the number
>    of valid event IDs, because DTE.SIZE is 5 bits and
>    so num_eventids may be up to 2^32
>  * fix the off-by-one error in the comparison
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index fa3cdb57554..6d11fa02040 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -225,7 +225,7 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_=
t value, uint32_t offset,
>      MemTxResult res =3D MEMTX_OK;
>      bool dte_valid;
>      uint64_t dte =3D 0;
> -    uint32_t max_eventid;
> +    uint64_t num_eventids;
>      uint16_t icid =3D 0;
>      uint32_t pIntid =3D 0;
>      bool ite_valid =3D false;
> @@ -258,7 +258,7 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_=
t value, uint32_t offset,
>      dte_valid =3D FIELD_EX64(dte, DTE, VALID);
>=20=20
>      if (dte_valid) {
> -        max_eventid =3D 1UL << (FIELD_EX64(dte, DTE, SIZE) + 1);
> +        num_eventids =3D 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
>=20=20
>          ite_valid =3D get_ite(s, eventid, dte, &icid, &pIntid, &res);
>=20=20
> @@ -299,10 +299,11 @@ static bool process_its_cmd(GICv3ITSState *s, uint6=
4_t value, uint32_t offset,
>                        dte_valid ? "valid" : "invalid",
>                        ite_valid ? "valid" : "invalid",
>                        cte_valid ? "valid" : "invalid");
> -    } else if (eventid > max_eventid) {
> +    } else if (eventid >=3D num_eventids) {
>          qemu_log_mask(LOG_GUEST_ERROR,
> -                      "%s: invalid command attributes: eventid %d > %d\n=
",
> -                      __func__, eventid, max_eventid);
> +                      "%s: invalid command attributes: eventid %d >=3D %"
> +                      PRId64 "\n",
> +                      __func__, eventid, num_eventids);
>      } else {
>          /*
>           * Current implementation only supports rdbase =3D=3D procnum
> @@ -336,7 +337,8 @@ static bool process_mapti(GICv3ITSState *s, uint64_t =
value, uint32_t offset,
>      AddressSpace *as =3D &s->gicv3->dma_as;
>      uint32_t devid, eventid;
>      uint32_t pIntid =3D 0;
> -    uint32_t max_eventid, max_Intid;
> +    uint64_t num_eventids;
> +    uint32_t max_Intid;
>      bool dte_valid;
>      MemTxResult res =3D MEMTX_OK;
>      uint16_t icid =3D 0;
> @@ -376,11 +378,11 @@ static bool process_mapti(GICv3ITSState *s, uint64_=
t value, uint32_t offset,
>          return result;
>      }
>      dte_valid =3D FIELD_EX64(dte, DTE, VALID);
> -    max_eventid =3D 1UL << (FIELD_EX64(dte, DTE, SIZE) + 1);
> +    num_eventids =3D 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
>      max_Intid =3D (1ULL << (GICD_TYPER_IDBITS + 1)) - 1;
>=20=20
>      if ((devid >=3D s->dt.num_ids) || (icid >=3D s->ct.num_ids)
> -            || !dte_valid || (eventid > max_eventid) ||
> +            || !dte_valid || (eventid >=3D num_eventids) ||
>              (((pIntid < GICV3_LPI_INTID_START) || (pIntid > max_Intid)) =
&&
>               (pIntid !=3D INTID_SPURIOUS))) {

It seems process_mapti has the similar "catch all the errors" if leg
that I split apart in process_its_command to make it easier to see what
failed.

However:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

