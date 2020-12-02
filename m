Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0729D2CBFE1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 15:39:26 +0100 (CET)
Received: from localhost ([::1]:35134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkTHx-000250-4Y
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 09:39:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kkT9p-0002Ou-6i; Wed, 02 Dec 2020 09:31:01 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:46516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kkT9j-0004Gk-Sh; Wed, 02 Dec 2020 09:31:00 -0500
Received: by mail-pl1-x644.google.com with SMTP id v3so1191411plz.13;
 Wed, 02 Dec 2020 06:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fCSRM4U0V+4BUNqV1PmszsQ9Ls80winj6/xSCca3yME=;
 b=YvtLzL/OogqwcIHLWa/9DYdPypsLfR+G+p4xSAGY/Fx/oBNhm7not0zH3TGdVarEXt
 I95JKNyrjr3XX3zvwPD+w3wJFZb+hlfvkuaSBv0pUDLK5cthQru50BlI1xLmhj3QBL/K
 qqyavvyqX65+X7j9NgJ+V35SFDT17OUkVWB6usoiM/E0kUpbaXZVpT//HFqjc3NeELQ2
 Z1wl65/HYFmepULVBMd0GW8hM04KI3CpvToiFXuU1iFTXGLGhFKuPiDjddxGJle1Yhxt
 7b9jmH8zEWuKmSS+HmnJONNPXroOrZnkb6PrvideS430pUFLO5X6J6GExXhDWaQabRH8
 9jKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fCSRM4U0V+4BUNqV1PmszsQ9Ls80winj6/xSCca3yME=;
 b=ouulscJLYfgRoLM7+O2o/3ytNBaVkyMmXnz83PjYeNIkq7yKcwnUWEcID/GYDMBKY7
 z6q1EFpgybizGoMi6s62TnMBLH9ULViTzoDOK75l6QxycDVRXclvIp1t5Cf0tAqws/v4
 ALPymdW9BEDZoSeuqGyTY2RiwvHYNrb6OT2wKQoxL7raZ+exsuitZUXJfH1Fma5I93eW
 Q+rzRXvlcNCCRBI/5bglXE6eNt/Qx516IxPSf1z0hnEfU8L0wtXamOK2d4FtALl56X3i
 vrR9wyWGWuU3tq6MtLhHSpt2J777+pEjyQg4E8lMRnRRPM5e+m08aLQtMGBf7vDFYS4o
 i68g==
X-Gm-Message-State: AOAM531LyVaf8lpKkx3zWFyvQd+R/artO7lCgRKUsbRIdI1pgWDPYRpU
 m8C9SEaFVuum1zg0DqyldBM=
X-Google-Smtp-Source: ABdhPJwJ7a3WKELC24PQKOjfAuxJbGi+bWU1N4sIE97BakU0FFJiLOQY0jwBJ7AGNuexwDau9agWzQ==
X-Received: by 2002:a17:90b:a04:: with SMTP id gg4mr177287pjb.8.1606919453708; 
 Wed, 02 Dec 2020 06:30:53 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id x26sm87958pfn.46.2020.12.02.06.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 06:30:53 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] hw/block: m25p80: Implement AAI-WP command support for SST
 flashes
Date: Wed,  2 Dec 2020 22:30:37 +0800
Message-Id: <20201202143037.24110-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x644.google.com
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Auto Address Increment (AAI) Word-Program is a special command of
SST flashes. AAI-WP allows multiple bytes of data to be programmed
without re-issuing the next sequential address location.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/block/m25p80.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 9b36762df9..f225d9c96d 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -359,6 +359,7 @@ typedef enum {
     QPP_4 = 0x34,
     RDID_90 = 0x90,
     RDID_AB = 0xab,
+    AAI_WP = 0xad,
 
     ERASE_4K = 0x20,
     ERASE4_4K = 0x21,
@@ -449,6 +450,7 @@ struct Flash {
     bool four_bytes_address_mode;
     bool reset_enable;
     bool quad_enable;
+    bool aai_enable;
     uint8_t ear;
 
     int64_t dirty_page;
@@ -661,6 +663,7 @@ static void complete_collecting_data(Flash *s)
     case PP:
     case PP4:
     case PP4_4:
+    case AAI_WP:
         s->state = STATE_PAGE_PROGRAM;
         break;
     case READ:
@@ -1010,6 +1013,9 @@ static void decode_new_cmd(Flash *s, uint32_t value)
 
     case WRDI:
         s->write_enable = false;
+        if (get_man(s) == MAN_SST) {
+            s->aai_enable = false;
+        }
         break;
     case WREN:
         s->write_enable = true;
@@ -1162,6 +1168,17 @@ static void decode_new_cmd(Flash *s, uint32_t value)
     case RSTQIO:
         s->quad_enable = false;
         break;
+    case AAI_WP:
+        if (get_man(s) == MAN_SST && s->write_enable) {
+            if (s->aai_enable) {
+                s->state = STATE_PAGE_PROGRAM;
+            } else {
+                s->aai_enable = true;
+                s->needed_bytes = get_addr_length(s);
+                s->state = STATE_COLLECTING_DATA;
+            }
+        }
+        break;
     default:
         s->pos = 0;
         s->len = 1;
-- 
2.25.1


