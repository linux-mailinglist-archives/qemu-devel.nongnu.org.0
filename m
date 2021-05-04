Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5966E37274F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 10:38:10 +0200 (CEST)
Received: from localhost ([::1]:45596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldqZF-00007c-DT
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 04:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqO8-00085m-OJ; Tue, 04 May 2021 04:26:40 -0400
Received: from mail-db8eur05on2118.outbound.protection.outlook.com
 ([40.107.20.118]:10464 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqO4-0007EP-4r; Tue, 04 May 2021 04:26:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JR7aMqAk4AHLA9daigTgLEDXqg91Qv5wmQw56AmkuL/AYQgoQQ5K9V+SLSas/CR3+T65tg16lK9JEWWO9Kl6n+vj65+pP/3wpbxo+sVoGelp8kOWsCr/jZCXKPg9OH7jZaJUHWa76mYMPIazGrFf69OAXUYgTNZQHUXTBVPlciGEhFU0H/OjJd7tts+t0Wb0I4l6FAM1dfmG9ihzg2K5vVVboxvorlzx166GA0SfVXDGaQsxtaAkYCbZbKhIpPYw9uEG0Bya/QFM73q7Vae7n4ZH0TyJbLuRB+otjg8QaeQ7psiSuRS+KxG77EUs46ro6LX6NGl/KMU0UD88CsWlbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RfHCf1akR3Q93h/GJZhvfAL/SN77snCpnEINBLHliLA=;
 b=PM+bwFzjGpQUZ83XEnX90A39pvrO8EDJe/PZ5KmVk54L3Mb4ibywmJvzu5g2WlsX7whof3bHdAwrCAhDU0B9puhTo9gXkdJ0UmBoZwTjrezZ9DJAW9phXK3n4HLPL8rm02UxwsQUZUg6bjl4bgwqm+SwZa7a4RFUpjfEYRU5XWMK7Duhw0Sh/2qy6c/Ry+8CAjHr1fotLBcIFhaCUbfSC4+pCcD3G9Bcpp/FgoBUIdqYKuUxSTnKlpd/24EWu8U47P2rfWdUhFQbuGeHZN33xRiUisSQN18z3xSRcHKbS4FXt/oZi2uGzKJMvK6LmQqdQBJh1el1Z9lpS9kiIA2v+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RfHCf1akR3Q93h/GJZhvfAL/SN77snCpnEINBLHliLA=;
 b=Pnsm5DSXL0k/kR+ODcFt8VcY4BmV2x8oP2Hb4RIPEF5TEEFWbzlt+w4shsv+Bz+NHxs4hCUcW7xI0QOfhMzYQ2A1B4sOTXadEIQsQV42HHFEZJ9oY/E/lSQ/RAMYcPD9vQF1HauZQ+mGk2HbyXgmmnxnVSK6sIGZHsd5ku24vzQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.44; Tue, 4 May
 2021 08:26:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 08:26:16 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eesposit@redhat.com, pbonzini@redhat.com
Subject: [PATCH v2 7/9] test-write-threshold: drop extra TestStruct structure
Date: Tue,  4 May 2021 11:25:51 +0300
Message-Id: <20210504082553.20377-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210504082553.20377-1-vsementsov@virtuozzo.com>
References: <20210504082553.20377-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 08:26:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be21d4bd-50df-4f6a-6069-08d90ed648de
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3381FE960EE820026394C064C15A9@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HZ4OmdRnm772XCSaUzUijbPcw2YvAyn28TUo/Vw0w4a0ZABfA3vMuW32/wERmdruCGE3f4aAFwazDvN4YIBm7R7eNudTYQugJYvya7s22q4tfWGkDeMQ6CMetf24G5caO6IUryjA/zRLPDgyRcr2dXBpTH6vHfYZW82dRcY2lD4o3GV9AFUR0rXBm+Ocs2rVw3iw+iQU/Ch+fPZRYdTblZXDbVjpIBHI69CYFZm7O0fmxAmhdFKRmcHGl7tQT06WziuyANyNPlD/38ADqDdZw/5lEeo/ylZ0hyy//gv+YzThTp2Ot0um9ELjjMoOhqMkf/KPxt5/5aNomnf8yq0pZ3Go2wkPvKTQ/cBDGIlPJ+yNUlI0TOaHLix/sV98roJRuu6q8MzT9zpsCUyh8XnNtKpVJDwmjaMZZIWiHWPx+t+c0w2qYOULU4mcdlLO+9o8jG/UQ9ju961IqiECtEY4HQsfwucoRnWIcbG0eCXcLdXl1WjjtQgawyu/TZLdX1zT8xAwAUcZHZjPydOYDhXoxcFscYeV7S6c2L7LdDwYg+q3VlyRjr73c+ngX6E/yCSizTbsehMuUGTsMmjzuj012QlRrJnBV6RPqOJ6CAbEukz0atpF1jn2zquGCmYKCqr7Fa09GBmUCb/Dh1WvN3/A7/7z1k9i9I0tDmTYnw9yfiKdRHHhRMltYzlNqbsZ2X/s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39830400003)(376002)(346002)(366004)(396003)(6666004)(83380400001)(38350700002)(38100700002)(5660300002)(8676002)(36756003)(16526019)(2616005)(186003)(956004)(1076003)(2906002)(316002)(4326008)(6506007)(478600001)(6486002)(26005)(8936002)(6916009)(6512007)(86362001)(66946007)(52116002)(66556008)(66476007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9i3CH++TMAkI9Gg6PMBQLamK2Ij3T4gi/3NKFcgGf4rOTtgFFBsuJGm2ChYB?=
 =?us-ascii?Q?qLSSuil42hxgP/j3JJjt5XR8GjlMkPKan943P4hSsGLU5EdSFpdg1zXyQ9pT?=
 =?us-ascii?Q?w2Cgk3TlHZsjIYhgCHdzST9Qs/UzBEar/E56L6kr2mTPgvpH8Im6HE2LvmQ6?=
 =?us-ascii?Q?//+VRs5pnNC8GEHbEnizCWeFAnOO0iBLbN6DndR6YyizrNVgPHYHoego6Ck5?=
 =?us-ascii?Q?MYPpIEU9GvvVmuSyzNS+CSa6qqlBfiQzPSZAj8LXV3jcR8zTbNEi2Xll4zzb?=
 =?us-ascii?Q?QxcJD3FE82KooGKn0LS00dpd+k0/8KreRcBqNCu+g8bZda+jecyL/Kwl9NS0?=
 =?us-ascii?Q?xqKT0FjjZF7lSYvGdOQ90Vo70AHTVju4wWObfLCUDw3nwkbZ9NY8aKfK6dP+?=
 =?us-ascii?Q?6lOc67jLwvdRClIir7SBwjLI9+gM9xKl6Ryrv5n8AlcjiXn9IFtxVLpTeDyR?=
 =?us-ascii?Q?100pAEoAOZ/TA9VgCW7BVj75t/+85KWj/ZbffNcOqNjaNuXxVNX7SeJns/JZ?=
 =?us-ascii?Q?8GXPc2NIKdKSJR8goLGPNzH/9JdgVRT7C2X891r7glg3gSkBZq12pLfHIgJj?=
 =?us-ascii?Q?S6Zn9ULrAdZ2PfoGoHiGQQIcmlJlTi/BMMPCsKkjbVATX2OzQmJvsZ8ZBAp3?=
 =?us-ascii?Q?W2r5oCJ3rnFKy4lBRbGqTkQxGTbHMeu0b+cHOY5jL1WKflBfwWeGVcj2monH?=
 =?us-ascii?Q?As+qDuqK9ZYPpETmDKiHsJKuymnyQIU6OAi3xRwtYGRs2nCAQmxeIsmaOO8b?=
 =?us-ascii?Q?cRXRUwTDVk7ldmr1/kR8953H4P+FMdYTMYdCYqFOz+BExxq/CdRiQbv8a/4j?=
 =?us-ascii?Q?c74sCEP9zxxLNxqi8wWECcIF7H6KnqQE114oTohmV+BZfQdjd/QlIGhkAcdp?=
 =?us-ascii?Q?BdiQnWzaE5yY/3/P5OsndY2Vwpd8SA6NiM74EgwIs1+Zi3DqYo0cGo0zAnmO?=
 =?us-ascii?Q?F3gh6z2lGZR3AgVUzoBtM9owDsHlHcQU9Pt6FJzuMami8vIepi0geFQW/xpc?=
 =?us-ascii?Q?IgL1hAv5ZPPlxVACitfSjscWo29lTJmNWCId4F4aL5XxUTwX7pJErawwOrdG?=
 =?us-ascii?Q?QCgpFXxlsM5KA6NHmpT/XGi9x6YLDLtWYkqP8AtdDgCF90oTtZRQuv4YbJuE?=
 =?us-ascii?Q?ieEdJjKX6OMioK3PLrQ2yu3D2ag1ePUYRBk+IiVp5m22dZGuXFp74CTTO96z?=
 =?us-ascii?Q?NwAnle2AkHF+7yNWFljn/j0+D+DrwDxHyA7SIsme/hd5daLuNhfHIOpdEr6u?=
 =?us-ascii?Q?/r1D1RFxEIU3bfX4jBOjPyJUZt+6vYTPVqyjuuR4Q5wDkDQn1kCT7n+8djXd?=
 =?us-ascii?Q?aGcEdooDN/TUo7hOUYG5srbU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be21d4bd-50df-4f6a-6069-08d90ed648de
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 08:26:15.9134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E2Twp8UldU9McEc5uL/wACRKrlgBrkuGtxAcdfEZfJxdhSYpubygpfQDdHQT0XeGWBYQOf04/sIzw62YbfUeu32nejLI2U0k1WT3CBFlGIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.20.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

We don't need this extra logic: it doesn't make code simpler.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/unit/test-write-threshold.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/tests/unit/test-write-threshold.c b/tests/unit/test-write-threshold.c
index 9e9986aefc..49b1ef7a20 100644
--- a/tests/unit/test-write-threshold.c
+++ b/tests/unit/test-write-threshold.c
@@ -37,26 +37,12 @@ static void test_threshold_trigger(void)
     g_assert_cmpuint(bdrv_write_threshold_get(&bs), ==, 0);
 }
 
-typedef struct TestStruct {
-    const char *name;
-    void (*func)(void);
-} TestStruct;
-
 
 int main(int argc, char **argv)
 {
-    size_t i;
-    TestStruct tests[] = {
-        { "/write-threshold/not-trigger",
-          test_threshold_not_trigger },
-        { "/write-threshold/trigger",
-          test_threshold_trigger },
-        { NULL, NULL }
-    };
-
     g_test_init(&argc, &argv, NULL);
-    for (i = 0; tests[i].name != NULL; i++) {
-        g_test_add_func(tests[i].name, tests[i].func);
-    }
+    g_test_add_func("/write-threshold/not-trigger", test_threshold_not_trigger);
+    g_test_add_func("/write-threshold/trigger", test_threshold_trigger);
+
     return g_test_run();
 }
-- 
2.29.2


