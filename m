Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF24E1D807D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 19:40:24 +0200 (CEST)
Received: from localhost ([::1]:56096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jajkV-0000Vg-Nt
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 13:40:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jajjF-0007j4-Bw
 for qemu-devel@nongnu.org; Mon, 18 May 2020 13:39:05 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:42791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jajjE-0004Wn-Od
 for qemu-devel@nongnu.org; Mon, 18 May 2020 13:39:05 -0400
Received: by mail-wr1-x443.google.com with SMTP id s8so12854602wrt.9
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 10:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mNCRmsys8UfNyP+Gk5NUQcKf0vXMp3VyrtqyjiT9EGk=;
 b=W1Vt+LyedEOvGjoe1n8lBf1KLQUzzncCH8nPPcFQSy6NWZKUZlg8w9UXRSgHAyMIWX
 Y66rkW0iRZJNd3Kwn7ySaXxk50wpJaNzgWrDEQPgyZTSzHzzrhZrsuaAeARp51j3TgY5
 esWIaQqw1U+tdoph1cQVN9ybGBOzcrDIz91gH1a66Z0ok4ORAuOTgegP8YceaUv9w2/2
 ygCj/G3YGfIXPP0MDZLXbxcat3N71P33h4lHrCIP6fzTdS0y4zHCd14YZihvBzBdQlA2
 rAWq79xsxxiMa52dcW95wE+WGYaYdsKyOfy/++UILo1tSFk5bguBDsBlx6NgrTBLyoIm
 TVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mNCRmsys8UfNyP+Gk5NUQcKf0vXMp3VyrtqyjiT9EGk=;
 b=csYg/hEsVidPqc56dFyDULZv3Rmi7POFpwzHdTMbLcWI0wtHAFVaHqGKH9nQTBh3NT
 RaDU8CigzNkdnf7X0izZkbGuIc9BlrAT8D66LMYI3pi9OJq0XnVM3Blp1SV65lhE3A8z
 gLGRoghl1Bp92vYKYO4FIKAvhPQCcHblfdXwHWsp4EMSZqmdR5ilmyb+tclnqnJpi7fJ
 I2XQnGNc0d9Ak2j+nYRBYP6eHREpU/qFzwFHlPFjkbHLaA8i4j1FaoIisogOIiCIpaWw
 LKu08VAQ3wpnmYJXjggRHR450+ECNhFd68WO3glbLTzgDKjl79fsAmhe2hgIaDgpoH7A
 F+Qg==
X-Gm-Message-State: AOAM532Prjv/1tUc/SUvyKso8SVCiaNKvRlwxblW2evmemTtQM9ejX+k
 hPDEdRh3zIM933oEMO6MpsaTFgT3CrY=
X-Google-Smtp-Source: ABdhPJyAyCUm+PB+V8DSq+JA/ZyF6i8I6EJfRaZflQ6Q5ftGilsZvqRhGxVCVGSqxHa0bw266CP3xQ==
X-Received: by 2002:a5d:694c:: with SMTP id r12mr20894806wrw.200.1589823542829; 
 Mon, 18 May 2020 10:39:02 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id k13sm271113wmj.40.2020.05.18.10.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 10:39:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] hw/m68k/mcf5206: Reduce m5206_mbar_read/write() offset
 arg to 16-bit
Date: Mon, 18 May 2020 19:38:58 +0200
Message-Id: <20200518173859.16520-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200518173859.16520-1-f4bug@amsat.org>
References: <20200518173859.16520-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Thomas Huth <huth@tuxfamily.org>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All calls to m5206_mbar_read/m5206_mbar_write are used with
'offset = hwaddr & 0x3ff', so we are sure the offset fits
in 16-bit.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/m68k/mcf5206.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
index b155dd8170..45f44c43f0 100644
--- a/hw/m68k/mcf5206.c
+++ b/hw/m68k/mcf5206.c
@@ -273,7 +273,7 @@ static void m5206_mbar_reset(m5206_mbar_state *s)
 }
 
 static uint64_t m5206_mbar_read(m5206_mbar_state *s,
-                                uint64_t offset, unsigned size)
+                                uint16_t offset, unsigned size)
 {
     if (offset >= 0x100 && offset < 0x120) {
         return m5206_timer_read(s->timer[0], offset - 0x100);
@@ -306,11 +306,11 @@ static uint64_t m5206_mbar_read(m5206_mbar_state *s,
     case 0x170: return s->uivr[0];
     case 0x1b0: return s->uivr[1];
     }
-    hw_error("Bad MBAR read offset 0x%x", (int)offset);
+    hw_error("Bad MBAR read offset 0x%x", offset);
     return 0;
 }
 
-static void m5206_mbar_write(m5206_mbar_state *s, uint32_t offset,
+static void m5206_mbar_write(m5206_mbar_state *s, uint16_t offset,
                              uint64_t value, unsigned size)
 {
     if (offset >= 0x100 && offset < 0x120) {
@@ -360,7 +360,7 @@ static void m5206_mbar_write(m5206_mbar_state *s, uint32_t offset,
         s->uivr[1] = value;
         break;
     default:
-        hw_error("Bad MBAR write offset 0x%x", (int)offset);
+        hw_error("Bad MBAR write offset 0x%x", offset);
         break;
     }
 }
-- 
2.21.3


