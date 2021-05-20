Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD1238B1D6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:37:14 +0200 (CEST)
Received: from localhost ([::1]:54984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjnV-0001eC-HP
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZq-0005xy-B7; Thu, 20 May 2021 10:23:06 -0400
Received: from mail-eopbgr40104.outbound.protection.outlook.com
 ([40.107.4.104]:55385 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZj-0005mG-1I; Thu, 20 May 2021 10:23:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MEuWLaiZtZKtNCNJ+coKb4+B/VdOEHGb+4J7luatoASTJVL2os62rX9rpFEI/W0u1ZlYdHAzF8Nv9QNfhDDO/6+Zzm5tjNc1nbGfuzgvaZ/MnpTiphaoKWZ7IVB19AKES9hkuPYlsxQ6OSc5wFYcWPwwuo4GPT+sOUKifvzaX/ncLJiBBbpEpK8kxp5e9B6iUp+nmfCjXWKELOdhd/Z+newTqbJpDokKGHt6DrM4WV9yTt+ENcdsBxJ0JapPwPhtJVjpwSrzYMGOHRCpLMEn+x+28zzVktvHhT9uLWY8zEayy/b2zJy5DXgN+1BQBapHQFzCUkRztcYAdC6RR0kDfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1i/DRS6eRvPzTuqlrDurmrlDx2uNSFUr3cN0MZRmSw=;
 b=KEkwx02aPWgvNLIVjSPNZVIuFEXJGTo9WcOuBzuPKrSWTf25UDRNw8aa5H/V5BVijEHQEGS/9Y4oUGI/+fQtXU+zoo5wxcN/zGN1lPgUzUxYCNIbnC7n1o8vXpHj99hNKhe1fjMKA+xQ4i/6o+CwgHzYsz3Xb/HUJ+JEY0J7DTCxtOOmqYWo4oTX86p+6cJOQf0vWcOH8tRTSIZsmvwUAQrPL4Ck71OeK0P3XYm5kaJuwjhNtItR/58IG5iNkolx8b03i8vOBax2Fzdn6fjB1xgJacHFcX9cePoR5O70QnMzOive/iIqMzTUIUMb7SUDHo8DiJRKvcYT9XPTJdYSZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1i/DRS6eRvPzTuqlrDurmrlDx2uNSFUr3cN0MZRmSw=;
 b=gWMZEYs3fYQDv+KPJudqy1rKTYA/wGVaZxpWCg2mZE8E584xMr9cDQNxv0HQxA0t1NzeYMixS54fGdBr/INyCE8gMJD6AArCnceyYTwIssAE13VHv+OW9FyegL+DnPd85p0i4UfzWEtpy/W4sNvQgyBDQsApyphvTdUA6l9UosU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4072.eurprd08.prod.outlook.com (2603:10a6:20b:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 20 May
 2021 14:22:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:22:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 23/33] python/qemu/machine.py: refactor _qemu_args()
Date: Thu, 20 May 2021 17:21:55 +0300
Message-Id: <20210520142205.607501-24-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210520142205.607501-1-vsementsov@virtuozzo.com>
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:22:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1353b1e1-2f94-487c-bed9-08d91b9ac295
X-MS-TrafficTypeDiagnostic: AM6PR08MB4072:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4072A1606FA4E1C3FA3BF6CCC12A9@AM6PR08MB4072.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LHXOT11WL7+Pja7VjFIpHT83uKDDtwbptsCWyVnrv8GgZ5tQorbzPpqhcDXBsv/5RjiJ9YIMvP6CNKhLSWyzglKbHdKaIACffbOobq8TC0XruWIfIYu/xXnZ6GLd+voC23fUay8M4TEa+qKTkV55LsOuOOJ1UwGH6fMOyRMLBqC+l5h+Xzit754LPhVD4ZOfEjmrCSIC4X+ILrDHwwm5ds+h61VQ1uT754Tpc3nu5v5OhwCzWZ6VJZrHpPvBUK7CD8meXMJGsmQD8CshGR1ZUcMnJObk7F8TK+KFINbpRRXP5T/lqq1dzjUNuAiATFveOoiaFYUoouOpZNHZjfqf1tTgT+CDkVPOUcFCWfhQwf5rDoNjxi9RAethJDeI9D0H9g5/hk+Hz+SFS9SCW7EH/GqafvmXFEAlze9UXZyqiqGwEQpbvecomiGZlcE1f+3re50WpfBmxdhC2l95u7NKuAFh+XYKlMj+9IhniD9zoPIR+9CQbLaw8cQN6hhhVwV5WniQB2r/c4ebZEo9Cxvk0dJkkwYswhHHVr6PSU80sWTbqSLLaMDtwtTiBk6gI42x5S8BKN+1D8WhbbZugUvaSPlRqLnMtDf5dxKB6C4FIOfaSxrgL9To+jc2IEtnEFd6R2rKp7mkj/hbZlRHWGkhkrC9BDqvPac+UIceZ+81ou6V9i2OcVZYpix5Ndqcaj64
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(39840400004)(396003)(346002)(38100700002)(478600001)(186003)(1076003)(38350700002)(2906002)(36756003)(4326008)(26005)(52116002)(6506007)(6486002)(66556008)(6512007)(66946007)(2616005)(66476007)(8676002)(16526019)(956004)(6916009)(8936002)(83380400001)(107886003)(86362001)(316002)(5660300002)(7416002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?J9+26wJG4NLT6N822gYxLhmensaVnJZyQd8OjB2zRDNZQiS8ZMWXTApVy8an?=
 =?us-ascii?Q?XbgMYAcwb4DfJ+StJh+t4ghVz5kb1yFao3QgiYOacz7HURkAvSyB8ZEFw/tX?=
 =?us-ascii?Q?CWdWStNCJHvx19xWH1ZDCSoKZvBi0Zib7r6F0L3dKK2yFatOP1F/1bs4JLL4?=
 =?us-ascii?Q?+UR5XXiv4gMjdS8yoq3Wxz1D8T3Tr/LAQIGB1VP80YbQTB2+oUQJNAAJUssB?=
 =?us-ascii?Q?jqre/G+/RcxpWgRHGk6TBx9pqkIA0eIbfcczC3WrK0pd1BKN80SMcZDW7Mgr?=
 =?us-ascii?Q?HcVWyxnIM4w5YsEroY0944RG/xn4aHnCAUO/I4zuBjxPFruU7XCS/cf6oy+C?=
 =?us-ascii?Q?wgttUsFNIUJIFoBejwiVvcV7UeL9giObH/i581/X1SI00bctL555fwYuLQ+J?=
 =?us-ascii?Q?P9TAup3oM1ggqp+2MseLCbdg8j7t0LDO/Ka73+d/ve/fr0fVW8r6vscWwTWw?=
 =?us-ascii?Q?oZMX9rcRbma1YKsjLusqne5EXxEx0dFt41l5BSWfFuKj1lb1XMw+tcq2xc0v?=
 =?us-ascii?Q?lHiCdNqDLytKpCU4VnGsYhNKhpsZofzM2M3sufKfWQTnb7hV+QWDlAn8DCd4?=
 =?us-ascii?Q?YC6rEFZMmOitBKzznvg8aG+kahlXWTDfeTCW8l88d8efGw8xhp1wbtoWuRN3?=
 =?us-ascii?Q?oyIC3yBzB1MQo6aD+RwtKxoiOkY8lb2gSjHtCSEkJybfZBrOGiBYF82k3qPJ?=
 =?us-ascii?Q?rs7OyYEYILJ4BjWX16KPBWKQuFm255dTBmm9Pm1U0FF+Ash3JOnDntNFCXi7?=
 =?us-ascii?Q?CSATSbgckoWSewSwzWu2w+kSakmM9bQYwpbzzCVPNAErdYj35zCrpK2XL2zA?=
 =?us-ascii?Q?ots+nDkHsdwxvyj1bHrUl5zTLzsIDAvyz4v1D6cltqKaMUagDKwzUeU74+S/?=
 =?us-ascii?Q?+rhLxOF/LYSgnBKYU78S2Srd3nayNZofYF1H5aoTsxGMiqYLFZpVu3/WaK6N?=
 =?us-ascii?Q?aJbSLUTfqZC4krLT1yitHZlGEg3/2mOM1rGlgflUEvx7mRPLXym+iCh/B4kZ?=
 =?us-ascii?Q?ujzrrkSokD460wwpWNd6GSArgXPkkXbUkW21EgdxLOiCtVBuaxVvXsCVzyAp?=
 =?us-ascii?Q?CNmbU3dDHHzLHPNU8rQp9K9YHrDjqxL/25qgJ99sYCEvbSEYPb+5RPtfcm55?=
 =?us-ascii?Q?Tbcjd3MQpNfpDViX//VTVkNHgDFTsFzsZ0sbxfJsuelU9MHQ5JDjH3w8iMpR?=
 =?us-ascii?Q?+emWI//BJs4cKmI58KNItIFvz/14/FEYED+67dZMHjDfjwz+2ixRcaZ/GoQF?=
 =?us-ascii?Q?y8tCxsGo/xJ3JH/kAME3OehsPo0W5JsYOmn8nn9aGivzetmqwDQikcpUVuP1?=
 =?us-ascii?Q?xh8Ubais11AMBuBVpBCWN3Pk?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1353b1e1-2f94-487c-bed9-08d91b9ac295
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:22:55.5502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J8UXQuwsN+yjFXW1blxUBm2bBGAoyK5B2ev6DvN27kBqICAiinwJkXMmOfm/7cqvfXp20cZ2CxqDVY9BOVECkTnNZqFZN7eMHjW96Q5UJg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4072
Received-SPF: pass client-ip=40.107.4.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

 - use shorter construction
 - don't create new dict if not needed
 - drop extra unpacking key-val arguments
 - drop extra default values

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
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


