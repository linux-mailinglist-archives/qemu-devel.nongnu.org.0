Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9294C629F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 06:27:19 +0100 (CET)
Received: from localhost ([::1]:57828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOYZ3-0003EA-Kn
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 00:27:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nOYUZ-00010o-B6
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 00:22:39 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:20272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nOYUV-00050M-Je
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 00:22:39 -0500
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21REL14V030157;
 Sun, 27 Feb 2022 21:22:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=YOoT02RmQAxH1gKcoDiQreWuUbtq4gAK60KoJzrBPzM=;
 b=bIvUCLMgGdO0UL+yuFSPIh8801w7mlFeA0HaxQC6BbK9+JTZaBl0vcJuFWrmBgzygTZw
 /KWM1SEMIu6hCXRyTz07Y/40F9qDqNNL8CBZRJW/HwHa5FF/LNoChC0c0BewqVjktfh6
 YJOt9TQy/9uExJkhpl+uHjJ9Bs++O3eFPj9kDmwqpxqRPnLE2PN9zlyoX0sAetwnYYPB
 10rysCmL5uuoxpGElr3Kra1ZyDQmpxIMCVGttzL0jtR9Z9UCQ6b1C8euUMigdbeThkJM
 8Q8atbEf+LQnYjRysOqeXp15NJ7H92pJEPCg8H5m88lhqojs+M8VbhCgQAmoBygBxkmb ZQ== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2045.outbound.protection.outlook.com [104.47.57.45])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3efjmd2sna-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 27 Feb 2022 21:22:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSAx7urepU2rBlSUa3uDo1dMRzpPZnsc/N6rEM3AhTcgRGoA+gmR6rJhEbJuRLHcXjBLSo/caxi2szG7p/5Uysbep9rpE8WAf7gQmjegNmkqR4K2cXYkRRUB1mfFzEkduCiW4mnBxg7Srvi3Q2FMgAvvM1CWc06TjIcyWLSgClvIkeQLD1JK+5uvG9LY/ankdDJpGMIspSimRMB2Q1a+9XQtmpjnk54fmWq+N2bDCUvdnLk4W8yxNLYlrNeS0oi7O2zA0PXE6FWqO7yJVFHkji412NH2mw1utBoSywLhjwE5GKQ28VpHgn1KBJNyPxw0ZsFV5e+t37ZrErwRalewBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOoT02RmQAxH1gKcoDiQreWuUbtq4gAK60KoJzrBPzM=;
 b=nebAIk1Op/YE/s0JX7Gm1Q6/sJ77dkz5UKAeitTgqtNbbMpwIZUSARptDXNnlP9Zu2e7SxHQoKbaN1FFQJcUPwquwmu1Ysf48ZiH2ImsdbuUVqP8rwqO4BAwtkKHweYzrNBNxNJ7nWZZS2BtcQ1DlVj9vMyp3gRRzgMaqhjPFu/18JxFJhVOgM/BySXhxcWZHIJpDKL2dTyrNhZXG8Ld6qtiiNAts8nXl9Ltb0X3lbk1U/Ly8IW8AHETS//Wc1TLzRwBSKTN8pe/JjDfOY7fm4xda4wMkjX1YjMdnyr7X6AN2miuB68DWqiZ66pSk8NHwcn8HZu1NWrFkJnxo/1q+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by DM6PR02MB5707.namprd02.prod.outlook.com (2603:10b6:5:7e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Mon, 28 Feb
 2022 05:22:27 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab%5]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 05:22:27 +0000
From: Kshitij Suri <kshitij.suri@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] Replacing CONFIG_VNC_PNG with CONFIG_PNG
Date: Mon, 28 Feb 2022 05:22:21 +0000
Message-Id: <20220228052222.138890-1-kshitij.suri@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::29) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 091d3c32-eb0a-45da-00b5-08d9fa7a4f03
X-MS-TrafficTypeDiagnostic: DM6PR02MB5707:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB5707F7491FE75ED0BDA55E1599019@DM6PR02MB5707.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eEl8B2IjsCHXCqO1Sd+E8yzIKpY7CGmou/jXa4srTcGFp2pxmnXBWyNBaBGUGeUwHTR/ruYKPKtlbe7ClMy0RzAzh4VA5F2mE6pxjKCT24IY1yMYSiDgMcRnjXS0+axtDFaueB3ao1w9bCEt+jVpbe1X+YW03LQN3zvoZPrgdzID1cqhcG0+Tb4qrma/iujyk3l2MybFTh7wQbqBP8cqqvuO1IG4QjAQ1Uq1cTIlZtL6OBnPQxoFayz0326ZTeQvBMO6DqkG+ZAUZC0Ca0JERx6nY0osiSCWOGTfbq3eX4tzc0MurtMoPQNzrQzxXB6f5HGcMO+3S3HfY8cMmSqMduib6cgZiMh+QO/aFX3r19hhoM+pKueAXMNBPMim3OTrNiJH4Rw1lj7JuTiYWJMOu/8UN0HsxkpC3M4j6I8+zDhLRGign/G1ajSlNCDT16ODjOvoeYplKdrWInxUgsJy7fUu7HGeBFUS43d70e1OuC7KR4TLrDqqt2tDCEaXk0QNFs1eKdbVXEuVrHv4sk3dBDvNeakqrS4w01NXgILOGY6Ko+wEjw+73B3QJfWDeAQqlajBvuSXPZzgaWMXtijExGao5yDA6p/wLCol8KiTbFe4/qeDlJzLI8/Kmq4KoWk8gIGrOcSKuHQ6Hld31pjwUvaQ3Er9sl6vKMNpT+eceQ0rCAKGebU2PyCdOQtUV+pyVd6sh2HuOhW3jG0prevX9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(66556008)(66476007)(66946007)(36756003)(5660300002)(8936002)(107886003)(83380400001)(2906002)(8676002)(4326008)(186003)(26005)(2616005)(1076003)(38100700002)(38350700002)(6486002)(86362001)(316002)(6916009)(6506007)(6512007)(6666004)(508600001)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fMI+1OsWWwUyRcCWXhSx97pz2pKqyQDgo3oiAtq6ekoITjEPvdE+mELacg5s?=
 =?us-ascii?Q?vJF7jvKztx1K8atsdMjDyHWcvFTFlSKGUqE0iFn08e5TUeJwerqzehk7bbDw?=
 =?us-ascii?Q?gNzsCqnxiWYOOx1FX27m3XpvX3UBM2+BVV5ACPGOMSqFziCFyCN0hG4g3IG0?=
 =?us-ascii?Q?ls5ROOyztr6daO4Dv/xAdHnCXR0IP3jkhaIPNYFRR0MuMgSwq+flSwUitJtt?=
 =?us-ascii?Q?aBv2i6NNIaW7vqlAujYOwrnfjtcfQUcM052E9NQ10klpQKzB2Sjv4bIR+F7p?=
 =?us-ascii?Q?yfgVFe8GNT34KZFp5Z+whO88BSB8n+2077knpu5Og5KxVW/vfjhS9DHFbkqG?=
 =?us-ascii?Q?KGzM9dOZz5+yw+i+vy4I/e5xcChA8ZnylVW5LNHYURFWmZPI09BZNcuYZlmo?=
 =?us-ascii?Q?33BSJfjxfSS9wffTSrP7WoNn5px7YHZpecWq9GFHo+UKKeXORnneMUY8bytj?=
 =?us-ascii?Q?esKY36yQhNcVvB2154GsXVM+IpJagmEIZObERNjrd0DR5bYURqWuto4AG7vW?=
 =?us-ascii?Q?mBxfeA/oI79cDnXnf7mXva1jtYFMby6jZK/NVsJSp97WLAduAfBJq3RO47GN?=
 =?us-ascii?Q?/mmDwxP0pRXWY+M4QkelgvW9OCZXpJEgt81vEY3LzbKFDoKC8JjnoLdV/SPi?=
 =?us-ascii?Q?t25kVplMsSvOxvReBn+JMTBK5/fPT4Yi9Tf6JIPsBFOgbzHve4P/jcDLSaPK?=
 =?us-ascii?Q?J93D/BG/M7GABbnsXWDGOc/hYcbIgCmIwjWHRwwFzKqHB2Qi/RKa87ePlWOg?=
 =?us-ascii?Q?/ocU8J9B4uwibQUy/vN9XTc7Dil8wUYSFxuGNAtJ2f7NzFyKJiGfES351qpF?=
 =?us-ascii?Q?Y/DAV4TQ+fIFc3pKcPj08miJoJ/orIIMYbpYXtnGmKSj166gLI+oP7uZ0Hi4?=
 =?us-ascii?Q?6QYi+mNMWF0ujzOWXlQtjvoWQDcF81yjFv8KRJ4RH5uu7pK8JVl7eFEuGY0M?=
 =?us-ascii?Q?D9vzBYJfg/NKpXvwlKrwrBUhFiA8o8UT3RQ2rkc+fxnvbGH+ouvFNtBWiuFo?=
 =?us-ascii?Q?fKd6Ni4h5W3b3QQ8qK1sR1MC7shMe12DXKGQKZ4hqNVcx0opAMA0BpLy9mV+?=
 =?us-ascii?Q?O2e6NLHnMAfvw0LoaLKatGXJK+7JCYAE7YYGy6mUlqbwepvTJPjARukQYaMz?=
 =?us-ascii?Q?BSnKXzEHSV2/yh8wiqf0cD4ivcH8fzprgQF1Ekw6kapbjPF7dDQhrMONDRkw?=
 =?us-ascii?Q?9asBH5HLemSs0SEBGaAXs2+pVMN5MI7phuI3WIAH7+msRerge3oSX7nuP3HW?=
 =?us-ascii?Q?O55egFMmw57ZXQu5pTfoMJEgpxzTWzkpBVAX8Pv85vihlu5yetjMmh/Hy1kU?=
 =?us-ascii?Q?pLzRvMu7ynQ0LzFOdpdGYVbuWJCNrRpqxQN64U/kl1gQcWyMcON+Jl9vRKns?=
 =?us-ascii?Q?Yuw2Ml1T3aDD433V5o9eeRLhiAmWmZHruOXwQ8EXZ6HvGv0JwQdLmipTJ2nh?=
 =?us-ascii?Q?e3nha+cl0IZwrQIc7CXY6xOqDyKFbuz67oupyfXE7Iy9k2+QBh5a+9Kyt5+2?=
 =?us-ascii?Q?o7sfI5Yyfxrh0uUG1CebY9FC0Wgc1k8a7RYTCxvMt7cj/ZWx+uBATW8yhTkS?=
 =?us-ascii?Q?14QngmDhQ3oMa0XB9rSWjkawXXB+xpl8+t28Snt++NvBERYA0Pd6D1VC92i3?=
 =?us-ascii?Q?NR+Z7rptT2HmqFrQ9Sjd1eIiu1bDLJLZphVz1nl1KEidNEmaUdx33pP28Gjm?=
 =?us-ascii?Q?v/lGetCamRGkzrIicpnuo/LdzSc=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 091d3c32-eb0a-45da-00b5-08d9fa7a4f03
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 05:22:26.9436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oIUVQV3kPTTfSYgR48wl6coA8pBOivDhX+MtJwZM2rSp2izHwIFxjPst/Wb1XAJ9W34hUyhhQHjE5PqlizE3VCak8cWHinjmU3WvW6STg0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5707
X-Proofpoint-GUID: hy1o6dMJ-a6eT8xTvje80Jxf83dqAkik
X-Proofpoint-ORIG-GUID: hy1o6dMJ-a6eT8xTvje80Jxf83dqAkik
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_01,2022-02-26_01,2022-02-23_01
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

Libpng is only detected if VNC is enabled currently. This patch adds a
generalised png option in the meson build which is aimed to replace use of
CONFIG_VNC_PNG with CONFIG_PNG.

Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
---
 meson.build        | 10 +++++-----
 meson_options.txt  |  4 ++--
 ui/vnc-enc-tight.c | 18 +++++++++---------
 ui/vnc.c           |  4 ++--
 ui/vnc.h           |  2 +-
 5 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meson.build b/meson.build
index 8df40bfac4..3638957fc5 100644
--- a/meson.build
+++ b/meson.build
@@ -1112,14 +1112,14 @@ if gtkx11.found()
   x11 = dependency('x11', method: 'pkg-config', required: gtkx11.found(),
                    kwargs: static_kwargs)
 endif
-vnc = not_found
 png = not_found
+png = dependency('libpng', required: get_option('png'),
+                 method: 'pkg-config', kwargs: static_kwargs)
+vnc = not_found
 jpeg = not_found
 sasl = not_found
 if get_option('vnc').allowed() and have_system
   vnc = declare_dependency() # dummy dependency
-  png = dependency('libpng', required: get_option('vnc_png'),
-                   method: 'pkg-config', kwargs: static_kwargs)
   jpeg = dependency('libjpeg', required: get_option('vnc_jpeg'),
                     method: 'pkg-config', kwargs: static_kwargs)
   sasl = cc.find_library('sasl2', has_headers: ['sasl/sasl.h'],
@@ -1537,9 +1537,9 @@ config_host_data.set('CONFIG_TPM', have_tpm)
 config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
 config_host_data.set('CONFIG_VDE', vde.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
+config_host_data.set('CONFIG_PNG', png.found())
 config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
-config_host_data.set('CONFIG_VNC_PNG', png.found())
 config_host_data.set('CONFIG_VNC_SASL', sasl.found())
 config_host_data.set('CONFIG_VIRTFS', have_virtfs)
 config_host_data.set('CONFIG_VTE', vte.found())
@@ -3579,11 +3579,11 @@ summary_info += {'curses support':    curses}
 summary_info += {'virgl support':     virgl}
 summary_info += {'curl support':      curl}
 summary_info += {'Multipath support': mpathpersist}
+summary_info += {'PNG support':       png}
 summary_info += {'VNC support':       vnc}
 if vnc.found()
   summary_info += {'VNC SASL support':  sasl}
   summary_info += {'VNC JPEG support':  jpeg}
-  summary_info += {'VNC PNG support':   png}
 endif
 if targetos not in ['darwin', 'haiku', 'windows']
   summary_info += {'OSS support':     oss}
diff --git a/meson_options.txt b/meson_options.txt
index 52b11cead4..d85734f8e6 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -177,12 +177,12 @@ option('vde', type : 'feature', value : 'auto',
        description: 'vde network backend support')
 option('virglrenderer', type : 'feature', value : 'auto',
        description: 'virgl rendering support')
+option('png', type : 'feature', value : 'auto',
+       description: 'PNG support with libpng')
 option('vnc', type : 'feature', value : 'auto',
        description: 'VNC server')
 option('vnc_jpeg', type : 'feature', value : 'auto',
        description: 'JPEG lossy compression for VNC server')
-option('vnc_png', type : 'feature', value : 'auto',
-       description: 'PNG compression for VNC server')
 option('vnc_sasl', type : 'feature', value : 'auto',
        description: 'SASL authentication for VNC server')
 option('vte', type : 'feature', value : 'auto',
diff --git a/ui/vnc-enc-tight.c b/ui/vnc-enc-tight.c
index cebd35841a..a23ad712eb 100644
--- a/ui/vnc-enc-tight.c
+++ b/ui/vnc-enc-tight.c
@@ -32,7 +32,7 @@
    INT32 definitions between jmorecfg.h (included by jpeglib.h) and
    Win32 basetsd.h (included by windows.h). */
 
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
 /* The following define is needed by pngconf.h. Otherwise it won't compile,
    because setjmp.h was already included by qemu-common.h. */
 #define PNG_SKIP_SETJMP_CHECK
@@ -95,7 +95,7 @@ static const struct {
 };
 #endif
 
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
 static const struct {
     int png_zlib_level, png_filters;
 } tight_png_conf[] = {
@@ -919,7 +919,7 @@ static int send_full_color_rect(VncState *vs, int x, int y, int w, int h)
     int stream = 0;
     ssize_t bytes;
 
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     if (tight_can_send_png_rect(vs, w, h)) {
         return send_png_rect(vs, x, y, w, h, NULL);
     }
@@ -966,7 +966,7 @@ static int send_mono_rect(VncState *vs, int x, int y,
     int stream = 1;
     int level = tight_conf[vs->tight->compression].mono_zlib_level;
 
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     if (tight_can_send_png_rect(vs, w, h)) {
         int ret;
         int bpp = vs->client_pf.bytes_per_pixel * 8;
@@ -1020,7 +1020,7 @@ static int send_mono_rect(VncState *vs, int x, int y,
 struct palette_cb_priv {
     VncState *vs;
     uint8_t *header;
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     png_colorp png_palette;
 #endif
 };
@@ -1082,7 +1082,7 @@ static int send_palette_rect(VncState *vs, int x, int y,
     int colors;
     ssize_t bytes;
 
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     if (tight_can_send_png_rect(vs, w, h)) {
         return send_png_rect(vs, x, y, w, h, palette);
     }
@@ -1233,7 +1233,7 @@ static int send_jpeg_rect(VncState *vs, int x, int y, int w, int h, int quality)
 /*
  * PNG compression stuff.
  */
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
 static void write_png_palette(int idx, uint32_t pix, void *opaque)
 {
     struct palette_cb_priv *priv = opaque;
@@ -1379,7 +1379,7 @@ static int send_png_rect(VncState *vs, int x, int y, int w, int h,
     buffer_reset(&vs->tight->png);
     return 1;
 }
-#endif /* CONFIG_VNC_PNG */
+#endif /* CONFIG_PNG */
 
 static void vnc_tight_start(VncState *vs)
 {
@@ -1706,7 +1706,7 @@ void vnc_tight_clear(VncState *vs)
 #ifdef CONFIG_VNC_JPEG
     buffer_free(&vs->tight->jpeg);
 #endif
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     buffer_free(&vs->tight->png);
 #endif
 }
diff --git a/ui/vnc.c b/ui/vnc.c
index 3ccd33dedc..a588ddff1c 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2165,7 +2165,7 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
             vs->features |= VNC_FEATURE_TIGHT_MASK;
             vs->vnc_encoding = enc;
             break;
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
         case VNC_ENCODING_TIGHT_PNG:
             vs->features |= VNC_FEATURE_TIGHT_PNG_MASK;
             vs->vnc_encoding = enc;
@@ -3248,7 +3248,7 @@ static void vnc_connect(VncDisplay *vd, QIOChannelSocket *sioc,
 #ifdef CONFIG_VNC_JPEG
     buffer_init(&vs->tight->jpeg,     "vnc-tight-jpeg/%p", sioc);
 #endif
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     buffer_init(&vs->tight->png,      "vnc-tight-png/%p", sioc);
 #endif
     buffer_init(&vs->zlib.zlib,      "vnc-zlib/%p", sioc);
diff --git a/ui/vnc.h b/ui/vnc.h
index a7149831f9..a60fb13115 100644
--- a/ui/vnc.h
+++ b/ui/vnc.h
@@ -201,7 +201,7 @@ typedef struct VncTight {
 #ifdef CONFIG_VNC_JPEG
     Buffer jpeg;
 #endif
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     Buffer png;
 #endif
     int levels[4];
-- 
2.22.3


