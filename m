Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4CD41A60E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 05:27:29 +0200 (CEST)
Received: from localhost ([::1]:39154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV3mC-0002wg-Ga
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 23:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8905f295c3=pdel@fb.com>)
 id 1mV3jx-0001WH-T1
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 23:25:11 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:24520
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8905f295c3=pdel@fb.com>)
 id 1mV3jw-0000Y1-7T
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 23:25:09 -0400
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.1.2/8.16.1.2) with SMTP id 18RKsUdQ027855
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 20:25:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=IJVftBwx/9vd0geEQFhNFGLdWweGYHUjf3fRvTCOUh8=;
 b=cNHPBDe98kifbES54tpsM98ITNJ6ZgdPiazAgPJT0a3k4rC0agPky/GBnuRveZMqGEFN
 qLK3QWVRTfwUniJASeOM3PXLBpP9G06Ef6k3ucc0/PxjBXhxhUrLdvarJp9nJ0qGOG4r
 n2sWJ3MlRICUkKjtkM+XczvdlMF6d+10eaY= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0089730.ppops.net with ESMTP id 3bbja2uhns-18
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 20:25:06 -0700
Received: from intmgw001.27.prn2.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c085:11d::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Mon, 27 Sep 2021 20:25:03 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id EE43843602FB; Mon, 27 Sep 2021 20:24:57 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <clg@kaod.org>, <joel@jms.id.au>, <rashmica.g@gmail.com>,
 <patrick@stwcx.xyz>, <qemu-devel@nongnu.org>, <f4bug@amsat.org>, Peter
 Delevoryas <pdel@fb.com>
Subject: [PATCH 1/1] hw: aspeed_gpio: Fix pin I/O type declarations
Date: Mon, 27 Sep 2021 20:24:56 -0700
Message-ID: <20210928032456.3192603-2-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928032456.3192603-1-pdel@fb.com>
References: <20210928032456.3192603-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-FB-Source: Intern
X-Proofpoint-ORIG-GUID: M2HfmuahXq5MpnFhSBrjsfnVpwR2Eadt
X-Proofpoint-GUID: M2HfmuahXq5MpnFhSBrjsfnVpwR2Eadt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-27_07,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 mlxlogscore=732 mlxscore=0
 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109280023
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=8905f295c3=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Delevoryas <pdel@fb.com>

Some of the pin declarations in the Aspeed GPIO module were incorrect,
probably because of confusion over which bits in the input and output
uint32_t's correspond to which groups in the label array. Since the
uint32_t literals are in big endian, it's sort of the opposite of what
would be intuitive. The least significant bit in ast2500_set_props[6]
corresponds to GPIOY0, not GPIOAB7.

GPIOxx indicates input and output capabilities, GPIxx indicates only
input, GPOxx indicates only output.

AST2500:
- Previously had GPIW0..GPIW7 and GPIX0..GPIX7, that's correct.
- Previously had GPIOY0..GPIOY3, should have been GPIOY0..GPIOY7.
- Previously had GPIOAB0..GPIOAB3 and GPIAB4..GPIAB7, should only have
  been GPIOAB0..GPIOAB3.

AST2600:
- GPIOT0..GPIOT7 should have been GPIT0..GPIT7.
- GPIOU0..GPIOU7 should have been GPIU0..GPIU7.
- GPIW0..GPIW7 should have been GPIOW0..GPIOW7.
- GPIOY0..GPIOY7 and GPIOZ0...GPIOZ7 were disabled.

Fixes: 4b7f956862dc2db4c5c ("hw/gpio: Add basic Aspeed GPIO model for AST=
2400 and AST2500")
Fixes: 36d737ee82b2972167e ("hw/gpio: Add in AST2600 specific implementat=
ion")
Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/gpio/aspeed_gpio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index dfa6d6cb40..33a40a624a 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -796,7 +796,7 @@ static const GPIOSetProperties ast2500_set_props[] =3D=
 {
     [3] =3D {0xffffffff,  0xffffffff,  {"M", "N", "O", "P"} },
     [4] =3D {0xffffffff,  0xffffffff,  {"Q", "R", "S", "T"} },
     [5] =3D {0xffffffff,  0x0000ffff,  {"U", "V", "W", "X"} },
-    [6] =3D {0xffffff0f,  0x0fffff0f,  {"Y", "Z", "AA", "AB"} },
+    [6] =3D {0x0fffffff,  0x0fffffff,  {"Y", "Z", "AA", "AB"} },
     [7] =3D {0x000000ff,  0x000000ff,  {"AC"} },
 };
=20
@@ -805,9 +805,9 @@ static GPIOSetProperties ast2600_3_3v_set_props[] =3D=
 {
     [1] =3D {0xffffffff,  0xffffffff,  {"E", "F", "G", "H"} },
     [2] =3D {0xffffffff,  0xffffffff,  {"I", "J", "K", "L"} },
     [3] =3D {0xffffffff,  0xffffffff,  {"M", "N", "O", "P"} },
-    [4] =3D {0xffffffff,  0xffffffff,  {"Q", "R", "S", "T"} },
-    [5] =3D {0xffffffff,  0x0000ffff,  {"U", "V", "W", "X"} },
-    [6] =3D {0xffff0000,  0x0fff0000,  {"Y", "Z", "", ""} },
+    [4] =3D {0xffffffff,  0x00ffffff,  {"Q", "R", "S", "T"} },
+    [5] =3D {0xffffffff,  0xffffff00,  {"U", "V", "W", "X"} },
+    [6] =3D {0x0000ffff,  0x0000ffff,  {"Y", "Z"} },
 };
=20
 static GPIOSetProperties ast2600_1_8v_set_props[] =3D {
--=20
2.30.2


