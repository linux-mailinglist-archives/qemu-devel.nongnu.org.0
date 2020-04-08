Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 305EC1A1947
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Apr 2020 02:37:17 +0200 (CEST)
Received: from localhost ([::1]:54750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLyiS-0007eI-2S
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 20:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56286)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mansourweb@gmail.com>) id 1jLyhI-0007Cc-NK
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 20:36:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mansourweb@gmail.com>) id 1jLyhH-0004Ib-KH
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 20:36:04 -0400
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:40158)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mansourweb@gmail.com>)
 id 1jLyhH-0004I5-DR
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 20:36:03 -0400
Received: by mail-qt1-x843.google.com with SMTP id y25so4316667qtv.7
 for <qemu-devel@nongnu.org>; Tue, 07 Apr 2020 17:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ctHce87cyTKkFSgMaUa0L5K58wzqIkasYwqh+ri8S64=;
 b=HmAcKcEPHbqGK6YKsTZ+fi98IwM/+G7KklIazjOAtycXs28JyPON30Q93vec6OJGyY
 iSZftTfkw3kvSajWavlZKTsOPiQG6EjB1LlNG8Csv9igY+8iD3OgmbLFtcQ1DA9C7CBp
 lJk4R9hItzZeTEaMLiw8JmC8ENsig32fGtfG2ec0lqhf/d4y+WmHM8yjHYod0JQcFUZh
 3xpNYuqkxuPiGKr97h3omononJKEg+O0wGX+sj5JPysmeWhiVP5JqRrQj5wHmziNj4/L
 QJgG857C0LH9ydCr4vHRO1uJRsFOMmkThxNCs0ej1zSBwLgZsYyaq1+/9QaQsFappKAm
 BGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ctHce87cyTKkFSgMaUa0L5K58wzqIkasYwqh+ri8S64=;
 b=lPiZKwrnr/m9ZGAgS2U0fAz1aOZ6ENLtDSUrp3ELNK/8UGFxjNrDZr7ivx/JjXWqOq
 6oyz/lF1CETuKPRB3NKMu2Z+VVZR9yc22np5Es9nQdrtJAui2nP/RZ/im4cLFUOfYsSW
 xtr7pBkcjDgKtGgYFNpIwDzngE4ibsXYmnDIcnoxNaxTpxWzC2eK8fFM11TPTuDlvB30
 Ny75P57HndSXLAMip0LbwZ2cMmZ7ZA39Dbh0IArpjgngSs6lQRM9Exkp/4AsbVDJNh65
 w/+rGerwpiU6tMG95aNbVCkbA90dXp+Wo/kb0aoOqOH2+wRvE9BA9h/z9ZwQ7UQZw/qB
 nNgQ==
X-Gm-Message-State: AGi0PuY33R0hR1RaYhQTPWexuCaXDrZYxDB0DjqqD//OSy3O9bSOI8Sk
 FRhoMRkzsvVB6kgB5k90A7NCzqNaYdQ=
X-Google-Smtp-Source: APiQypJFfnbMsuUPKsXOQYetsK21EvY/czixv5J5WGen/sqOloNVzVmv00KosVTMv2syu52y79nwvw==
X-Received: by 2002:ac8:fea:: with SMTP id f39mr5044980qtk.119.1586306162048; 
 Tue, 07 Apr 2020 17:36:02 -0700 (PDT)
Received: from Mansours-MBP.hsd1.ma.comcast.net
 (c-73-4-29-95.hsd1.ma.comcast.net. [73.4.29.95])
 by smtp.gmail.com with ESMTPSA id o205sm10123374qke.41.2020.04.07.17.36.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Apr 2020 17:36:01 -0700 (PDT)
From: Mansour Ahmadi <mansourweb@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] When updating the PFLASH file contents,
 we should check for a possible failure of blk_pwrite(). Similar to
 3a68829 commit
Date: Tue,  7 Apr 2020 20:35:52 -0400
Message-Id: <20200408003552.58095-1-mansourweb@gmail.com>
X-Mailer: git-send-email 2.16.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::843
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
Cc: Mansour Ahmadi <mansourweb@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mansour Ahmadi <mansourweb@gmail.com>
---
 hw/block/pflash_cfi01.c | 6 +++++-
 hw/block/pflash_cfi02.c | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 24f3bce7ef..31319cfd07 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -399,13 +399,17 @@ static void pflash_update(PFlashCFI01 *pfl, int offset,
                           int size)
 {
     int offset_end;
+    int ret;
     if (pfl->blk) {
         offset_end = offset + size;
         /* widen to sector boundaries */
         offset = QEMU_ALIGN_DOWN(offset, BDRV_SECTOR_SIZE);
         offset_end = QEMU_ALIGN_UP(offset_end, BDRV_SECTOR_SIZE);
-        blk_pwrite(pfl->blk, offset, pfl->storage + offset,
+        ret = blk_pwrite(pfl->blk, offset, pfl->storage + offset,
                    offset_end - offset, 0);
+	if (ret < 0) {
+            error_report("Could not update PFLASH: %s", strerror(-ret));
+        }
     }
 }
 
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 12f18d401a..fee5b3497c 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -393,13 +393,17 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
 static void pflash_update(PFlashCFI02 *pfl, int offset, int size)
 {
     int offset_end;
+    int ret;
     if (pfl->blk) {
         offset_end = offset + size;
         /* widen to sector boundaries */
         offset = QEMU_ALIGN_DOWN(offset, BDRV_SECTOR_SIZE);
         offset_end = QEMU_ALIGN_UP(offset_end, BDRV_SECTOR_SIZE);
-        blk_pwrite(pfl->blk, offset, pfl->storage + offset,
+        ret = blk_pwrite(pfl->blk, offset, pfl->storage + offset,
                    offset_end - offset, 0);
+	if (ret < 0) {
+	    error_report("Could not update PFLASH: %s", strerror(-ret));
+        }
     }
 }
 
-- 
2.16.2


