Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D894730A5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 16:34:41 +0100 (CET)
Received: from localhost ([::1]:36850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwnLb-0006YN-Iq
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 10:34:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mwnK0-0003mo-03; Mon, 13 Dec 2021 10:33:00 -0500
Received: from mail-eopbgr70120.outbound.protection.outlook.com
 ([40.107.7.120]:48667 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mwnJw-0000k5-0x; Mon, 13 Dec 2021 10:32:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=li0A4bIxjhLViIh/4LdPgJOyE4QEqclLwWbaAGk6XUpJ/I8GdDllWSrclmbCIFg8aIqtLFoUDekFq0+s5qsICJbNPv3tzFCrLLsQqbzQTgezlcFZ1rANDi1Fw5Job5Xs21WWKtl7ojfeDCRfxCA4Bo/sITwKTtdJfC4jy0QVjtIC31k38/CLQ0otqSweiIBqp3tqhdl0kL/Vg481u8QGLrsinx4yVCt3/YGLqPt184KAHjv8DJmgLwJKhrgOXpRE0CLpUGA0DLwWTeayb4bp+keaYwY5zZKggUAsEFwWiNNh8067gdH+bOR3MQvDzSjNTW4ur5O4yqMy907+CdaFkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxPPo46eTn5K9PmHFCg7qcVFcE1tVwI2AHLT5ZumT70=;
 b=kFcIL+ggvddPpjVH5yuDewt4Yqeuqe+DHI/ugGjmz917qaZiCjm1JOYRghM+U2WiFsZdXlUuIHbsALBH0DUjyDUrRVLoBm8qpDtCgk7kuu4ot86VVUVBnQzN3X46aUF+HXc3YvY/cA994WdWjvSGECPMt8dGfTq3Fl7A0KcuBR9z2z+Lvgbr+MCFZ/pRU0nEAAnJ36h4ogdNvBogUvyQoCbL28WTCYk79S4/P3yRhwWPzv10Lunv0pcqGuQ5AhYVe2hEA4N7P7hfRIyeW+TH0PDuyz2cFm0MGkiOkm3PcY8agVkgsFIoMMV3WPbSBe4xkOagDfDoLt+5bkScv3GIIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxPPo46eTn5K9PmHFCg7qcVFcE1tVwI2AHLT5ZumT70=;
 b=R2rnkyEIqd+gf0+lqWx41WrIIQbjrGdccnQQVMI5rz/55xX6RF8AAnn7ZKgppExrdtNi3KSnZho2JU+TmuGTgBkc5eFgKSAOtkwuyyylOPm+Cj4htK3SYbQizXRO76+u+n/V/mH5Uk6BXIWmBzwqJc/ZZGrNPhS5X/Xt6RaHjvs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB6741.eurprd08.prod.outlook.com (2603:10a6:20b:353::8)
 by AM6PR08MB5094.eurprd08.prod.outlook.com (2603:10a6:20b:e4::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Mon, 13 Dec
 2021 15:32:52 +0000
Received: from AS8PR08MB6741.eurprd08.prod.outlook.com
 ([fe80::c80b:8f00:60b2:81c5]) by AS8PR08MB6741.eurprd08.prod.outlook.com
 ([fe80::c80b:8f00:60b2:81c5%4]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 15:32:52 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH v4 4/7] iotests.py: add qemu_tool_popen()
Date: Mon, 13 Dec 2021 16:32:37 +0100
Message-Id: <20211213153240.480103-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211213153240.480103-1-vsementsov@virtuozzo.com>
References: <20211213153240.480103-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0402CA0023.eurprd04.prod.outlook.com
 (2603:10a6:203:90::33) To AS8PR08MB6741.eurprd08.prod.outlook.com
 (2603:10a6:20b:353::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c90e9b0d-19e9-433c-fa85-08d9be4dd3ac
X-MS-TrafficTypeDiagnostic: AM6PR08MB5094:EE_
X-Microsoft-Antispam-PRVS: <AM6PR08MB5094E9C4B2D26E1B86E3B30DC1749@AM6PR08MB5094.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9/yaINvJzUB8+2V/ii5SndGGpu77tLCCgiFHxZcZ1PNHfWVAmeoNjq5F8DMTNuYA+2Jx3YKp4cu6URgRRjIHiYAEsroqD+UIIgBni8/SVaokn2dLCX0uLxyPEIzuAKbZvSC8vvJdCc+fSn/a3Uwzs1vT9Px7Nrndb2Tq57i0wWevPcWrnJzTazfJHXDo6WQzi0dU+DFhE/pehzabuixw3ijImsfwmsYXfot3N5IPv3n3sAFAmO2LiUZaO1TNpLQIMLeb3yv4/BdwgwXMUW7yhHvrOrJbgrhj/d/543zop8oVac2gkcGlgQTOdo96CkGsewJH+Vs8KTtPjZtXmdl5DMz0pyVTr/kFU95o3WPHDhQern4HhvmagdOnp+TotcxYFK2Z2aegWNmSWbTu+7e4VA6jO+ZojqR5NedTyTcLi5l3HSofqt/6bH3GyjNU3FMr/60ebCIx/sZQtpAm75CAO8M4gbYnx2R2IM4Kvg+h7bwKzQ7gfaksaCsfsRYtlAsdvT08c9e1K5O4V6TLAKNFfHkalXIRZ53aN+bZkOphPKFL4CZcwUgR8CdZRB82D682cJcuFL83CVh0MgnUL6jLt5kLw2u7UieCCbVn+39XnkYspMeIn/zpmwOfiFv7f87jqas/7OJC+t6ETj95sfEdx1lyeW3IEbsst07dJ6o3UmDp2JC8fWDZyqGG504ZnWIm7jRIV5SqfMqV1+mhyowAKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6741.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(38100700002)(8676002)(6666004)(2906002)(6916009)(8936002)(6512007)(36756003)(5660300002)(38350700002)(52116002)(83380400001)(26005)(1076003)(508600001)(316002)(2616005)(66476007)(66946007)(86362001)(6506007)(66556008)(4326008)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6aUW23vBBCtFi9l4acqOyhIj5lC2HuP+rnoRHyCxlzRYtjhNEsQLOG4GbBAR?=
 =?us-ascii?Q?Y30F7z1Tn3BDr4b1otmJfIA6U9eh5WviuhbKQJVGh/fg+SCWyoOkfE4K+rBV?=
 =?us-ascii?Q?MGJNxV5U94hmzIsSGjqfsWfwLEUU9k9pizFc0NBycBDBp2QxYhYr6dlHOcgV?=
 =?us-ascii?Q?YOwf12240TE6IsoWtREs6oi3Css56tLQLYaMICyQaLsc8gO7ndY7KczB8IJN?=
 =?us-ascii?Q?VaTAbqlfpsGQ4DrwOvtu0MCSI59aG5IU6wUxLKaD6grdVevkvWrOGtM6uuWW?=
 =?us-ascii?Q?GcakLK6m9sPNN2zdBdkn4sLp4Wm2hm2SVSkhJbqWXbQG+bNmtleOxDsFRhR0?=
 =?us-ascii?Q?qtMcQ4uz7goJVrghJlja3a6KO66ETRp4hPmvGkjd3/iyb/4Yguk0T2AH0zkV?=
 =?us-ascii?Q?5WogZAujFvcyuDUtFcegOZ65fMpexqV+eVp0lGfCCqfUCRzAoaswZILCTM5W?=
 =?us-ascii?Q?OMLEKCxdjoOfdwgvelD+y+tUYzlIP7THRbdBP3MOiLigGolXSgenz5gQJE7j?=
 =?us-ascii?Q?2kIH1tjT0W4QSQ+Mu+rDtwp+/6hJbuUDVJ1qoiz3AvgX3PqAAT70h9Fq6piM?=
 =?us-ascii?Q?GBurwKcEHEsK+vQ/Zjkut5vdp7w9aAbYZ8hHbr72lJjvM6iOlwZHzaA7hWsR?=
 =?us-ascii?Q?8rbL9LCm5LcH+NiLUOn3qst8M/urkjl+KBLWS1H0T4+IWscJU6Q5yT9z2MDV?=
 =?us-ascii?Q?xeF1CDXpn4N8titpVd8uFxAFa9ARYFMP8ODdTSbkUXHwlY44PZ+dnBAOo4TG?=
 =?us-ascii?Q?A4ezq88zdrdiKf4l3bwDpdQSNf/gNJDannGM48DkfFBhDuBLCIySxllk92vM?=
 =?us-ascii?Q?a7rZm+TbzjEZEbcp6FN9UxdMn4Q71fbeOQcTXG9zNfe0aTVOqTesox0Yg0+t?=
 =?us-ascii?Q?TNXlgXxpfmoJH9k3/seJLybC4sSagCIcoV4VrnIPLNAdEohB0RrrzhK84/Cu?=
 =?us-ascii?Q?9DKuz99THLxc+WEmNONXViLPhvQTG2PW1QBNxn46GOy9GysFGc+S1vWPRMEA?=
 =?us-ascii?Q?eX+2bMlpDa2yMa/0sSk+S0+KjKNfrjRgo5PNdcbAbNPnfCcwXHCDvp59lmI5?=
 =?us-ascii?Q?6c/IavUiY/8sAALtWi4RvNoLgXnsc+QlYLwVItsWQew0PrD9vQr8fQ+M6cr2?=
 =?us-ascii?Q?mqqkWlClCC2w9l37gJ0wA4f4lzc4RZ143YMrZFWnwAiA0FZCbcwVaKonYV78?=
 =?us-ascii?Q?2gKBQ+haSjft3M+IegkrPz6ZDOUX8m0RSp2epGn9LXtFHPm7Jz/M7Pg4ZY+J?=
 =?us-ascii?Q?e5G7d6ZMIj/mvt6z8QdqfB2mDSQjP+TTXnUd9eWt2U7lWlqayklcLGSL7uOK?=
 =?us-ascii?Q?VHsvfoY7zZ+bkRtdddYt3sy39+lV01Co32KyOCDbG2T9e9tOLPVa7R2yfz1a?=
 =?us-ascii?Q?bEVm7dyBIcYW96sbFXDIRABsfByxDmTgmMT2qOQmloHjUhNWZ9sJz7QWHJHF?=
 =?us-ascii?Q?lMgD0FpPnbIzEpWmNTmsfTGREaT8hlan11Hf1viHNQQ3gEZnTem64O7Dgm4P?=
 =?us-ascii?Q?IvqcJXLug8EtojCE7QvCWhI5WZNCT5OYJno1DSkErSdssMhzFWzICLTPYMvY?=
 =?us-ascii?Q?RzqXGSoPfA0ras878zsyyGvVSlRos7uThuZCZnTY+2o4bmPALppcVwUWGr1E?=
 =?us-ascii?Q?FA7GMln8UNni8/WYa8EBsiOaYjyH1rrFF5v59B9VmbB/pgxY3hb9EivtpzVr?=
 =?us-ascii?Q?M1hMuoerbAkdbtaFG5S790iLZb8=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c90e9b0d-19e9-433c-fa85-08d9be4dd3ac
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6741.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 15:32:52.4416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7YN9kPC8SL2Byrgl6lFGPW/0zd+IL3/SqDLpDrjh56sr03hXgNlNDIU4t8CqtFC7cZ3aTx7GKpZ9bsjwIGflVppHzEkUHV1Ze8nmXmfOYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5094
Received-SPF: pass client-ip=40.107.7.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Split qemu_tool_popen() from qemu_tool_pipe_and_status() to be used
separately.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 83bfedb902..7f9a8bf012 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -138,14 +138,21 @@ def unarchive_sample_image(sample, fname):
         shutil.copyfileobj(f_in, f_out)
 
 
+def qemu_tool_popen(args: Sequence[str],
+                    connect_stderr: bool = True) -> subprocess.Popen:
+    stderr = subprocess.STDOUT if connect_stderr else None
+    return subprocess.Popen(args,
+                            stdout=subprocess.PIPE,
+                            stderr=stderr,
+                            universal_newlines=True)
+
+
 def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
                               connect_stderr: bool = True) -> Tuple[str, int]:
     """
     Run a tool and return both its output and its exit code
     """
-    stderr = subprocess.STDOUT if connect_stderr else None
-    with subprocess.Popen(args, stdout=subprocess.PIPE,
-                          stderr=stderr, universal_newlines=True) as subp:
+    with qemu_tool_popen(args, connect_stderr) as subp:
         output = subp.communicate()[0]
         if subp.returncode < 0:
             cmd = ' '.join(args)
-- 
2.31.1


