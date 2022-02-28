Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFCA4C6BD5
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 13:08:08 +0100 (CET)
Received: from localhost ([::1]:53982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOeox-0003yp-RA
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 07:08:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNz-0002oY-1b; Mon, 28 Feb 2022 06:40:15 -0500
Received: from [2a01:111:f400:fe02::714] (port=28447
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNt-0002NC-54; Mon, 28 Feb 2022 06:40:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PdKhPll8VOeHFQaI65ZlK67BZwqKx4Kr1VFfChgpjDn/XEf9gzWCpLxygbdReJU0bqcPEeZlXJ2C73uStoSk/BRDt8LTYFwqS/kH/uDDyU5QJS9TwmLspWE9T7tmIIek3bpvA5hWzpbtJdUSmELT2MXv554mCXNTBVzA4hewWW5By7PZbVUEuGj1B7UCo4xyhBfVotvk+GdKPt89FJgWd0EDTZpSekSpZoLiXKrzL2dSihs+Ie6r9Ev+Sr4ERBfU9E6D62rGIuAjsMjRcsPkGcELzootbyKXoEcnm7uzVhCrCkDEkdwn3wxAIEn++KGkMtJiU3Amfp3VVTUJuSS1FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaYYTHt+J27XJ8iUeKAJ7iE9wB98iZR1jC6tKdNEJ4o=;
 b=LO+9JNcgQtIjIgW4fI3706xFg2yDEpSBewTb1KLa6cJ7OK5IlmwssdvH6+5HrPfS5DBm0+HFNUMI6NJ6bRhTO4IM51T8anSAc/zkN3bE3q6uB3kxUIbZmdSoYCVuGuUpkmam7m/ibCGPFhlaohM7Oo/CwAZ6UaRLtzOwJMbRXCHHBNmRPombBculH0JRCOcZVoNVNVmH0It6G//mCnzXQjNAevXWtyiYhtKMnX4DqqKkOv0VDIQ1oQ4AiZNJ4I+X18OKSnrsfVRHz0NCjtwNRXZ8luJ/KVFpHQWfI/7M1KCpY6bFB3pk4VsBc35zOnIkMphrqphOvRu4zKqN8BRiMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaYYTHt+J27XJ8iUeKAJ7iE9wB98iZR1jC6tKdNEJ4o=;
 b=CZylpEQRkklHfvgGAMAxE9ImiJopT27lv7Coj8T5bppApVHvl/ZF+/DWYDwDbsoCp1xUKag/PkSa0YHyajlY48e8WJV5Gv1AubTa5gKh5ekPmUtMsaon3BIkBLXop+71H7NeOGkFAHUO+8FJp2woU33yu8eJ9/+rwtV8TYTQA/g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0802MB2272.eurprd08.prod.outlook.com (2603:10a6:800:9d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Mon, 28 Feb
 2022 11:39:57 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 11:39:57 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v5 14/16] iotests.py: add qemu_io_pipe_and_status()
Date: Mon, 28 Feb 2022 12:39:25 +0100
Message-Id: <20220228113927.1852146-15-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
References: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0135.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0dd10f12-f451-4e4c-22d6-08d9faaf0b9d
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2272:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2272DEAE7AB02B9AE33DE6E0C1019@VI1PR0802MB2272.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2AVNxlshwkMmk6TnkdfYuNnfobI7NQcfeCOYixxIErHVuggxGdPStq1hnU7kZUqOkNWIxAaV8ozzlmZ6/s31rgTlrXYAAgo8MfHRp1nhkFYvd8H5jbIVbaX6OZ/s4ySgf00TmOhqydrcp2yUi9R7mLVW03MqydoEFJ/pP8iEAYSecxQdureASCiu1+YV+8NZ/7HUmtROLT++cSAibDbnEPW9zwiFiRXxupSLpNQkgNCNVEijemjV2U0DNw2FFqiB4DC/+6u1adVaXhqYMOXv/DRmtbzfUBio4VadUfjUHZ82uCelQTw0rO3+0IT75pS33nSLSPD4pj97PBoque96CxcCemyhzbDYiTr/k7b4Du3mMkco0xTgpTmQNu8pgCk1m28e1JM5L0+xMFyh2JJA6cAnqAK5VvdIP+7MJSUlyVAQsN8nAIUBxBf0AchabNfPwfwt4oTiMdmkfDeKAhP0lrP9TYubNYNkLF0g6Culr17esPlO77yeZNfcdV+wWVAw76Gh0m30YrHDMazTxESi9N3keuGyPe4TyiPjvDKCP0bhrY6Q8IqyUyG3NPzN1tyODAXJArbPzJI0n1yFaL0A8exfWczFqfspYtROfkOrib4JPFjtU+JzjP8dmzGS7qlTaGJVlaSSqaLtFtTwgFhAnV3zHpOUyuySG2XuXol6MG8a6FkdS4MJlw/f/8rEN+S9qgZImwRoiaOedBlm3J/I0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(8936002)(4744005)(4326008)(2906002)(66946007)(66556008)(66476007)(8676002)(86362001)(36756003)(38350700002)(38100700002)(316002)(1076003)(186003)(26005)(107886003)(6486002)(508600001)(6916009)(52116002)(6506007)(6512007)(6666004)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3fIYOJHNVGm8BA+L1Rukxe1sKIMqn/eqhm+umYORkcGAD0Zh81HFBRy+6GLo?=
 =?us-ascii?Q?p7Y1U2G5mlNiED0dk9obt29Di3VEnycwrLeIz8VuHoFbcOx823FUUZ5PYWgc?=
 =?us-ascii?Q?TMPYut3X6aQuGNO3waxourH1cP+vgHEOLxH2lU8cGDgoYrR0dl3xksDMa3c3?=
 =?us-ascii?Q?u9OISfz0lt/DUxm+jHniZn3NWPeB5bE/bCB+thiI6tQYNRDb33IUU+MeNK2c?=
 =?us-ascii?Q?rlDo07WAU6hUqy705bfbGdxk0j2rCG4nnr89ALmnHqvoiqhxgG9gh7s+FC/f?=
 =?us-ascii?Q?DKDzeWHAIjj4PKv8COW0Y6QZiC4qndLQ1fAxrgEFTQfi1Pfd5WM75X8/UlmL?=
 =?us-ascii?Q?IG4ItlehiV8NWEPmzF5/B8ClacAXGvBrFaiQtdMGN7SjPpKsZZC2UasQQu6Z?=
 =?us-ascii?Q?tY0vQOP4V6AGX43sAZTsotI3J8uxiK1tk1FeoIAGjSadBvyj5Cgh1ppWEdNw?=
 =?us-ascii?Q?wRwHiRVPhRisHynKOioMCCgJEKS1PNX/Ij9zm1mcfD3UxeUfAQWjMHRa7AjH?=
 =?us-ascii?Q?Rig20x8SBLeHB+4WF5QgROUALEDm2CLIPAB6wPUpAVoPC8Na9T/LqS6paFI+?=
 =?us-ascii?Q?VJGQ6BAsOkONllZPBaugqs+4iWmcKjsoOprF3GaYgFUwXLozs7jq7cJk2Oow?=
 =?us-ascii?Q?DPPc/VFP/H8uQhC184GQ2RprcwPwx6C9Cjj1rJ05tcg2hDjMAHkYieP9A1Zr?=
 =?us-ascii?Q?TkY3cYauvjzuabWYtjKsq4cfvhOXOyZ2K52f6JxIRC48IRsjeIAFd49svQWI?=
 =?us-ascii?Q?rN1kFlb5Leq+m5lDQ+v8PflpmoFVWOm45ugIGu0+9VqInXwixzitLK0ZI0iU?=
 =?us-ascii?Q?5j/HpiCgv5GKT7CY8LmYwb09J4yQgXaHPhk4YCnpRoA9p2JSmlGrjCYADcou?=
 =?us-ascii?Q?1xi3JWiqhmED17MV3UcHBfSYjansKgqJc8SVOwjwBgmGAoJBYyM0zvoWjE10?=
 =?us-ascii?Q?AD7YPwWx2IRGMvgJQ5wpd+ZDg7AtdpawaueIxUqJY8OqkEW96HDiwjho1Y0R?=
 =?us-ascii?Q?Zi8HXJU+W4jClCgjoWgbfUbB/rgbm6g25GzwVMLJdhkmOjvNECUDWyTGd5ey?=
 =?us-ascii?Q?+VJxAWflbaLYGodEKtB8oEeZXKVfnjHuZVQXuH5tJV0dYtr9cGtp6jIUn3m6?=
 =?us-ascii?Q?k6aNUZXJLHqNaooj6FJwqkJT78yoUH1LSJSEi01Y+CQtdFDRnyAOr9SQs5Ac?=
 =?us-ascii?Q?61UF/1uRRe2OgHjh7rJmNqAjKJUgz+Hu5wXWrt1cjLhRdgOvEX6B+LMcXmME?=
 =?us-ascii?Q?yqI8TAr3jN9pWQ0+Mpmrf+8ocp0fw6eef03j8QsvzypZRLJiSjV6vy9KAeMk?=
 =?us-ascii?Q?04NAPmzPoFdQSohA+J/goOXlEidDvi54a+XKnw59RXs0KBoz7C16HAjwlnRt?=
 =?us-ascii?Q?cxOXwt/hiipm5HGwCmLeta+DQJtqme76olt4f2XJRIVdoTjM1rARRdogUyIi?=
 =?us-ascii?Q?3QWY/Tx25sRYcjIk878Sl+V8VHUr+nYgjNuD4nJdfXtBPbr7zKn+B6rXSoyf?=
 =?us-ascii?Q?5CM9VGva+aWg95A7qoRanhr2V+9z4dqmuYIa0PqfqPFFLxtoFC41xxxENS9F?=
 =?us-ascii?Q?vlMpU/wmo3ysFHMjso6sxO2CPCxxk2W0kGHforV1/hOxgjaA+7XzsO9Rd5ci?=
 =?us-ascii?Q?ZkS6BbN1pLVCwf59yKnMVzLkSEg7669KZdQdQfHaVnnNwPo9qdTH1MezA2g9?=
 =?us-ascii?Q?+oNC/A=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd10f12-f451-4e4c-22d6-08d9faaf0b9d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 11:39:57.2266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RU77rXq7EhZfnIqA8b5KslWjSPvlatOT3ChmE/3OuvkoGsVdVwRVpKcoomfTMDlMTRFfo/h/22yQdUQxI1PcdVmeOhjo5zCIQLQe9CV9zw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2272
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe02::714
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe02::714;
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

Add helper that returns both status and output, to be used in the
following commit

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 6ba65eb1ff..bb071e5669 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -278,6 +278,9 @@ def qemu_io(*args):
     '''Run qemu-io and return the stdout data'''
     return qemu_tool_pipe_and_status('qemu-io', qemu_io_wrap_args(args))[0]
 
+def qemu_io_pipe_and_status(*args):
+    return qemu_tool_pipe_and_status('qemu-io', qemu_io_wrap_args(args))
+
 def qemu_io_log(*args):
     result = qemu_io(*args)
     log(result, filters=[filter_testfiles, filter_qemu_io])
-- 
2.31.1


