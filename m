Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63613354F06
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 10:50:59 +0200 (CEST)
Received: from localhost ([::1]:41038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lThQH-00079T-TX
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 04:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lThOE-0005ry-7f; Tue, 06 Apr 2021 04:48:51 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:47026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lThOC-0006Sd-LD; Tue, 06 Apr 2021 04:48:50 -0400
Received: by mail-ej1-x62d.google.com with SMTP id u21so20610045ejo.13;
 Tue, 06 Apr 2021 01:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ntyr7TYyJdTFK4J5QS09zLzVOFvchaB1RrOhBQzqP5w=;
 b=WCdvUZhmageC5fC+IEIHnPr1LoonD0uC4xyHWdpIZIKJAdm2ZM1dCkXXN1aB4+oHg1
 Mbb9jzrBOssuFJaNJfQ/CroFAfLRXCif6JUDxkahaYk7ycECpX88jNP3ExiK0MJgRNdF
 T4DhReUtppStJRFYqiNucGSMYE1AMeUThipA4QeIzHqa1or8TdN6Uz4inP91I3nYKbiH
 X5xkHECqxOKDC2KpDuNs246d8LHypzPo2fTG9Yhz+68r6hZUKMGm1oG+r3xmk7Q5juCp
 bGSadF4vQI6c9btLTfyZsfD64tdJ0WG+EPZ6W0E/ccyDUZ5CZBMOc2FsSu7GzRAQNbEr
 YpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Ntyr7TYyJdTFK4J5QS09zLzVOFvchaB1RrOhBQzqP5w=;
 b=uTb1yrHH5B3rnClXV0tlGqaJynx2rIBmeGMomD/qpfE/oFyg9AM4r7WIq4cEZhXPTx
 rKsKvOP6R2F42TSB4XaR7WCuH0A4uQrvf6/HSd2ZuMmUUwri28KJ7cDL+YOH08+5KYgg
 DRw1ibVqlTSEwLc6KNo++nV0lOHX04lXbN0mdipfEWhAylMgylko+aczREVPyn7FxJJp
 FEWcyCHppQZWz4uMkYsiw37L9aN6rKoEdCAsyarm63heS+4sokd/PtL6n00IHF0iARuo
 I2QahO83tw7wYgDteMM/AK0r0y73t+pL0e8BJeaL0gTE0AZmBAdvkEurq753mLiO2aWi
 f+lg==
X-Gm-Message-State: AOAM533h5BBfNGVigj3D5PbzSQh1o66u/WPpCd2PfVGmtBLZ32xPI2qp
 UeSrQV8JhUfgdgltMhs3OV0dKc/IyDPxgw==
X-Google-Smtp-Source: ABdhPJxKct85YqBmMakvqfdEGtQP4jy4q5dosVhwX1dyJir32WynyP/fjU4VQOw+CLqlhBnvhjFsXw==
X-Received: by 2002:a17:906:b202:: with SMTP id
 p2mr32904221ejz.244.1617698924679; 
 Tue, 06 Apr 2021 01:48:44 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id dh27sm3625851edb.28.2021.04.06.01.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 01:48:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.0] hw/ppc/mac_newworld: Restrict RAM to 2 GiB
Date: Tue,  6 Apr 2021 10:48:42 +0200
Message-Id: <20210406084842.2859664-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?H=C3=A5vard=20Eidnes?= <he@NetBSD.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mac99 and newer machines, the Uninorth PCI host bridge maps
the PCI hole region at 2GiB, so the RAM area beside 2GiB is not
accessible by the CPU. Restrict the memory to 2GiB to avoid
problems such the one reported in the buglink.

Buglink: https://bugs.launchpad.net/qemu/+bug/1922391
Reported-by: Håvard Eidnes <he@NetBSD.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ppc/mac_newworld.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 21759628466..d88b38e9258 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -157,6 +157,10 @@ static void ppc_core99_init(MachineState *machine)
     }
 
     /* allocate RAM */
+    if (machine->ram_size > 2 * GiB) {
+        error_report("RAM size more than 2 GiB is not supported");
+        exit(1);
+    }
     memory_region_add_subregion(get_system_memory(), 0, machine->ram);
 
     /* allocate and load firmware ROM */
-- 
2.26.3


