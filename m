Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE6056B3B9
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 09:42:47 +0200 (CEST)
Received: from localhost ([::1]:33018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9idR-0008Uq-Hi
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 03:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kito.cheng@sifive.com>)
 id 1o9iag-0006f8-Cx
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 03:39:54 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:34335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kito.cheng@sifive.com>)
 id 1o9iae-0007pb-Px
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 03:39:53 -0400
Received: by mail-pl1-x633.google.com with SMTP id z1so9906874plb.1
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 00:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=78f3UoYPyR9YoulyrKcvwwDRZlSVOSbTJYl/G8DuHig=;
 b=axPc6VyGqrlGySrqMb/1XHjEId1tMfg0rwtUzI+3fdVh0TRkYnYcGSkxnKXL9R6TKs
 XG+XyfqEeRVAKUpOpwJADUc1VkqwYvv5aq0fpYOr6d13KfPzQa9cpwTMqFkP7dOACDLt
 U8X8KHtjc/SR21xqtCNnboFGLWNHE3WFLQLZur50V1IoSltluZ1b3fg/VrTigpdPlqOd
 Y8BYcTMmj7msoOuYrBq160Ejm5il4IjkUWe0GButlISXCpTUsGUzWUILDb0cXwXqz4u+
 NaPIfXJFYLlIkuR6GIdB5RHk/XLOf4AGCE93i6dvrgkSG5Y6i900zjpG1qehGK2zGZD1
 lCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=78f3UoYPyR9YoulyrKcvwwDRZlSVOSbTJYl/G8DuHig=;
 b=PrsuzJxYOwfI8aX7zsl2xc+8viOz0rVDDRaheJ5QB4xvGhbdKrduEnNYsJuUP9hRTH
 SHsuTPyUFNi0Ctn3rbLXpZYqRYbSaMPF91ACx2JrOYoQr+G2l5gv+02bRNOCQZ/82u8i
 GSXLRttw83KfHxLq++1i7kKljn0VysRHnfou4vj8GcbrftzjV8DLlNJ+4HB8ozSsGOg7
 EhZMI4j/rW3TbNHjxP+/pAKSLbkjlYyzauDJHQlLWDEqV0WURNDMDhPAawzD6L0dVoeF
 37cfyP84+zcInziSZjdG9IrYLjjSVcq6PqZ2A85fc7NYBYSz+V0/1hScbYZhBVpgeMSd
 4VZw==
X-Gm-Message-State: AJIora9V7w7zZtoDPstaUksSHA/whSk/01fzkzewJY3U96W7k/drFLML
 ht4w54z8ICus+4oqkdQLKQHK8g==
X-Google-Smtp-Source: AGRyM1ufd8hRZCXK40u/ukBn7NhP8GKrgDe2t6U1B0xdA+js8Mx6tu9VV/ZgBlnFSc0PSXO4xepBFA==
X-Received: by 2002:a17:902:d4c3:b0:16a:2dc1:1ce6 with SMTP id
 o3-20020a170902d4c300b0016a2dc11ce6mr2428245plg.161.1657265991399; 
 Fri, 08 Jul 2022 00:39:51 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a170903121100b0016bef50c1ebsm8122412plh.128.2022.07.08.00.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 00:39:51 -0700 (PDT)
From: Kito Cheng <kito.cheng@sifive.com>
To: alistair.francis@wdc.com, palmer@dabbelt.com, frank.chang@sifive.com,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, liweiwei@iscas.ac.cn
Cc: Kito Cheng <kito.cheng@sifive.com>
Subject: [PATCH 2/2] target/riscv: Auto set elen from vector extension by
 default
Date: Fri,  8 Jul 2022 15:39:43 +0800
Message-Id: <20220708073943.54781-2-kito.cheng@sifive.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20220708073943.54781-1-kito.cheng@sifive.com>
References: <20220708073943.54781-1-kito.cheng@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=kito.cheng@sifive.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Default ELEN is setting to 64 for now, which is incorrect setting for
Zve32*, and spec has mention minimum VLEN and supported EEW in chapter
"Zve*: Vector Extensions for Embedded Processors" is 32 for Zve32.

ELEN actaully could be derived from which extensions are enabled,
so this patch set elen to 0 as auto detect, and keep the capability to
let user could configure that.

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
---
 target/riscv/cpu.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 487d0faa63..c1b96da7da 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -751,13 +751,22 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
                         "Vector extension ELEN must be power of 2");
                 return;
             }
-            if (cpu->cfg.elen > 64 || cpu->cfg.vlen < 8) {
+            if (cpu->cfg.elen == 0) {
+              if (cpu->cfg.ext_zve32f) {
+                cpu->cfg.elen = 32;
+              }
+              if (cpu->cfg.ext_zve64f || cpu->cfg.ext_v) {
+                cpu->cfg.elen = 64;
+              }
+            }
+            if (cpu->cfg.elen != 0 && (cpu->cfg.elen > 64 ||
+                                       cpu->cfg.elen < 8)) {
                 error_setg(errp,
                         "Vector extension implementation only supports ELEN "
                         "in the range [8, 64]");
                 return;
             }
-            if (cpu->cfg.vlen < cpu->cfg.elen) {
+            if (cpu->cfg.elen != 0 && cpu->cfg.vlen < cpu->cfg.elen) {
                 error_setg(errp,
                         "Vector extension VLEN must be greater than or equal "
                         "to ELEN");
@@ -901,7 +910,8 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
-    DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
+    /* elen = 0 means set from v or zve* extension */
+    DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 0),
 
     DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
-- 
2.34.0


