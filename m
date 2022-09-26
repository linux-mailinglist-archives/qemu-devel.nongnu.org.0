Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44E45EAFFE
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 20:35:16 +0200 (CEST)
Received: from localhost ([::1]:35684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocswl-0006bE-H2
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 14:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4n-0008Ec-BZ; Mon, 26 Sep 2022 13:39:31 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35]:38652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4k-00028P-F0; Mon, 26 Sep 2022 13:39:29 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1278624b7c4so10183344fac.5; 
 Mon, 26 Sep 2022 10:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=3W5wihXh5/uTB6ZcQHXv1GIO5L/PO6INFau93sPuEXE=;
 b=pTwlwLQEU0gzILCJ3zoXp6fJyzqc42RVJUelbix8g/sAxDq7oRFZa+16xM5YHeNQE4
 IGmmDcNmxXcpNqHOQVmvAzyukbmV82OI7HAe4bsKjMNTt+9kvpJVipcC2mFGd9qz4SGd
 V0tfeE5oNyBSzzs4hnx/MU354CPdB7TAofuCb2IGJQFw0wDDvA2y9EYKYnjgo5KgDhkq
 I0eVL1OgmifYgHvVkqF/MOczxHNtecWMB4pPs2/GXrcWYMM0tc1lIxkLdPBoBBPeHMMa
 TfPMjFEdUgQUjAR76BhjEwa5mk/80IKDENthEwPXHn+fwXTDeF2m+NjBB+gll+Z61v/y
 IbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3W5wihXh5/uTB6ZcQHXv1GIO5L/PO6INFau93sPuEXE=;
 b=BY1YdxnnimtX9XBH5nL/hs+T7HPEy9TLINX4kQcKJtkaMl1jqp1gm1vNIAulg/UCyD
 hrNmWL4lz5ovz71WXw16JW6pJB+G8eyhLgS5hP5wadWZye30gYFCkcmkCHjKk4xlX4nv
 4B+lVPXbvCtLg0kDjZrnsbGr1/nzqx2yR9q+HyjNXi7BXYpdU6fQ5I+NN6XwA1awdtu1
 zu715E55NBowYSbHVTCh5jin+wtCTwsocKCyTMj/othz38VeTM1r+au4iqxL6zRuHJFv
 TdelMch1hsfZJvMhZkN4Fz+BxAW0Z54LbMaRvSArPQuR3SDT73C5bFzou3UOj+Udu5Hf
 zUYA==
X-Gm-Message-State: ACrzQf1nHBACGPVq35DtHxmpsk50N+WsdXHtvdxJdaC+dBq34yXxk28D
 eBSc48b4srrfiHKFrCMdMPqI6qTnq70=
X-Google-Smtp-Source: AMsMyM7K6HtwWJMY36Jde7BOVbY1iNmUQs5bLTu9VenrA6HLO9TIG4A4QrxVdU5u5v/83LtvSKDoRQ==
X-Received: by 2002:a05:6870:e2d1:b0:125:f220:750e with SMTP id
 w17-20020a056870e2d100b00125f220750emr12272203oad.74.1664213964537; 
 Mon, 26 Sep 2022 10:39:24 -0700 (PDT)
Received: from balboa.COMFAST (189-68-154-15.dsl.telesp.net.br.
 [189.68.154.15]) by smtp.gmail.com with ESMTPSA id
 m12-20020a0568301e6c00b0061c9ab1032dsm7947165otr.18.2022.09.26.10.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 10:39:24 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v8 11/16] hw/ppc: set machine->fdt in pegasos2_machine_reset()
Date: Mon, 26 Sep 2022 14:38:50 -0300
Message-Id: <20220926173855.1159396-12-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926173855.1159396-1-danielhb413@gmail.com>
References: <20220926173855.1159396-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We'll introduce a QMP/HMP command that requires machine->fdt to be set
properly.

Cc: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-ppc@nongnu.org
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pegasos2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 61f4263953..ecf682b148 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -331,6 +331,10 @@ static void pegasos2_machine_reset(MachineState *machine)
 
     vof_build_dt(fdt, pm->vof);
     vof_client_open_store(fdt, pm->vof, "/chosen", "stdout", "/failsafe");
+
+    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
+    machine->fdt = fdt;
+
     pm->cpu->vhyp = PPC_VIRTUAL_HYPERVISOR(machine);
 }
 
-- 
2.37.3


