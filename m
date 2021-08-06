Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCE93E31C5
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:30:04 +0200 (CEST)
Received: from localhost ([::1]:48146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC8Lr-0005DI-Ue
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:30:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC867-0008Lq-LF
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:47 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:60408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC865-0004Qk-7W
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:47 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176MB390029751; Fri, 6 Aug 2021 22:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=oDxqybc1HnbMODF9rjdxb5ZqdzNNWjUwKT2x/MCZh0A=;
 b=BteLes3hx0yiyLJXIqqSjuqgUms5RJgKYYKRzIKv9wJdG9PFp7YksOKvno6ngefp+j21
 K+eqCCNFOtf4+PHSNPRM8SHtzeLucD0R5KsNPNzb6RWzLFv8qNbduXk2MMbhYFrQuIfL
 58sDYXj/vdSFL6BXZtJJeVXlqtTXkN1OUpF6fRseOPg+C02pEPD05kUau+VinEPdWHmp
 HpxgIx32Sy7aQ4WPIZtbO2NHYSJeg8i2iMx7IWhklzvaD5sKKj0V4Fc1feQsP64X05jH
 49ZLzmPKTpwpayVQp0ApiqwA3ZjXX7VnIVQ7TVpu0KovOLLI7unBhu7Yn3O6CJUTITMj gw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=oDxqybc1HnbMODF9rjdxb5ZqdzNNWjUwKT2x/MCZh0A=;
 b=onCDqwQdsHNzV6WBdBJ5rhtD8a+dWk+fGKOt7YLW8LAq/iCjLUvCl24N0/8AH5zm/byS
 mPFQuRpqR0AyHwfADaTd2bybf5yjIAaLrvJhwCcDD4tYH46jPQPpZCCefs24hIEyXrEV
 WylJCPHBPJe91KSseGLe6FZ7tQFzYmHVtOEwbUQyXnaMxDcGzfF8Il3cw0tQMdzJJx4R
 Y1jyptHOyzjt0EREM5QfnRgHuHTejTELZ0BlA97VPjMkPHFlAm1oPVHn3QnHLOAmSR7Z
 HHB3k1hthuCXLe06++4t0Z8G2oKBKGuJSpPYO6BrS/Q78Vy84LljAh9dTm+fBi8udnii IA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a90justqm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:39 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176MBgJM181317;
 Fri, 6 Aug 2021 22:13:38 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by userp3020.oracle.com with ESMTP id 3a5ga30fk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ki8JDj/j8OpkxqY5x0M7NdxZvKN9afUZAnsMYsmSBQEimbyKr+EYUJrBiQMY6Be1Hckk33kVUR57y34q60EB4VzjHR/SB3JaVWCpAyAf7rsSS9RzQd2CfJev1co0uLlfMtN1PJJq4K0AtoIXJfXrDyUlFdc0zRmWvxCTkz1l++oZTfmOVpS3NwKhsKccLmr5hQnPkeARQMhPK0yL42Io0SORF3y8n2/YzYIoccPZw8g3363zrzITS9KdrvgV+OlWT5aBgUCiqOxA15gjFdQjyfSEuLdsE6m3+BxONdMLf6fXEU1nDe45R+LCjm3Ne1dft8PUIlZgLYMmnIQBMtZmXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDxqybc1HnbMODF9rjdxb5ZqdzNNWjUwKT2x/MCZh0A=;
 b=eAfZjFlW23nXeReTibtd7/+fSeTiyz/i+PswWb+apZ9aGUE9SqbQPnoFUYpPi2FH55bxZZWtkCdxVOR/zbeJ9cDHgU1JPGzU7f+uin4WyWbmCBzA4PZFp4H63Wk7IxwSiMlLUbW/uoY0tJSri8R/rv3JczyNrlnJ39PH2qedQi0UXO7eH1lPHtZpUYfYkegMjg1FSqasQKQXpTe2E5x5McArOZH5BwbsrRwdEXkvi0b5VQ/m2dL9xZUNayQ8Abja1HAhK/3kui1/YkkyOL5m3Tz65z0rXF3wTR2jv7iUjltZceNsk6cRDuLMb2bIigQY9/ISHboowgz6m+NCS6YLWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDxqybc1HnbMODF9rjdxb5ZqdzNNWjUwKT2x/MCZh0A=;
 b=DBCL9s/w1dIJjdBPvfwnwH/0URe4lFKDonNONUMMCYKezNpTvmoT+LX5m6zaE5RErphbTlzLTsrqER9M1f6QguAO13rXTb8FJkSQl+JgZb/ilJ/kTFIhdzW4V16X9tnledbwTFcLs6jRf+Y416xzKQn4J3AZW3Supy5OSjh5Z0w=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4734.namprd10.prod.outlook.com (2603:10b6:a03:2d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 6 Aug
 2021 22:13:36 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 22:13:36 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V6 23/27] chardev: cpr framework
Date: Fri,  6 Aug 2021 14:43:57 -0700
Message-Id: <1628286241-217457-24-git-send-email-steven.sistare@oracle.com>
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
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 22:13:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92b19678-a206-444a-ed0c-08d959276f6a
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4734:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB473458F6887060E623990BB0F9F39@SJ0PR10MB4734.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:147;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ODH9yfW82LObc8pt0vWZvDvANtEt+EXrXoVXZN48XEp2c07onD1iwMMa8aO1WVpM1lhllzwPtNFqEQSADgcwinikpd7jkEWj+dXvj+gsNDUV/eq5RD7cSnlVbNl/D1OZdDZZwpDOzZBm+puX5o9QF4JFhs8nhWmzJsJmF4XcDGsJJG3sKKkiGSHVm3LnuMc/a+p9Dz/WMv8IRB1JnD04YiI+OXkI2wxD0DjYJKCdtj2opxwamHC+0q7VD/DR+Fi0y5aceGmIQJbLgNl96HfwTs7+bonQhKd90WBvg7/ux6udJD74iG3iaIvuLUJkkSUe4/+qzZsbr72QYdPCSMMOKbuzZezRB4QoJz4ud1Be0/M0yiIy/neZSGkVkkwB+5ESHjkNNLOzf3Q5e4jiNs0Ui+WtEjGfCUImqM0eVukLVz3SBk7Q68WNRlYSWWK3qDqlnDoDHRFjihkPhgQIXDNO6HfT3qZG1GO3MNVLFZ3twuXf1tbEmyhSi5jH6FUReULV2OlBC0isEj48sNGy5eIHHJkzGtn6yIdyfrWqjCOvbeRT3DC4trJ23iXF2G7pPqcVkCFvRZTHb2an1eYZhNH/iuoHNTSaRnxBat5N23FFTc9J7gzQkBnslXtSA8eT0mHwR1XJzHjQD8b7KY52YWt0dITCzwewDQymgNEmiIJLG8KYA4xz1lIJE6XVGgA0q0eoAG6KpBAwbSE9DSgAK6Psdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(376002)(136003)(366004)(346002)(66946007)(107886003)(66476007)(8936002)(86362001)(316002)(83380400001)(54906003)(8676002)(66556008)(4326008)(36756003)(956004)(6666004)(26005)(186003)(2616005)(478600001)(7416002)(6916009)(5660300002)(2906002)(52116002)(7696005)(38100700002)(38350700002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jpQ30QDUNJX0sJxsHlKwOM9s27G6oGdV9guV8ZySk1ZNfkONCfdZbP4t9quU?=
 =?us-ascii?Q?fU6ojpvtuEWN/ICxqnmWysXGCv4Agm/+/eEXtPzJNTyzLmSfU7d1C4TZwgs2?=
 =?us-ascii?Q?SzgxANCulo0OJvG9CQ9ezQwDIKB22v33s+DX3qAUsiyhXaKFivR+LsBGJ4Vf?=
 =?us-ascii?Q?S1g48P91vlaLdeCjf1f1GgvbhJKRcV7X+0aksDZYMpcPvikcdIvP7bglWIr0?=
 =?us-ascii?Q?TxX3OSJUow9FO6gOKiKdr2Yn35woeGtLgUfWH17Wu3Cgikt7K/IpJBSVZYPK?=
 =?us-ascii?Q?o80PgBypXL20cK3AhFnyybhVu6gBrO972eDV3tkR/CkzQcze7hkbkME4FnIA?=
 =?us-ascii?Q?PE0VR5IFj9emwQ++nlfWkMn6N7WtAy+JnzkVik8fIre8wJHFbnrV4UIMlTxx?=
 =?us-ascii?Q?zwDcXA7NoLcu4RUw+Ub4k0amNLJ2bGng/e+axGmSYf3Ip1W7z4cjyiRqsXlf?=
 =?us-ascii?Q?EaXBl4ksB8lSWhQ6EkFm6OlCbB5cnqoJbuwJVGu28Rl2pWeEvFC6/gKd0TFc?=
 =?us-ascii?Q?ybKnaYqAx3g6WokuoPUEM1gbIYzKqe6PB5A9tDeAXnkyJsU/VID1EbA6ZuVQ?=
 =?us-ascii?Q?b8W2pL4b62uTbm0/cT4OF3Q2y9T7fUCY1gmOaecdBOB5650fUq63imbJYrmM?=
 =?us-ascii?Q?hI1YYmeQv8FX7vJCpsMHdC9y4poL1tnrjT3eCQnzfLWxODYpAKrCqBb4nmXZ?=
 =?us-ascii?Q?DZOZe/Ca8qXWb2fM3PZ1hu77HxoK4VjQAiysrqcLBPeszVHudIxgZ18eI1Ss?=
 =?us-ascii?Q?4b9vq/0wDV8H5M7VgTQIjTCGoVug4U2rzo2sg+Z4Obk7Vbn3fuZff0igFPZB?=
 =?us-ascii?Q?5o6SNCFt0hh+xiqY5CL/w5gMAqCqnIJHCre/pgXAdj3245gjD3lMWtBKKfgU?=
 =?us-ascii?Q?ncS/nZiiQIJ8jH0ttQg4rOK8BCOKaeUiI5tqAtwV7LZc4lvicoqML2dASZni?=
 =?us-ascii?Q?Lmi8AyujyRFc+J4V0+u/DG1COfFBRKGYfDcyrfYXG+DaZrUVKzsh3AJr3JFo?=
 =?us-ascii?Q?2Wl8C4Vs7mSNrBQqWYrRwsZuZECeTyRFzYExVmgLwpbNdzBX6I937wuOoxPh?=
 =?us-ascii?Q?qVBUKJILN4NHz/6hSMjzY1Ju5FROSD1ghs+l3qhVUBhrpcZWVO4kPRcrL6y4?=
 =?us-ascii?Q?gTKCeHMWM+mPoDNOxAa0uSuRaV17pT4Wfqs+YlvhrD5rNPfyHRJlkeu3giHN?=
 =?us-ascii?Q?Dm0Dnlx3GF5OCHXOu6J7MOFK6VKzxs1UXYBqa5yvUyD42doy7hWXh4n14Fle?=
 =?us-ascii?Q?dpvT97x2+mHD/zZKjacoIVNJ54Zz7RNrVe86dtGN/EoC+RtK9vVajPOk0GBJ?=
 =?us-ascii?Q?AOOdAOdbcd5dIDm0XqoOaYkD?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b19678-a206-444a-ed0c-08d959276f6a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 22:13:35.8970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/VGAQSahLulAVOeBQ4jL9uJQ733MjcgLRpJMWfF4xkUsorrBEI72dcojI8YBpW1reLH3eQiuOL71kaXmffp9jSMuFXcAkRHlTs7w/et8fg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4734
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060145
X-Proofpoint-ORIG-GUID: _oE1jeTBcXMY--oawMbq74FoTJf_cv9K
X-Proofpoint-GUID: _oE1jeTBcXMY--oawMbq74FoTJf_cv9K
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

Add QEMU_CHAR_FEATURE_CPR for devices that support cpr.
Add the chardev reopen-on-cpr option for devices that can be closed on cpr
and reopened after exec.
cpr is allowed only if either QEMU_CHAR_FEATURE_CPR or reopen-on-cpr is set
for all chardevs in the configuration.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 chardev/char.c         | 43 ++++++++++++++++++++++++++++++++++++++++---
 include/chardev/char.h |  5 +++++
 migration/cpr.c        |  1 +
 qapi/char.json         |  7 ++++++-
 qemu-options.hx        | 26 ++++++++++++++++++++++----
 5 files changed, 74 insertions(+), 8 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index 4595a8d..013afdd 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -36,6 +36,7 @@
 #include "qemu/help_option.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
+#include "migration/cpr.h"
 #include "qemu/id.h"
 #include "qemu/coroutine.h"
 #include "qemu/yank.h"
@@ -240,7 +241,10 @@ static void qemu_char_open(Chardev *chr, ChardevBackend *backend,
     /* Any ChardevCommon member would work */
     ChardevCommon *common = backend ? backend->u.null.data : NULL;
 
+    chr->reopen_on_cpr = (common && common->reopen_on_cpr);
+
     if (common && common->has_logfile) {
+        g_autofree char *fdname = g_strdup_printf("%s_log", chr->label);
         int flags = O_WRONLY | O_CREAT;
         if (common->has_logappend &&
             common->logappend) {
@@ -248,7 +252,13 @@ static void qemu_char_open(Chardev *chr, ChardevBackend *backend,
         } else {
             flags |= O_TRUNC;
         }
-        chr->logfd = qemu_open_old(common->logfile, flags, 0666);
+        chr->logfd = cpr_find_fd(fdname, 0);
+        if (chr->logfd < 0) {
+            chr->logfd = qemu_open_old(common->logfile, flags, 0666);
+            if (!chr->reopen_on_cpr) {
+                cpr_save_fd(fdname, 0, chr->logfd);
+            }
+        }
         if (chr->logfd < 0) {
             error_setg_errno(errp, errno,
                              "Unable to open logfile %s",
@@ -300,11 +310,13 @@ static void char_finalize(Object *obj)
     if (chr->be) {
         chr->be->chr = NULL;
     }
-    g_free(chr->filename);
-    g_free(chr->label);
     if (chr->logfd != -1) {
+        g_autofree char *fdname = g_strdup_printf("%s_log", chr->label);
+        cpr_delete_fd(fdname, 0);
         close(chr->logfd);
     }
+    g_free(chr->filename);
+    g_free(chr->label);
     qemu_mutex_destroy(&chr->chr_write_lock);
 }
 
@@ -504,6 +516,8 @@ void qemu_chr_parse_common(QemuOpts *opts, ChardevCommon *backend)
 
     backend->has_logappend = true;
     backend->logappend = qemu_opt_get_bool(opts, "logappend", false);
+
+    backend->reopen_on_cpr = qemu_opt_get_bool(opts, "reopen-on-cpr", false);
 }
 
 static const ChardevClass *char_get_class(const char *driver, Error **errp)
@@ -945,6 +959,9 @@ QemuOptsList qemu_chardev_opts = {
         },{
             .name = "abstract",
             .type = QEMU_OPT_BOOL,
+        },{
+            .name = "reopen-on-cpr",
+            .type = QEMU_OPT_BOOL,
 #endif
         },
         { /* end of list */ }
@@ -1220,6 +1237,26 @@ GSource *qemu_chr_timeout_add_ms(Chardev *chr, guint ms,
     return source;
 }
 
+static int chr_cpr_capable(Object *obj, void *opaque)
+{
+    Chardev *chr = (Chardev *)obj;
+    Error **errp = opaque;
+
+    if (qemu_chr_has_feature(chr, QEMU_CHAR_FEATURE_CPR) ||
+        chr->reopen_on_cpr) {
+        return 0;
+    }
+    error_setg(errp,
+               "chardev %s -> %s is not capable of cpr. See reopen-on-cpr",
+               chr->label, chr->filename);
+    return -1;
+}
+
+bool qemu_chr_is_cpr_capable(Error **errp)
+{
+    return !object_child_foreach(get_chardevs_root(), chr_cpr_capable, errp);
+}
+
 void qemu_chr_cleanup(void)
 {
     object_unparent(get_chardevs_root());
diff --git a/include/chardev/char.h b/include/chardev/char.h
index 7c0444f..3fa3528 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -50,6 +50,8 @@ typedef enum {
     /* Whether the gcontext can be changed after calling
      * qemu_chr_be_update_read_handlers() */
     QEMU_CHAR_FEATURE_GCONTEXT,
+    /* Whether the device supports cpr */
+    QEMU_CHAR_FEATURE_CPR,
 
     QEMU_CHAR_FEATURE_LAST,
 } ChardevFeature;
@@ -67,6 +69,7 @@ struct Chardev {
     int be_open;
     /* used to coordinate the chardev-change special-case: */
     bool handover_yank_instance;
+    bool reopen_on_cpr;
     GSource *gsource;
     GMainContext *gcontext;
     DECLARE_BITMAP(features, QEMU_CHAR_FEATURE_LAST);
@@ -291,4 +294,6 @@ void resume_mux_open(void);
 /* console.c */
 void qemu_chr_parse_vc(QemuOpts *opts, ChardevBackend *backend, Error **errp);
 
+bool qemu_chr_is_cpr_capable(Error **errp);
+
 #endif
diff --git a/migration/cpr.c b/migration/cpr.c
index fd37d98..62b2d51 100644
--- a/migration/cpr.c
+++ b/migration/cpr.c
@@ -6,6 +6,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "chardev/char.h"
 #include "exec/memory.h"
 #include "hw/vfio/vfio-common.h"
 #include "hw/virtio/vhost.h"
diff --git a/qapi/char.json b/qapi/char.json
index adf2685..41475dc 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -204,12 +204,17 @@
 # @logfile: The name of a logfile to save output
 # @logappend: true to append instead of truncate
 #             (default to false to truncate)
+# @reopen-on-cpr: if true, close device's fd on cpr-save and reopen it after
+#                 cpr-exec. Set this to allow CPR on a device that does not
+#                 support QEMU_CHAR_FEATURE_CPR. defaults to false.
+#                 since 6.2.
 #
 # Since: 2.6
 ##
 { 'struct': 'ChardevCommon',
   'data': { '*logfile': 'str',
-            '*logappend': 'bool' } }
+            '*logappend': 'bool',
+            '*reopen-on-cpr': 'bool' } }
 
 ##
 # @ChardevFile:
diff --git a/qemu-options.hx b/qemu-options.hx
index 05e206c..3f0c974 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3185,43 +3185,57 @@ DEFHEADING(Character device options:)
 
 DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
     "-chardev help\n"
-    "-chardev null,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "-chardev null,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off][,reopen-on-cpr=on|off]\n"
     "-chardev socket,id=id[,host=host],port=port[,to=to][,ipv4=on|off][,ipv6=on|off][,nodelay=on|off][,reconnect=seconds]\n"
     "         [,server=on|off][,wait=on|off][,telnet=on|off][,websocket=on|off][,reconnect=seconds][,mux=on|off]\n"
-    "         [,logfile=PATH][,logappend=on|off][,tls-creds=ID][,tls-authz=ID] (tcp)\n"
+    "         [,logfile=PATH][,logappend=on|off][,tls-creds=ID][,tls-authz=ID][,reopen-on-cpr=on|off] (tcp)\n"
     "-chardev socket,id=id,path=path[,server=on|off][,wait=on|off][,telnet=on|off][,websocket=on|off][,reconnect=seconds]\n"
-    "         [,mux=on|off][,logfile=PATH][,logappend=on|off][,abstract=on|off][,tight=on|off] (unix)\n"
+    "         [,mux=on|off][,logfile=PATH][,logappend=on|off][,abstract=on|off][,tight=on|off][,reopen-on-cpr=on|off] (unix)\n"
     "-chardev udp,id=id[,host=host],port=port[,localaddr=localaddr]\n"
     "         [,localport=localport][,ipv4=on|off][,ipv6=on|off][,mux=on|off]\n"
-    "         [,logfile=PATH][,logappend=on|off]\n"
+    "         [,logfile=PATH][,logappend=on|off][,reopen-on-cpr=on|off]\n"
     "-chardev msmouse,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
     "-chardev vc,id=id[[,width=width][,height=height]][[,cols=cols][,rows=rows]]\n"
     "         [,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
     "-chardev ringbuf,id=id[,size=size][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
     "-chardev file,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
     "-chardev pipe,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
 #ifdef _WIN32
     "-chardev console,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
     "-chardev serial,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
 #else
     "-chardev pty,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
     "-chardev stdio,id=id[,mux=on|off][,signal=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
 #endif
 #ifdef CONFIG_BRLAPI
     "-chardev braille,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
 #endif
 #if defined(__linux__) || defined(__sun__) || defined(__FreeBSD__) \
         || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__)
     "-chardev serial,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
     "-chardev tty,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
 #endif
 #if defined(__linux__) || defined(__FreeBSD__) || defined(__DragonFly__)
     "-chardev parallel,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
     "-chardev parport,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
 #endif
 #if defined(CONFIG_SPICE)
     "-chardev spicevmc,id=id,name=name[,debug=debug][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
     "-chardev spiceport,id=id,name=name[,debug=debug][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
 #endif
     , QEMU_ARCH_ALL
 )
@@ -3296,6 +3310,10 @@ The general form of a character device option is:
     ``logappend`` option controls whether the log file will be truncated
     or appended to when opened.
 
+    Every backend supports the ``reopen-on-cpr`` option.  If on, the
+    devices's descriptor is closed during cpr-save, and reopened after exec.
+    This is useful for devices that do not support cpr.
+
 The available backends are:
 
 ``-chardev null,id=id``
-- 
1.8.3.1


