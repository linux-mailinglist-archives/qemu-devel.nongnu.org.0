Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4E46529B8
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 00:17:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7lkN-0002TE-6s; Tue, 20 Dec 2022 18:10:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7lkD-0002Q0-5U
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 18:10:00 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7lkB-0008Rn-KC
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 18:09:56 -0500
Received: by mail-wr1-x434.google.com with SMTP id bx10so13389533wrb.0
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 15:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7pC5RbsARiaQjwgOioYqnltx/xTr7HE0bq0RgOZBmLs=;
 b=uuIEQRrRW8FbrlUI7h5cAtqMeEslsugHlOT7aqYsbgAXTSb8+81ESPOtU/qPNwMUUd
 v2Qkxp5d8qvnIBXe64Oxh1pLkQlwlfg+O+3SuuxdVmjQfT7zWln+tfLytd2mP97evp7h
 XO7VzZwH4Jt7wBxWs70Mqlm83b518CMqNt2ojXdO4EQkqA0WEhXhgiwyNpdRhK8OFiLH
 6/5rS01WCGaxv53KHXUkzO8USiUTPAvdbB103ObqHv7OfxWHPPWUdhylo7NWJ6MnjF5C
 c3Z1bdGUXx6eCXP9dvOJnxDdoSXfQEQ2OBxEnZ7xMJMkY88kmdLnwoUX2WwjGG5k93js
 D0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7pC5RbsARiaQjwgOioYqnltx/xTr7HE0bq0RgOZBmLs=;
 b=uKlTZC7kH6Nt3bqXI6tkK7zR2DUdTGxEv+REwWNz9k8lJaemtXoHOtjjqfJulUUzJW
 dlUB0twNwrG+8+A6P+jKMKnKlN3RyBPsGa2xstucCvBF8LuAXGiw7RsQLzgLH5n4YQav
 hAZBZpW/XttTPAGBPSuwjSFK23oznbxXy2RDMYayMezbTaAsXpnKc0keuQTM2Sr8Ssgu
 Xo/DVzc5SOC7CAzleM/Defvv4fgA2gfnqz7Z0+bTxH1bpwbNU7T8BHG5rLBTt2LmYD6w
 mHkhGeGN8/JxoQAp6wtMpd4lDUvniRWinRnVruYbsCnIUNujYCy76SXURNRiE5R24mIU
 1uRw==
X-Gm-Message-State: AFqh2krqv0T2hhUphVnT4nz0l0bj8uJ5O1afUcw9P6UrfimzBJnnG6iU
 +HV+ax4OstgI0KeTU1Q3sh5ikw==
X-Google-Smtp-Source: AMrXdXtuq3WyKxstI4nZIpponEGLukvV/GlonvWeU4ZkPl9ucMrbRnL9zF2XVxumtfXHSypMUCqskA==
X-Received: by 2002:a5d:5a1e:0:b0:255:971b:a40e with SMTP id
 bq30-20020a5d5a1e000000b00255971ba40emr18244576wrb.65.1671577793431; 
 Tue, 20 Dec 2022 15:09:53 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 ay8-20020a5d6f08000000b00241b5af8697sm13754405wrb.85.2022.12.20.15.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 15:09:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 83E351FFB7;
 Tue, 20 Dec 2022 23:09:52 +0000 (GMT)
References: <20221217184823.3606676-1-richard.henderson@linaro.org>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linaro.org, Warner Losh <imp@bsdimp.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] accel/tcg: Drop PAGE_RESERVED for CONFIG_BSD
Date: Tue, 20 Dec 2022 23:09:41 +0000
In-reply-to: <20221217184823.3606676-1-richard.henderson@linaro.org>
Message-ID: <87wn6lhdtr.fsf@linaro.org>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> Make bsd-user match linux-user in not marking host pages
> as reserved.  This isn't especially effective anyway, as
> it doesn't take into account any heap memory that qemu
> may allocate after startup.
>
> Cc: Warner Losh <imp@bsdimp.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

