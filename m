Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 619981878F5
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 06:06:51 +0100 (CET)
Received: from localhost ([::1]:52900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jE4RG-0002R1-Dc
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 01:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50081)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <npiggin@gmail.com>) id 1jE4O6-000792-IV
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 01:03:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <npiggin@gmail.com>) id 1jE4O4-00038u-Ty
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 01:03:34 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:34938)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <npiggin@gmail.com>)
 id 1jE4O1-0002q8-HJ; Tue, 17 Mar 2020 01:03:29 -0400
Received: by mail-pl1-x643.google.com with SMTP id g6so9076270plt.2;
 Mon, 16 Mar 2020 22:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xSf0EPD7sy/azhxGNjVBtSt1UwU5MPu4W81JLtbmm90=;
 b=DxldPo+re8cYJKqJ1DvVqY4MRZvoOD1upqfxETcDXt6AsS7Q2ZxVDV7T+Hgkc3MpwI
 YUAn4WLuoAjzjsRWOyghBSfg3Abfek6ycW6n/RMkt0895CTXi+nb2JIC8VBCiO72OUv7
 j3RBP/tQiM819iEVo2Tt3LUZ1QeDSpHe53eI0Xc3YrbXRT2khMc8y8LfBpgFyWzCoOav
 u5R+Fy7MggH6TH5Veub2njAC9C2alirkoenm5BVot9rKBXCjVBq4sFZVOiViPyCfioNg
 esDFa0soae8J3X/99jAz2gQMMFVvrvecwzR3E/Dq43gc+5/Ei6p0LMUo5fWJqEsuFm3f
 mz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xSf0EPD7sy/azhxGNjVBtSt1UwU5MPu4W81JLtbmm90=;
 b=CPqX/SgJcKaYPsV4nZNnMDCAZmR6IXrtVYUEh32UvwS814PbiDnL3/AM1x1zgf4V63
 FSjtYP9M5+ccosV0SHR7bzd/gsJVnkRtMXMGnuBQfWaiiuuF0Kx1mqqRlbN8sFZwL081
 TUa+Yk57SswcB0i3mi+dZK+95mrjir3K+SGGp2mVjGK+Qc1QVJ9WZ4hGxVhi01J0reoT
 xjn1i7E5TbXq7RozqJNi6bmdRV8pVvJR3Uc7SPAJ3Bp7T9Y/sowYFWzqEjlZNjSLg9vw
 PSRGc0kv5qsQx5eK595J/ork+Wu/sZgcNIblRoYOU9IjGtxPDFnMfIDlO07rKuhSZwcw
 tQ1w==
X-Gm-Message-State: ANhLgQ2oMslZap0nZGAurg8rKmyDyJF8oIaBjowjKcThFYsNm0S3vb33
 AEcJ09rd9honXnB4hsKpzPdzrrqBemM=
X-Google-Smtp-Source: ADFU+vvs0pn0mbklieTEWcaniq/oMpeWXn5+o/8zG/goaFtCg4lwfZEnMVCS3a6ZTjNv+87iCqLeXg==
X-Received: by 2002:a17:90a:fa11:: with SMTP id
 cm17mr3378361pjb.78.1584421408344; 
 Mon, 16 Mar 2020 22:03:28 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-202-190-183.tpgi.com.au.
 [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id k67sm994803pga.91.2020.03.16.22.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 22:03:27 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH 4/5] ppc/spapr: Don't kill the guest if a recovered FWNMI
 machine check delivery fails
Date: Tue, 17 Mar 2020 15:02:14 +1000
Message-Id: <20200317050215.159334-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200317050215.159334-1-npiggin@gmail.com>
References: <20200317050215.159334-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
Cc: Aravinda Prasad <arawinda.p@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@fr.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Try to be tolerant of errors if the machine check had been recovered
by the host.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/spapr_events.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index d35151eeb0..3f524cb0ca 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -807,13 +807,20 @@ static void spapr_mce_dispatch_elog(PowerPCCPU *cpu, bool recovered)
     /* get rtas addr from fdt */
     rtas_addr = spapr_get_rtas_addr();
     if (!rtas_addr) {
-        warn_report("FWNMI: Unable to deliver machine check to guest: "
-                    "rtas_addr not found.");
-        qemu_system_guest_panicked(NULL);
+        if (!recovered) {
+            warn_report("FWNMI: Unable to deliver machine check to guest: "
+                        "rtas_addr not found.");
+            qemu_system_guest_panicked(NULL);
+        } else {
+            warn_report("FWNMI: Unable to deliver machine check to guest: "
+                        "rtas_addr not found. Machine check recovered.");
+        }
         g_free(ext_elog);
         return;
     }
 
+    spapr->fwnmi_machine_check_interlock = cpu->vcpu_id;
+
     stq_be_phys(&address_space_memory, rtas_addr + RTAS_ERROR_LOG_OFFSET,
                 env->gpr[3]);
     cpu_physical_memory_write(rtas_addr + RTAS_ERROR_LOG_OFFSET +
@@ -850,9 +857,14 @@ void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered)
          * that CPU called "ibm,nmi-interlock")
          */
         if (spapr->fwnmi_machine_check_interlock == cpu->vcpu_id) {
-            warn_report("FWNMI: Unable to deliver machine check to guest: "
-                        "nested machine check.");
-            qemu_system_guest_panicked(NULL);
+            if (!recovered) {
+                warn_report("FWNMI: Unable to deliver machine check to guest: "
+                            "nested machine check.");
+                qemu_system_guest_panicked(NULL);
+            } else {
+                warn_report("FWNMI: Unable to deliver machine check to guest: "
+                            "nested machine check. Machine check recovered.");
+            }
             return;
         }
         qemu_cond_wait_iothread(&spapr->fwnmi_machine_check_interlock_cond);
@@ -880,7 +892,6 @@ void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered)
         warn_report("Received a fwnmi while migration was in progress");
     }
 
-    spapr->fwnmi_machine_check_interlock = cpu->vcpu_id;
     spapr_mce_dispatch_elog(cpu, recovered);
 }
 
-- 
2.23.0


