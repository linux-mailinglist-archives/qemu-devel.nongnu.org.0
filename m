Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC2438F236
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:25:39 +0200 (CEST)
Received: from localhost ([::1]:45146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llEKg-0008Ot-8I
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llE9d-000277-Vl; Mon, 24 May 2021 13:14:15 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llE9S-0007q0-Gq; Mon, 24 May 2021 13:14:05 -0400
Received: by mail-wr1-x42b.google.com with SMTP id q5so29293044wrs.4;
 Mon, 24 May 2021 10:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DCP7Rkl74fvr8YdkDRqRx/SGO4Zze6JHMull36L2FNY=;
 b=VmhVnwnBzqp0QGrpi2n9G4oibNZ51KVe2gpKBO7Ut0dBYYN/l8wdqkl56c0FfKz6nU
 4sBeYLOMYm9n37JOHmzvW/a6IUea/xf13+LbRrMkpBijMOdgQ2nzw+68rFhRWTbfWZyH
 NJtLSfxHC/HehX9dADCeuAU1/3PVEjy29bBJmve8wrKIXXSqkV8sYxx/eFptu5Yg33Bc
 35znJ26G9cddSFHcmJtr34Dergenb+GzVCPT6HIHnnFz0qJ8j8m074Qlb1WohmVomYVL
 lB/ko009D5uA7BdHMrVNOEuU/ekO0J8r6laYpw77rP3vx8evJCz0RtbYG3qbtEnAUDBw
 qmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=DCP7Rkl74fvr8YdkDRqRx/SGO4Zze6JHMull36L2FNY=;
 b=JItMOr1Q+YF5AGgcA+17cpdaRm3igE06sJX40Z/NYMTE8Z6rKo5tcvmkUw6MwEt99K
 sAnW3w/sN8atdxS5ZKwxhnIqO4a8Ju5Slt6w866bwjXSMswZOJt9dbC23v+cjL7T1M3b
 2lYow7z/k7yNSrnTvuMQJi2FhSVcZF69cS4iBEIldCoP3UnPafJYzgZuDa8Z6akekKuW
 gYVAKP9ofNPUIUKqVB3nGH0uIyh8QJMoZqmZJ39MJ9vA5U6yKqvsxwUl9w4x2CnUVoCf
 FweC+QX8shD8055MHq3KU7vdQ2FbMT7EM/sWgir63+y9R7ht7J7xpChrjROpx7BNPjMh
 ZCYQ==
X-Gm-Message-State: AOAM533AqTbdXfj3xfyfM/x5EAP6IqUL2y5qnorQcCNeE76kf46zVNQq
 Gsmh6IyFZ4nnWDs0SAmG0Apaynz4MFVv6w==
X-Google-Smtp-Source: ABdhPJxo9Drs2hxlsd8KUGVeWxqZrhLde+o/qN7Yj7CzSrc3Hs7GjjjgJUyWYe/bHQr/lTf2+pMUBw==
X-Received: by 2002:a5d:4e91:: with SMTP id e17mr24006465wru.396.1621876439531; 
 Mon, 24 May 2021 10:13:59 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id p6sm8408159wma.4.2021.05.24.10.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 10:13:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/mem/pc-dimm: Hint it is not usable on non-NUMA machines
Date: Mon, 24 May 2021 19:13:52 +0200
Message-Id: <20210524171352.3796151-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: qemu-trivial@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When trying to use the pc-dimm device on a non-NUMA machine, we get:

  $ qemu-system-arm -M none -cpu max -S -device pc-dimm
  Segmentation fault (core dumped)

  (gdb) bt
  #0  pc_dimm_realize (dev=0x555556da3e90, errp=0x7fffffffcd10) at hw/mem/pc-dimm.c:184
  #1  0x0000555555fe1f8f in device_set_realized (obj=0x555556da3e90, value=true, errp=0x7fffffffce18) at hw/core/qdev.c:761
  #2  0x0000555555feb4a9 in property_set_bool (obj=0x555556da3e90, v=0x555556e54420, name=0x5555563c3c41 "realized", opaque=0x555556a704f0, errp=0x7fffffffce18) at qom/object.c:2257

Use a friendler error message instead:

  $ qemu-system-arm -M none -cpu max -S -device pc-dimm
  qemu-system-arm: -device pc-dimm: NUMA is not supported by this machine-type

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mem/pc-dimm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index a3a2560301c..e8851a0c3b1 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -181,8 +181,13 @@ static void pc_dimm_realize(DeviceState *dev, Error **errp)
     PCDIMMDevice *dimm = PC_DIMM(dev);
     PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
     MachineState *ms = MACHINE(qdev_get_machine());
-    int nb_numa_nodes = ms->numa_state->num_nodes;
+    int nb_numa_nodes;
 
+    if (!ms->numa_state) {
+        error_setg(errp, "NUMA is not supported by this machine-type");
+        return;
+    }
+    nb_numa_nodes = ms->numa_state->num_nodes;
     if (!dimm->hostmem) {
         error_setg(errp, "'" PC_DIMM_MEMDEV_PROP "' property is not set");
         return;
-- 
2.26.3


