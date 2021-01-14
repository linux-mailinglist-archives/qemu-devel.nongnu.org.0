Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0992F63F6
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 16:13:52 +0100 (CET)
Received: from localhost ([::1]:49084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l04Jr-0007yc-TO
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 10:13:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l04GC-0005dI-D1; Thu, 14 Jan 2021 10:10:04 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:38353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l04GA-0003uQ-Jk; Thu, 14 Jan 2021 10:10:04 -0500
Received: by mail-pl1-x62d.google.com with SMTP id d4so3042840plh.5;
 Thu, 14 Jan 2021 07:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mcBcS27E7c3TjZqbOJS0mQTFgaIbVwGSQqShb6dbs/E=;
 b=kAi+y4lz0UEsutVIpcmIb3cNFI8k5mtS7qxcjQzPOJNc3XgHH5k4+mvi7eCWKTH21s
 WhET6X+FFwRDkLQdHGzgL8CzszunUMBoPA9PvrZi/c474reKr2fe8E5x8nNO0IwTEoUh
 /Mty/mF1ITZgIE+b1hOz6oxRQ0ZJWNM+cBeA3VFdMOysLxlYJbcBbKvPm4fY209y0yLI
 I7lPito7aZPF7C66LXl76bRhvH77bClKmv+PO7s62FdeCWhqDEh0tb0krPb0af+wnBJE
 mXHOTxR+Ls2YuCbihTbSkaXwLiCh0C2gfzBBP2DcKe7RQmKmGbwBhTojzzM4EWikZas4
 /k/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mcBcS27E7c3TjZqbOJS0mQTFgaIbVwGSQqShb6dbs/E=;
 b=QA2xakFgO0pSjXDmrA7ZXYo6WXGJyvDsin1YkuBsbJ/Zr9jWow79ZIyiTDpxq3g9qG
 7iuN3cjHaFiqR11uA3eVmIrb0bNQBYjV4OQr8sTLsKRm18Zvo2yUqeyTx87po/TLVX2x
 mfYHdaQNI1WpaVjjLSK4leSNPQd4lBYopO+rZmJpQzVeR0v83gMcNgnamg//vbpTX83q
 txtPzkes+Z8RXwiN3plFud1g52DN5etph6udL33Gf1iSDdLaQzSJpcafiPTOED4wge7C
 2YaexHMS14hPMCfQR9k/YHfzy14Y4Cp6cZmuVOZNn6IlH1uuNoslKpHfpFSrI3y7s08O
 QQKw==
X-Gm-Message-State: AOAM5316ZIFu+G5KdwBwrpGcJytsKqf6508DMuynw/T4UyzTLu775kcK
 IeKKU9YgUxjAcQgY5505/2o=
X-Google-Smtp-Source: ABdhPJz+v2xYDIBJJ35UHwRTzmHd4sl+fQlhdjweWQjJL0BJszcprNAlwmvMdnn1THMJFik2kPMr1A==
X-Received: by 2002:a17:90a:e006:: with SMTP id
 u6mr5192404pjy.201.1610637001064; 
 Thu, 14 Jan 2021 07:10:01 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id w21sm5372051pfq.67.2021.01.14.07.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 07:10:00 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>
Subject: [PATCH 3/9] hw/block: m25p80: Fix the number of dummy bytes needed
 for Macronix flashes
Date: Thu, 14 Jan 2021 23:08:56 +0800
Message-Id: <20210114150902.11515-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114150902.11515-1-bmeng.cn@gmail.com>
References: <20210114150902.11515-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62d.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Marcin Krzeminski <marcin.krzeminski@nokia.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Per datasheet [1], the number of dummy cycles for Macronix flashes
is configurable via two volatible bits (DC1, DC2) in a configuration
register.

Do the same dummy cycle to dummy byte conversion fix as others.

[1] https://www.macronix.com/Lists/Datasheet/Attachments/7674/MX66U51235F,%201.8V,%20512Mb,%20v1.1.pdf

Fixes: cf6f1efe0b57 ("m25p80: Fast read commands family changes")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/block/m25p80.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index c8cd12a6d3..44508b3da9 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -949,10 +949,10 @@ static void decode_fast_read_cmd(Flash *s)
         break;
     case MAN_MACRONIX:
         if (extract32(s->volatile_cfg, 6, 2) == 1) {
-            s->needed_bytes += 6;
-        } else {
-            s->needed_bytes += 8;
+            qemu_log_mask(LOG_UNIMP,
+                          "M25P80: the number of dummy bits is not multiple of 8");
         }
+        s->needed_bytes += 1;
         break;
     case MAN_SPANSION:
         s->needed_bytes += extract32(s->spansion_cr2v,
@@ -989,13 +989,14 @@ static void decode_dio_read_cmd(Flash *s)
     case MAN_MACRONIX:
         switch (extract32(s->volatile_cfg, 6, 2)) {
         case 1:
-            s->needed_bytes += 6;
-            break;
+            qemu_log_mask(LOG_UNIMP,
+                          "M25P80: the number of dummy bits is not multiple of 8");
+        /* fall-through */
         case 2:
-            s->needed_bytes += 8;
+            s->needed_bytes += 2;
             break;
         default:
-            s->needed_bytes += 4;
+            s->needed_bytes += 1;
             break;
         }
         break;
@@ -1028,13 +1029,13 @@ static void decode_qio_read_cmd(Flash *s)
     case MAN_MACRONIX:
         switch (extract32(s->volatile_cfg, 6, 2)) {
         case 1:
-            s->needed_bytes += 4;
+            s->needed_bytes += 2;
             break;
         case 2:
-            s->needed_bytes += 8;
+            s->needed_bytes += 4;
             break;
         default:
-            s->needed_bytes += 6;
+            s->needed_bytes += 3;
             break;
         }
         break;
-- 
2.25.1


