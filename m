Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A2C6CC656
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 17:30:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phBG5-0005VU-Lt; Tue, 28 Mar 2023 11:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phBG2-0005V0-CD
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 11:29:10 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phBG0-0003f3-Ik
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 11:29:09 -0400
Received: by mail-wr1-x431.google.com with SMTP id v1so12666878wrv.1
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 08:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680017346;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uyyD/mMZ5WLjmBQsAFQe0xCp+k5xk7Xq+CNZfB8EOHQ=;
 b=SXEP1vZrpNuaH5uGmU1YCL3q4pG+hoZB3/xZEKTNXtuU9fFWE2iqESH3IgVZL+cb88
 wgRqWkN/2N55m0rKkQHjgwU8+zP4QK1T7QvvDrBoA8SzwoFISpuBU/yGdOVbvJW9djGC
 xvfhwpt8dKJ1GqJTtbVTlWzoDb82M3c7Rh/uhcOfkh3/BGWBd9+cupuY/MBwdnI0v86/
 RcrboJkJlTT7Qy2d9LR/iaEZNMMo9jGjqVuATrRke2ltMV9UO6hxtYhe2YPfsz6S2C59
 Ii6QNMqjfqhyhnhNKU/mjeNnFlbdOGKY0BsZKasMPS/Wc7iCGkri9x4SnE7V4xIisCHl
 cZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680017346;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uyyD/mMZ5WLjmBQsAFQe0xCp+k5xk7Xq+CNZfB8EOHQ=;
 b=e1u+0CZpLqbBeKax/zIDNWInF7BDKm9rZgh/YqWZtXcMJQa18Pe9YXG18zG07w50je
 /pBj4oKsbfiS/hoT8KMV68cQEWrpg1QOTcEEt6+FbuFG1JEMyXSt9NI4WVJ7SAP19bRZ
 V/ocpqdgzo0MQm+pLdYY45gjUwgf2InXQONtnvySdUCa1wRyvpiKiGIjlqZm5VqzHSGD
 mNzTxV0l5Meu5DMWCR9BG5k6rucAdynn5NqP/lg5WyI41rBpKY9xXZYixHe6qTs4Iyd8
 5A32FlmVSrTirsViDtj2yqdHM/Rm/8kmM1r1y6JFu0w6zuVjbxjzYk0hu6vWpLveVNzI
 sFZQ==
X-Gm-Message-State: AAQBX9fm79Fuuqm1dmtFgv+NGuAUmmHnL1ydDd0SY0RVFuG4+CQ1BjD1
 0e6hW9SbrcDSjZPxclNkKFY/b0FtPExY5qHgkPU=
X-Google-Smtp-Source: AKy350aVTh7bNdrfCbqpJHtuydDlh2RLmtnOmU4oeJJP5x12AN7f0EU9GaOOXBuDFA/Fpx8TvWacbQ==
X-Received: by 2002:adf:e90b:0:b0:2d4:751d:675b with SMTP id
 f11-20020adfe90b000000b002d4751d675bmr12236771wrm.35.1680017345908; 
 Tue, 28 Mar 2023 08:29:05 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a5d4ad0000000b002d51d10a3fasm24596765wrs.55.2023.03.28.08.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 08:29:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2C6521FFB7;
 Tue, 28 Mar 2023 16:29:05 +0100 (BST)
References: <4e79a438-778b-877d-d3dc-ad05cbab88cc@msgid.tls.msk.ru>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-stable <qemu-stable@nongnu.org>, Michael Roth
 <michael.roth@amd.com>, qemu-devel@nongnu.org
Subject: Re: qemu 7.2 stable release, 2nd try
Date: Tue, 28 Mar 2023 16:28:27 +0100
In-reply-to: <4e79a438-778b-877d-d3dc-ad05cbab88cc@msgid.tls.msk.ru>
Message-ID: <87o7ocrj26.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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


Michael Tokarev <mjt@tls.msk.ru> writes:

> Hi!
>
> After posting an RFC (due to me doing a stable release for the first time=
) and
> getting exactly 0 replies/comments, I'm a bit worried, - does this mean t=
here's
> no interest in getting 7.2-stable out of the doors at all? :)

I'm interested - although Debian already has the "latest" stuff we need.
What do you need though, re-reviews or just simple Acked-by's for the
included patches?

>
> With 8.0 approaching rapidly, and with no other comments or new patches f=
or
> -stable, let's make this official within a week from now, on Mar-29.
>
> It *feels* like quite some more changes should be picked too, but let's do
> *something* after all :)
>
> I still need some minor help with the final step, - pushing to main qemu =
git
> repo and running the whole testsuite before the actual release.  Asking f=
or
> push/commit access for that.
>
> Thanks,
>
> /mjt


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

