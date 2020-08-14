Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82512245158
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Aug 2020 18:06:46 +0200 (CEST)
Received: from localhost ([::1]:39926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6yhh-0004t0-31
	for lists+qemu-devel@lfdr.de; Sat, 15 Aug 2020 12:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1k6yby-0006yo-A1; Sat, 15 Aug 2020 12:00:50 -0400
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42]:41915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1k6ybw-0001LK-EV; Sat, 15 Aug 2020 12:00:49 -0400
Received: by mail-qv1-xf42.google.com with SMTP id x6so5735278qvr.8;
 Sat, 15 Aug 2020 09:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Um69sg8HoL2/c1AB3vYiKbuiyVa9oHgk/hkuO2orrXQ=;
 b=jQcvkuwXyJfaChFkGLAGliPHoCAosc+iy4NRgLuXYHIyDNs2dCueJ60hgcGuYvS+Ul
 7Vun2/jkqUT+7VSAXorE3k6+mZV2MljUQ/pqxe+WF5l1lbhXlsFxyDUFTvRJkY36BxKB
 FTxoq0FzlunTh7d1uObl7UQq1A3/54H8DyOFFJUbQjOWxHQgiKwFZPGb2DOhv2w+xU3v
 O7P806GcNlVFWcJL+2nKx5sNxF7M5n6DrBhD/pIwQpIAQZNyJRVZ+GycnESficKEAfX4
 BnaYJ3SXaB4q7KLxTG5Y+y+aHoaFsplJ0QDw/AbvF7V1hOiB+c5ATpBBPwTCYMzR8lAQ
 ufjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Um69sg8HoL2/c1AB3vYiKbuiyVa9oHgk/hkuO2orrXQ=;
 b=XpHX2FDJgaywGp+eDOtCvVkDSInIsTSrg4x08o1TdHlPrxXFFQ0Lyx8jiLiH39x90K
 0ZBCz3NMXYoYAlPSC4xajtTgxpw0jHSnwbHPYfgdpLPtnYbIggOzbzjqjIHL/q+mQAS3
 a/wBA2drXWw8a+v0TErg3HCG8eBS3TPAednH+ML5dLcWcR8RgiN1KBGR1VUN2sL6peUZ
 AtemOSFXF3z4DRo0o/wQfa1ZG/DlViQ3/eJm3SoIn/HCU+VWZGxfEFbnqpmHkKDHxK9Q
 ff9qrk9tadOaic4rxuHFAcSaC1v/TUfsGAih5C8tLyequoHx+e6xQSKZumKAQxzqr6yb
 HSrw==
X-Gm-Message-State: AOAM5323A8K6LcrclOxDvIRhrQvLSQ/y+K9o5nAbuZrqyBr7p1dJxisz
 vRFmyI31+aSfoBkaFh3tEafAYQ2HcCDLrw==
X-Google-Smtp-Source: ABdhPJxI9GeeMFy4OpUaiMnhDsnNns4UgtoBTYfoJsPylejvD8+TLhy6yxrwV2XH0wMrzowvL+rexA==
X-Received: by 2002:a0c:f687:: with SMTP id p7mr4248832qvn.249.1597438487929; 
 Fri, 14 Aug 2020 13:54:47 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:303f:d1dc:35d8:e9f6:c8b])
 by smtp.gmail.com with ESMTPSA id p33sm12301018qtp.49.2020.08.14.13.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 13:54:47 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/10] spapr: allow 4 NUMA levels in ibm,
 associativity-reference-points
Date: Fri, 14 Aug 2020 17:54:20 -0300
Message-Id: <20200814205424.543857-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200814205424.543857-1-danielhb413@gmail.com>
References: <20200814205424.543857-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f42;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The value of ibm,associativity-reference-points is in sync with
what Skiboot does. It's a three level NUMA configuration where
the first two levels references the same associativity index
(0x4), meaning that the next distance after the local_distance
(10) is two orders away (a '40' value in the Linux kernel). The
third level (0x2) was added to allow NVLink GPUs to be placed
outside of the same associativity domain of the regular
NUMA nodes. However, we have to deal with the possibility of
user customization of the NUMA distances, something that
Skiboot doesn't need to, and this current scheme is too
tight.

The next step to give users more flexibility is to define 4
distinct NUMA levels, allowing for 5 discrete values of
distances (10, 20, 40, 80 and 160 as seen by the kernel).

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index b0c4b80a23..bc51d2db90 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -906,8 +906,9 @@ static void spapr_dt_rtas(SpaprMachineState *spapr, void *fdt)
     GString *qemu_hypertas = g_string_sized_new(256);
     uint32_t refpoints[] = {
         cpu_to_be32(0x4),
-        cpu_to_be32(0x4),
+        cpu_to_be32(0x3),
         cpu_to_be32(0x2),
+        cpu_to_be32(0x1),
     };
     uint32_t nr_refpoints = ARRAY_SIZE(refpoints);
     uint64_t max_device_addr = MACHINE(spapr)->device_memory->base +
@@ -970,6 +971,10 @@ static void spapr_dt_rtas(SpaprMachineState *spapr, void *fdt)
     g_string_free(qemu_hypertas, TRUE);
 
     if (spapr_machine_using_legacy_numa(spapr)) {
+        refpoints[1] = cpu_to_be32(0x4);
+        refpoints[2] = cpu_to_be32(0x2);
+        nr_refpoints = 3;
+
         maxdomain = cpu_to_be32(spapr->extra_numa_nodes > 1 ? 1 : 0);
         maxdomains[1] = maxdomain;
         maxdomains[2] = maxdomain;
-- 
2.26.2


