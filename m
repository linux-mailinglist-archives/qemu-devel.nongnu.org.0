Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3969F320AF8
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:39:30 +0100 (CET)
Received: from localhost ([::1]:33494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDptR-0001y9-0d
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:39:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDppF-00062Y-JA
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:35:09 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:36948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDppE-0002VD-3l
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:35:09 -0500
Received: by mail-wm1-x32d.google.com with SMTP id m1so12067904wml.2
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2T22PSlc3zWYY+N/sqvIVsDv+5hyrx8dL5ATa6HQsLQ=;
 b=GyWALZ+NtZQXEw1s09Ch58Ww9zTA1O7tUI2Fa5CtI+xfYe06YxGbG/sebTNkyH9FW9
 Mz3sBfSMhdZ/fwnH1Jqrv+d0W/m1ZqeuKTBBxyuNRlzut4lOirjyJk+CCFdsRtQvey8M
 wFtOBFpFLWeoueBtb+CxgU68OButJJI+36blZlevoGKjue3M/XVFoN6vW1nSL16uRY5v
 37lOMzhJEPkn3V1+G07/NqEX+lfTlbru7XwdKWNie0JcVf6SBPKCCtLEoNOCDHNU3lHK
 MgIz+nHOZNJWfVfeGXgQmPEAMUqNmqQXRpxPM3Z12S4qStcL1wndkuS93+mMoi9jsIV+
 P0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2T22PSlc3zWYY+N/sqvIVsDv+5hyrx8dL5ATa6HQsLQ=;
 b=sB46ltpygrrHgWc/jq6DJcHc3qVwpS94J+9t7olJjlq/i8LBd1QJ3ugPFxH6xbqnq3
 L0ZfxPWZqhfanWXlknXPBlVZJejWdA4mdVGOVycHsU+jx8PirZRCpNkal1uHNS6hrtFQ
 l2/y0zT8b50OUw3H9YhhLAZA7IbyAC27lcEzxSIOicb51CCNq9BRyba3RyM2p0W0s98q
 jtk8I0WsQ51qwZ8ltHO0bm9SYqU8ZWTHZ1A/ZsgA/eiXMd5PHOOqdDPQS/vI7OOqRy7b
 OMO/7lDk6cOZZ4/FQsMdiayBCimKBhpzELBXXiRuxA+41d0BkQ/p4WOlYLGqvlgswuQj
 bJfg==
X-Gm-Message-State: AOAM531UrJp+mfoEriln+nWQGXiVDuMOhB1y4QXRFHQZmmy8VZlTlhPl
 2fiuq9BSYzsnQnLQ7HWFKhC+4bZcPk0=
X-Google-Smtp-Source: ABdhPJyOWyvZ7IZomi4JYQATp/tuqiatJbvteY4agtIF0C2fU7dUsJmkAJsSBDIZ5aE1lUNDE9KaAw==
X-Received: by 2002:a7b:c397:: with SMTP id s23mr16156014wmj.10.1613918104747; 
 Sun, 21 Feb 2021 06:35:04 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q25sm17091796wmq.15.2021.02.21.06.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:35:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/43] hw/intc/loongson_liointc: Fix per core ISR handling
Date: Sun, 21 Feb 2021 15:33:55 +0100
Message-Id: <20210221143432.2468220-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

Per core ISR is a set of 32-bit registers spaced by 8 bytes.
This patch fixed calculation of it's size and also added check
of alignment at reading & writing.

Fixes: Coverity CID 1438965 and CID 1438967
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Huacai Chen <chenhuacai@kernel.org>
Message-Id: <20210112012527.28927-1-jiaxun.yang@flygoat.com>
[PMD: Added Coverity CID]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/loongson_liointc.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/hw/intc/loongson_liointc.c b/hw/intc/loongson_liointc.c
index f823d484e08..cc11b544cb4 100644
--- a/hw/intc/loongson_liointc.c
+++ b/hw/intc/loongson_liointc.c
@@ -41,7 +41,7 @@
 #define R_IEN_CLR               0x2c
 #define R_ISR_SIZE              0x8
 #define R_START                 0x40
-#define R_END                   0x64
+#define R_END                   (R_START + R_ISR_SIZE * NUM_CORES)
 
 struct loongson_liointc {
     SysBusDevice parent_obj;
@@ -125,7 +125,12 @@ liointc_read(void *opaque, hwaddr addr, unsigned int size)
     }
 
     if (addr >= R_START && addr < R_END) {
-        int core = (addr - R_START) / R_ISR_SIZE;
+        hwaddr offset = addr - R_START;
+        int core = offset / R_ISR_SIZE;
+
+        if (offset % R_ISR_SIZE) {
+            goto out;
+        }
         r = p->per_core_isr[core];
         goto out;
     }
@@ -169,7 +174,12 @@ liointc_write(void *opaque, hwaddr addr,
     }
 
     if (addr >= R_START && addr < R_END) {
-        int core = (addr - R_START) / R_ISR_SIZE;
+        hwaddr offset = addr - R_START;
+        int core = offset / R_ISR_SIZE;
+
+        if (offset % R_ISR_SIZE) {
+            goto out;
+        }
         p->per_core_isr[core] = value;
         goto out;
     }
-- 
2.26.2


