Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B704E3A73
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 09:21:06 +0100 (CET)
Received: from localhost ([::1]:54676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWZlJ-0006Za-8I
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 04:21:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nWZjP-0005Cg-JV
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 04:19:07 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:24862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nWZjM-00037E-JV
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 04:19:06 -0400
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22M3Q694006986;
 Tue, 22 Mar 2022 01:18:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=JgLczwQMglw5Gs7fVzgTDyvWVvbodYrUiPeXtNFotXc=;
 b=URYJFIJ0CARBE0wadqToxvGU+b5GVbEtHZ+apsBBMF/RKx4Hj8GV1BrJgkMWiCgLnbrv
 CHCgxeY97pk3X3at29alPTehWQjh/0kEHxMHSFqTv193yoo2dos0g0CuUnEtMI9/1qbF
 PLTGrffRTsxdG+bQQ7qa8kWhLMx5MavH1puGgKU6vsW+2WHSoO/9ywUdz9xTjSNOxjVl
 +IZdt2NRS8ApvH19Am/H8Wl1KrSlu60gm000nsJsnTwqJozUpR6WWZ5wGSZPUViwTU18
 uBLfoubFS772quFvNxEqK/hcEFX5sMzaCUH0+TvJqq+5U2OOeGoWBLFCFg+wq/waVLjb NA== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2171.outbound.protection.outlook.com [104.47.73.171])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3ewd9gwg9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Mar 2022 01:18:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aeM61Lp9xoQfZ1UMpdSeZAopTMm0DH2b5nVmdKUX5OVBoeeMkv46+6tb1XXgdfCYp27EQTkRV34wG2xrw7suAaa1HpEUCclWrurY+8IKzUIa53+tyAXG9dQ2FU8c8XwChQDhOER6PJ5Sl+eRR8tmKobGJAc5roQHxhdJCwxSQ1JENrMmLgNFowM3X7Ja101ZYCeQwO9Nk7SyXDq0P4U4TD5lAa5Spa3/0EGHHPQ2eQiYzdP7TwngjxCANkwp2xfKBg4UMcFVF/sA9+zihJI+kW3HrLUphbzOq6OW3rMPr62bI56VOvHf93Whjp9PjJ2qJiKTiGM9i5Go2FAOYYx3yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JgLczwQMglw5Gs7fVzgTDyvWVvbodYrUiPeXtNFotXc=;
 b=WLPBiQrINKkZvVk60m0ge0XjfzClnxhX9Lfqb93fw6pFeT+D6PAsd2ZcAcmVd9ivFSC5SApJmB4V97a8gdEGxDsYcDb+3tMtEJwuaREZsX193oRHvvD1RP0hViNi0VjiNo8pY8krT2OhbNcX9cmotBZTBmuj85GsgQMZCZOb4LX1Fo0w68lXgp603vgSm4L1Cgelsk5jhDYRuJtblXD8AO0A8VWmrG04fNbLAGzwefoTKriSp7ba/GJHUfDJcXS3P+5Kr3MavPwz/+CCeP9e+qV5n+Q90f95bKiEktiFReZ5Ouz+fWtOL77EbejeV0XK0HsOMLHBuLB2NDUy9ZSvBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by CO6PR02MB7748.namprd02.prod.outlook.com (2603:10b6:303:a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Tue, 22 Mar
 2022 08:18:51 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d%6]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 08:18:51 +0000
From: Kshitij Suri <kshitij.suri@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] Replacing CONFIG_VNC_PNG with CONFIG_PNG
Date: Tue, 22 Mar 2022 08:18:44 +0000
Message-Id: <20220322081845.19680-1-kshitij.suri@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0072.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::49) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fd40db0-feda-4ac6-e5bd-08da0bdc9918
X-MS-TrafficTypeDiagnostic: CO6PR02MB7748:EE_
X-Microsoft-Antispam-PRVS: <CO6PR02MB7748C7539017CD351FEFBF1099179@CO6PR02MB7748.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iGkzErmaUTDq6En8D9SIzSiRiWDucWU8tgrEybQhnrvRAeHjugHSHud4OEpHpXcrj1bGxjbhz/nu2LPcjuQ7SJaB3ii9fxgedrNtICqEQHOBYEEFAiRs8PZTkfzNP3vbsmPLDmTkzlBh32XEjpFPJSs6QGV4KEtTg7uiXRwMYNLlKjL9y1n6CgsP0Km/RNrvKFq5Y0A3l1NJcLyHdpcp8kJ++EBzVxZBoC9NKRd5+ZXRDH3H2HoW9J8HjBDnBe4Y0ObVP8YhVUP1tnpVDaYIerAGd1Ss4feGzTFV6ihUjsyZNsn4GR8DXrMqYaZt8Rn2V0iaq72usj/vApuSr5XEa1m4LNGJLFDmq5ohz4chzEkGwkDxQzZeOUsT3tZ68652doetH9/veJ5zMPOGgIsPJAPhWeiz7SLzn+otgNkeGCldOIqTtIYcRxt3Tu0tlr64lxtzCjE3klIXY4F5RSod+smOJCotmJOEWuJ7ti6BGoBJNm9KI8XdPLLmfDsueI7z/9fNKVorHwqfBHF/iSQYXxWM3czwTzB9kssSd/xgI1hfscZYub2u4QfQ93erCEqmdZP+t9V8wuCKgHFcNSIbqWLGcOolxUgW5C6+9xmCAFdYxAtjPstFgZ9b/epHtn/wt3YgzJWvPX/WfEFQzZU9cOT2Gpqk7HinZIETzh1/JwFePOuA6b5Z3zfLcuzJP1UrS8QDYV5TKa6MadDyFWH+1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(66476007)(66556008)(66946007)(44832011)(86362001)(316002)(6486002)(83380400001)(36756003)(8676002)(4326008)(6916009)(186003)(26005)(2616005)(1076003)(107886003)(38100700002)(38350700002)(8936002)(52116002)(6506007)(6666004)(508600001)(6512007)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fFckVXEboJkcwkOqyx4NQxlh+U6e3qcqOHCHXP2/0gm4g8TCw1jzDeISVJvj?=
 =?us-ascii?Q?1N16I3XQZZjtzss8TxFeaLI/+Q6R+sqnqQxKxLFtgkBcJ3xiK1kYdcHkmhzD?=
 =?us-ascii?Q?MDbWjamClf1yR2jSU13XGUehuUTbcDzDdOY6Wm4TJ7Kvb0xAnbNSWaQBOc6x?=
 =?us-ascii?Q?CBCLSB9sfKzkXzKD9+q16k/K/Y8a6yMhbSDqHBj8muyWAiSiWXLQcKi3413V?=
 =?us-ascii?Q?foYmV2w97V2GqegPlpF+sK1KLWdTBQhlgEl5wpdcB2SifWi33T6id/h3+B5X?=
 =?us-ascii?Q?aCHOtjYtI5S+BjTdLZSXjfrNfB2iru/Oas0ATQh2K1+8vt23vyHTCHxIX/yh?=
 =?us-ascii?Q?vZFuTavL20P8IXsobly5Sau0oY6Vl+LacNKR5zwWr+Hdvt3kmNzT4CTVTtAj?=
 =?us-ascii?Q?L2kr/I8fCSF3QF8YS1KKo0zpocwJTEV65fUMIFaMUjQ/ofEIZZOI+5IvLp9R?=
 =?us-ascii?Q?wokDTI86MJMu8N5R2hEXLJZ1wQHrySeKkgJZR1T/zQPjrwkYd4frxHJhA4jf?=
 =?us-ascii?Q?U/v7/Kt443g0q4FRFGLX9crk3jgCGqXaR+clUb+/9n/aRnH3xckX6DEJz0zc?=
 =?us-ascii?Q?emouTFTraTSSnB776jijEvwkeHwG58c8shxhE/n8jJK0PsNxwbras/Okc8D9?=
 =?us-ascii?Q?JjUiz7kW/sbon30a6fODEY+L2JWZQy0KHJsdyP6/6fsrh/q4veJc6SRo9HuX?=
 =?us-ascii?Q?uLZY3pgmWItL0ASeCbkszqN8VmycP/z2nuxtbFyM6UgKAQ6XGlPS8izCBX+2?=
 =?us-ascii?Q?gjaPQK3DFRkF+wFynZveJ3K6jsEcPnRk7+w+Z9TI4CJ2bGatXyRcKvLM4kI0?=
 =?us-ascii?Q?xHPgLUErJMxknId00c8W9w6WkgNVn+OBRmveGvfeU06f5zmeo2IKGdhmxQF7?=
 =?us-ascii?Q?G3yVJQZemctTC+mUQWdBXcaQKZs7lKygods0jVj1qf816bj6cF6s8nzFYrkl?=
 =?us-ascii?Q?fRCcfwrdGnuLJSbyqk9WjbB3WpvJ2GKssz0peFHwuYcPTXs7pxcjAg+eZlpb?=
 =?us-ascii?Q?4+SlHHXAd7nRMCizCi9IUJfY482IvOrrrJGjZA4aAOHtoLtZTn4J6roZUNLM?=
 =?us-ascii?Q?/jGm6nyek38krUVTTKCwJxvOjGnjTpQD8PRcRh4CX1CZ1y5gnrmugSqKqOh6?=
 =?us-ascii?Q?YyZRDGRf/Fhu7eAhNY7y9WxU23gK+6gZT6AAUWyotG46klTNF8bT+hNW9Vr4?=
 =?us-ascii?Q?ves/PUhftbquUjtB+EDfbruV4LAmFNMN91nBu00dXFLvvfhX9a4aDPk1JKm6?=
 =?us-ascii?Q?Ee13EMKEU4pxOS2nwiL1DV1XYDNuESh9JXt3KS+xmOvSi7PPyKzT5PKI5wkS?=
 =?us-ascii?Q?kYxH75zIcqzKkiT1N6dIQyf9ydBU9niJKQFjSmU6yG1CoT6J0bOy3PLez4le?=
 =?us-ascii?Q?7tcIhUj5oQL3witN9OncCe3CCnjFoc4vfQ31AqQDGZILz6iyf5If5OT26345?=
 =?us-ascii?Q?/dneItAv2UZGwdsP9mIcX2uS94vNXqs+XgBi0MPC8sDbdlnoErleeQ=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd40db0-feda-4ac6-e5bd-08da0bdc9918
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 08:18:51.7009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NN8hpN+FMQ9JWOE52GRz8d7p4E6gRaLj3/va+DOVhpBiE4H7OrBDO3aZu4QQ+k9VxwwGHvTbDCEwGa4lsVDMrCueNazpJoU2BskW5Hqb5w0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7748
X-Proofpoint-ORIG-GUID: 2xW7hTEOVCTwwtIipgggrJeWpFN6YqCK
X-Proofpoint-GUID: 2xW7hTEOVCTwwtIipgggrJeWpFN6YqCK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_02,2022-03-21_01,2022-02-23_01
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, berrange@redhat.com,
 prerna.saxena@nutanix.com, dgilbert@redhat.com, armbru@redhat.com,
 Kshitij Suri <kshitij.suri@nutanix.com>, philippe.mathieu.daude@gmail.com,
 kraxel@redhat.com, prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Libpng is only detected if VNC is enabled currently. This patch adds a
generalised png option in the meson build which is aimed to replace use of
CONFIG_VNC_PNG with CONFIG_PNG.

Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
---
 meson.build        |  9 ++++-----
 meson_options.txt  |  4 ++--
 ui/vnc-enc-tight.c | 18 +++++++++---------
 ui/vnc.c           |  4 ++--
 ui/vnc.h           |  2 +-
 5 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/meson.build b/meson.build
index 282e7c4650..ccb6840a49 100644
--- a/meson.build
+++ b/meson.build
@@ -1115,14 +1115,13 @@ if gtkx11.found()
   x11 = dependency('x11', method: 'pkg-config', required: gtkx11.found(),
                    kwargs: static_kwargs)
 endif
+png = dependency('libpng', required: get_option('png'),
+                 method: 'pkg-config', kwargs: static_kwargs)
 vnc = not_found
-png = not_found
 jpeg = not_found
 sasl = not_found
 if get_option('vnc').allowed() and have_system
   vnc = declare_dependency() # dummy dependency
-  png = dependency('libpng', required: get_option('vnc_png'),
-                   method: 'pkg-config', kwargs: static_kwargs)
   jpeg = dependency('libjpeg', required: get_option('vnc_jpeg'),
                     method: 'pkg-config', kwargs: static_kwargs)
   sasl = cc.find_library('sasl2', has_headers: ['sasl/sasl.h'],
@@ -1554,9 +1553,9 @@ config_host_data.set('CONFIG_TPM', have_tpm)
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
@@ -3638,11 +3637,11 @@ summary_info += {'curses support':    curses}
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
index 7b86a4713d..e879cca7f5 100644
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
index 310a873c21..8376291b47 100644
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
@@ -3256,7 +3256,7 @@ static void vnc_connect(VncDisplay *vd, QIOChannelSocket *sioc,
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


