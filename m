Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58813F5A3F
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:57:33 +0200 (CEST)
Received: from localhost ([::1]:55448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISFQ-00035w-Sw
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyP-00031W-1A; Tue, 24 Aug 2021 04:39:57 -0400
Received: from mail-eopbgr70137.outbound.protection.outlook.com
 ([40.107.7.137]:13025 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyN-0007eD-Aw; Tue, 24 Aug 2021 04:39:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TXbc3mC19+MfncM/gN9CgmQxY3cfCXhYd8mFJWVNV9uaCkrjAIfuJ0L1iKYV4ZtLZCkaFEC7wrzJwzWpZQ3WsB6kCs8SYKFqrbb6aNs2XB6YD13rz57BODcp7vMiCXEuui2IisPYA/i/Yb+UgnzSMv4oBdP9JuwZkvsEgjlbxGKlqbvKei5t8OCPRCSfuCO74PP4as1ud13sQxOAiQZUhuhWXopZKNjFQJ1ge7Pf7hbz/u2IfUgKJm1sNo7HiT4zIo0atioJGsT4514anoJmXdAJhk53OPY0/bHb+L4vXnFR8a2vrmH8sgWeluP6wRGlj/G47IYcseirbapE8erjdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FJWIhLdp3ZBunz4U3SknoYuQthg0pb2m2HtQWXoZ80=;
 b=e1dJ5Df540nDtlvLn5AWxA2Va/sJB4VwBLU3w9YieSCsOMPVtzcP8WY9NHwxw/eoC1w5eTYHPTosLlnrm3xT17nU6vlgWMAJIc2GUlViFguhhxg5XLKGYmSpwr7a1/RmJ5UyCTHD7FykBbcc0Y3GXL/Wco67PnQ2+61xq0V8MXWJdajVFi5coEvfFULRQKJlzP4Dw35aAOozr+8Nn/ne4WIZ1uh9nC/DaH37YqVV5S0bphkLh2rgbowpXTsMUs2x0EPpK7w07iMOyL1sR4XhvfyZudROBCHToLODNWI5N4kDKroqLN+y52jrqj1gRp/wQNPHAGFoyYuW+ajn2BUg4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FJWIhLdp3ZBunz4U3SknoYuQthg0pb2m2HtQWXoZ80=;
 b=vI367hPiqxJceN73HkkW0mQl6tInsII0L6JMKKjD8x60nJIvXjGPoSNkhrT+F3+KbT4CBlPqJrx8n3kyKEbSNvYalsUvego+kR8mLkMiNexhjWzvk259Y7BwwuKqLfNl1vaNCOkLetTk0SWFUrtMFvGnH9fxRngFIYCcksDY38w=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4088.eurprd08.prod.outlook.com (2603:10a6:20b:a9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.24; Tue, 24 Aug
 2021 08:39:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:49 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v8 23/34] python/qemu/machine.py: refactor _qemu_args()
Date: Tue, 24 Aug 2021 11:38:45 +0300
Message-Id: <20210824083856.17408-24-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210824083856.17408-1-vsementsov@virtuozzo.com>
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0178.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR05CA0178.eurprd05.prod.outlook.com (2603:10a6:3:f8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9958987e-81c7-4f2b-f703-08d966dabc2c
X-MS-TrafficTypeDiagnostic: AM6PR08MB4088:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB40887AA81D891A5CEEF5852CC1C59@AM6PR08MB4088.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gJj4NK6UDSjV+5MhVH2OCvJpYAzhFHPrniDbu66P6A69ZT9qHUpiRRDebsT1QiZPbGLeYYw70NB2SvglDmzwKLsgzy5v/YfKHJc7yCn1nU/FsQcWejwuI+Xz5RaayBngbKEOJdw7CBlvsYXuhWTJOW6MzDNJnMjEWX0fd/VkTP1ps5ilVKST50lTGF11g+xTRgAEF/6iFCjm7981ZhiE38bLoh5atm3aTlUHkju/y0PYMI/oGNlYkPKJSL6cHGWhypJWlpuaw8VmWndmRXDqgOu0XTjlnU1UGMrOHFGRzYNk/YzpYCFP6L9/WVPzVzAAsXWciZUireQ0hw0HGWeM9naVafKboKht3RCyZJT4BNXtE5wVMqhkegauGy2yCNvTTYGwqYdu/yKK97JZC9lQydmHm+eP5qiLRcZJd+1oxDHXhJsz7ggDcJVDNSDXNZ3298pgMwgzJA2Wbe/BoDz/kC/y420/Z8uZeAESJKkpmm2GO3fQJQkl/hNkQqczH0B5nrnpHZpMfRzhvuhAkSanFqt+mFeP3O+FaH28RbmPo4jaFnMnmcHakWQ5n59vrmfFqi4cTnA16gVgI8JRBIQF1x4fq/NzrDwETI8c95YcVPSdrrKGkbAhP1riyVuB9gJFT4jrHA6foGRI5Jp3BQAoOaPNuxgYAzr4Oe7o7uOgeHsW6MnIs6RPq9S3Fo7VHZaSwYHoAfEXTtAsbtgeNMj8aw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(376002)(366004)(396003)(136003)(346002)(1076003)(7416002)(83380400001)(4326008)(956004)(6486002)(38100700002)(38350700002)(8676002)(6512007)(2906002)(478600001)(186003)(66556008)(66476007)(6666004)(6506007)(52116002)(26005)(8936002)(36756003)(2616005)(86362001)(6916009)(316002)(66946007)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sLIubH2i0GIzKvXIlQMfaHg72GH4yMx35C2SebapAZioxc/+yi3uCp3tB1O/?=
 =?us-ascii?Q?0ovaJ4f+WfJzxe4YMZUZE5teHdYaNBvWrjr91kearmcssY4rvZJ+7IAoJEbr?=
 =?us-ascii?Q?mQD5rHU6sCcwlq7aijFVyH3owphESsXyp0219JmXdSxubujYvncbdIx826HM?=
 =?us-ascii?Q?SstucqJv7rqJRnuKFIvIVECnz7pHWNNtFzCIdA5I8UWkHxEI/7tBwmzv6IIS?=
 =?us-ascii?Q?Q2Ac0upZU//eI1/B/Y1k7Zv9jeNT1veB9OChzt7AAgXv2AGJAFyJht5LWEzk?=
 =?us-ascii?Q?X0L6hvXoQyzHf8jCd9oGAmvSF7LhyBQ5UYeFRxoV7a3fBVI55/25D9JTk6Z0?=
 =?us-ascii?Q?wW6rDGvDSpKv3EnIq26nxuWCWzW/tc/DsoHNZ3SB3j94o22ue0CqscV5uYme?=
 =?us-ascii?Q?E6+pDdW5vSnh66ABt7hstO2W/zJ6IFuy82hRMmN3sgW8pd2y8xQoAV5rYCIC?=
 =?us-ascii?Q?OsPkVRBYjWyEN2n8M9NDH38XRh7B6Sf8KyIEvV68ENtqI8pMMZ6dBu3p2bzS?=
 =?us-ascii?Q?OHDCTpfsRxuwVLI6Tdp54CSDY5tFQNzFGPyENPqs8G5Kjm+G6rpklDuE4HFW?=
 =?us-ascii?Q?+u9jG1uEfX1KT53fXHCNqoqRz2RUYKnDGuNSkQ/AGq8TEzRSFNObmmSpNXkF?=
 =?us-ascii?Q?VXV4ETMj6Davsclwj+IKWvmIJNLkGdcHfoMnazg+WLOEwNEeyeNmlvoXtYCn?=
 =?us-ascii?Q?7lBM55C7WqTN1qPMdHV2qvIWQjYfBIsMAdnVn0yf5u/2Vih6gsOVETAPcRSM?=
 =?us-ascii?Q?biuIKtakNzw66rojXbiDQIhgEVgZpoQC03lFk2PoMr3QG39lt2fFbM6haYLX?=
 =?us-ascii?Q?Doc+JqLGPoiwermDZEK+nfDhUeDYb03d/KsVnYBLQZky53WjP8C6lzry8ERQ?=
 =?us-ascii?Q?Iv6XY1Hrh2hFcDG17ZFOYuSJ49CUlhE3ZthIZ98oXnsVWwaPoxju+gGc8B2W?=
 =?us-ascii?Q?tepoDUafJc9yh9EXvrdQnuJUtjFWqfWBREqhb0J/EBxiwcNG0aDrpAryB1gM?=
 =?us-ascii?Q?LeMy2KRRdHovxWpS1ei5tTK9uOp0Cd7eTGSgeFR6/PhBgvhKVnka73t1wB6w?=
 =?us-ascii?Q?AGMCoCaJr+h6yT3Aj++NBjClXxaNjaem4vQemjm8c8YdfgW5yHHUqtv3TElg?=
 =?us-ascii?Q?xQb7YvxqkLsIe9Rp2cexC4SY4B8WkGFn91Jmc4lP3fwQyY/JIA+u07SvO8S9?=
 =?us-ascii?Q?Tg9FmLsJWc2KMuzGlW+pcFGH8ZqWH95f2op5gWxE/CVohx4Z7CPcTeMhJkZH?=
 =?us-ascii?Q?ML5BTp/qk8LLtRwaUfXnoZECMG1KFt8PkD/ZxwHAfMxZN6W9HCo9mrqACs4v?=
 =?us-ascii?Q?ShLYzAKpAaYLdiGlIqpDgH5H?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9958987e-81c7-4f2b-f703-08d966dabc2c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:49.6847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: neZ2859fU+hciQiZUjMH6fXTG0Q5r0n8s9ONPN/NEoToBVg4N0x9ImwyedXao2rCM8NY3vohPdR62/yWtSdff6uyGt5Fqnt0VwzYFg1zwpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4088
Received-SPF: pass client-ip=40.107.7.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

 - use shorter construction
 - don't create new dict if not needed
 - drop extra unpacking key-val arguments
 - drop extra default values

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 971ed7e8c6..5eab31aeec 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -564,14 +564,12 @@ def _qmp(self) -> QEMUMonitorProtocol:
         return self._qmp_connection
 
     @classmethod
-    def _qmp_args(cls, _conv_keys: bool = True, **args: Any) -> Dict[str, Any]:
-        qmp_args = dict()
-        for key, value in args.items():
-            if _conv_keys:
-                qmp_args[key.replace('_', '-')] = value
-            else:
-                qmp_args[key] = value
-        return qmp_args
+    def _qmp_args(cls, conv_keys: bool,
+                  args: Dict[str, Any]) -> Dict[str, object]:
+        if conv_keys:
+            return {k.replace('_', '-'): v for k, v in args.items()}
+
+        return args
 
     def qmp(self, cmd: str,
             conv_keys: bool = True,
@@ -579,7 +577,7 @@ def qmp(self, cmd: str,
         """
         Invoke a QMP command and return the response dict
         """
-        qmp_args = self._qmp_args(conv_keys, **args)
+        qmp_args = self._qmp_args(conv_keys, args)
         return self._qmp.cmd(cmd, args=qmp_args)
 
     def command(self, cmd: str,
@@ -590,7 +588,7 @@ def command(self, cmd: str,
         On success return the response dict.
         On failure raise an exception.
         """
-        qmp_args = self._qmp_args(conv_keys, **args)
+        qmp_args = self._qmp_args(conv_keys, args)
         return self._qmp.command(cmd, **qmp_args)
 
     def get_qmp_event(self, wait: bool = False) -> Optional[QMPMessage]:
-- 
2.29.2


