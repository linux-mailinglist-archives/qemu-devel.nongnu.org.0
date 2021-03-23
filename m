Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044FD3460E4
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:03:16 +0100 (CET)
Received: from localhost ([::1]:40598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOhco-0004Jh-Q6
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOhOW-0007F5-1F; Tue, 23 Mar 2021 09:48:28 -0400
Received: from mail-eopbgr80108.outbound.protection.outlook.com
 ([40.107.8.108]:57092 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOhOT-0001wR-VZ; Tue, 23 Mar 2021 09:48:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UwKb7WjyXMNnwuyK+FjLdypjBXSethHwtpE92EPwxCEd42XrTbRi8NhlcVxvM+DPg7SA4ftE4yO9OGCUv2/YWCeI1ZnNyneCpRynu5lVkYSaR5r9CzXTqHNfa8gfR0/wnpACyS5WhX+0Pe4qLlG06hl8EGr5EJXQ7M5wbY0VBGb5BHHqgS6HqhpPF4JL2EvVlwL3gEXyb44nAJ7xyjKowiV2YFPSd+mqGfUKdelRNQF2z69LokKBUPGsFMjCQ2mxsRhq5IrKxuK5vkeRq8qarLMJ3BxeEdlSu6RejX2fnpggxzA9EdDzZ4lnUouHzygmDHYa7zVvbZd/Y5ENn72nrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8LQU1ypnAYg+A00+udoj7tUB7p/guL2En4vz9Z7lOg=;
 b=QQDVLELDPwA41dDa7df/hueQq+p1q5PzVbxOyStmx6XpzOTUVEfyqRb7DJxj5RSbbf4Wh3RBm+1HhNN8f8OeX5Yslw82Q6UPUcQq7tk2tSzmJtIfnLjudhcOT9OcxHR4WCd0Edw0EwpWimJZhLdLTPCs/t7OTCWEW/3P36KsGZvsYv38tHfwpFII54cD0p+gUb8BFO2l+354ZIc0OPOZm7IVHhn3gIIrLVeTQp5HfvuQ55/cMoeA/H+DO2Ud1z+cwfQTxtqC3SWe/26jPJDWfXr1P+JnAuBYkt8gg19c+nIr1giW68/Z36PBtSjbl/vr6PKHwzPewTvI066fJONuUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8LQU1ypnAYg+A00+udoj7tUB7p/guL2En4vz9Z7lOg=;
 b=eHFHXeboL4s7q7tYck7YDJIDVBJxJfBbN1HFvk7rqfQTbjgQI58wfTD9tX4WHMS7FaYOiJxWOXrqu51AjrRCYhHmXl/2o9dO/3MF5DAtUeSt80x9G8uZB0MqnDBeXho1H77q8yd2HhjtqnSnDAbRMZr2Fqx3DCQQpPCF1RsKmBA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2034.eurprd08.prod.outlook.com (2603:10a6:203:4b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.25; Tue, 23 Mar
 2021 13:48:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 13:48:06 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, vsementsov@virtuozzo.com,
 mreitz@redhat.com
Subject: [PATCH v3 7/9] simplebench/bench-backup: add --count and
 --no-initial-run
Date: Tue, 23 Mar 2021 16:47:32 +0300
Message-Id: <20210323134734.72930-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210323134734.72930-1-vsementsov@virtuozzo.com>
References: <20210323134734.72930-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR05CA0184.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR05CA0184.eurprd05.prod.outlook.com (2603:10a6:3:f8::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 13:48:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2cb9ce6-130a-42c5-61fb-08d8ee0249af
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2034:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB203436834954864FF0C68AF1C1649@AM5PR0801MB2034.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: al29mcwyqdRjMhC3pqU0+zBsawTKVfNQC8t13SajBY38lGcxiF6iAOnT/70wUsI+XRTaZF1H5vffRyFCfqHN9MO9+QgcGoje2qCfCu/p2yC8eee4O/8YSUmPU9ciZLNh2kxSnUJwQSdtJ9DeAQPKhVrISxw388xVQ6jHn1ACMGjU2cwQd63WKE1lV7VOCZZpBICqSaD/om57+j+VH311fIvVkS9GZEzZ0tCHwnOdSGuhe2hxT0AIBLQsPMvfA/6Z5sQm5epbMeY3cvH1x3Fjes9g5gEXwFFxBf3tfYoe4dHsWF0haKwVBlGEkxK+Apuk1IyeUUtEra4wxHf606Eah0CFGbJ3VKNG5WxQJJeOf0vlA3ElXQvkL+XPg1BRVl73ZPbuiJv68KEeoJMVQNtBPTzStQTh1MDCF31wKdbLpEf8tB5VWXWXNw7W4KbR/s1i+OmxIrtLSRtF90bwfLUXdVcqjM3/+PU1Nxmu9Vd3ajQxUzd5mjubr7CJtiIRy634Xp04kZGzK0TFVgfqE3g8hmJvYmEyFfn9kjXtkaPagfuP4sNzcJfiIcphw7DrUlz2MlUrVdbBwdH7OmTMNfhcNDcbXDI/lKLcEYikolAgb38yWpDBnWoF4JM1z/ijR6tiO8cAPcqiKtjJLMes30rbaulQP26xoU6cpJtKTwia2qpBwrBw8PRyFqj1nTrG6AFT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39830400003)(396003)(376002)(4326008)(186003)(1076003)(6506007)(52116002)(16526019)(66946007)(316002)(26005)(83380400001)(6512007)(6666004)(8936002)(2616005)(38100700001)(956004)(2906002)(8676002)(86362001)(66556008)(66476007)(36756003)(6916009)(69590400012)(6486002)(478600001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?yX7BqD1lQfI81mNffV/c1rozjN6sK9D9AoFfoFYrWTI5yXE9q+uexN62u++7?=
 =?us-ascii?Q?Ju5TfnTg9z1UvH6SCc5m1G6zzUlksl/FFN24uMfMBBkPjc5BFaQ348ihmWTs?=
 =?us-ascii?Q?u31+ZRJ1hUiFAl0REmXb9DFQ8WjDccpbIcpe5K/ARDidCgik5fd1b+pQ8iH5?=
 =?us-ascii?Q?NG2zyLlXGzGKbt/g7fmLCwwBpe239gknaimREFcmgftAPpVGPXG1vMbAKnJ0?=
 =?us-ascii?Q?YftfhQDO+Gmq8j26egQFnZJ2ALhKVwuaJvnXkJJS08SWef8uzIsu93vOijRw?=
 =?us-ascii?Q?3WsvgXYe4gJF0y/WORRmUGSTnefShfAventxf6CyudkvFongkOOaNz+UF4bV?=
 =?us-ascii?Q?MUsemNo3bhdGx1p8oO6yRGTZcStFXG4aAGRMpf2S/0N37nEe6uQCQce/NMTi?=
 =?us-ascii?Q?grg3GVtTE1eBO3iSuxTAH1THvynGEYbOkw09wx6LfVe8hlacPW8Dc/hVFTmD?=
 =?us-ascii?Q?61L4etkFe0k489lOYMQf96VAMnjX7CeCCSQX98CjQRLJuLuHtGw3hGx/F0ss?=
 =?us-ascii?Q?iVJEatv/OHPY/vmFqp2zzTfS9w7Hr5Y0bLo7C8dE/tYVtg4G11ZS1qVxrfbC?=
 =?us-ascii?Q?8AyfVii7roDqtCh5aBVfNM9v+JPFmiv/xgeN337Mbmzhn3+DCt6HCOtqxoY3?=
 =?us-ascii?Q?/o+rQSGxQ5Al722moapUT9V0uIvEVLLC4yOOxCLIZLfWKkuF6j04O2mBT/uq?=
 =?us-ascii?Q?/rRXKsL2eVEx/wfZ6SCShGHDZ6HZnfkZZopKu2JIQBQvmfSYog8NxjyGEChI?=
 =?us-ascii?Q?QOAM5IEWUfKggki+0gx6jsoDn1FN9Te4pFN5o9t1KucueUj1vvh5USdEC+1p?=
 =?us-ascii?Q?+awd1iKFhoy2PiVmbj7/vIuR0qTBhlCzx9Zg3hoetzi9jnFvmQc69gZql4i+?=
 =?us-ascii?Q?GXf3q4JYlu510G6xmgbFPeZCHBaHuy5d8aXbepoEl3DOhJIVpW8935UWwois?=
 =?us-ascii?Q?oJ2VupvMZkvprTyPasliQXlIPBRU9iw4vLEI3MwwP3qFWLPy+5Rs3e7EkEEY?=
 =?us-ascii?Q?WJVW1D5nxPDt404h4XEbpFY1YrXA8EO1s5iQWue1lBwGhhbifu7ygPczotzm?=
 =?us-ascii?Q?a7CYxJKY6qPi6EcL/wVN36atpxIAS5BeSQQ+Q1j+DjG7BhAj2GFu3IJXbO7E?=
 =?us-ascii?Q?bjbbTvkqYaFyI3JWgghSipkYrqpXMAVd2uOammU0ilE3zaq5hlphstRdkt/A?=
 =?us-ascii?Q?5Bcof0O4DLPwYCzAk+WBGxxfzEN1j9POHZ/vWijyWruzGAAEe9UPgCZayn8f?=
 =?us-ascii?Q?s6tSNA8kwgSNsnYbw3vTT/lTeDTqlES9mZhevcPMjvfut1aXekUuNGATd/lB?=
 =?us-ascii?Q?oNLddCZ4mH7vObs59LUhWS/D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2cb9ce6-130a-42c5-61fb-08d8ee0249af
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 13:48:06.7944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2vMN/yY7YLcEZyTsj6zDIjcZNWfPuaApUOMG52UTtA7/cX8XeGG/CGgOGhbkhfZDj5FyIOHN3OEDWWo4g35GuoqRgCTvUSbeIV8LLAlSfJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2034
Received-SPF: pass client-ip=40.107.8.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Add arguments to set number of test runs per table cell and to disable
initial run that is not counted in results.

It's convenient to set --count 1 --no-initial-run to fast run test
onece, and to set --count to some large enough number for good
precision of the results.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/simplebench/bench-backup.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/scripts/simplebench/bench-backup.py b/scripts/simplebench/bench-backup.py
index a2120fcbf0..092fed5816 100755
--- a/scripts/simplebench/bench-backup.py
+++ b/scripts/simplebench/bench-backup.py
@@ -155,7 +155,8 @@ def bench(args):
                 'qemu-binary': path
             })
 
-    result = simplebench.bench(bench_func, test_envs, test_cases, count=3)
+    result = simplebench.bench(bench_func, test_envs, test_cases,
+                               count=args.count, initial_run=args.initial_run)
     with open('results.json', 'w') as f:
         json.dump(result, f, indent=4)
     print(results_to_text(result))
@@ -211,4 +212,13 @@ def __call__(self, parser, namespace, values, option_string=None):
    both: generate two test cases for each src:dst pair''',
                    default='direct', choices=('direct', 'cached', 'both'))
 
+    p.add_argument('--count', type=int, default=3, help='''\
+Number of test runs per table cell''')
+
+    # BooleanOptionalAction helps to support --no-initial-run option
+    p.add_argument('--initial-run', action=argparse.BooleanOptionalAction,
+                   help='''\
+Do additional initial run per cell which doesn't count in result,
+default true''')
+
     bench(p.parse_args())
-- 
2.29.2


