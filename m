Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B38268C90
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 15:52:20 +0200 (CEST)
Received: from localhost ([::1]:56604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHou3-0000RB-4d
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 09:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kHol5-0003KE-Ij
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 09:43:03 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:33486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kHol2-00038Q-Qa
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 09:43:03 -0400
Received: by mail-wr1-x444.google.com with SMTP id m6so18833140wrn.0
 for <qemu-devel@nongnu.org>; Mon, 14 Sep 2020 06:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=2zCsTc81DO3rGUtwpnEChOMnlHXAtSXxu3K16ol0bqg=;
 b=AXSL9Ti4n0Znn7JeQu2C3lcdJIYcTPNrqTKa4Vh4la0w4sjjGiGC+3A1NTr7E4oLYN
 rcvNFoGIZpFT3UxQ+LWmiqERLi56uO5rU60XzEZ6PkP0o9rLjhBkXDHpoW7BfaPsAMaH
 L85CdiAVnZFCVxSY0zPgEYvkmz5CqExKFFZ2NvyGybtVh1vXx1ZUKjIGzLh9JDAJ1luI
 p65n1604TCJKrwoT3pb7fTGwio4I5PghBtV9IOfSJ/Hq6APzD53XEuArPVlOg8LskfyA
 hVjdBQHlwq4hjFYUUIWNE8qoSr9g/3tBgOcsFQ0FBAGYYOue6ad0+sJvpBLbk2OcFGMT
 a7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=2zCsTc81DO3rGUtwpnEChOMnlHXAtSXxu3K16ol0bqg=;
 b=DzvBHyZPQe+rKIG06E6p17dzFLMWhEYuPKQIzpc47dDcpoMzgB3g76ZCahg0mvVn0L
 ZQ9IVrJ70u9Zq4xoxjTRoJu65sYFzi8AiKskx31+0AUjhFoLjO9rD7HQV61ek+4Nj/o1
 zYynxWKMTSsEKUlZyXkMDubeEog53ZTjC10GEFYqMcfqtHFexyTx2zBLWFYx/YC2PCHQ
 k8LYY8jPng2T3wOJX6r8GavPNMX1rzBifqj3NDll33Mf4XV8U7oohQhXK4+5jkZV9wKo
 3jouZiDEJTprEw0ibgTCCHJFq4O0QSUbm38Per0oju1wqnT6OiD9OcmjbJd6u6Ns2UzT
 1HcQ==
X-Gm-Message-State: AOAM533/FJHvS3ISz/gBa+yDjQaCX9BAZA83/ayxgFQvGnYbvhpdkZXY
 mIFEGvsiAhwEVY/yEI8dzQ1yRA==
X-Google-Smtp-Source: ABdhPJxveK32pJn1OCOEoMTu/gHj2XZlYAQ/AM7kpy3fXmj6oJYTM+oGpBGqDAUNoLi/hDNZfO6rsQ==
X-Received: by 2002:adf:e843:: with SMTP id d3mr15717194wrn.290.1600090977449; 
 Mon, 14 Sep 2020 06:42:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q20sm18748727wmj.5.2020.09.14.06.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 06:42:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BEFC51FF7E;
 Mon, 14 Sep 2020 14:42:55 +0100 (BST)
References: <20200901162046.32670-1-peter.maydell@linaro.org>
 <20200901162046.32670-3-peter.maydell@linaro.org>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 2/2] arm.risu: Fix typo in VCVT_B_TT pattern name
In-reply-to: <20200901162046.32670-3-peter.maydell@linaro.org>
Date: Mon, 14 Sep 2020 14:42:55 +0100
Message-ID: <878sdc1nkw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> Fix typo in VCVT_B_TT pattern name.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

