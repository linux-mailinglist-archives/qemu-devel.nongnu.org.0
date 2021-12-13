Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 462AC472E46
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 14:57:32 +0100 (CET)
Received: from localhost ([::1]:51332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwlpb-0001tr-Df
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 08:57:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwlUy-0006kQ-VH
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:36:14 -0500
Received: from [2a00:1450:4864:20::42a] (port=38806
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwlUv-0002IX-G1
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:36:12 -0500
Received: by mail-wr1-x42a.google.com with SMTP id q3so27073563wru.5
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 05:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Utkj1ZjEeBIHC6ipuTDXoC0cp0nTi/FcRqMnAO/W5Hc=;
 b=dgNN46jkaPDQautYR6Ul66CHV1UjOHbZMfK0BC5cUs/3gRWQF+QiK9hCHAPJVpX2rK
 DN4hLQjOHYOLSLxoSXRNOUUlsnZUh+NuuCj+RtwbbzmNvzS81t3XhWyHqYA/xdRFpbOh
 3MnYoGY/sJYDfB/jTvEFJhQLgk89hSyHfSLJHnK20EnkBQ2MLDj6zBVpq9KU9rXVgpwW
 zVsuHLMu1zkun8qYU+60hQ659LCU3KQRV7xxGNJmaDRjR7byujGlXzQ5yM+7E+5qYHZA
 F62vECuLIMACsCIkxPkR2FE1o+01bYbwxRvnysBHZAS/rn0uRshDf76Hu6y/TU6LVPQX
 jTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Utkj1ZjEeBIHC6ipuTDXoC0cp0nTi/FcRqMnAO/W5Hc=;
 b=eLKm/O6O2X5WNbZjxS2jl4bMo5beRpc03l8C/0/F7EZjEuCdB70zTXhOSucN4W1d3m
 EhEB1CRT6SGnmqVRQGpFkgCWDzG+3PwuuE+TSpSuIzvt8dDTrPNegWdHYBpM3kYB3EXQ
 uO0P1WJGgq4e70+5ytHxFZiJ2R3rZOHel0X8LrQhdE3rlvMAggggNw/5c3h/yXiEFM4U
 O3oVK7KITaje7m4rDo3vNV+rCut45I5UWFhd8/zROnDMqffqVKEFWgULkg/WNjpdv71o
 PHAQd3VhiqTNbjplCx0befVp2VlSi+HKiAmBu4ozYE7vr/2IGTyVWx+cx+W90zfAp5+2
 6RAg==
X-Gm-Message-State: AOAM533cu7yP5idZ0LvXURsEV3gjLsWX5jrmTG5hNbtfca1uatwd8Osa
 iVSmZ2AVzttCwWF6NkxVKzBFvA==
X-Google-Smtp-Source: ABdhPJzoCwilZ+NBKlDbOueLzsbgnlaVv/Kz6ie2n5F9VcAglsfg0A+q2TmSHfiMAlUDfAsC+1oZGQ==
X-Received: by 2002:a5d:464c:: with SMTP id j12mr30972714wrs.150.1639402568222; 
 Mon, 13 Dec 2021 05:36:08 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f13sm7805967wmq.29.2021.12.13.05.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 05:36:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9FD441FF96;
 Mon, 13 Dec 2021 13:36:06 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-16-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 15/26] hw/intc/arm_gicv3_its: Rename max_l2_entries to
 num_l2_entries
Date: Mon, 13 Dec 2021 13:36:00 +0000
In-reply-to: <20211211191135.1764649-16-peter.maydell@linaro.org>
Message-ID: <87czm0lj95.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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

> In several places we have a local variable max_l2_entries which is
> the number of entries which will fit in a level 2 table.  The
> calculations done on this value are correct; rename it to
> num_l2_entries to fit the convention we're using in this code.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

