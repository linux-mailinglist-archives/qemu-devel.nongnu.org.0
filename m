Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 601F73ACF70
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 17:51:36 +0200 (CEST)
Received: from localhost ([::1]:50650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luGmN-0003py-BQ
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 11:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1luGk8-0000ys-UQ
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:49:16 -0400
Received: from mail-bn8nam11on2115.outbound.protection.outlook.com
 ([40.107.236.115]:23557 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1luGk1-0004iY-Jz
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:49:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VfKnDf6wdy4Gs5mckuixgSrZ69TOxqLOeyqF+VAAek6DvGs/8z/CGIfHDW5FhMcQYjRFlOrVGcuH2S6+PQPYjsKYDoL1yhRtUI3Tpx4g27W5xuvsJWN7XjEly2ggwL4ffbeN+cQB96l9DOV2SEwTvB6ImHVeuMG23ew8PUOG+TtjZ4sNKtSsfP3cqUfv56pDvQQevgnScNP9K1SdGtbvnHWnAFTrgZ6rewnL7L37ctwMq0mnTkUXMn+nv7Jdls40pMkbx2/vmE6+ix1ZN1M391NR0hCBSTg1B0rGsSTMXscFcEQVuOMjlJ4+Q4y62nmPxkOrzZs5sdWsFPwwHxZEkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNbeDS6tK2jnZI1G41uT0YwKt0aKWzQtEKgOWtzPhQQ=;
 b=YGTfDz7TfUKPHqSkKrAedIn0CAYnSmj9FqffPL2reYNWkpDb/F/+iSpEkkWyypHTbZSG5ALTjE2NEEpTEsvM/kdYBxrZNE43uj+3CBYE8+v+Juw25Z8ulqoBm/FcWQz+XDhTbN6mNOqdrPSft8GLgT+pWYvJ/jNkJpWBSw+UVtVqOjuWpmissZ5OEGAvUuvJaRsa7Lzj0xLPEPgifLRMuekN944bQfKgJ7ZZixX+Qi7v6dVRFs5HCyd0jgQX4kaWKTyJFy7RVYlrvPOdQAmmqDwDjbRtCDXeyZ7ympF1egNpLMoc2ThObPg4fe4a2UiWynil5YLGjm+2SrKkl7h3tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNbeDS6tK2jnZI1G41uT0YwKt0aKWzQtEKgOWtzPhQQ=;
 b=w/tjweKlsYeG4+45jKB6yNQ5qo6yPVVzr+Awo4TpVO8WaofwGkkJ8DuxD5HLdph4J40BR9ycxLsKmdLRcyVp6qKTqGtGjrHUCQp6W68oxPZvafm4OwiP5+fPTnrUqRKMT8YTSqXAKHuccbb6aTPZWK3mTPfEBoIVLJ71yCM5KfE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5769.namprd03.prod.outlook.com (2603:10b6:806:11b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Fri, 18 Jun
 2021 15:49:04 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 15:49:04 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] fuzz: adjust timeout to allow for longer inputs
Date: Fri, 18 Jun 2021 11:48:49 -0400
Message-Id: <20210618154852.5673-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210618154852.5673-1-alxndr@bu.edu>
References: <20210618154852.5673-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR20CA0006.namprd20.prod.outlook.com
 (2603:10b6:208:e8::19) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR20CA0006.namprd20.prod.outlook.com (2603:10b6:208:e8::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.15 via Frontend Transport; Fri, 18 Jun 2021 15:49:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59ba8693-d5a4-4dcf-51b5-08d9327099a9
X-MS-TrafficTypeDiagnostic: SA2PR03MB5769:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB5769FF63C03F4DD0E4D6DDF2BA0D9@SA2PR03MB5769.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ncE2ix+PwuoHPo095Q3TTy3Euo5OA9e83obx9kB6YU78WJReUFtsDCa/zy++NggDu1UHYhzhC1cNdxlwwMW54ddA26PNYpO7uIuIsUOx6C3msibY9lCUfcCrvybjksQGqRHBLKiwSEFz8tq9aZASrHUZGp9iiJOQOiAFhm1pbjOZNMpmI+ECacmxokdr5WtHfbyuUVcbnvcWfiZNKFnFM7GxcUC0WeS6F8Bl6BBjYY5xC+xnGDHe7jqTjZKNz7EGbDwXUtA0iyxI9z4UGqg26NBt9TeIDD++UAYHH0jOuKG7YZL+lFD7tTAqyFKqkRw/BVl47R6KA0RGkNuZXYOVaYJnl+qN8KsCKVzs916/6+Z+xl8TX7TJU7JtmH+1fuJgwOAhDE+GZT+FQOKUnII62iKjK/NMW4ZyYHxBRZ14zMvcLOWy4Iqvh/Vd5rKDepBDhYenjebNjstfD8pOiHjfQBiLo81zryHgzPLj2nldH7geB/xu7QpKg4c/RjHzmdVO+NCyshc5BAw73PG1WjHc/khAHsKjzIRDES4GAunWYoOivKaxzbeAAXUrlHYv40hLbCuua98JjWS8rB5TsbiNUsuH3KN0wwwjrDGaNlm7Y/rJ/40+e7rw9oq6yTBZsF+1ZubtR/3Udil2Phqi7VDS07WyzsyCI+hYXFnfH2RQAk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(478600001)(66946007)(54906003)(66476007)(8676002)(2906002)(786003)(5660300002)(26005)(6666004)(1076003)(8936002)(6512007)(316002)(4326008)(75432002)(186003)(956004)(38350700002)(38100700002)(16526019)(2616005)(66556008)(36756003)(83380400001)(6486002)(86362001)(6506007)(52116002)(6916009)(148743002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UGHUbouJdl0ajUdAmo+J57gy6nJpMTzDTSpgABFUdTuP+v1HcuQ3LaBrW75V?=
 =?us-ascii?Q?YRoOLcGtdnY/wkjzMpERm9Zm1TNl/vwCbuY0NEznIfKrUUVv224bEvvRQ+MP?=
 =?us-ascii?Q?Bhwf8/8dI0GRCt4oZFcfJWXLUV5w3/xat/91qqDz9+vW8Cjt/Yy2IEOT1V6u?=
 =?us-ascii?Q?ZrY2vt8iuewZvdo+BhotlivCAqnX2ljS2woxbwylbzAcJsFsjNMC0cg6JVh8?=
 =?us-ascii?Q?PZCEktb3IkzlStnUc+E1F3zsFsJWSuxi77RmCjIuvHyN0AuuA8DqRE+B7W0v?=
 =?us-ascii?Q?rCmJaBbJZy09A4knG/HMr9wHpWldubkL5QYUEISjt0pN361tiuujR9JaxS8w?=
 =?us-ascii?Q?f/t4cq4fb1+h0Pe+ov0p8lJ3hKWnIQeVqXE0AGhMgTSskXvRgWNNa4e9qXqC?=
 =?us-ascii?Q?F8GWUSqhcbuS7Sin8RmLEmxYS3TaefFKEFxWzgahMqJ8OBBaFoc1CjK7SLcB?=
 =?us-ascii?Q?lbQSU6U3kHRO8APP6RBXCcIr5nwkU2iGOQG2K+8WTpI+VnZ/yfV/flaghU8P?=
 =?us-ascii?Q?56SH3ZPVgqHYqErTWOBDk2rJCqKl11JKzvZ98GJRpK/WpDmkE5s1xr0yLDsw?=
 =?us-ascii?Q?Jn2h2onQJy5etujMiwZFbL/DQLS6DIYpzc+HNJJcWzJ5U8+C2EyudIFgf9xM?=
 =?us-ascii?Q?4L4FmYhCdV5sjUM+EugLBX9skqzwdMmsbvM9PBkgY3IqSLSRSnDyqZimV6/A?=
 =?us-ascii?Q?YzLXTVPF+2AE9PDa52KtV/IBvLM1MPd/4Ud5ZXF9T5W3Nex/3ZnTHWOdbVOG?=
 =?us-ascii?Q?5QtahLEChSMs5aT4leHdAmonEfDHJdvvFG7MymBEZIgqoMRBuLj/y+Sanb2r?=
 =?us-ascii?Q?Yfa5VQH+UfNM1uFBgDv6mTlAdE7kvAeoIBX3CuJPJqrzUqSGuuq7r05wW7f+?=
 =?us-ascii?Q?72nSzTm9wu7+/jm6HPOe9CKRBHuywx7Ockn5sVTyMKKhTI2o2zmjHVIe4jLI?=
 =?us-ascii?Q?rwOVWmRh4D1ZTZRD0+r9Jhn9KRlHSz9vc5VzUUIDEQT5G3NsCRQKbWYyuzRh?=
 =?us-ascii?Q?oZaiqRrn1G4Mg7ttpnA4Hj7ccrd4AuV/r+R9DXJWWIjtYjYFWMgoW1/IF7EP?=
 =?us-ascii?Q?9Ash8dgsJMffjgBq29PxRIo542jzCswU4AsVjcVZdaurEmjmGHqkqC7MXif3?=
 =?us-ascii?Q?ODhNlTsGVoiTl0lefIedFC1wtaO8d3EG0WREGjeHwSrk+wKctjgAvQKrd5cO?=
 =?us-ascii?Q?vqSUVobmgPrMYfb9kOfXX/Tz8+Zrl8Hf5teN3LoCVywKVu8WXX1xBfeSQM+7?=
 =?us-ascii?Q?R/BbL2rQIHrf0nlPk18S3FRCIYASGnsnAalLn/e9+XTHrnrwMp3evsF8RVLL?=
 =?us-ascii?Q?IbEhCof/EpY91SfKPBbgTRcJ?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 59ba8693-d5a4-4dcf-51b5-08d9327099a9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 15:49:04.7141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bqe753as33TRmqwt5AvW8H1/Wz3dqEkh3kjMENQIRa/lHPbV1B4Ijn8Kn0NUN/tx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5769
Received-SPF: pass client-ip=40.107.236.115; envelope-from=alxndr@bu.edu;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 f4bug@amsat.org, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using a custom timeout is useful to continue fuzzing complex devices,
even after we run into some slow code-path. However, simply adding a
fixed timeout to each input effectively caps the maximum input
length/number of operations at some artificial value. There are two
major problems with this:
1. Some code might only be reachable through long IO sequences.
2. Longer inputs can actually be _better_ for performance. While the
   raw number of fuzzer executions decreases with larger inputs, the
   number of MMIO/PIO/DMA operation/second actually increases, since
   were are speding proportionately less time fork()ing.

With this change, we keep the custom-timeout, but we renew it, prior to
each MMIO/PIO/DMA operation. Thus, we time-out only when a particaly
operation takes a long time.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index cea7d4058e..71d36e8f6f 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -661,15 +661,16 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
     uint8_t op;
 
     if (fork() == 0) {
+        struct sigaction sact;
+        struct itimerval timer;
         /*
          * Sometimes the fuzzer will find inputs that take quite a long time to
          * process. Often times, these inputs do not result in new coverage.
          * Even if these inputs might be interesting, they can slow down the
-         * fuzzer, overall. Set a timeout to avoid hurting performance, too much
+         * fuzzer, overall. Set a timeout for each command to avoid hurting
+         * performance, too much
          */
         if (timeout) {
-            struct sigaction sact;
-            struct itimerval timer;
 
             sigemptyset(&sact.sa_mask);
             sact.sa_flags   = SA_NODEFER;
@@ -679,13 +680,17 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
             memset(&timer, 0, sizeof(timer));
             timer.it_value.tv_sec = timeout / USEC_IN_SEC;
             timer.it_value.tv_usec = timeout % USEC_IN_SEC;
-            setitimer(ITIMER_VIRTUAL, &timer, NULL);
         }
 
         op_clear_dma_patterns(s, NULL, 0);
         pci_disabled = false;
 
         while (cmd && Size) {
+            /* Reset the timeout, each time we run a new command */
+            if (timeout) {
+                setitimer(ITIMER_VIRTUAL, &timer, NULL);
+            }
+
             /* Get the length until the next command or end of input */
             nextcmd = memmem(cmd, Size, SEPARATOR, strlen(SEPARATOR));
             cmd_len = nextcmd ? nextcmd - cmd : Size;
-- 
2.28.0


