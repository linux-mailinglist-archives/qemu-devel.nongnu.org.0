Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B4E2BAFC9
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:18:52 +0100 (CET)
Received: from localhost ([::1]:32812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg97a-0005v1-QD
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:18:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kg95e-0003t8-PX; Fri, 20 Nov 2020 11:16:50 -0500
Received: from mail-am6eur05on2104.outbound.protection.outlook.com
 ([40.107.22.104]:54753 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kg95c-0004qy-JW; Fri, 20 Nov 2020 11:16:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Syg/Z43ZWoH5YK6JoRGVpO63KzzviPORkXRcCcWV0tv5iLoegyGV+x+YaYWlIFqGFF71HK6zgeueSNUXEU4x1DixzeXNbqrAbGVbRSa9bWRAgxrXWZQFaHDNldwqMO1jFfdoNFZYJsn/7XZ5vBdefdj+yosjsQVTkYXMV5K/MpmjbdXPofzeusZeQNhiVUF7BP67bWGohtcYPa2jKv7LDsNko4kxfQBqNLYU5awTicqcBqcywmaoX/y+c8yjj2YuLstivyjtc52aBn66+7gFs/DceN5cd/mgreFLdY0jU9U78AeUTbCu9wPIUo/AVDjZUxUCnHDvwtO8SBe9QjnAyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jnslqjR8WWX4QVbdpUQLv+HF1J8wrQumaUy5kTl2vM=;
 b=MpaoJ9S/qNvBLdqXnFQ8yEK3y8PtRogXaIeEAII04P3pbcA0VPl6IiYVrBqxaC3lpxP4ycz1asPDyu7htEIW7C08KyFEr+knRYoc+jb9mkp62KpBaDQIz3s2hynPuaGWikjmHNKw31jo3BWcrvKdzIs+28P/pZ0HJKdSmwRRyTVS9nnGttwU5G9BTqYvkfczybikldI7eqX3FTPjjmrihlZzlgMHYgwpcAp8VOCFOlGu/1idSTp9ea99eH3FwlYspv3c1HyHp4gICqhKKjRu4QdJZ/i5+nKSx5VuW/bmOjY0S0CAQ3Jaja+qmRfoTBoDrOBQU4uKR2w79T+GxVbJUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jnslqjR8WWX4QVbdpUQLv+HF1J8wrQumaUy5kTl2vM=;
 b=uEyH4T4Kd+r3bBdxLLk7aBoUy/fvAKLdcFsez+mPDiWrVpaAIxXSbcCKJhNdFB4O0vS2cf+BoupDcaD42DeRi4YD5reLnIKBs1g/QJ5dapbmXCGlLCxlCRZGQYkN97qpe02e0AaVMh5cPXKRfp7EmRRF7kY1CtVxiX0LC4PfZPg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5333.eurprd08.prod.outlook.com (2603:10a6:20b:104::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.26; Fri, 20 Nov
 2020 16:16:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Fri, 20 Nov 2020
 16:16:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, philmd@redhat.com, peter.maydell@linaro.org,
 berto@igalia.com, stefanha@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, eblake@redhat.com
Subject: [PATCH 3/5] scripts/block-coroutine-wrapper.py: allow more function
 types
Date: Fri, 20 Nov 2020 19:16:20 +0300
Message-Id: <20201120161622.1537-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201120161622.1537-1-vsementsov@virtuozzo.com>
References: <20201120161622.1537-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.108]
X-ClientProxiedBy: FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::9) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.108) by
 FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.13 via Frontend Transport; Fri, 20 Nov 2020 16:16:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac9c1c6a-5a2f-4b0b-a2ed-08d88d6fa93a
X-MS-TrafficTypeDiagnostic: AM7PR08MB5333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB53334431D44E54EB3E8EF66EC1FF0@AM7PR08MB5333.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1cIypKctBniTQLgOM8ba2vcE4gFcNWeDU8QrIK4QQNrntxNl9pURn2kllQg4WzLRekoPOTv2UFUUM9t5Ar/brDJs5JtAnNj3/ohlmcyizSalfKCpy68OHy8v5udree8T5A2w741qR4pJYX981yZYqsbnZFvXThhu5nvc53KreFn1FnxayvS6nRJrnrBrLm+hgiL39hZT4ipE3lzq7nKHyHn1AfePh0KzvdggVnSQ+WKEhYgIwr6zrjNohkXdWukaEeeolzlD3oHZPevS/i1EFuU0VhW1yf3CWzaY13Ew/KddfA88VMfOVg2379uyFSQVQgAFAdGduAUdVxNZfwvEWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(376002)(39840400004)(396003)(6512007)(1076003)(2616005)(7416002)(6916009)(66556008)(2906002)(478600001)(83380400001)(52116002)(66476007)(66946007)(86362001)(26005)(5660300002)(316002)(6666004)(956004)(6506007)(36756003)(16526019)(6486002)(8936002)(186003)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: CWb6dCnUm+vKYQxU6wsVHOU3OdzXI0yhRq0zQma+IzsriyyjtHvIhy/YPC4WIsb1Z1oScOYdP6wT+gGKcgBn/t9++YRKnwj4CZ+SboCgAM3hxp/Yc3FZ2PRiZYSGckgNJ8LRdMAk1dY6CfrEyrtRoROdRFiW/u7PleEMnRNWxj1t7zkCstKSkgB20s1Hm/Gil+ad1CC802nap1xv4CYveMBePbDS+7XNcJJUel9Am0nLlAMlKs+TZOx9l2W6HCvpJ1l1X4h203pHSI26PkAu0lJ8tmByYW9sgNvWrSpR6N2QyaS1h22fr+eNsA4xIKsoG8KplDeEQacHC+0dfMGFVc9QLaM6apTJkkaW49UYBS2f88FOs1/h1hxQPq7/OBicmX+r7lW5r+id5RFwDBkKF+Ah+Im8jQ83MUrkIhotpL2gI2qrtWm5yhJH5wVOT142mVj0Avr1MfLncrYM7v6ZQeB9EfYngMRNRqqztQW8rVxPRnJ2lXtYf+qTdtcfdrFs5c7pPdgMpDvsfZ2YIoJt7eFWjEPbembnYQjl+hemOKhYdv+/43Kp8bNgvIUSsO/Wt9DG6GutGyMy3DcQHPchWv/r+4FLBJ2To5CK+jl7tGzwq+xyWImfY9k/Krev7c61mS06Bqb/DD5b5kOMuaZh+Q==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac9c1c6a-5a2f-4b0b-a2ed-08d88d6fa93a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 16:16:39.4706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BLkuVR4NRqr8hVEY/1fyH0AfOzPxcIdqvSOZjPP9zFpHD4RP8ApFh0AsynjqVEZQieCJCVLlf/En3+xa5urZ56e4FpJW94lYLofO93HZvpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5333
Received-SPF: pass client-ip=40.107.22.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

Allow void functions, functions with first argument of type "Job *" and
functions not starting with "bdrv_".

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/block-coroutine-wrapper.py | 36 +++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/scripts/block-coroutine-wrapper.py b/scripts/block-coroutine-wrapper.py
index 0461fd1c45..68fad41f19 100644
--- a/scripts/block-coroutine-wrapper.py
+++ b/scripts/block-coroutine-wrapper.py
@@ -64,6 +64,7 @@ class ParamDecl:
 class FuncDecl:
     def __init__(self, return_type: str, name: str, args: str) -> None:
         self.return_type = return_type.strip()
+        self.void = return_type == 'void'
         self.name = name.strip()
         self.args = [ParamDecl(arg.strip()) for arg in args.split(',')]
 
@@ -73,16 +74,19 @@ class FuncDecl:
     def gen_block(self, format: str) -> str:
         return '\n'.join(format.format_map(arg.__dict__) for arg in self.args)
 
+    def if_ret(self, value: str) -> str:
+        return '' if self.void else value
+
 
 # Match wrappers declared with a generated_co_wrapper mark
-func_decl_re = re.compile(r'^int\s*generated_co_wrapper\s*'
+func_decl_re = re.compile(r'^(?P<return_type>(void|int))\s*generated_co_wrapper\s*'
                           r'(?P<wrapper_name>[a-z][a-z0-9_]*)'
                           r'\((?P<args>[^)]*)\);$', re.MULTILINE)
 
 
 def func_decl_iter(text: str) -> Iterator:
     for m in func_decl_re.finditer(text):
-        yield FuncDecl(return_type='int',
+        yield FuncDecl(return_type=m.group('return_type'),
                        name=m.group('wrapper_name'),
                        args=m.group('args'))
 
@@ -98,13 +102,19 @@ def snake_to_camel(func_name: str) -> str:
 
 
 def gen_wrapper(func: FuncDecl) -> str:
-    assert func.name.startswith('bdrv_')
-    assert not func.name.startswith('bdrv_co_')
-    assert func.return_type == 'int'
-    assert func.args[0].type in ['BlockDriverState *', 'BdrvChild *']
-
-    name = 'bdrv_co_' + func.name[5:]
-    bs = 'bs' if func.args[0].type == 'BlockDriverState *' else 'child->bs'
+    subsystem, rname = func.name.split('_', 1)
+    assert not rname.startswith('co_')
+    assert func.return_type in ('int', 'void')
+    assert func.args[0].type in ['BlockDriverState *', 'BdrvChild *', 'Job *']
+
+    name = f'{subsystem}_co_{rname}'
+    arg0_t = func.args[0].type
+    if arg0_t == 'BlockDriverState *':
+        bs = 'bs'
+    elif arg0_t == 'BdrvChild *':
+        bs = 'child->bs'
+    elif arg0_t == 'Job *':
+        bs = 'blk_bs(container_of(job, BlockJob, job)->blk)'
     struct_name = snake_to_camel(name)
 
     return f"""\
@@ -121,16 +131,16 @@ static void coroutine_fn {name}_entry(void *opaque)
 {{
     {struct_name} *s = opaque;
 
-    s->poll_state.ret = {name}({ func.gen_list('s->{name}') });
+    {func.if_ret('s->poll_state.ret = ')}{name}({ func.gen_list('s->{name}') });
     s->poll_state.in_progress = false;
 
     aio_wait_kick();
 }}
 
-int {func.name}({ func.gen_list('{decl}') })
+{func.return_type} {func.name}({ func.gen_list('{decl}') })
 {{
     if (qemu_in_coroutine()) {{
-        return {name}({ func.gen_list('{name}') });
+        {func.if_ret('return ')}{name}({ func.gen_list('{name}') });
     }} else {{
         {struct_name} s = {{
             .poll_state.bs = {bs},
@@ -141,7 +151,7 @@ int {func.name}({ func.gen_list('{decl}') })
 
         s.poll_state.co = qemu_coroutine_create({name}_entry, &s);
 
-        return bdrv_poll_co(&s.poll_state);
+        {func.if_ret('return ')}bdrv_poll_co(&s.poll_state);
     }}
 }}"""
 
-- 
2.21.3


