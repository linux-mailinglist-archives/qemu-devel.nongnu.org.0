Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF0E4C845D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 07:50:39 +0100 (CET)
Received: from localhost ([::1]:60776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOwLG-0001E0-6k
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 01:50:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nOwFd-00081Z-G9
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 01:44:49 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:43794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nOwFa-0006V5-QC
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 01:44:48 -0500
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21SJ6rSc015219;
 Mon, 28 Feb 2022 22:44:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=9vARoc5tEfrCv0LNPooRMlevnMa0GTxPsLKqJcDA3Hc=;
 b=xrGNuokPK7ZBY6W/xW7zxSJJ1S0VYhwGHwHN3lR3iYqDo+sQDxsr3dbpRnsUvpAVRTQs
 PIgWs7boPUfJXfvvuCRHs3u5G4oLpsdU7BdZBhWjWFoh7aeYo+acf2LqVtpMS1i8HMnB
 nC58wz/ZO8e1T8pmOMS9GgE8jrPTemQJls5VBbtnwRPkHPYMjG2zfucTH3jz5f4nhx/t
 OSGgraJcEVpQIfj5NWFYIKR2HuDo2Ibw+VkG1R4MEngxTQTIXom6CCoiqLLF2HoKPjAi
 YG3MQwXDrRZEBi3cLyAqym9xWhyIDxLEql0OKrMgJcP/h7RFHmLXODATo/agJUD9IoJU Og== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3egue3j7b3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 22:44:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d79kwoK2/tcPxuhEOPLa4n+enm7kxbqLT+UqlYfWNPyORTAi0mHPIQpxNioee9iN+RbXRXOcZQgLkFO80zzdTucuylKNoPKQn3juofHvMDUnzTIanby1uUYxoTj8M8ovZ1wNpe6eFIJe9J0ApFs1w/pE0r8vz9u9oBBWbhs+m2U4gCzRqy4/GOuam1eTMiq695iKTSj88vT8ZdEKIzO/FsVcWe4cASqzA710PoadAmd43R/Xz9rNTyKA3dqaebIYxc5sxna+cLVs9Y/JVGv8ae7p0Of+KhEM0Up0Zfkcan8HiZGbmXwmjz0x96SrbIkD99fulYmbQuPFbe/wI1VqLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vARoc5tEfrCv0LNPooRMlevnMa0GTxPsLKqJcDA3Hc=;
 b=CSk1nNuklNq/+KgPeD0KxdAMBfUM1DNghMiExS5nOPv+OPINiqzPlhMYJFUO43U1IAM8JhOyeYKpkqcjVN4tg1B0ZBnFM3CNl09hqIykMYk2RNCTxaJJgFRupCbb8naLs4zfArVATAuDfd1edQw9GbZrpbPiaxlOkyFZPcMgY/HfmeyNf0oLvdyZbs3WvA31lIWhSJRXVBHZR3eXbOm8pRdikA4L31oC5h+2qRMRh8GQ2CAOKaqUcyZoJUleN05KmCENzWpBtYkGBxvSl+y/1cnCSD8koCPz+Rs+HFuMPB0cvFMJ34xpIgn1ioQFG/zHhYzSE643MATr5AGOredJoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4048.namprd02.prod.outlook.com (2603:10b6:805:2c::26)
 by BY5PR02MB7011.namprd02.prod.outlook.com (2603:10b6:a03:23c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Tue, 1 Mar
 2022 06:44:30 +0000
Received: from SN6PR02MB4048.namprd02.prod.outlook.com
 ([fe80::94d7:26e1:9b7a:657f]) by SN6PR02MB4048.namprd02.prod.outlook.com
 ([fe80::94d7:26e1:9b7a:657f%5]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 06:44:29 +0000
From: Kshitij Suri <kshitij.suri@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] Replacing CONFIG_VNC_PNG with CONFIG_PNG
Date: Tue,  1 Mar 2022 06:44:23 +0000
Message-Id: <20220301064424.136234-1-kshitij.suri@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0208.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::33) To SN6PR02MB4048.namprd02.prod.outlook.com
 (2603:10b6:805:2c::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6e6981a-f8e7-4303-3458-08d9fb4eefad
X-MS-TrafficTypeDiagnostic: BY5PR02MB7011:EE_
X-Microsoft-Antispam-PRVS: <BY5PR02MB701129773CEB28019376010B99029@BY5PR02MB7011.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bqOFT0Fbw0v8yRAzoG7729PatiQPofIEdOUSOMIxh4a+VZNtDxCJkgRg2pr3imPWe5YllIgAYva5FjAb45wRiZBRnHnH7IZF0UImJ9jKZ2oHf0TNEeDSnt7MFEouhxawt7E0n2Phw+y52iUXS6a8wzo9FWxIFn1pomVbyetGsMComzLFvmovMBRQdM4jnOOJzNcyl1wmWCMazXZwlVSKeL5HytDlx7dRuKcAGdClBFneJaYfaCYwgyjwXj87dSkVWZpK502CNOt+TskBUPEGyYYWgj3F4IMdf6hS2x5CM9XjKPTMvu95Wfj8NJtKQFNnRJo16lJxqdqievsMg+S9D6qD9cvMdWWKpUPY6lcrJgRE2kpZ9X+w4FIcQXPVqmxJhru4DyUxzKuWT+YJJgMY0a8GZrzk1+NcJ6fJquBFKdoBHTwgWjtMljhWbM26VaqdgPZFmUj4wvMtiYYf5+3KNND87I05IQxvTGY0crGjWvxJYRCxRl7yHbQELFbQXBhrKo5enuLP0mtQIYPwtiWPp+jNO90UAstHmLYjJIkRNZm+8aX3senndNlAEZXUD+aiqBj0yPAiPiVDrmccaGW71Gl3uBrmynzHTpUty0TJ7x0KJEIcQl3O278Fe/+/gb3ixSO3PSwQTj2RXLNWzVqmDFF5G0qcLEXEoEHpLMl7m03eg3fY9yexBKHpymad3FLfM+kMjSTjQAZp7+i4uLyKPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4048.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(107886003)(186003)(6512007)(6666004)(83380400001)(6506007)(6916009)(1076003)(2616005)(26005)(6486002)(316002)(52116002)(8936002)(5660300002)(44832011)(508600001)(2906002)(86362001)(38100700002)(38350700002)(36756003)(4326008)(66946007)(66556008)(66476007)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZafqwR+hqzY7LLvRp65QN4+nrplF0msOWCe/dvZ6ZMxdn1JQ7Y0KS+aJdIUK?=
 =?us-ascii?Q?q8dmQVjwR+K18kXV4RrsdgUZ1IFjOEJIOiC6we1/jnneVZH7MsjiCm1+7vYS?=
 =?us-ascii?Q?L0GM6LOvQwpek4DjTboePzaELyky5xZLbx6PmaBagltSthk77/AkNYZMPpwZ?=
 =?us-ascii?Q?OZlEn2BgBYhmzAHdyCnQvIp0+lQwzGUuPVkFtHLLfvhFrkFUmfJJQZmriGc5?=
 =?us-ascii?Q?S/pGN2cryVhvd6TLAL+MTK2YnUQqzPfxkup6sKVzA/rkYszFo+vUWpZx9Jb4?=
 =?us-ascii?Q?tQAV3nWt5QSFKna84IFq7iD6vuZU61EzoXhMi7AcuKsS2KayUHqNBf+tAZ88?=
 =?us-ascii?Q?9GOXWRcOefJPcLqUOrBrtulCod0ldcv7sQ4YqFLMKBiQE9Kvbm/D5GJwWtUf?=
 =?us-ascii?Q?ONuTTxwRZdSHQEQM1EmkHcnak8O5UoQSWju0SOunkCrw8wRX7qp93BUeJk4K?=
 =?us-ascii?Q?BtK8ytyBkQrGOoV16odkP8DHnRNKIpygAXEv+Gw7jOGYDHTcNMWHmsDA2tgD?=
 =?us-ascii?Q?zOlpvlkR71pHx1n8cG2lG+1Xfe86ZdwdIo7xg3Zd1IHUbzb1uAoXOknJxNkQ?=
 =?us-ascii?Q?Vqy8fP6hZ/1FHGR+3sEHvvbPzTFJhDVzHmZzuMT1Vs9/CVy4wOpgan+IAxFM?=
 =?us-ascii?Q?27PB2YIW7uDbP6zomjjAXmCa+qNTdsbQ6FnaX1jf+UVYkO6ZWFAF959UkoPr?=
 =?us-ascii?Q?/v2sMGt0Qx/HF0/93DT+PR5ZHPrmJbQFZHh7/BQ2Tdf/Gan51Q3gT4Ezkw2B?=
 =?us-ascii?Q?VU3kQ5peDxypE2jQDYOn3ljt9uSxrKaOB7ipC1PBlftFvbdohQXdci39VSrE?=
 =?us-ascii?Q?pEClyUHYWfdW5N+tZLVB4b6J92OtMPkU+kyfGxvbV6QJkbsnpDQYjW6xf00g?=
 =?us-ascii?Q?VKIpD+S1xgPdCRKwii9gVklDAMY/9z+BWGEd9iObMT9cHjFRGPlpqOVD/3ak?=
 =?us-ascii?Q?GiZdiIkAy7fsq0FnxHRMg2Uxzy8MW6A11vlW1yqsQuWIEl4bjrnMjoO9ct07?=
 =?us-ascii?Q?QPMxLwCuR4OIbKHGd/OwPSoLfv8Yw9XTN1GeIshLWRwZEkQIF2q9b3Tt33v2?=
 =?us-ascii?Q?B03DtrezR8PLy6cJvaPpyUgbrAINH2H6FxJyiidCq9NiEk+A7Jctaw5pLW3Y?=
 =?us-ascii?Q?e3cPuX8s4AKGtCFewJIpNw+wbzHweWqk2k1S+GgT29S0gT4o/N1xaj2X4Rv4?=
 =?us-ascii?Q?gLFSrNhcJcOr7UEU3APeOtVCY5YidWWfAIIjfJ7aNVJh0BveByXB2WgauCUQ?=
 =?us-ascii?Q?+xoedYeBe5vH/86P7e5WKuMw3wc0GDNrLIVY8LGi5UygHvrxFFIP8Q3mZ/Fe?=
 =?us-ascii?Q?DAKulkodrH5qu0ideRBFqSlhmiajT6eZC59c4jVtXKeJkIG3X7CSKm6W2oOo?=
 =?us-ascii?Q?sVHgq10eaqji6ovRFs6634IF+tmbqA7YwbpakZJGs718naxeOeeXRW+m+Jjc?=
 =?us-ascii?Q?1srPKL2cdVTO1tPsqObhmeI7vdxYG6JBDs7M1LRIgfbQ5Z8ngG41uAHRmY4P?=
 =?us-ascii?Q?DRoGuZt04ag0LPUZF78dQGByFNAmwC2C61673yPR6n+AH/Ao32rOwWITCfQA?=
 =?us-ascii?Q?mvgJGsrJzRR2hQjS0q8yYoLvLhWqMC12thSjkYQ9+XLcSqKeTUxggOpBJqEL?=
 =?us-ascii?Q?z63UYc+QK/h0wtluRf54+uIZjq4TfdszsqQ8WiE5gha7h2YKLhKXbvVR/l9B?=
 =?us-ascii?Q?3GGyNIgkEE1VBkuVVcepCDGnrQs=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6e6981a-f8e7-4303-3458-08d9fb4eefad
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4048.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 06:44:29.8324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JETee9gTURaxi9VR0Z0pG6c/loYx2j6mpue1RBO3npxXpFWK6GQCUQEPdY6aLO0KPUmvRzLFCso4VhmxhTq0Fm5PDqOTEbJOmx84hM12G5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB7011
X-Proofpoint-GUID: F6N7yJIQk8E8QOulZQ9iPGf-w3MRoCRJ
X-Proofpoint-ORIG-GUID: F6N7yJIQk8E8QOulZQ9iPGf-w3MRoCRJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_10,2022-02-26_01,2022-02-23_01
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


