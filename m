Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB70466D533
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 04:58:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHd6A-0000W3-C6; Mon, 16 Jan 2023 22:57:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHd62-0000Rr-Oz
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 22:57:14 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHd5w-0005du-Pv
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 22:57:12 -0500
Received: by mail-pl1-x631.google.com with SMTP id r21so170159plg.13
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 19:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gM1CjMI/N7DQfnTG/1bMsvDAvMz5iBpOsUOR++NYBmk=;
 b=NhZEAHCDV53wNbdx5MLTV3/+Kpj6jOP581HuLPFOsc9JsAng0BC/7UnUs6tlCxJ2IE
 4AwxkK5QyvgBMtcSFK7ZnoM7GK7vKJbnOH95LS45BRdiIGTPybxYftBs+viWkYdRL2cp
 VeLmvRoSfy4jifDkQtTzoaco6PeD+Dmcn00RGr/96/FvdQTRpQS5xHS7iBCCY1HKY+Yx
 2USBuPmFWhdXtMOi/1buUhNUoEqxkKZaCQh1+vlpovRf51O4YEw/ZZyx60yuPT+y4aCe
 x7LgP5ki1SKzET7nMXzXlMGVG/6APerFHsqJi9NVtiZS/yeMNX1UMwU3J130CHbb9Htl
 7AiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gM1CjMI/N7DQfnTG/1bMsvDAvMz5iBpOsUOR++NYBmk=;
 b=hIsGJi1ZPgQ/+9lZOsxbLkWocwi6/Nsyn7urlGYyojcXbwLjoE2TIHG1u1tWwmQCkS
 Nxk5KXjVj9a8ER+L5YIfiIJrXPN0+Ey//wUT8mJSH4tnENjmUVhzhkL7Y7ZPqZm3GNci
 XB4vndn/KV4w2C6yZjDsgQcAkYmUtXvyr2Q5tcUQkvl8t0hPB30WlY0iT4d7yLmNIbxV
 FHG63O2A7ksp2saC5pcnDbZWvX8hMXRZ/b2aaTvM1S3ljmuka97a6sHOOxsKhakoPhhy
 HAk3UudjXanKOipWR2cq7Xrtzusjk4yuqOQXi3BxjGB0ZrEiCTi6WHrBQ1ZwATD+Nhb5
 7wIA==
X-Gm-Message-State: AFqh2kq0I0KN51XaC19pDt9bE7pbZ6gWsZX5CsH5LbAH0FAxJaRQn/26
 5CtyENWHuirSfCI72p8uQ7Q8ovTEzOCUHZl5
X-Google-Smtp-Source: AMrXdXtcq/eSC5C7OIbwN9sCAM20Xo0Kqt7DvRrgRgpYkokNqNBy492YSvTYhGe6pxhdjW3/Gjt4JA==
X-Received: by 2002:a17:902:d88d:b0:194:7c28:3fa4 with SMTP id
 b13-20020a170902d88d00b001947c283fa4mr938900plz.19.1673927824597; 
 Mon, 16 Jan 2023 19:57:04 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a1709027e8f00b001869079d083sm19991531pla.90.2023.01.16.19.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 19:57:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH 0/3] tests: Fix some deadlocks
Date: Mon, 16 Jan 2023 17:56:58 -1000
Message-Id: <20230117035701.168514-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

The first patch addresses the fact that linux-user blocks all signals
while attempting to handle guest signals (e.g. ABRT), which means that
the default TERM sent by timeout has no effect -- KILL instead.

When a guest aborts (possible nios2 guest bug), sending SIGABRT to
itself, I have caught one thread waiting in start_exclusive, and all
of the others blocked in exclusive_idle.  I look at that and think
there's a bug in our start_exclusive locking, but I can't prove it.

I also wonder whether qemu_plugin_user_exit really needs it, and since
that's the only place that seems to have issues at present, whether
it is in fact using it incorrectly.

Finally, I think we're missing at least a few early tests for
"no plugins registered", like this one, which ought to be fast path,
where the function need do no work whatsoever -- possibly including
taking the plugin lock, but I can't prove that either.

Anyway, this has improved make check-tcg -jX, for large X, which
appears to aggravate things.


r~


Richard Henderson (3):
  tests/tcg: Use SIGKILL for timeout
  plugins: Avoid deadlock in qemu_plugin_user_exit
  plugins: Iterate on cb_lists in qemu_plugin_user_exit

 plugins/core.c            | 13 +++++++------
 tests/tcg/Makefile.target |  4 ++--
 2 files changed, 9 insertions(+), 8 deletions(-)

-- 
2.34.1


