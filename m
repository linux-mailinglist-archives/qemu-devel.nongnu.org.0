Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D1A487788
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 13:19:47 +0100 (CET)
Received: from localhost ([::1]:49982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5oDi-0000y9-3K
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 07:19:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n5nyj-0007h1-NR
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 07:04:18 -0500
Received: from [2a00:1450:4864:20::436] (port=46843
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n5nyg-0005gD-Qd
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 07:04:17 -0500
Received: by mail-wr1-x436.google.com with SMTP id i22so10617962wrb.13
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 04:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Kp+rQ8JeDhlE8IYarTkFyiZBP10VXhJRbnfrhVycLGs=;
 b=XvuQJ27Buh04jaV/WT6r5fXe78XlyKFbR0B5ubuQR9v9PoGu1Bp3642LYpqysVQvII
 m1hR5vSDjlctXyk3hLutJiFlRAckEDmK9j9zuxkBqR9odvgQSwnHZJktzhVptB1RSdI5
 0lxRsBhAO31vqF/vUASWWdc9Z0RMmBftu7xgYkH0L+9mIUCYWmS+qLoVDnGSTG7EA4Ls
 +CHttOx6+3DUxVqVTQM/y/iXNB1HgvyF0tlPCH422m8F1DHS0wxoMvUsgirOtBGUZXKj
 o0UCT0+0YbfyXHEafKJe5pziNAMl90L94CIs8LklS7o4GMxQxU3XA6Riij/+D5W2uT0M
 YYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Kp+rQ8JeDhlE8IYarTkFyiZBP10VXhJRbnfrhVycLGs=;
 b=y+ZImr/LYQ5Jp7z94tymK91XE/s9OJiHuoImienywJktlBxzJwZtxxsEzms+d7SGMG
 rEv0NspbbTh/6t5OALFbBLH1G91OWMH2y1Vu4ZLmtCobhweqgDvYoFcX6sgHn13GIvIS
 VIFmlkw3QIfMbftdkwkDXD6ndjB1WLVwux09Y3Pjl28u7kzTvap8hwsp1vi2VfgG2fLA
 hcr5wbnfL2Cm3025nzzyK3BA3v//Kh/DcEbnPdDJrFQeg7kUZzN6zL0aSuyiwVba3lsT
 6JPpzDXnMBYgR3bgOs2w0YIvCVQQ3kuuwhooTYiQzT+rDttOvRIhZrwWCnhDPaHEcAiL
 BuBw==
X-Gm-Message-State: AOAM532WVrzz0zusBn7dsKBQ0kVj8boaQki0WLywAzILH6Xi6h4wPmi2
 8tuR4za/r3/gBXUE1kvPb1QHUVH55EU8Dg==
X-Google-Smtp-Source: ABdhPJySC1tPskuALWFc8D0gEz+ZOsOam6SuasdW5AQux7tHzMUJK0glrKT5r2GgYCuT6iRJ5jR7hg==
X-Received: by 2002:a05:6000:118a:: with SMTP id
 g10mr52388558wrx.533.1641557049861; 
 Fri, 07 Jan 2022 04:04:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r1sm5224828wrz.30.2022.01.07.04.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 04:04:09 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 44E111FFB7;
 Fri,  7 Jan 2022 12:04:08 +0000 (GMT)
References: <20220104021543.396571-1-richard.henderson@linaro.org>
 <20220104021543.396571-8-richard.henderson@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 7/7] tests/tcg/multiarch: Add sigbus.c
Date: Fri, 07 Jan 2022 12:04:03 +0000
In-reply-to: <20220104021543.396571-8-richard.henderson@linaro.org>
Message-ID: <87pmp3hhvr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: git@xen0n.name, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> A mostly generic test for unaligned access raising SIGBUS.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

