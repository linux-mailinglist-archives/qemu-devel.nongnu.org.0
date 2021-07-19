Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC8E3CCDE8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 08:30:00 +0200 (CEST)
Received: from localhost ([::1]:57474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Mmt-0006o9-Bu
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 02:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlE-00043E-52
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:16 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:30574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlA-0002GG-Jx
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:15 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J6GHn7029063; Mon, 19 Jul 2021 06:28:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=FFdyD+a/2ZQkDVqNWUbWAz5EoorT/d2BRjeGywpi544=;
 b=C2fCLmE/nGgZDcEIw3/dS7KtFuFFDcCgONvNnAcVBFXuGxWD6fkm58qlaCGT0bjYeRkL
 eS9e0hKtGekFb0cBKKi9N94IeiBPHMZTGJxoGFoCk1PgdR+x0b7vwQv6t1Jom7bzFw/8
 a+/SSUo6fgaP1uPUsTY7IAJkk+dEOW0SV6OUynceCZm2nBsAX9h+zyS+pXFEN+2vMnXx
 ldgGNiG3c/PwxjA983YWugVjUv3WN3FZS29FRiNfpSj+vzPmhuheWAtqQB8SpiVml1wf
 VQwAc4ItxoTR/J8HHdXjNFsQaJtt81uncsdD6vOOVTHlJ2Qiy0W0BhEafkoFweQVTzOf yQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=FFdyD+a/2ZQkDVqNWUbWAz5EoorT/d2BRjeGywpi544=;
 b=xPdneKT7W8f02gyzJTIFww/MP32vZumrkZcLl9jRGCdNRhOqBkm7mWAfyg3uKYzyUDqL
 iwahPABO4PjkQAMQbnKTvyMEjrvcHXSa5me2Wy7c/3KNDzwEbyISZqKgMbDyit1EPrxs
 xn5q2UGO4bh2jAoQqp8y75Pj2AjfOmq4Tg5KxFHd+cjgWm+oREhndijFUYWx1HSL3EQi
 G71edVnbQlPOckfuptrvyOk3Ovre44qKwirH8/cctPAd0blRfs5jkWBgnDcdvEXb+b0A
 wC0CzAs00uWG9f1J+O1N8LlOLUS0vsdlDzcOof60Ssu2WlH3+oST+wTS5z6Ea7QMgME5 1w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39vpkwrnjc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:11 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16J6G9T7086873;
 Mon, 19 Jul 2021 06:28:10 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by userp3020.oracle.com with ESMTP id 39v8ys1vt5-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fg41+RypQRa1kDmOXj+omryvBqgVLD1VwA+ZugDRgWgY/bH0e5cbf//5YSrKqHUf1AezUxcLwsVlcIRYYJ/QVgYs+CEe5PfWuVUQuCZQg0R++8TtbRnhtH7SixOh44RPqtmenTX4ODI0+LBPy7Jbxw7xsnguAI0Iey3zY48qhcJ+0e6GcX5bye5CCqfZBq0/fbsRSvMVNkajyOU9lbPuuMnK0f6YANNx4ylNQA+Q1DrH/9UYujJT+YfNZR/WF/xMVXj703xjy3qq3AaYJ3OHqTfBJzGFJNhmDCwI96DpvOB47ZbBQlLOI3Etr8d5Cpis4Fv+CyYQU5hE3pJaUqGNUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFdyD+a/2ZQkDVqNWUbWAz5EoorT/d2BRjeGywpi544=;
 b=FoZA/aQC0Y4QeIuXt8UczFkZxMXug1gmDOXzfK4T0YkACMOdB9fHcBH8MixfW1mKQ0JiRMHfjyVNeEUp+HQAoADivOymZAPsOitC9xb3Yse5q1x0hbpL6re4IDwViFUljwm01NBpWTOva54ww5yUzFoW3moC9PwLVQUSoj2MV/+9+ZVvaa02jocXOeEbWLLdvkbFPKlzS6jVyo5kME+ZkPZGgI7mWkG03NXyMLDrlXoawhd+iiRmge3EryFpQYbIWbkwUN6itX3Iby79olvNJWagl7JVb/UA560LH5QrbLfn9VpIlHQIHQqYTWQIw3B96VQ3CCUs7wTdKy+VbfCO5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFdyD+a/2ZQkDVqNWUbWAz5EoorT/d2BRjeGywpi544=;
 b=OxfcpOnY/P0BlYOfOEApWFFWQ6urgkwNVnWtHGn6w/V7QmyhapJoYH7IzrMsLe8dbxiIsmuzUlsiHlOBhQvsXKqhHMO4N4MbmtrSDQgcKB7WrbnYopxn5bxwIo7MTuguRlvl8eoYoxmT8kOkjJ2ioY314oOz6hnL9jcFd2oxfgg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB4814.namprd10.prod.outlook.com (2603:10b6:a03:2d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Mon, 19 Jul
 2021 06:28:08 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 06:28:08 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 08/19] vfio-user: VFIO container setup & teardown
Date: Sun, 18 Jul 2021 23:27:47 -0700
Message-Id: <a2911b611fb5e0cb8ece81822d909974666da6ae.1626675354.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626675354.git.elena.ufimtseva@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0022.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::35) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nuker.hsd1.ca.comcast.net
 (2601:642:4000:a09:3c73:d99e:ec8c:2487) by
 BY5PR16CA0022.namprd16.prod.outlook.com (2603:10b6:a03:1a0::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Mon, 19 Jul 2021 06:28:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bc51341-7de7-4e94-1278-08d94a7e5fa5
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4814:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB48144E9EAF9FC68E1665DEE88CE19@SJ0PR10MB4814.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SmLamdJq0b/wVAkkJ9q4Kj5g8CPGLL1gNvDHSZ9jyNDQ/RO5DQMGcu4TFGyuSQcX6UFS8765FYdQLzj8dHGajPVt2aYK2VtmkDTD5Hdv1gUONdBjTSxL6AB0S44C01EniY4bMSfL5qMlrEGyoZ8LEaJbewLzexzQ51YDaKSUOfTPFGu4vzLsirORNlDpfcieEyM7KyzUvhlWoAQwpYCzJUwdnrBi+Io8CcFS0HMackA4i0VrBmI2ptsxcnu4phFztrJc1r7XkfsdmwlOS25LnGN54zbp/s5jr+EOEB/wPlVco8J7nIwRWXu2P2ELgRFzaGAI/aZIKQZRj/rm62N8tatCbpv7aqr/PYZMgv16J6kT6NCGRK8gZz9CVKnRcjDTjB3otXg75vrQtUd1WpcQoZMmp7zv1uQVBNJ2gXD5pQqp4VNegMHUC+VVBCjfMzvLAov68gj2+9ysXpSZlOlTeAZslz8fnlQqt/cpPUkn0RLugCMTVC0Q/kQEsaXuh/oujTOHD4cT3n73sK8QzrhLLlKOfalDgP08D0mJSklfEM4xDhw9hleMs3xEIAJ/ZVBZQxRdlImjeZExWbYghnhg1naIYxBd5TTaups/ya0zkTknbMelX5YrFrDsDxytpAY55vJ8kojPTmRe2VP8ssw40g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(376002)(346002)(136003)(2906002)(6486002)(5660300002)(316002)(6512007)(186003)(66476007)(44832011)(66556008)(2616005)(6506007)(38100700002)(6916009)(52116002)(6666004)(8936002)(86362001)(107886003)(8676002)(66946007)(478600001)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?moXI3oVngmMn5vj8NCIvQKeYj9CRaptbaFYxVqCA4WO8Px1I8d2gn7da2Tv8?=
 =?us-ascii?Q?hniOBWIDWg5r36RbV1dfjS0CrxVCOdj8rq32GLb5n6T0dNSBfcUWxhKCU7Kb?=
 =?us-ascii?Q?OjqM6ZM+OnwgqKCv13iCWvd1P98Bbjx1qCx/iVpH06mj9aHAVoWUMBkTN2rO?=
 =?us-ascii?Q?OBVHGupwcNQssbG99ZOb2Yj+3DspPyAIhjQnsKuatV2wRTJvK29jytm4zWrt?=
 =?us-ascii?Q?bIbjTPK2PSgEIR6lM9anJX3299/pMN50jJ7dEwRtTbWnPWprJekDcHi9Ogst?=
 =?us-ascii?Q?JEBrV5pNlI5vrAn05z9YqVUS+rzLJFU0xcj/nhD6bPTwXOVYjMH+X9pOoOP0?=
 =?us-ascii?Q?BrmXfJA91IlDxnijal+aEhR9kyv3WSwLDqyTNZtqdmBHQizIfE9EsdRqwlSl?=
 =?us-ascii?Q?cqsvdvzRCfk2CXU3zsZiqOQeAFYNENAsYlc54xBXp2kBOoGWQrpImEwuuwgD?=
 =?us-ascii?Q?my0Wb9dflliNmppttuIokB2Ej/HF8xkZwj0vjrMQEXUVhbAlpL7V3140mvr7?=
 =?us-ascii?Q?XKp9RONYaeFbeFJaYYWrFwGbxqb956uphZc4sFCfxZ3mjYyIhLfcixWxhtLF?=
 =?us-ascii?Q?RGwnQVKiIRzjM0TshFipzCPnumN+FLBKviHfHvMhU7fnLBQntbavNHlVhxFY?=
 =?us-ascii?Q?KW7Xi7FQcRmxttvw+mcDgHgS8c1S3yp770vpwOfxcidPpW9HrACqpZsD34SJ?=
 =?us-ascii?Q?gKsIEidXGWUbs/6vsri1GqGmXAslhxJnB9dcBTHhf7nRxGzxC6jlS7elqTqS?=
 =?us-ascii?Q?mP0eQiyRRZRe9t5sjHgTiqRUK049thCpF9U1r3JnfDo1LX9BMVOTlB84M0BG?=
 =?us-ascii?Q?rEdC5g1m5XF1f2Z6Zq7FtSCi8WXMszjoYvzQuSWOaheemVdlmwFkEB5QlBXq?=
 =?us-ascii?Q?EtdAMfHKonWm8W6xNyA0P2Y1toBpOJQjkWuSdEHrX3YZftpEkTWcZ7wE0PfC?=
 =?us-ascii?Q?nZLrt4tjLif3Q5oaXSYWGwlVLhwfAStNWIf2hluOeUdCBr3AOXq7bJXWZC9t?=
 =?us-ascii?Q?7fttvQv+wQ2arld+ULwElASJrawcUTV4HEVPJ4t1ICPr4xeFCtQloXSI9Z06?=
 =?us-ascii?Q?yqU/R/ZbBb4cQqMGontWwdOUwtZ+KY6+G3tRvjBx30Ih+GJM887JuYvE2DGN?=
 =?us-ascii?Q?jJNrCxQT7gjRPvNYKkS0rnx4d9jvyHriFPUUbVx5boTgaSQgyO1Z86tcnOJ5?=
 =?us-ascii?Q?LzvfovGSmzVm9OagybzirG+k4mlHyLD2aoyO1IScuv7WI4Xt7Wfv+Pf9lPNm?=
 =?us-ascii?Q?m4Crsox+E4PyhNXLbHMbXnbTgr+VteUweC/Pwz/Mjk91sitWnk21dXOfNkcT?=
 =?us-ascii?Q?TU7DRookEmcPehjJbmw9AaC9UeRpVP6Dj5iP8anYolHTGyHCeCzc7s4igVAI?=
 =?us-ascii?Q?YhQ1b4DGxNA8U4BlLpC43s1xp7jg?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc51341-7de7-4e94-1278-08d94a7e5fa5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 06:28:08.1933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MrQwoS9jcl2gx3hV2N+wtVGMbVqVdGoVBTmGZaLDVGcvdb4D+WQ/Z1DWRtlURTGKNSK5QnQvXkfMwG6AGr0BoAp45nzzaS1dcwdwj+HJWfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4814
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10049
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190035
X-Proofpoint-ORIG-GUID: sA3UFmLFIu-aznlLwwQFcvrs3PQkISLA
X-Proofpoint-GUID: sA3UFmLFIu-aznlLwwQFcvrs3PQkISLA
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.01, RCVD_IN_MSPIKE_L3=0.9,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John G Johnson <john.g.johnson@oracle.com>

Create SW-emulated containers and groups for vfio-user
in lieu of the host IOMMU based ones used by the kernel
driver VFIO implementation.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/hw/vfio/vfio-common.h |  3 ++
 hw/vfio/common.c              | 70 +++++++++++++++++++++++++++++++++++
 hw/vfio/pci.c                 | 19 ++++++++++
 3 files changed, 92 insertions(+)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index f43dc6e5d0..491a92b4f5 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -90,6 +90,7 @@ typedef struct VFIOContainer {
     uint64_t max_dirty_bitmap_size;
     unsigned long pgsizes;
     unsigned int dma_max_mappings;
+    VFIOProxy *proxy;
     QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
     QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
     QLIST_HEAD(, VFIOGroup) group_list;
@@ -214,6 +215,8 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp);
 void vfio_put_group(VFIOGroup *group);
 int vfio_get_device(VFIOGroup *group, const char *name,
                     VFIODevice *vbasedev, Error **errp);
+void vfio_connect_proxy(VFIOProxy *proxy, VFIOGroup *group, AddressSpace *as);
+void vfio_disconnect_proxy(VFIOGroup *group);
 
 extern const MemoryRegionOps vfio_region_ops;
 typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 8728d4d5c2..45acdeeb46 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -2206,6 +2206,41 @@ put_space_exit:
     return ret;
 }
 
+void vfio_connect_proxy(VFIOProxy *proxy, VFIOGroup *group, AddressSpace *as)
+{
+    VFIOAddressSpace *space;
+    VFIOContainer *container;
+
+    /*
+     * try to mirror vfio_connect_container()
+     * as much as possible
+     */
+
+    space = vfio_get_address_space(as);
+
+    container = g_malloc0(sizeof(*container));
+    container->space = space;
+    container->fd = -1;
+    QLIST_INIT(&container->hostwin_list);
+    container->proxy = proxy;
+
+    container->iommu_type = VFIO_TYPE1_IOMMU;
+    vfio_host_win_add(container, 0, (hwaddr)-1, 4096);
+    container->pgsizes = 4096;
+
+    QLIST_INIT(&container->group_list);
+    QLIST_INSERT_HEAD(&space->containers, container, next);
+
+    QLIST_INIT(&container->giommu_list);
+
+    group->container = container;
+    QLIST_INSERT_HEAD(&container->group_list, group, container_next);
+
+    container->listener = vfio_memory_listener;
+    memory_listener_register(&container->listener, container->space->as);
+    container->initialized = true;
+}
+
 static void vfio_disconnect_container(VFIOGroup *group)
 {
     VFIOContainer *container = group->container;
@@ -2248,6 +2283,41 @@ static void vfio_disconnect_container(VFIOGroup *group)
     }
 }
 
+void vfio_disconnect_proxy(VFIOGroup *group)
+{
+    VFIOContainer *container = group->container;
+    VFIOAddressSpace *space = container->space;
+    VFIOGuestIOMMU *giommu, *tmp;
+
+    /*
+     * try to mirror vfio_disconnect_container()
+     * as much as possible, knowing each device
+     * is in one group and one container
+     */
+
+    QLIST_REMOVE(group, container_next);
+    group->container = NULL;
+
+    /*
+     * Explicitly release the listener first before unset container,
+     * since unset may destroy the backend container if it's the last
+     * group.
+     */
+    memory_listener_unregister(&container->listener);
+
+    QLIST_REMOVE(container, next);
+
+    QLIST_FOREACH_SAFE(giommu, &container->giommu_list, giommu_next, tmp) {
+        memory_region_unregister_iommu_notifier(
+            MEMORY_REGION(giommu->iommu), &giommu->n);
+        QLIST_REMOVE(giommu, giommu_next);
+        g_free(giommu);
+    }
+
+    g_free(container);
+    vfio_put_address_space(space);
+}
+
 VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
 {
     VFIOGroup *group;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 388b7d82d7..5ed42ad858 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3358,6 +3358,7 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     VFIODevice *vbasedev = &vdev->vbasedev;
     VFIOProxy *proxy;
+    VFIOGroup *group = NULL;
     Error *err = NULL;
 
     if (!udev->sock_name) {
@@ -3385,6 +3386,19 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     vbasedev->no_mmap = false;
     vbasedev->ops = &vfio_user_pci_ops;
 
+    /*
+     * each device gets its own group and container
+     * make them unrelated to any host IOMMU groupings
+     */
+    group = g_malloc0(sizeof(*group));
+    group->fd = -1;
+    group->groupid = -1;
+    QLIST_INIT(&group->device_list);
+    QLIST_INSERT_HEAD(&group->device_list, vbasedev, next);
+    vbasedev->group = group;
+
+    vfio_connect_proxy(proxy, group, pci_device_iommu_address_space(pdev));
+
     return;
 
  error:
@@ -3395,6 +3409,11 @@ static void vfio_user_instance_finalize(Object *obj)
 {
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
     VFIODevice *vbasedev = &vdev->vbasedev;
+    VFIOGroup *group = vbasedev->group;
+
+    vfio_disconnect_proxy(group);
+    g_free(group);
+    vbasedev->group = NULL;
 
     vfio_put_device(vdev);
 
-- 
2.25.1


