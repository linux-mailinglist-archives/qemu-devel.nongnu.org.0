Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F40B4E3CF7
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 11:51:57 +0100 (CET)
Received: from localhost ([::1]:41306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWc7H-0001RJ-Pl
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 06:51:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nWc5V-00080P-Hn
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 06:50:05 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:48584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nWc5T-0006Tk-7O
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 06:50:05 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22M3775b010595;
 Tue, 22 Mar 2022 03:50:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=proofpoint20171006;
 bh=aWpq8ynHbMCTC5tG3JF67oR8pzzbwd8Jq4ZPLYpS9lI=;
 b=RKro7GKFA0YFG5iQ6s6o078Y3IuIw7ZCUr1Ag7jLvcPeZ8kuZSeYgFrVOmjHdtbE3myg
 UlgJsqq4mvOJPlRqPOqqe9N53yPxDxo50xCn4F8OHnAIvKe6t813j3qENWSX6kRz+Lk6
 4kuvHqiMiYTwFlbUAnvADYmciFQ/t2kERFizLgBe/WsIMFGJusWPlgm/Wk9N8INWbIHk
 NFNWIM9S6B6bRrJe/kRhcTQGkq/6czj2g4v+3NxJzHNaJ6lsJoDn2tqa9v4HezesQp8U
 jzi9MyHkHziy0TkYuHT2kmoxp7/lSJBS41AXW4TpVGk59/LTwBGhog78Ygw1jjFKRvcO GQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3ewe8ewjd1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Mar 2022 03:50:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aT5Bnl8ewcEtbxmyP894o4hXb9ABiQGKpFpMVRCCQQt9AOGR5IcSbnroKmuZgyLgA8XT+sjD4487iRJDun6GG3mtUsD7INmZthKp3Mw/utM3NyzChthormTQ2XAyPjOJOHNVZ0NFEpiBMsrZwyD/FyGSpnhUFn68NfEbbtiDPzk/BeDGgOfucj98zEKehLYAOBExIqSQdMhrIKyqFSfIeaKYpfKuEYntQ40eEoqCUNVgH2HyWxrRmElsepvy9EjKfTY11U2sU7ep0fpn+UvfLaiV1gvZ8/tMN52NTXMtTUZjT3tOD+mo8gxdgmfJStoEZFaUnN/yLwNJrmmfYjsZnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWpq8ynHbMCTC5tG3JF67oR8pzzbwd8Jq4ZPLYpS9lI=;
 b=h3cosPOBjBaZ4qm13FAjvddZ8ZyOr4ywKmMnAJ4k/diGI+32EVHB7s4/CXD5JdwhvyEEBwMjihQbPjp6GReUsrK3fQtWxLESuiAchUcqC8UPBGq2cxmnS/3ooOXHa8mlJKUF7rb+G3TfHtsngTNt0H2ufvr+3oGEYsa13cv7I0jCM47bjUit2R6YvT43YaQrE/xPVBbjeNF+F1hcdtrmWhWokwuMkdpSoXnwEFC5ofCW6ezBqsU853EiEYAZx0KfJxn2Lw40j+IgYnsK4tOjUb1Dfwz0jq4ByHhn62ScJKNqD098+VFGK2kR6RXyPiXbPtyWShMIzltzLDZtNzGQ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BN7PR02MB4033.namprd02.prod.outlook.com (2603:10b6:406:f9::16)
 by CY4PR0201MB3556.namprd02.prod.outlook.com (2603:10b6:910:8b::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19; Tue, 22 Mar
 2022 10:49:58 +0000
Received: from BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d]) by BN7PR02MB4033.namprd02.prod.outlook.com
 ([fe80::5d3d:384c:d914:b12d%6]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 10:49:58 +0000
From: Kshitij Suri <kshitij.suri@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] Replacing CONFIG_VNC_PNG with CONFIG_PNG
Date: Tue, 22 Mar 2022 10:49:52 +0000
Message-Id: <20220322104953.27731-1-kshitij.suri@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0253.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::18) To BN7PR02MB4033.namprd02.prod.outlook.com
 (2603:10b6:406:f9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36970030-2cf6-446d-1daa-08da0bf1b50b
X-MS-TrafficTypeDiagnostic: CY4PR0201MB3556:EE_
X-Microsoft-Antispam-PRVS: <CY4PR0201MB35568C78EB8465C1BF129F3C99179@CY4PR0201MB3556.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V3vG8bhcORodHiSHh1bNcfu1FGrcmdsW9pCzFfuIi9d1S0MEE4xjN3cAjAZAjRgF58lSla+ul9cVwCcSlk/OuonJVcZQURu2WfrE9BRsssLd+hgyusEDnD7ML+wPhXgM9LAumHVMTWbqbHgoPEiaVMaMwvOqz06AcYRvxsnZNPqbS6DmCWmf3PzjOdtlhB2NKbur8UwiTPRk3CFzyENDs9Pp65NV5wllTUr25yUarY33ttgBP1wfzPO7mAp+kxDSQZj9nuTbZoMlCm41JgtUPrxbfFmC2vSz8FJF09dkaum15gIMz75B6DV61k7K0DXYyImCwdbUaMJWD9aw0bTKeJOVgVz6CwzaY2NDw/KQH5BKF6zAx5fMF1s7otbAwP89ZJK7evw9QJmiy8YQWvRyqoSxGFNLtDmNVVsvMXbCyB8Wuc2sn6iULv7scVj7M0FuQ9RFTaWfY4+wMAi6rN772B3v9DNwNjmNhwzojcAvjcY6MM2OCxTKwqXHZhuzIVhzmsaYfCFTOuePqvhxnC8M34H9TQpJcyePvtqxWwExBUPyK5azIwDbejwUHNhRIUN8cuy4/ghltC0W8HduXXK/6S93aNG/kZ1nND71EkeOEwyAjsspT2jWgW+2GXJNruaxK/xMrnauuecSygcbiFVtlFuE/Oj04PAi8rdwZn1QX5IThbohZuJoPh+tDplXRDIf77nMZLAaFIJI49EpZJxTqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR02MB4033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(6916009)(86362001)(2616005)(26005)(316002)(1076003)(107886003)(186003)(508600001)(6486002)(6506007)(6666004)(52116002)(38100700002)(38350700002)(83380400001)(8936002)(36756003)(5660300002)(2906002)(66556008)(4326008)(66946007)(66476007)(8676002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yml0ekROK1dKTWJPWWRuUWpQTDVNeDZGMmRrSDMrTDhacFlKOWdpdGx1cWZx?=
 =?utf-8?B?d1hxczlRWmJpUENVL3h1QjVUVElTL05VN1U1aXRZWDhGOXI3cXFXbmhTTnVk?=
 =?utf-8?B?VENGd29Mc0ViWkdNUnlpS3F3ekRKTG5RZCs4M253T3FDUXBPZTZ2ZjNDR3A1?=
 =?utf-8?B?NWp1MjZaQlVtUUNrbWM3NThORzVPb2hLYW9URXppYzlsakY0MGdFNlVXZVdK?=
 =?utf-8?B?OFVPQXdzaWZ5d1p0UXRSNW1nQjlXaTdBcUdCMzMwNHUzK09CM2NJTDdHK3Bq?=
 =?utf-8?B?dVlsWUhSQzYxVU5vTi9ITGVFNGZEVk9jT3Y2ZXkyQ0t6Q2FRUmwxeHlrbWpQ?=
 =?utf-8?B?bDhhbzE3S3hoSkdidjduZlJMMTk0VlRXMEYwaU9LSC83NHNDWVR5MjF6Z1U3?=
 =?utf-8?B?ZmpNZGdBL2dLc3BJdXpxNlVjdzFWZlVqdExqYnpwS0twWUJUZ3l6c2tVVjRr?=
 =?utf-8?B?NEpEZi82M2JuTDA5Tjh3NkN1L1MzZXVTYWxadFVIVlFOMkFGcEI1UlV2RVUz?=
 =?utf-8?B?ekFjbGRqdmdmd2l6cng2eTVMT2kwVVp4emtvUC9vUVhUeGdxWU96NFpVaXM1?=
 =?utf-8?B?cGR2RmRGa1lKM3RpQmd2U2xrazhJeC9vVDFIOG5mM1VrU2h2K1Q3V095Vjdw?=
 =?utf-8?B?eC9xN1h1V0xKNTRuYjUvaFFISGUvbGpOaXQ0cytFU2R3Yy9OUzJGVzlpKzRy?=
 =?utf-8?B?azEwNnEvYlRQZzlUN3FQZ0tiS1A5N3JhRVVvVlhzWmpwZWp5N3ZHQ1AvandH?=
 =?utf-8?B?SE04T1l2MXdza1RqZm9CTG9oejJBTDA4QVBhU2ZRcEx0UlZoZjR3TFdWTFpx?=
 =?utf-8?B?OUErZE5YeC9RSGtrb1ZQOTJwdThjWnJQZnh1RE9RcWdlWUk5MzNZbm1yVW5r?=
 =?utf-8?B?LzNWeXRNT0Y5Rk9EK29nOGJKSDZHWW5jNlRUMkY3dURTaVo4NEJ3b0w4Zldt?=
 =?utf-8?B?TlVPMDJpaTh5Sy8wZThuRnFFaTlTYmJQbkREdUNsRjNGdCtsOVdtZ0swcmRH?=
 =?utf-8?B?bmV0aFZvNWtHNGg5dytFTmN2T2E1WWNpLzF5ZUw4ejEyMkdKOXVVdmNnZVNO?=
 =?utf-8?B?SStOOTRSWlVRTks2c1pZR1FRM0xZc3F2blcyakJkYlNvakdINnpXZjhuVHJX?=
 =?utf-8?B?SnFsRzY2K3l4TU1HcjJaVTVLck1IS3o2SVE2Q1k4SVBKaGNxRjhWa0xxN0Zv?=
 =?utf-8?B?bU5pNVd2WmdYTmgvVXdNZUFsWE10YklTYWNHbFhnQWhXeTRSK0JmbXRiUkU2?=
 =?utf-8?B?cDN0ZTMwakMrY0lGZFNaWnYwYVFWbU56dm5rWjdjVitLZ2RFU2V6M1NkL2tW?=
 =?utf-8?B?ZGpyWUlvUForQ1RNd1JadFdHSUljWEFiLzY0Q2NrenhzV2FGRzR2amF1RFRR?=
 =?utf-8?B?ZlJqTzZha1FCS2JlNHFlVUVLbkFtdWNONWd6clhCMm1tTW9LK0wvYml0b01U?=
 =?utf-8?B?VDV1MTFqNEdMamUxb0lJcGhHd21nQUJidEszdFpRbm0wenhMekxDd2pEVmhq?=
 =?utf-8?B?dFV4YmZBbEthMytqQU5ad3Y5UER6TGxXY1hJTmpiT1RHNjFIdk5ZMFAxM3dZ?=
 =?utf-8?B?eUF1blpSTWdQNm5mdS8zMFlrVGprOXVRMmtYeTBsYXBjdFV6cDNicy9wenR2?=
 =?utf-8?B?VE5PT3hObGQ0Y0IxQ1NrTUphWjYyVUVHNG11SmVyNm1CYnV0YncrVGhDdW94?=
 =?utf-8?B?c1hySitoZm1wNmlHZlZkTElHVmhMTk45Q2pXaVIrUGFRYUZxV1c0RDRhNmRy?=
 =?utf-8?B?K1EwbDF2VENLNXY2SVBNWEVJZnRLMDJWKzJ4MHU3UmJsNjZ2VXRtZGdtczYv?=
 =?utf-8?B?Q2VjazRianhwbWRIM3VBRndJNXRjMlhBNWVHVlBwUkN2VnpCT0pBVmdGeEwr?=
 =?utf-8?B?UUo1QnFpRWJJMENWaVdvV2syNWRmUmV2THhrYUZSVnhSdGN3OFVQeklKR2wr?=
 =?utf-8?B?T3A5NmpaZVA0bEkzNFNHT3llWGdsMXRhYmVlTkxPS1lqS3FrWWpRbzZTeGdk?=
 =?utf-8?B?d2Z4aThCaVF3PT0=?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36970030-2cf6-446d-1daa-08da0bf1b50b
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 10:49:58.0337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rT2/lqTwGp1WhTUPRpZFIitR4VRKBIxEDdT66DvTUN22YFSi6HLx8kQ0F2TwXUtxJmLX2RMtsLQXM27UAJBJHLexWXQu64IUe46LWkaX/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0201MB3556
X-Proofpoint-ORIG-GUID: prHrdkcacyTxcYta2JU52r1yHNJF9sci
X-Proofpoint-GUID: prHrdkcacyTxcYta2JU52r1yHNJF9sci
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_03,2022-03-22_01,2022-02-23_01
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

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
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


