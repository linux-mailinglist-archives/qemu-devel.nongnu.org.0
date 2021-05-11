Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DFD37ABC4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 18:21:41 +0200 (CEST)
Received: from localhost ([::1]:33920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgV8e-0005Sf-6P
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 12:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgV2m-0004pA-Uj
 for qemu-devel@nongnu.org; Tue, 11 May 2021 12:15:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgV2k-0002je-3J
 for qemu-devel@nongnu.org; Tue, 11 May 2021 12:15:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620749733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6CFSni+4vz0cgF3Gg/EQbT91OiEpSWI1f9QDUFXctQg=;
 b=Gblfj7HzcnWNkef1PlWMt2/e6mnPc+Dgk/RtZwJbfBOUaCOxtxt0EpuEbR4zSHkQgs3czg
 +DOySpONyMbsUFW2lKbaG4XZp3AHRNLpP1y1rh+jQ9uG5HNM1WxVWc/a5wbs7wVv4iIqqd
 FZj9dmgYqbAhZi+2k6V9v45Gae52/mE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-SvTwBE4SM1y1hqJ41K2g0Q-1; Tue, 11 May 2021 12:15:32 -0400
X-MC-Unique: SvTwBE4SM1y1hqJ41K2g0Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 b16-20020a7bc2500000b029014587f5376dso596901wmj.1
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 09:15:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6CFSni+4vz0cgF3Gg/EQbT91OiEpSWI1f9QDUFXctQg=;
 b=ZK4EqaT4YhA1jR88DSiif5v4QEcZPSNWWOFpLjcD8pT4lXOk3FPsOws/vineccwhUY
 IK3t6aFAumiRaUg110tJqMdVUCI6dxkM1Ub0e9D888IDYI8Sfm58vybPYZlRIGuagXg4
 TI383JZ7yn7q5abYjovTBR4MSmMu5dqNaEU9Tyso8yAxtX5G97dzWUyZH4M7JSfI5lSR
 M+YEowEd0lT0u51daQ4k/1aCWG9J2XlF6NIM1jIwR+PD/Zgqc1/eORjbv+FEWtOnWZpc
 3IjWBSQAnnj2fTBXkEqZudC61mis/1z9BJt9CGOc7vZVjFYV3cAi8lVi1pAmq/5RAHTk
 rq8g==
X-Gm-Message-State: AOAM530odKuwYe7tICPaiwcfHFjco6eG/64pXZTm8tUerHRpfPOraouY
 ESemtJHf9skUgV3Ndo9ywuXx89xawo/BK/T7GdJ2i+p1tpgmbwQ1uJv0bXdwV9pPK6SL78dR5Xr
 Fkpu+Fy+k0XNtywo6vxvMLXXA8IW60ptDCuiKFFF8sRPVeMLzmDSX+c+yzJ5CYQDR
X-Received: by 2002:a1c:ed03:: with SMTP id l3mr34283984wmh.130.1620749730699; 
 Tue, 11 May 2021 09:15:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypdBC3zwxV3pXWEzX8zLL/KpN3ukckNzsQ2rxjQQKAw4qn7KwdsmtsjqKZmrqyNJxMV8yEWw==
X-Received: by 2002:a1c:ed03:: with SMTP id l3mr34283945wmh.130.1620749730346; 
 Tue, 11 May 2021 09:15:30 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id w22sm3588180wmc.13.2021.05.11.09.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 09:15:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] hw/block/pflash_cfi02: Do not create aliases when not
 necessary
Date: Tue, 11 May 2021 18:15:04 +0200
Message-Id: <20210511161504.3076204-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511161504.3076204-1-philmd@redhat.com>
References: <20210511161504.3076204-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When no mapping is requested, it is pointless to create
alias regions.
Only create them when multiple mappings are requested to
simplify the memory layout. The flatview is not changed.

For example using 'qemu-system-sh4 -M r2d -S -monitor stdio',

* before:

  (qemu) info mtree
  address-space: memory
    0000000000000000-ffffffffffffffff (prio 0, i/o): system
      0000000000000000-0000000000ffffff (prio 0, i/o): pflash
        0000000000000000-0000000000ffffff (prio 0, romd): alias pflash-alias @r2d.flash 0000000000000000-0000000000ffffff
      0000000004000000-000000000400003f (prio 0, i/o): r2d-fpga
      000000000c000000-000000000fffffff (prio 0, ram): r2d.sdram
  (qemu) info mtree -f
  FlatView #0
   AS "memory", root: system
   AS "cpu-memory-0", root: system
   Root memory region: system
    0000000000000000-0000000000ffffff (prio 0, romd): r2d.flash
    0000000004000000-000000000400003f (prio 0, i/o): r2d-fpga
    000000000c000000-000000000fffffff (prio 0, ram): r2d.sdram

* after:

  (qemu) info mtree
  address-space: memory
    0000000000000000-ffffffffffffffff (prio 0, i/o): system
      0000000000000000-0000000000ffffff (prio 0, romd): r2d.flash
      0000000004000000-000000000400003f (prio 0, i/o): r2d-fpga
      000000000c000000-000000000fffffff (prio 0, ram): r2d.sdram
  (qemu) info mtree -f
  FlatView #0
   AS "memory", root: system
   AS "cpu-memory-0", root: system
   Root memory region: system
    0000000000000000-0000000000ffffff (prio 0, romd): r2d.flash
    0000000004000000-000000000400003f (prio 0, i/o): r2d-fpga
    000000000c000000-000000000fffffff (prio 0, ram): r2d.sdram

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210325120921.858993-3-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 35e30bb812c..02c514fb6e0 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -917,8 +917,12 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
     pfl->sector_erase_map = bitmap_new(pfl->total_sectors);
 
     pfl->rom_mode = true;
-    pflash_setup_mappings(pfl);
-    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
+    if (pfl->mappings > 1) {
+        pflash_setup_mappings(pfl);
+        sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
+    } else {
+        sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->orig_mem);
+    }
 
     timer_init_ns(&pfl->timer, QEMU_CLOCK_VIRTUAL, pflash_timer, pfl);
     pfl->status = 0;
-- 
2.26.3


