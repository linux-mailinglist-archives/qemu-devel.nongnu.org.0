Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 807DF3BC008
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 17:33:56 +0200 (CEST)
Received: from localhost ([::1]:55922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Qbb-0001eZ-Gq
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 11:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0QY6-0007Pd-H8
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 11:30:18 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:39497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0QY2-0001CS-6b
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 11:30:17 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso14386825wmh.4
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 08:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=DeO68//9ENSfLwwy5id4uhiaOG6Jw1Be4gpwtiDP0Eg=;
 b=bGph3sm2w+s8WmGtKfZtloSOc/m4SpsnuY9njq/NPUiqoa5Od3sfPVCdGA3kYticCo
 PUxbW9xDIosdAkpU+9qqFHmkD+qm2ziFTviwTb10pzXc9+Imgl5zkRNMNjJDt2a2lVoU
 OVcqJJEYlVSA5C5tHMPPqLMW9miMzL+NIe5B9GYqCwUw5Xhj8K/a3JYB7yyMYYWHEKwt
 XVIUEqoenefGKTl9mC1tEB7Xc78QeKTqTJ2FT2a5hr60VAPtNcVmXZB5IIOz6/Gx5fvC
 +f2zWacsRPnJ56csrZmqdUMob/aOdooptrB1RdzT8hFWel7erhDo0Vz/cK53ww2gE1fH
 Vflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=DeO68//9ENSfLwwy5id4uhiaOG6Jw1Be4gpwtiDP0Eg=;
 b=odkNwFp+1VgH3K+sErl//ejljB38SrESLKLmXQmTWOLBTcf5Qr1MOrA9hRyAsSIzrn
 KVH9DoaHLjV3fs2nA0Os65RyGjL+xrWH7gwtHI3RD5YGP8behCc73J/KztWPddW1IgSh
 yJO7KMqHgAHyUfVpE9VfLWa2dk8PoZuX9sX1z7t1O+VPppYhOrA51lujBkEsfVOOBg0X
 sPq2ly6bBqp0hQCBLSP3x51AQ4JwsG8Zi9JaQ1AJyzJ/Bc5FFYvP5hiD/N/Lcz3vnW6B
 gjNZta/yvkI87+9+aVns5D1eAs78r62o8UFBV7AS6cnYc3kslMZXiUtiIuZQ+Rjw5G/A
 Y5Lw==
X-Gm-Message-State: AOAM533Mt/rD7fFlGTSIrRPOhgHVANuRmQejln7/KMeVsJ7HhD26weEL
 SMifkYkAvrNKDCGCyU4I/9kigg==
X-Google-Smtp-Source: ABdhPJwjMcqqAf3odlpcV0uxg1W2gzpXu+Mud1TK49Ow6w7FipqeLKBb4fyHgDufjzIhExq5Kr3EOg==
X-Received: by 2002:a05:600c:49a4:: with SMTP id
 h36mr15267600wmp.122.1625499008835; 
 Mon, 05 Jul 2021 08:30:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o3sm13737870wrw.56.2021.07.05.08.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 08:30:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 592421FF7E;
 Mon,  5 Jul 2021 16:30:07 +0100 (BST)
References: <20210702081307.1653644-1-erdnaxe@crans.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alexandre Iooss <erdnaxe@crans.org>
Subject: Re: [PATCH v3 0/2] execlog TCG plugin to log instructions
Date: Mon, 05 Jul 2021 16:29:37 +0100
In-reply-to: <20210702081307.1653644-1-erdnaxe@crans.org>
Message-ID: <87im1o3hj4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 "open list : All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alexandre Iooss <erdnaxe@crans.org> writes:

> execlog is a plugin that logs executed instructions with some useful
> metadata including memory access.
>
> The output of the plugin is designed to be usable with other tools. For
> example it could be used with a side-channel leakage model to create
> side-channel traces from QEMU for security evaluation.

Queued to plugins/next, thanks.

>
> Changes since v2:
>  - Fix typo "tvg-plugins" to "tcg-plugins" in commit title.
>  - Add warning about plugin output size in documentation.
>  - Fix user mode tracing by using a dynamic list.
>  - Fix last instructions not being logged.
>  - Remove empty first line in plugin output.
>
> Changes since v1:
>  - The output is now easier to parse.
>  - Use QEMU logging API rather than FILE* to write output.
>  - Don't reject memory information in user mode.
>  - Merge memory information with instruction execution. Now one line
>    means one instruction.
>  - Add documentation.
>
> Alexandre Iooss (2):
>   contrib/plugins: add execlog to log instruction execution and memory
>     access
>   docs/devel: tcg-plugins: add execlog plugin description
>
>  MAINTAINERS                |   1 +
>  contrib/plugins/Makefile   |   1 +
>  contrib/plugins/execlog.c  | 153 +++++++++++++++++++++++++++++++++++++
>  docs/devel/tcg-plugins.rst |  24 ++++++
>  4 files changed, 179 insertions(+)
>  create mode 100644 contrib/plugins/execlog.c


--=20
Alex Benn=C3=A9e

