Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBA43DFE71
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:55:04 +0200 (CEST)
Received: from localhost ([::1]:60552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDc7-0007WJ-I5
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMt-0005Za-OH; Wed, 04 Aug 2021 05:39:19 -0400
Received: from mail-am6eur05on2122.outbound.protection.outlook.com
 ([40.107.22.122]:62700 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMs-0006MN-7J; Wed, 04 Aug 2021 05:39:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0mb33k7CuOeUsReGRJ9M9wJ4JrnN25f8/i7wvl5RPdXLxBx489KztPqMXB+bogdgfwWAEug3TvEI5n8SFUUpyiaD6HbN6adg0hqVnZmMhAhteNE10TX0QZxv0yMcxf4vKsrV+eOf6OWhaYpwiN/SPO7/SWpDm6UnTin6litmOp0+Z961lIz9U1GDXjLd7cQjdCs96AHad+zBnwU0qkArvPdYyzCx6MiHwQFVUF8gi5tOhRxxZxXkH9xVSP3vOlHlqjzckRr8eJGrkDbQVWN71FQefiQwQwCGc0AtERX27Kz7FbZRjPgMSqHhi2Q8K8mG9xJDtLiZjhT7OOEHqeL6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJuVZ1kuk0Wl5cOGUuwIXKMMuQ9XY9UDNeImIl4AjmM=;
 b=Zh2MWe/0f5tGC27Tsi70fqd5V/kSoWYODf56SWzA83pWMi1+2XrGqDAqY4oQaZKofyozi+sTguc/HRB5kaeAqtNJliSJfzO1Q08nj8Hpay/QAY+8SKkNvx/MX9bGIcJHXHhHUVEx+YtZFQkzFrifVgZXY75rMJUFB2NOb8RbWtq5bo1mz2tTivieRUyrql7oj0qRNuiHIRQeZis8cOtLK1QrppMDOAoJexETtvbQWpgByi2wpkg7aKoAEMBgX8cYOkWMkE3Vnt9MnH9svZzqH6GfyxbXx5TVezJrwnk/BCa4jybM1nq9UBnPqjTJtZYVQj9RaRmtgWZyTTGWmyI+Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJuVZ1kuk0Wl5cOGUuwIXKMMuQ9XY9UDNeImIl4AjmM=;
 b=lnJE9VgOjAVMPxG2O0CsaoY3lDfskg/2oiedBV+8TuBA6x/CsMlpSQMe+xygwrym1sBff8I59bWPqw6Wa+Vsk1XikJFbrXeYjyYgYwdYPouzu5UP5UktycqZSWHy3Y+gN6HUogRBapytzLI65eC2plPjBosKFXezFK6L28bDKxY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4689.eurprd08.prod.outlook.com (2603:10a6:20b:c3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Wed, 4 Aug
 2021 09:39:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:39:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 24/33] python/qemu/machine: QEMUMachine: improve qmp()
 method
Date: Wed,  4 Aug 2021 12:38:04 +0300
Message-Id: <20210804093813.20688-25-vsementsov@virtuozzo.com>
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
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:39:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c286cc74-3faa-4d83-5029-08d9572bb6e0
X-MS-TrafficTypeDiagnostic: AM6PR08MB4689:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4689FA53FC35F6B996C68351C1F19@AM6PR08MB4689.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IwZp+zIRH5XAbGz7I9/ygXU0UF6d91hP1pk7tr06e97lDNFXekJojU3NXOUveMyM0SjM0S+lvs/vGKL4BxQ1Eow20e9gujq+KiRtZmZnt/glsJsikXXibCdjN1aMnQzrjUoQhwgrjKbHdJkCZ9R1jB7rkZK26yjg0U3aTjewWRqJOipXjkC816A0DXeNf+RIsTVysRo6RPtvq64DanRb7P7v9zBYzSbIx02EfO+6TSJOXosRYUZymM7BKX2E9r/b0SNs9PsDC3HsXXO6Q56XlyIxVNdS50XzwQlZDQuOkiN/6xD2Bs9Par0psXqZEO8SDDHXYeCVj+rRoQ8uG+22DK103S/M9BYMfYNxyfo0dg+laR/HK6kMkFGQjMEroQTasE+hajJTb8Bf41Sgy7xGtKsC9bWV6/6JCLRxjubMnoTnv6tP+jdbDSu0iwKFuVyietkd7nfMKyYqOtC98/OV9DtTjnteIBHUn3/YzFmyhMgd1S6L1eYldEyKfY5yePM4PnKi7F96gL3HtSR3o8Z/AI0b0ubSYofcfZO0EwGgEpiJiYPdGObictYiLeBZ00sb0n6QEi3O31I4EHERTT9lSCMCHz7jvNyXM2i1bsczpOJ+CumloWYqRwW4pe3ib3JB4gKAHijIZyDI4oIwcLON+Mn1beKHb/Z33A+eKGwdnVnQseud0pHAOEQ/bNM20iY6nM3VorlDdFhhSFQo5Plt+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39840400004)(26005)(186003)(36756003)(6486002)(2616005)(8676002)(316002)(956004)(6506007)(66476007)(66556008)(6512007)(4326008)(6666004)(5660300002)(52116002)(2906002)(6916009)(83380400001)(1076003)(38350700002)(8936002)(86362001)(38100700002)(7416002)(66946007)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xB8DYBq1JhtTO3giepnxJMUO/Uwv6IxCJ3K/YOsKGrtczmgeB/A9PYbbr+PL?=
 =?us-ascii?Q?Cgnle5CcRGeKop3bjfsyF3ojxuSarbRiYj0FUJOVG+R7yLe7zmXBpIqmmhDR?=
 =?us-ascii?Q?eAn/rzPAYAZ+wnu12gWALK0uB+9V0x9YxAbZ8Qb39xGM5XhS8D9yRKbpgFTX?=
 =?us-ascii?Q?OQqr9BEBTKEqFk5U60Krx3+N2OXuB9ZgEQTWNR1e/qzwAIM1YSy3GiJAoD8J?=
 =?us-ascii?Q?92jPhRbd4BylvVgAgAg2haSkUMTW71/Tl7ENFo78x1Ajjs1QQ+F+su9Ycwab?=
 =?us-ascii?Q?o0+UqDb7HUpIKbGDJiZJFm2/cARr4dIpZeTAVh+clUpUGOkdwqeSkVIst/ef?=
 =?us-ascii?Q?ZuuJFXB1dN7c3nzoJL1WFowfMMvXPbGseRXs7e6pANeQ1PAbp4qIajJdosKn?=
 =?us-ascii?Q?nYKvsiBZIFTxqMf3PU9EwDoQB0+jdvbGos7iKaLX0yVRf8c4WYjlq3cJ5ERJ?=
 =?us-ascii?Q?bjMrmOy3JcUe56pMjCMig6SA/VJ6DfoaA6TCyN655vfcObIqyG3eta3RUoGQ?=
 =?us-ascii?Q?fzkLcVmsCx8OVU6C0Q7RiPjm8d9VaZTkCpKxXyamYV0o+BVNsP2sDUHnB10A?=
 =?us-ascii?Q?xbiAkRqvNzAJHBdzb/hdbxc1N6/Fimoi1enzqWCOWT3XBenaEdBLsOiAlkVB?=
 =?us-ascii?Q?ebyILbs/SY/m4VMuBESIamwH4RQrrRNr0HBSW4TTSP69anpR4A0cCGqtz/D3?=
 =?us-ascii?Q?1U1T+floh6XaECRPsCJPCcxaff7uiSY3u+Bql76s0RQ0hv67685y+Oetnpk5?=
 =?us-ascii?Q?CwSsBznevytVgDUexxv+ni/JfKSuM407OcsHht3CuhZaYSi1gYQfu0ZtFV5c?=
 =?us-ascii?Q?OS6o1ZrW0dtvafDOm6MOidZfH2wpPFYaXNFOa4Tg+NpVJWQUmWAcqzcC6LTQ?=
 =?us-ascii?Q?UT24Ij00XcG1dzxZPrCnLvc7yrb10TwmEXT1ALXb/AhIzXoaUNVsABfQ5c9Z?=
 =?us-ascii?Q?mIKvv63ILNrVpeBQPN3lhAhBvvDBV+vOs4BFLRVO1oK+CsL2ybUzLdN/k3Sc?=
 =?us-ascii?Q?U+ppeJykirAaKHESpNR0SSQUHzqzhgktsj82NnMRt1u4LbzPhaLF3FHcE6yO?=
 =?us-ascii?Q?zPl6Rlh7l/Z+SheS4GIeRHL8X56YDu15g040xSI8qtL/CEHmt867fm4KdGjY?=
 =?us-ascii?Q?qJQSQEehpjy4r/PXd3eMX+5ghKesZfk7Rtx2A/lfV+jucVC91ZYhZdRrXQQC?=
 =?us-ascii?Q?pJ+Tcl3V4s2cA80vsfWADtAH+j1iRCYiPGpAkOFzdgHBhMO8h+0efOskb0Us?=
 =?us-ascii?Q?VwW7qVhsMWwCWcGlrpc1/i2L1oUkZZZCSY30qFhu0ftFGhJLNtAJc/OrrTJS?=
 =?us-ascii?Q?oYSUifQ51BrK8Qzy3k9jkuc2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c286cc74-3faa-4d83-5029-08d9572bb6e0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:39:11.5190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vYyVfwtTfqHO8IC5yhp5dGSSditZPcVU4tEoD7zZDW86WPX+byqLjhjsXG7VV4QP1v/vQBEdKp8DdLso1+cMYBK7sXxrWRG45QDONC9PzRY=
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

We often call qmp() with unpacking dict, like qmp('foo', **{...}).
mypy don't really like it, it thinks that passed unpacked dict is a
positional argument and complains that it type should be bool (because
second argument of qmp() is conv_keys: bool).

Allow passing dict directly, simplifying interface, and giving a way to
satisfy mypy.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 5eab31aeec..ce1e130c13 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -572,11 +572,21 @@ def _qmp_args(cls, conv_keys: bool,
         return args
 
     def qmp(self, cmd: str,
-            conv_keys: bool = True,
+            args_dict: Optional[Dict[str, object]] = None,
+            conv_keys: Optional[bool] = None,
             **args: Any) -> QMPMessage:
         """
         Invoke a QMP command and return the response dict
         """
+        if args_dict is not None:
+            assert not args
+            assert conv_keys is None
+            args = args_dict
+            conv_keys = False
+
+        if conv_keys is None:
+            conv_keys = True
+
         qmp_args = self._qmp_args(conv_keys, args)
         return self._qmp.cmd(cmd, args=qmp_args)
 
-- 
2.29.2


