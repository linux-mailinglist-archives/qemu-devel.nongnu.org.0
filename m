Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8A8474879
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 17:48:13 +0100 (CET)
Received: from localhost ([::1]:60022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxAyK-0005Zh-1V
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 11:48:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxAv9-0003Jk-3N
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 11:44:55 -0500
Received: from [2a00:1450:4864:20::42b] (port=33771
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxAv7-0007TR-Gk
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 11:44:54 -0500
Received: by mail-wr1-x42b.google.com with SMTP id j9so1296208wrc.0
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 08:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=E0DmjyVcpqHYxloR9E3AJYr88ZVGNTCcY5HzUp0kA7U=;
 b=oS7Z82vTqOofUkKhY/CDjeMqUevALRuzJeR6vlhlertI6zJwXLA9faiyW6WcFOzd/O
 j4IsoeI+0577hY5q0wVR6db8yGwOi0hi1sx9HweJbDGnyWq4Y2LzubUjBLLkeZvt5lYG
 h2Dl/pAeYIhB2xI4htHp6fgO4GyJASSOhpWhcBhRWTj5yoGNlSvkF5BwXZTb9qzbIRw/
 or3RpyZqtwh8TI5Zm6K3dsZMPCQM3ZWIioJnebn6pR+FH9GbXmMbGUfxDWu5UeccDATH
 pToDJv/Luip44r4kFh3ctgc7oqsSgqVhW/a/skNaJlnVn7em72YUepVzyuyu19f8zyOG
 7c4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=E0DmjyVcpqHYxloR9E3AJYr88ZVGNTCcY5HzUp0kA7U=;
 b=6/ekusHPWPpN4BJlTK9SRpkgS1DE+GPa5ocXUPrGvpFuX27J1ctJ5VWA5sCR3Ucrtk
 1ZcvUNDz29dEq5/MbEQlk8ZLirksgwyiAvkaiiH2QFpIMNEN1Tp71jCn7ljvL33iDu3D
 463clybqaVuNMve0xdTw3fGR+VfVMUrjS6mGxLOtXYsWPd974kkhpd1X5DDjeMID/uqw
 bx6nq5U7ociI6uF2TxZhqM5CARoMFMy2pLu4+DwmAR0bIh071XdgKAucVHXpD4oo/a9+
 hLzea0lvNhdzbe4HkCg+lTiuXUXFLe9yTwTZD6Zx8G3f9HTRbsE4BbFYsyBZShMnH8Lk
 dWTw==
X-Gm-Message-State: AOAM531h2ha8Ox4G6mCJ4veJ/cRgT5aJ4AiN4npmlxnruVyM8eun1ok2
 TqZTSXKekDWHnMV8AVXKR7kjiw==
X-Google-Smtp-Source: ABdhPJy5EhyKGgNr57uIPTAnTqZGtguQ0KqGAjwtu4c4LfdSF8cSeZsZ5qB2opnMmABWCKBrbIM9PQ==
X-Received: by 2002:a05:6000:547:: with SMTP id b7mr63709wrf.543.1639500291955; 
 Tue, 14 Dec 2021 08:44:51 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p12sm508182wrr.10.2021.12.14.08.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 08:44:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2D6D91FF96;
 Tue, 14 Dec 2021 16:44:50 +0000 (GMT)
References: <20211208231154.392029-1-richard.henderson@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH for-7.0 0/6] target/arm: Implement LVA, LPA, LPA2 features
Date: Tue, 14 Dec 2021 16:37:54 +0000
In-reply-to: <20211208231154.392029-1-richard.henderson@linaro.org>
Message-ID: <87tufbgmpp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> These features are all related and relatively small.
>
> Testing so far has been limited to booting a kernel
> with 64k pages and VA and PA set to 52 bits, which
> excercises LVA and LPA.

Do any distros ship with 64k pages that we could use for an avocado
test?

> There is not yet upstream support for LPA2, probably
> because it's an ARMv8.7 addition.

I guess we can defer adding tests for this until better upstream
support. Are there any WIP branches to test with? I've CC'd the kernel
guys.

>
>
> r~
>
>
> Richard Henderson (6):
>   target/arm: Fault on invalid TCR_ELx.TxSZ
>   target/arm: Move arm_pamax out of line
>   target/arm: Honor TCR_ELx.{I}PS
>   target/arm: Implement FEAT_LVA
>   target/arm: Implement FEAT_LPA
>   target/arm: Implement FEAT_LPA2
>
>  target/arm/cpu-param.h |   4 +-
>  target/arm/cpu.h       |  17 ++++
>  target/arm/internals.h |  22 +----
>  target/arm/cpu64.c     |   5 +-
>  target/arm/helper.c    | 211 ++++++++++++++++++++++++++++++++++-------
>  5 files changed, 204 insertions(+), 55 deletions(-)


--=20
Alex Benn=C3=A9e

