Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E73313DFE88
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:59:20 +0200 (CEST)
Received: from localhost ([::1]:52288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDgF-0003yA-Ul
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMx-0005kv-27; Wed, 04 Aug 2021 05:39:23 -0400
Received: from mail-am6eur05on2122.outbound.protection.outlook.com
 ([40.107.22.122]:62700 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMu-0006MN-Cc; Wed, 04 Aug 2021 05:39:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGZMUSpkbIu2MSLcS2UPciFhfLQo+6G7GKywVbDUOdz+l9UCn8gYwz3cLwAG9bbQwDgKHOAqQBmXNad+HXDCldmCK3bLZWAsFk3SvGBv2mPYWFsJ1eY/4p6LDoan1xaZMUga0hAlVSO8/kRvBCjaSxg/2oigchnQMq1XMUxOomcq16bOIUa2HHGQFT5S29vgh69znl9vB1aeIU44waszFd7Rkk6n9fahKz8mF6rBlDhjZRcvCDuIzfsMDNeDbGFKB8dyZKKhnkFVFpwTOSfhUnQQSoSs4qZghezx3l39cweHLMLnuM+RfNr746TSMfwydByl2yu8SZYcxtxkvXkG6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7B38eMa75IHaXy1CHdobFWRDMprMUUEh7qz2TZeq4M=;
 b=nq5bXeDWB0CT+La7YbmHI0tZ1HKi8dIAClsdepomh3dKrffk/0rcnL5YgWkKL8AgyPXZZm9m89mZoQjQpUaAkGG8Lp/2EoLakArD5jnO9Esh/tBrruyT2miI3JfXoKyC0Yg1okVOjzf5cbvBHoykxS4KMrRQZ84+a2OIaV5TfbTee8O6kY25GzMUd1ul1wotZQYpxFROmtHnj5Nn6uwZ7WIhkWAcsfStYJQ4FN/EeFAPG8NrlA36S33XQPFyQCXU63ZnCAXanqayvrvdzDGsdy3933Pf6IrW/uH+U6Q74cByM+VAYB6z3npsMY7v1CBDbLbT/QBeNo3nLHCqslEbdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7B38eMa75IHaXy1CHdobFWRDMprMUUEh7qz2TZeq4M=;
 b=NIIuFTFAwgfYxQwj5dyY2HN5orOe0ULqKF1rO/rKrPtTBG7ROtbClDh6NBwmNn3f+tIGIkv9ZCQ2TKLl5fO/zdHnA4P6Wooy/zmUZCo5fXCOzETWR1UhIm374aDj76OAENBBvkn8LHIg4Mz9eGVbze3aZxbBzdNa1pOmc68jtj8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4689.eurprd08.prod.outlook.com (2603:10a6:20b:c3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Wed, 4 Aug
 2021 09:39:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:39:13 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 25/33] iotests.py: VM: add own __enter__ method
Date: Wed,  4 Aug 2021 12:38:05 +0300
Message-Id: <20210804093813.20688-26-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804093813.20688-1-vsementsov@virtuozzo.com>
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:39:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11bf1e64-0c34-47de-6293-08d9572bb7c7
X-MS-TrafficTypeDiagnostic: AM6PR08MB4689:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4689C82DF9D16607B1814EE8C1F19@AM6PR08MB4689.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Vetyp5j/GQtA6Lb85bK24zAv0lJ3spXC/pboiZJCC2D5bnLrSsfkOS4HICl3fw3inr2LsOHtVRN+/c71XOvgs3O7WDd4nWGmQwEJZX/A6TNvznNUH8EIrWnMo4N2ghnyKmq+2esL7uCNrauzYF6Jua9jRcZBxrJe8B8CJFXXXSym8DFFCIQcSAKGywj3zvU/z81Eko02IiqErgwwdPbswWHki48M2SflS2FlW0+zypIK8iWFvtqugP2kg2yJX1PgOIMch2Qa7H3AQXR1clV3fv7lVPS0JCxqCsqf4ifQep6El23P/ltvqXWiP8fe8bDvdjSCEZo9pTMTmrXq37Wjl/TY5vNkgRUMmvoCKE9o7jr9i7seyrKEE1CqwCilRA3drgbQQuu3tfUNWb/xgleopgW1IwTT1YluVJh76DyZUyrlzeRPoc2DQKUWsizVIY/tuVFcI3J1rDc+S1n5lqqko/G0PlG1lb5kpfgIZ/uPGFfRw6yfyPVw68+jvObVJ4P1wSRIdAxUCq9Bz+minXr6asr2MvPT3Fov0bkGmMmPrEdGcN4sLgEeWhrpr2iZwY5gXfi2Ug7yHrNSK7eoackwWuO5MPQFpG0eDJX1dlmZZYvjTuAVnFNyXxUcMOqap0Xbdf9nGmdPoSEwJORWh/0Fp5wonoYs/OA7YQs/3J9WKg98rGtidCwWoSNtnwo3th8S+tXhwwetKdYZ3EfleXyXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39840400004)(26005)(186003)(36756003)(6486002)(2616005)(8676002)(316002)(956004)(6506007)(66476007)(66556008)(6512007)(4326008)(6666004)(5660300002)(52116002)(2906002)(6916009)(1076003)(38350700002)(8936002)(4744005)(86362001)(38100700002)(7416002)(66946007)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p8+OXTMXBaWrHWNpbJeRf8Qpc5eYoW2cws6bKdMOgWXP+rhkoazAA8ET1IU3?=
 =?us-ascii?Q?wuCDaSfUVdY6GSR7xbWC+3JrWwBtReXGFjHNB0Y9hLG5cyl6sd2j+ZSUeRU9?=
 =?us-ascii?Q?Toeo5eBBjSnAOcU57IF6ISmL2m+mfm4rN4X8AcT35k6kLVKPCJPiQY9Y7qGJ?=
 =?us-ascii?Q?hutoYvmE9PNeOo6yGdGmwpK/xnLPYMIHuxN+yFDwudQmBoW95erVCV90IkYr?=
 =?us-ascii?Q?11ccOfiFcMVdJLeuU82MdZJDZc0ZUijHeCQObHldScNYv4A8y5Cbvc1WpnTC?=
 =?us-ascii?Q?KWtI+qiuT1spW46bnGjIR9EAWOJxWNSljiKLiu86ZNWiJPIqfAftrObVXiQz?=
 =?us-ascii?Q?jClSb1gxZSLs0ljAT4mviJXmZC2tnFh/ArVvSiu8xSQ4Ddr/dRwBcsUI9D47?=
 =?us-ascii?Q?Ay5dWIMxw0eP+JSV1rUx5eN4TVCYJiQRLd5GbLoh0TYdi/7amXl5ImZB9fFc?=
 =?us-ascii?Q?2oo2MKkz6m17SYVKu9SMErSojTzUNWVQPD3jOsBp7rQJTZCEpPcm+o1yq/BI?=
 =?us-ascii?Q?nfZzclhDSHTloiQP5IB24SZfjzyriyZT1ldkwsFOEToQKquirJLQOOe2gFG9?=
 =?us-ascii?Q?++/qNJ5jazY2rI1wgplku6tdJy+PvLFqI2c1sN2301k1ly2NW2wPUxiSrzMx?=
 =?us-ascii?Q?UP294nPyK7g65bz1nPKDFQp4TL8Q/wzFpsC5oRfnVcUylAelu3e+3F2+bbpT?=
 =?us-ascii?Q?w2HAq25T1UJWIp0Cz0IVWJvrS/1sf2eTPRcDsm4H/E3oIVAmEJNgYfnFnyT2?=
 =?us-ascii?Q?hAczyqEEQiTS3YjlLpGhUBsSyAUMYWRbOlPNOrPuxiNp0igb2iGvGWLD51SR?=
 =?us-ascii?Q?UUJ7jLND8w5gLpQasT9/FVY69QIRrPba7L+5Kz5mElELrhQ2lDUasXYCl7Ri?=
 =?us-ascii?Q?iJEhAu+1MBiM88do96o63NnJRt9K9ilM4ZY4igmL8PmmRz/rHD173JCbmwKI?=
 =?us-ascii?Q?jJyhB67D8FXvePTj2Gv/rSy0nhyX755a/TY9NmS65O+oqu34GJfaeKk2//w0?=
 =?us-ascii?Q?3d+eqHKvBHB5jN1rPbZVo0WFVd25z3SSB19a1cg5y/kqJQ9e4A65sgK23vVj?=
 =?us-ascii?Q?MdoBK+NqqlE3UYPccPaszw3or8YgpQ6E3lQVKoufycJILHkDlIeY0oMwO2vs?=
 =?us-ascii?Q?lNAZ3s9En2uH3WsAKn9nhdhpAFTCbYe9G8r0jXYbPqFPau2vz9LZeRZV6Biq?=
 =?us-ascii?Q?CBYu94+5TgVJMfPrYiWPf10Lr45386LNJAG4/4ExcWlVsrgi0pzSvdb54TwG?=
 =?us-ascii?Q?9N1N5BisivIxQvThuP+z0MFJKOm440jMYSd1oYwB8otnwlivr/Ki3CpEb3Sq?=
 =?us-ascii?Q?4geITyrG5Ph7llGj+AW5xyiS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11bf1e64-0c34-47de-6293-08d9572bb7c7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:39:12.9776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wK5aWxATS3xqP7QmX5y1FFFnz2ygfEsFEsn2w2GCsJTz5le1Wfp6bJUmLW95WgbJBROS4YrPpw8Gkd4hqGWZaulvP4wHuAeDylgGKrBxw0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4689
Received-SPF: pass client-ip=40.107.22.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

In superclass __enter__ method is defined with return value type hint
'QEMUMachine'. So, mypy thinks that return value of VM.__enter__ is
QEMUMachine. Let's redefine __enter__ in VM class, to give it correct
type hint.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 89663dac06..025e288ddd 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -568,6 +568,10 @@ def remote_filename(path):
 class VM(qtest.QEMUQtestMachine):
     '''A QEMU VM'''
 
+    # Redefine __enter__ with proper type hint
+    def __enter__(self) -> 'VM':
+        return self
+
     def __init__(self, path_suffix=''):
         name = "qemu%s-%d" % (path_suffix, os.getpid())
         super().__init__(qemu_prog, qemu_opts, name=name,
-- 
2.29.2


