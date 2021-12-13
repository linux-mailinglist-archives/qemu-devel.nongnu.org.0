Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EFB472BD4
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 12:58:50 +0100 (CET)
Received: from localhost ([::1]:39910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwjyj-0001uc-P9
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 06:58:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwjvW-0008Sf-0P
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:55:30 -0500
Received: from [2a00:1450:4864:20::32b] (port=45841
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwjvT-0005Tk-CH
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:55:28 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so11409866wme.4
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 03:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=z7m9fUo4JGKWvY2P0ToxH+oeUO923OVrbTZ4TV5IveY=;
 b=DmIe0cODL+e/nAkfTjGJXKsaVDKCe/QlnzpAnTRpDvtsfPlC8Bt2EdH5VeKXzIHW/C
 1GVrTTjovYkhq9bTY8SrI2YT6DP4zYUbifXJA5GFXCSQ8LQnjJuLtQAu1E7WhUGDfy5M
 O6fdYDsuqZkan9ONwfcunT3rDSC6XvT2o8DWp0E5f4rUwzsXS7Q8yZJSyUE72vsX52oe
 RV2x5yQ4LneitZO6j2wW1zLlvjjsgvg4Hq6TcQF3Dz5ZqR6tl5MMx4VVfWiGm8jXdxhp
 Mgvt860M1wNEnp9EsiS0RmImO5TUpIZdAI7qjkqWekMGI5RMK8EScqLJ4zlYS0+S8u4z
 jYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=z7m9fUo4JGKWvY2P0ToxH+oeUO923OVrbTZ4TV5IveY=;
 b=6QNoqukWy97ldmtGQuEC1TTeOR59dk3C/3ca/QC8JNTjOQ7mT0TbAuZKz/woe9dA14
 6bWl5e1Iwq/e36TeTO3aJ5JD1J+qq+lkZvrAteFDX4b10Y++Qh7eKXx8TwADBakNM6kY
 MTR45/3VcO0R6f0f59LJdyqqfbga6LAYLrX+zBkvpW3OuaKPFOSUdUkUTIlx+olM0Sfh
 nSQEetBlpD9AHJTbRUDPOI8fGU8V3QBUrycNx5v67C0NMe7PAch11uKu1ssdyD1h7ud+
 Us8yWQD7Yh/pNiNiXlf3oOLwW2Aq6ars7Eil7qtdRQk7aRcSAUuRLV06mN1MtVNOju5s
 mFbg==
X-Gm-Message-State: AOAM530iDjwXJoDIuUG7c9AmKxm1JsRRw3YTNWjeJgRuiY0Vv/X6myNT
 CVHfrNysw7ZGhhNZHpwuJHGI2Q==
X-Google-Smtp-Source: ABdhPJze+ILntDnU+7eSmKsTu0zTn+xyqBSoosKNyuJ4nfa1sqU9cdg7tXhheSvNZppAMoAa1WZYig==
X-Received: by 2002:a1c:a9c6:: with SMTP id s189mr36859315wme.38.1639396525929; 
 Mon, 13 Dec 2021 03:55:25 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i17sm7811425wmq.48.2021.12.13.03.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 03:55:25 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CA5C41FF96;
 Mon, 13 Dec 2021 11:55:24 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-4-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 03/26] hw/intc/arm_gicv3_its: Remove redundant
 ITS_CTLR_ENABLED define
Date: Mon, 13 Dec 2021 11:55:19 +0000
In-reply-to: <20211211191135.1764649-4-peter.maydell@linaro.org>
Message-ID: <8735mwn2hf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> We currently define a bitmask for the GITS_CTLR ENABLED bit in
> two ways: as ITS_CTLR_ENABLED, and via the FIELD() macro as
> R_GITS_CTLR_ENABLED_MASK. Consistently use the FIELD macro version
> everywhere and remove the redundant ITS_CTLR_ENABLED define.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

