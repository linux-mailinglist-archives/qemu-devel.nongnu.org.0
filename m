Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6155320B41
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 16:08:46 +0100 (CET)
Received: from localhost ([::1]:35590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDqLl-0005h7-Qo
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 10:08:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDprs-0000y2-5Y
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:52 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDprq-0003bu-Ge
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:51 -0500
Received: by mail-wr1-x42a.google.com with SMTP id h98so11536192wrh.11
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=muqL6retzxZvpcBpGa23dxnp9efbxFOJm+AoenlNu0M=;
 b=kQPKDk8c78UF26cl4IxAxihMz2IMrzGSWXYDo8bBPkQ/ettyPyHvsBySLoaizMS1n2
 4X3JzSWOUvzUp6WPR+4/sDX2wy8++PfWa2rja0OzDTXNMBAoDF3VVxF+Ni+Koh8KamoD
 zQBT89kp8MJW9jNKd7QWnpff2I4v1pGLHGxAlIAwRrs8REhX0KZvix2fD+UuKzb4EFms
 vVpwfpT7S0I/4wRepKMxezSdQdfTIMfEKKuli6RSKu7xG/FMGDF8UUirJYMmOHfffy3E
 QDtvz62ybvwtBA2zIAvP7Z0ragY+c7PiZuWnoHGcKAnhPJWloHP2VXKbrcxVDZJTa9Bp
 DODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=muqL6retzxZvpcBpGa23dxnp9efbxFOJm+AoenlNu0M=;
 b=pDLTGcQI5eKaLAdh/2FhkkTeNHw/u6KBCP/RyhDQ8AFZRO67D/XH8kMfhPGAQw9S0l
 xph4CbyqFQL5Pp3JarZwUJatWYgD3qY+XNkutu+FmOnME9ZBMZR4LY7vlNRs/F1bx84t
 ZaQLGMQwDPxBCfvDlgDh6AaIVCWElnTdX5s0YxWRNwMY0N9lWRNkVZyOzx+tYKIDAFm+
 Y9ZUke6UsDvv2nLu75ASElwf6vmCGaj9UnqlRynr/INkLBBh4P+yysWUGmSClPzptbfP
 /n+jQehPo3ThyOq62h6dwXGnt7QgNCYbUp4piOWdGoRJr/IVO0PCiIcKgCtVXrCCJbcz
 rAsw==
X-Gm-Message-State: AOAM5307UpPPmhdXHJftEyo0TqcWXOMH6+vW0TTphR9KdMhXkhyRn7KK
 axlme3nmSMBA+gLeMmr1WF+P5CigNIQ=
X-Google-Smtp-Source: ABdhPJzpKhADvmvuoNPN+zHAUkHZ+lnicDplja+cWeo4lrpEQchpGJHMeqwcHu36Ha98GWOznMxlAg==
X-Received: by 2002:a5d:4c82:: with SMTP id z2mr17589401wrs.220.1613918269077; 
 Sun, 21 Feb 2021 06:37:49 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y2sm3090434wrp.39.2021.02.21.06.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:37:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 39/43] vt82c686: Remove index field of SuperIOConfig
Date: Sun, 21 Feb 2021 15:34:28 +0100
Message-Id: <20210221143432.2468220-40-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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

From: BALATON Zoltan <balaton@eik.bme.hu>

Remove the separate index value from SuperIOConfig and store
the index at reg 0 which is reserved and returns 0 on read.
This simplifies the object state.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <15b2968fd300a12d06b42368d084f6f80d3c3be5.1610223397.git.balaton@eik.bme.hu>
[PMD: Split original patch in 5, this is part 1/5]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index a37f1931ce0..eebaa0d444c 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -250,7 +250,6 @@ static const TypeInfo vt8231_pm_info = {
 
 typedef struct SuperIOConfig {
     uint8_t regs[0x100];
-    uint8_t index;
     MemoryRegion io;
 } SuperIOConfig;
 
@@ -258,14 +257,15 @@ static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
                               unsigned size)
 {
     SuperIOConfig *sc = opaque;
+    uint8_t idx = sc->regs[0];
 
     if (addr == 0x3f0) { /* config index register */
-        sc->index = data & 0xff;
+        idx = data & 0xff;
     } else {
         bool can_write = true;
         /* 0x3f1, config data register */
-        trace_via_superio_write(sc->index, data & 0xff);
-        switch (sc->index) {
+        trace_via_superio_write(idx, data & 0xff);
+        switch (idx) {
         case 0x00 ... 0xdf:
         case 0xe4:
         case 0xe5:
@@ -283,7 +283,7 @@ static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
 
         }
         if (can_write) {
-            sc->regs[sc->index] = data & 0xff;
+            sc->regs[idx] = data & 0xff;
         }
     }
 }
@@ -291,9 +291,16 @@ static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
 static uint64_t superio_cfg_read(void *opaque, hwaddr addr, unsigned size)
 {
     SuperIOConfig *sc = opaque;
-    uint8_t val = sc->regs[sc->index];
+    uint8_t idx = sc->regs[0];
+    uint8_t val = sc->regs[idx];
 
-    trace_via_superio_read(sc->index, val);
+    if (addr == 0) {
+        return idx;
+    }
+    if (addr == 1 && idx == 0) {
+        val = 0; /* reading reg 0 where we store index value */
+    }
+    trace_via_superio_read(idx, val);
     return val;
 }
 
-- 
2.26.2


