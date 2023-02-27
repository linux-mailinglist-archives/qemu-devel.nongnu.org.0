Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDF56A405A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:13:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbRV-0005WA-L8; Mon, 27 Feb 2023 06:13:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWbRR-0005V1-Dt
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:13:13 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWbRO-0001Ae-Th
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:13:13 -0500
Received: by mail-wr1-x430.google.com with SMTP id bv17so5786896wrb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 03:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kUdBAwRARd3s1dTlYLEQworfGBWLLm7cP+OrVd1zGSs=;
 b=Qppk+9rw0fMgzHs/j+Mrw2esv9Iz8+gYFQyNcuethe6RE3h4OmFbsBAdBn40m/ASK5
 2BiWwzmmGu/h37/l3843LOSu7Tsa/px3mR4nmzY2/tfc0BUpNc5HeV8vOsRffyuWtZH8
 wNRLNiEyW61QNd2v0NNCnQU0WJfzBopgLxEGOYI6RmlXvQbj31sGdU1aLtSBtsxY2Pvj
 //6dIsGsa5i1N4VWij2DdsiPt+elqn+yD88DMV4trkPGUtY7nXMizPHd4KY+iGZiIpx5
 /o1x7dACyApKEsHfj1rMuebEhLHSf4mvuPlwhNorauSSOdZL1gxY7BHP4LhtkxtGsTBD
 qXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kUdBAwRARd3s1dTlYLEQworfGBWLLm7cP+OrVd1zGSs=;
 b=ztU7WKyFIX8vvuKpLhwZkvN8Dy3Ny5YqXCzupKJA5kdbI1RrHwQmWfXWcTvzjkIOXJ
 a4hz0SgunzTIM4UO9bEYE6XDJCOTqMUWy4Cn0mzAMX1AwoFjweXAP1Vod2z4Mo5e3Ywn
 4snfnk/joIgZ9pEVR8ubleFxkceQlkVLVrpBzMzMaECUSt+1TnYVa89OK9/IruyOH4Ck
 swROoXFGe12GxnDS01U4a8iETyimW0SKqiTU2b/YaNoYr1CErdXn55zzQ34pdveWnYcD
 SghSD/+tDumtWGpWhmcwMYmGNTD9DlAO99Ih29H9LJ3a3V2Npf0PWoLQmjIkV6AItGdH
 do7g==
X-Gm-Message-State: AO0yUKXc263kVU7uomnMjVZZF4WrtYhUj9WNgBFvT/3NAWnc3lxTjnYF
 8xlqPeGCVDvbBQlIg9w1NliC5Q==
X-Google-Smtp-Source: AK7set82kJlwWFXE5wjAmN+Y5bQpiw7GS48YBHIYaVFQZ2Y50xGx4XAl0y5S/MPtKTF4/DpDE6dFBw==
X-Received: by 2002:a5d:5e8c:0:b0:2c3:d707:7339 with SMTP id
 ck12-20020a5d5e8c000000b002c3d7077339mr6470717wrb.6.1677496389227; 
 Mon, 27 Feb 2023 03:13:09 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a5d6a41000000b002c70a68111asm6920836wrw.83.2023.02.27.03.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 03:13:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 901581FFB7;
 Mon, 27 Feb 2023 11:13:08 +0000 (GMT)
References: <20230220091358.17038-1-philmd@linaro.org>
 <20230220091358.17038-9-philmd@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, John Snow
 <jsnow@redhat.com>, qemu-block@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 08/24] hw/ide: Remove unused
 'qapi/qapi-types-run-state.h'
Date: Mon, 27 Feb 2023 11:13:00 +0000
In-reply-to: <20230220091358.17038-9-philmd@linaro.org>
Message-ID: <87r0ubicor.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Missed in commit d7458e7754 ("hw/ide/internal: Remove unused
> DMARestartFunc typedef") which removed the single use of RunState.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Message-Id: <20230215112712.23110-8-philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

