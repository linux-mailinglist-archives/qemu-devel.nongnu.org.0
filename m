Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79EC398A54
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:23:09 +0200 (CEST)
Received: from localhost ([::1]:45062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQpw-0005gy-TQ
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfL-0000jy-Ce; Wed, 02 Jun 2021 09:12:11 -0400
Received: from mail-eopbgr130102.outbound.protection.outlook.com
 ([40.107.13.102]:43141 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfE-0003M9-V5; Wed, 02 Jun 2021 09:12:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ut8WVQqkRryxjm0C9raadkoRNxZossz9ZIDfdx213Kqx0Al083GvLbwTrmr+zC774+QZO2Al40GQ6BuiTDT/LWlh181eR1ubM6URL065YciCvh18lGbfaIsUrlJprxIRCkzKKTH0Jo5KY9snzyA2V9t947G4fROEq1js9ufLydORmj7LtUmLlqdIbx7K/7r+2D28IhfLkQ707erU/URwZTqd7YOQV5X9hKkBZHJ2QB7SGFrcIKOwX55Rt9iehTpsxvIlnL6DkRgyYYYxYxBBmkLo5meqq08aP//j7GH4vZyADV3Ex7HUtX0m8O0bP8phG9s8VVZjkoSFvi5Lxi+blw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Y9zwZ4FG3jmKMdQhuvSmetg9/t2U2WeUmbUBzVXQuA=;
 b=ADBXAei+gFHsFsLkJWU8t8jhv2EHt6IJzsn5vHtgON5R1NyjdYdMmFWIFJPTIs/XCysPQER6yNO+LK9dsMTlbsIdFFkWbiolsdgTxPZ4d5677GbJEX2Mn52W7IoLDAOhrGr4X5bExcYFYiR7rxRARs3B7/a7KpYgbPhdcvIPvaoAqUnoebBnh0UVY5ZEhs/0NzZYGWb2kT31jZ5yQKeGcIYm9w01et7cSmlUJvs0VY69NGCYY7IMYjywm7lOLDLYTBNhBEDyEf+wFPUhPpWxcvVDXQh0Gg9LsM573jpdJlROWFdo7sOIl1BxPU770JYnICxBTEwEGLn3mzg5iejHsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Y9zwZ4FG3jmKMdQhuvSmetg9/t2U2WeUmbUBzVXQuA=;
 b=VDT9kxfI2lJDd6OXIVRQoZSstzSH+av/SieL8GK6X+lWikFw5j+MUQ54CI2gHTyKSvSd6OEAiW/DL57EAB4S5NNVF5tA57xCjN7AGpga9AbPrJ+BbcDB3m3U9YVUTyDNe/VBcgaJminCZswsGAJ1SROmLPd7/NI9lCJY2e3ttb8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6693.eurprd08.prod.outlook.com (2603:10a6:20b:39c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Wed, 2 Jun
 2021 13:11:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:11:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 15/35] block/copy-before-write: bdrv_cbw_append(): replace
 child at last
Date: Wed,  2 Jun 2021 16:10:48 +0300
Message-Id: <20210602131108.74979-16-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210602131108.74979-1-vsementsov@virtuozzo.com>
References: <20210602131108.74979-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: HE1PR0501CA0011.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0501CA0011.eurprd05.prod.outlook.com (2603:10a6:3:1a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:11:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 709e445e-b308-4a9d-92dd-08d925c7f9cd
X-MS-TrafficTypeDiagnostic: AS8PR08MB6693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6693D11E9AC9C27A6B5809CEC13D9@AS8PR08MB6693.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fN+Qb1wWDkOfg06ZAWGY3eZK1PAasUVJzXEkR+wZnF9QUNoK691Mq2RGQv/9i90sqEyl/421XttSKGfWyBJZ/kI76p06zQrei1SiKQRtXHc7Rg7MCFrEu9AWrlNTU2DnRXNtzWCWHCeCtokzPKAB9bg4JwMYiLq/L+tIfReLqUdKvwJRAKO8CKrKSmksOOZ3B9ynDbrN/gSMz0Fup+0j2G2z+fZLtLR5XdRV+d80bkslQNpbYL1ZwNgswBL3rwO1EgHocMMMTUqVwsPW+/ebfIYCjFlepWCc3GyXhsviiyG7XM2B+3QrR5rKRORV2DHTuLjAArpKDBxRsy+Fss5Fd7cTsmvK8KRIwC1ir+OTItGtw9X+upsoNQUXkV93LmzCv+YyryarFCwK+cGhvaU71M5UYpz5qzA8NgEOytBAZUoPRzsG7TBAxhovkd8w15QChVxT+GgoFOStuDIrHUsgHPJtaNjaXJCocLnjmXIG+NVkme7oNcWtbBwYIdYIsEMClJ7O+Cqo4wE6bg849dgrLk4U1OpOuIklhyqL4I7oHbHo8ZnRs5Wo0Eghvspefr/30BGU9HB/WnAbhCT41jkbLSESrxxk7szA0jaa5udk04PIeAE3AbmcBMEzIa3Mjc2gCl5+yVAGRwWal3tcH3ZL4XeEGL+f19GoMkeOUNoXmHxEXzf8Nawyny78NtZB2+Yi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39840400004)(8936002)(5660300002)(83380400001)(38350700002)(38100700002)(36756003)(1076003)(6486002)(7416002)(4326008)(6512007)(16526019)(186003)(2616005)(956004)(316002)(6916009)(6506007)(66556008)(478600001)(66946007)(66476007)(2906002)(86362001)(52116002)(8676002)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0xeLw1stnN0KqjwHHQBSCrqabcK1mjwdyh520+DEKqV5gRDtZWVkodgHFKVt?=
 =?us-ascii?Q?FaQGpvaU4dvydeFCdJw97xv5eLAE6nvdfLqL8XJcGRrYhrGaqkQ4OVAhvWuB?=
 =?us-ascii?Q?P1D0hUgeJqVILN1hOwxIG/dxSAwQ0IzGH/QU+KAgJrir0K4bbtDCscYHubfM?=
 =?us-ascii?Q?q4ptI8GDF9ap26xAcvLRmoI9NrX+nsLXGP3b+v6ygbOXBjO7P3n1nq5gCEPT?=
 =?us-ascii?Q?QNkjBDuXLVcwB8/9IliVPu+1kfC+fH9Lf9HpSOen8vGsX84TB1AW4Ihc+DWs?=
 =?us-ascii?Q?vahI2E8fNwEXMoClsJkw/bu0Vlbnt3CFI2YLQqHzlR77TRbu/gVGgtjo48j2?=
 =?us-ascii?Q?31Ha/xDEhXqaEs2HjjBLJGe/eGtvMfMFtFnJtDtqPEgFXomoynCpWDjaFQzS?=
 =?us-ascii?Q?KXJ8lQjN7qvp5f5euDIVUf6hEsRBnRF+G14mGLqoNvyTC8UBwr2xiG7NZuAr?=
 =?us-ascii?Q?7W7MjurYFyMKLuUIh7jGZVB/gDFgPTeIVhOcUI6c5RhYm2QvaCgQYZQHrVES?=
 =?us-ascii?Q?1vrsL1HI/rjmVg8HoW31mDatrAJxMdJKHbk7oRihfzj66mH5jpmmKMi7eCQ3?=
 =?us-ascii?Q?JusnPqLYW3fzrFDiKfqP0VqWcZki0l4TDJfmRS+XX+gtGZ3/zrRt2i03Ns63?=
 =?us-ascii?Q?UT4i236m/Z0PaQAFvMLFe3MhDe+O3er44hQYf9ipMGapkfsJvup+xIC7Jf+j?=
 =?us-ascii?Q?qOThCQGLYmrCITYbrwHOTEK6cEGxG+wepE2xhXSdFzYagXqW29G2gQQ3R96K?=
 =?us-ascii?Q?6+6Yz3z6Izy36Q+wpiONkPRq+D3bica7eMmE1rsqdv8cme8aR1RAov5opqkR?=
 =?us-ascii?Q?DYO8hLqKoPpi95lEqjr+0Fw+pZydv1aebR1m4ewrfR9lmH8BY7IunDAA7soj?=
 =?us-ascii?Q?kU08o6xqlkjg1/t4A+QbewzjvEuIwOEvfs8EVVM2SMabQQvUCb8pQgQaUxCe?=
 =?us-ascii?Q?UDxd7d+G5H6yeG1R8xLZB3MBYuFQMmaEsvUvVYFzyAo+mFaDdEuqZHrSE0dg?=
 =?us-ascii?Q?iJIlQQ5fcqXldoFZKlWECVCia0YJ1iXswwTsed4BHWXQ8eHTjZpzlysWyGtj?=
 =?us-ascii?Q?1uqMBKisHXgEcDhtMyTfG3F5FrgTpl7tTxc25EaT0pnwj1a0AW3fOd1qI7H1?=
 =?us-ascii?Q?xK2gcH8FhFTU45nyT0ZR0WsPM5vPubfUPEBkSgZ+u7L2VKHBRn/h+HW3zzjC?=
 =?us-ascii?Q?9xBqlNy1zxCbL3os3x3JJZOdzp+2FkMT8FVr6A/hD0OQCP1aUKhNan6iPLhW?=
 =?us-ascii?Q?ndwvVRb6jRWG8MIuG8ZWFoTMTFVDILm7ubT8AzQJVvOJf2OVPtTHpSqGpeDd?=
 =?us-ascii?Q?SCeMJisG4r3VkgiyZjBe3Wcx?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 709e445e-b308-4a9d-92dd-08d925c7f9cd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:11:47.0429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nH5lT9Bar3hCUz1oX/N1QKQ8qOXM1bhcq9h7PzSaPp6rNxfS5qmRFGizH5SxpvU98FYIKYNopkLeV2Mf9LLMuX8HqskpkbAk7Wpvwp5EQdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6693
Received-SPF: pass client-ip=40.107.13.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Refactor the function to replace child at last. Thus we don't need to
revert it and code is simplified.

block-copy state initialization being done before replacing the child
doesn't need any drained section.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 7a6c15f141..adbbc64aa9 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -172,7 +172,6 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     int ret;
     BDRVCopyBeforeWriteState *state;
     BlockDriverState *top;
-    bool appended = false;
 
     assert(source->total_sectors == target->total_sectors);
 
@@ -196,8 +195,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                       BDRV_CHILD_DATA, errp);
     if (!state->target) {
         error_prepend(errp, "Cannot attach target child: ");
-        bdrv_unref(top);
-        return NULL;
+        goto fail;
     }
 
     bdrv_ref(source);
@@ -206,18 +204,8 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   errp);
     if (!top->file) {
         error_prepend(errp, "Cannot attach file child: ");
-        bdrv_unref(top);
-        return NULL;
-    }
-
-    bdrv_drained_begin(source);
-
-    ret = bdrv_replace_node(source, top, errp);
-    if (ret < 0) {
-        error_prepend(errp, "Cannot append copy-before-write filter: ");
         goto fail;
     }
-    appended = true;
 
     state->bcs = block_copy_state_new(top->file, state->target, false, compress,
                                       errp);
@@ -225,21 +213,22 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
         error_prepend(errp, "Cannot create block-copy-state: ");
         goto fail;
     }
-    *bcs = state->bcs;
 
+    bdrv_drained_begin(source);
+    ret = bdrv_replace_node(source, top, errp);
     bdrv_drained_end(source);
+    if (ret < 0) {
+        error_prepend(errp, "Cannot append copy-before-write filter: ");
+        goto fail;
+    }
+
+    *bcs = state->bcs;
 
     return top;
 
 fail:
-    if (appended) {
-        bdrv_cbw_drop(top);
-    } else {
-        bdrv_unref(top);
-    }
-
-    bdrv_drained_end(source);
-
+    block_copy_state_free(state->bcs);
+    bdrv_unref(top);
     return NULL;
 }
 
-- 
2.29.2


