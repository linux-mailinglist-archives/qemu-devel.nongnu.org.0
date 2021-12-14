Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0F147484C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 17:38:14 +0100 (CET)
Received: from localhost ([::1]:49908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxAoe-0006hQ-QC
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 11:38:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxAnY-0005zA-Lb
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 11:37:04 -0500
Received: from [2607:f8b0:4864:20::92c] (port=44713
 helo=mail-ua1-x92c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxAnX-0006JO-0a
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 11:37:04 -0500
Received: by mail-ua1-x92c.google.com with SMTP id p2so35795131uad.11
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 08:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=l90rBXtIc2hkeiDA+Fr7RtLqoSDsed8JJzQ7tQw7Lio=;
 b=nmwG2UDYUbhp3LqICuJFjDYoA/w6PfM5fPgoFW5TY3Gdg0rxq796li6Bg50Mv4hBEx
 wOKA6HvxKCQOxDaaCVifzX/8CElbexAgzz0myjGs75/hxV9wQyZqA83FCvmYdVoFhy12
 cix/WKe2aX0cOJ/me6Bbp5ng4/xNpDEauwneX4412N88EMcRpAnQI4tHqO4Ok1VsZ0db
 j5cYjmNeI+j5OM4Ie6eLpVUYxPbyEpBKCUthpJ31QupzgumqFPFSfCIAcO6TRaIUCaPI
 Gx1tzjsxUTpmxyrqutWtmp0b05erDcEoRnPMfJSsgS+rShi69fzCV2jYNez5KQUMGmpJ
 5cgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=l90rBXtIc2hkeiDA+Fr7RtLqoSDsed8JJzQ7tQw7Lio=;
 b=0Kz47ABVw4McEPWFcGmWibpFhWTjBKXLE/KIi6DrplB4XLSSpxDv/QuCWvVOG5+koL
 6+b3XHKv8sIE1NomF/D/uqYA+qK67u6NxfaHi64Ufb//b9cEVNxURUdmCgaWRxrMHL9t
 BokuZgbb/INKAn0jQ0QNkYTv0pzimT4Egav2CSb9ZhmwFaUzj2CCr8cP080QWv3FUGFu
 zKOFLcq/i//oSq0vWp2tWDLpt4W9yEJyK64VgxseSImoL62w1OAL9USgCEqr21vGqwV/
 HFmy0McADilgreFauPXVVV+fEHT+lvuSASVYvyU1xtf8H5it6Xbf0UJ+IwUqIITHoJ+P
 9D6g==
X-Gm-Message-State: AOAM531qz/foqKlfoF7kwWqa8Jk5s8Sq7ul8rYXJ0X/2crNhOBOcQumi
 kcKvEDKnHIJhiyhcib/GoM2cog==
X-Google-Smtp-Source: ABdhPJyA4ZPmVHaK5lqDc1TFq7OxXY8ry6zKCKaUK8K/CGY/TBKF+FJdKR1hz6SIpMfUc/iRlaGEGg==
X-Received: by 2002:a67:d58f:: with SMTP id m15mr5976792vsj.34.1639499821805; 
 Tue, 14 Dec 2021 08:37:01 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c14sm55224vkm.10.2021.12.14.08.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 08:37:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 232D11FF96;
 Tue, 14 Dec 2021 16:36:59 +0000 (GMT)
References: <20211208231154.392029-1-richard.henderson@linaro.org>
 <20211208231154.392029-7-richard.henderson@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 6/6] target/arm: Implement FEAT_LPA2
Date: Tue, 14 Dec 2021 14:57:50 +0000
In-reply-to: <20211208231154.392029-7-richard.henderson@linaro.org>
Message-ID: <87y24ngn2s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h       | 12 +++++++
>  target/arm/internals.h |  2 ++
>  target/arm/cpu64.c     |  2 ++
>  target/arm/helper.c    | 80 +++++++++++++++++++++++++++++++++++-------
>  4 files changed, 83 insertions(+), 13 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 3149000004..379585352b 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -4283,6 +4283,18 @@ static inline bool isar_feature_aa64_i8mm(const AR=
MISARegisters *id)
>      return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, I8MM) !=3D 0;
>  }
>=20=20
> +static inline bool isar_feature_aa64_tgran4_lpa2(const ARMISARegisters *=
id)
> +{
> +    return sextract64(id->id_aa64mmfr0,
> +                      R_ID_AA64MMFR0_TGRAN4_SHIFT,
> +                      R_ID_AA64MMFR0_TGRAN4_LENGTH) >=3D 1;

Is this correct - it shows:

  0b1111 4KB granule not supported.

which I don't think implies FEAT_LPA2 because 1 indicates 4kb granule
supports 52 bit addressing. The other values are also reserved. Maybe it
would be safer just of =3D=3D 1?

(a little more reading later)

  The ID_AA64MMFR0_EL1.TGran4_2, ID_AA64MMFR0_EL1.TGran16_2 and
  ID_AA64MMFR0_EL1.TGran64_2 fields that identify the memory translation st=
age 2 granule size, do not follow
  the standard ID scheme. Software must treat these fields as follows:
  =E2=80=A2 The value 0x0 indicates that support is identified by another f=
ield.
  =E2=80=A2 If the field value is not 0x0, the value indicates the level of=
 support provided.
  This means that software should use a test of the form:
  if (field !=3D0 and field > value) {
  // do something that relies on the value of the feature
  }

That's just confusing. It implies that you could see any of the TGran
fields set to zero but still support LPA2 if the other fields are set. I
think this at least warrants mentioning in an accompanying comments for
the function.=20

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

