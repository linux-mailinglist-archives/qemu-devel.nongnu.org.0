Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A7F369D82
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 01:39:31 +0200 (CEST)
Received: from localhost ([::1]:40214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la5OU-00059I-5E
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 19:39:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1la5M6-0003yH-Lx; Fri, 23 Apr 2021 19:37:02 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1la5M5-0007jy-8B; Fri, 23 Apr 2021 19:37:02 -0400
Received: by mail-wr1-x433.google.com with SMTP id c15so40918359wro.13;
 Fri, 23 Apr 2021 16:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6keiDYxRsK177SqD7A1GjGUaf153R9oEf+ny0xc/KZ4=;
 b=PDnvZeRzJ++nk1KhV2qdWzhCrpjPHLVxjkzgBEEundw/P5bZ4III/mrZ+xbUsDoZ7B
 lZ7OO2Yhp2w1dt//J4vyaRQTWW/ySOoRMMqrBvLyClWJxBXNZYQynfB69a22ZQhQvgxi
 pryH8vZ+nD0atc8TwQcTI0q5EhXCE5PgK/sECtz+fsaf4+pdsxZhXpPCqKDQwJJH+CgF
 vtix9mpDhsZGOgoF03mpc/99TE34ZvV68yDJkXwgTWI7e9UpqI7l90UGHebo/oDsqZNV
 C3x7328cIeh2x6mn9MuwsXNSzPGNDGhM/9DApZIA0IFjsTCYA137mWU5ARVZb4QW9UAZ
 tNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6keiDYxRsK177SqD7A1GjGUaf153R9oEf+ny0xc/KZ4=;
 b=pfMc/AasKP1ikqS/u1tgodPfIvpeVVr2HuTNh2p3RcX9kaAQzT5C4cCy7qw9KTAn6n
 wuuoZ/oe2plJwXLCCaBpFRoXhW/oVtBaZ8Oh2lY+SmIkhE2SlUPLPwerRRmVbgq4cfTG
 HOk+qQdSzyd8ci54bbjMKs229Efu72ase3VkPUe0uHfhIdIY0oklRA34BqJlG2TKG8pX
 d0z2hWlaQdM+wehPnXKVU62SvnEpGFs0t+YX/XgXzC6ei5iDCwZOFSiXdoDTemZu8asg
 oWS/hW/RoUS/4DRPrBGvxRMraI8wqvDk3tAJSR7BPh+ALuRXXiWUBscGfriH0YBXkQ/X
 kNvA==
X-Gm-Message-State: AOAM530pM1z5U9ZNxTlqDuxKQVEke2SKyXRrEqArtWbpH+pip/VMoEU1
 FRvOSl2oke8gYE0hQKfHiCG5fi7c7oZtYg==
X-Google-Smtp-Source: ABdhPJwcCkSc2aXs5CoedqFxTqyTyZ7O1RwkE/wjfo+0YVEnpaMQhxuIJWvlOwOQXf7C5x9GbvVhKg==
X-Received: by 2002:a5d:55cd:: with SMTP id i13mr7512868wrw.393.1619221019431; 
 Fri, 23 Apr 2021 16:36:59 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f7sm10939291wrp.48.2021.04.23.16.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 16:36:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/timer/etraxfs_timer: Qdev'ify reset()
Date: Sat, 24 Apr 2021 01:36:51 +0200
Message-Id: <20210423233652.3042941-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210423233652.3042941-1-f4bug@amsat.org>
References: <20210423233652.3042941-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: qemu-trivial@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TYPE_ETRAX_FS_TIMER is a sysbus device, so its DeviceClass::reset()
handler is called automatically when its qbus parent is reset.
Convert the generic reset to a qdev one, and remove the
qemu_register_reset() call.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/timer/etraxfs_timer.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c
index 5379006086f..3cfab3e3284 100644
--- a/hw/timer/etraxfs_timer.c
+++ b/hw/timer/etraxfs_timer.c
@@ -309,9 +309,9 @@ static const MemoryRegionOps timer_ops = {
     }
 };
 
-static void etraxfs_timer_reset(void *opaque)
+static void etraxfs_timer_reset(DeviceState *dev)
 {
-    ETRAXTimerState *t = opaque;
+    ETRAXTimerState *t = ETRAX_TIMER(dev);
 
     ptimer_transaction_begin(t->ptimer_t0);
     ptimer_stop(t->ptimer_t0);
@@ -343,7 +343,6 @@ static void etraxfs_timer_realize(DeviceState *dev, Error **errp)
     memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t,
                           "etraxfs-timer", 0x5c);
     sysbus_init_mmio(sbd, &t->mmio);
-    qemu_register_reset(etraxfs_timer_reset, t);
 }
 
 static void etraxfs_timer_class_init(ObjectClass *klass, void *data)
@@ -351,6 +350,7 @@ static void etraxfs_timer_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = etraxfs_timer_realize;
+    dc->reset = etraxfs_timer_reset;
 }
 
 static const TypeInfo etraxfs_timer_info = {
-- 
2.26.3


