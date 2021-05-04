Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F063727E5
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 11:13:32 +0200 (CEST)
Received: from localhost ([::1]:44366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldr7T-00031A-SC
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 05:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqw9-0000wq-Ke; Tue, 04 May 2021 05:01:52 -0400
Received: from mail-eopbgr130128.outbound.protection.outlook.com
 ([40.107.13.128]:35166 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqw2-0001xj-NT; Tue, 04 May 2021 05:01:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Buu7Vf5WPobp0tj3UGsOZwaaFPXTZSrOGMUqLQHm6GYb4MnxE6PCxSgP0dHgc5ZDApNJQiHvLSqdgWFmu6x6Sl5bdGl+0AhrMPQoQnTeNqDQhoUd/sANGntaHUwA70c54J5/CbTcQ4I9mNmNJIxFQEeZpM0FQIiOghBSxy3Bs30RFt5cqPJ0LQ2/xszOaPI796WW1zPbrdMICwxiSSNqeXpUd32NU349LAQmGRq6UFfS5j3qio4ft35HdMSCCjj7pHf+te3afBH/dS6bJvuvBsLk4ksxXIUW3sVxDSdGkIa+X7AxFz+ZhwP3s7s6LtD1JIN5PHSMexg79r9RCimcCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQ8qAb8Ee1KlC8mBjDEKJ+xaN3/BIEq9d6ubMefqYDc=;
 b=Hqm8fV9J8yQRM8XYNMCjnBXia8IcTVJBVBhmUhOezOWUXsRgqdKlFCDamfe8CMAClZXtJjUhc+bU7RU2ds51piGnGXPh/iEFhxj3VmkTOdRrKsSmrhm9I/5Q+sSRk1Hw5tkMYkNnAxDa48Uww5XMcifWVQNBQw9RXoTNYyWHRXPnAOLksxMPGFm5UAvCGuY3wOr1c9BRMBSibCvX5aMLhQGAbnfK5mK+AdtOPlFJe7KgFUX3XTINsapX6j+jEocZVPvGucP1kbvxz1f3fMalfwSyBEc0gj1nV51H1Lq36KruPynWG1j/GF2W1ApzNSSPuCH9kPDxKN2UqkWjCzACDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQ8qAb8Ee1KlC8mBjDEKJ+xaN3/BIEq9d6ubMefqYDc=;
 b=UdUMirhJVsaUbW78O8XSqXykOO5UWykoH7AgAyL/5J7QdZJyd7WerEaghEfwwbn1uSOkbqwDEADxdEtb/gdYfLiEUYh49h0eEtbK9XAnaV7oVQ0QAayRr0uNVz+xbb7AdqSFcRMvLTwq9W0OSW4crqsfT+/JBSrte7gxYAewdgs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5077.eurprd08.prod.outlook.com (2603:10a6:20b:e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Tue, 4 May
 2021 09:01:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 09:01:30 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, peter.maydell@linaro.org,
 John Snow <jsnow@redhat.com>
Subject: [PULL 2/9] simplebench: bench_one(): support count=1
Date: Tue,  4 May 2021 12:01:06 +0300
Message-Id: <20210504090113.21311-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210504090113.21311-1-vsementsov@virtuozzo.com>
References: <20210504090113.21311-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::34)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 09:01:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be9b5cd6-0647-4af7-3306-08d90edb3584
X-MS-TrafficTypeDiagnostic: AM6PR08MB5077:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5077C051A1E93D36C087F3B4C15A9@AM6PR08MB5077.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: thCCqxRSlATCjVEcWTXNCn/vl1ORZMT6QGeHHQcoYJZDZ6Yc27fGC1SAAZ6Bm4X0WwaX/ZGZzb8Zxm46nI73AXZX6Cl47qIcLUZ2YP6xDpEJNQ5xDNs4YHpgjxLg1AHKdp/nasvK2W7x5C+BKaLSLuxZFO/zVas8GnFyBzpme+x78h9dZMQtlw2HPcdACl/oqJoa41kuxypRxDWTFgOIivhUVGt/YLvfDtUiQGs8M0rh/EtaMp7I9iLgot0Ld4Cd9NBYYXzYdCLXknDeWRdZQPFAIp5Pbx7jEnk6u/LWBEz1q9J+OCBQBKcRmiiMV2qnN/G+gbENqt8VTMSY7ahT7EbWKUPTQnj2FrMIJy3vOSIc9UGAGj2ARcuyI8DmEOe0LjrbnxIEi77TJIFoJpc4ZCgZFjZsqF+Fu90liP/WT86ahizwWiAThLQm3DknzupdD4X3hj6MxR+2Q5xzfwvI9/VLcRmb4yPID/Th4FT+kA3lg8hXbAyi+mjOe0ZMahCB1geeHgB75wKtKGbyzmTuWnpNGnQURueJ8SzkDd+XJsrZsSpOdAMkYiHdYEy24TSkkK0zJ/Qwm7QRKMKdk5hoMGteiPhtBgInlpZ7mJ9gUsRUTPXd/Gjd6X6kO3gntGOjJ3KF0d9w2uA1ovZ4JTshyYeHp4kJY5za3TYtmR2LUZ2uGJgsFWuLiLgzWQHaoBO+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(346002)(39840400004)(136003)(956004)(52116002)(1076003)(38350700002)(16526019)(186003)(8676002)(38100700002)(86362001)(6916009)(6666004)(4326008)(2616005)(2906002)(6512007)(478600001)(4744005)(6506007)(316002)(66476007)(66946007)(66556008)(83380400001)(36756003)(8936002)(6486002)(26005)(5660300002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?BlowDJAguntAtQJfyO7ls4Eie26A/ZHKHUiCxWDpG5RFqEYaxzwf0QNmuUzH?=
 =?us-ascii?Q?73t6dRgJC+Sj1668neybI1JEARBfsYeOPdjWIT5OhTaPEA6wowtmjSX3vSwW?=
 =?us-ascii?Q?9bBkuujIcslrpzD9rb3s6W4l13nOlJmu+vVXFCiWm7ixqj5JWThMC4W/OswM?=
 =?us-ascii?Q?ofVClatjZ4cqSmJ04MZos8UCq4xvOLLmgVJODd29ys0iyYlEN4k0EagJljM1?=
 =?us-ascii?Q?66CppU9OAdMlkMEwo8XdBzfexwqdjN2+CrvRInXm13aGeDML0hmUH7KmjmN7?=
 =?us-ascii?Q?T3necgfX5+1caaLEc9xGWm5BSOHX4lkzWLLjUO3pIRwxp03UP/anRXtEXTwa?=
 =?us-ascii?Q?GMHEE5qea05DHiHCBAvHrxtl7NdbTAOtVeB1NXdhNSLP4ywuelvekEzLUH7x?=
 =?us-ascii?Q?zbgRlPtCNRI/RMIuSsJp8QREw4aOzxo0U+KWtxKss7q+ReVmALPRO0ZdM6/h?=
 =?us-ascii?Q?IIEsbq9ln670KrkcgLJ+rqVCNyZoeP331BUmCWUffS8wTA99NApFxeSgXHtn?=
 =?us-ascii?Q?aOuBQ6/djXHuxg55MROXJryyjkxnLZWniGjpuGKPz5zcrI7IRnHmYjuXBj2J?=
 =?us-ascii?Q?cyZRuXesm3ohyqZMIn+IcGYLGHx6jeQGocSkNmnLnQcWn/+FP1CicH1biD5O?=
 =?us-ascii?Q?jZjmEjL5mAo/0gVljH0Fh/qnyI3NbeEbbDr11XOAdEJwFLgxQR+haavwhr78?=
 =?us-ascii?Q?suaZcedQbTgQ1c7Qdft6BXmH8iYNYJKcfQ0h1vfQCWzVKaXOBXFCJK6VcIkq?=
 =?us-ascii?Q?7zDIKneJ1zaYZFB/FY7WYbjWDkyRn12Eed6hvjZIG4JaeJ5zg/Puk3013lvC?=
 =?us-ascii?Q?w/KynNKNKDwajp19DjSytoiqYasgSq7ngBiOnkaZNr0B1MVfz2+qIZrz5c2d?=
 =?us-ascii?Q?QZ+wgYUVDbN/DSwPDBIZXLExYcpz2kDI8QnZh/paR6JXxEu4gG9g4uQi+oMn?=
 =?us-ascii?Q?ResuSGAFMSxHoA8br+OwBrJBEIwWp72lnv+u7eDFJ0PzH4IWfV6CgUAR+oSd?=
 =?us-ascii?Q?bqC7r3y81LJGheC5BG/ZmmZGhA4CdVFgGQEkwLDe9zP0ZfO+L9/f9oVod1zx?=
 =?us-ascii?Q?n5HQa61ZxajghsMWk/PJVmkLRSbMvaR1PDdUPteBAnLxKM5xmGY3ci2+FQ4H?=
 =?us-ascii?Q?pEQgXVeqTDBTP8lJWjnnkPANhTZRqzCSezTDi/gykWXOMSlICisgkewvpIy+?=
 =?us-ascii?Q?u4OdQHaz50O+9L/FjHT4kHYhbTvUFY2VrbnXt2/tJ03beAokxeuTj/tyISr2?=
 =?us-ascii?Q?ggw6D6/CthEJStazAU46/tq+hi/u9VAuTFo9d7z6wZA7P62uzz8noq70AqWC?=
 =?us-ascii?Q?gEGQTdl53qpDtK9IsuAdK1RB?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be9b5cd6-0647-4af7-3306-08d90edb3584
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 09:01:30.9642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zuwQmDLRJSDywDGYr0YB2fOFskSoDeG5sqNfdJPZ6os5zyf2dnQJF+QaXeNm52dy0GtjZAaCan4IflCp9/x9bXkRemfEtzf6FAWP7R+xSbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5077
Received-SPF: pass client-ip=40.107.13.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

statistics.stdev raises if sequence length is less than two. Support
that case by hand.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 scripts/simplebench/simplebench.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/simplebench/simplebench.py b/scripts/simplebench/simplebench.py
index 0a3035732c..27bc4d4715 100644
--- a/scripts/simplebench/simplebench.py
+++ b/scripts/simplebench/simplebench.py
@@ -83,7 +83,10 @@ def bench_one(test_func, test_env, test_case, count=5, initial_run=True,
             dim = 'seconds'
         result['dimension'] = dim
         result['average'] = statistics.mean(r[dim] for r in succeeded)
-        result['stdev'] = statistics.stdev(r[dim] for r in succeeded)
+        if len(succeeded) == 1:
+            result['stdev'] = 0
+        else:
+            result['stdev'] = statistics.stdev(r[dim] for r in succeeded)
 
     if len(succeeded) < count:
         result['n-failed'] = count - len(succeeded)
-- 
2.29.2


