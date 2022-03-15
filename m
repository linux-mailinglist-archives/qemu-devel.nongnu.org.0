Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500A84D936F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 05:49:20 +0100 (CET)
Received: from localhost ([::1]:37126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTz7X-0004RY-4T
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 00:49:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nTz6B-0002n2-RQ
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 00:47:55 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:26326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nTz69-0000Jd-8H
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 00:47:55 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22EIZjPM003588;
 Mon, 14 Mar 2022 21:47:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=9vARoc5tEfrCv0LNPooRMlevnMa0GTxPsLKqJcDA3Hc=;
 b=ML+YfcpefPKwrTllbnNF74lLYEL9PGJdrWHfY2cpLdbGvNTs7S0FUlQc9FVpvKaOX+5b
 YmzJuYBbv0hcCRygQ6W7JSgLmAqoEPNK6L18fE7V0HD834evZW314aPK9iit9yZmo7GL
 YDk/TOxVg7PgBPxFbFMwejTsjLONyT5ctjNKg9ZeEIOUZCi58piQk092aZS5AtOuWVGK
 RyBb9DQFa1+CHVABwjEUFUlhOaYHb7TmfBfPOmSt0KVFVKePFmb0s+Wt8EkDW/0kSIIO
 VMOSiGtJt4mBxbihNIGInekGq3L7m//JExks5vauCpxKNdREkFgB58ONA94GxUCtPLNO kA== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3et63h1p4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 21:47:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PykMzuTBS5Jz+EvXn3vZ3TpmEY9yPGB4exbTBmKI2cX/bzwBEG5mJWypQRJQujNicwnGesOlkAZyIO+n1TzKXY+s7nhHdoGidNR9HsvM218UtRbclie5GjLIU/eUOR3ayF8P3keq8n+eeCxcJa+FwxYDcpGXTS2/vs6n4CAW9btnvD9NaqlV91PPvGM+GHbSqjccrR3XM7wOLsWkfApgct5P4zdrhGap4kPw/V2FfQEHmdKtFvoTzzcpQ1QtyjL4NkFs2Hcm0hi/bbXJF1kgkkQHCwfBC65LQI5RD4nLwoPMXxzlyaLMNCl9SY8uN7TE2kTHaSWcjz684sSVIgKkyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vARoc5tEfrCv0LNPooRMlevnMa0GTxPsLKqJcDA3Hc=;
 b=GzjrAlXDAAHt5t/k6ZJbqPTO4Vl5JclEH63wtYb/H5CFpLqX28u6Ai9hTDUMxX12f1dHZ9ExF3l48eF64j8IQsn3qBiAXD1tLwrC0yO26HKQg4sVagHd4WeBgtYwz3zApc9UXuk2ru7LSKCbZLk4vx9sfFCRZntemfMExfGXxvxrzwiedb41VMIUyuSSxVu2xzSne+Lp/fae93pkEuHw6FczCoYYXDTnltx3uXQ8/mdsoq6UsEijVnHpfkG3PnKoAua+XiD2IuktQhoOLvfI4fxbFsFFKPjJFEWVenn7DhTeU3TUFdgjeRWFigBlNNtDqA3OHcySzQTYNvhEfARTKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by DM5PR02MB3210.namprd02.prod.outlook.com (2603:10b6:4:62::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Tue, 15 Mar
 2022 04:47:46 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d%6]) with mapi id 15.20.5061.029; Tue, 15 Mar 2022
 04:47:46 +0000
From: Kshitij Suri <kshitij.suri@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] Replacing CONFIG_VNC_PNG with CONFIG_PNG
Date: Tue, 15 Mar 2022 04:47:39 +0000
Message-Id: <20220315044740.155268-1-kshitij.suri@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::7) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e612fd1a-51df-46a2-085b-08da063ef2d8
X-MS-TrafficTypeDiagnostic: DM5PR02MB3210:EE_
X-Microsoft-Antispam-PRVS: <DM5PR02MB3210ED10389DC5FAE35AD51799109@DM5PR02MB3210.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cw0znQRKXaHFchufJ0yklkI31ZltspetIX52qofkKUeSe8QhXHUQR5CSTf7h5OTGbjWTPNeWJJNGvIO2SzpihFFA4ZSfol3nRvs1xXbiyS450knR5tcx3Pmq4zNntsKDkdTLvDDAU7vjA/IH9/Nelm7x79aSeNV3pzpp6rojD5vYrIz3H055rGFIM0qwUGI/uKAawXrTPtwBNv4JtdN2B7ALJwes5cPUQykUK396i8dT4VQ8beBk1rlieHj+1sBgEzHyux44VozI5y707xqyz76UVu9xfZrW0dnpBZvH//vT976Ehl+/jEnanJ13wu+jtqSkGsL4Ux2UNN8szK/jxdAGkBm3vBRe47935776mWXbp1Oovav/X6oo0dvt0BcEUgpg7lmde3QJI3XT8iCU2KyZozKLowRPc1ieVJLEGy/EP8dT7IiswFIbY1kgtutk5Jz1qIVuO2SaIgfqTPj0oJ59QxxrP+OphKeik3TcF8U+V8jW5eqHV/fLv1EGYIWvGjI2thpg5ij2HlhVRhRMXxadvyQjpps5eIeklHzqmAZ0Eaj9Kpa23utRvGVqO+LEjXFSq27yOTk8ElcTqRlnxJ0SrEWCeAtk+38ZNQhRf+P6yF0h0zEFVEQIUF1mKhQnjZ2jybvVzLgMEK4KDxAIAHfafX+VcvFKqlf6hNNtLCwMmGIOyx7xSYF5a5ZHUfmq0qtGgJcQnqmYrH5zdoXo+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38350700002)(38100700002)(83380400001)(8676002)(316002)(26005)(186003)(4326008)(6916009)(1076003)(6512007)(2616005)(86362001)(107886003)(6486002)(6666004)(44832011)(5660300002)(2906002)(66946007)(6506007)(66476007)(66556008)(52116002)(508600001)(36756003)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TtF0ngDmy0mHllKQd6o60xHh7MW8kv8q7kNQnEtyMG9wbcrGul2N7U0wtxPh?=
 =?us-ascii?Q?Fhn57FPgwQOUOep3awkUybV6kFMPharSYNpqf2/EiuYjXwpBeZ4ggR1l3ZT5?=
 =?us-ascii?Q?ATPIgnMQkL12jhwcCVGoamoJ+pLhZxrOaILnr5lGXqiwP+9AQUDhuc/Me0EH?=
 =?us-ascii?Q?8abeGhUOD6lv52zeqYJTjBAhFGhdkuWWZBq0GcZh5CFRwQqSjW2vdNmuI7ZP?=
 =?us-ascii?Q?NUqJXhF2xz7W8zOSWRr4Rhw7fTwiDwg3DKQQ8vQjN7WxnS/VkccgWSEF/Vbk?=
 =?us-ascii?Q?qeMTCsOgLjaHxyubxFvH8qlkhc2mdpRCuX3bTdL+MPrGaKjR3u+lsTjW49yu?=
 =?us-ascii?Q?x13XR4SjizVfQcHGev5h3xF5ANVXktdOIzDwRU8yjaFebgcUVTgW9mvQyRvy?=
 =?us-ascii?Q?DA0hH6wXEOOB3nF5N2kH1SRpxaaDj0eHGjMvHYrU+NSwEPgGWvXcHamTk/XW?=
 =?us-ascii?Q?bHs6FrNFsKX+SHFPQfH0SAcr/Ztf1/CuuQMP87Qwax8NujyNlYgPqDQynjNN?=
 =?us-ascii?Q?dlWAQyhurinVLgBin97toe5kcv483dTBEcKkfIJyp8YBOksGVk163M7iCFf6?=
 =?us-ascii?Q?T9o5KLUBMKJF+o7n4rTGpuHxgkeXHUEgw5M7X2TIYIE/m9IKId0oeHJ9EFFv?=
 =?us-ascii?Q?DEaMlatQKhDoOoqgB5X6v/TBu2+k2whr9bXuZeYtzdw8wGYMKZYfZHCy0nP0?=
 =?us-ascii?Q?Wnue+aI1xHXcT4NVb5aQWC+QMWxneCM54tUxgvy1qm3ww+kKc6xWEsBGGnzm?=
 =?us-ascii?Q?ehU95P1n38brA2VZVbcMlA/AHUCGoH2X56kfluK6Om06jOWQz1J5CwXFAOq5?=
 =?us-ascii?Q?bi9OERqShMwqSNEO6/nnXpI1p67MzW+FMZDh89tMmgyNWQoNe4qWNXG0WoC+?=
 =?us-ascii?Q?BP/pWy7euKCr4nOnUzhPF8Gdj2JeZIgaoukXS9jcM7z8HWtOQ6V/Fu2XEI5J?=
 =?us-ascii?Q?WVdaNpxx3cbn2LbSP2+TX0yP8uqs140kV3TswzQF2gVQXm5kceGYtZqbXJF+?=
 =?us-ascii?Q?tDhBNB0n8hOsLWPgDOtg0Q5q1dYgv2h3IX48Hue93ZYYi3Hku1nSjtjtuMp9?=
 =?us-ascii?Q?pR/zP8KWeTxglyAR5PjWk0uxgpQHrvqqAafBeZ3KSUNXsIM6utyLPnkiFzdZ?=
 =?us-ascii?Q?HEUTnZ4e1uXdpKFwjDvbkmJUCVPMRBqxlPHEZ2skSfqvhFgEqjM3YT1KX7Jr?=
 =?us-ascii?Q?GgatupmMyxgM/bQSzdfCtA3zC/1sug2DxefKgCtO+a7fKTYtxw71jWTM43e8?=
 =?us-ascii?Q?xH56aMo9DNVQpQ5VnTFvwWQXWds/uV3RtYBOc4A11tjbtiohlZdJGNPyOvgH?=
 =?us-ascii?Q?lXescd2XcomiLncMxJz8k5JKN5aIlbMjON+0y2HRb1JsolOFfUqEZBM0D8ej?=
 =?us-ascii?Q?9t0kf/F5YQjnAzZUuYXmT57dl0tu61lXYNeMqMqeALLahRjx7cTmePXPCIVn?=
 =?us-ascii?Q?S+YVeY8CuVg6mYgsyldSeDAhth+6TXY4haH66j2djCJ31UjUpacc3Q=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e612fd1a-51df-46a2-085b-08da063ef2d8
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 04:47:45.9735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vW4Kbr8TKnC08HhNSwwHplDtvLm3IgipSnO+8CErq6PmUnBhx7HPgHXr5bf5lmMiluJNBjzEbMjAjhjJkYKCg+l4CqhqssS+JJ3jxO+3Gvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3210
X-Proofpoint-ORIG-GUID: HMcDS5js5HF86bDDbKvQE1gDnj7jFl5L
X-Proofpoint-GUID: HMcDS5js5HF86bDDbKvQE1gDnj7jFl5L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_14,2022-03-14_02,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0a-002c1b01.pphosted.com
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
index 8df40bfac4..3b67f83a2c 100644
--- a/meson.build
+++ b/meson.build
@@ -1112,14 +1112,13 @@ if gtkx11.found()
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
@@ -1537,9 +1536,9 @@ config_host_data.set('CONFIG_TPM', have_tpm)
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
@@ -3579,11 +3578,11 @@ summary_info += {'curses support':    curses}
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


