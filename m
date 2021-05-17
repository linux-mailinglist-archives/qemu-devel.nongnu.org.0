Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9703824E3
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 08:58:55 +0200 (CEST)
Received: from localhost ([::1]:35530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liXDK-0000uT-56
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 02:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX0F-0003s0-UO; Mon, 17 May 2021 02:45:23 -0400
Received: from mail-eopbgr30130.outbound.protection.outlook.com
 ([40.107.3.130]:60322 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX06-0001jR-LF; Mon, 17 May 2021 02:45:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9JoE4j3Eu7AyMgnAi96mxCIZ6HbvDh9TO0QLoIK6JpqVvYr+izMpvTFx1CturTqSEpv8CGfUv9oHmcbKvl/a6MLQhRk+99vpV9QBayi/jBhYBm7DET3L59zAGGBEsHAXoefQle63j46E5hqViTephDtzn4ZRG9YmHIp/CkzVxXM5deaol3HIlrVKIOpwYO3AsnGwbf1DVVLJk4CpfMMTPj6irM1U0ZfoAtKx0ZInhbSdqrlgVyaUUDkMuWlOU/Rmcqy9wrvw9wAN4DRvufwG0RZywSFtDxiP5NO4TztRzm1piWiyoolp3VxuevYzgfr8vJcdb6lD3JsU9kkhK2TQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTJyvzd4+etbxHJh4f3kVBLRfd5uMGSxz295JyyGir4=;
 b=jJrCK8kdVrtxYnHJFTtkeJ5tOf1i3yBP3qpPyg7rTepoxv82mTslHV59cAt8B2U89fEMCcZRhUdiwVvtELqKfnpIKYcVa0EcLjUK+Q+fuCU8KHI9HoGD4dt5xr7QECNcWqDYSRhieH4IMwJZlvlRYi/YOFsX6fWPwX4y0jmstrtjpa6U6k9FlReFrR7+u1Gjl4hS42tiOHzd1m7l19mrLeNyxVySo8LQI+drEEK6uWbFrI8yQ5649es5PbeiY04vJ/eekYYJzPLMoMA73Jb/crHwCA225IbgRUNfaBHOBl3dwEzGEotlCaO1opVoUPQZRpzr8y4XUHhabjWAijvhMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTJyvzd4+etbxHJh4f3kVBLRfd5uMGSxz295JyyGir4=;
 b=CNIEfAAYHvx+JZKzna3PEsjeRsvrV3uzqg22BwQFudqocAN/3hx8D58+dyP5paEeDLhjScmKKjNzKyHyzLlgQ9ARMmv/DRvzStXS7pFayfHVS9+UACx3MqBnj40dIvx2V39XISCwPh7pg1bb8EtIr5I1Jt8Jum0flUL03djK3tg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3382.eurprd08.prod.outlook.com (2603:10a6:20b:47::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 06:44:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 06:44:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
Subject: [PATCH 08/21] block/backup: stricter backup_calculate_cluster_size()
Date: Mon, 17 May 2021 09:44:15 +0300
Message-Id: <20210517064428.16223-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210517064428.16223-1-vsementsov@virtuozzo.com>
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.231]
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.231) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Mon, 17 May 2021 06:44:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab0be603-9e3f-401d-e706-08d918ff4885
X-MS-TrafficTypeDiagnostic: AM6PR08MB3382:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB338204489F468EAA454AE4B2C12D9@AM6PR08MB3382.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CIZFROHiCaFGebFI2kRmG3DO9TZXhQWDMPpdkx5QN93IEbQ8NuyXOa2n36XA3icW6B9X6keyM1dJABCfmf+ehuR6as4yc9D/0tY20Z8eOsHY/ESWQA8e5vDmZFMA5IWYX78CDE5KticCXM6v76nFMV12CDlmh7lFLKc3BCrvCIkq0a2N3bocvBCgg18Y0wuP0VbTpmfcW75SMRcH3Qx6tVEzkzBkR788jvpg6XXKiLvnnjGQK5RMHTt9aRYlppJdEqHC4pmURKHmNQXzVpicqKH8W6kJ89YUeapRxt7TOsCXuYz7HybS2CvkWdejs5O3MNO2p5SL7cle+Qi8cibMR+ZbfjmAKKbRY3+lqW2joR4PDJv5fEEAtyXfreKfvSC55Txiqixe8dTpV3FZYl1Xl8SvX+oEAAKHLpGh+KchqMqFW6G8BtnZGt4UkXd3iRnUiYbSCKhLCOc3JBnNMoQnrppG8FIqDnCIxsVFA7eMS5/ddr6fAO8i16lym0MnXHKDIl+TrouKleA4TF4SNHuXTyS+Pop1xyI0K714CXTyWVxvMg06Jds1vmZ3oGxEYvs4Yh52kR+ZKAqNTCJxci7FSOCZnd0zsgqObpET/pJ3MwNjbM96V5m4mwuKs/mxMsCBO+12r6lIqt7eU3ssK7GEuAmqd+bf7EJf4MQUi0Ljh0E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39840400004)(6486002)(26005)(2906002)(316002)(36756003)(66946007)(1076003)(107886003)(5660300002)(16526019)(186003)(478600001)(38350700002)(38100700002)(8676002)(6666004)(86362001)(2616005)(66556008)(52116002)(8936002)(66476007)(83380400001)(6916009)(6506007)(6512007)(956004)(7416002)(4326008)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?07P3muiHMprOvVTjfjrgXUPNP+hJEtBa7UkuWDiiEfonMnnFB3Y03GRYdwyC?=
 =?us-ascii?Q?t8RZABuHSpSKL4HXgXZ2xVuM6dJiWy2CIVGDG3U6XrvDyvw9xW4deXMtT4Ws?=
 =?us-ascii?Q?NVXhYu2BIHxXkJIAUSYRjDM2Q8sB/skiKzBKFr2WTmlJggGaweiuBIAlNQh9?=
 =?us-ascii?Q?VQW4qw5B7C8E5fPVl7fWO5NNk+t3LfE6jSW1jQxoB3mmeYvmZlVc7TgQhqc4?=
 =?us-ascii?Q?FQtOJoz4BJxGJoNVh7PvimbiZXpRSCBvTER6N/kwZ8H5TIF3xqAmyik9w3ih?=
 =?us-ascii?Q?1vVhJnj4hn7G2kZDOBIsYmHd8Pfs4S20U90FVH2/iaX5BR1hFXjXAN4FciSJ?=
 =?us-ascii?Q?J5lJvNIyJQMG3f+SFDjzOjHopvdN/WZHzA1+W+bFbAePnTg2eoJ3vGpbXWGu?=
 =?us-ascii?Q?CEZmZPhIbXGvr7SyR2BWbdrkWx9Z8ebYd14UzSA9aW5cZSJR51iTR0vTV9XG?=
 =?us-ascii?Q?xdw0awqbVmrLnCJ7DOvCr99IMl/enqi8NJTeLl1N5Uu2IhCntqOv5nNAtqzH?=
 =?us-ascii?Q?A54HyhY/3kznah7UWW7KAZEnUhANl8WERI6bR2ApTiSu8BtG80GbldHekX5q?=
 =?us-ascii?Q?Fj2F2rd5kUnaoFuMNFs7nEQP7CbjHoNkMRAG2cjLsGn6JHfADBAYEx2I0Z9d?=
 =?us-ascii?Q?oycT1MNbme8XA6CwxfeVtWnzVxkp1Sx5RAFMBTwYrQ/2Uczc7UgtKyURSiHS?=
 =?us-ascii?Q?jrx1bANw1L/Fpq7kNregIrGoCHhXt+1zg13Q4rZFN2uQ2DCEU6H/NDe+dsqL?=
 =?us-ascii?Q?7usJlZRuE2hGvksMQHbQ+R2WFJkQNBrvVh+Znl95hEk/hCs1N+DGIMilevin?=
 =?us-ascii?Q?vSQut+HP3Ot47MpQawezqIw///1ak8RJupuORNmgdmKhhTN4Nn2mgiYnapSo?=
 =?us-ascii?Q?1O5z0dWW6lOi0nhk50Ro2NhL9LaymFrRZBaTeBmneElvZGGSI9Gl76ZxA7Fi?=
 =?us-ascii?Q?8S5CGYl4LImN8N8NI3iAWfOMm+dVg7lX0CIBfSibl8lgGETvEmpL8IKGB7M2?=
 =?us-ascii?Q?bjbTrLL/0i70BzxZdke8YipRx40gWuIXX+EoiBgDp7GZFcB8GEvLgnVGT2gI?=
 =?us-ascii?Q?z6m+YI+BSlEJcZcjcJ0ixP3pHWFTDvwVJ14HfloB6Yg/udFLXpdYDr+uoNGf?=
 =?us-ascii?Q?/gk9ekgUSWQuoFNfDcYTmKrDgiV5ILj9+6/VtJRQqHTecTh7xR4ETVucuI2w?=
 =?us-ascii?Q?gQlaU65+XX6EItBscOdWKBADNqmJDYDSsLqTuwcK4MHF02eLcrHTLwnpjFr5?=
 =?us-ascii?Q?Yua6C60EnTL1S1sGUz4qJQoqniaABfTWE8793LkjH25+XrYV370R9PnV/Gfx?=
 =?us-ascii?Q?B0fC/szxxAQXbN34BtF0RJAY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab0be603-9e3f-401d-e706-08d918ff4885
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 06:44:56.4158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0u6astjiueUDzG9GgRnMSIGWJ1QDMGP5Gk3IRYU1RmqwXSJIhydIlUbKzm6Y/LB2hyHhLJg8Kia31GohlIoEDWM0xUz4hX8j7K19WmzuQoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3382
Received-SPF: pass client-ip=40.107.3.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No reason to tolerate bdrv_get_info() errors except for ENOTSUP. Let's
just error-out, it's simpler and safer.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/backup.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index fe685e411b..fe7a1f1e37 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -367,7 +367,10 @@ static int64_t backup_calculate_cluster_size(BlockDriverState *target,
      * targets with a backing file, try to avoid COW if possible.
      */
     ret = bdrv_get_info(target, &bdi);
-    if (ret == -ENOTSUP && !target_does_cow) {
+    if (ret < 0 && ret != -ENOTSUP) {
+        error_setg_errno(errp, -ret, "Failed to get target info");
+        return ret;
+    } else if (ret == -ENOTSUP && !target_does_cow) {
         /* Cluster size is not defined */
         warn_report("The target block device doesn't provide "
                     "information about the block size and it doesn't have a "
@@ -376,14 +379,7 @@ static int64_t backup_calculate_cluster_size(BlockDriverState *target,
                     "this default, the backup may be unusable",
                     BACKUP_CLUSTER_SIZE_DEFAULT);
         return BACKUP_CLUSTER_SIZE_DEFAULT;
-    } else if (ret < 0 && !target_does_cow) {
-        error_setg_errno(errp, -ret,
-            "Couldn't determine the cluster size of the target image, "
-            "which has no backing file");
-        error_append_hint(errp,
-            "Aborting, since this may create an unusable destination image\n");
-        return ret;
-    } else if (ret < 0 && target_does_cow) {
+    } else if (ret == -ENOTSUP && target_does_cow) {
         /* Not fatal; just trudge on ahead. */
         return BACKUP_CLUSTER_SIZE_DEFAULT;
     }
-- 
2.29.2


