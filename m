Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 528F1439DE4
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 19:48:58 +0200 (CEST)
Received: from localhost ([::1]:51892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf45h-0007Ck-2L
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 13:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mf3ta-0008Vo-72; Mon, 25 Oct 2021 13:36:30 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mf3tX-0001vm-SC; Mon, 25 Oct 2021 13:36:25 -0400
Received: by mail-ed1-x52d.google.com with SMTP id 5so2450754edw.7;
 Mon, 25 Oct 2021 10:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Czbi/vUawZUe0SX4m8TkJPzL7ZQqeZvUuHtWi7xGVQ=;
 b=Z/Kf01AbNCHpKtw5mVH9iMwFNkk1ODVxWhLmLua3tUjAv6Z87m2Oy9S1KgQF/ZX+Wy
 zpRxWFD4778p3iJFFaT7t8ALS3QvWPzeHQO07Ea09oA0TwM730nIQZ3mBRvTcTD5Xv7w
 0H0MXQrOsnmnVbWEGEx/NTiEeKo63Vfl1EhKnxOokXPNKHehG069e4+LsmAXuCisAbRC
 6KhBYrVmKZDEjzVIBKhoaF4JRU+OhQvgq2XcpSsmoJoImyLW5fdrGtFth2Xd7oOR4ySq
 2aLQBKp448jb7Rf6LbMhgqzJ5K5j2iw9MX3mY+QNDAnKEzbaK5qvxVK7QM6PP4t0iAik
 B2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Czbi/vUawZUe0SX4m8TkJPzL7ZQqeZvUuHtWi7xGVQ=;
 b=OyUaIOVtdL8MvDk6o/RlXCyTSEVH6Z7v6l61RUR++Z7wxf3TqyWxtDFl4Xx6x7xmgn
 5CIOBl2/TyWRkl6nvOnJHZK9fHk3cmpHcxZW8ZKWzujeNm4ku/Qtwj/MyoYudhic6m42
 luriaT1gJIb5lZlIOR3dFnku8wBsRZUEwnbRtkw//BVUWI2qNpjvSIn2jBnDly5yK3Tu
 xprO0sfLdhETUmu2yqv+kaChOdvG336Wdjod08imTp5rnjSUoShmRhW2Ppwoern6KvZg
 IwD3hChvSXF/bifMGN5H/CF4DIGJP5YGIQXv96DxsXGmlCmqso6bZH/vFwLcBiOjQAfI
 KTNQ==
X-Gm-Message-State: AOAM53234VJ5/O0fZnWJCw5WhMHOvt+Owj4s4VUSI8OmAnHwmuOtFPG1
 l5aBJdRsCgPZbWD8EMchAQY=
X-Google-Smtp-Source: ABdhPJwO4ikuvf8xRaxfh2LElqELrxJXfDC4VJSvD7LE77zNhZu9J5fnwzOosAKryfWTpU+nu7H2Dg==
X-Received: by 2002:a17:907:7b9e:: with SMTP id
 ne30mr7824132ejc.531.1635183382199; 
 Mon, 25 Oct 2021 10:36:22 -0700 (PDT)
Received: from neptune.lab ([46.39.229.76])
 by smtp.googlemail.com with ESMTPSA id q14sm9718871edj.42.2021.10.25.10.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 10:36:21 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Subject: [PATCH v17 4/8] target/riscv: Add J extension state description
Date: Mon, 25 Oct 2021 20:36:05 +0300
Message-Id: <20211025173609.2724490-5-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211025173609.2724490-1-space.monkey.delivers@gmail.com>
References: <20211025173609.2724490-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: baturo.alexey@gmail.com, qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, space.monkey.delivers@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>, kupokupokupopo@gmail.com,
 palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/machine.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index f64b2a96c1..7b4c739564 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -84,6 +84,14 @@ static bool vector_needed(void *opaque)
     return riscv_has_ext(env, RVV);
 }
 
+static bool pointermasking_needed(void *opaque)
+{
+    RISCVCPU *cpu = opaque;
+    CPURISCVState *env = &cpu->env;
+
+    return riscv_has_ext(env, RVJ);
+}
+
 static const VMStateDescription vmstate_vector = {
     .name = "cpu/vector",
     .version_id = 1,
@@ -100,6 +108,24 @@ static const VMStateDescription vmstate_vector = {
         }
 };
 
+static const VMStateDescription vmstate_pointermasking = {
+    .name = "cpu/pointer_masking",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = pointermasking_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINTTL(env.mmte, RISCVCPU),
+        VMSTATE_UINTTL(env.mpmmask, RISCVCPU),
+        VMSTATE_UINTTL(env.mpmbase, RISCVCPU),
+        VMSTATE_UINTTL(env.spmmask, RISCVCPU),
+        VMSTATE_UINTTL(env.spmbase, RISCVCPU),
+        VMSTATE_UINTTL(env.upmmask, RISCVCPU),
+        VMSTATE_UINTTL(env.upmbase, RISCVCPU),
+
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_hyper = {
     .name = "cpu/hyper",
     .version_id = 1,
@@ -191,6 +217,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         &vmstate_pmp,
         &vmstate_hyper,
         &vmstate_vector,
+        &vmstate_pointermasking,
         NULL
     }
 };
-- 
2.30.2


