Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E7238E8BC
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 16:29:41 +0200 (CEST)
Received: from localhost ([::1]:44792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llBaM-0007zo-Pi
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 10:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llBS8-00077b-3P; Mon, 24 May 2021 10:21:08 -0400
Received: from mail-eopbgr50103.outbound.protection.outlook.com
 ([40.107.5.103]:9605 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llBS6-0006u5-8q; Mon, 24 May 2021 10:21:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cckx18stDAKKWiLUnLNjfwLom+qeG7jEvWuOXDQ8pc0Kimm7Xlb72yrhZ8BLvlbPchi8OZ12xV/3JFdaE1/cDVjNFBjir4sSPpoagyYE2AQ+EDpOpu43SZxXkzhRDuiTAj7vEdx2XshxtRin+H26cZ4ulTi/TIuKXMeSXH4Z4mpyA+wmopxKqyKk395HoMUQplAwq66ZfaJm4EW4SLk7Tk6RzTgC9akGRRevSZv009AF2gwLu8eCYDyQKf7JhfqJDCQOJysAdE453V9KfdK8O4kMbFZBchE1oXM4p9ejOhhO+vIc/FxO4CMKjZSvhsIRmYIRl2T52wvmKewSI3DTXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8CJzS2CiAgW/7aayOrTJ2lK8BeAIBaPTwhPjpej5Qw=;
 b=E8so7m10Uwu7bNZPNeP3nkcadMYgv9tBnQF/CjOsyYsnWp7rCgQuPh7I6kN9DYveGGY+ZeBRB92nx1vHIBQXCle0uwrynsCKaSWXR7krG57tXodG2HUOA8BNlRkzxSHPSpz/LtnloJEmeIgMKb2LZMd0vIFYXz3S6hnQfGDUqGr08XVw5wNeY8/GSn4B/Z5mdYrR4lzaFx5RNopw5xLw3PJaw5wC67kZ0pwQAgiMqEb8A+zd3LeN7oyvVFs11kuetdWPFwI1VBxiLinF50B72DuiX4ZLtNpQs3F4BmgL7kqrbkq42RNPsSXan1DxxXxY7UxkArc1oreMLjaGuvNjGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8CJzS2CiAgW/7aayOrTJ2lK8BeAIBaPTwhPjpej5Qw=;
 b=QiIGU/v4uZnrLn9u6t345IL1ULwgGF0/Um43mjAunYIUqfpH9F70oRmjSXHbK2jCS5F3QAC4uTc30efN+q9CjtYEYlRE0wd32qj25y8KElH7SJgUlVFm/fzpBD4DQ9gQLJoPdpiOxsO13FHJh/7FdCakiqwUMaDiJT0VHRcuLM8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4165.eurprd08.prod.outlook.com (2603:10a6:20b:a2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Mon, 24 May
 2021 14:20:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 14:20:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 vsementsov@virtuozzo.com, ktkhai@virtuozzo.com, eblake@redhat.com,
 berto@igalia.com
Subject: [PATCH v3 07/10] qcow2-refcount: check_refcounts_l2(): check reserved
 bits
Date: Mon, 24 May 2021 17:20:28 +0300
Message-Id: <20210524142031.142109-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210524142031.142109-1-vsementsov@virtuozzo.com>
References: <20210524142031.142109-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: HE1PR09CA0063.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.195) by
 HE1PR09CA0063.eurprd09.prod.outlook.com (2603:10a6:7:3c::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 14:20:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 310d4ebd-759b-417b-bb0a-08d91ebf2381
X-MS-TrafficTypeDiagnostic: AM6PR08MB4165:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB416502A92B6007030035F6DFC1269@AM6PR08MB4165.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:53;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 56blYcD44jvG0mxuauiNu7N9h6nYDek3FlF/q3r0AblRlW2sADXkmj/JB4249dH8a1qeqfPE6AoktacIEuy0RmFwflRs2Y3G5vefwBMT9WfcPbel0WIyu2SfRmiK3WT3xyF/U67t+CnegNRXxUSAWsO6QOsUfbikTV3265GM8yxQ03odGB2Pgn+hvY1VYQBUtMOEvX3j4gXuL4WtSdwMayrcVGdqZkVoZKq7LialbosIkxiZSAky7V3n7ufDALqdXZXrVzmUrqk86UswJWoTkXj8tj6bF8v3Wo6aOiPl6954ffAZl1xAEVRX/YeekaxIyf5Ckexl7eP40TfZ+Vcopc6CGbA/Kr6foC8Diy5dk9Kis7GmHRWOqpXtHQ/uuYfa9PIBhylfCNGErRW51fH5h0ohVBJ/ouWES2tchi6iManWz4JHYiHK3oh4ZA9jdOcYiUN6gk/FjGDmzIifakwieAkvorpPzICZONp/X6Bi7DK7LrfezykrTZQpUtOVJtDuYb4jH7SmGkFCgMtkia5hQshixuUMFYJuPHQZIX8tG7dx9+q+H2FOY1OQ5vT2qsGMZCG1h7rrkYaINiAP92hgrU7aHrtUhMWvFhWtT9fMO2JQ+4FM7gStK1camV8bqIR1viIwIg5TZlUFDHBDQCyKVt7e3Z8kApFG4ONVJTLf08XpSTbbU313+C1cTTncR8Lt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39840400004)(366004)(396003)(6486002)(52116002)(186003)(36756003)(478600001)(2616005)(956004)(26005)(8936002)(316002)(83380400001)(2906002)(6512007)(16526019)(8676002)(6916009)(66556008)(66476007)(19627235002)(4326008)(66946007)(38100700002)(38350700002)(5660300002)(86362001)(1076003)(6666004)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?06jMMzL5AqnWgL2r8PlEu1v6PMn6E3iSnvpXd6M9IwPHC9d+P3L+7/DIXkDv?=
 =?us-ascii?Q?GG0oOa6KJ08QJ6K2c0LiJpbZR6/U1frcgPFnQ0CirdfJC86jKA3WBuwvZQaz?=
 =?us-ascii?Q?PYHPJPeMl5vtBxBPFOZYu++mrtPIkxiH79HY2NzVWzNmHXY2EQRPUgSM6Sd9?=
 =?us-ascii?Q?IV68cCjLUlQDEeR4vJogjwFbUcdENELfOR+G2EAjNAIspiror1Lva+XPn6Gd?=
 =?us-ascii?Q?uF5omQsldBeUFmWvX3KhiOh8GgS0cH5EwTZ3jNv/8zhCz/KR04ZB+rTnZS4A?=
 =?us-ascii?Q?gpxySk5LomsVIK9vZ/KsC6Q2gJVXY7lS2tn97kvvSMv7Z0OZlQUjNyIBDV2D?=
 =?us-ascii?Q?TFGyu44IUI/uhKzi8NqKsLMKvs7IqJoiA//g4pfUnOJKYyrCWLjQ1tAer2X2?=
 =?us-ascii?Q?9gW2PsM0fyf/uE7bBbqJdJxjKBMwemRfHjZIY6ArE3BE9JJU3nfc2vMNfgw/?=
 =?us-ascii?Q?hsmA/6cEQE72pB+WL0ozJWh8haKJnwHizKfksmfWfWL/Vef81DMgzfiIp8Hr?=
 =?us-ascii?Q?PM+iV2n9ceu4Wg6cl4Davc4u9prUO+/TKWcHhoG+JQK9XeNY/JdBcD7osMvU?=
 =?us-ascii?Q?KrMuPnATkN870d3KcVq58jJnk62j33SqeMqONfMYdrd+TjC+swP56BqePyOG?=
 =?us-ascii?Q?6Cg/CahnhPWfxBvUHMXkKmO5kNkohvFvOmJxu0UHmrZbbp3TYGY5rGhrkIfS?=
 =?us-ascii?Q?G9mrTE7mbs+aVFc9Kpq0ZBxqpkaLnYGXyD//CCZBOSiaavSpcG955FxByH43?=
 =?us-ascii?Q?a0pxUoc32cPp64S10bTq78wsWst4m2ok4lV56ZnyT28kVehLEhdfyfUyQc8/?=
 =?us-ascii?Q?PP6BykAIPkqE0Loy8+rl252wDAeOeMdVl0bIoNssoVk7CmEkCLPExHHcQ3Iz?=
 =?us-ascii?Q?UQwC0jlPY3BxnruCrOQvMRDyqwyvNN2eQwzanIzINVr9hBkfhUnnRoAHvxxW?=
 =?us-ascii?Q?jtTSJYkz/9nnWFoaBOYahusqrbUj0webG2wdHRCoPfNs/q2y+y0OV4f0loY8?=
 =?us-ascii?Q?iU0NUf7Sy9Egqrvzmgdy/XOZJgo+76nNsAogQcYAY0sWXk6tJENNhrFFV8XR?=
 =?us-ascii?Q?Fy5YlvS0n1HblepXCqkhf4jgaOO2+RQvpb7HTz/ZNIvDtGCNUHQE4WcNbT9q?=
 =?us-ascii?Q?fdp4fhKUq1s4f7NRLFvz3pc3PzCQ3NdABiB6Y8tHhA4G0mlL4miq84dS0hN0?=
 =?us-ascii?Q?RcVjFvPV+6Nu48AfvuQgkTbgK3iEj+RAFlvxTqbxzzC1nHZADGxsOoD55XkB?=
 =?us-ascii?Q?KT87+GcKuPohnPGpzbM9NM0tjy5FiAO40k+szISidJKy9N543PhaFNBFjSMT?=
 =?us-ascii?Q?hQrsaliBytVCDv7P0jPtPnfC?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 310d4ebd-759b-417b-bb0a-08d91ebf2381
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 14:20:53.4311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lMvV2V86oyNBQt+NIvY0dlQ0uhDxKUlMte0e47ggnyM0sPxyVgiyQK9FwVGjZXEuQte52U7AE88IUfZulNF8oWSIWd6SKLx4z6z0E+Xz8RI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4165
Received-SPF: pass client-ip=40.107.5.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>
---
 block/qcow2.h          |  1 +
 block/qcow2-refcount.c | 12 +++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index c0e1e83796..b8b1093b61 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -587,6 +587,7 @@ typedef enum QCow2MetadataOverlap {
 
 #define L1E_OFFSET_MASK 0x00fffffffffffe00ULL
 #define L2E_OFFSET_MASK 0x00fffffffffffe00ULL
+#define L2E_STD_RESERVED_MASK 0x3f000000000001feULL
 
 #define REFT_OFFSET_MASK 0xfffffffffffffe00ULL
 
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 062ec48a15..b8fd6337d5 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1682,8 +1682,18 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
         int csize;
         l2_entry = get_l2_entry(s, l2_table, i);
         uint64_t l2_bitmap = get_l2_bitmap(s, l2_table, i);
+        QCow2ClusterType type = qcow2_get_cluster_type(bs, l2_entry);
 
-        switch (qcow2_get_cluster_type(bs, l2_entry)) {
+        if (type != QCOW2_CLUSTER_COMPRESSED) {
+            /* Check reserved bits of Standard Cluster Descriptor */
+            if (l2_entry & L2E_STD_RESERVED_MASK) {
+                fprintf(stderr, "ERROR found l2 entry with reserved bits set: "
+                        "%" PRIx64 "\n", l2_entry);
+                res->corruptions++;
+            }
+        }
+
+        switch (type) {
         case QCOW2_CLUSTER_COMPRESSED:
             /* Compressed clusters don't have QCOW_OFLAG_COPIED */
             if (l2_entry & QCOW_OFLAG_COPIED) {
-- 
2.29.2


