Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 506C44C5245
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 00:50:35 +0100 (CET)
Received: from localhost ([::1]:36716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNkM6-0006uG-Dt
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 18:50:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNkFR-0006gP-RO; Fri, 25 Feb 2022 18:43:41 -0500
Received: from [2a01:111:f400:fe0e::72e] (port=3086
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNkFQ-0005gS-9E; Fri, 25 Feb 2022 18:43:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+HBAoh+T9tyn39MP6G3JtC6vOwok2GCXU7Zeps5n+e8p99ziLgGbLrnmEZYNbeQbGTsHUv4MG+q9i5/h7UAp03rmslo3A5LYMUHZQug4ED8bugTqF3xGtxkWw7bK9vdGZqpf6+QtclWrBuC08IqLbZytm3zNFdULAO3UVb+Yp1a2DKqhj0CtHe2BUi17lURiDDNBcU6tQOI0HvtAB3v3fvXhUE4/zmik1k9TkMaOifOa37Gj3v/clWcX9OVK9e6TfSZ9y5EMfRJ/cEDSpww4QA8joZ0wy8UrgoylNDsKFryOojF7jNHyPShgJhnMAOHjFWLqCgJxWJQ+jnt7HAnkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLB5Dv/1GYn5I+CAd03lR75J1viOHLrpmujXJiyH7dc=;
 b=cED2Ojc8vmjsJIPgKf5E1wxOHjXZUhQzQD7ZNwfoDzcUqWJKBVP3/XRlyFa+d2GElqmf3savemzZKO18nAaP9xxTU/i0qftmGGH9UFz9N7aXmVLFypRpE9sClHjWQkJvxL8t64XYnt3gJqCvtH7n6VkvlInI/7BGekLm1mnVcbHigRCNm4MiYkUvoS4MEY2IuahwGGH4e1lCNCx7hypJvdi7jNCALaK6gN2rrU9+OqI81EFnC5LXNxf6vyp4wGjRZHwctFj4CP7U90DVNssDLrJUvwe3JOHWkHIu6EF9HbndaoXQ7SzsD7XYiXmU4ct6NOb5vJp/1k3M5XlEXQFJNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLB5Dv/1GYn5I+CAd03lR75J1viOHLrpmujXJiyH7dc=;
 b=KuDb756m4oakU8SGsKD6FeBfAB+DJb7hkEasC/Gz7gUbOFFeyU/z1XRzsHhyBsH18vZ8xOUHOh2QmnQ9ZzRNrrUDiUyDWT7IlfKMHowPyBGAf3fNqOIXb2vcMpTn7Z6g1e1wGSfbZEdMqAjaXWU1VPC1q7ynSJBJc8R57FYZ/vc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB8PR08MB4172.eurprd08.prod.outlook.com (2603:10a6:10:af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Fri, 25 Feb
 2022 23:43:36 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Fri, 25 Feb 2022
 23:43:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, nshirokovskiy@virtuozzo.com,
 yur@virtuozzo.com, dim@virtuozzo.com, igor@virtuozzo.com,
 pkrempa@redhat.com, libvir-list@redhat.com, stefanha@redhat.com
Subject: [PATCH v3 02/11] block/export: add blk_by_export_id()
Date: Sat, 26 Feb 2022 00:42:59 +0100
Message-Id: <20220225234308.1754763-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220225234308.1754763-1-vsementsov@virtuozzo.com>
References: <20220225234308.1754763-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0006.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::18) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e52b55b-35da-4e66-68ff-08d9f8b8a3b7
X-MS-TrafficTypeDiagnostic: DB8PR08MB4172:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB4172EAD374B23B0AAE1720BAC13E9@DB8PR08MB4172.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vRLOrqaj9a3N7pkr5azKWHmH2UhOYo4oTQDK1dsjWYkJbei5ybY2IENYTl6hcVjl61kFFgpsNgtS1EsO/YOvI8HfeI0OK1iIcvvQv9cMWEsthKx/j1txaNMJRsqop07BoxIROT8V+ji+35JM+XaM4KNWTngnZ3hrtVWVfoX7HqELsGVX3GcFPV0BbWVIZVvkZ8d42A3zjsguhaHpSfer2vrO4jlRdFOs+Ttpfhj4vyPL6TdacFzcOkIDZXoKeGqFDBvmzsVeqIeZznwU3yObodE6JPfvD3qAf6x2jDmfEeG/Q/BibZS0DrpoHQdwRayKIzISZk708h3KgrYIUnj79PsieraRF9yiZuoI6zdU6KD5NSr9GemfylLdk4vhSXbBZlDPMhprVmGPwdtIu4l4+f19K+agzf7cCAfG9aWAw9KWy3wkWrwhct5iK3pVyfQFN6O650+oMYo4HRGXLsl12FFr1Y71x9HhmjpDPBp7v8jNH0/EnlZqfzuvBUtDHHIp3AgmoJI/sTNOc7YbzZoV3TnY/ClA7xPTETD8jwpRgr6syX0MhbnnwBErmUZmCrTxts9x0z3Ii1lQOmcWG0mK9XYV4KEL+f9yvYUPyJ6yKA10llnK78v7Xww0eRNrbmIXj1iIHtbZ+ZlPLs+UYe1fuWzNqxVU0ZzxIaw1FTvGq4eDaTrLL2J/G6Yx1Xnllz1JLbL9GtSWxtMcGUrNKGrdNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(6506007)(8676002)(66556008)(5660300002)(83380400001)(6666004)(7416002)(8936002)(52116002)(508600001)(6486002)(6512007)(2616005)(26005)(316002)(36756003)(38350700002)(1076003)(38100700002)(2906002)(86362001)(4326008)(186003)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kcCOybkBlnB8MTksgmPdZH4gDC80DEtZKNMmOquIWg1eerBv6p89PkPUEeHz?=
 =?us-ascii?Q?bV8FlT8+n1aTq0nbclU8Y0Qq3BI6wMkUqoSb2NpFwkgD9fF+MmsuWmJSjsKS?=
 =?us-ascii?Q?edSLAmZYDMjD2LZIb585ytg+z+VIayJihEntEuNAYolwCIQRS0vljfjPEP4z?=
 =?us-ascii?Q?rJlG3LjbRK5WdScxLtfaMwtPwxCGN1xtlOAOIbPT0/AivJfXbjdYYH18vfAD?=
 =?us-ascii?Q?5mqaTIVEMHWx+E/rzTdn9k/jwy94bfXpaKbJyGxPPpt5HNmCx1vS27Zl3gHI?=
 =?us-ascii?Q?Kv9eA6Jx5sSYQlb6XeXQ3HFuDwF4ePAVsKcl/VtEdDnycARmI1Wdr0wXPRgX?=
 =?us-ascii?Q?Voi+vC3YjK1mqMVVKzpHSiexGAup9oqrT9pydd9gibVVVLwNLt6e1GEU6e/J?=
 =?us-ascii?Q?WaUiA6ZszVa7ZuNQE7Mh3cLVOZtwmJTMUQvkPgq0p20ZJU+WwN/9Y2mAJxZT?=
 =?us-ascii?Q?RwNgJ8Y8AH1EJ36LnAfUUpN0KA5z6pT543D2JecisDXCeEZ9vl3R28vAJEjL?=
 =?us-ascii?Q?Vl7cE+c0Wq+I8Ec/aLSVyZL2ahqjatm88/tHW0DOClp+MkRHnFl9Ru5XZnJi?=
 =?us-ascii?Q?LKQL0zsPe0C3GCO8XShVt7EtJqJJksedIn0fktsfvGb9mxwFCB3IlcewVj3u?=
 =?us-ascii?Q?2XiYqc6T4VCtpp9m6raDFej/FR0hm3feo8y79sjqBp7EzHfv3HJ162A28rVz?=
 =?us-ascii?Q?dJrZjbCPGCO+DrizGfOr3e592QEsIknhgPOeKRX8gopOd9seyb9szvcpMz/M?=
 =?us-ascii?Q?kcOoLtJZSZFMVuQg0ISLnyIvXJu0JSddtYMqoXgc60cogKbzzkd0IzWCzb+S?=
 =?us-ascii?Q?S+R1N8VPWfAru5nXJMurwJL0QkU2qDJ+dbeHWl5iHFpD9Cph0L3AgrmSWHbk?=
 =?us-ascii?Q?q2lddEDbWLAG6Xh9TrnzGflMNUjEbBRhKaUrdwojECVCLc4RsoMhaWnBSYA4?=
 =?us-ascii?Q?9i5fC9WmCf8FCbIgxsAfXkPrlByzrvphrJE5otkfDSE+zrMa/SJnDPYE3uW7?=
 =?us-ascii?Q?f9aQvgI9DdjdLMVU/I8iB2SJd/hIutxZ1P/1dOtl2N5Ha3Ezdcq47wV9eLWh?=
 =?us-ascii?Q?VIkEFUz3fTo+PPO6gwvQ+VWFPD9+ad/uwUlhP76k3+16FHme9tkW/yCgMeAa?=
 =?us-ascii?Q?ugBNS+l9bLeRLVB2CW9U+xd2ACkNL9BQup1F/1PXw4EJAf9F1ZIp1Ky0SHEu?=
 =?us-ascii?Q?LmjbivPUlo5rXeNlYcPJcbeNFnoHUGakbi6462+kHRRxU6aeBdzww+wMVRPW?=
 =?us-ascii?Q?4MFpbJbTUs//Z+x4zGFFW0W36rstvDOB+wnHt45SxkaQcwLt73zefRwFTK3b?=
 =?us-ascii?Q?d4rAs14188OtTgbXA8aJj6ycKm7kO2G3bJnHyztxpukph0dCMuyi8nmrvjzg?=
 =?us-ascii?Q?+XjJDHuztbJ11uL+8cDjDeSuXnHyMjOlih7XbyLXm0nWn1bOz4fXSzaqkCNT?=
 =?us-ascii?Q?kkEn5nU7wJ6Ely94v0PRXIpdxDI0rwBrKrV7Fs4Zk2K3/ik+6RkcAuxH9QsQ?=
 =?us-ascii?Q?sS3BrGIh0cdcDdvRSxN0UGdmfHuWEJChCxIDm6hZXsd+GHzUcizt7R9sC8bI?=
 =?us-ascii?Q?bAmbJiSyK2N+mRLlKWv+0PsVvMxtQpjEWmQUjoyP6SgVuP0JzJFi0Qq4xJ9f?=
 =?us-ascii?Q?pYZEQu/U542Iz3XSp7M4U56EIH0JbSuY9Un30yzt/P8Yk+J0N6PtHPUPJLyy?=
 =?us-ascii?Q?4dH70ND2md/4JsML+dtsxMcGcbI=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e52b55b-35da-4e66-68ff-08d9f8b8a3b7
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 23:43:35.9168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HZ4SnmU+7uw0W5Jwt0jw1OheRSed6YACrbC63so5zWN+ZszsLBifNr9dVGFry7QPhB20saIGwe6Db/9GuYKHcotVNndPm/1GYS3AIcYemGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4172
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0e::72e
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0e::72e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
---
 include/sysemu/block-backend.h |  1 +
 block/export/export.c          | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 904d70f49c..250c7465a5 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -124,6 +124,7 @@ DeviceState *blk_get_attached_dev(BlockBackend *blk);
 char *blk_get_attached_dev_id(BlockBackend *blk);
 BlockBackend *blk_by_dev(void *dev);
 BlockBackend *blk_by_qdev_id(const char *id, Error **errp);
+BlockBackend *blk_by_export_id(const char *id, Error **errp);
 void blk_set_dev_ops(BlockBackend *blk, const BlockDevOps *ops, void *opaque);
 int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
                                int64_t bytes, QEMUIOVector *qiov,
diff --git a/block/export/export.c b/block/export/export.c
index 6d3b9964c8..613b5bc1d5 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -362,3 +362,21 @@ BlockExportInfoList *qmp_query_block_exports(Error **errp)
 
     return head;
 }
+
+BlockBackend *blk_by_export_id(const char *id, Error **errp)
+{
+    BlockExport *exp;
+
+    exp = blk_exp_find(id);
+    if (exp == NULL) {
+        error_setg(errp, "Export '%s' not found", id);
+        return NULL;
+    }
+
+    if (!exp->blk) {
+        error_setg(errp, "Export '%s' is empty", id);
+        return NULL;
+    }
+
+    return exp->blk;
+}
-- 
2.31.1


