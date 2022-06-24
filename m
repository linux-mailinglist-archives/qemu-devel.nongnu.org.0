Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3F3558C69
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 02:48:12 +0200 (CEST)
Received: from localhost ([::1]:46274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4XUZ-0004qz-HS
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 20:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=717463a23e=pdel@fb.com>)
 id 1o4XKF-0008C5-AM
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 20:37:31 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:55320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=717463a23e=pdel@fb.com>)
 id 1o4XK9-0008Bl-J2
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 20:37:28 -0400
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NK2sYg022864
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 17:37:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=pqU3U/WKTpBXAycKcFC2/dg1L0Fb3mBB43V8/WC/pbQ=;
 b=iLWljQCOptd/Wha/sz5rpvAtq/574udeSrGgH/UjpSxDGLv/lovxLUYI81EhHKvRHD08
 xoZS4j/DqjIwEWp8CkwSG525soegOPlhXO7urNNfQKOZNQ5HUgEFCqb4OSrymL42anrb
 EFKOntg8tceywx1ZEDiXwB/kkbJSwrB08fM= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gvn945bk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 17:37:24 -0700
Received: from twshared13315.14.prn3.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 23 Jun 2022 17:37:23 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 35F7988BA298; Thu, 23 Jun 2022 17:37:02 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <clg@kaod.org>, <peter.maydell@linaro.org>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v2 5/8] aspeed: Remove use of qemu_get_cpu
Date: Thu, 23 Jun 2022 17:36:58 -0700
Message-ID: <20220624003701.1363500-6-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624003701.1363500-1-pdel@fb.com>
References: <20220624003701.1363500-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: HsdChOkCxPRspwFC7to9iN0CaLZ80B2g
X-Proofpoint-GUID: HsdChOkCxPRspwFC7to9iN0CaLZ80B2g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-23_11,2022-06-23_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=717463a23e=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed_ast2600.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 8693660271..0656c02889 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -322,7 +322,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
=20
     for (i =3D 0; i < sc->num_cpus; i++) {
         SysBusDevice *sbd =3D SYS_BUS_DEVICE(&s->a7mpcore);
-        DeviceState  *d   =3D DEVICE(qemu_get_cpu(i));
+        DeviceState  *d   =3D DEVICE(&s->cpu[i]);
=20
         irq =3D qdev_get_gpio_in(d, ARM_CPU_IRQ);
         sysbus_connect_irq(sbd, i, irq);
--=20
2.30.2


