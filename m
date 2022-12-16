Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D826D64ED66
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 16:05:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6CGx-0003kO-Su; Fri, 16 Dec 2022 10:05:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p6CGq-0003hw-3Y
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 10:05:08 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p6CGo-0003sg-8D
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 10:05:07 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso1994914wmo.1
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 07:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lYIDbkohnpAn7D3d6BK+3Zh24bMlKcHzEBQo+ltpR94=;
 b=efeEq3eJRf4g2CDgSIFSKoUg0fGtcDHGS/uNy6u4XdhN35SIo6JOqpg6ijDKX9SqeS
 OUcs4mxvXIi87tVka2PbIb0pmdPn3RYlA1Uko8F54rej4qmmXm7twV4TgmfzitmumRHB
 7MdkXI8vvy4GgPwspWgXsvj3l1c3/W9eQJDA94x62Eui4JGk1b8Z6V+HJQJwApcIPa4Y
 bUuj8tN2iIqMtLF+kbtyTtuJ8JxvJ+EWG1xWCpspKfpcpXcDJEyBop4A9i2aa1KpTY4Q
 1zt0YDSWGeJQLTS8JvFdNVt9t0TZggu4T/z2mNUpWM1DfEMm9yFqPUMBOJh3IuRzFx/z
 j5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lYIDbkohnpAn7D3d6BK+3Zh24bMlKcHzEBQo+ltpR94=;
 b=Nr8XvzcfO/oZd5ioX05MMPI0lZATY6GazZvmXeHu5e9U+yprgOiP63NnIiLO9JhNek
 wFsq/eFZeDvtXPJRjAQ1bq6BVrkKX8IFJbV4Tb4izDihS7jgOORsaDvVeTRjHab2fOnT
 pa4Vxs6FRYjoSM2RnKP6a55FeQEq63sKO/7ukHSlumKhC64j0xP7sRpRHaWAhMmMU1YP
 apMUDz24MpcEpOrMR1N5bvkOXTAITl2Lb8mWkDzhHwPUvu+nwMdEEjc4r8hqgH65mHCg
 HziWxGqG8/7vd5FDkk0+ku0k/k2Qh00EUpKKeqAo6lKSlbBUzCjH7oAE4gik8u+WxJEl
 4OIA==
X-Gm-Message-State: ANoB5pm7Uswhtw7xL/Ro2kvKcYKueuHQtObKx37fyrSjJtGFlgo6NOWw
 FAN7pOzhHhe+rLzokKim4nYlcgJgOzfh7Vsb
X-Google-Smtp-Source: AA0mqf5/mYhPpdE9qz9IKYbEoyEfUmPeOc3NoxdaV+CocZe+kta39a//BLv7GJnqjLsT7ZVHWxXoUg==
X-Received: by 2002:a05:600c:3592:b0:3d1:bc32:2447 with SMTP id
 p18-20020a05600c359200b003d1bc322447mr25564693wmq.21.1671203103592; 
 Fri, 16 Dec 2022 07:05:03 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a05600c4fcd00b003b4868eb71bsm11746725wmq.25.2022.12.16.07.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 07:05:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 90D8A1FFB7;
 Fri, 16 Dec 2022 15:05:02 +0000 (GMT)
References: <20221207082309.9966-1-quic_mthiyaga@quicinc.com>
User-agent: mu4e 1.9.6; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
Cc: bcain@quicinc.com, quic_mathbern@quicinc.com, qemu-devel@nongnu.org
Subject: Re: [PATCH] configure: Fix check-tcg not executing any tests
Date: Fri, 16 Dec 2022 15:04:56 +0000
In-reply-to: <20221207082309.9966-1-quic_mthiyaga@quicinc.com>
Message-ID: <87bko3gzj5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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


Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com> writes:

> After configuring with --target-list=3Dhexagon-linux-user
> running `make check-tcg` just prints the following:
>
> ```
> make: Nothing to be done for 'check-tcg'
> ```
>
> In the probe_target_compiler function, the 'break'
> command is used incorrectly. There are no lexically
> enclosing loops associated with that break command which
> is an unspecfied behaviour in the POSIX standard.
>
> The dash shell implementation aborts the currently executing
> loop, in this case, causing the rest of the logic for the loop
> in line 2490 to be skipped, which means no Makefiles are
> generated for the tcg target tests.
>
> Fixes: c3b570b5a9a24d25 (configure: don't enable
> cross compilers unless in target_list)
>
> Signed-off-by: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

