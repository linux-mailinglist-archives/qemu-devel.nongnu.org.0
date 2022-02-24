Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDBF4C2B65
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 13:06:37 +0100 (CET)
Received: from localhost ([::1]:39038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNCtG-0002EO-TM
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 07:06:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nNCmT-0000at-UN
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 06:59:34 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:59260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nNCmQ-0008DF-Af
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 06:59:32 -0500
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21O4s5lD026194;
 Thu, 24 Feb 2022 03:59:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=tTlrmtAQdjVmmk624pYgGefJdal/Z/pORlSKoE1Tw3Y=;
 b=KquXsls+6X8Ny1O8TAiRr5pvfdclcvQWQqzJct3kmynAPf8u7q+kUUY+vaREmpCN+Nqr
 Yw3BrFiEWDOR2/+xw+Nz/ywJdak0sUkzy5qdVscNszWxY+T3h5coSWXOqdOTfiieeKVY
 LbfBo5JbpEaziNgVPQBGouCeWxEA9bd94jouJtJVQvGyOZnVDuL4Gr9crmQllKqGylXO
 lR3u3UFXfJJkaf0ha2jJh16l7hEhcwtVurr3i0dB9usT3zrCYTbBO54m8ZM0ke6QJ8XM
 zFlDJEz22tNKrjYyjYV8eT/q6Ldprsinf4Oek2gcrydgAyKLzuXUIWOQs35lgq4+zEeV Jw== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2048.outbound.protection.outlook.com [104.47.74.48])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3ed4yhcknv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 03:59:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+kTjW15+GoFDobioX6CRxJTjnmSvvdhyX5hf9h8j8Ht9o0ImXoLKW5IBWbvS5VjMC2PlAqCbfnIproihSaNJwtsNTDJ5INNFd3rF7F5opnxz0xdNiiZ8meH9IrD5kMZFJOlmUuq1Xo/wAFj2iT+TQBCABVPTpFK5hpRDhi0hksSB9Gh6gd7PVXJzd607n25srv+rHzNbOzWtDWg6PwDwWmc6CQWWd7VAW8K+vTkmEUsfugrDtrc2CfjL5YRbVXlcAWHJ2t5ysAtI4EOgme3klducDMg4VSZfkGQXnyjJXfaMFtIznCzncW+tW9UJA5cYAY8A2VAw8b8svIA3eyevw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTlrmtAQdjVmmk624pYgGefJdal/Z/pORlSKoE1Tw3Y=;
 b=lGBsSDGO2FfdBYBSQHCe/rZOA+83HphOuGKwQP5Sc6atEPma2kXnOsSjR1feNzJdTnEaoKVkoL9QdDSw96CbvdjT0Cc+HwZK8M+A1KWuJsKjLmqG2daKGeBz2G7iQXMnMN1N1jrgCIGM8eYvZ2Inm2+sq28FTjw7fFO8OTSmyrTDnAJuRKX87TVELvcot4pzYK643Hy6STMG+G2IcGHKGf+CHfN9PjpuXOBwpSb07SkTGTjiuE2CM6VOKg0I5QeHvbFPXvjzFcHNhfngfWxJAiBaRzdvA2KupMDWKmPwy7WGd83acn4mVUz0zpNnQXop8gBk//9O9ZLJ+GjV1DPn0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by MN2PR02MB6032.namprd02.prod.outlook.com (2603:10b6:208:182::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 24 Feb
 2022 11:59:23 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab%5]) with mapi id 15.20.5017.022; Thu, 24 Feb 2022
 11:59:23 +0000
From: Kshitij Suri <kshitij.suri@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] Added parameter to take screenshot with screendump as PNG
Date: Thu, 24 Feb 2022 11:59:08 +0000
Message-Id: <20220224115908.102285-1-kshitij.suri@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0026.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::39) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d84d009-7f34-4307-8556-08d9f78d18dd
X-MS-TrafficTypeDiagnostic: MN2PR02MB6032:EE_
X-Microsoft-Antispam-PRVS: <MN2PR02MB6032F241917EACE9EDD7AFFA993D9@MN2PR02MB6032.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RBg/ac2+si4CnSxRSLx5YEysjw7vYRCUGwAVoEpN0a0OBo1XPKWdkqreotlqzXKFM2rKapCOvLYAL4WdpcCStozxwwo8a4UOtbumWF2elMmljhIA9RslOk9r/FG2J19goatcBoHO5RibqiwC7vDwGJqDu5GmyWdCZX5kiqFQ4iwmXOKpDjTAdbi+9/Q6sk4rkpgtAQYXRaRJWHGNPuI8fL/IPGzgF4o/cWHQeui0TGoce3MKkQX1kgiFkarTETU6/IFBjc88lzzeQO3aaeNNEaZ5DfJaIP6FmDEx2yK053XKJEAOBG3t5axFbvkWK53SSRDUyESVFPeHoiO3guD3Hdg86RoyRGmOaJqpALFFItPuRnluZ168B8+odghEf6ns9jK9fzYqHMJwG3/NG2dFNKsGq3rAg8mds+aGWENU/1ToaGJ4BQ2Ra3L+FHO1UuAApZjDQ9TA5k1EWitnxpd3yWHJhWRG94gILoZhGQEYmAGdC4BXJBTUbLpiYt4cK/Kgsaid64E8AP4ihvmjTVuKehJjo0hCn/nbpNyCjjL5SAZHQ0jTkriDFhBQg7ti00q6T3oG452ANqm4CSWmrHbLeIbZyKJIfNG22SfqsRH+Y/c4vdjvVvpzP3Z+L2fTTxyP5xtLFI5GTI8hSWGYinDMvxIxSDLtjQtvCIYbjk5Re1BnMDgHnKL7Zq/gErjA3ew6XKJnfMaq4OYZSwOVqOz0ffKOyBSU0KOOsbAd5n826AT3S1rO5CDBWE95XRWrtaTmp4k0bt7/0T+CEMJqkt/FdtB3gdwDj8XVO8bNCnVPUxA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(86362001)(966005)(30864003)(44832011)(36756003)(6486002)(508600001)(2906002)(5660300002)(83380400001)(38350700002)(38100700002)(316002)(4326008)(107886003)(6512007)(66946007)(66476007)(6506007)(66556008)(8676002)(52116002)(2616005)(66574015)(6916009)(6666004)(1076003)(186003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r8x+Cz8tepolYMPPeMd3sJZibcE8uho+XX5NLV3AWAievVwqh7pW/eklwv6G?=
 =?us-ascii?Q?wLSgyB9+J4Q3ntqZtkhwGO9KpoRWZ5s/7b/NkBQAbaBRQ+tgYhsEaePZdYzi?=
 =?us-ascii?Q?lFOfSqteWjc56nH69p+1gLK8lDQfQDq1dnY0woN/k1156qHXvMXWjCMxVYpr?=
 =?us-ascii?Q?etHE7t1UCEfd2GvGDA/W/+3dR1nB0JJhfAUTXsaFlJ27MuEsrloclibpsOM8?=
 =?us-ascii?Q?mCyd5e6EuYXHqVMaBFVJx3Y7NmYHInrL8VIBJv6VNy2Wowbb0mIczJ85NQCb?=
 =?us-ascii?Q?2qi5YHN+Q9ukzDJGZWpypQ+ucILR7YnG6waXfiuG+YlWYlk6A49gyuLZpc0x?=
 =?us-ascii?Q?kjRsjnpF7U9MPAykaD6jdgEgm+14ufezbzUnKkn4CQVi8rDqRomsRtAGs5GP?=
 =?us-ascii?Q?AqXvvn75tabwWXwIGJRO3t08exGTOGs9utllubzXBJNEhzffGrcG86PtmTbx?=
 =?us-ascii?Q?ZqvLXv5ERASzg7Euulh4dECA+zXJKB67Kd9jvvH69iFu178sH8gYGbyfZlPO?=
 =?us-ascii?Q?4uHC5/1hKC7yC/Vk9UKFodbnOdEolnoiYlmIksJZDzEUN61i/VyMSZiBBFhB?=
 =?us-ascii?Q?v2PRBii2ns1X4WD09sjEX1coBdakZsVbH5dwZsIs68/ASRsDuHPrF1C9Tshm?=
 =?us-ascii?Q?4d70vgQXOC276bZKUTsGIxbPpaDU6ru8SJxiG6USmbWpzwZ0JsZ/oXu2vTlQ?=
 =?us-ascii?Q?di3uoAKjx8/ww+HAlu1YYua1F/End1mtrEQrHheBYybgiTT7DV4wwKTpczHc?=
 =?us-ascii?Q?yUqvhv2OoY0iMe6+kzmcKRAlZTO45/sS+bbmvQdV4pMNr6ArQuC8M83Ndtyh?=
 =?us-ascii?Q?+pYYOTNHZWkdgzpDXjZdMDVI5OxZ/oJtm8W6Mnazsp25V0SG2VhsLKt/NwgL?=
 =?us-ascii?Q?NRMS3pLLLBa1ETS/lEJPg/0Y9m6sqdapH1GbJ+IcSwLHAS2QzGiEgbu0c65o?=
 =?us-ascii?Q?MhRrM/qgEuB3f/c3r+G9g8yzrr0QnlB2ZkSk86mLhM4mqP1iNSNY/DZsDqef?=
 =?us-ascii?Q?JO/bbw7XGZP67z20O7vE0jQgRU4Fcq9tIIU0z/l9Jp1ff6IU+OBnd9WsZLwf?=
 =?us-ascii?Q?66lr2ApL6Qmhvw+3FdmUZ+wtUy6gmEXK8zlvQMmQfTbWJTwJEkupvPdlLDGx?=
 =?us-ascii?Q?aq8uVF15qNOeinG6khtUxbrrODaA41CD78NlQsUpPwSK39/swM7db+frUcZa?=
 =?us-ascii?Q?1y4KVjK9la5mQ3cP8nYxMoy5WH5PtfEqTUg3ZkqoDompklR7vT3QQgUQb3Mu?=
 =?us-ascii?Q?dFC+515Gadu6XMAJcXPOMTwXznqTYIVjRNy3Kef4JMO6vBcO8ykVvn69zNkD?=
 =?us-ascii?Q?fyu2zewUGV0mwl7LVQyBFw0gy/4g/JkfcK0NDGRlDP8s6LO+i5J9GsGQAJJG?=
 =?us-ascii?Q?F8VcUHQhcQ+NBL4xeltYGv7DopE2BL2aPSwEYAAr1mdmkokR7ykTcxaAdM78?=
 =?us-ascii?Q?lSpZAnXyU2nPwgrTjTbDduHQrJ6/JeEriYNRrf82/Oal7SJI9D1FiHppSv80?=
 =?us-ascii?Q?v/6Lk6YXcmo4aqb+/4PxkDHUzAhsRNZOHtwkdHbZCwtlt9CLKlqwotyDfXVt?=
 =?us-ascii?Q?JV01Lvz9yWbGHkKW/wYnN7prx2nWl1HfWTZ0DBYkFXI3S1L4pMF2wveNAgwy?=
 =?us-ascii?Q?PM28ffXIvcMXY5jFxbbZHhpDybY5cC99/Ysmuv7taT/mj6uKuMTzVQ4pM85n?=
 =?us-ascii?Q?Qsut91S00pa8tEKl/1iiCYozVU8=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d84d009-7f34-4307-8556-08d9f78d18dd
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 11:59:23.2224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CA9TKgoMPAYQ8e8QKFs7ruGQoAjbpOZwgOlpRQtHOprPq1VNdGwHnGVKi3Cs5PEA+jIRtlH0g6Z8JKOHHddeM9YwCmwX+S/CfIO8Y/+B4w4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6032
X-Proofpoint-GUID: F3lLVNWMU6SVSzOOPEk6ti9qtMgQoYRo
X-Proofpoint-ORIG-GUID: F3lLVNWMU6SVSzOOPEk6ti9qtMgQoYRo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-24_02,2022-02-24_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, prerna.saxena@nutanix.com,
 dgilbert@redhat.com, armbru@redhat.com,
 Kshitij Suri <kshitij.suri@nutanix.com>, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently screendump only supports PPM format, which is un-compressed and not
standard. Added a "format" parameter to qemu monitor screendump capabilites
to support PNG image capture using libpng. The param was added in QAPI schema
of screendump present in ui.json along with png_save() function which converts
pixman_image to PNG. HMP command equivalent was also modified to support the
feature.

Example usage:
{ "execute": "screendump", "arguments": { "filename": "/tmp/image", "format":"png" } }

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/718

Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
---
diff to v1:
  - Removed repeated alpha conversion operation.
  - Modified logic to mirror png conversion in vnc-enc-tight.c file.
  - Added a new CONFIG_PNG parameter for libpng support.
  - Changed input format to enum instead of string.

 hmp-commands.hx    | 11 +++---
 meson.build        | 13 +++++--
 meson_options.txt  |  2 +
 monitor/hmp-cmds.c |  8 +++-
 qapi/ui.json       | 24 ++++++++++--
 ui/console.c       | 97 ++++++++++++++++++++++++++++++++++++++++++++--
 6 files changed, 139 insertions(+), 16 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 70a9136ac2..e43c9954b5 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -244,17 +244,18 @@ ERST
 
     {
         .name       = "screendump",
-        .args_type  = "filename:F,device:s?,head:i?",
-        .params     = "filename [device [head]]",
-        .help       = "save screen from head 'head' of display device 'device' "
-                      "into PPM image 'filename'",
+        .args_type  = "filename:F,device:s?,head:i?,format:f?",
+        .params     = "filename [device [head]] [format]",
+        .help       = "save screen from head 'head' of display device 'device'"
+                      "in specified format 'format' as image 'filename'."
+                      "Currently only 'png' and 'ppm' formats are supported.",
         .cmd        = hmp_screendump,
         .coroutine  = true,
     },
 
 SRST
 ``screendump`` *filename*
-  Save screen into PPM image *filename*.
+  Save screen as an image *filename*.
 ERST
 
     {
diff --git a/meson.build b/meson.build
index 8df40bfac4..fd550c01ec 100644
--- a/meson.build
+++ b/meson.build
@@ -1112,13 +1112,16 @@ if gtkx11.found()
   x11 = dependency('x11', method: 'pkg-config', required: gtkx11.found(),
                    kwargs: static_kwargs)
 endif
-vnc = not_found
 png = not_found
+png = dependency('libpng', required: get_option('png'),
+                   method: 'pkg-config', kwargs: static_kwargs)
+vnc = not_found
+vnc_png = not_found
 jpeg = not_found
 sasl = not_found
 if get_option('vnc').allowed() and have_system
   vnc = declare_dependency() # dummy dependency
-  png = dependency('libpng', required: get_option('vnc_png'),
+  vnc_png = dependency('libpng', required: get_option('vnc_png'),
                    method: 'pkg-config', kwargs: static_kwargs)
   jpeg = dependency('libjpeg', required: get_option('vnc_jpeg'),
                     method: 'pkg-config', kwargs: static_kwargs)
@@ -1537,9 +1540,10 @@ config_host_data.set('CONFIG_TPM', have_tpm)
 config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
 config_host_data.set('CONFIG_VDE', vde.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
+config_host_data.set('CONFIG_PNG', png.found())
 config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
-config_host_data.set('CONFIG_VNC_PNG', png.found())
+config_host_data.set('CONFIG_VNC_PNG', vnc_png.found())
 config_host_data.set('CONFIG_VNC_SASL', sasl.found())
 config_host_data.set('CONFIG_VIRTFS', have_virtfs)
 config_host_data.set('CONFIG_VTE', vte.found())
@@ -3579,11 +3583,12 @@ summary_info += {'curses support':    curses}
 summary_info += {'virgl support':     virgl}
 summary_info += {'curl support':      curl}
 summary_info += {'Multipath support': mpathpersist}
+summary_info += {'PNG support':       png}
 summary_info += {'VNC support':       vnc}
 if vnc.found()
   summary_info += {'VNC SASL support':  sasl}
   summary_info += {'VNC JPEG support':  jpeg}
-  summary_info += {'VNC PNG support':   png}
+  summary_info += {'VNC PNG support':   vnc_png}
 endif
 if targetos not in ['darwin', 'haiku', 'windows']
   summary_info += {'OSS support':     oss}
diff --git a/meson_options.txt b/meson_options.txt
index 52b11cead4..88148dec6c 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -177,6 +177,8 @@ option('vde', type : 'feature', value : 'auto',
        description: 'vde network backend support')
 option('virglrenderer', type : 'feature', value : 'auto',
        description: 'virgl rendering support')
+option('png', type : 'feature', value : 'auto',
+       description: 'PNG support with libpng')
 option('vnc', type : 'feature', value : 'auto',
        description: 'VNC server')
 option('vnc_jpeg', type : 'feature', value : 'auto',
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 8c384dc1b2..c300545f34 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1677,9 +1677,15 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
     const char *filename = qdict_get_str(qdict, "filename");
     const char *id = qdict_get_try_str(qdict, "device");
     int64_t head = qdict_get_try_int(qdict, "head", 0);
+    const char *input_format  = qdict_get_str(qdict, "format");
     Error *err = NULL;
+    ImageFormat format = IMAGE_FORMAT_PPM;
+    if (input_format != NULL && strcmp(input_format, "png") == 0) {
+        format = IMAGE_FORMAT_PNG;
+    }
 
-    qmp_screendump(filename, id != NULL, id, id != NULL, head, &err);
+    qmp_screendump(filename, id != NULL, id, id != NULL, head,
+                   input_format != NULL, format, &err);
     hmp_handle_error(mon, err);
 }
 
diff --git a/qapi/ui.json b/qapi/ui.json
index 9354f4c467..8caeb2d3bb 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -73,12 +73,27 @@
 ##
 { 'command': 'expire_password', 'data': {'protocol': 'str', 'time': 'str'} }
 
+##
+# @ImageFormat:
+#
+# Available list of supported types.
+#
+# @png: PNG format
+#
+# @ppm: PPM format
+#
+# Since: 6.3
+#
+##
+{ 'enum': 'ImageFormat',
+  'data': ['ppm', 'png'] }
+
 ##
 # @screendump:
 #
-# Write a PPM of the VGA screen to a file.
+# Write a screenshot of the VGA screen to a file.
 #
-# @filename: the path of a new PPM file to store the image
+# @filename: the path of a new file to store the image
 #
 # @device: ID of the display device that should be dumped. If this parameter
 #          is missing, the primary display will be used. (Since 2.12)
@@ -87,6 +102,9 @@
 #        parameter is missing, head #0 will be used. Also note that the head
 #        can only be specified in conjunction with the device ID. (Since 2.12)
 #
+# @format: image format for screendump is specified. Currently only PNG and
+#             PPM are supported.
+#
 # Returns: Nothing on success
 #
 # Since: 0.14
@@ -99,7 +117,7 @@
 #
 ##
 { 'command': 'screendump',
-  'data': {'filename': 'str', '*device': 'str', '*head': 'int'},
+  'data': {'filename': 'str', '*device': 'str', '*head': 'int', '*format': 'ImageFormat'},
   'coroutine': true }
 
 ##
diff --git a/ui/console.c b/ui/console.c
index 40eebb6d2c..911092c908 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -37,6 +37,9 @@
 #include "exec/memory.h"
 #include "io/channel-file.h"
 #include "qom/object.h"
+#ifdef CONFIG_PNG
+#include "png.h"
+#endif
 
 #define DEFAULT_BACKSCROLL 512
 #define CONSOLE_CURSOR_PERIOD 500
@@ -289,6 +292,84 @@ void graphic_hw_invalidate(QemuConsole *con)
     }
 }
 
+#ifdef CONFIG_PNG
+/**
+ * png_save: Take a screenshot as PNG
+ *
+ * Saves screendump as a PNG file
+ *
+ * Returns true for success or false for error.
+ *
+ * @fd: File descriptor for PNG file.
+ * @image: Image data in pixman format.
+ * @errp: Pointer to an error.
+ */
+static bool png_save(int fd, pixman_image_t *image, Error **errp)
+{
+    int width = pixman_image_get_width(image);
+    int height = pixman_image_get_height(image);
+    png_structp png_ptr;
+    png_infop info_ptr;
+    g_autoptr(pixman_image_t) linebuf =
+                            qemu_pixman_linebuf_create(PIXMAN_a8r8g8b8, width);
+    uint8_t *buf = (uint8_t *)pixman_image_get_data(linebuf);
+    FILE *f = fdopen(fd, "wb");
+    int y;
+    if (!f) {
+        error_setg(errp, "Failed to create file from file descriptor");
+        return false;
+    }
+
+    png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL,
+                                           NULL, NULL);
+    if (!png_ptr) {
+        error_setg(errp, "PNG creation failed. Unable to write struct");
+        return false;
+    }
+
+    info_ptr = png_create_info_struct(png_ptr);
+
+    if (!info_ptr) {
+        error_setg(errp, "PNG creation failed. Unable to write info");
+        return false;
+    }
+
+    png_init_io(png_ptr, f);
+
+    png_set_IHDR(png_ptr, info_ptr, width, height, 8,
+                 PNG_COLOR_TYPE_RGB_ALPHA, PNG_INTERLACE_NONE,
+                 PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
+
+    png_write_info(png_ptr, info_ptr);
+
+    for (y = 0; y < height; ++y) {
+        qemu_pixman_linebuf_fill(linebuf, image, width, 0, y);
+        png_write_row(png_ptr, buf);
+    }
+    qemu_pixman_image_unref(linebuf);
+
+    png_write_end(png_ptr, NULL);
+
+    png_destroy_write_struct(&png_ptr, &info_ptr);
+
+    if (fclose(f) != 0) {
+        error_setg(errp, "PNG creation failed. Unable to close file");
+        return false;
+    }
+
+    return true;
+}
+
+#else /* no png support */
+
+static bool png_save(int fd, pixman_image_t *image, Error **errp)
+{
+    error_setg(errp, "Enable PNG support with libpng for screendump");
+    return false;
+}
+
+#endif /* CONFIG_PNG */
+
 static bool ppm_save(int fd, pixman_image_t *image, Error **errp)
 {
     int width = pixman_image_get_width(image);
@@ -327,7 +408,8 @@ static void graphic_hw_update_bh(void *con)
 /* Safety: coroutine-only, concurrent-coroutine safe, main thread only */
 void coroutine_fn
 qmp_screendump(const char *filename, bool has_device, const char *device,
-               bool has_head, int64_t head, Error **errp)
+               bool has_head, int64_t head, bool has_format,
+               ImageFormat format, Error **errp)
 {
     g_autoptr(pixman_image_t) image = NULL;
     QemuConsole *con;
@@ -383,8 +465,17 @@ qmp_screendump(const char *filename, bool has_device, const char *device,
      * yields and releases the BQL. It could produce corrupted dump, but
      * it should be otherwise safe.
      */
-    if (!ppm_save(fd, image, errp)) {
-        qemu_unlink(filename);
+
+    if (has_format && format == IMAGE_FORMAT_PNG) {
+        /* PNG format specified for screendump */
+        if (!png_save(fd, image, errp)) {
+            qemu_unlink(filename);
+        }
+    } else {
+        /* PPM format specified/default for screendump */
+        if (!ppm_save(fd, image, errp)) {
+            qemu_unlink(filename);
+        }
     }
 }
 
-- 
2.22.3


