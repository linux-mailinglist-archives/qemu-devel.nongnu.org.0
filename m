Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B97082CFBA9
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 16:10:35 +0100 (CET)
Received: from localhost ([::1]:40214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klZCk-0000sJ-8K
	for lists+qemu-devel@lfdr.de; Sat, 05 Dec 2020 10:10:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1klZBN-0008JI-KA
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 10:09:09 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:46223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1klZBL-0002jT-Qp
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 10:09:09 -0500
Received: by mail-ej1-x644.google.com with SMTP id bo9so12975547ejb.13
 for <qemu-devel@nongnu.org>; Sat, 05 Dec 2020 07:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=crREQeqOxchj14ePKrTFZ0Am1N1Q+elCMcIAzZWPF6c=;
 b=IedKKtf9kkyzZvrRzmZ4p2RYZnugxuezHR+FUdirmUCLlwvgMxPV3NKMPFVUmiXWQ4
 HoZyw2ua2P4/yw/wpqwqwiXWS7sgj9jedGUxmW3Pq3GbdqJiRHES5zVxn8Zk1vwU+dV3
 hzIY2dXLcswPuvaPynIm61fbSrXwJoGMYJKYYisOfHGnMGo4fa+GYuJPzVy2aJN12+Fx
 in1ZXAR+CVGa1vqtvs0i/qLcQXjFlWqofBy4LR6XEaUdbgA/s5bF91GmwsEARIYbiYvo
 iBiH4XPKUrAC9oQSoAb2iKqjSiUj3mstJ0ZN6OMndcpn7bURMSl6sneYAn+k9kEuwgDi
 2tMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=crREQeqOxchj14ePKrTFZ0Am1N1Q+elCMcIAzZWPF6c=;
 b=jh6iGj8m+qn8xBKM01FPaGOWvh8R/XbfXzvCZeje/wFNCbCIsPAifquhBU4N7S22E8
 Am5FYmTqgLl4VEDnfe87eLY7QMDfk3UGmHk6TbppcJWzQyT39HoIDJAHUDruFAvPMFg2
 S0PdQL5uJA9eDNegvVmuMhN0173eAaHD1thZig0KagtumMIim/tgQUwqi1+KwDf5wb2n
 +V71VDoerr7Kf/9PBdtbcqyqUDmITJWK2zQdS5dPt56JiGtQl6EquLhVC/DiCDU44XBa
 JlMDxTTFiavQFoqTa3s458O6wItehUSdX2nMXlGcietJbYeedRKdhH/zeEB0TxPsLO93
 pAWw==
X-Gm-Message-State: AOAM533AYmrIkXHRTyhC7p3kH1mtKa1GDU7N6pYyuTVOnXIN1kUqEpme
 u+bmmIyrOLjfS/E01QGHtayuPdp/ytc=
X-Google-Smtp-Source: ABdhPJxweYLDBbaNeL8rGh9Z/kOLWcPov/cF2etsn0ClE0cwV179Djy+EDopnDInKFGKT8BBxN0zJg==
X-Received: by 2002:a17:906:8617:: with SMTP id
 o23mr11821915ejx.274.1607180945900; 
 Sat, 05 Dec 2020 07:09:05 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id bg4sm5437959ejb.24.2020.12.05.07.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Dec 2020 07:09:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/timer/slavio_timer: Allow 64-bit accesses
Date: Sat,  5 Dec 2020 16:09:03 +0100
Message-Id: <20201205150903.3062711-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x644.google.com
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
Cc: Benoit Canet <benoit.canet@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yap KV <yapkv@yahoo.com>, 1906905@bugs.launchpad.net,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the "NCR89C105 Chip Specification" referenced in the header:

                  Chip-level Address Map

  ------------------------------------------------------------------
  | 1D0 0000 ->   | Counter/Timers                        | W,D    |
  |   1DF FFFF    |                                       |        |
  ...

  The address map indicated the allowed accesses at each address.
  [...] W indicates a word access, and D indicates a double-word
  access.

The SLAVIO timer controller is implemented expecting 32-bit accesses.
Commit a3d12d073e1 restricted the memory accesses to 32-bit, while
the device allows 64-bit accesses.

This was not an issue until commit 5d971f9e67 which reverted
("memory: accept mismatching sizes in memory_region_access_valid").

Fix by renaming .valid MemoryRegionOps as .impl, and add the valid
access range (W -> 4, D -> 8).

Since commit 21786c7e598 ("memory: Log invalid memory accesses")
this class of bug can be quickly debugged displaying 'guest_errors'
accesses, as:

  $ qemu-system-sparc -M SS-20 -m 256 -bios ss20_v2.25_rom -serial stdio -d guest_errors

  Power-ON Reset
  Invalid access at addr 0x0, size 8, region 'timer-1', reason: invalid size (min:4 max:4)

  $ qemu-system-sparc -M SS-20 -m 256 -bios ss20_v2.25_rom -monitor stdio -S
  (qemu) info mtree
  address-space: memory
    0000000000000000-ffffffffffffffff (prio 0, i/o): system
      ...
      0000000ff1300000-0000000ff130000f (prio 0, i/o): timer-1
             ^^^^^^^^^                                 ^^^^^^^
                   \ memory region base address and name /

  (qemu) info qtree
  bus: main-system-bus
    dev: slavio_timer, id ""              <-- device type name
      gpio-out "sysbus-irq" 17
      num_cpus = 1 (0x1)
      mmio 0000000ff1310000/0000000000000014
      mmio 0000000ff1300000/0000000000000010 <--- base address
      mmio 0000000ff1301000/0000000000000010
      mmio 0000000ff1302000/0000000000000010
      ...

Reported-by: Yap KV <yapkv@yahoo.com>
Buglink: https://bugs.launchpad.net/bugs/1906905
Fixes: a3d12d073e1 ("slavio_timer: convert to memory API")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Benoit Canet <benoit.canet@gmail.com>
Cc: <1906905@bugs.launchpad.net>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/timer/slavio_timer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/timer/slavio_timer.c b/hw/timer/slavio_timer.c
index 5b2d20cb6a5..03e33fc5926 100644
--- a/hw/timer/slavio_timer.c
+++ b/hw/timer/slavio_timer.c
@@ -331,6 +331,10 @@ static const MemoryRegionOps slavio_timer_mem_ops = {
     .write = slavio_timer_mem_writel,
     .endianness = DEVICE_NATIVE_ENDIAN,
     .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
+    .impl = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
-- 
2.26.2


