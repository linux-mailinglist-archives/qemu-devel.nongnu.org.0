Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1402C85DA
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 14:49:51 +0100 (CET)
Received: from localhost ([::1]:42110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjjYs-0006PB-W3
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 08:49:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kjjQL-00075h-0B; Mon, 30 Nov 2020 08:41:01 -0500
Received: from mail-vi1eur05on2135.outbound.protection.outlook.com
 ([40.107.21.135]:61792 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kjjQI-0000P5-Rg; Mon, 30 Nov 2020 08:41:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGdgcwI7oxeH91HohaJzR4S6zsJ4T8iERdO1KIaVTaWzVLKQBENvv8RvJnT6W3g5HLfouiyl538Z15FPyCTW7tHZpDv15hRoLTIvEdPYz4HcA3TuvwXZD+nBE0MeyzK+6t6M7bgBtWpdBSjruiK6WWejDnpDUEFqprSpCLeZfxsI2xT1nGslzAnSamIB8SJTTA1HO1iX9TuUAQ++HQ4ApFlYCs1nMenH512qD2x47MYRd4K9FgHJ6+jh62VxfFbH9u89ycBhm1GPB85MfOCQefh+PAwAbx8KPMVqmhOVWj/GVCcGzW5llya2a8eYHEpnK3ATBgr5tyTvGdz8Hw4e0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BeuCo61nSlA0JwQpzJzEHrRceSW1ZLFVIZw+mYEaJU=;
 b=kQQIEk3WPM3rcslbVogL8QG0chZaB+qbVAUdukN7GQd1Y7QUbNjrIO2v4nFdtkaqJUsXk2kN9gT2CJj1RBvdrVIWFgPeqSDlMN6PIjEQYJlqGme9AXBSUMPiVRl9QUes9usDAvPg49oEOKUj3dHbSY8MZOPvIBu62BE3r0jv4Dnkh84y5zkG5tLzWj95AgYSqki7quaF70qTZbnqSTmrTb+t6t/f2IhWnjtgL62NhJP6tNUOqeXLBMzcNVM8El5y9MkgqJBsPmGTuCZWxdPI+NXRAlg/3lvnrfrr7Nde2Eaj554Rn9iPtsgdDUq2PQhrxGcBDOluzu7eA0mWUDbbWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BeuCo61nSlA0JwQpzJzEHrRceSW1ZLFVIZw+mYEaJU=;
 b=oxt08xECSa0LYbAYFLcgMVO/i/q0teMV/SYgxc6yQIbAdvwWMjRWjTN0G83PFvp9MMXoSraKpU4uPRZzt2B2H7gKFbOVnyWIXxerpncLawa22HixxgL1JOMHT7uWIzrVeQYTe0V6RQD0UELvCCTbfhQ0u3g830EK/UuBHVozNTw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3448.eurprd08.prod.outlook.com (2603:10a6:20b:50::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Mon, 30 Nov
 2020 13:40:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 13:40:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 eblake@redhat.com, vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v2 6/8] iotests.py: add and use qemu_io_wrap_args()
Date: Mon, 30 Nov 2020 16:40:22 +0300
Message-Id: <20201130134024.19212-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201130134024.19212-1-vsementsov@virtuozzo.com>
References: <20201130134024.19212-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR04CA0007.eurprd04.prod.outlook.com
 (2603:10a6:208:122::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM0PR04CA0007.eurprd04.prod.outlook.com (2603:10a6:208:122::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23 via Frontend
 Transport; Mon, 30 Nov 2020 13:40:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 932912d5-0f78-4dc9-404a-08d895358909
X-MS-TrafficTypeDiagnostic: AM6PR08MB3448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB344812601606A86AF80EBC8EC1F50@AM6PR08MB3448.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tWL3CVZrySL10fmj57IyrKnz463yhXwWXqE/BuEBTvdzybGepUfXIQLbtWVqtqrvq7nqHc3ADa6Zjl7Z3H6IDUaBMVoYWSinfdy0OzebZHW270n7sPxVVHipqjGv+It5xfxG+ShhlPWK69Qvdfrkg6hEyVKk7hQd7CfyvPkuiAVfVEoxJQDMX90cNbqk6eMZGFuZ3fCTtn6nwRrmLHVNZkd7F9FcoSFhKQtF3NfrJ70PdyvheBILSFGX8Mi6vsjn9ieJS7dQICOUNCPnAdk5u5OTaxgTwi6eyNJLNsJ+HNKQBqGOeBFhyVwVKVKHZaC4Qm60GEJajMCSRdOkuQnlEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(396003)(376002)(39840400004)(2906002)(478600001)(52116002)(6666004)(1076003)(4326008)(6512007)(8676002)(8936002)(86362001)(107886003)(2616005)(6916009)(316002)(956004)(6486002)(5660300002)(6506007)(186003)(66946007)(66476007)(66556008)(16526019)(26005)(36756003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Q2k8MUYPBYbioUyIMkAZ4D5RyP09fQ8o2h+QP9OmJhuuFREwfwpfgo27rz63?=
 =?us-ascii?Q?jkS9ssdddGPnz4FeUd24+a1x6gX438N0vUruruYHyXp/JPfNm7BTsMvTk83I?=
 =?us-ascii?Q?byTnhk/k3dM1Z+GAREpIEiG6XGpXTgexRvhUDPxiwzxjXV0ruKSZfhfv5Nqo?=
 =?us-ascii?Q?U09j2XhAcg1k6Uvphlx/0OmuoDenkIgSdLcaaM1+rzXh88accn8cyuuC4tuV?=
 =?us-ascii?Q?bDhOgYtrT5IwwEWUJ0/hVFd9qjJFrJz6BjpEG7A/YxzIzh1qbdSeE5+GgMNF?=
 =?us-ascii?Q?sRJeCsPGpmcOHmiOcnU3udHA3lKOVynvUzPf50NZxSZO9XNa/7SU9FvPD3Iw?=
 =?us-ascii?Q?cAGmIrg9i8HPtbDmp+FhdhteH1eQjQ2kjFtXQVMrJwhDWyN7bLSBjRakq5oL?=
 =?us-ascii?Q?3DIH2+6EEqTNZzGjIYt6viIRDg+0o/vd7nSizN6sAL7SZ2uR9JE9l0eYKiyk?=
 =?us-ascii?Q?8QNKq+6J3tnGancmGQTHJsDD4dehcerhdjqT1nClIYBeBJC8M2MccYoKJNYq?=
 =?us-ascii?Q?3eCX5WZnhXhzp2EN5pUEpsMDOwNqYp2cxQ8qd6a+9OMlcF/4zhsQ5BQAB1EC?=
 =?us-ascii?Q?Jfx/lY4iWTaxqpMbYHZr72s+GEbpQCYKi37epm5UptRzUyrbh6N0MxGi/OXx?=
 =?us-ascii?Q?c9UOkaXunkOKRDP5QfrYUuPNe5iemlWGLojy2wm2Auyv5K06vcY3MZ6CAErH?=
 =?us-ascii?Q?ytqVYdevXnu6lqCiGXmpzT0JhGIuJhkEoALQAgxAhVbigkZ3HZADMsLr4dMi?=
 =?us-ascii?Q?+7M22/OXc1vbUonMv76eY82FCx+5fVvRaJbm6lLyo2QlStiVFifMja03T0n5?=
 =?us-ascii?Q?nIWhs6Bd3wo30SsciXMW7rqIrJpl+flMP16Oi1SMoLlczwI2wD0zHNwoKbaR?=
 =?us-ascii?Q?2/+zaRql/TuLA4ivDYAhyM8yKkiJVATjNhv8/9FQJXeaT0C8b3cDEIPhg/LP?=
 =?us-ascii?Q?+djL7y/D63vqo3TUam3fwQoA79k0wUGoQVNOUFys2uRR+yhoxyMt/XgphDvw?=
 =?us-ascii?Q?DHO/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 932912d5-0f78-4dc9-404a-08d895358909
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 13:40:43.9806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dqUEs8WWoZPUQDvOGsaf31ao8d7g/DTNEunaQWpWfOOfKXYia8lBqQzdFxYjVhYBfKogH7FXKVIqQqbT2sXvxfLMNyKLIeog9C1Ayl5ju5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3448
Received-SPF: pass client-ip=40.107.21.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

For qemu_io* functions support --image-opts argument, which conflicts
with -f argument from qemu_io_args.

For QemuIoInteractive use new wrapper as well, which allows relying on
default format.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index df9834e43a..393028eb9a 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -190,10 +190,15 @@ def img_info_log(filename, filter_path=None, imgopts=False, extra_args=()):
         filter_path = filename
     log(filter_img_info(output, filter_path))
 
+def qemu_io_wrap_args(args: Sequence[str]):
+    if '-f' in args or '--image-opts' in args:
+        return qemu_io_args_no_fmt + list(args)
+    else:
+        return qemu_io_args + list(args)
+
 def qemu_io(*args):
     '''Run qemu-io and return the stdout data'''
-    args = qemu_io_args + list(args)
-    return qemu_tool_pipe_and_status('qemu-io', args)[0]
+    return qemu_tool_pipe_and_status('qemu-io', qemu_io_wrap_args(args))[0]
 
 def qemu_io_log(*args):
     result = qemu_io(*args)
@@ -202,7 +207,7 @@ def qemu_io_log(*args):
 
 def qemu_io_silent(*args):
     '''Run qemu-io and return the exit code, suppressing stdout'''
-    args = qemu_io_args + list(args)
+    args = qemu_io_wrap_args(args)
     exitcode = subprocess.call(args, stdout=open('/dev/null', 'w'))
     if exitcode < 0:
         sys.stderr.write('qemu-io received signal %i: %s\n' %
@@ -211,7 +216,7 @@ def qemu_io_silent(*args):
 
 def qemu_io_silent_check(*args):
     '''Run qemu-io and return the true if subprocess returned 0'''
-    args = qemu_io_args + list(args)
+    args = qemu_io_wrap_args(args)
     exitcode = subprocess.call(args, stdout=open('/dev/null', 'w'),
                                stderr=subprocess.STDOUT)
     return exitcode == 0
@@ -223,7 +228,7 @@ def get_virtio_scsi_device():
 
 class QemuIoInteractive:
     def __init__(self, *args):
-        self.args = qemu_io_args_no_fmt + list(args)
+        self.args = qemu_io_wrap_args(args)
         self._p = subprocess.Popen(self.args, stdin=subprocess.PIPE,
                                    stdout=subprocess.PIPE,
                                    stderr=subprocess.STDOUT,
-- 
2.21.3


