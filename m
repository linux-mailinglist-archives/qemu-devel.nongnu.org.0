Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 694003E46A4
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:29:54 +0200 (CEST)
Received: from localhost ([::1]:40476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5Lb-0004lA-Ce
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD58g-0004tO-67; Mon, 09 Aug 2021 09:16:23 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:28002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD58e-00050R-Ik; Mon, 09 Aug 2021 09:16:21 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179D4h2n091289; Mon, 9 Aug 2021 09:16:06 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aax6c2mru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 09:16:06 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 179CxR5j030283;
 Mon, 9 Aug 2021 13:16:03 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3a9ht8v1b7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 13:16:03 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 179DG0HO52167052
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 13:16:01 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86F5E11C054;
 Mon,  9 Aug 2021 13:16:00 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2980F11C05E;
 Mon,  9 Aug 2021 13:16:00 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  9 Aug 2021 13:16:00 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.54.114])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 4C30F220032;
 Mon,  9 Aug 2021 15:15:59 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 02/10] watchdog: aspeed: Sanitize control register values
Date: Mon,  9 Aug 2021 15:15:48 +0200
Message-Id: <20210809131556.686260-3-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809131556.686260-1-clg@kaod.org>
References: <20210809131556.686260-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: K61MWtn2aKbqnKgb5JGH8Xy0E6Dnll1K
X-Proofpoint-ORIG-GUID: K61MWtn2aKbqnKgb5JGH8Xy0E6Dnll1K
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_04:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 clxscore=1034 impostorscore=0 malwarescore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108090099
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Jeffery <andrew@aj.id.au>

While some of the critical fields remain the same, there is variation in
the definition of the control register across the SoC generations.
Reserved regions are adjusted, while in other cases the mutability or
behaviour of fields change.

Introduce a callback to sanitize the value on writes to ensure model
behaviour reflects the hardware.

Fixes: 854123bf8d4b ("wdt: Add Aspeed watchdog device model")
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20210709053107.1829304-2-andrew@aj.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/watchdog/wdt_aspeed.h |  1 +
 hw/watchdog/wdt_aspeed.c         | 24 ++++++++++++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_a=
speed.h
index 80b03661e303..f945cd6c5833 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -44,6 +44,7 @@ struct AspeedWDTClass {
     uint32_t reset_ctrl_reg;
     void (*reset_pulse)(AspeedWDTState *s, uint32_t property);
     void (*wdt_reload)(AspeedWDTState *s);
+    uint64_t (*sanitize_ctrl)(uint64_t data);
 };
=20
 #endif /* WDT_ASPEED_H */
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 6352ba1b0e5b..faa3d35fdf21 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -118,13 +118,27 @@ static void aspeed_wdt_reload_1mhz(AspeedWDTState *=
s)
     }
 }
=20
+static uint64_t aspeed_2400_sanitize_ctrl(uint64_t data)
+{
+    return data & 0xffff;
+}
+
+static uint64_t aspeed_2500_sanitize_ctrl(uint64_t data)
+{
+    return (data & ~(0xfUL << 8)) | WDT_CTRL_1MHZ_CLK;
+}
+
+static uint64_t aspeed_2600_sanitize_ctrl(uint64_t data)
+{
+    return data & ~(0x7UL << 7);
+}
=20
 static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
                              unsigned size)
 {
     AspeedWDTState *s =3D ASPEED_WDT(opaque);
     AspeedWDTClass *awc =3D ASPEED_WDT_GET_CLASS(s);
-    bool enable =3D data & WDT_CTRL_ENABLE;
+    bool enable;
=20
     offset >>=3D 2;
=20
@@ -144,6 +158,8 @@ static void aspeed_wdt_write(void *opaque, hwaddr off=
set, uint64_t data,
         }
         break;
     case WDT_CTRL:
+        data =3D awc->sanitize_ctrl(data);
+        enable =3D data & WDT_CTRL_ENABLE;
         if (enable && !aspeed_wdt_is_enabled(s)) {
             s->regs[WDT_CTRL] =3D data;
             awc->wdt_reload(s);
@@ -207,11 +223,12 @@ static const MemoryRegionOps aspeed_wdt_ops =3D {
 static void aspeed_wdt_reset(DeviceState *dev)
 {
     AspeedWDTState *s =3D ASPEED_WDT(dev);
+    AspeedWDTClass *awc =3D ASPEED_WDT_GET_CLASS(s);
=20
     s->regs[WDT_STATUS] =3D 0x3EF1480;
     s->regs[WDT_RELOAD_VALUE] =3D 0x03EF1480;
     s->regs[WDT_RESTART] =3D 0;
-    s->regs[WDT_CTRL] =3D 0;
+    s->regs[WDT_CTRL] =3D awc->sanitize_ctrl(0);
     s->regs[WDT_RESET_WIDTH] =3D 0xFF;
=20
     timer_del(s->timer);
@@ -293,6 +310,7 @@ static void aspeed_2400_wdt_class_init(ObjectClass *k=
lass, void *data)
     awc->ext_pulse_width_mask =3D 0xff;
     awc->reset_ctrl_reg =3D SCU_RESET_CONTROL1;
     awc->wdt_reload =3D aspeed_wdt_reload;
+    awc->sanitize_ctrl =3D aspeed_2400_sanitize_ctrl;
 }
=20
 static const TypeInfo aspeed_2400_wdt_info =3D {
@@ -328,6 +346,7 @@ static void aspeed_2500_wdt_class_init(ObjectClass *k=
lass, void *data)
     awc->reset_ctrl_reg =3D SCU_RESET_CONTROL1;
     awc->reset_pulse =3D aspeed_2500_wdt_reset_pulse;
     awc->wdt_reload =3D aspeed_wdt_reload_1mhz;
+    awc->sanitize_ctrl =3D aspeed_2500_sanitize_ctrl;
 }
=20
 static const TypeInfo aspeed_2500_wdt_info =3D {
@@ -348,6 +367,7 @@ static void aspeed_2600_wdt_class_init(ObjectClass *k=
lass, void *data)
     awc->reset_ctrl_reg =3D AST2600_SCU_RESET_CONTROL1;
     awc->reset_pulse =3D aspeed_2500_wdt_reset_pulse;
     awc->wdt_reload =3D aspeed_wdt_reload_1mhz;
+    awc->sanitize_ctrl =3D aspeed_2600_sanitize_ctrl;
 }
=20
 static const TypeInfo aspeed_2600_wdt_info =3D {
--=20
2.31.1


