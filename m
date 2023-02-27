Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 030636A443C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:22:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeFZ-0003hT-Vo; Mon, 27 Feb 2023 09:13:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeF4-0000aB-71
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:12:38 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeEt-0001KP-VP
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:12:29 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 o38-20020a05600c512600b003e8320d1c11so6641915wms.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oXB4UAGDvhJyfq+xzN5wPHpDHJCrN79at2VjI6Dm6fg=;
 b=cGffYHf9mJ6lYR3sLe38pW3wph8/CKJBzCtiOSUvHG6fdkC6Z5l2O9rXEcYR53h/0J
 uWcziZvaogXRWcmEjqOGk23TNopYiGJ7Cu7Y72+EjaFBx3CnFbdk9QSfA/GkBcoXoP6l
 0w9x0ds1ItaMx47TxEkLk8Lv0ypcIOzTuucXEYEFrWSp3m8puO/XJpSFobfgzQq4hnL7
 xcLB/d7gtIReLRx5EK1m2ckVcR5xfg2lYz7iTy4nsFkP+n1OAvOPvdBEwVEOyYNABl43
 H/GK3QbftfDWm0P/W08dYW4RQqgnW8POpBy5200fMdHkm4+sba3dg7PI/EWqpS7ZuG6T
 LYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oXB4UAGDvhJyfq+xzN5wPHpDHJCrN79at2VjI6Dm6fg=;
 b=G2ipMryaLfG0gO/ye2cAX5cK8d0Xo3JhBkyV6BE4LH7OX/oZ/uLdcWEsBpPyTHUGqG
 U2YDE1QJPRMcBHnEW22TDLWlHuPiKGVbGHXOycEIkmHBop1IAD2BAZ5q/9S8J8ogcX48
 m0eFekjU5exQK/Lhs+bSc3rf7HAmheM6A1s8Hz81K4BA+sZq6WlKgVPGecxs9mDVBk8d
 M23CYtdMFq53DE2n0yuJ+ZesP9ue7SoCsgHRP5sqU6TK9oOtTNatQGveeARSrYcRG6J0
 kg3DphT7qOqbiChp+fca0UFAHcQ38BrzH10pL8D2T0pf0o6ybjVwby23mqGf45O8Lpm2
 J9vw==
X-Gm-Message-State: AO0yUKWnuTy5TGW9vpfv38HXiP0ZLZpAwjv1WKUoA/Xo/GQE/BzGxjo9
 HxRe5O5AJgSbkEPr+qaBvzvvW9qpLQoj3ztc
X-Google-Smtp-Source: AK7set83bKw0xIZge4hG4a2/ihjG0czvARiJbupUlU+J6dLuND2OwRXYpBT2yzXl1/kraMkQ1QEiVg==
X-Received: by 2002:a05:600c:3088:b0:3d3:49db:9b25 with SMTP id
 g8-20020a05600c308800b003d349db9b25mr19990095wmn.26.1677507146287; 
 Mon, 27 Feb 2023 06:12:26 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a05600c351200b003eb192787bfsm9526180wmq.25.2023.02.27.06.12.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:12:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 122/126] dump: Replace TARGET_PAGE_SIZE ->
 qemu_target_page_size()
Date: Mon, 27 Feb 2023 15:02:09 +0100
Message-Id: <20230227140213.35084-113-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

TARGET_PAGE_SIZE is target specific. In preparation of
making dump.c target-agnostic, replace the compile-time
TARGET_PAGE_SIZE definition by runtime qemu_target_page_size().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20230225094903.53167-3-philmd@linaro.org>
---
 dump/dump.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/dump/dump.c b/dump/dump.c
index 0ab229e5e9..4d68a74ffa 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -15,6 +15,7 @@
 #include "qemu/cutils.h"
 #include "elf.h"
 #include "exec/hwaddr.h"
+#include "exec/target_page.h"
 #include "monitor/monitor.h"
 #include "sysemu/kvm.h"
 #include "sysemu/dump.h"
@@ -1860,7 +1861,7 @@ static void dump_init(DumpState *s, int fd, bool has_format,
     }
 
     if (!s->dump_info.page_size) {
-        s->dump_info.page_size = TARGET_PAGE_SIZE;
+        s->dump_info.page_size = qemu_target_page_size();
     }
 
     s->note_size = cpu_get_note_size(s->dump_info.d_class,
-- 
2.38.1


