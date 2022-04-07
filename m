Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7454F81BD
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 16:33:13 +0200 (CEST)
Received: from localhost ([::1]:50788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncTCC-0003om-Jb
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 10:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1ncMx2-00047s-3x; Thu, 07 Apr 2022 03:53:08 -0400
Received: from mail-dm6nam10on2060b.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::60b]:40324
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1ncMwz-00050e-Ku; Thu, 07 Apr 2022 03:53:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfZOYx64iXjuMVt0MCSIL7tLjx+h0PG2/QIOTilTjlP4p44r99byhackjMUD3aI0YaLzPOZKPB1bHeVxeRnuqQN9Aukhuk7PeYBNiUJ1AiOXq6RN4Gdrz5ZWIhzC3Ia43m9KrdEkEMZpVzpZAa0dVrVOmK9po0/LUoDXjjpS6H5Y+QRvEZAWr9KvbSw50bwM9p4if3sru7ORW38z0XjZ9+85X8EfiZkmZ+cLZA+7mljBOpVo7fJGvi00E6PX+ir62+azQe/hIDWwPgjc1H3Rwqo4lJnIIiPTnXdJqc+nuZD0GkZ+BQJpn3JFZZG2h4aX3mIvE8AAVQEH+gcgOTIeeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/gRxFs19ufnTZOfc+8+HV7Vdc5FVGWsWZVTPA/99uA=;
 b=Gp372BNHnLEYU5nQW/Lnx/Rwhn0hrxR0dWEzwv2yfYSLFOMccw5cW2ZG1lo6scgZhw3QK04s68ZlhgHgou9oyvfWn8kOJJrEHroQBptWQfvzDoWg2jFrDVU5sH5XFHmvmUltKtIBBziL0m4bs6lDCc2DlvhXArRoLBqFQmehTD1cuvAQmH1h4zfa7z9Pb2MrM1mgusrUZTjnsPmAdDslcMInMxVkaUvEQta+aj9puMw/8I1w1VsINTsffsFF6HmptySSxrhPstDKfRKLTLJrY0VtsICHakQE6JYx1ZO5bs3IC94np/FT3a+pnISauhZdkF3aif4PmHrMH88/iVSzWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/gRxFs19ufnTZOfc+8+HV7Vdc5FVGWsWZVTPA/99uA=;
 b=Qh6maevmwb2PJ2giVcTeMMJxo2TiPqCbxR7cc0KgYuG2OAWhOhrGrjRAKmllXnP2wv2+roGJ3fT5NdwyJTO466je6c/eYpdXSEEit6RWCIAzru9RwY8k+U7e1CDWbV2cjSl9FNJRnmFOmWsZgYGTL78Aha4HmMMxaJZp/Xit5kc=
Received: from BY5PR02MB6354.namprd02.prod.outlook.com (2603:10b6:a03:1fd::12)
 by SN6PR02MB4765.namprd02.prod.outlook.com (2603:10b6:805:9b::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 07:52:57 +0000
Received: from BY5PR02MB6354.namprd02.prod.outlook.com
 ([fe80::3854:75c0:3d7f:299a]) by BY5PR02MB6354.namprd02.prod.outlook.com
 ([fe80::3854:75c0:3d7f:299a%5]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 07:52:57 +0000
From: Frederic Konrad <fkonrad@xilinx.com>
To: Edgar Iglesias <edgari@xilinx.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v1 2/4] hw/arm: versal: Add the Cortex-R5Fs
Thread-Topic: [PATCH v1 2/4] hw/arm: versal: Add the Cortex-R5Fs
Thread-Index: AQHYSd3J0xrbGlFuCEaTpceNHKUMYazkFPVQ
Date: Thu, 7 Apr 2022 07:52:57 +0000
Message-ID: <BY5PR02MB6354E807520390D37D3E78FFCCE69@BY5PR02MB6354.namprd02.prod.outlook.com>
References: <20220406174303.2022038-1-edgar.iglesias@xilinx.com>
 <20220406174303.2022038-3-edgar.iglesias@xilinx.com>
In-Reply-To: <20220406174303.2022038-3-edgar.iglesias@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ec4f926-d6be-4aca-5331-08da186ba155
x-ms-traffictypediagnostic: SN6PR02MB4765:EE_
x-microsoft-antispam-prvs: <SN6PR02MB47655EC7BF70A841BFDFF528CCE69@SN6PR02MB4765.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9p57lT8QES9fvoGcDj1l1m1B8Fy8n0SFn9W75AcEJ5W4h8jYKd7+GwD+GgnT/pNCdGMjrjnw52LpTJL2pdKuLgp+ULfksVABZSVBWpGJL9XPMnpNkpfTykdCeF16kz8QoyQQcFmuKEIx1rCKq0OhVUKWldMIGX5CbS22e3eFlNsqnNUtzhC9UOAWz1y3EQB2vzQtqRf4suVl22T0HN7UgS5+yOlulTMgAk6/cDtPRFgeoaTDZdOqV+x4x0h8WJN08hxLGeWnKknSkQRgG3kiH6CvgefFlTZ3fRJi/HxkOfZ/rLkO9802yuNFz9o3Lytg8250uaj9l97CcZTo/PbkrL3w8AyJB2oR3QZ6E0PvEDitwIVDpMdkzNUhMGLVVCiKD+RNtMp3faNQeOYvYjiLR9ZrSApWNSSJ/9tGzXZIuNTyiiUw38bxSvFq1/XcTLLz0oZ32KJi+SC/rh0gKINkIrJxhYpC8f31Aj2m9mJdiT4BFleMZn+YJB/0RxD/mNDbituXMfTx6Y/MPlLCsagoJba+P0H+KsqPsAmpG/pin4y4xhI8rZ8zE5+IQqGJiYtdW+Ybd7KURo3cwwrCvsLVFVMgreIarHRNzYwhUAG53kxA3EtVfkR3ybnlbUbA3rtun8rtQ7ss9Cd4QFtgJzqRUs4cDLvblVB9dl4w+bM+RgKEUnQFjyuQ6zmMeQoQmdS0XOikMW3CewFMGWUqE60W8Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6354.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(9686003)(71200400001)(55016003)(38100700002)(86362001)(186003)(26005)(6506007)(7696005)(316002)(52536014)(38070700005)(8676002)(8936002)(4326008)(5660300002)(33656002)(122000001)(53546011)(54906003)(110136005)(66476007)(508600001)(66556008)(64756008)(66446008)(2906002)(76116006)(83380400001)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lf1prrsM1lIE+8EP7LvEUj43dZL+FfEKuAlvM6P+K4s0Fh1c7JDeSSkPDUPc?=
 =?us-ascii?Q?1Cr6IS7cQjBZi5NAZRueSjV6l41NK4CYd9G4YCbE76JXkrO5O89Je83BCgPc?=
 =?us-ascii?Q?9FKzFUN6vz3UloxyLFGN1tf9ecrq82/CPsQheGUJhNqQBT4mW0aGDKjqeSOz?=
 =?us-ascii?Q?MQEGMtPY7Wmz60xr43OTmo2AC81+5dWCyGNxkOSXwZ5rgfjKWuw8sv6Z41Vk?=
 =?us-ascii?Q?+pih//ZeInigJQvQ0W6g6ssta4HUBO+WpTqgKhk+SO6LWYolsulsUfwcOQP5?=
 =?us-ascii?Q?2KkU1PrsZQW/9XCFi24tVtSIe273WNlTWl1f/ILyanFWkf8665BL5RMIJfPS?=
 =?us-ascii?Q?Y3eV9psP4N6HuQbEY0Vucneuu9JeAvw1CnuWRpOuIsDp7BgYzAYh2JhGC6zO?=
 =?us-ascii?Q?DPiJIR+rQib01wTIL0uL0EVLVGK5RibcDdN43EYqLmHzAxb2853B7Ojjwj8f?=
 =?us-ascii?Q?UDcXDq/kgUBvFSuhltCByPITYiB/dAGLtanA1jCit/3rwdb/9jmdBKeKIGpc?=
 =?us-ascii?Q?531JT79mV6tYHVJtQh6HdgsEDXfbsJG6Ct7Zw0kZ3iRrQhYXl9+oTF2TE51G?=
 =?us-ascii?Q?3FMjYbeROt+usdz4p6p31ybRKcou3iC7/K5gRBptHaY/emQAl0DjM3KgXB7Z?=
 =?us-ascii?Q?LBofu08vfxBMDOFGKkLlQQFRvK5Xa6d06TRjjKYGDUBt9KhQjfj2HrPTi66v?=
 =?us-ascii?Q?PDeRLq97o5y2qwRxZFidrmkbgpv0D53aoMgCAsmDkD1JA02vem/M1eQX0mTT?=
 =?us-ascii?Q?MDcKUU6jJfpZlhUPnD2bOJvU0UXU9guLQwzRyMyIGOjL9bYZnbCK3W3D59br?=
 =?us-ascii?Q?buOe2+Wwwyat/tsys+1TUvDDmXirFygr4Yg9AxXP2XrL+cq5VjgCZ4xwDEPU?=
 =?us-ascii?Q?O2xyhdjJ2518HyStVxFKVrZ1dAyWD71DQRJr3PAq5U78MOlLL6Ix6kXw8wRJ?=
 =?us-ascii?Q?QTrcU6h6gEyu9r3O6C2lp36f1ciPjaWcbI7fPCaM3K573VriAhjPdO6vnA+Z?=
 =?us-ascii?Q?SE6r3LhJndk49mUlVYPhzvSUj70LbJwDzLWAxoiMDrRCT7nXohypEMIMpkAF?=
 =?us-ascii?Q?FVGnXeKUFk26URI1LkqHlHKENKmxdERsaJdKCSOKogf8a32EhIX1W63if6Rt?=
 =?us-ascii?Q?zJI/6Scdkon616e4feOJlj96fYf2/pzid2HVowhlj0zqIBp2JSxB8PMRURMP?=
 =?us-ascii?Q?GhNyji/oePSI8RwT7XzyBxmFSHipsSK4qIEzH3ZjeIHjw9EMHjy2gY9/jH8x?=
 =?us-ascii?Q?3yV5jcS1W5xSCSFahG+rfLj35oltAC+vuWw4zarOjgXu37pD3Vng1FeZ1b1t?=
 =?us-ascii?Q?zK+Ua8/eeid8qkg1IiNp7XckNDUzGWRMt2jMRylryMq1hH0Wuc7pW0izEojp?=
 =?us-ascii?Q?ChAwID2rf5+2W3tE1016ZRVRex7/t3GVGAuEZ5OrcUdRVLO48Yfck3P0avzG?=
 =?us-ascii?Q?AQJwMVYn6ZyC5DLvSYUkVPwxt+Tk8o006lWzFW5akWefQEMImSFHaEKae8U5?=
 =?us-ascii?Q?nwFq2xGoRI9mjxnyu7pdzsxYnGt8qvmOgKlCha6hWJ9JUAwCZB2Cs5NW4xOj?=
 =?us-ascii?Q?+SJrppFCp/pz9A6t1+2YVyhwSxuSafBP63YFbuIfn/WkAlTCblYq60CLtUzp?=
 =?us-ascii?Q?E4E0XHPCsKU9vOwGaGrNrPvhpFhE58IvPr0CQCQyvwtXiwZiI+BMQlSLcdEn?=
 =?us-ascii?Q?MEREGpJMnrw4W/HZ0eDnxpOHTs5FufGmYYDHe0y0CWmAsNtDg5v55v8cvWHt?=
 =?us-ascii?Q?/u6y73cspA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6354.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec4f926-d6be-4aca-5331-08da186ba155
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2022 07:52:57.3012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RRYciROLTGWJnDcEeKuZ2LyEbt4WpSV2tYlN0BDQSFktEvKM/bEyD2CferPD9bcNX3AZyT4sUy7xttcFJb7Xeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4765
Received-SPF: pass client-ip=2a01:111:f400:7e88::60b;
 envelope-from=fkonrad@xilinx.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 07 Apr 2022 10:25:48 -0400
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
Cc: Francisco Eduardo Iglesias <figlesia@xilinx.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "luc@lmichel.fr" <luc@lmichel.fr>,
 "edgar.iglesias@amd.com" <edgar.iglesias@amd.com>,
 "frasse.iglesias@gmail.com" <frasse.iglesias@gmail.com>,
 "alistair@alistair23.me" <alistair@alistair23.me>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>, Sai Pavan Boddu <saipava@xilinx.com>,
 Edgar Iglesias <edgari@xilinx.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



-----Original Message-----
From: Edgar E. Iglesias <edgar.iglesias@xilinx.com>=20
Sent: 06 April 2022 18:43
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org; peter.maydell@linaro.org; richard.henderson@linaro=
.org; alistair@alistair23.me; luc@lmichel.fr; f4bug@amsat.org; frasse.igles=
ias@gmail.com; Francisco Eduardo Iglesias <figlesia@xilinx.com>; Sai Pavan =
Boddu <saipava@xilinx.com>; Frederic Konrad <fkonrad@xilinx.com>; Edgar Igl=
esias <edgari@xilinx.com>; edgar.iglesias@amd.com
Subject: [PATCH v1 2/4] hw/arm: versal: Add the Cortex-R5Fs

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add the Cortex-R5Fs of the Versal RPU (Real-time Processing Unit) subsystem=
.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/arm/xlnx-versal-virt.c    |  6 +++---
 hw/arm/xlnx-versal.c         | 36 ++++++++++++++++++++++++++++++++++++
 include/hw/arm/xlnx-versal.h | 10 ++++++++++
 3 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c index 7c=
7baff8b7..66a2de7e13 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -721,9 +721,9 @@ static void versal_virt_machine_class_init(ObjectClass =
*oc, void *data)
=20
     mc->desc =3D "Xilinx Versal Virtual development board";
     mc->init =3D versal_virt_init;
-    mc->min_cpus =3D XLNX_VERSAL_NR_ACPUS;
-    mc->max_cpus =3D XLNX_VERSAL_NR_ACPUS;
-    mc->default_cpus =3D XLNX_VERSAL_NR_ACPUS;
+    mc->min_cpus =3D XLNX_VERSAL_NR_ACPUS + XLNX_VERSAL_NR_RCPUS;
+    mc->max_cpus =3D XLNX_VERSAL_NR_ACPUS + XLNX_VERSAL_NR_RCPUS;
+    mc->default_cpus =3D XLNX_VERSAL_NR_ACPUS + XLNX_VERSAL_NR_RCPUS;
     mc->no_cdrom =3D true;
     mc->default_ram_id =3D "ddr";
 }
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c index 4415ee413f..=
ebad8dbb6d 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -25,6 +25,7 @@
 #include "hw/sysbus.h"
=20
 #define XLNX_VERSAL_ACPU_TYPE ARM_CPU_TYPE_NAME("cortex-a72")
+#define XLNX_VERSAL_RCPU_TYPE ARM_CPU_TYPE_NAME("cortex-r5f")
 #define GEM_REVISION        0x40070106
=20
 #define VERSAL_NUM_PMC_APB_IRQS 3
@@ -130,6 +131,35 @@ static void versal_create_apu_gic(Versal *s, qemu_irq =
*pic)
     }
 }
=20
+static void versal_create_rpu_cpus(Versal *s) {
+    int i;
+
+    object_initialize_child(OBJECT(s), "rpu-cluster", &s->lpd.rpu.cluster,
+                            TYPE_CPU_CLUSTER);
+    qdev_prop_set_uint32(DEVICE(&s->lpd.rpu.cluster), "cluster-id", 1);
+
+    for (i =3D 0; i < ARRAY_SIZE(s->lpd.rpu.cpu); i++) {
+        Object *obj;
+
+        object_initialize_child(OBJECT(&s->lpd.rpu.cluster),
+                                "rpu-cpu[*]", &s->lpd.rpu.cpu[i],
+                                XLNX_VERSAL_RCPU_TYPE);
+        obj =3D OBJECT(&s->lpd.rpu.cpu[i]);
+        object_property_set_bool(obj, "start-powered-off", true,
+                                 &error_abort);
+
+        object_property_set_int(obj, "mp-affinity", 0x100 | i, &error_abor=
t);
+        object_property_set_int(obj, "core-count", ARRAY_SIZE(s->lpd.rpu.c=
pu),
+                                &error_abort);
+        object_property_set_link(obj, "memory", OBJECT(&s->lpd.rpu.mr),
+                                 &error_abort);
+        qdev_realize(DEVICE(obj), NULL, &error_fatal);
+    }
+
+    qdev_realize(DEVICE(&s->lpd.rpu.cluster), NULL, &error_fatal); }
+
 static void versal_create_uarts(Versal *s, qemu_irq *pic)  {
     int i;
@@ -638,6 +668,7 @@ static void versal_realize(DeviceState *dev, Error **er=
rp)
=20
     versal_create_apu_cpus(s);
     versal_create_apu_gic(s, pic);
+    versal_create_rpu_cpus(s);
     versal_create_uarts(s, pic);
     versal_create_usbs(s, pic);
     versal_create_gems(s, pic);
@@ -659,6 +690,8 @@ static void versal_realize(DeviceState *dev, Error **er=
rp)
=20
     memory_region_add_subregion_overlap(&s->mr_ps, MM_OCM, &s->lpd.mr_ocm,=
 0);
     memory_region_add_subregion_overlap(&s->fpd.apu.mr, 0, &s->mr_ps, 0);
+    memory_region_add_subregion_overlap(&s->lpd.rpu.mr, 0,
+                                        &s->lpd.rpu.mr_ps_alias, 0);
 }
=20
 static void versal_init(Object *obj)
@@ -666,7 +699,10 @@ static void versal_init(Object *obj)
     Versal *s =3D XLNX_VERSAL(obj);
=20
     memory_region_init(&s->fpd.apu.mr, obj, "mr-apu", UINT64_MAX);
+    memory_region_init(&s->lpd.rpu.mr, obj, "mr-rpu", UINT64_MAX);
     memory_region_init(&s->mr_ps, obj, "mr-ps-switch", UINT64_MAX);
+    memory_region_init_alias(&s->lpd.rpu.mr_ps_alias, OBJECT(s),
+                             "mr-rpu-ps-alias", &s->mr_ps, 0,=20
+ UINT64_MAX);
 }
=20
 static Property versal_properties[] =3D { diff --git a/include/hw/arm/xlnx=
-versal.h b/include/hw/arm/xlnx-versal.h index d2d3028e18..155e8c4b8c 10064=
4
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -35,6 +35,7 @@
 OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
=20
 #define XLNX_VERSAL_NR_ACPUS   2
+#define XLNX_VERSAL_NR_RCPUS   2
 #define XLNX_VERSAL_NR_UARTS   2
 #define XLNX_VERSAL_NR_GEMS    2
 #define XLNX_VERSAL_NR_ADMAS   8
@@ -73,6 +74,15 @@ struct Versal {
             VersalUsb2 usb;
         } iou;
=20
+        /* Real-time Processing Unit.  */
+        struct {
+            MemoryRegion mr;
+            MemoryRegion mr_ps_alias;
+
+            CPUClusterState cluster;
+            ARMCPU cpu[XLNX_VERSAL_NR_RCPUS];
+        } rpu;
+
         struct {
             qemu_or_irq irq_orgate;
             XlnxXramCtrl ctrl[XLNX_VERSAL_NR_XRAM];
--
2.25.1

Reviewed-by: Frederic Konrad <fkonrad@amd.com>

