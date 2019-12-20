Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 324B212819A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 18:45:57 +0100 (CET)
Received: from localhost ([::1]:59898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiMLc-0008Is-49
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 12:45:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38975)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iiMJB-0005qg-As
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 12:43:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iiMJA-0004jl-Dx
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 12:43:25 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45873)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iiMJA-0004hi-6t
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 12:43:24 -0500
Received: by mail-wr1-x444.google.com with SMTP id j42so10174026wrj.12
 for <qemu-devel@nongnu.org>; Fri, 20 Dec 2019 09:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=FkZSsEE3pDnscBbGTgWt8/pZEmjr/vShdA5uMVflfjw=;
 b=MP2pKRry2BayPMViyMoGmiNrGqHkUDHQD/VDA+qi4tw+mhMgJO4cSK3vN5dA+inydT
 fetBzlG5aaAvgpnX8OJKTFFGhtNM/Mnpk8dqen5l+txyUkKsXyMima4fQr16kkxW3pL/
 aIO7knWcjASdP3F+4eL0pczdW1pRMocwbkAnSF4heWOZdh+UkHpv/Pt28vdG3K3Cmqo5
 5aL7PWkSM2afiRE4+0Gt/3o4rhVwSkvChNDO8ku1OLYwrD2bGO9q7gUmxvEWweIgW3QV
 FkBGTO+gh/U3lSisOiCFhtHE9W161bmUwlKqXmkSKc0AjjwckSHGDBOlZRd/pRijkZyo
 sGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=FkZSsEE3pDnscBbGTgWt8/pZEmjr/vShdA5uMVflfjw=;
 b=DEI2co5yyQ66ZNoNjsWfDLUXAI9Nd193444zJSAfZTfrBAknAB8JBZqv09Mu2lAgmn
 5zr1oZzdtGcW46mvpeNi/wREcAbuF7yxLLm7v9qgoG/XquTsw3Lipe3wtfsysWSH5B/I
 dvvM/hz9GzwmNnVhvpivhe1xqUb1L6OLlTXp8I7498fDgXLqpEfRjAStIsoxWQciKSsj
 VahszKHRhWAcgUQTrTyxEsmfVr62xWWzPC9c3gmHjjBTeIp/C2rKd+Xuhy4hh0pErz9t
 vb2bhDTDm4TTt+8PzhxlfAc79wRLUrfL0TfAnX6AWKdvaqGuU20vs95JKbchxUh5x3EA
 TMbg==
X-Gm-Message-State: APjAAAXkjh59svzhRKZ8R6YiFnkrg7wIvUOUIYrd19qsN+IlW8qKXKm1
 P03fblu07fZv7njpK2dZuGUj5x7e3+c=
X-Google-Smtp-Source: APXvYqzMruoFvIbjpewp1ifh/FSXG+YQimepA23ZqHQkPWxNs1ET+qeDDK/upL3kF1gDY9yzYUi3sQ==
X-Received: by 2002:a5d:5487:: with SMTP id h7mr16038936wrv.18.1576863803120; 
 Fri, 20 Dec 2019 09:43:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w17sm10665323wrt.89.2019.12.20.09.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 09:43:21 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 285FB1FF87;
 Fri, 20 Dec 2019 17:43:21 +0000 (GMT)
References: <20191216221158.29572-1-richard.henderson@linaro.org>
 <20191216221158.29572-11-richard.henderson@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 10/28] target/arm: Include tcg.h in sve_helper.c
In-reply-to: <20191216221158.29572-11-richard.henderson@linaro.org>
Date: Fri, 20 Dec 2019 17:43:21 +0000
Message-ID: <87immadhae.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Code movement in an upcoming patch will show that this file
> was implicitly depending on tcg.h being included indirectly.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/sve_helper.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index fc0c1755d2..83cc7f5bb5 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -25,6 +25,7 @@
>  #include "exec/helper-proto.h"
>  #include "tcg/tcg-gvec-desc.h"
>  #include "fpu/softfloat.h"
> +#include "tcg.h"
>=20=20
>=20=20
>  /* Note that vector data is stored in host-endian 64-bit chunks,


--=20
Alex Benn=C3=A9e

