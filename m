Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5638D310E36
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:56:03 +0100 (CET)
Received: from localhost ([::1]:45352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l84Oo-0008Vl-3Z
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:56:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l847J-0000IZ-QR; Fri, 05 Feb 2021 11:37:57 -0500
Received: from mail-eopbgr00136.outbound.protection.outlook.com
 ([40.107.0.136]:22969 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l847F-0002Zv-OH; Fri, 05 Feb 2021 11:37:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQvtVZphA5ENmrRQecmRdcd1hEfYdTDqqSZLcwKZwYF6R/aLoWXSyup9M4rMH79Y9OfDgulh5lN8gPSe4oJDS0FjaG9CTtu0CpqJfRmx7NfijFDnG7btSuDKMAFdXUOJ8AW88QIDv10pDD3YPij6hexAn28Qx/TFTQsiw9P8wUee6Jz0tij+Di0B9mmw1Q8kKkJ5KCGCyWUa1rDDIcedmdEzEzlyfjdK5ibVmK66Mf2zO9mlmDXY7LjLGA+VpTzQtV0+szPuUCe0aNG7sla6RIi8DuHZ3hkSawCRl4k2SyuFrTo0XSKLG3HAT+dm6Vg9PGoJY4FWiM1Tm6ZtPJA1qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJUdfBGyU7LevzV7n1dMsxlyDxdF3wsznHH7/FTMJLs=;
 b=C5KiqMXUw4pfovuy46lf4VNKfOQJVqDozhhVwQu1oIRzKGksYixJa1KYVzs8h2k/q46XyvGP63Pw9R7dntmeGL/zVcsLiWUkcm/PgWjULq1WdZ8mqrHrgFQjJvHl4CIFLfx36pCynJQMjR7S7NM9yXVWENn0xg/nMmoXXxyWvnTKmsymnUyTk/C3jotyJKi75pGVq6+sz33lya4lanXxCgWik3UqzaRblCCUYPAaT2XNIRu5ZBue0HNti7gfqbNOejDEfHEGysux6PlcfEkJ2kJOSr9wUlfWnZClruVeT9C93ugTKp+orAtS1FAzlHI5gb34UurpWOH5xz7W/6Q8QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJUdfBGyU7LevzV7n1dMsxlyDxdF3wsznHH7/FTMJLs=;
 b=bWMceSrDXp55DIEUxHiWoGnjShjvSNlN86BFlTYKzsaicr3mGR4FGk6Crh2e4a1Su9Bk2oSVQ6D4UISLmK+r8tAwF/pKvsw+2bYQuARqSMnH+2F2YBl/v170ncpHWaxYhioPD5/g/pL2Ev374eJHhIoKOZb1F/1P+1sTnW17/kQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4470.eurprd08.prod.outlook.com (2603:10a6:20b:b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Fri, 5 Feb
 2021 16:37:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 16:37:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, den@openvz.org
Subject: [PATCH v2 07/10] iotests.py: qemu_nbd_popen: remove pid file after use
Date: Fri,  5 Feb 2021 19:37:17 +0300
Message-Id: <20210205163720.887197-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210205163720.887197-1-vsementsov@virtuozzo.com>
References: <20210205163720.887197-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.213]
X-ClientProxiedBy: AM9P193CA0029.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.213) by
 AM9P193CA0029.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.21 via Frontend Transport; Fri, 5 Feb 2021 16:37:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b8a3c17-accc-4c8e-c386-08d8c9f45a94
X-MS-TrafficTypeDiagnostic: AM6PR08MB4470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4470D96BDBB74D770464B34BC1B29@AM6PR08MB4470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:111;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: acatd9j1JXIM19DQ+nSl3glFvYBGi9SBorLjEKARDZdP8btPwFnzeFPJIU5KOzHP/Wf3o4+oC65v9pLsUUFYmD2NElVKNqFHDSzzCiA7CGmWaIU6eVLacLyFfZtR08UTPNUN7uP/8x4BT9hMab2j53Tm2Q5GvCz9MfYpErYA33y9H3xWmX1EaavDMVaGXwnf3p1s7QnN1w5EmH0CXj1fImJv33Xdo9M7ZOclYjy9EfXCl4JmyM6Wjo4s85LzeuScw5EWoi/Yc2YCD2YiwlvRBeykNWB52qct08hAgStjl6tQSMzEWzgkGBGeE81mU24MB1oxkiRv/qFZZ23gVg8eduEDt2yKCe2rg3m47mNiy16FP4JS+e51vkoPQcpzkz60brHhQiJWbKrpw+iHjHsjWnGPYVWS5rUAgSQ7T3pfuFMB3KE5SzZXRgEPCKsvobbvOoixBdoiuBovL+Gwji4ggGHDqHVUMhi6ql9+bvq3GpNIZ/AS5utdk7NCAAjUi/BCfumDKAh4RYJlYgVhJKZInQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39840400004)(6916009)(4326008)(6506007)(478600001)(86362001)(66556008)(66476007)(8676002)(316002)(66946007)(107886003)(6486002)(83380400001)(36756003)(6512007)(956004)(2616005)(8936002)(26005)(5660300002)(52116002)(6666004)(186003)(2906002)(16526019)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?H6irgUYWyVZIMvESEz9YkVBZQDK+6ql10R9YdHnW/HlH7uOS/L2l7/fDnMWi?=
 =?us-ascii?Q?3wDQooSv0MCz4Zi1OKsQhDGubR/ROhMhsGEwhHjbV4E5q30SXxTSQsj/zjEM?=
 =?us-ascii?Q?a18Dmllnes16fpSlQBVFd1u7TY0lOt8aXbW49x0b3LedzDdWkvDOo/C76V37?=
 =?us-ascii?Q?LpTRQbByHVcEshOSkFV1gocrz9NjyzBAMkV5lGrzXgT2Rjb+HiFns2dTznMV?=
 =?us-ascii?Q?kQlCc1m1q5bG7+c0twXEqt8tTLsIcy4Fl+ZF8UC0r8vvE+0OpiPQ67LjWMaw?=
 =?us-ascii?Q?bT8NwCFix+4EGw/gnaP97tOsTuMkEHl5PM/ANFKWNh2utTvM7lEghQJO+Rxz?=
 =?us-ascii?Q?oopBtrDVe5eeQFWstzWSjdD3ku7adHfF63GVy2dj77lUDcjMSyCUPfYpI0uy?=
 =?us-ascii?Q?7CW5Bl0c3AXzX9Kbfgc0Z3br2nVw7cyvq+acsNf+9752KBMlTrpqa9D1BgaW?=
 =?us-ascii?Q?eznudTLP+A4X5Z/p6nWLxoXX+1xOZ5FB54d38+kG+5jyBg9oU9y0JxC56FqQ?=
 =?us-ascii?Q?wq21d8QePFT0M8laRm32gWFJ+Kv50Ngho9MNy6SxVNfmkBijVy46/iC5RCJD?=
 =?us-ascii?Q?PrIwN0EWlAsqxlOFmzQRDOr4Imwh68xh4PxHDV1yS+bkFFHk+N5VAko3f1kn?=
 =?us-ascii?Q?QhSuS2UK416eXZAac/pDl802hzBCzoADjNThzAUQTiEm7iZWdNeYP3ZTzwQ4?=
 =?us-ascii?Q?b6OsiOV0ROFpiPbBoxcCPzCFTYlCv40ooxhpjBsHZNErIvuhfUkG2GlWJbso?=
 =?us-ascii?Q?nY1opYTm0qnFX2V+m/zEOu/tZm1Ibsj7DCHIm/W+fvAvVqtKPn2PiDsXQUF4?=
 =?us-ascii?Q?ZtXEj6TyT+8B014LTYFja/UNV46dze3APLKpa7wv9R8/iDYzLMR0f3Z4ZGjh?=
 =?us-ascii?Q?DT2dQpSl9bsEoRTPBR3tnEARfZwW+G/cRhj3mu5oHTmomRuvg8piFHi23wmT?=
 =?us-ascii?Q?AhQqIEzwaZAtk78FUjjkt38Ha5qYgQPT4RmIeXqlnJXm60U3nIqu2tBLM3/l?=
 =?us-ascii?Q?6AyTVHjE5hAXEknghn10OzCnqKPdI7aIOPeF7JFray0lEwnIfW/6ok7U21hd?=
 =?us-ascii?Q?h8hoZd667vbH2Oq6qce2/AVHIVxhjUyCFZkxi49SYLVebOr4LduYoYjDCUZ3?=
 =?us-ascii?Q?073y9DeHAyBPq6MPuK9qdIs8vwBirIFAD+bvUUbhUJNIarMUcqbhtCMy6bxw?=
 =?us-ascii?Q?UPz1ynNB6jzcucjWJhbg6qCFD0D9nM72ERWYbMOtOjQiye80wg+Yel/GR0/m?=
 =?us-ascii?Q?GFtuUxu0lqnqhOo53Nu+kNFi1IWq6ews2xwTMfC+krmaQzxUG70TyKZW7QHR?=
 =?us-ascii?Q?IxKvmTQONRjusldH3UQhy0Nr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8a3c17-accc-4c8e-c386-08d8c9f45a94
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 16:37:40.3221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bd6+/MAUXEgS4mxuyzG9yjY1PYcAXlGEgeIra6kUTweaSTJz+I+ygk8WDF9+5BOTXbb9mRp1ei6k+C6JPiskq7KjMDD6yGgnWroAFs4SCbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4470
Received-SPF: pass client-ip=40.107.0.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

To not interfere with other qemu_nbd_popen() calls in same test.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/iotests.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 00be68eca3..4e758308f2 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -296,7 +296,9 @@ def qemu_nbd_list_log(*args: str) -> str:
 @contextmanager
 def qemu_nbd_popen(*args):
     '''Context manager running qemu-nbd within the context'''
-    pid_file = file_path("pid")
+    pid_file = file_path("qemu_nbd_popen-nbd-pid-file")
+
+    assert not os.path.exists(pid_file)
 
     cmd = list(qemu_nbd_args)
     cmd.extend(('--persistent', '--pid-file', pid_file))
@@ -314,6 +316,8 @@ def qemu_nbd_popen(*args):
             time.sleep(0.01)
         yield
     finally:
+        if os.path.exists(pid_file):
+            os.remove(pid_file)
         log('Kill NBD server')
         p.kill()
         p.wait()
-- 
2.29.2


