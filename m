Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF1839789D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:01:43 +0200 (CEST)
Received: from localhost ([::1]:53886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7lu-0008WU-3L
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7c2-0003JU-MX; Tue, 01 Jun 2021 12:51:30 -0400
Received: from mail-am6eur05on2127.outbound.protection.outlook.com
 ([40.107.22.127]:14240 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bz-0002Cd-CF; Tue, 01 Jun 2021 12:51:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPruwFxrGeo8fMfkvXuz5c+F+4Z3geRtrKuXmyUaVC5ki5uKONUC8BRAyLowhxr69Z8xwhylcXw2/DOxlxPVKHTaP2YHTY1s2S1syegldndUSetDiLy4xT63mG53MBeyYq9zYLKXJcZwGonypH2LnYjtkIkvYDPuRtjNmfQBu6v71PlvFV1MWz+ZjjytLCylPIFkQbvx89Fuy4rkaYIE48ZDVcPOwsCAoHMnyf3ZyyW8aodVsA0WlGFUAvNdz10qbTIt6W6xx1yH2kh8ilip5iTX+BnxtUOpRlvtyqo+80/Hv00c6bYOQX7sY6/oCj0q29irt+Rs+1ZUJtxxmH3k0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/p/TS3XFcJAs/p+Fn61YsyKL9qKv/v9dt+kfqgiTOw8=;
 b=TkdKsTXNyt3epMl0UknObrNyl9C2QkhXyasL1/2ctoYr61uZyvauWruc/Jv0XnvfrcUltd62drv2o1737EGC/Co8mW/1udYNWwIzJIKaEPuYd3/3o5P6INFU+y8DgJKvethtQjVdu8Sm+xYg+c2aP4wb4ixIiccO/UDi3QI5C08ZstUK7lgCNJ+3y/R+slxylks/3JD/mwMKp/zne57P3wDwCajAEJu67wUq7UjXMd2B5B6EM4zibpIrMhrpcI5Ffbj0zhhjYAedwt70nEVny7hjdtsdB+wcrxGiUZySG4Fje7yzwA3YKNf1Ndc0HpZvkKOnJRmr3AtbcZKkrHZO9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/p/TS3XFcJAs/p+Fn61YsyKL9qKv/v9dt+kfqgiTOw8=;
 b=HpdkArmMaP50R25qfVT4V5Isagb982OZIULHoG4Er+BVd2jglbNSuWEy9GAH/KuJ78kTLGhH7pkq7dWjT8AfkK4gYrvV8Ns3rmGErB8XXLkIE+87v85PGQiXwneuShccdf9ki6suYHOQhZ66Lgn5z1pl4GgYEeeWswtho2EnlOM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1972.eurprd08.prod.outlook.com (2603:10a6:203:4b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Tue, 1 Jun
 2021 16:51:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:51:15 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 24/35] qapi: publish copy-before-write filter
Date: Tue,  1 Jun 2021 19:50:15 +0300
Message-Id: <20210601165026.326877-25-vsementsov@virtuozzo.com>
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
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:51:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8329179d-638a-4584-df20-08d9251d7848
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1972466A0E5ABD397C3F5C81C13E9@AM5PR0801MB1972.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QdYJ7CG3TQesnQ07EBi6asqK0sA2FR9M8TpfK7rY3n9gsu9L2GLgEgeXazAeXCmCOGdrfWEcuXUWdfMYLH2nK2tWahV06a5mLL2GcO5N370WLTjua5QwJut9oorw2Ry6DliO6El+yKEai4ZBoJ4lbEmSgTLF4gNZsSIZse7R0ZoYhrrTEJ5ODNokgUwTAvQnE5+ML6LZBTC2+Rfcj+YRql967zaU5QdcCLNqMW/547pS+fTe71775SEDaxNxkbDtnHT34/m8EXOOZvbuW6G8xJNuaZVMwAMSMTO8IssADRt0svDcExxC7FOTS+mm4nQfJOWiP604qKQmzJd19UVWyIVN1Lzv20766sm6/fpedNMTUYHaj9OaBOwJ0Vkwl8DxpWyEHAQr6MpMxjf+dbYOyhkCXHcKy1cAVNEQnSTrhpxau4pbAN723JYnDcbX0VzRyENpwLUXdIh4t5fWCWJ4nxPBpN5cFMrc74sIChzq3OCtk2ek0ZstPh4+X4uMWf5lfeJt5UpTzlg1gD3neyiRAkDSlCQ3vRz8P1e9DUz/B9fkZHG++DyKEu/rNSuaH+LuWjP16rOf5rAGJwu5Kwe4JCrzsWvqwUWjYXiTemiwxLDyxqEJwPAvtk4o1jHn7CQceg1tyeRa4rLsdWVAjJbN+Tly8tlPJvhzBMvlbxaU3AMZIh/7uCkGP91yXCSzC9k7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(39840400004)(346002)(52116002)(5660300002)(2906002)(478600001)(26005)(6916009)(1076003)(8936002)(2616005)(6486002)(38100700002)(4326008)(16526019)(186003)(38350700002)(316002)(83380400001)(956004)(66556008)(86362001)(66476007)(66946007)(36756003)(6512007)(8676002)(7416002)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QiZC3G8n+FKPKfWYA1Qnvm51KIgsJRaZ8nOitfhLoUOG3v2/40frSdBzzEap?=
 =?us-ascii?Q?xm/xB6PYIQDv/4MCaq7lRXGDpaQsBrbgEmqqSa73tp8ljPthVSdoA9E+jHJH?=
 =?us-ascii?Q?XvJAuz//GS/tEQQr63g9nqIjgPl2YRgovNmuEWJQvYUB5zIECP1U/Eb1SuTy?=
 =?us-ascii?Q?1YnfT1ImFvSRy7jscG4C0m92gcK2HgpXBHmWR1oiuv7Bkb1gYwAkw8nqDMQp?=
 =?us-ascii?Q?Dlo6n445pj9tBPW8hdWV6fYW//9Rh5BuxDBepItrN1AZWe0FrwEkrOx1VeLP?=
 =?us-ascii?Q?/lKuK2Nw0GBDngKdoQRJdJJB5I/evaoevjCy1WMNbg7eXtBKPMfzaXbekSE7?=
 =?us-ascii?Q?KHW62lcG5TFB0j6gS/2lxPihup+UiujPAVa0AK4KvurY7NpbfgO+NiFcbKoH?=
 =?us-ascii?Q?2G2VAPEvbr2pkyJzp4GuEZddAF90DPkoJQN21l8rBM/Eb+FyLWDehf/es8Gb?=
 =?us-ascii?Q?5Umu00k3ioBFEUvyJNuOoa1Q2yKQ/BjtCflV3tmTe7pQuV0YNEJZffDEfvIt?=
 =?us-ascii?Q?zWyEnZ/qVgmqn4OZaiqzsVUxU7/6S5nulRl28KQqaBJTTm6/gHG+QRs3j7yN?=
 =?us-ascii?Q?HDwbkLrZQ0HmSJvtvPWmTJ+ooxOQL0MrVMymfzdWD4CPanKByOgx66KQf6yF?=
 =?us-ascii?Q?wKrKIb7kBEsFDQyI9gZYvICmygS8NJfT22UaTtZpRrzDPMelMUxY2kJHP5Ff?=
 =?us-ascii?Q?6SPJpKa+ZX/Z4aUcX3TNHgrW0tlpxEk1ziLxijI75nNdpgQa7I85sZxmyfB0?=
 =?us-ascii?Q?gfF/wPHEIZpbezpOTZ/LzLpYtOmwXmL3IyrgARxAGOgvhDX39nNPu00GETS1?=
 =?us-ascii?Q?vUHSkFGbelA0R62RtLeNjcppfV1zI44Z0elYIQBcFJpMRNuhBjeHdOJOouyv?=
 =?us-ascii?Q?YRScbV392ZKVJAUIhOWU+k+kHkgylAbQAUAKkB3p11rbv7W9DP/HcxNl6uIx?=
 =?us-ascii?Q?aZXhiDAxxA//Kfplqlb0hE9nbs0qCeuXUfrYDT1d6qrsAbRUGpfU6/ORiqW6?=
 =?us-ascii?Q?WSAftX4L0IaoGSMckdCHr6jIJwH1b+cwn/eELQyWo7eJiXcPvrun0cO4A68q?=
 =?us-ascii?Q?9EX489QOsCW8D3oSV7uWSVxr3erZMLwWi5Pir2J4N+5PY6Rk9pANJ9tgyAg3?=
 =?us-ascii?Q?t2l9zD8VmvW5B6khg+N+XFvRI768+KbdtnkAi46zF9TNqzV8p0tqjQlS7vvi?=
 =?us-ascii?Q?90a38HSxIq40Mj4AfQ57oy557nm/A63QSincYTDpYjVnP++OvZ0VWxqMUoHj?=
 =?us-ascii?Q?6n3L8UtVkogtUV+FkLtO1B/klsr9v5qnq4EDvsLjSEDhwKZeZteEJ/O0gr7C?=
 =?us-ascii?Q?BUHLx7Kudkvy2Tb86KGgW0d9?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8329179d-638a-4584-df20-08d9251d7848
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:51:15.3071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YgYcCU0aUyEkzqqm/dqhC4Vat2n0bcLuS95HTA7xLctSrLZnKbwrK6V4Q0F3PEM8PA+K7k8gllk7i+7NVW74JpOucZ5jCDT/KqQTHCIMvwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1972
Received-SPF: pass client-ip=40.107.22.127;
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 qapi/block-core.json | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 2ea294129e..6c1ce86235 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2808,15 +2808,17 @@
 # @blklogwrites: Since 3.0
 # @blkreplay: Since 4.2
 # @compress: Since 5.0
+# @copy-before-write: Since 6.1
 #
 # Since: 2.9
 ##
 { 'enum': 'BlockdevDriver',
   'data': [ 'blkdebug', 'blklogwrites', 'blkreplay', 'blkverify', 'bochs',
-            'cloop', 'compress', 'copy-on-read', 'dmg', 'file', 'ftp', 'ftps',
-            'gluster', 'host_cdrom', 'host_device', 'http', 'https', 'iscsi',
-            'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'parallels',
-            'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'rbd',
+            'cloop', 'compress', 'copy-before-write', 'copy-on-read', 'dmg',
+            'file', 'ftp', 'ftps', 'gluster', 'host_cdrom', 'host_device',
+            'http', 'https', 'iscsi', 'luks', 'nbd', 'nfs', 'null-aio',
+            'null-co', 'nvme', 'parallels', 'preallocate', 'qcow', 'qcow2',
+            'qed', 'quorum', 'raw', 'rbd',
             { 'name': 'replication', 'if': 'defined(CONFIG_REPLICATION)' },
             'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat' ] }
 
@@ -3937,6 +3939,25 @@
   'base': 'BlockdevOptionsGenericFormat',
   'data': { '*bottom': 'str' } }
 
+##
+# @BlockdevOptionsCbw:
+#
+# Driver specific block device options for the copy-before-write driver,
+# which does so called copy-before-write operations: when data is
+# written to the filter, the filter firstly reads corresponding blocks
+# from its file child and copies them to @target child. After successful
+# copying the write request is propagated to file child. If copying
+# failed, the original write request is failed too and no data is written
+# to file child.
+#
+# @target: The target for copy-before-write operations.
+#
+# Since: 6.1
+##
+{ 'struct': 'BlockdevOptionsCbw',
+  'base': 'BlockdevOptionsGenericFormat',
+  'data': { 'target': 'BlockdevRef' } }
+
 ##
 # @BlockdevOptions:
 #
@@ -3989,6 +4010,7 @@
       'bochs':      'BlockdevOptionsGenericFormat',
       'cloop':      'BlockdevOptionsGenericFormat',
       'compress':   'BlockdevOptionsGenericFormat',
+      'copy-before-write':'BlockdevOptionsCbw',
       'copy-on-read':'BlockdevOptionsCor',
       'dmg':        'BlockdevOptionsGenericFormat',
       'file':       'BlockdevOptionsFile',
-- 
2.29.2


