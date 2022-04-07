Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E3A4F819B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 16:29:45 +0200 (CEST)
Received: from localhost ([::1]:45732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncT8q-0000DL-Ag
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 10:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1ncMmp-0008R1-Br; Thu, 07 Apr 2022 03:42:35 -0400
Received: from mail-mw2nam12on20624.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::624]:26593
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1ncMml-00039w-GV; Thu, 07 Apr 2022 03:42:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONwectkNBdB/+BpkvZGUBVAECr9njAUsNskaPlbeeIhnnjcmc66E+d9kOLxm3rtXsX1VLDGbpz2dGQlurcgZbf/RD6mr1iEQaR9d5Hp+UZOf6e7wUBrg9ddl1hWBKxqRddwzc5tAcLi0QnWorXBjQvYGVeKmJCaIGhS+gzR0LcodOTWbl66w1lUQh0LBUAKpMALB4CYzxIvnjk8iJ3Q9SMSkrH3muiQJB7PTH9jCvlorFfgq61nggQ7IuY+Y0TtS6l0S+b2vRyR/iSP/6u4OAyUMLH2IPoDN+oon2LHnE6AAqFRwGy3hSPyI+tpwWlwJeNdUqv0fGeURJD9P3MzypA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rkMzVTfkD5GbqtDq3zRQ7DITlczx0CIzHW+6NFD92jw=;
 b=Qpd35tgO4V8Pcwxlq/TJtYEKvux3vVpA/ttaf8yq0XpRS6pVHHWYPzWvpWZWu5wQ7ePpuyhMW2oXErowMLjIa7IE+GOoKjmrWnHPLw14omCIWEhlOhR7l+Fo/NDBI91SHSllLoh7wbTmwQmQH52/ysR+zPEYVGytV+zgIsNkSSzmJFBecIeyYzmFZ0eBh965HywzU+g1XB7CDEdns7nfLry7ETElg+Xp/hajL732nKI8r+Nestx3HESOXcG+Ad06dbv68cAENVtENoeshYzmAmwaGaC0vVOUVa4mQhETdqoPt0B0pF4v2MQHql3YIlyZIkO4vmWv3VkVqs54kiU0MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rkMzVTfkD5GbqtDq3zRQ7DITlczx0CIzHW+6NFD92jw=;
 b=XjvwSSohKYYTOKB/2AYuWrbdpcOwQDHD6P8pCKvaoYxh2qWwJ/1BXhc13BeMSQta907nuZczup/puLTfcsLo1txt8rdxvEemNlV8OXv52w205g+ia7TfxHyN9/Awd+YUbMMluJMnXFyiU/zWsmgHzurJENSgR1MgSbd/igtb2Bo=
Received: from BY5PR02MB6354.namprd02.prod.outlook.com (2603:10b6:a03:1fd::12)
 by SA1PR02MB8463.namprd02.prod.outlook.com (2603:10b6:806:1f7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 07:42:26 +0000
Received: from BY5PR02MB6354.namprd02.prod.outlook.com
 ([fe80::3854:75c0:3d7f:299a]) by BY5PR02MB6354.namprd02.prod.outlook.com
 ([fe80::3854:75c0:3d7f:299a%5]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 07:42:26 +0000
From: Frederic Konrad <fkonrad@xilinx.com>
To: Edgar Iglesias <edgari@xilinx.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v1 1/4] hw/arm: versal: Create an APU CPU Cluster
Thread-Topic: [PATCH v1 1/4] hw/arm: versal: Create an APU CPU Cluster
Thread-Index: AQHYSd3GAlDp92qGH02YL3f4FzzVMqzkEgFQ
Date: Thu, 7 Apr 2022 07:42:26 +0000
Message-ID: <BY5PR02MB63541D2F97A9AA9B6C23639ACCE69@BY5PR02MB6354.namprd02.prod.outlook.com>
References: <20220406174303.2022038-1-edgar.iglesias@xilinx.com>
 <20220406174303.2022038-2-edgar.iglesias@xilinx.com>
In-Reply-To: <20220406174303.2022038-2-edgar.iglesias@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a1db6e8-5570-493a-2b71-08da186a296d
x-ms-traffictypediagnostic: SA1PR02MB8463:EE_
x-microsoft-antispam-prvs: <SA1PR02MB8463211B48F4980622E897F8CCE69@SA1PR02MB8463.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f2g1yOKz2Cxm8LE89d6U5kugU5uX5x3XddD9YjA9uVGGW2CtkFxxgdzLc7Jl7w9NI8zgwlBGQBEmQR++SwLXNIvyjCBOwUOdPyCyfs/59oi/0KwTr33cczvGJLT6//7UOU9lmMpb4AQ+CZGq9vlTQiQIRMKVBpitDZ7pZV9mK1w+OfXya+DiIYiLD2rzK9LX/fMOevkEqBR7sXfI+H2yrpOUoaPsDxRo4gewU7+NsA/XfZw8ln2cQqK2ZCTgkGKKepsR6mOru4TTJjlJ+or4jFiTG6E0xrECcM1KTPQ8xGsNK8p7j3vYGgrw4EisFoJCeFgcC2O3KB8HvgzmXWWxHWCLC7wheep9TNBkIvxfYoophJ2Ge8E9DJkdk0bHj1XWiC5iYoF7gD8BkzStM8K74zKBanm99m9oebcbmQVAX2Mdd6YqShwime5t9xbIhSve0WkTCQvoHs+uAUfmA2SO9+MyajrGVVPwWJPdCDdGM8cO6YoA5uXknNp8GLZeH1AYcSSwWZTymzLw5D5F+RMAb/Y8ZV9qse+VVkrkY9JCsb49fa9WPqa//MiYo5NHRDOZzA8WCfukdMU/Q5Ivhj3xVrDCgpIE4OInhW4u6C+Xz4QMongBqItyCWQ7b8ALKJo/9Yeo4Cua0/QQ5afxL7FXloviReGwd+6KWVGKBUYYqQbHy9DlHoJGiS0AudUJQ5bXKoCPVJUVO0yX4GJDC6GwJw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6354.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7696005)(6506007)(38100700002)(316002)(53546011)(64756008)(66946007)(66446008)(66476007)(66556008)(8676002)(4326008)(9686003)(86362001)(76116006)(83380400001)(110136005)(122000001)(54906003)(508600001)(55016003)(186003)(2906002)(71200400001)(52536014)(8936002)(38070700005)(33656002)(26005)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pDWPf7hM9hM4w7ahAT/mocjLx7IlT8kOLACC1sf3shh1E4h7yJDoPO2rpV0O?=
 =?us-ascii?Q?stCdDQgMTH+btAxzHkGyIjzaJsY7FNHOfBOqDVl9YF7ELsdcn6KmDDSo1h03?=
 =?us-ascii?Q?lrMxQ0rlrf0+HUnKaL77/0Nneqg68LxCn9KEhNM2FMcHBFHjDU9GSxvjDrzO?=
 =?us-ascii?Q?uXFAK++qXd6nuMoZNe/lRhv8T98MsVPUCyygD56UTpsJJnHLLbEL/n+QJ1k9?=
 =?us-ascii?Q?/gQV2nLwWi3pTIqV47axv5lYtNPfPAzz3h0250d14+ylhbqFkdkFcCeerOv9?=
 =?us-ascii?Q?zyevPKPmovRmkSpu5ptjV/5OZN5IuKI0mwDSgZcOUnwpmIqjwyQCScWmVUm7?=
 =?us-ascii?Q?ODPfYGrYf9DgQpxiWJkQS/dWa2lHctg4mVjGwXUA0azvth4DmvLCiSBqqSEo?=
 =?us-ascii?Q?k9ePyw4f54O0CbrNpYSx3Pf3kJTjOhjENhk/MCxhYA029TuW+GkFVTWTaVaS?=
 =?us-ascii?Q?6MZ49kAwq+HY25lIhXkOhhqa2ulg7G3cofRlHa+h+q5h1nsGfc98G6MM9USn?=
 =?us-ascii?Q?dQNOU60uC5y9KBqWtiIYIds8EvT2hepgV+iSBfnJU5ubKDkI7WYIE6vOkcFd?=
 =?us-ascii?Q?e2trrhFHX2sz5pWSvdQFHmcGxut9SVcihZW2kIX7d06waAUZQBbSCAx5nrlV?=
 =?us-ascii?Q?Lq9FUV2NMZM9a6j94tmNxgwupWvFVHeZwhpOhLgZFnWaXeIYxQgXsSRNd5Lh?=
 =?us-ascii?Q?XW4WesHYwy2BvaLlBaOm8i/AbVg4fmdwkw/OA+HiUmFosAwF4mXxR+wNj5zB?=
 =?us-ascii?Q?6E+8UMUjE7TfOTclkkp7JAdsZAtjRsdOA1spssjy0qbe22a+u+tJgo3c/+0k?=
 =?us-ascii?Q?/qQbXDQskUfhhqgvCEciPGGpU9h3UYVpahrs2s4DaaeI13yqyFZdHJcbhYTk?=
 =?us-ascii?Q?5WKj2k26NAnezlz2GvGFWGp6hyGxZZwe7Xmo2UoSnXhKGCuKx37qkyZZYRZd?=
 =?us-ascii?Q?RfAMM9MhmjpM3LMX0yk8zPsqrraYOk4PWKI1bP0S2vaFehreKWX265eh+fzE?=
 =?us-ascii?Q?KGufBbTOXnINCL7mRVEbMOg18RdOoCb3JNL36WAqiQBtKxeVLD296XNeIQON?=
 =?us-ascii?Q?wmCPrenkFy0Zw1E0QGShXUyBd9/AX+pVWqUA/+5inpmD5/4MkfYCtkU88fOS?=
 =?us-ascii?Q?ZjPYFlq36lh5tyEE4QY/jprhaGalf6EoDRrFwm0pj6KWbZL7xWSBcflhotut?=
 =?us-ascii?Q?7gT1S3C9GKo0lxFE46GLbBhqpLTxkDvo0O+lW7BMAZbd3YNISZfVzoUkXy50?=
 =?us-ascii?Q?QebVrhsAB8CffJBgIiFGPQAhYh+Yjuag2nzg6gClzaSh20VafrhHSkM4Yg3p?=
 =?us-ascii?Q?hVaO9Op/XktQcAmqajcoG7m052flhuuJQPewIvI4R09ypIoDyb083LDUbLHZ?=
 =?us-ascii?Q?eCMPFPc1HpD/YSR2oC25mpzHMnyznb19upBTzn4zv5qhz6ZJek6OMm5dzcci?=
 =?us-ascii?Q?LhDFSKwrIcoNzmdbdF5aHM7c3byYp+NPkV3aFfx1s9a8i7bgUxIaIByQ/5F1?=
 =?us-ascii?Q?4vI013NTtdoV2Me/kLBRH7fE9++Dj0Ye3+0Z6+xfW77bWD2+w2a/yPtM0jBV?=
 =?us-ascii?Q?icckLFKiqNUFqV/JrlnbXSDeZ0dkqxODQ8jGR5GT2ADr5aR8bmuOdBsGFiyQ?=
 =?us-ascii?Q?f3dyDCYAHHSs5W2z3Mc3qUYHX5LY2NCYY1Y6BMWWPSIwdN9H2dQNphTwyOHH?=
 =?us-ascii?Q?ih1yjXl2rTp2oOlJ+Wq/ge+SjNdGGDQoFgEOKEGAPiNiW/38PdT3Yt1MH9oq?=
 =?us-ascii?Q?Sb2G94A1bw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6354.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a1db6e8-5570-493a-2b71-08da186a296d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2022 07:42:26.5873 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0uQ5cIUo8BW+WSUccq4uiR3Fu3neXRughZ3EW/FEeNbuz8HilxQ4NlFKAwZUXsQBiDDLDJ3Hvb30m1/fu5yAkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8463
Received-SPF: pass client-ip=2a01:111:f400:fe5a::624;
 envelope-from=fkonrad@xilinx.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 07 Apr 2022 10:25:47 -0400
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
Subject: [PATCH v1 1/4] hw/arm: versal: Create an APU CPU Cluster

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Create an APU CPU Cluster. This is in preparation to add the RPU.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/arm/xlnx-versal.c         | 9 ++++++++-
 include/hw/arm/xlnx-versal.h | 2 ++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c index 2551dfc22d..=
4415ee413f 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -34,10 +34,15 @@ static void versal_create_apu_cpus(Versal *s)  {
     int i;
=20
+    object_initialize_child(OBJECT(s), "apu-cluster", &s->fpd.apu.cluster,
+                            TYPE_CPU_CLUSTER);
+    qdev_prop_set_uint32(DEVICE(&s->fpd.apu.cluster), "cluster-id", 0);
+
     for (i =3D 0; i < ARRAY_SIZE(s->fpd.apu.cpu); i++) {
         Object *obj;
=20
-        object_initialize_child(OBJECT(s), "apu-cpu[*]", &s->fpd.apu.cpu[i=
],
+        object_initialize_child(OBJECT(&s->fpd.apu.cluster),
+                                "apu-cpu[*]", &s->fpd.apu.cpu[i],
                                 XLNX_VERSAL_ACPU_TYPE);
         obj =3D OBJECT(&s->fpd.apu.cpu[i]);
         if (i) {
@@ -52,6 +57,8 @@ static void versal_create_apu_cpus(Versal *s)
                                  &error_abort);
         qdev_realize(DEVICE(obj), NULL, &error_fatal);
     }
+
+    qdev_realize(DEVICE(&s->fpd.apu.cluster), NULL, &error_fatal);
 }
=20
 static void versal_create_apu_gic(Versal *s, qemu_irq *pic) diff --git a/i=
nclude/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h index 0728316ec7=
..d2d3028e18 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -14,6 +14,7 @@
=20
 #include "hw/sysbus.h"
 #include "hw/arm/boot.h"
+#include "hw/cpu/cluster.h"
 #include "hw/or-irq.h"
 #include "hw/sd/sdhci.h"
 #include "hw/intc/arm_gicv3.h"
@@ -49,6 +50,7 @@ struct Versal {
     struct {
         struct {
             MemoryRegion mr;
+            CPUClusterState cluster;
             ARMCPU cpu[XLNX_VERSAL_NR_ACPUS];
             GICv3State gic;
         } apu;
--
2.25.1

Reviewed-by: Frederic Konrad <fkonrad@amd.com>

