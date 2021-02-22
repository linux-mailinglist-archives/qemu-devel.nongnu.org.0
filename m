Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A4A321EC2
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 19:04:30 +0100 (CET)
Received: from localhost ([::1]:38304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEFZN-0007Py-KO
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 13:04:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lEFJe-00017l-3B; Mon, 22 Feb 2021 12:48:14 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:36462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lEFJb-0001yX-MZ; Mon, 22 Feb 2021 12:48:13 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11MHj4OZ016586;
 Mon, 22 Feb 2021 17:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=ypuTXNuO87SdchQg32SdoBnDfoPAwjYhfVBv2VIK0G4=;
 b=Y6dFKJ5zcXwnWlCweqk0sxHdNcpW71xx2BoPKXwAMdLlnLZ1524yyJu88p6I22K/4Ckr
 7fahS0ceQIpZkm2oUHgCHjLhFWJJut67zs4+d4a00yd4iUz23pGZpAO6Dqs/4M0l6b9m
 1YeH55e/dipXyjwV3kwYlJlAJ3aj0p0j350oNrERgtKk35Dlkz0/tIasGJpO4Ld9YxCU
 0+wf/w7IdVJbSNKoGm+7X/KfwhPyCOSW5sK9X/5ay649PiyGHunzOerHaoRGIP/NVi8d
 lyCScqbXGNURgTGcybI08mnbrH2C/Ls1Cf2WxNGqMWNHymu1McNnvInsJV6a6Id3gdXA qA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 36ugq3bddj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Feb 2021 17:48:09 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11MHkVJ5050614;
 Mon, 22 Feb 2021 17:48:08 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by aserp3020.oracle.com with ESMTP id 36ucaxbrnb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Feb 2021 17:48:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SEtNW+cbAPmfEl0tQFuaPuiLx5Pn//9CsOREU5jggEhhdd5ZAKORqkWx/t9pNJcapzcs6AXuS/g5wmdM35uzryFdASJpIJSn3WgFGsgnMYr8iiEZVcid2jYi0Rzt2nm4k7x28WhXVPxwMooSGg+2wqzt8UU9Q+25KK+ARkM19tVizGkIIugByODcuj7j5yfE7bgxhg3Cuw/vkeUxdu4hxmtrOFFgKGSBVmGwJNLC9ZBznsybDuq14uhWM6oavYDNWqXuub5ewKtVbNHoZC3VCj/1uw87Xgs8YUG00Xk4UpQOZ/Bvp6Ij83DuU/XRGF0TxtWocDameLBvcccJiR3ZIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ypuTXNuO87SdchQg32SdoBnDfoPAwjYhfVBv2VIK0G4=;
 b=PGBqZEbeXn1QG5cx43YaXNkZ7y2/06tqJfTJB4zmbGCugdIwZn2nHXoMip3tLRB9Xaqv/9iMaLlefltG/l2WYVf83xtn23Fp3ZSL8oI/KcNxTDaANCM4eQb6f+r1NWj0kYdv4PgK9YrNojihOwbu8Los/2hFn42BSiTKiywofVKET0v7uFlr1zj6dLFC1jQorXdXaTGbqYUh61ua/CmO8p/8U8IwhfRso4lHuodwHG/iBHsCNEy+VhiomLxudyFHrbYPuKlfOH5zy77+2xX+aZ5rywUT5dabi6QwEMr5cBrBoGhZA6shKq6clifImw3HkKLoA4BJ7W1fBjOrpWrTwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ypuTXNuO87SdchQg32SdoBnDfoPAwjYhfVBv2VIK0G4=;
 b=vR4kgjrcODduptUe0N0/EMtiOPXDw4QuRqzA9Gn7hdP6apcmAInLQ8/PE/bvZrrOLeY6qH0AD4aj40kimfJK1gmv3T6F1WWniQF9kMedzfZPVumrqSNowKPSes1G4mUQzpUFoPZx4FFZIgo7WSqFKgmNLQz9wFAEGQI5zmI8rKo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM6PR10MB3466.namprd10.prod.outlook.com (2603:10b6:5:17e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.31; Mon, 22 Feb
 2021 17:48:06 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3868.033; Mon, 22 Feb 2021
 17:48:06 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 3/3] hw/pflash_cfi01: Allow devices to have a smaller
 backing device
Date: Mon, 22 Feb 2021 17:47:57 +0000
Message-Id: <20210222174757.2329740-4-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210222174757.2329740-1-david.edmondson@oracle.com>
References: <20210222174757.2329740-1-david.edmondson@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO4P123CA0091.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::6) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO4P123CA0091.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:191::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.31 via Frontend Transport; Mon, 22 Feb 2021 17:48:05 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 8a4ffe3f;
 Mon, 22 Feb 2021 17:47:57 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c792b23-d239-4981-c190-08d8d75a029f
X-MS-TrafficTypeDiagnostic: DM6PR10MB3466:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR10MB3466E0C46415874E03B3E1CF88819@DM6PR10MB3466.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:655;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BKamgR/0F4JI02dNkrtXYsUJSpZfy4b/6Vy5xNBivoHIWKD/vsp2JHzPYlGSwrf90Y4ZaW7qBD1gbTp+FmTkbMkKLQN6lTWZUGglofqmcJ1RHVxwshwoIMw2jUpl8Kuhbdlr+j4RaatBQgAHnDcQhUHkYPTed8JFO6a/VvX3LWScdn8k5hNehZZ/bzSA32/97QiSkMx6kqfm9CF1yt+76/VC5wxnQDhOTlVtKv8tKdh4PrUvHQZbGP9X9l7+nfjXQw0zQjxPGgoejH2Ak0HPh7PYl5GWRsiWU8bbWZKfKR/RVFvI190X1wUrGriSS01+2XwIMHpETmNdkuHXOcCYAdT6otjP7c/gSb9S/AJFXEM+J7WGQGCUDWOtub1ScCJkmZhxL9XcVhbd8RBWYnPKvnNI89R2Ii3Ufj6Agdl+aauQR8JUaAoJFmX8I12M/XxfPX/yPpd1KKq/DS/qxfw/ucwy5n+EPuFFA2fEpjhDwMFwBUhNl0GJVenWsCDEw0pcArB5CBvA0vcmEB0MfE1cKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(346002)(366004)(39860400002)(376002)(54906003)(478600001)(44832011)(316002)(83380400001)(52116002)(86362001)(186003)(66946007)(66476007)(66556008)(36756003)(8936002)(107886003)(4326008)(5660300002)(2616005)(1076003)(8676002)(2906002)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3QfSFCrJaN8+brosXR3HpsVv278l4vT9aY7xJHIFEqO15YALr1Q1dRQrZUTx?=
 =?us-ascii?Q?5evBaTrT1dFtBxngaTaGn8qjfh2llUHTI5ATWGF1YQ69UDWqUeFxJYRMlvI7?=
 =?us-ascii?Q?T+1mipKIxxy0xTRSf5T1gPL+0jX7gKC6ZdmBtEshRi/CCzVxBZ0F5FKyKOaa?=
 =?us-ascii?Q?Qa2ltK1W/ZoC2sSModKIkehe3e6QWCFOIMQla6zWzosMf91vt1+gcXuaoHuC?=
 =?us-ascii?Q?WjN0XocBBjf1fZUsNU48to4NApcHTVidHGkLzYn89ZU5ZFjhYtRAR3zX1AXH?=
 =?us-ascii?Q?AbZgnGqtuH5rY8OHcqfGedoXIgDX+2OCzPRa8YNpT+uzpWvCVWEV06SreWhb?=
 =?us-ascii?Q?Io+tQ282lwZ/CCFaKiBDoS5a7lvsYkqG86lAs/HPhaER0n3McJCzpfjlRLiz?=
 =?us-ascii?Q?6egEvHqPJi2ST2DmUvRVOGg+eI18jf6HFQrNZ46XQ9Im4Lb2fr0WMR+QMikM?=
 =?us-ascii?Q?B0/ih9QvUMEJPpWuEAiN1OwU2JCmE7EDYADIxnnvOr9Lpk/wogQ888pB+5Nx?=
 =?us-ascii?Q?9xCaVRfs3b23LX2aoDEXMz9P/8akeuFHrYC+7ouiPgpwxtIDFpDiPFJliViv?=
 =?us-ascii?Q?NWmV/oFaOfuPvXntMOiWI3OhBdgbOwnh/LKeX6rak7Qc1q0tL/+nHeO9nxvI?=
 =?us-ascii?Q?v5PF5hnp8PdDPHzhKDxG4Fl1GExLd2OMZMxSrxlKZH2YLJhgM9THUe3pXWjP?=
 =?us-ascii?Q?s+0psrfXkY10ML8nOqkQZ4HPhiRMWa/CHXV7NmfXoIk6q6uPTfO38fcOXusA?=
 =?us-ascii?Q?cqeCgsZZx6mlre9CuGIoAK5PXYSkL8jtJfTiwxr7luQGUuahaq5Lppmfo7VP?=
 =?us-ascii?Q?zo9AAOONUkiN/DtJpio2ATdj6vyamGY3nGiS/boZ4xaDuw/FCLaOgNuTakMh?=
 =?us-ascii?Q?vhLn6lCUgNqdTfLNAOh0GnOJci0bXSqgOvsWkqeOfM2KNvTB0xCJ2gbzn7vH?=
 =?us-ascii?Q?Sq5RB0Z0mLF2k5EZnVMhMgOt//UMkZmpb/7F8X6dgPEijmxvQuQ4adIx1mTG?=
 =?us-ascii?Q?S37ZAePgCJqg/P/ITlDmX0ZwhVIYOAZK8N6rX/nP5p5SaiD3cNcPxriRMB0v?=
 =?us-ascii?Q?q7lCZ+nVDF7EOW58fDAzwxcnXjeQIjWf9LjNS0aJ1iLIhvMT0ykBwkfUWkK+?=
 =?us-ascii?Q?QmpPBZ4wI2EiMZe0YGdiZ2LG/pvB5OxeJMIcj8GKL+MZpEtBxjzGZAC9tXnE?=
 =?us-ascii?Q?tfqdWF/WsYzB5pUY7kdhX63JICDRqUGNPWKVrTGxnQ+E2qEfLKp6lsSGQh9N?=
 =?us-ascii?Q?Vt2jpdR973WHXEySlGUH4ogzaty1tuyMrYeyTNBzrE9HH1JdX1KhGDIum8ig?=
 =?us-ascii?Q?R7talbNvW3dB32YlwMbzl8jJoEE5Tair7aN1wKyq1BjJlw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c792b23-d239-4981-c190-08d8d75a029f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 17:48:06.5447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XdZbLY0y2oHy6GdCHhziY14AJ9mVxA68uz6MXYwbBRfsUg7lrROtgOisMN0eKdlOQH8HQLGPNf8vupTTmGKs0csuDh7eNKS5IsitRr3NKEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3466
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9903
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102220158
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9903
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 malwarescore=0 spamscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 lowpriorityscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102220158
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=david.edmondson@oracle.com; helo=userp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow the backing device to be smaller than the extent of the flash
device by mapping it as a subregion of the flash device region.

Return zeroes for all reads of the flash device beyond the extent of
the backing device.

For writes beyond the extent of the underlying device, fail on
read-only devices and discard them for writable devices.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 hw/block/pflash_cfi01.c | 106 ++++++++++++++++++++++++++++++++--------
 hw/block/trace-events   |   3 ++
 2 files changed, 88 insertions(+), 21 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 6b21b4af52..4b6cbc85f6 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -83,6 +83,8 @@ struct PFlashCFI01 {
     uint64_t counter;
     unsigned int writeblock_size;
     MemoryRegion mem;
+    MemoryRegion mem_outer;
+    char outer_name[64];
     char *name;
     void *storage;
     VMChangeStateEntry *vmstate;
@@ -425,7 +427,6 @@ static inline void pflash_data_write(PFlashCFI01 *pfl, hwaddr offset,
         }
         break;
     }
-
 }
 
 static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
@@ -646,8 +647,45 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
 }
 
 
-static MemTxResult pflash_mem_read_with_attrs(void *opaque, hwaddr addr, uint64_t *value,
-                                              unsigned len, MemTxAttrs attrs)
+static MemTxResult pflash_outer_read_with_attrs(void *opaque, hwaddr addr,
+                                                    uint64_t *value,
+                                                    unsigned len,
+                                                    MemTxAttrs attrs)
+{
+    PFlashCFI01 *pfl = opaque;
+
+    trace_pflash_outer_read(pfl->name, addr, len);
+    *value = 0;
+    return MEMTX_OK;
+}
+
+static MemTxResult pflash_outer_write_with_attrs(void *opaque, hwaddr addr,
+                                                     uint64_t value,
+                                                     unsigned len,
+                                                     MemTxAttrs attrs)
+{
+    PFlashCFI01 *pfl = opaque;
+
+    trace_pflash_outer_write(pfl->name, addr, len);
+    if (pfl->ro) {
+        return MEMTX_ERROR;
+    } else {
+        /* Discard writes. */
+        warn_report_once("%s: attempt to write outside of the backing block device "
+                         "(offset " TARGET_FMT_plx ") ignored", pfl->name, addr);
+        return MEMTX_OK;
+    }
+}
+
+static const MemoryRegionOps pflash_cfi01_outer_ops = {
+    .read_with_attrs = pflash_outer_read_with_attrs,
+    .write_with_attrs = pflash_outer_write_with_attrs,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static MemTxResult pflash_mem_read_with_attrs(void *opaque, hwaddr addr,
+                                              uint64_t *value, unsigned len,
+                                              MemTxAttrs attrs)
 {
     PFlashCFI01 *pfl = opaque;
     bool be = !!(pfl->features & (1 << PFLASH_BE));
@@ -660,8 +698,9 @@ static MemTxResult pflash_mem_read_with_attrs(void *opaque, hwaddr addr, uint64_
     return MEMTX_OK;
 }
 
-static MemTxResult pflash_mem_write_with_attrs(void *opaque, hwaddr addr, uint64_t value,
-                                               unsigned len, MemTxAttrs attrs)
+static MemTxResult pflash_mem_write_with_attrs(void *opaque, hwaddr addr,
+                                               uint64_t value, unsigned len,
+                                               MemTxAttrs attrs)
 {
     PFlashCFI01 *pfl = opaque;
     bool be = !!(pfl->features & (1 << PFLASH_BE));
@@ -684,7 +723,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
 {
     ERRP_GUARD();
     PFlashCFI01 *pfl = PFLASH_CFI01(dev);
-    uint64_t total_len;
+    uint64_t outer_len, inner_len;
     int ret;
     uint64_t blocks_per_device, sector_len_per_device, device_len;
     int num_devices;
@@ -702,7 +741,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    total_len = pfl->sector_len * pfl->nb_blocs;
+    outer_len = pfl->sector_len * pfl->nb_blocs;
 
     /* These are only used to expose the parameters of each device
      * in the cfi_table[].
@@ -717,33 +756,58 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
     }
     device_len = sector_len_per_device * blocks_per_device;
 
-    memory_region_init_rom_device(
-        &pfl->mem, OBJECT(dev),
-        &pflash_cfi01_ops,
-        pfl,
-        pfl->name, total_len, errp);
-    if (*errp) {
-        return;
-    }
-
-    pfl->storage = memory_region_get_ram_ptr(&pfl->mem);
-    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
-
     if (pfl->blk) {
         uint64_t perm;
+
         pfl->ro = !blk_supports_write_perm(pfl->blk);
         perm = BLK_PERM_CONSISTENT_READ | (pfl->ro ? 0 : BLK_PERM_WRITE);
         ret = blk_set_perm(pfl->blk, perm, BLK_PERM_ALL, errp);
         if (ret < 0) {
             return;
         }
+
+        inner_len = blk_getlength(pfl->blk);
+
+        if (inner_len > outer_len) {
+            error_setg(errp,
+                       "block backend provides %" HWADDR_PRIu " bytes, "
+                       "device limited to %" PRIu64 " bytes",
+                       inner_len, outer_len);
+            return;
+        }
     } else {
         pfl->ro = false;
+        inner_len = outer_len;
     }
 
+    trace_pflash_realize(pfl->name, pfl->ro, inner_len, outer_len);
+
+    snprintf(pfl->outer_name, sizeof(pfl->outer_name),
+             "%s container", pfl->name);
+    memory_region_init_io(&pfl->mem_outer, OBJECT(dev),
+                          &pflash_cfi01_outer_ops,
+                          pfl, pfl->outer_name, outer_len);
+
+    memory_region_init_rom_device(&pfl->mem, OBJECT(dev),
+                                  &pflash_cfi01_ops,
+                                  pfl, pfl->name, inner_len, errp);
+    if (*errp) {
+        return;
+    }
+
+    memory_region_add_subregion(&pfl->mem_outer, 0, &pfl->mem);
+
+    pfl->storage = memory_region_get_ram_ptr(&pfl->mem);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem_outer);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
+
     if (pfl->blk) {
-        if (!blk_check_size_and_read_all(pfl->blk, pfl->storage, total_len,
-                                         errp)) {
+        int ret = blk_pread(pfl->blk, 0, pfl->storage, inner_len);
+
+        if (ret < 0) {
+            error_setg_errno(errp, -ret,
+                             "cannot read %" HWADDR_PRIu
+                             " bytes from block backend", inner_len);
             vmstate_unregister_ram(&pfl->mem, DEVICE(pfl));
             return;
         }
diff --git a/hw/block/trace-events b/hw/block/trace-events
index a715a2e173..85b501e23e 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -17,10 +17,13 @@ pflash_erase_timeout(const char *name, int count) "%s: erase timeout fired; eras
 pflash_io_read(const char *name, uint64_t offset, unsigned int size, uint32_t value, uint8_t cmd, uint8_t wcycle) "%s: offset:0x%04" PRIx64 " size:%u value:0x%04x cmd:0x%02x wcycle:%u"
 pflash_io_write(const char *name, uint64_t offset, unsigned int size, uint32_t value, uint8_t wcycle) "%s: offset:0x%04"PRIx64" size:%u value:0x%04x wcycle:%u"
 pflash_manufacturer_id(const char *name, uint16_t id) "%s: read manufacturer ID: 0x%04x"
+pflash_outer_read(const char *name, uint64_t addr, unsigned int len) "%s: addr:0x%" PRIx64 " len:%d"
+pflash_outer_write(const char *name, uint64_t addr, unsigned int len) "%s: addr:0x%" PRIx64 " len:%d"
 pflash_postload_cb(const char *name)  "%s: updating bdrv"
 pflash_read_done(const char *name, uint64_t offset, uint64_t ret) "%s: ID:0x%" PRIx64 " ret:0x%" PRIx64
 pflash_read_status(const char *name, uint32_t ret) "%s: status:0x%x"
 pflash_read_unknown_state(const char *name, uint8_t cmd) "%s: unknown command state:0x%x"
+pflash_realize(const char *name, bool ro, uint64_t blk_len, uint64_t total_len) "%s: ro:%d blk_len:0x%" PRIx64 " total_len:0x%" PRIx64
 pflash_reset(const char *name) "%s: reset"
 pflash_sector_erase_start(const char *name, int width1, uint64_t start, int width2, uint64_t end) "%s: start sector erase at: 0x%0*" PRIx64 "-0x%0*" PRIx64
 pflash_timer_expired(const char *name, uint8_t cmd) "%s: command 0x%02x done"
-- 
2.30.0


