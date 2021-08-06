Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00243E319B
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:17:35 +0200 (CEST)
Received: from localhost ([::1]:59712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC89n-0008SJ-17
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85o-0007Kq-Aw
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:28 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:33188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85l-0004E7-RB
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:28 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176MB4xq029754; Fri, 6 Aug 2021 22:13:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=DkdxhPhVcs9eVeaL+YNGmWufhSD0Gu3Clef6v2P5ufY=;
 b=DAckRIhnlTouYsbN3LXt/PJF9xGnUyXXBtvQw5BSwLTz1mPHOK7TwBXmUR5iVeyzPKU0
 pTYFYoAYkh+vqcwHXPPWOPKwBJdzWFKJR7YlP76IGAIeQWT5NXEV8i984xCvZZjKFmJP
 b941R6Rv7lg/RffcYVcasz7QQQGjRes2cz2op4iQbK1Qa9tFgY0k2mC8Bw1x39nrhvAZ
 qwtACu73SJCO4RVpux5O8HuQB0ZzaxIPgnNkR222YSWBXmX6kxMS/kG1GhTzIj2dfSh6
 P9Oq50e3oZlfl5KzMLroN250cyFCCqigeJSrEsBcaLuVcBKGG+w6xJT6kYYweTqezNC8 xQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=DkdxhPhVcs9eVeaL+YNGmWufhSD0Gu3Clef6v2P5ufY=;
 b=QLV3r6TBUxUq1N3lQ2LFCSSIHtgrlQia2KjWvQ1LhbjCMK49L/Tv8FyjL9wywoSnUf6g
 Wqd0C6VfBD5ybeSHUSDnRhVBeV/Oe1w8fEsCY/IUmg/nntM7QOD39DjaBdiDU+Zg89lu
 TQzN3lw9fNNprb2QDC75k5PJcLH4yulDjodI05Mm4egzzNOsoo6M7uHyBvv+9RY5ePE7
 +f3SdYlw4SGStez8aFswuFgOY4zuiAiTEIkEvR+7V2Zi4MAFLW/fA+cbUrIDuAQWR5DC
 vuHOP5wD3Upu70xwBDu8/rWB7XQBuR5Fu5r1uhyaU82eWW5GXP0999JdjZX8ray9Z38x uQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a90justq8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:20 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176MACDP083083;
 Fri, 6 Aug 2021 22:13:19 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
 by aserp3020.oracle.com with ESMTP id 3a7r4cay1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fATBhy4tZ9Hfg8X5wEDzrz5QcLFnnFOVAWY+e/HaLVnI7lHouh02lkJ7R8Qy/qFG7lF+cEDkSZeHx5MJHZcH81F3vuynOsCjzMSb+UBd9+AplaJQrucJa9qaRuIH+a8pBLl7V50+W3W8kHmgkiroJSkEl4xXCYJs6nAStBGFvlIOQJda79T4GZSt70zBX/fXOWNbD9+O5ZnqFftsyX5eyzYoPmHbjdFtlg9BcdXYIbmCKOlxomntrPMnDDxez6QgUhqVvKd04uFiam90QLTrV1EQfl3qjTOdTMs1C4y4t+VfOy426jZ5Nu/0gosUqcF2Ucbt+O+5fcn2lM0BAudDFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkdxhPhVcs9eVeaL+YNGmWufhSD0Gu3Clef6v2P5ufY=;
 b=WUttEuW7wnmwHwfGYSpknr7WxJwEzLyc6eS1aCwECPLhJN41o/4W0ZCdLZEleF7Sb4bWJe8N3RrI1BxgDIuTbQt9PgB646MiXz1l/FMoAnkAXN5qZ4TjGKXftK4F6GeqIuBOkO5TpocxQk1PA8+Joo5kAPtipGoYjSH7PSRuYf4VjFE//sHsdnmN6cLgRAkHz3Y7avTKeqXxc7yBwb+F620TapZZcVbPWDNVSI7xLpm++HgLi1TTf+4UAa62Sy+Dcd+Mob/KPxRSiVk4jodD9NYzKwaPpPujaHRK0lmB9UGYhP4hloBUBUX/+ICHhb8baJaySOCJS0O75+zQ0rMJeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkdxhPhVcs9eVeaL+YNGmWufhSD0Gu3Clef6v2P5ufY=;
 b=dTYsnVY1ANpjfyQPEph/Rt+5I55ftUoRIV6VkCAqqBpKGWRUWtj1WTm6IDvdGYzu6B9Ss4kR9HCrrGyH5m7Y+o0rzUB5wSTI2cHb0Y3rJA8H4exFjenfypuFCu3YobDNNXCTUOmKpu9pjbgtsm7pAI+9OnipLTfPb3Kc+DzSBKQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4734.namprd10.prod.outlook.com (2603:10b6:a03:2d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 6 Aug
 2021 22:13:17 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 22:13:17 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V6 13/27] cpr: preserve extra state
Date: Fri,  6 Aug 2021 14:43:47 -0700
Message-Id: <1628286241-217457-14-git-send-email-steven.sistare@oracle.com>
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
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 22:13:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfa75a1e-20e0-42b5-864e-08d95927642d
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4734:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB47342FBB6E8F0161B37205E2F9F39@SJ0PR10MB4734.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N+t6UxUL08ExNPvh+tt/hDl/NES45pOCH7WoYV9dYBeDrg4IfwVQg9vjQd1Tpb6iy1jk40yQl9+pR2759Op/DXb7SgfOHtHCyADB1Dh3mSX2lH+HeB6hd0pJ4xRqtujlIGLQThNKTo2Wk61hrfRMeXYnBybBwykxiqhdxEr6peOjWJ7I38NVinqyI5KnvOsVixJnBygai3JbGTIxHeL/sOOnwg5nfyqRzful0G9hCwhlMn21tryW5aLcc4MzJA8WfYTn/NINYbmAgVV9C3lx67NPIap0BDU3MU83yqW4d2/j7Lazw2cqNIN0Ry41erJxHyyZ6sKbgV22JGNvy+zKV+NN99unIbnWX0hURRsuAz6LocSNAmv2pRnwZcvmrsv9A4GZfDQp1bs9Bl8BPJJuxyCZwxi+f9Ct7d0ialM2pt6U7NH4R3ZlQnQAbY8g9oOr2L4XNlIQ+rjRy1UKKFkchfJvEP9LeQkdYEhh4a+c8achc14jciVmACDORTmQuvrdZDabegipSgYerCluvuH7VQh5uYhCzsUSEwo0RqgkWfT3CbS+e4kdBvcOtOYK8itZAGZ14Ew+KP4A0an7IJ4kFEQEoRYpxLv/pUNJ5cuVCwyiPise3JYXde8nTv3Dc9fo0nlP7fKyiKsw/fyIEWUmN78y87V5avSxzbRWu5VrZr2PyBW0DrTSRKyxethkiSCV6Q8A2LUWUW8Q209WgidGpw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(376002)(136003)(366004)(346002)(66946007)(107886003)(66476007)(8936002)(86362001)(316002)(83380400001)(54906003)(8676002)(66556008)(4326008)(36756003)(956004)(6666004)(26005)(186003)(2616005)(478600001)(7416002)(6916009)(5660300002)(2906002)(52116002)(7696005)(38100700002)(38350700002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7DD6YB9OU4TkV6Uc8g81vihyrhSh09wrT+H6BMJwYuwHwZjEOY907XJdvu1O?=
 =?us-ascii?Q?BH7HotIy8XgoJsu6w7geoERwazz7fbK4K0vW68Nk8oA0/pmASJT0sWOFn7HY?=
 =?us-ascii?Q?qJ4HXAUfU7dJL8GZn8dsFw7957PBvr0n/7aw7K0fG2OZZ+KHI6sNikt99M4e?=
 =?us-ascii?Q?Id+EIARlUgXG7CdY/2jVjklsf0eEP+A2kBZQa87UEF5ZXr5DfMcn+6YJHiwg?=
 =?us-ascii?Q?DfzLBk0yPoIVgwibryCY+btxSRuRqLOkZEzpnELC3nGMVf092JLgG+V7IDnd?=
 =?us-ascii?Q?UeJGh3Z66uiVKSpH1X41FUoYIouMdOAHfI6u8WeVOWVUVuEEz6ZwSwYPq24L?=
 =?us-ascii?Q?yuc5dskT8iPwjeEHFjihir3od0bHD6zZPgTnxWVC7cXKgwVomU7ZUpFcta6C?=
 =?us-ascii?Q?nAVyT3RLnG5yKi2LhijQ1td3aTs8d2fGo/os3/+BOhYc1pEjGqKH31Vk279V?=
 =?us-ascii?Q?h71+632ezvOiaG8YEaalbfOII1ep3MefZCsKa8HTv+kUUtEDuD/KWpB64SKr?=
 =?us-ascii?Q?KbwaBrHKCgKTMTmU+39wJkqusqIZN3V1GHIVmPlkHHyee8u26FunODf0yW/G?=
 =?us-ascii?Q?O45aH9G1GXIfhtsktEUZs7ys92Zs5Y+32q79wljWjg3qilPmTkRQE/wmhpiW?=
 =?us-ascii?Q?I/fz1b6XR8Y1XU8XLgM9TdwqWBD3Y9akBgTPziC5xztnoLuIt2BO2gm8nA+P?=
 =?us-ascii?Q?6HoS4PBIXV7SwsqXOmyvBEmxOV7p3x2yu1yMObHgNFGDat0GXkx5311yBDVo?=
 =?us-ascii?Q?ecN+ydR27oIunWztF39LHpJtq2uzGZ5gY72DEvEBeEBzvJvmomA6dN7YfHt8?=
 =?us-ascii?Q?SHFXodm06S/p/QML1l97exC7RIKs8l9BarpJRIkq415XFDFwtE64T3pqIey5?=
 =?us-ascii?Q?/izZ68M5yjq6xO2gxNjFVSvSYk6BKORx6Q+DI2umZfYzOFD5xs6O/rquxfKt?=
 =?us-ascii?Q?2+Mw3TfAvW3NKqULNzieGw3bVOWhQHeA+jeEXIwPlDbuz/tiMQPagwsD71tB?=
 =?us-ascii?Q?UNndBk9Ae76BJv1Y6IxTP3rSbOFonsF3Eyo22aciI+wwDo5eYesFrCZkkOdk?=
 =?us-ascii?Q?Po6XhLJBQsWX6xHiTE/y9JBon2NoL3SFwOMSG8KRqEEd5GOD2dp93tybInvX?=
 =?us-ascii?Q?0a3mrK1avcUNIygXwnhV9hFiVMySW48TohU72875Ixuf0NsBipW5BPffQmXx?=
 =?us-ascii?Q?W8GpoURQQC3yd1M7IxLqxSCo05cyhP72lnU8ZqJiL6vVukb3wcSO5of0kR/5?=
 =?us-ascii?Q?uxiQSVSJBn2TFkBh3oA+gNKVz6iMJBpdLuX5KzqtJeuonVN8e13eAS8vTzTv?=
 =?us-ascii?Q?g1fG9oSn7bYRMsvlqj8fAkc6?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa75a1e-20e0-42b5-864e-08d95927642d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 22:13:17.0226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: spLePreo6wZHv52mVjiqjFqdDaD9mgL8L3jFtzF0JC9YAHUvnh1CXDVImp2Agwu1Zs79AFdu7QlVDfJ7dbikAJJgGf2LUuCaAWwRxkmC5uY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4734
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060145
X-Proofpoint-ORIG-GUID: aXpZJ59XJD3kjCUcocE51M4E7FB6C1Xj
X-Proofpoint-GUID: aXpZJ59XJD3kjCUcocE51M4E7FB6C1Xj
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

cpr must save state that is needed after qemu is restarted, when devices are
realized.  Thus the extra state cannot be saved in the cpr-load vmstate file,
as objects must already exist before that file can be loaded.  Instead,
define auxilliary state structures and vmstate descriptions, not associated
with any registered object, and serialize the aux state to a memfd file.
Deserialize after qemu restarts, before devices are realized.

Currently file descriptors comprise the only such state, but more could
be added in the future.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 MAINTAINERS             |   2 +
 include/migration/cpr.h |  11 +++
 migration/cpr-state.c   | 215 ++++++++++++++++++++++++++++++++++++++++++++++++
 migration/meson.build   |   1 +
 migration/trace-events  |   5 ++
 stubs/cpr-state.c       |  15 ++++
 stubs/meson.build       |   1 +
 7 files changed, 250 insertions(+)
 create mode 100644 migration/cpr-state.c
 create mode 100644 stubs/cpr-state.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 2611ca6..a9d2ed8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2907,6 +2907,8 @@ S: Maintained
 F: include/migration/cpr.h
 F: migration/cpr.c
 F: qapi/cpr.json
+F: migration/cpr-state.c
+F: stubs/cpr-state.c
 
 Record/replay
 M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
diff --git a/include/migration/cpr.h b/include/migration/cpr.h
index a76429a..83f69c9 100644
--- a/include/migration/cpr.h
+++ b/include/migration/cpr.h
@@ -14,4 +14,15 @@
 
 CprMode cpr_mode(void);
 
+typedef int (*cpr_walk_fd_cb)(const char *name, int id, int fd, void *opaque);
+
+void cpr_save_fd(const char *name, int id, int fd);
+void cpr_delete_fd(const char *name, int id);
+int cpr_find_fd(const char *name, int id);
+int cpr_walk_fd(cpr_walk_fd_cb cb, void *handle);
+int cpr_state_save(Error **errp);
+int cpr_state_load(Error **errp);
+CprMode cpr_state_mode(void);
+void cpr_state_print(void);
+
 #endif
diff --git a/migration/cpr-state.c b/migration/cpr-state.c
new file mode 100644
index 0000000..003b449
--- /dev/null
+++ b/migration/cpr-state.c
@@ -0,0 +1,215 @@
+#include "qemu/osdep.h"
+#include "qemu/cutils.h"
+#include "qemu/queue.h"
+#include "qemu/memfd.h"
+#include "qapi/error.h"
+#include "migration/vmstate.h"
+#include "migration/cpr.h"
+#include "migration/qemu-file.h"
+#include "migration/qemu-file-channel.h"
+#include "trace.h"
+
+/*************************************************************************/
+/* cpr state container for all information to be saved. */
+
+typedef QLIST_HEAD(CprNameList, CprName) CprNameList;
+
+typedef struct CprState {
+    CprMode mode;
+    CprNameList fds;            /* list of CprFd */
+} CprState;
+
+static CprState cpr_state;
+
+/*************************************************************************/
+/* Generic list of names. */
+
+typedef struct CprName {
+    char *name;
+    unsigned int namelen;
+    int id;
+    QLIST_ENTRY(CprName) next;
+} CprName;
+
+static const VMStateDescription vmstate_cpr_name = {
+    .name = "cpr name",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(namelen, CprName),
+        VMSTATE_VBUFFER_ALLOC_UINT32(name, CprName, 0, NULL, namelen),
+        VMSTATE_INT32(id, CprName),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void
+add_name(CprNameList *head, const char *name, int id, CprName *elem)
+{
+    elem->name = g_strdup(name);
+    elem->namelen = strlen(name) + 1;
+    elem->id = id;
+    QLIST_INSERT_HEAD(head, elem, next);
+}
+
+static CprName *find_name(CprNameList *head, const char *name, int id)
+{
+    CprName *elem;
+
+    QLIST_FOREACH(elem, head, next) {
+        if (!strcmp(elem->name, name) && elem->id == id) {
+            return elem;
+        }
+    }
+    return NULL;
+}
+
+static void delete_name(CprNameList *head, const char *name, int id)
+{
+    CprName *elem = find_name(head, name, id);
+
+    if (elem) {
+        QLIST_REMOVE(elem, next);
+        g_free(elem->name);
+        g_free(elem);
+    }
+}
+
+/****************************************************************************/
+/* Lists of named things.  The first field of each entry must be a CprName. */
+
+typedef struct CprFd {
+    CprName name;               /* must be first */
+    int fd;
+} CprFd;
+
+static const VMStateDescription vmstate_cpr_fd = {
+    .name = "cpr fd",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT(name, CprFd, 1, vmstate_cpr_name, CprName),
+        VMSTATE_INT32(fd, CprFd),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+#define CPR_FD(elem)        ((CprFd *)(elem))
+#define CPR_FD_FD(elem)     (CPR_FD(elem)->fd)
+
+void cpr_save_fd(const char *name, int id, int fd)
+{
+    CprFd *elem = g_new0(CprFd, 1);
+
+    trace_cpr_save_fd(name, id, fd);
+    elem->fd = fd;
+    add_name(&cpr_state.fds, name, id, &elem->name);
+}
+
+void cpr_delete_fd(const char *name, int id)
+{
+    trace_cpr_delete_fd(name, id);
+    delete_name(&cpr_state.fds, name, id);
+}
+
+int cpr_find_fd(const char *name, int id)
+{
+    CprName *elem = find_name(&cpr_state.fds, name, id);
+    int fd = elem ? CPR_FD_FD(elem) : -1;
+
+    trace_cpr_find_fd(name, id, fd);
+    return fd;
+}
+
+int cpr_walk_fd(cpr_walk_fd_cb cb, void *opaque)
+{
+    CprName *elem;
+
+    QLIST_FOREACH(elem, &cpr_state.fds, next) {
+        if (cb(elem->name, elem->id, CPR_FD_FD(elem), opaque)) {
+            return 1;
+        }
+    }
+    return 0;
+}
+
+/*************************************************************************/
+/* cpr state container interface and implementation. */
+
+#define CPR_STATE_NAME "QEMU_CPR_STATE"
+
+static const VMStateDescription vmstate_cpr_state = {
+    .name = CPR_STATE_NAME,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(mode, CprState),
+        VMSTATE_QLIST_V(fds, CprState, 1, vmstate_cpr_fd, CprFd, name.next),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+int cpr_state_save(Error **errp)
+{
+    int ret, mfd;
+    QEMUFile *f;
+    char val[16];
+
+    mfd = memfd_create(CPR_STATE_NAME, 0);
+    if (mfd < 0) {
+        error_setg_errno(errp, errno, "memfd_create failed");
+        return -1;
+    }
+    qemu_clear_cloexec(mfd);
+    f = qemu_fd_open(mfd, true, CPR_STATE_NAME);
+
+    ret = vmstate_save_state(f, &vmstate_cpr_state, &cpr_state, 0);
+    if (ret) {
+        error_setg(errp, "vmstate_save_state error %d", ret);
+        return ret;
+    }
+
+    /* Do not close f, as mfd must remain open. */
+    qemu_fflush(f);
+    lseek(mfd, 0, SEEK_SET);
+
+    /* Remember mfd for post-exec cpr_state_load */
+    snprintf(val, sizeof(val), "%d", mfd);
+    g_setenv(CPR_STATE_NAME, val, 1);
+
+    return 0;
+}
+
+int cpr_state_load(Error **errp)
+{
+    int ret, mfd;
+    QEMUFile *f;
+    const char *val = g_getenv(CPR_STATE_NAME);
+
+    if (!val) {
+        return 0;
+    }
+    g_unsetenv(CPR_STATE_NAME);
+    if (qemu_strtoi(val, NULL, 10, &mfd)) {
+        error_setg(errp, "Bad %s env value %s", CPR_STATE_NAME, val);
+        return 1;
+    }
+    f = qemu_fd_open(mfd, false, CPR_STATE_NAME);
+    ret = vmstate_load_state(f, &vmstate_cpr_state, &cpr_state, 1);
+    qemu_fclose(f);
+    return ret;
+}
+
+CprMode cpr_state_mode(void)
+{
+    return cpr_state.mode;
+}
+
+void cpr_state_print(void)
+{
+    CprName *elem;
+
+    QLIST_FOREACH(elem, &cpr_state.fds, next) {
+        printf("%s %d : %d\n", elem->name, elem->id, CPR_FD_FD(elem));
+    }
+}
diff --git a/migration/meson.build b/migration/meson.build
index fd59281..b79d02c 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -16,6 +16,7 @@ softmmu_ss.add(files(
   'colo-failover.c',
   'colo.c',
   'cpr.c',
+  'cpr-state.c',
   'exec.c',
   'fd.c',
   'global_state.c',
diff --git a/migration/trace-events b/migration/trace-events
index a1c0f03..e3149b6 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -310,6 +310,11 @@ colo_receive_message(const char *msg) "Receive '%s' message"
 # colo-failover.c
 colo_failover_set_state(const char *new_state) "new state %s"
 
+# cpr-state.c
+cpr_save_fd(const char *name, int id, int fd) "%s, id %d, fd %d"
+cpr_delete_fd(const char *name, int id) "%s, id %d"
+cpr_find_fd(const char *name, int id, int fd) "%s, id %d returns %d"
+
 # block-dirty-bitmap.c
 send_bitmap_header_enter(void) ""
 send_bitmap_bits(uint32_t flags, uint64_t start_sector, uint32_t nr_sectors, uint64_t data_size) "flags: 0x%x, start_sector: %" PRIu64 ", nr_sectors: %" PRIu32 ", data_size: %" PRIu64
diff --git a/stubs/cpr-state.c b/stubs/cpr-state.c
new file mode 100644
index 0000000..24a9057
--- /dev/null
+++ b/stubs/cpr-state.c
@@ -0,0 +1,15 @@
+#include "qemu/osdep.h"
+#include "migration/cpr.h"
+
+void cpr_save_fd(const char *name, int id, int fd)
+{
+}
+
+void cpr_delete_fd(const char *name, int id)
+{
+}
+
+int cpr_find_fd(const char *name, int id)
+{
+    return -1;
+}
diff --git a/stubs/meson.build b/stubs/meson.build
index d3fa864..2748508 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -5,6 +5,7 @@ stub_ss.add(files('blk-exp-close-all.c'))
 stub_ss.add(files('blockdev-close-all-bdrv-states.c'))
 stub_ss.add(files('change-state-handler.c'))
 stub_ss.add(files('cmos.c'))
+stub_ss.add(files('cpr-state.c'))
 stub_ss.add(files('cpu-get-clock.c'))
 stub_ss.add(files('cpus-get-virtual-clock.c'))
 stub_ss.add(files('qemu-timer-notify-cb.c'))
-- 
1.8.3.1


