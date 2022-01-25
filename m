Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13E149BE30
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 23:05:40 +0100 (CET)
Received: from localhost ([::1]:36882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCTwZ-0008Jt-US
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 17:05:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCToU-0000N1-9r
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 16:57:19 -0500
Received: from [2a01:111:f400:fe0e::730] (port=45285
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCToS-0002Hu-9E
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 16:57:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXK67VVu/mP1FxkPsqp7TMLGNpIAgTGPH3V3t4NT5xKQRVSM+izsfGfWFz01qJs9hl4QVHAv5IGIdIg1kFpGeQBkLrpCb/kTvWrqBb7Q9NT3w1sLyE3B/EjoK/mrXEFIjhP9vXTBwn4raSe5YgZagYN7NDinXhkuTQRPRqkReMyN+UaVRSrb98ZZPQrV6p3sZsB/8P7q38GZgcMseYS/CxmuxStalxt1YfHfb1fCou10PE7vYUTSHkki7Z2ice1WaT6kEJ7RvdPo2uPbU2PsLV07QH3xdr/7MHwG2Hnb5k8B8JsNx5JH6GL3f7Z7M51Vw1NWhH0bLMrRbkCWfSfucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRFQ0JsfCke1/wNAD9Z1HgO3BWeNqFg0wScqSQxuNOo=;
 b=RVP2V6d4SQ6gUVRfuCpc0mDhSoXs8t+4BXLgcGf0AykmGws0GNEfvT2/2ws+FVI6yhASoyCNhk70MDdUXd23k0RsH7yGGAdIMXFq/SR+Hp0STwn7m2oNu7t7KOjMPWZl2TCJqQyJPbVqxQSe3Lz8SrqOCKrPWZVbCXfydfODSZ1T/EyGgrpAtlVdj48pzB+BT+cgY93fiaQjsGfUAU+VpOEaylVQ2zEOvEmFte8Wr5JNAtcw5Ja4rXwgr5jnH7xnAxBftDdsQuaJSyJOcKXCTM8qv+WXVk6moGueAJd6t4HIYsAMv2yx2LsJSGtyzkSKosGAd2o0dhiadqXOF3m38w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRFQ0JsfCke1/wNAD9Z1HgO3BWeNqFg0wScqSQxuNOo=;
 b=dKvFtN0tlq7i66ta8oXgYY+YmAKKRjE28P5WNnbBg9kIpOWd4YPxpqDZ3TOV/VemB+W9zcwuizSnBRjda9EX2mIgft/q7aDNPU3OlahQArFRB/GvdxycYkVeA2/X0EPelw2PHygtquEL0wYjB4+VinUxGduUdR9aqW58OrXCqoY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB7PR08MB3082.eurprd08.prod.outlook.com (2603:10a6:5:1d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Tue, 25 Jan
 2022 21:57:08 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 21:57:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v5 2/7] qapi/commands: refactor error handling code
Date: Tue, 25 Jan 2022 22:56:50 +0100
Message-Id: <20220125215655.3111881-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220125215655.3111881-1-vsementsov@virtuozzo.com>
References: <20220125215655.3111881-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::23) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: baf7de96-5dfa-422b-0251-08d9e04da20a
X-MS-TrafficTypeDiagnostic: DB7PR08MB3082:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB308240E3B6E49A6D3EFC5C44C15F9@DB7PR08MB3082.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:29;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2tynbWwKWiJdVf82+YcvVjVj9aR8b3xvmQcenddcRtA+1IQkbnKBKjeFqy8UYzBeIoUkEyRIlINpet7zVDZrF98BWn0Ow1qH1Lfxr8oONdF4tp4+4XzizQxFyFqJd10PBB0jDdLXeF6XbF8wIPAHyVQslX2941XG/Ud74p66CeiDTVIMOi97/77mld+92uQ/x+YxNlUI+Bre7qgcDEyTBYoa0rcPsjpoiA+9lZBwPYe12TdUme0R9LpJphr1/PlUXTAGAq8fn+QQhVOeFitKZ/fg23tIzCQwP5Yvtqsu4GQbG73ac2hrCCfBen99uG8TGzifiFsVJ29Qa+WM/iOcRuj2Jyhs3be7JLXxaO6KKlZ5/M6Ola8W5YbC2PEAxYIlN4Ao7TaTQ0w+KCVW2QyKegNcLCc332t/VU/QDISNlg4bUUjBul+26tC5b68zRbZYpMabWV9friT2225A8CKkmRcXgXzRk7JH2z7f5fMfG8KnMgZ5ier0DgNRCdvDU56HLHE/MDjKUnjAmccOmNhIN+HS2UHkB+mZIdwBNTCt5rskWjzW5cGGsF1UtSo1V1UJJ4+B0aHu9vEX2lzaSrbtltk/ebSqn3a0BwS2p1Va/Hgsw+FBvOzsLCjXh1pTUs8C/NG2BvM9TFXW94GX5+q7LK5PFGkTUi9b0B1Sc5Os1WzBhVCJ1R8ePnX99vEIIUUf2TfahgILqzHqAx1GfAiQpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(2616005)(6916009)(86362001)(66946007)(186003)(36756003)(8676002)(38100700002)(8936002)(38350700002)(508600001)(66556008)(66476007)(5660300002)(52116002)(6512007)(6666004)(2906002)(83380400001)(6506007)(316002)(6486002)(26005)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BiPPlevg/obzjKIDU4ACK+7DbbGsUex63zqDQmh6BX9l7v52FGlvbBOhhJ4K?=
 =?us-ascii?Q?jwGinBYMfEfV9QWJ2snEubdhqs59cZceeEZU3C28xANmkn8/z+WZicJo/TXW?=
 =?us-ascii?Q?b0qITN7oUBh8/jhQmD3LaZK+j0oo9apYFdhK4hUtXkyvGKeyGPV7rOixakDa?=
 =?us-ascii?Q?NGl3/1v+dIGzRrVSX12sY6LLVd7rL5QONTXeoAYGp3jxbh/MyXfve17Dr3h/?=
 =?us-ascii?Q?aaT+23IaNcP6sh/qlgfwCTHfl4LwIj9QjYRG0CDB6Bs4yeLIdHMHN5h1mC0e?=
 =?us-ascii?Q?fb25YgpA3O0tMgZjGv5i+NnmO9xUuTrR1O+qqeGYqpLuvcg46Q8xaoCt+MHb?=
 =?us-ascii?Q?M6XWu4bhPWG9E7CN9WAdk5AVGbYVgcmJTDULftgRtrncQios/PbcFfJYEEYh?=
 =?us-ascii?Q?kQdh4m1diHz9LlXDFKWBdECToVyhn9ZfuilXqpvYge6JKa1h3zqyAv4hhL1t?=
 =?us-ascii?Q?sPiUEkU0pxIw+nySeKCFYCXcpShL9wqP2n/HfOlMxpd87R58HlnGgcqDh94l?=
 =?us-ascii?Q?uPITQVrPUMK87OiYRem2j+kXK7efuWBpNJkATVEfnyUkDvxoeqzUwxwQzKFC?=
 =?us-ascii?Q?BNMhjiKU7Ts8TLLMxMG4bepbyULQnXScaNS0zGrrEhcqsfZp/N/4AJ9eMXJ5?=
 =?us-ascii?Q?udpVz9VWs/ZWRLWOFHCrapXyEvFO3j7zgLXj2JPlCk55f9RY8FqA4r2os6ok?=
 =?us-ascii?Q?mY79OY7Z7rzO7AFKuzmbV8/x/IkKhxoXkeaA1HHPX7T2BbFA9VQiBEay2eV3?=
 =?us-ascii?Q?/rgizYEAAfYbKRigrVmvuRZvx4LaOOP0Z6liO2V0C3bt4H5SFPuucghWH4yT?=
 =?us-ascii?Q?I9mkRnLvG9vpDLtsOsgmuY2MdveGD+YuVRj8vOZxxGMlNuWCa70II7K8nIkj?=
 =?us-ascii?Q?YenEmQRcO8omZbIN8wMTDZU0NddTbdYEYwk7mPDf0e19rPcToOmzDJRArcPz?=
 =?us-ascii?Q?bjmWfd10faEBoZ7rsT8UlxyDIx8iOeh+msJowBYJD+LW1VFJrKdj6vHebTMf?=
 =?us-ascii?Q?7wDZoyzn3Olz4Y16KmEZJBlyd3T631hRwKLxpxLNIhVenSV6ICjxzpzhazeF?=
 =?us-ascii?Q?J0Pe/ZHWj7ciaw4MYSTO1ci0LFyGu6yU4LCOHM9tb0Cb6E9gmQf6yvu9rEbk?=
 =?us-ascii?Q?Pu4gEld8wPc79JJLErlvZhEeyQo4a6NVup/mPBOGDjS8ZAOnKNZ3iWPBqztI?=
 =?us-ascii?Q?JiNwFfRLo8pYhP5BeeIOc3u/7o5NLrGczgvNKJVbzh0nc6e5vXn8s10jf/iW?=
 =?us-ascii?Q?Ice6xfWrazqT4lZ67tw4vcKC6aaxXF7vzfkFuNr7MSiZrAzuf5h7V/mI7uLo?=
 =?us-ascii?Q?xnPbg6jcRDbg6Bs980pQp5KXmkLE/P32UguJ6wTK3ecb72quMekgtODUb9OR?=
 =?us-ascii?Q?tnJTvvoTOmXhw4+TRvHi/nz1kb6g+dxsBefOyMnfXqNnQDhleHM8havBRe9+?=
 =?us-ascii?Q?IbeMyyC8RBgmn01ZgNThyTqM89VTONyNpssU0IuIErm4MB9eD0ZFfnViI2sw?=
 =?us-ascii?Q?B25z+P4pHGqGctPe5YgYhJN6jnrbs8BUV0RI4vwbEshJ35HmduLsNXJYY7oy?=
 =?us-ascii?Q?cGu11RcTydFD82ibRBTqlhJvGINo2PGaa8EZ48m4o7SZ6DowciNdMJ39ssH0?=
 =?us-ascii?Q?HtCLZ/lkCKKwKqLmzQKfYul9HC5n2kbrajTiyjCDzhL329hLwG8TfTUgFBuf?=
 =?us-ascii?Q?xRlzGaOFQCnW1rL35Z2AOAdGt9c=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baf7de96-5dfa-422b-0251-08d9e04da20a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 21:57:08.8116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lyCgkaWgJYKO0x5bMEdNgJA1wWEjIkDTBQZe4zEsnpbfb89SAocCkJXPLRJOLQN4ITvxrq6w7XYtoG6GJBafRxyxM7UjYcZdJKsrzfWEn8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3082
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0e::730
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0e::730;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Move error_propagate() to if (err) and make "if (err)" block mandatory.
This is to simplify further commit, which will bring trace events
generation for QMP commands.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 docs/devel/qapi-code-gen.rst |  2 +-
 scripts/qapi/commands.py     | 10 +++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index a3b5473089..feafed79b5 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -1690,8 +1690,8 @@ Example::
         }
 
         retval = qmp_my_command(arg.arg1, &err);
-        error_propagate(errp, err);
         if (err) {
+            error_propagate(errp, err);
             goto out;
         }
 
diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 21001bbd6b..17e5ed2414 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -74,14 +74,18 @@ def gen_call(name: str,
     ret = mcgen('''
 
     %(lhs)sqmp_%(c_name)s(%(args)s&err);
-    error_propagate(errp, err);
 ''',
                 c_name=c_name(name), args=argstr, lhs=lhs)
-    if ret_type:
-        ret += mcgen('''
+
+    ret += mcgen('''
     if (err) {
+        error_propagate(errp, err);
         goto out;
     }
+''')
+
+    if ret_type:
+        ret += mcgen('''
 
     qmp_marshal_output_%(c_name)s(retval, ret, errp);
 ''',
-- 
2.31.1


