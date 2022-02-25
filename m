Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D6A4C5254
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 00:58:56 +0100 (CET)
Received: from localhost ([::1]:51014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNkUA-0008JL-Qf
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 18:58:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNkFc-00071x-OP; Fri, 25 Feb 2022 18:43:52 -0500
Received: from [2a01:111:f400:fe02::720] (port=38968
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNkFb-0005i5-0Z; Fri, 25 Feb 2022 18:43:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GeVDOiYXWNJPVWyv0kmc25T96xI6m68jvDmUyT/ZOPyXdvA5zFWdWBLRf/5FYJ8aphNj9AzEaJF7U6TIGmDOyrBBlsRX9qjv3/j+QsRh6wUTxIWxqCD8oc/12Uty/2Xn1jrNSfryfB08T0fP4a1kuHF0dVSAF69E3fKyQcIl1KD9gKosWmveKM50YzdztAmsrBi/eM1Qo333p+bt6KScsLSQgzqKypg045TkrGyCEPxGWSj8Fjflewvy0OT/Oh689uzVkjG+7BIuaLu22E11eMgO7uVfvpLNWim9hVaHE3X+xYsHUgjbt47dA/813cEh7/owDWqGeg1scNIb45KWSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=21ZmCof0Lbwk7O6wTjo8ZW7QZb1nHddwvFBPwRRGPoA=;
 b=A9FCvdMI4uZF93Q9oIw1nNKfi+Pd1dDzR8KX3Gxeob6o7I4JdvG21FEBLXlTqPgeyD03IVMSYKBV1qwEfZjzbTxJ+TEmPwwbOHV6GImrX+hfWPoQML4sfjTUn3Fbm/IVLMfVKFVvaQjBOyMMSnz2wssnAxiS8ZAQHmB+eBQ5emWNPHQtUNXCE/jjQGHI29VopaotGoK2IdvIZFUOnC4fpV8j5a+X7DJwQn+I/BppaSViDuA2ylnaGXWKN6PjFIHMRheWa4PQfKJ5FAjJxYiB11Gcw+mr5fQzbKB7I1mUKNzjDYEHekoD/g0teeDH68TcIuifwDAc1Dde3xmlnUl9qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21ZmCof0Lbwk7O6wTjo8ZW7QZb1nHddwvFBPwRRGPoA=;
 b=CPLU61+EMQGQdhnKtv4HpNq+T7KSzybmmGC6jZdLgIsIkt7FbHebsnqjYVAZ6q7kge6uNVxMAGNj4v2Sd8Pxq5rU7LqbJzp1WjiKHowMiqdvpfhecPgx5NRZkDrOCZ5f3eZpWiQZ3P2hPvNbH2nmwR9MUJmZYGW+OWHeySZlOlU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB8PR08MB4172.eurprd08.prod.outlook.com (2603:10a6:10:af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Fri, 25 Feb
 2022 23:43:44 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Fri, 25 Feb 2022
 23:43:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, nshirokovskiy@virtuozzo.com,
 yur@virtuozzo.com, dim@virtuozzo.com, igor@virtuozzo.com,
 pkrempa@redhat.com, libvir-list@redhat.com, stefanha@redhat.com
Subject: [PATCH v3 08/11] iotests.py: qemu_img_create: use imgfmt by default
Date: Sat, 26 Feb 2022 00:43:05 +0100
Message-Id: <20220225234308.1754763-9-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4410047e-7462-4324-67ac-08d9f8b8a8a0
X-MS-TrafficTypeDiagnostic: DB8PR08MB4172:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB4172843B07F325270E408194C13E9@DB8PR08MB4172.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: amovOHKQQJfZyocOdYabNxcm8KdXXWBpNzDZOqFWXRjvv/2Uh3Q6r2rHoBkeY1wtzjc/3/srFKpGJm3pQ7dWh3b+mXP+CPJNYpUJP5+qbItc1H9HBdkmURXtoNXovDac1ogVFqX+4y/wuzEUnelLdiUd8S6igN0kSIDkBKV1pGm8GVHyWDm3fcCuIyhCYB41rx0DptrQghjcTS246byzKp4ij3cp1VfjdNO/EtMkuCU5kizfbM9aShnPbv98/Y+dWunirtZ20KvKIb6jSy4iId6UKJ/DaKPn5K4ahnc7h7mqIj7olAzTxzvwRQ7ibTHTx+zmNcvmekh5VnktSfLwM10Nmhnt1lKNF7w6eKjk3ZspkMXcPIxe5TVY86A9A0M47P4KwKGK+LvjEZd2o2E1OOzE3ba2UUxGmuPA0U7JQ3Lh8redK0rLzZdd7wWnxnlADgox7yRTJ3Y5zex3cojz7KeCyni5P2KcRuf5qcrLnxOVAgfQXJGLdmGt7Vtao4ODJsAPU/cTxmxTdcNmRvmT3be/0DKwG2ZPqsdtGufzHC2Lk0Ld8VlFZYyDfnq/JjvpAfyXj9BBpMYc2/z+Ran70+r1HHYnrgagTN/XPoLuuOh4UlEQnvqoTvYX3kdXpdFT3PbAAdjoU/4rDZyXK/zy7i91k6+tGbE/c3B/sXqtjqVbFLQd0j3bRcpt2q8l67+PH4Ty5JKZmhkgL+4r3r1UKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(4744005)(6506007)(8676002)(66556008)(5660300002)(83380400001)(6666004)(7416002)(8936002)(52116002)(508600001)(6486002)(6512007)(2616005)(26005)(316002)(36756003)(38350700002)(1076003)(38100700002)(2906002)(86362001)(4326008)(186003)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DWcCMvOXFlpUunOjnlVcobG66jhXUZcONHiW5y8mc/tNYLrxaGAY4gjKEcb/?=
 =?us-ascii?Q?FgKUOGM/OqkvcYpIlEKNbKCgsj1cJs/pSugxzhV22DZXvLqnOQyu4LSmRISk?=
 =?us-ascii?Q?sZy3FSduYp9ydzWZ9kdddIE8Mns2xn70F2T3m7dgGlCrJxl+tTvm94JtumSY?=
 =?us-ascii?Q?WdkajUfH2rjmtzTov8gId793Lr4mvysrr+aOQYxOUOwE5eNi2TqnIUVnHF1g?=
 =?us-ascii?Q?sLsiI4n91SDshmVixVexnDgRYjCW90/7elfRn/C6V5YybJPskMHwQBA+yOOq?=
 =?us-ascii?Q?avcEjxpvwvFOH7u2Tjw6hiGkkpUIiVh8slzpUbL3BvVnVvVUn9mC+s5owXgg?=
 =?us-ascii?Q?SSMUZXmvoaaUK6R6MaMxX3n2x2S3ZKVbWqK8GU61fgzluOHkJsKiiqasaQ1l?=
 =?us-ascii?Q?J2OwH4+o8KX4+F2CVuICndJTtXvFBIhQocg7Yf7ar7oOHPNfyiyyh2h1Vyl8?=
 =?us-ascii?Q?lgTx5ga1Ayx6D3IYlRwPsyB25YeF82kmmODORZLSQ+/N/NFeLp6cAWtIWKHF?=
 =?us-ascii?Q?Lg6dbYoIngGZPzh098jajLRUZXf1M3CLVua6EBKbE2EeolUG1t+pJ3BOyohX?=
 =?us-ascii?Q?8A+ky1NqVgmePCDgnbpsA1CGKUo+Z4FjGWBdH4Nsptpm7HftYvrlwRuZ6mx7?=
 =?us-ascii?Q?3wSFG/TBNIUMZhAeP/D99zLnFJib/T3DuYI9aJ13fJudvdSAbQAlf6QzESki?=
 =?us-ascii?Q?QqBcFaR0JEykJhoh+RRTWwBVL/inHmJa8j4liXRUyJ6UFhqij+VaXd3b+gS5?=
 =?us-ascii?Q?nQX2OyB/S4g0KnoeFFFi7yF5i0B/eLrA52uZl/jL4Af3tL1RumhlB13kIlbN?=
 =?us-ascii?Q?4xviH7gIjaI7Nb+E6jzf7JNOr1W3UNZr4Ml49bKuTHABIWKKD3tJQ7pNqTLX?=
 =?us-ascii?Q?h+biCLx6mI/x8J4gZVKdyP3s920W05NyEyo8uQNaCQJ22sXVuuh55b/wGL32?=
 =?us-ascii?Q?QTbEwb7RDqgFHWEzhFJ3/G1A4WFOZzRgOo66rKkiWsAd8giVCQQ75IefmVGl?=
 =?us-ascii?Q?93QbZbY5RxZigLI9eFoGN7BOVTs0WvsUJFY12rh+axQdbYXU/LU/kE/8Txc1?=
 =?us-ascii?Q?bblDPhyIoDt0pzhV6W7ZkJduIWvTBvXIFCDUJcectHqld+6cxLX3gb5Ms8kN?=
 =?us-ascii?Q?CpAx8g8l3MWCrSPEqHjPRNfD+7oZjTVg4SS9e/moKEwrwe+KCRoaujKr1/R6?=
 =?us-ascii?Q?uN0K8aHm7zQgjkJRpaZ5ZuZg617z7ANsvm9ZbFSavzxeHcyUXosVEjGjyFiF?=
 =?us-ascii?Q?7Ta8vZULVQnlJquJ9gTn+9kTUPsfBh99t0qxO03VvYqWe5jbjHBTLGOi0PJm?=
 =?us-ascii?Q?XLavAYYGhUNX3GYHNWsCIBN5eM6nDMrNoxCEWngM1vxku7vdPgId2V7ta+jP?=
 =?us-ascii?Q?EcWHOngR4hbJhZ3b+qm3uAhkMnSG51crfbuwLjqEAVexwa1ku597FqzqWvb6?=
 =?us-ascii?Q?L6KuuEixNyC6t/OpDl7TTlDHTb9YPRabu7xr2z5uE4kWwnC+RfvjUAq5Fr0k?=
 =?us-ascii?Q?ahXK9hDB6VcVoDE2G7j3M/d38cFsViesquZ7dXiz7Fd4xGbzyT6bjvni3861?=
 =?us-ascii?Q?Vn6s2+MJRoa//wfY5JuYIzBVv3Pm/h+uRaiivZu+Nnsisi7jWkEQw2b57Rzz?=
 =?us-ascii?Q?A4REp0PBQ4QNxJbPAN7JpEJQcRKGvPlhjoh+utdOMzaSjLJB+lHtpwMIsX+R?=
 =?us-ascii?Q?xxnQkA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4410047e-7462-4324-67ac-08d9f8b8a8a0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 23:43:44.0296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nvsPI/rp56J3dlr8uhUGsGBK5t5d1dhdzihMXUkhJzjtwREAi/Sd1Co4tdI1HzQZP3Cc4f2SquaroAfEqEXpQNCiM6rXJkvKpjMAIVqOywk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4172
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe02::720
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe02::720;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Less typing: let's use imgfmt by default if user doesn't specify
neither -f nor --image-opts.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 6ba65eb1ff..ca17a5c64c 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -233,6 +233,8 @@ def ordered_qmp(qmsg, conv_keys=True):
     return qmsg
 
 def qemu_img_create(*args):
+    if '-f' not in args and '--image-opts' not in args:
+        args = ['-f', imgfmt] + list(args)
     return qemu_img('create', *args)
 
 def qemu_img_measure(*args):
-- 
2.31.1


