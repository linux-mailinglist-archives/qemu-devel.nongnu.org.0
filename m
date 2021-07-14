Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2562A3C8946
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:02:38 +0200 (CEST)
Received: from localhost ([::1]:57046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3iHN-0008Lu-4Q
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m3iCB-0007ll-4W
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 12:57:15 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:24170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m3iC8-0003gg-Vn
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 12:57:14 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16EGtTO2022036; Wed, 14 Jul 2021 16:57:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=UIRcz0pvGTUkSkZCcsyk27rw5xMmS/v/s2dXMtmEXco=;
 b=Ep2goG6aDzzsJ1Z/38xS6WyAJ8Xopu26lnhpx4YKHsqRi+G/kAgA7AkvGwVvm9MbYT23
 XcRO7OAKgxWzo4Z0nrqbqK5Am8dot8FB6JE2L7o4OgJA9354Pe/tbfZdaePFQ5qWqH1l
 pYeD+UW0PnpiHxeDVeozVDQjxZPbHLpo4Z/FZN8EQVRTG7y4r1PAdQ6PiOEx6+cBIM2b
 eMQ2fpEz9MM/iCnl7HUUQiEyE43Mq+lFcSfw1iK5aB1sYkPhbYTlUfCnrwxlqhmdIu5a
 Cc7EaCUZjuVbRjmVXmPoAQi5juP+DtIrbnAN3ODNruKuotB1va8hg+S5bcnpyM8yybJx rQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=UIRcz0pvGTUkSkZCcsyk27rw5xMmS/v/s2dXMtmEXco=;
 b=EyzunnNJ5aAFzSMSe3R+BsHdbeeSVJ2aQAXIeeE4JOwIcXwm8z5ui8JPe6tK5ssrTJqo
 00J2p5Aeb5Ul5uLyBe2XW6Sfnp7Ntfljj0z6vZ7Qu4NIPRLaX0CjmCIVujCBDw21sdT9
 oBNOG1ztUHewVjRV8GQsL2wb1CjWtl50A5vzMt8nJWsjBB49gz0nzj+I+CQCJCfx12mO
 hImwHpkXDXnCatg3qmX90OSd2V3PNouaVe391XH/xG+zVV59QZv0L2OcUmHr39q50MLI
 KO8EAnWaE4umfVgdw4pZbB8jjax1dZ8fen4VbWzgNvuzPRH9x/S7+HMPoEbPud7/MGg3 aw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39suk8s578-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 16:57:09 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16EGovqA168314;
 Wed, 14 Jul 2021 16:57:08 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by aserp3030.oracle.com with ESMTP id 39qyd12hr1-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 16:57:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AeZF0DNXuuerBkmkPr38SvGr6BGyytf7NZxGV12q8jMd3vTdw149ndCMA8fnsOcRbrWOHj3iYZ1Rr5EBjNdJ3CebiqA5f4TWhhqqt4niXKTfkaneR4C/JO6MHVQLLNvIlc9qhT98ZPP3ZmX3j2yD4ixdr+HQP21vUwKIVrWxECcu0bioCXo8kKK37HhmFOO10km6qKqC7HVLOmjQlK+3LBQUy6G13TTHpYMzHYzsYxXsQisWVOMSHaYOKeI7PJPT6MLHu0ON2C2SA32Y8kLkguQaEFPjiwWH3lTtWPR3+85QqbfNUZGJxEq/rJoMKdh0SPjoxBnzs5L47n4zX56qJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIRcz0pvGTUkSkZCcsyk27rw5xMmS/v/s2dXMtmEXco=;
 b=at95jD/dn7ZhGu+a8IO9TecLw8OcUSYg5BwfQjQ6BdTjNyh0XowDJlzltyvEaXku7vuWxEWZloKvgFhTVmG/siuNjskdkX+8fJiLbHxk4QMdfpW7N0EsOwDZCwLpn2wkWmDVm4ZO3VZ6ZAe1ZiNJ8uOJuDuFDdNr95DctjNxrQ8oZDLbyT8A7LhmJRyeiWvwxbrkvewnuqrcet7uy81h3R1E3LvIJz/uadzTLh8qCtO2sIHm1jJmqtxDYeA69JIDbflQ9P5AFDYzX1NM3FaowZv6OSnNi/e18oSt0a01bxk9KU4oVd02+37527GjEn426MXyq4+M2LMVldeF5waWwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIRcz0pvGTUkSkZCcsyk27rw5xMmS/v/s2dXMtmEXco=;
 b=tb4FnQxyrH7Gd38zoRCKO9I2+BQ9f8VVraVbmeLVekmOu5t9zFRji/pE2BeWiikmIednp/j/dr4GwcdRfVzJZ8b/wXJYPTD/RWkmY8auoNr1kuT6Bzb24Y4mldUJkH/Thcm0PEVJw8NXiFnV0t7y+jFmJqMB95ivTVKfJu3AI80=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB5438.namprd10.prod.outlook.com (2603:10b6:a03:3b8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Wed, 14 Jul
 2021 16:57:06 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::fd75:49c3:72bb:ca64]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::fd75:49c3:72bb:ca64%5]) with mapi id 15.20.4331.022; Wed, 14 Jul 2021
 16:57:06 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/3] msix/hmp: add interface to dump device specific info
Date: Wed, 14 Jul 2021 09:56:53 -0700
Message-Id: <20210714165654.23211-3-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210714165654.23211-1-dongli.zhang@oracle.com>
References: <20210714165654.23211-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0009.namprd11.prod.outlook.com
 (2603:10b6:806:d3::14) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (138.3.200.16) by
 SA0PR11CA0009.namprd11.prod.outlook.com (2603:10b6:806:d3::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Wed, 14 Jul 2021 16:57:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1274970e-a461-4815-8b27-08d946e86980
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5438:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB543849B177ABECF939DCB8D5F0139@SJ0PR10MB5438.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:183;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cOfP8HvIlaeHTYU6kpjmPA0x7UJMlrrpdsFjm89L+Uo2986ctBYDcZx2Oq2cwdonSfqZBDVPEqS2wiwpgpWEtsAX/bkA7ReqH5a5OSK9r9RqWq3ovMhuAH/R8Vo9i4FPUZ3A/G4MDk/hlpMmRYVeios67CZuqg8Nq239bDTkyNzHJ1btFoLXrOsQn1bav0pgFfSvmCq3iHQNsjLPItuYk9zYgJ8YuODobMIHYlGC5Ad3vY3WXJwNPx0PyJtAAzXCy6A1SC7RSpqQdDSskZOay5JGhixvNZlgdltsq8MVcK6PpEpd5AyxMkPWnzAXM7eRFv9JqF5LkWN8KR3UaDp+X6MOtQld69K6G4Qxfy/O5ldWA0K1/b0ldyMYNilq1Peyk5q9oIZQ2Xg48kzlr0Tt0wzR4yMaPodpRaMNbQ2ow+OU71b2pcatP9We6RTjgwl+IXiIyoORlHyq95RRBQMyri3+yq7l3UF8+CCrdUF9lwt/n/q1WgbaNP+GhcZK9kNPs09FD+/FiwCgOKAY6AAXwp3vU78DfjjFvdE2Y5Ac9zsHcwuJXnjzjdqNqNEC8HcC3GN0Tlun63Yz6H/JKvevTpLILngGGnO1DCliG4Ojw8DEtoiB0/bm3OmJmpu5eODlknMvdDhOA6KEL6kQ37sFsOxOZ5BcOuyasfFF1Stetqzd1AyjoBTtk4Be9vbA7Bf4LcGgN2XLSvPBWTvB9K1mrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(376002)(39860400002)(346002)(366004)(36756003)(52116002)(6916009)(66476007)(6486002)(38350700002)(2906002)(8676002)(956004)(6512007)(44832011)(66946007)(2616005)(66556008)(6666004)(478600001)(8936002)(86362001)(5660300002)(4326008)(107886003)(26005)(83380400001)(186003)(1076003)(38100700002)(6506007)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IMVWgN2CtrEN/gOqPX1K7xAgOnvcgMBX4huBjRfpMRVAFyX7POyWKGqpJLaw?=
 =?us-ascii?Q?4opysucLob7USXvFsCRy/C4grZyJjGwu3j5Cx4Lk6qnw0pOE2u8KDd/A/WP7?=
 =?us-ascii?Q?5d1xpcfw44TnMKOwvSWTHmYJ6fbwqFc2vsUYQJBPh5+45EwUetLdtmzKCmg+?=
 =?us-ascii?Q?o3tT6kv5LfbEAp4dV01KzhSFDgoRTf0QFAvcNiXHit5lbjIY2N5Wx44SG/KA?=
 =?us-ascii?Q?1EBOzt4BtLEhDiBhMccEEIt152KeF0KdeclDloy3AYtnDtcnnLjrQf9f9cZQ?=
 =?us-ascii?Q?edL9wwWRXB+fh/AH/0TsRUDaE/TwYo7E7u64jGl8jW+3wcPmQiwkx4ui60Os?=
 =?us-ascii?Q?48xp53vnp65hlv02CEUP0wZvOEvansHzHP48rScy895rA4vbDH5KRkxHEIIU?=
 =?us-ascii?Q?k+9KRNOCbAShig6GHDJfSts0RMsQHkNBxXrabcw0tIq4/nViAO9X927+nJ2J?=
 =?us-ascii?Q?XTGiFSbZzsklgCZqCFp3Zqcrs+Sa+AaWhguySTW+xp/cRh6ZtS7rXLXRJY8f?=
 =?us-ascii?Q?JPawyaFXytajeqmqIiPwB1Nr+RDLlUqSpIpMtBUq30+9HVrfggPUJIOKJg6x?=
 =?us-ascii?Q?g4iuvY7/HdjE38uKzPoD1+OUl/xYGJhGPjBMhns0gMkoLc765mfAbsscR/WC?=
 =?us-ascii?Q?hVc4L/qlwNi4V66YmtMvbUPheyIygQkZuiEnPjxuNQt87Zkx9jOIpKAGOlhp?=
 =?us-ascii?Q?GUqvdj2CNtIaqb7xVcw2y2Jbv5nT90Aj42lgAgRQHH9/8QCpflG1sjkQ9qV9?=
 =?us-ascii?Q?uXewhSd9uEJKr5boxfgqr5pWARze/nOrXXYXdL+Wec1BKkIE1t/2CPgQ9r0N?=
 =?us-ascii?Q?qxximJQfqlyI8mSAcaOpP060nCUcGBMeuzjJkYfFSJbB9KDD9ruKApQLTGFT?=
 =?us-ascii?Q?MikN1j+ZjRT0ODlqaSYBvhnR9407unTWFyO0MNjyt7wvyaZ7I3dVOtplE0zR?=
 =?us-ascii?Q?n5tMuSPf8o/wQSyC3t7LZKIkycaIulzSueNuBLtsM0r1czkGSfvliXc+w1dj?=
 =?us-ascii?Q?O1QilJiMgH2a6Fj60JgRgtYarvLnvcwHcD7CxHDoj2Q+w8mirZ05K6OOwUBz?=
 =?us-ascii?Q?ZX55xP3qJGSKxVOmPtfFT3492FecfNohTUwUktrtjFiugkeKFBDnzTuqyjsZ?=
 =?us-ascii?Q?lpreJQbJGtp7Ik2SUyldbFgh/hoxvt17BBjT7zEzFXkpy8tC+kglcqxzJzK3?=
 =?us-ascii?Q?qnzxwbyAdVOGjv7B9aYXp5aC0on8cY39bywiifl2yNwqLnUqV8Vzy2mtPkR6?=
 =?us-ascii?Q?unXq2G6TOeVrBIjFIwHyzvwg8ZoVOiTVWkHjpucYfA3oWek3VX3c0ijlUvVq?=
 =?us-ascii?Q?lebf3912u2DNyZ623ffxyfrJ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1274970e-a461-4815-8b27-08d946e86980
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 16:57:06.7753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LJNBNnYTTlD00SneRFVCnbV79IQn9aMtiDu2NMyz692xOkODU5cYFVYZR5OhgD2uuT1vyIOgkF9lyrULixAFXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5438
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10045
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107140101
X-Proofpoint-ORIG-GUID: 3TrBjMuNJ51EDikcqw6VWh54DjKj53Dq
X-Proofpoint-GUID: 3TrBjMuNJ51EDikcqw6VWh54DjKj53Dq
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 jasowang@redhat.com, joe.jin@oracle.com, dgilbert@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While the previous patch is to dump the MSI-X table, sometimes we may
need to dump device specific data, e.g., to help match the vector with
the specific device queue.

This patch is to add the PCI device specific interface to help dump
those information. Any PCI device class may implement this
PCIDeviceClass->msix_info interface.

Cc: Jason Wang <jasowang@redhat.com>
Cc: Joe Jin <joe.jin@oracle.com>
Suggested-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hmp-commands-info.hx   |  7 ++++---
 include/hw/pci/pci.h   |  3 +++
 softmmu/qdev-monitor.c | 11 +++++++++++
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index ce5c550d44..4e831d7ae4 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -223,9 +223,10 @@ ERST
 
     {
         .name       = "msix",
-        .args_type  = "dev:s",
-        .params     = "dev",
-        .help       = "dump MSI-X information",
+        .args_type  = "info:-d,dev:s",
+        .params     = "[-d] dev",
+        .help       = "dump MSI-X information; "
+                      "(-d: show device specific info)",
         .cmd        = hmp_info_msix,
     },
 
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 6be4e0c460..4620b9e757 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -129,6 +129,8 @@ typedef void PCIMapIORegionFunc(PCIDevice *pci_dev, int region_num,
                                 pcibus_t addr, pcibus_t size, int type);
 typedef void PCIUnregisterFunc(PCIDevice *pci_dev);
 
+typedef void PCIMSIXInfoFunc(Monitor *mon, PCIDevice *dev, Error **errp);
+
 typedef struct PCIIORegion {
     pcibus_t addr; /* current PCI mapping address. -1 means not mapped */
 #define PCI_BAR_UNMAPPED (~(pcibus_t)0)
@@ -224,6 +226,7 @@ struct PCIDeviceClass {
     PCIUnregisterFunc *exit;
     PCIConfigReadFunc *config_read;
     PCIConfigWriteFunc *config_write;
+    PCIMSIXInfoFunc *msix_info;
 
     uint16_t vendor_id;
     uint16_t device_id;
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 7837a17d0d..7fd3fe0ada 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -1011,7 +1011,9 @@ void hmp_info_msix(Monitor *mon, const QDict *qdict)
 {
     const char *name = qdict_get_str(qdict, "dev");
     DeviceState *dev = find_device_state(name, NULL);
+    bool info = qdict_get_try_bool(qdict, "info", false);
     PCIDevice *pci_dev;
+    PCIDeviceClass *pc;
     Error *err = NULL;
 
     if (!dev) {
@@ -1027,6 +1029,15 @@ void hmp_info_msix(Monitor *mon, const QDict *qdict)
     pci_dev = PCI_DEVICE(dev);
     msix_dump_info(mon, pci_dev, &err);
 
+    if (info) {
+        pc = PCI_DEVICE_GET_CLASS(pci_dev);
+        if (pc->msix_info) {
+            pc->msix_info(mon, pci_dev, &err);
+        } else {
+            error_setg(&err, "Device specific info not supported");
+        }
+    }
+
 exit:
     hmp_handle_error(mon, err);
 }
-- 
2.17.1


