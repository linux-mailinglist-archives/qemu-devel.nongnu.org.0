Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CCA4C443B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 13:05:34 +0100 (CET)
Received: from localhost ([::1]:44320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNZLo-0006Xz-KF
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 07:05:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nNZFX-0004MA-JS
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 06:59:03 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:25418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nNZFF-0004T1-3O
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 06:58:49 -0500
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21P9vEgd014089;
 Fri, 25 Feb 2022 03:58:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=VKdt10DC43bzQYMSsj5NNg///m7/c/n7Ic0Rgbv3GvU=;
 b=cOAaBwOFDB7YihyVwQoluetwURPSEjLSJ4NACvcar4v/Yxo9ya5D1EKZzfRkdD1uY3Q3
 9QDCkgr0EaUJMFUqRN1piZKSeshpaF/H2GH0DxWqqorRyo1/S0heEFEleukAkJUt2cdc
 dPjOLzT8Ar/7phvyW362riUDLWmpeVmwZcur4QfSm8U84efknaLY16Otemukbt6sGXpW
 0sL/TuuT+xaBeFyMltymV06EDBEWQqFsk3A9S1Och5GxE4+fLTnqjWYpska7bBO3tLOH
 IagHuJuehsMdhwJQEuy0XDruGZk9xqssf8m3bKe4xK5sUhF58klVVnCi7xN2vT3LIbVW 3A== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3eectnanw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 03:58:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSE++SUWWOmQNFuKnQrmNBXL7q8JeozxkrtWQeMTYJxD4dYC1Aq9mzS2hesxJ7c9Viq0dgB+spAIhCKXB1vX6gOqChIxBKZ0KFDQ1GCBqlgqktooutsSFgHLK5aAsdVmPn//wGiYbn+FDy2CkLdfVLQ9Sc477RO5QhMXGUQzC8aCbAZsN/t9WHJhVocB3mIQ6DD9e/L/DI7V3Luf6nL+/Cj5WMqDUVo6hBUqNUF8L9BbIEZdvbBwYEYDaUP2eS1onqtdQtww/bNaYi/TQGe/eDltKlNDkZF/h+fpCjcTzDs5lrMZY0NPYVDJ7TcAJ563Rz3ZXt+pLO4n86TG10Y+Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKdt10DC43bzQYMSsj5NNg///m7/c/n7Ic0Rgbv3GvU=;
 b=a/E12DkNiLVzDEcp5DnOtf31ae03GObM+0M8wzMyU2dhmrbRqZzDRko7BZuVcWAiEiXhpHY+wEAODDOnfBL4Psoh8EZwbz/QS6bambKE7xQ3Yv4G4oX/dDbVK27jNNXf9XXy1soMsn1TvtvOBSlDo1MCC+/RL/YBIcZM2VuPqglEmlfVWTyzciHmd9XJU3AF4ErSESIL01F03A8wSDZ2rjlFsbtj7DRT8OOVMKh87MgvPTTMEez4Q1DofgiCsTkLQ+TtIXWqlXTjqvlX5d3AFLKqgZi5Otr+clgh13uh9e7YCg4lNvhdezT/5paXzHHZSEtzf8f5anBqY0fpnds2dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by SN6PR02MB4639.namprd02.prod.outlook.com (2603:10b6:805:ab::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Fri, 25 Feb
 2022 11:58:40 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::ade5:1204:b102:bfab%5]) with mapi id 15.20.5017.022; Fri, 25 Feb 2022
 11:58:40 +0000
From: Kshitij Suri <kshitij.suri@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] Replacing CONFIG_VNC_PNG with CONFIG_PNG
Date: Fri, 25 Feb 2022 11:58:29 +0000
Message-Id: <20220225115830.177899-1-kshitij.suri@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0159.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::14) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 737cd929-7146-4d9d-3b2c-08d9f85629e3
X-MS-TrafficTypeDiagnostic: SN6PR02MB4639:EE_
X-Microsoft-Antispam-PRVS: <SN6PR02MB4639CE7A19977667D854147B993E9@SN6PR02MB4639.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y85JBG0LBnEYpYYW5YCtVma6AVczwulYltignzw0UMpwEC/uQLqxEfCFW8abWZ9T9t2eMiYALOtuEm3KTkHItkBwP2YKI0RmPFZxnVfvr1mL4GhwOyoZyHyqpeSwjnWwOvWpUvOkNc7209VbpT04ztiiENRWem2Fj70d9RYWDiltyiUJ0sjauUpLrfw6zSyidKInPqRpp3zugogxVXUO+6WEexF8QT2JBItd/Y+iKqjayHDtNvwtphU7ubc+WHmcaFPMgWXVPUWLxptjPE66hc2S9aL1H1praNlc4bdNWN7AAjRq4mFh0UwNFPxlerQztwShFcJpgD+y2gej5HDox0bRYhgon/A9suaM+a8S9j1XotbSBqW+6ay8goVzKPPEF5JNc49AJ3XWPFMzvhoovl5HCNpyP5Zagk7vwYChlFf1LPUKhID9wju8oMlWtHe2WNX228qggwrWzifmD/Ygp7Q0mWi6eTM8kRqAzGpTMgVtoGNsmqEZuCM79zb/nbGyRzi/pGH6syeZJ39+YorqP57tqcS89g8yVijmlMkQECNrRaN3GRrU2hLmjFPY2tk9IvvGKzdr0FpLa76IerIN787bX6zd/xOkbqOoLaGWNo+peAo+7g5C0lxardjtQlw84aJsFMb/0S3Qc5iWK0XA96LYbwWNSqWzjBwE8WrTTd/qU1pi9YkkZFe5SkW0y7/PCAqwRq99blw+d8phEvtc+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(86362001)(38350700002)(316002)(6916009)(508600001)(36756003)(6486002)(5660300002)(44832011)(8676002)(66476007)(66556008)(107886003)(66946007)(83380400001)(6512007)(6506007)(6666004)(52116002)(2906002)(4326008)(26005)(186003)(1076003)(2616005)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0BF5BxgyejHY66VkApiceNBpWZN5GE3UKa3Y7k93Ye8ZqTyIU7XFthCx6yWu?=
 =?us-ascii?Q?hhEqBcBn27Nv2eX1rRq5KCkit1osTMoBBsfZpWpYRVMKSFsLGe3aSDEHJrSD?=
 =?us-ascii?Q?xNTsndkNeq4o5xKUGnTKT8zq5tHdVQJhabozECeKIyV8ZC5PpsdhizDNR+Zg?=
 =?us-ascii?Q?XQfPO+4Mrw1Pwp7fWvtgvXm6LnGYweLy0GsUezEygcsbUgDIAY7qox/NLPGU?=
 =?us-ascii?Q?xqW5dpAOK+odJS99Has9gnM4pQYxUtko2aGgbt2/U+cgbjqno9fM5eWAATZx?=
 =?us-ascii?Q?31e3qmTx9Ukb75JEmpZ3mc1S205ErcKnWKEo2akWs8knbZRP0/198TWaRbqv?=
 =?us-ascii?Q?BhWOZZhBqlR3vKj35eDnhBNVd6I4JAzabPTVMWsett3rQ7xjbttUJHIz754W?=
 =?us-ascii?Q?tjrTHsvsCil3DFGo13mW5N4nES1e/BeKqjXdLS6HwB2JnP17pEzwaR7SlAIS?=
 =?us-ascii?Q?SGpdMzZuxOKqzLtlaIsLDJ3Tt201e+0V0jaAajSSlD/eLrqqpaZPNwLT97GN?=
 =?us-ascii?Q?FbIrBM6dve3YdVCDxGFDrFbQURVdXqMaf0RQrv8cJpnD2IlbaHZNvr2uQTE8?=
 =?us-ascii?Q?h/9RQkh4NqKKTtlkrEvbLJSVyqkoHgYGnNAk21j1XgaE4TaaVgkD6Zf7cGBF?=
 =?us-ascii?Q?TXp7a541pWc7P5qGChMdOrdEpCeSq3GaRXpmV90iYqLU/DOL8RG68FkF4Zfc?=
 =?us-ascii?Q?OZGIqR/uA9EPCiZb+holh/dEuMED8TZzmYvKEDptKlb2LAz8VZ2wqdhhNJrN?=
 =?us-ascii?Q?PxsibxZ5s44MwZm4bP8yNyNT15uukNzQN1eoOlhqQo+gfl9uvl/TGymCuUkU?=
 =?us-ascii?Q?0yT3qBIlwgKYwAWLqQJSBgV0LZ67/omrENVi2G7XlSYTabk7fn4FJOCZW7hY?=
 =?us-ascii?Q?74HAcS8x0bdRTrpJPrSZUBKZlMCizGJB2NdMMSgNYOCzGFyA5Xc2DXCAaOQs?=
 =?us-ascii?Q?UDKEUnr04PdGSBlmK3uZcvP1wFAejvINl8TjGqy/SIRARoboDuI5Krcn3qe1?=
 =?us-ascii?Q?EYjCWjrrBIPRS/4suc+gkDv25S8ya3o+N88+Hn0lGSXym+kLXkc9qX4HfhcO?=
 =?us-ascii?Q?9Y0jCiF5AMmOqa6Tl6r0Ps8A7uZX2wVy+m4D9dsWEpXwwrREpKCywcSijg5s?=
 =?us-ascii?Q?4qq9zElGRW97/d1RYzzaC/a6aFF8pZMdVGx+5lfA+UcQL08WqsLBuZRp5NbB?=
 =?us-ascii?Q?5HAxQJMLUteW6XYaGJ4gBbLoPyPWAhUB6Sg6ZP/Jr+EIZItetuDIS2B3XllY?=
 =?us-ascii?Q?5AjM10nMCLcWGpaEFI0LtznyRg8VPzG9hRR8Fvqso0CdurpSyRLImiEPhu5F?=
 =?us-ascii?Q?VpnQd+Phx7JajQ+c+c02xBSUsjQqcMmAStm2daK949m2vhDSyaeI6zQrJXEf?=
 =?us-ascii?Q?IXRdd8JGAhmwt5Ta5YmzzuMxcH3Yx81/WYfTn99Bj0GOQZX35lUewfJ9XXDN?=
 =?us-ascii?Q?QA7NriA/wuPkve2QinNx0chpIIgP0v5GGWJGsXeGSy0+cNDOlhnsRaj8G/Nn?=
 =?us-ascii?Q?cpzKcWbRF7cdlo7nDQRyHzjIh2r80SpG+WuFkvkA3HFSHNJUdrPjZgXjtjoc?=
 =?us-ascii?Q?Y56Ay0g57hnT3TquCLX8Otj0v/WxW1CfD0PDJymMT8979FFD2sSc6EwzrmV3?=
 =?us-ascii?Q?YPqZTBKih5iPLncwX3/lwi6K5Tfg4MHqXjQ/Pg8Dna10notSec6dCmPwk2AR?=
 =?us-ascii?Q?hXJLAVdoYWlK3bwloDIxi2MOaXc=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 737cd929-7146-4d9d-3b2c-08d9f85629e3
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 11:58:40.4831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FKv9tcPFe3Y9vedoaq6QD00IHaTN+5156BF59PKEsUwJiWED8aU8ZG+TDO8UrdS7lOkSB/0k3E5411hh5gfaXrvQ2X0pxaQ52gBKTRG3P6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4639
X-Proofpoint-GUID: dR0OAfv257jEWHR11HMxS4REOHFHAGMM
X-Proofpoint-ORIG-GUID: dR0OAfv257jEWHR11HMxS4REOHFHAGMM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-25_07,2022-02-25_01,2022-02-23_01
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
index cebd35841a..14396e9f83 100644
--- a/ui/vnc-enc-tight.c
+++ b/ui/vnc-enc-tight.c
@@ -32,7 +32,7 @@
    INT32 definitions between jmorecfg.h (included by jpeglib.h) and
    Win32 basetsd.h (included by windows.h). */
 
-#ifdef CONFIG_VNC_PNG
+#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
 /* The following define is needed by pngconf.h. Otherwise it won't compile,
    because setjmp.h was already included by qemu-common.h. */
 #define PNG_SKIP_SETJMP_CHECK
@@ -95,7 +95,7 @@ static const struct {
 };
 #endif
 
-#ifdef CONFIG_VNC_PNG
+#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
 static const struct {
     int png_zlib_level, png_filters;
 } tight_png_conf[] = {
@@ -919,7 +919,7 @@ static int send_full_color_rect(VncState *vs, int x, int y, int w, int h)
     int stream = 0;
     ssize_t bytes;
 
-#ifdef CONFIG_VNC_PNG
+#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
     if (tight_can_send_png_rect(vs, w, h)) {
         return send_png_rect(vs, x, y, w, h, NULL);
     }
@@ -966,7 +966,7 @@ static int send_mono_rect(VncState *vs, int x, int y,
     int stream = 1;
     int level = tight_conf[vs->tight->compression].mono_zlib_level;
 
-#ifdef CONFIG_VNC_PNG
+#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
     if (tight_can_send_png_rect(vs, w, h)) {
         int ret;
         int bpp = vs->client_pf.bytes_per_pixel * 8;
@@ -1020,7 +1020,7 @@ static int send_mono_rect(VncState *vs, int x, int y,
 struct palette_cb_priv {
     VncState *vs;
     uint8_t *header;
-#ifdef CONFIG_VNC_PNG
+#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
     png_colorp png_palette;
 #endif
 };
@@ -1082,7 +1082,7 @@ static int send_palette_rect(VncState *vs, int x, int y,
     int colors;
     ssize_t bytes;
 
-#ifdef CONFIG_VNC_PNG
+#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
     if (tight_can_send_png_rect(vs, w, h)) {
         return send_png_rect(vs, x, y, w, h, palette);
     }
@@ -1233,7 +1233,7 @@ static int send_jpeg_rect(VncState *vs, int x, int y, int w, int h, int quality)
 /*
  * PNG compression stuff.
  */
-#ifdef CONFIG_VNC_PNG
+#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
 static void write_png_palette(int idx, uint32_t pix, void *opaque)
 {
     struct palette_cb_priv *priv = opaque;
@@ -1379,7 +1379,7 @@ static int send_png_rect(VncState *vs, int x, int y, int w, int h,
     buffer_reset(&vs->tight->png);
     return 1;
 }
-#endif /* CONFIG_VNC_PNG */
+#endif /*(CONFIG_VNC && CONFIG_PNG) */
 
 static void vnc_tight_start(VncState *vs)
 {
@@ -1706,7 +1706,7 @@ void vnc_tight_clear(VncState *vs)
 #ifdef CONFIG_VNC_JPEG
     buffer_free(&vs->tight->jpeg);
 #endif
-#ifdef CONFIG_VNC_PNG
+#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
     buffer_free(&vs->tight->png);
 #endif
 }
diff --git a/ui/vnc.c b/ui/vnc.c
index 3ccd33dedc..1bf3790997 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2165,7 +2165,7 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
             vs->features |= VNC_FEATURE_TIGHT_MASK;
             vs->vnc_encoding = enc;
             break;
-#ifdef CONFIG_VNC_PNG
+#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
         case VNC_ENCODING_TIGHT_PNG:
             vs->features |= VNC_FEATURE_TIGHT_PNG_MASK;
             vs->vnc_encoding = enc;
@@ -3248,7 +3248,7 @@ static void vnc_connect(VncDisplay *vd, QIOChannelSocket *sioc,
 #ifdef CONFIG_VNC_JPEG
     buffer_init(&vs->tight->jpeg,     "vnc-tight-jpeg/%p", sioc);
 #endif
-#ifdef CONFIG_VNC_PNG
+#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
     buffer_init(&vs->tight->png,      "vnc-tight-png/%p", sioc);
 #endif
     buffer_init(&vs->zlib.zlib,      "vnc-zlib/%p", sioc);
diff --git a/ui/vnc.h b/ui/vnc.h
index a7149831f9..0cabcc2654 100644
--- a/ui/vnc.h
+++ b/ui/vnc.h
@@ -201,7 +201,7 @@ typedef struct VncTight {
 #ifdef CONFIG_VNC_JPEG
     Buffer jpeg;
 #endif
-#ifdef CONFIG_VNC_PNG
+#if defined(CONFIG_VNC) && defined(CONFIG_PNG)
     Buffer png;
 #endif
     int levels[4];
-- 
2.22.3


