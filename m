Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6563E3191
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:14:41 +0200 (CEST)
Received: from localhost ([::1]:47892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC86y-0000Yz-Bv
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85T-0006Ii-Ey
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:07 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:63880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85R-0003zA-Me
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:07 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176MBlNL032562; Fri, 6 Aug 2021 22:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=F64+w3YSvZefRGfkU0pckjcMStMA3dKNyLg47J/KXEA=;
 b=plXHvsXa9lY+G9FJ8rMUa7d43yL4F/tJWPrK4FrPG0VC9/VSMixsu0kxXQm/r2HQALfV
 aVJjHamApC130rJ007A4oU6OAKs8LfJ2Kx8FfzkqIvrx2xZ+kPVPL3odWv2RSILLCkA0
 1lzshtJDi7d4E1FdzH1DrAqtBsnXODIn3rpM5DgtBZckNTGKUs5g3FFIcToj2CZcZx0I
 8BFU8Epi6aUmXO7nLp0rIA5UZ7j4sqoEQQGicMm4D9NaB1w/EBz7GcrazrPxp6rvT7JV
 Sz4N8Bw+f0f2LnQ4WI739GvbWK14S6jwsFU1u5mkqoaj2F9RNQ5b360lkGNNpQ2IP4MH mg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=F64+w3YSvZefRGfkU0pckjcMStMA3dKNyLg47J/KXEA=;
 b=ihwHr6N92LmVdwwFX/2LvfiP3PiOF/QCLTTCYPUSzGGqiDifPdZWm77zpNcr4oovpOHd
 vH1YSm6cpcUm+cFy8XGMV/Y1XkBF+e/3bychuo6qWjyr6r5q2yb9fhPDHTOfeeSOOO4Q
 d6WQ5budJiRNjziK956gHWXdrKFXbKZqhXlCD0XOO2Zk/1lf+qJV3PecJLvMaU/OeQmR
 m0zATqaDKUsWv4yFFfaUzW6OYBjOQVKm+cpxYhFGiaMNpUQ9B42DXntsUY7bWjtJCPRY
 mUOnLeQ1Jtg6dbW9unJd7vIVl0Mgc/itWjFvl7aoKBGnQBZ2pM6YIH4THOrHV4kf4mrv AQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a9661s13k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:12:58 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176MBl9R032685;
 Fri, 6 Aug 2021 22:12:57 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by aserp3030.oracle.com with ESMTP id 3a78db75bj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:12:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lB1GsxsWFIzO104UN4q7Etlm7woacZBL9H5Ynu7M2UcYYvSR7z+DKmvhWPhcHteu3sCl4EOZHDbguBNej6uV5pFG1WCjqZ8MTzwIkcGujsjAW8YF9NNXYRkOULWYsZH+HE9+Azdgb/dFzEdoDQwMS0oaBtB5mGEM1/i70FCrtqzeGPGl4Yf7BPwFZPa636e4hzb0mdPwO0b+yGh4hcQRxsEyEXJXzWkjPjjS7JNDALs0DkAebVOrA2Sif6L6W/wAC3NfhixPPI1JfzoqwHBnxmGEnGfjaoTmVUYVQ18WaeAbI9IK5aj11nByhfyeU2W8f/f+Gymu0eSO2xE3ODtYqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F64+w3YSvZefRGfkU0pckjcMStMA3dKNyLg47J/KXEA=;
 b=DpevK54luLSUiTRZo6aa2xgadA1JMMD9Uxlx5OZKKIJX5G0xcWoOHfZq84Ph2OXPXIfYjsx//V3xqXcJbsTkbmM1JQL5uRh8Okw7ynDH7mwqFXFFqcHtQxy1J7O9sQyTVuGM+pJZV4GOM4MtREJ3UDQl4xAnVpBdJYqxw8+vjp4Jg4Pi5E7iFdF7741zin1oU6dWhxRfbImSjUFKDbT7DrytNJKWBuWXa5Q7/X9p4sAV0vSmjGOcLayWSKbcigq+4G7isYTPy/d5a/eqZSy9CYb6hGKMLJgS6rJkJZonX3gV9xcUVQvk9BqJCHxR4fB+rBbWfe8q6x2iUwzojZX7ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F64+w3YSvZefRGfkU0pckjcMStMA3dKNyLg47J/KXEA=;
 b=n7rEakoxyGxImR31JFe/ISL1AfaWxFrkT6Gi3M72fnYVkm3z15PZrFyahTtvBEMfApCrFNVbzOhhYCqbDLdWCnxpAQ6MzH8+3oaOvOfqlRLfXfcodO2GoVHadQONXAUss77uKYdXIPkFvFT1pncEVAS+td7Da0TcZUIC0B9iljY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4324.namprd10.prod.outlook.com (2603:10b6:a03:205::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 6 Aug
 2021 22:12:55 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 22:12:55 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V6 02/27] migration: fix populate_vfio_info
Date: Fri,  6 Aug 2021 14:43:36 -0700
Message-Id: <1628286241-217457-3-git-send-email-steven.sistare@oracle.com>
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
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 22:12:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ed80a6f-da02-4b0d-4989-08d959275789
X-MS-TrafficTypeDiagnostic: BY5PR10MB4324:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB43240DC3FA4A3953F215B4EFF9F39@BY5PR10MB4324.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ONXpM8NXVh2EgnLAB9uHfauwrv2J5PImI5449dNqCeUzgw9eF8+ZYwMR8igxKJutIvkkzlr3hEuMNUKqsGZgR6Nm+ClD0k7iEHeOA0kwwYheXyAoueg/S11XcdavqrFo/gCfvzVEbBuYNChtzI3Bt3Gn2pDpwXdLeoknLhq8X5giKAEsiO/+rkyJXr56EdicjWYUYEpWVv17k+uI4PeOjpv3iVphZvdQC7s8eOg4IZpejuOGDNv515TUMbAC4JlR/WiLh8T3hh3rFF1qQi+b3CGI+rGICJG1ZPGaCwwxZrQd3+UwO5MUigvQ/qnId6cz4qmb4JvAcTKkqk4QxG0gBES43VbY8Qy/+XMNOw35pZeA12LqSHzUCdu6vGCKwCSyTbMIoLiwKSeUHpkCwK+UOI5K44CKekhQ6tksjgryjEQW69psFf1rP7JAYKxTMAXQ6CL6o5YR7nYM6J+n9oqcAc4xYagaS20OOnSGSl0rKjddUHQRTRNcFcpkXijyj6nqBjS7ZvikSI0Ic3rSRjGHx7T8asT8nkQRscEHskhgKqyoykCBlG70+fQuDWO5J6upmbuX2ZKRYs48FTu8TPMyeFmywQ+d5hsM/cX7GEyf5y4vJHvYfv0pJ38Rirr53yBiXrG9TO93S08j0DI9yErOXW13pyiWK3HWwfU/vCEHw17bDjLoAzDtnlYFwbbezc+OCVYNXwoqyf+9TB0lqEVXhQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(6916009)(2906002)(36756003)(4744005)(956004)(107886003)(7696005)(4326008)(83380400001)(7416002)(52116002)(2616005)(54906003)(186003)(86362001)(66476007)(66556008)(6486002)(66946007)(38100700002)(38350700002)(6666004)(5660300002)(8936002)(8676002)(316002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CEiwkfx7WFYSuDdKQSYWv5fZV9bGRy3H7FAxvJhkS7WvKWWMnJkf9lkQrX9F?=
 =?us-ascii?Q?JWlrn0mCE9Ao1vRU85jHmYHtrZVDwBjd8JDg1uE0vg+RPQtDekPC+3uUMeQk?=
 =?us-ascii?Q?1zqxMZsrmoTmk0z07r0hJ2wnvjqb7lKKcQs9nulnVDLRRtrdu82uBzuNnR4b?=
 =?us-ascii?Q?QJMJcc84F77jb1fVPNU2giyQfftJ1tKwvzP+udi6gWW8cFcFotI6UcXeKlYw?=
 =?us-ascii?Q?GXJfl0VYX8ntjax5Y1EcKFKTg4/IOzDBJKQbYESMuROk6PLCQ2Nw5MqhHXsH?=
 =?us-ascii?Q?9tLhgoXEEXmTattwVwsI+Jp/YvaDMqt/DeNKQYAtGpVpnyLZdcOYRffkPKO6?=
 =?us-ascii?Q?g+mQJYjpkb6lgabnNsikTjYDhmDJfzlJqRmRbivZDsMdTDRQtCzZCHV+6w6J?=
 =?us-ascii?Q?iGnayCa7rwG9JbBQvFz0AQQhOhvFMJlyEHd9u0Q1LR42ajk4ZiniUaOez+vv?=
 =?us-ascii?Q?dN4ML7XpuAN/quS3FA39+8jA5wndPe0523N9Ith+1hfeI4BXwON9EmpZNPTq?=
 =?us-ascii?Q?DEY48/J0N0ACYG3L3iH8YLVTwOrMO3lFrqbazmwIdn0jmiuyn4u69YkDYzej?=
 =?us-ascii?Q?CtYvgCP+E7rOTMT7kzUREb0qg8CYXc4JMax7UO9VfMWstSEBqkCEBg5nFLS7?=
 =?us-ascii?Q?M2Audqr407ksj0ubrOa/QjM/ZVVJ5LsnWQV0jDf787iDUcO5YsU0pMZHc3qr?=
 =?us-ascii?Q?jWAtCnSgG3F3gewBkjzbaIF8LZyYq+9Rzv5Kip+31MK64Ry93t5NsMLku/mS?=
 =?us-ascii?Q?XDXctYp0Eyh658M8okuTFSF+YQnQPYwzOPHDfivj/xgVj+uQVWXcmxz3uY5S?=
 =?us-ascii?Q?RYO4NLTuOM2sS8+lyzSGXo8TMBvU/VU/Hs+smPBavGFYptr7eg1P6puR+/6A?=
 =?us-ascii?Q?RM86fZoMnq9TAwQnk2DiCEcys+Z7KEgMAfThurrS2Gx47vBuU7QLPsMMZ90e?=
 =?us-ascii?Q?bJyRYqP499m0SkERCDim+YgpCwA4BLfU10tg9uIJrhISFc4SaZQY1HKH/zDL?=
 =?us-ascii?Q?+jOOLRW/vvwMn1DSAhnlaq1pZyp9um9i91Yqq9muJctVGaBBpHEG1bjwE8+c?=
 =?us-ascii?Q?jGA4Z1C9S7hNhrWySe4kwbj7Kfb/bCVIaEAsbOc0IaN5YDUqdh8iHwS/hvqY?=
 =?us-ascii?Q?/embOJSlJCqUjADPSDQZm3F7siG+z0GQlWP8ttKglqFEnTOqNJvc1jKhviym?=
 =?us-ascii?Q?EWMSgeu6u5fmKqSwpFkyP89wBD8uJlsg7Rn9I0puaFPRHjO/e1v+7tNkhd9o?=
 =?us-ascii?Q?MEm/gtYU5a5mwoY409IM0lKjxts18qS7nxtTEUScg2pBisnj4xzbzPpZpOrO?=
 =?us-ascii?Q?xf3AAFgg/kleSf+QQbkMDdK+?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed80a6f-da02-4b0d-4989-08d959275789
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 22:12:55.8096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ao7HtVvV1FIebDMxwrvl3ANdca7epbnEko1vQY07v82rjImpzBnQF85pnZwHpQjIxyeUFZ1Kn7oA3OExIOSaUI/iisje0Eha2STn7Cn92iw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4324
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060145
X-Proofpoint-GUID: 9_NELxw6ZkYYcBau9R_h1l3WsKLHD7vi
X-Proofpoint-ORIG-GUID: 9_NELxw6ZkYYcBau9R_h1l3WsKLHD7vi
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
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

Include CONFIG_DEVICES so that populate_vfio_info is instantiated for
CONFIG_VFIO.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 migration/target.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/migration/target.c b/migration/target.c
index 907ebf0..4390bf0 100644
--- a/migration/target.c
+++ b/migration/target.c
@@ -8,18 +8,22 @@
 #include "qemu/osdep.h"
 #include "qapi/qapi-types-migration.h"
 #include "migration.h"
+#include CONFIG_DEVICES
 
 #ifdef CONFIG_VFIO
+
 #include "hw/vfio/vfio-common.h"
-#endif
 
 void populate_vfio_info(MigrationInfo *info)
 {
-#ifdef CONFIG_VFIO
     if (vfio_mig_active()) {
         info->has_vfio = true;
         info->vfio = g_malloc0(sizeof(*info->vfio));
         info->vfio->transferred = vfio_mig_bytes_transferred();
     }
-#endif
 }
+#else
+
+void populate_vfio_info(MigrationInfo *info) {}
+
+#endif /* CONFIG_VFIO */
-- 
1.8.3.1


