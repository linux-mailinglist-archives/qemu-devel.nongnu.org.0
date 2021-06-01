Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217463978EA
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:18:02 +0200 (CEST)
Received: from localhost ([::1]:45204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo81c-00083B-6C
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7c5-0003VU-Kz; Tue, 01 Jun 2021 12:51:33 -0400
Received: from mail-eopbgr150112.outbound.protection.outlook.com
 ([40.107.15.112]:35829 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7c2-0002O8-66; Tue, 01 Jun 2021 12:51:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W4V8hWzIbrP96Ygyuu5o50WTAdg9Zfh5n7v4JlPS7PLYeSckhxMBpr73g7XmIu6t6GBjmDXtRhSrQ33cFjOADRk73vGG5zQFWAJXc9RLrp+0aJM+JRFnM+KrupZ7bCphfZPB2wjv/b7sBZ90dCNJ/bNYNrRJCfDGA4F1oaCyTts27zIvEFsb/2QASAlEXw7pyCx862yEQTFq0SlZGp3da1YakNMKoeCBKnuKFclGZNVoKd5WP53cLe+cZxB/wkRAl5REY8ui/QEiBDebza4I5rULqAFN1DSPE8IGIGQgDFFd3T60teJrzJAsK78d0AaRaDHVUuEMpwn6HuiF4tgWzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Beh5dy+ReulH4eLaq91hbL0yXKg0RNyKzGfNw1S+Hg=;
 b=UrbI5fO+UnHVpFVwPyOnNnXVSpDesz/cRi+Q72HXPhc3GZKTJsXhhIYwddTKEm41cLSttI0Mc4lXdYiRZD0Hl4MbeMEN+SYGVGzcvRp4y38bYlZGVNxFsmuFpgAQp1n+zZ0jW2tptNRmnGvWC5V1ZDdzaF1sICmY1sVz08Admk6NfVhwZRHhWyulVaGdXfwbaPmjyFJ1285XLIIK4FsnFltb/HcZYoPwGyW9Y35aeE/zyBwEO/LXCGM6Sxt275/gDVmKrVWvaOMhQWhcOAvUVhf+PkhYCSS40FWGbTiVRSP0eCOn6KCe1KgAk2JQYlkK73CD25uiKhFlq5EhtMMwZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Beh5dy+ReulH4eLaq91hbL0yXKg0RNyKzGfNw1S+Hg=;
 b=cUJ6uW8+8LwMHJYRkex41/X+a1VuL89NnqqIxWiNN1Nif42ewG+FXAcKNRuxVbaKTgX80sEn2qAD3dRfT8piIpPKMYxBMnpX56gBXK8ub2lgz2XrG0igyaEk7fiwbcBRHqfRaJh2AMkXqZtRbu63vzncJQYouiYyqYhTcjp/6pQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1972.eurprd08.prod.outlook.com (2603:10a6:203:4b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Tue, 1 Jun
 2021 16:51:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:51:16 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 25/35] python/qemu/machine.py: refactor _qemu_args()
Date: Tue,  1 Jun 2021 19:50:16 +0300
Message-Id: <20210601165026.326877-26-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601165026.326877-1-vsementsov@virtuozzo.com>
References: <20210601165026.326877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:51:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0aa71d06-0152-474c-4e2f-08d9251d7919
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1972F926FEECAF1451464F9DC13E9@AM5PR0801MB1972.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yZpfstsH47ZYpNlHzFY/nPEICNpHXaK+0XyVYq3UBbL3RNNh6NdrRHluVjG/B/OmONVBa2yf4IE95oAKvmumWG9Vw22AGvIWoDF/yL8XZqp/NMxOaknROAtSaxpKACYkOt2h3Lqbn+kAAKDVy2DFSR4tAYox9fpGhidQrtMiXb2oYqgBkZN7J8+9Yz2z0/s0oUbEheyxhj51vjv420q/YnD37gZYJNYoJ+1Bsg2xBO6t/hCJ3cHPQhtVPiUhb4Ims0uLYcm6qQXRty6hWPMfruVsgawb77wfU87X66P7KLNO22JSurza6+BkMGQEQ8Ze/ksg7va0XF+eYcNDHW7hZk3xCk6r+Qg3/B0T3MfHHM8hu1queCyC5Ml04jzjQkn7VuXtruEg946QJ2dkwcM/Azo5GgQ7iNxN42vWWXbtMs+b+kgY6edxLi8SuMLe8543whxhBQ9AcSSokfIeelM/DI/wrU79bJZhPJaCIO1Fj+GgS9xAtd2A4zmxbPmjS+JkztMCdv7/zxo6RQ80wwUTVHMiyQ1PaIflr35yrWZyWnvRGen2yeoarcvZgm5rZTKYpj/B5mQXpTTiOvh7DRUIlc4l1VFSMg3AcgjhmdZyJBM2h34O/MBU7LylnbTxy5ndVuKLFTUSrM6GsUUzI4QF8GWo1ktT1OYIBfTvSIJLErcjh2hTf/jvpR/sfYvxFZot
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(39840400004)(346002)(52116002)(5660300002)(2906002)(478600001)(26005)(6916009)(1076003)(8936002)(2616005)(6486002)(38100700002)(4326008)(16526019)(186003)(38350700002)(316002)(83380400001)(956004)(66556008)(86362001)(66476007)(66946007)(36756003)(6512007)(8676002)(7416002)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?F1RIWWo9KrTXwgAbjBx0LfO8kELeITPm5YhST+YUt5nEoLaMotQOUbHSmGZm?=
 =?us-ascii?Q?0Qfoq7IvHArC860xrP9kIpPjaP5HMha5/h0j/AV93QgnFmzBR6A+CC8hD+BZ?=
 =?us-ascii?Q?YgHHwgkLpmr49aFB/aBbWHzeFdzPM2t06rspjWlWBp3M+1KeaGxJy9Pmz00p?=
 =?us-ascii?Q?c1H7ZBtE3snhiWtCNuON8+ps5mkVZXj5SV6jD7Q8pd96XKliwke7rGU6Omie?=
 =?us-ascii?Q?DTunfjodFplJLuYXtIrNd+7oGTN4Ecwa/c5uOb1lbKoOLiTomXmBHuhkgyJn?=
 =?us-ascii?Q?r24C3in+Gh1RDWSiZKBtCPfD/dKJLMDeJ2FkMxmBxpoFGnh8GIiJy/keLyal?=
 =?us-ascii?Q?8U4a4M1MYUr73IAiVHx0KxeKJJZK3zxOKNfea9xmHTHO8f2Aef3sJwmEZmjJ?=
 =?us-ascii?Q?HI2JmbWR/bDgA7EX74pBVwY4x6lET0kw16O4Ab5K0sqGM7umJ2nTrE2JPIuV?=
 =?us-ascii?Q?xlM0EJtIoEMxoMIPo2DbT9i9xhJxLpVt2/at2Pg3qNlu0+H9Rj79ry12eSLM?=
 =?us-ascii?Q?ksvt6Dh1Bxzn1k7JiszH6nIqHIP+T9h40KNhZmijJP42PZTmNCVQ3BjDvaU3?=
 =?us-ascii?Q?eEY4cr9A4Z/6sR9q5hL+3FxK+cS8Ca5wi5VyJsOmJPu8exEuzzMoBG6x8pgq?=
 =?us-ascii?Q?yAYpjTyvl5+xSZU12N/XlvEEr+TSE9e7yQcMlWG5AYaYR5bDyxmEO0INtmSb?=
 =?us-ascii?Q?vBczBGxJbU6i8YOVm8dWH6xoWsXXch1n3on9dd010SkRaDaTU8VTzt0s7Zg1?=
 =?us-ascii?Q?30FF3ejaZj5nMr0p4XLGQ20ZCuZiK3GW8gEvtNEpIdnlk7Cq2M6CaeWlR32H?=
 =?us-ascii?Q?SfV9CDNE4xnikEKBdNJJoLTnm1rnEKa405aPYhETReJmf6G92qnNYTp9L/4q?=
 =?us-ascii?Q?EqAxF7Bvoxpl6UFHuNljsCxdgPDlazpHz8FMX/nhaouWg3mPKEYDwP/2KIij?=
 =?us-ascii?Q?Mdi1tENLX06vs1Olo8Rss2lwaDUXH8tF5a3FQSMxm0vJ2y2SGvzom6zlxQPb?=
 =?us-ascii?Q?VuuRoyYpDzoucOqNbTWMZ9qniy2OBNJ51tZsJMCxPKO6VO/Z6QaiGsSUy06L?=
 =?us-ascii?Q?Yjx24heIQNvuCbzcfEn81pD6+/eJJ/BzExucFHPiA4qlSJvLL9iuhlUlXScO?=
 =?us-ascii?Q?9GPZm7vJY/0BW5yEiRoktBtBAhrCuuCZaZrI1BoD+8hxG+wiv2x47bSKaXqq?=
 =?us-ascii?Q?5+wuNNhYiGO1c5vcd8KOB04i7mBSRR162YVaU2xXRpZBFmmwU+RjMjaghdss?=
 =?us-ascii?Q?15tiOgo3zvU1MnHgf5BrTsglCp5Xg8gsAi/RaWymaxelq2ea6KLHKDJDqp2F?=
 =?us-ascii?Q?0gjSTFx2aN2dvIWmZ2otP2Ai?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa71d06-0152-474c-4e2f-08d9251d7919
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:51:16.6662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o1RNw+TPDFcDxdpMGkpJetbxmH4HmT/2XNMy/YplMTRvTz9YYRLG2vrysVVJk8fMZ9swumg/eHwdIb+Ii8F4vF4NfBc4ZDAks7pFAbNxZeo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1972
Received-SPF: pass client-ip=40.107.15.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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
---
 python/qemu/machine.py | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 6e44bda337..ff35f2cd6c 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -541,14 +541,12 @@ def _qmp(self) -> qmp.QEMUMonitorProtocol:
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
+                  args: Dict[str, Any]) -> Dict[str, Any]:
+        if conv_keys:
+            return {k.replace('_', '-'): v for k, v in args.items()}
+        else:
+            return args
 
     def qmp(self, cmd: str,
             conv_keys: bool = True,
@@ -556,7 +554,7 @@ def qmp(self, cmd: str,
         """
         Invoke a QMP command and return the response dict
         """
-        qmp_args = self._qmp_args(conv_keys, **args)
+        qmp_args = self._qmp_args(conv_keys, args)
         return self._qmp.cmd(cmd, args=qmp_args)
 
     def command(self, cmd: str,
@@ -567,7 +565,7 @@ def command(self, cmd: str,
         On success return the response dict.
         On failure raise an exception.
         """
-        qmp_args = self._qmp_args(conv_keys, **args)
+        qmp_args = self._qmp_args(conv_keys, args)
         return self._qmp.command(cmd, **qmp_args)
 
     def get_qmp_event(self, wait: bool = False) -> Optional[QMPMessage]:
-- 
2.29.2


