Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4952B3E3194
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:15:33 +0200 (CEST)
Received: from localhost ([::1]:51052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC87o-0002ek-7t
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:15:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85l-0007BQ-Lw
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:25 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:28186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85i-0004BR-Kf
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:25 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176MBfKp007299; Fri, 6 Aug 2021 22:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=XZnWp40LvrZw0mIr2bJzELHBiVEeOB0Qd6ajB9Do80U=;
 b=ErgqXC+xVL2BPimVG/zEv/QnbBrEnoHRtI569E0fBU+uaNEE+L+CuOow5A4LMKPHeu+t
 1ziEL9Q2ANv5Nx6CzQeJViRNPMkzKfYfjKkcZePZbyZoiWwzNazhFglSWGb8rJF5qdtw
 WPuBdOpIJ4TEdSmNyFWuJXwQHdlWZ6K1/ciP66vIKPyhyzjyIWiG+rlsZNFNjGSo0w5S
 JoCTmnrcxyCHa1eB0yAn+l5Tno1edmMMPPBGk9ejnEnzt67g5js95f2q0J6Dy+/IHeiC
 beiCySlVxP2I/3duzD8bpO8usOrjrpa0G1NKpgexb/LKXZiuCHNiIHwHt1PL9xmM7PT7 MA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=XZnWp40LvrZw0mIr2bJzELHBiVEeOB0Qd6ajB9Do80U=;
 b=T/n9qKkEXZsiE/AngPZerlCRBuzo4W9ZJV+uDZZrvIlQm1NZX+IIy1efK06k8Uu0ymmR
 vNvH4fcQIHRnvlR/pc4wf5CaCyKt6/J4zezw9A0Io66Xdzi4p7RBkce7xgqkbKr1R3oQ
 3Gp3DSytidAXP1wcQYTV+U7Ff/wKpUPiSYQ9BjGnkE0Smz9EF/0Qv4U1i8Jq/EnyqQB+
 NwVidSo07KExLMeN6qJYhCVumg7VSFJq/VYX/6nMnWtHP1mmeTseunJfh6+WYQfj2wpZ
 KPAK9gvGftJMyiBw0JpxcppprUTWHtO2uSiQ0IjGd1yyHLbzg/HS3gRuL+V5jeeFllXF Ww== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a8p6rjpmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:17 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176MBeja032608;
 Fri, 6 Aug 2021 22:13:16 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by aserp3030.oracle.com with ESMTP id 3a78db75me-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2F3Ju001noo7d8xwogpqKoRdIX+i9t3jZ+miTq7V/7t7Ac8sjo6xliy5HkpSepd2WF/UkM4bhNdjPrIPu+pUDnkBMrTpLKHsEFvw0Dz93YwYghKH8ddUyxpEY8DMkAy9pNHdNOW0I2qBnBg/2GDbU5Kg/8fPFD70wOpmiFfar89gulf7BleZB9mP7otLX3u8nO70Eccq22SEV29bx38duCjd8wzMYUf9zdMgOtcoyQWsRTWBUwj7lYjxecnYjMA0X+VEFQIeaxTpN2y3TWPIa2u7wYw4CfKlAMPkTqQdA3//LngGcAPpcGoxVZnGBesQ0mO+uAHsGPrcEhg5Uvbyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZnWp40LvrZw0mIr2bJzELHBiVEeOB0Qd6ajB9Do80U=;
 b=ZYm8OybP0ZlKAKdaeyAHIHIeVcrewitqha5/JhCUONvqk+JZeLVZxumLeniEAdWjtJKn47PdC9g+BE5P+N8OysDjzHodJpkUcJDf/mkkxbpysp/FXwP60PA+YDJ6RzlRDV99xl5d2r/40Njx9web4YHb0jq6YiS1XOXk5+NPXi46eL2uUKoNeS4I0BhykP4TPdQwADpayFfdEVgRJRMOq9kaqgMw8/xjSUDb9/TWL4jArt9kkshF2ihQMi8e/FXS9vIaCS4id/j3GYufkgv1o9i+CXtw0QeYN5yUgJwETIJbt4kiFJYHyTGAV95Xnt0PRgjQye9htqbV8lK5KlP7Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZnWp40LvrZw0mIr2bJzELHBiVEeOB0Qd6ajB9Do80U=;
 b=OHcbrmgFfeWcTDtkgmI9ASVffz4TOlZ43CJIB4jnIpiW+in7lDKwouIFmN3TII2ndvVvxSNYKdv0Ox3AxC9rMhDQFq4PPJffZUsB6ctuMxL/fiEAmcqr1NoK+NXeS2ZLW7fmBPtkpQj4EzyP5asqfyZvkYN1rNaVBH3xky8rpYM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4734.namprd10.prod.outlook.com (2603:10b6:a03:2d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 6 Aug
 2021 22:13:13 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 22:13:13 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V6 11/27] qapi: list utility functions
Date: Fri,  6 Aug 2021 14:43:45 -0700
Message-Id: <1628286241-217457-12-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
References: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:806:20::7) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.7) by
 SA9PR03CA0002.namprd03.prod.outlook.com (2603:10b6:806:20::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 22:13:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a7016e8-581a-4dff-d554-08d9592761e4
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4734:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB47342C06F2C70A0844EF587FF9F39@SJ0PR10MB4734.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pRjpqspA6PBxO1KkdouzGKjG7DN+Hldv+epK6/DuUjHYQZm7nmuD4HQnyjRZwTC5SFDMFxUswAb4fi/TRa/9djUj4hzpLxSFYf6J37ECa8RWEeW2szYyO7rLgTaT13lGetRe4Ufb8nDSBQ1T9lalgRyUAlUpMuv4qhZ7TaJ60UJn0vyLZ3gsdPAQylLKqlA0TQDRrQJsjAQylM7Vr+A+e6KcrBKn+uruz2/zlbkZFIbhXJE6DkoXo3zFlBk30+Zi2ThqTVEu2maGRXSsgklHDgDL3sv8X3HBXysKQV6GBXGyMsH4IWXMFsTzYtDVYDMP4jurSAidxK9XDVWv7Xnhmv2c4zbbzBIXc2dtMjW6Nq6YkPs6gZivt8tLJ0tBdcQHNi0N2RGykOutLvcSHP4JOYCd9rq2HFVCrq2IEVZX09/Ivb5bmuDcFhJNoZv9iW1rbKd3of2K3dQZEe5M0oNdNv3d63AeOdzoPXEqvsiqVjFuKrd9upcHflN3Whbt8H6BSpQzL+dxWaLRyw0ZhI0U8gjiejtQ6AwIjIXjFe4VefThubdD5g6dHKm42lYT2Y06sMt5dvIY9dDEvEJfPV/Z4PvtFH1jO8ft6XKBbE1Bu6p0UjEKUSyXNMHpLPnC2/p+sFr5DEEkQFcuznpR7iQ9TQuAwhuWyI4O2WWrq79vnLSx2393REO40dkvsdctmdBGsyX2W1aZ9rG2dph3pwh/yTwZ4ZZQffLFy2xpcbJU9Mc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(376002)(136003)(366004)(346002)(66946007)(107886003)(66476007)(8936002)(86362001)(316002)(83380400001)(54906003)(8676002)(66556008)(4326008)(36756003)(956004)(6666004)(26005)(186003)(2616005)(478600001)(7416002)(6916009)(5660300002)(2906002)(52116002)(7696005)(38100700002)(38350700002)(6486002)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GzBU2PztaztwRQ8a/UBdYaHxhQWzYAaYEbZu3VClNs/32f+jdilO/mg2kJZG?=
 =?us-ascii?Q?sgF6BHpbFl/Xil6VkToc7/yuKI16cVjavubET+q2aRCe8pfmDVtDRK/2Uj91?=
 =?us-ascii?Q?+n4TUAr8xhjsB2WCvVHDI+PZwmDHFEFVZnV2XuebjZQCuB29+x3+Iq9RGxMJ?=
 =?us-ascii?Q?eu5fub4DdZY6dbL3+w/2pKlmsws/3uHwBJO8ZOMG3qgHeXicqhOAOX4VKCIB?=
 =?us-ascii?Q?P7V+bJ8lC7lvrXfxpwWWB4z0jM9nEE8I1msvd0caTBFlxa00CV4ljBSMakjZ?=
 =?us-ascii?Q?Tx2PTXG3LbOAyN88tvHrN0bX/VpQ9/6Q+yt0u7jdkU/ihy0pciDfZ3BpeGOF?=
 =?us-ascii?Q?av/ORPJwiV/RO+anpCmsaTuEEGJ8tfRUaZosFr6bMBNQYtFi6i8v1sbnrFGn?=
 =?us-ascii?Q?APITZ4vatmuVpKejD/oUC6YN87BW5b+2E6m8W7ZsKkfu5hcYmuV9kJRMj3ss?=
 =?us-ascii?Q?QsjuMj5a0w/cXq2vy6CnYcShEegzR5z9uY9h17jV+szfxmGBFs6fx7TyvqpX?=
 =?us-ascii?Q?Cvhwe+RA9oFW0lFueAF48ZVgECZ5kZYdUesQfPTSGimUpWQ/DjyN1fCFoY/I?=
 =?us-ascii?Q?U9nv6n/V9EhcxpnbSBbDrt6gwUNZy1QbaGsGh7L1HtdEyHI4wyfUZkwQD1VD?=
 =?us-ascii?Q?lcmALkuaQOlzxD/RtROuLJ5RyYjoClw6S+8EJeLFo5l9onhEXOR84V/nld4F?=
 =?us-ascii?Q?6fu4rGlWWoXkmqXY0yay12BkxNBt1EYuOyw5bwaKhZo4V2Zy5tRUsOLPjt7o?=
 =?us-ascii?Q?t6mipIJHhJDXtlv3vqV0LpkZVjM94yHrO/fwQLBV9UPKxdmle2dvMY7TlCv8?=
 =?us-ascii?Q?6pSmk1UbJSs1nNykSwA8S0GHYO45XTacfzHCcs+/HTfcmDTIFCTU+AIzy0ff?=
 =?us-ascii?Q?GzMwlbENYQbhPOevDO/doPN/tstb/+dHd3lT6w8pdb+7+dNkduf8ONJBErDB?=
 =?us-ascii?Q?/zEwAaBJYVg0vK61gwEKKZ9GXsokBMurqiEfmInRaGhbLgqKRJgtqpL9v6YE?=
 =?us-ascii?Q?ZcxcGJo7Z5HGSFF8hLdQcS8uWGZbBjJAOdMSDQbsHVcUADIDdAO1ByDATg41?=
 =?us-ascii?Q?ZKhVkixwJ9ojxPprhRIvq+BwWp5Bg0Z2y12F9qrVkCJ4utMl5e3OT9haPbbZ?=
 =?us-ascii?Q?Hg0+XEyUlzigQLSbf7pFXSEjCnMkgeoI01lNs1wBtfG47nS3tZ1xiiMOYWbc?=
 =?us-ascii?Q?Zd6DnyT0V3ly04YzmoXmaOqIpn3XZGOzd1MFA7fM05s+bK8O+5nGrMqJeBKf?=
 =?us-ascii?Q?xez9h0ClFdZpGIjQ0DCeN5hjyg/RWCcwMPECdkcW1pt1LdKAshNpbGSgCYsS?=
 =?us-ascii?Q?aVgsQH2uW2ocq/XiJRyIcJu2?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a7016e8-581a-4dff-d554-08d9592761e4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 22:13:13.2368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dT8BNT+NMgyK0yRzc+bf2v5rLJRXKFMkxSEWAEilyk7bBqmf50gKUP+nua4PY02wAQYOGZcBFTUHaHs1LmgxpVQsVpHxI+iHXaRntBAoWY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4734
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060145
X-Proofpoint-ORIG-GUID: vr5khCymhy0zm8FgL_2EG668inNSu0bD
X-Proofpoint-GUID: vr5khCymhy0zm8FgL_2EG668inNSu0bD
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Generalize strList_from_comma_list() to take any delimiter character, rename
as strList_from_string(), and move it to qapi/util.c.  Also add
strList_from_string() and QAPI_LIST_LENGTH().

No functional change.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/qapi/util.h | 28 ++++++++++++++++++++++++++++
 monitor/hmp-cmds.c  | 29 ++---------------------------
 qapi/qapi-util.c    | 37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 67 insertions(+), 27 deletions(-)

diff --git a/include/qapi/util.h b/include/qapi/util.h
index d7bfb30..83cc4d7 100644
--- a/include/qapi/util.h
+++ b/include/qapi/util.h
@@ -16,6 +16,8 @@ typedef struct QEnumLookup {
     int size;
 } QEnumLookup;
 
+struct strList;
+
 const char *qapi_enum_lookup(const QEnumLookup *lookup, int val);
 int qapi_enum_parse(const QEnumLookup *lookup, const char *buf,
                     int def, Error **errp);
@@ -25,6 +27,19 @@ bool qapi_bool_parse(const char *name, const char *value, bool *obj,
 int parse_qapi_name(const char *name, bool complete);
 
 /*
+ * Produce and return a NULL-terminated array of strings from @args.
+ * All strings are g_strdup'd.
+ */
+char **strv_from_strList(const struct strList *args);
+
+/*
+ * Produce a strList from the character delimited string @in.
+ * All strings are g_strdup'd.
+ * A NULL or empty input string returns NULL.
+ */
+struct strList *strList_from_string(const char *in, char delim);
+
+/*
  * For any GenericList @list, insert @element at the front.
  *
  * Note that this macro evaluates @element exactly once, so it is safe
@@ -50,4 +65,17 @@ int parse_qapi_name(const char *name, bool complete);
     (tail) = &(*(tail))->next; \
 } while (0)
 
+/*
+ * For any GenericList @list, return its length.
+ */
+#define QAPI_LIST_LENGTH(list) \
+    ({ \
+        int len = 0; \
+        typeof(list) elem; \
+        for (elem = list; elem != NULL; elem = elem->next) { \
+            len++; \
+        } \
+        len; \
+    })
+
 #endif
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 6aed6ac..da91a0a 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -43,6 +43,7 @@
 #include "qapi/qapi-commands-run-state.h"
 #include "qapi/qapi-commands-tpm.h"
 #include "qapi/qapi-commands-ui.h"
+#include "qapi/util.h"
 #include "qapi/qapi-visit-net.h"
 #include "qapi/qapi-visit-migration.h"
 #include "qapi/qmp/qdict.h"
@@ -70,32 +71,6 @@ void hmp_handle_error(Monitor *mon, Error *err)
     }
 }
 
-/*
- * Produce a strList from a comma separated list.
- * A NULL or empty input string return NULL.
- */
-static strList *strList_from_comma_list(const char *in)
-{
-    strList *res = NULL;
-    strList **tail = &res;
-
-    while (in && in[0]) {
-        char *comma = strchr(in, ',');
-        char *value;
-
-        if (comma) {
-            value = g_strndup(in, comma - in);
-            in = comma + 1; /* skip the , */
-        } else {
-            value = g_strdup(in);
-            in = NULL;
-        }
-        QAPI_LIST_APPEND(tail, value);
-    }
-
-    return res;
-}
-
 void hmp_info_name(Monitor *mon, const QDict *qdict)
 {
     NameInfo *info;
@@ -1170,7 +1145,7 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict)
                                             migrate_announce_params());
 
     qapi_free_strList(params->interfaces);
-    params->interfaces = strList_from_comma_list(interfaces_str);
+    params->interfaces = strList_from_string(interfaces_str, ',');
     params->has_interfaces = params->interfaces != NULL;
     params->id = g_strdup(id);
     params->has_id = !!params->id;
diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
index 3c24bb3..1edbd04 100644
--- a/qapi/qapi-util.c
+++ b/qapi/qapi-util.c
@@ -14,6 +14,7 @@
 #include "qapi/error.h"
 #include "qemu/ctype.h"
 #include "qapi/qmp/qerror.h"
+#include "qapi/qapi-builtin-types.h"
 
 const char *qapi_enum_lookup(const QEnumLookup *lookup, int val)
 {
@@ -109,3 +110,39 @@ int parse_qapi_name(const char *str, bool complete)
     }
     return p - str;
 }
+
+char **strv_from_strList(const strList *args)
+{
+    const strList *arg;
+    int i = 0;
+    char **argv = g_malloc((QAPI_LIST_LENGTH(args) + 1) * sizeof(char *));
+
+    for (arg = args; arg != NULL; arg = arg->next) {
+        argv[i++] = g_strdup(arg->value);
+    }
+    argv[i] = NULL;
+
+    return argv;
+}
+
+strList *strList_from_string(const char *in, char delim)
+{
+    strList *res = NULL;
+    strList **tail = &res;
+
+    while (in && in[0]) {
+        char *next = strchr(in, delim);
+        char *value;
+
+        if (next) {
+            value = g_strndup(in, next - in);
+            in = next + 1; /* skip the delim */
+        } else {
+            value = g_strdup(in);
+            in = NULL;
+        }
+        QAPI_LIST_APPEND(tail, value);
+    }
+
+    return res;
+}
-- 
1.8.3.1


