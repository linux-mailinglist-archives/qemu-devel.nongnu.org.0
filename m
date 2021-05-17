Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD9B3824E8
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 09:00:30 +0200 (CEST)
Received: from localhost ([::1]:40232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liXEq-00040F-3Y
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 03:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX0c-0004Ku-Pz; Mon, 17 May 2021 02:45:46 -0400
Received: from mail-eopbgr10124.outbound.protection.outlook.com
 ([40.107.1.124]:1412 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX0Y-0001ta-Vx; Mon, 17 May 2021 02:45:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+7w5s3zjQvxJVmaDNTwrQAzUh7cWughYAFoyR5byd1sjfdGw25la8ZevYMe+BWL5OduZLiTCEpwC8eH5Ksai86PS8NUDZ/BRn6p3G9HLmPvLS4b1/vRYnwqOLRn7GPnXBGJkBS9+sVatcyX2a0cNs01G6RFTyteJvAmWAIx54FQYnSLfUizVnCZCE6wQq6Jwn0G9i+QQuG0AfACfQTBJQfzPciZxf/RJ3n2oSA6uKDJoWy3zhREXDte23WfqABQYY5rMFTJxPniRr+9IeY5BZ6hr6l+ioDga4T2o1JhFTjV1uGyPWTQC3/R7ciH9bH//7PtReU+O9NOOjdIr6sLyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBl5M4xP40hzq+CLa2LCYHOR/OX7Lq/Rq/X4O1t8gbU=;
 b=OpGpG74tgj9g3HYDijT5coY8uOiP4Ej6RTlhWzDwBHEEnUjgIai2E4dprAgL1BU37LWTLFXfy/00mOHV7hHNrrt16w6KtCCSYP2k7rgqaH66fy69szMtf4u3ixWFvZ3csfi1qEwK5DZINDApg7LbISosz4m1/1hgdYticN30nGHcxO6JexjthYBZMo3JjNboMcqrdR/yt3Ar5kWrJN2YwJ1xkxdh2pevsokXksWCoNI3C2cqhAlb5rWWeZtnZD9a1k73paawMJ81SuJw3apDmRwGkA1AysxQrhcsReKnFQ9go7sK7yDgeDcGr5jCWovGA/k+nsfzdHm2y3BZX0xcIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBl5M4xP40hzq+CLa2LCYHOR/OX7Lq/Rq/X4O1t8gbU=;
 b=SmRcMv6dooidQTxxkIEkGfgFUXS0k7eoKUBYjY+MN1cumUDt2KaL5u/ReyTsLrP6VBlkn0MXZp8EGU+R7ytdfEGXWbPxKIH7P3vIkr94IgjDMkp6tRngP1XGYXBaF5mH1Tu4C0+fuThsjdQXSJED8bOK8PBW/W/9/2+IOcCaWPE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4341.eurprd08.prod.outlook.com (2603:10a6:20b:b9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Mon, 17 May
 2021 06:45:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 06:45:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
Subject: [PATCH 20/21] qapi: publish copy-before-write filter
Date: Mon, 17 May 2021 09:44:27 +0300
Message-Id: <20210517064428.16223-22-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210517064428.16223-1-vsementsov@virtuozzo.com>
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.231]
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.231) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Mon, 17 May 2021 06:45:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b44c895-d7e3-473f-58ea-08d918ff5258
X-MS-TrafficTypeDiagnostic: AM6PR08MB4341:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4341DDA211B472DE045150CFC12D9@AM6PR08MB4341.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pmmVVfMPgO6pbrmfmRWt7fyJsXRLEDdB/ezLOYFBJlA6oxznN+d7nPvJztuuApbXsBsluR899joMVxcImZnZwd7lsvqr/L/z1akxR054naWZF7I9iY7amchhy9xGRVQTjH6YSpMzOjK9EALtXool6PMCY5lMEEUGB92f5IXplosvd7Rq8qQh7dlspcS9QPbt5ZHhkPQYVTQogB3f6mr+k0zLVOMZWQXewO63NJv8LHU0Is8gNKJRjb7maG7wui1fZFOLAWJIllCCdlUyql+x/wMCh7GohIHnjrj1pa+YRCAnhEeTG5crIqNf+YLqR4oeBRq5tpHa/lGp1aR2EIItE/qcId+pYZP+6NHPi16+grN3Zs0FnuGdfZKc3DXX8Z3uMGC6qtxaINaTS74LX8tVpPKcIFwlfduS6IIXFIeXfwXnta/qiXtIfAsTm4a+IwVS+tAoRDU79oI8cLzHihvlM+trFydFbdwvWsqC9ld5Rtz6U/hErhTYFexVrQJBj3lZDyR/chCDHQ9ohVXk1pRlwg47rwRBiv6qmFmD/16slaV0lpu664ogb0zwydyW9FRAYdqOGKO/njVD68SAfl8wOIXG70RRycrDBFRec/2BWyPXDnYbYXAUEE9te7wRAX0yBUoE8WSSdA0y1Bl1q8XeVsfVj3VoUK8KgjwCnEvbfpeZ6pvGSS+/JLDB479UKtvQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39850400004)(396003)(366004)(1076003)(8936002)(316002)(107886003)(4326008)(6916009)(6506007)(38100700002)(26005)(8676002)(5660300002)(86362001)(38350700002)(186003)(7416002)(2616005)(6666004)(16526019)(66476007)(66556008)(2906002)(36756003)(6512007)(6486002)(956004)(66946007)(52116002)(83380400001)(478600001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?JpfMM3MO35EdfxYOsw9Txv7dKzJ4lPafZr4aShldEShi0pT2jp0S1pnMwuz0?=
 =?us-ascii?Q?XISrf8Fl/1Zuq/j3OqDupgCv3anqzpyz25h0tDRHGGfKXMJD7bTNF4/0B5KD?=
 =?us-ascii?Q?rrk+3rT6q26c4qZDZr/sYn0Yshk/+vflisJ2hWAAey9cKFCNJYwRLA2/Lqxf?=
 =?us-ascii?Q?eKpTwLangYXt00MKSweLDcFX2o9WbFHUOx71fJOnC5KMj8DCNLhR+ewoI3ZR?=
 =?us-ascii?Q?y9kTQEwRmBI8jVZoM6oUFOv/T0JMD+22N8r+0ysrv8xRvp69UuEs0uljXZde?=
 =?us-ascii?Q?VwysmvTf+4xLacVQnzAZw4TyTyXzw8JkuGYXJBd13Bym/bIIVurNMa/PDJuM?=
 =?us-ascii?Q?bfzD34MhthX9H1g0c7hAS5HH0mKYFuw2dIj1upcm62Yti834NXtHonULKlDG?=
 =?us-ascii?Q?ntIg3Z7xpwHdn2gGUVsdab2E+1kOrmte+K8PGHDEnl9bBSPK6Uuz9Ph2iXFa?=
 =?us-ascii?Q?PLuC25maJHi4GfXiv+0MiC+CC5B7NtRJWEBCBQRUZhFrUi7OhGS1w1RQlYjO?=
 =?us-ascii?Q?1Q9SW0HOL1kv3G8lKZP+/R4VgMZDxmiEekPDXDnU5PmhxKmHgsOVxS+AfJXI?=
 =?us-ascii?Q?rHFvjGXBmydYNvKwQEnhcAQe/9Wjk1gXtyN0GNHmK+2a3kBtSstunh1MiuYe?=
 =?us-ascii?Q?Avm4VSFpPcYdBL/etZhgWeaBuMCxz9+PDI6z3e/uj8TJrAC7l41i2z8s39/X?=
 =?us-ascii?Q?VzwErJ5wRsWg8S0/9RABZd+A7ZQh0LiOK/0rmxYSzhbkB0HbdBsdq4KLRV9W?=
 =?us-ascii?Q?UQOVmJX8LzWt6+WGrBRZPbpNBxUrTdyFtjcnVPFo3G2KUi1S9MqQDHcDTJ8s?=
 =?us-ascii?Q?Ia+lzhwKqEVdYAY1QHGGwG3bH1DLguFLkZdFogChRbxmnlg98dd2l644rUt5?=
 =?us-ascii?Q?5TXI756XJ3/dsH0ImddMDt6IIXuP147OvH6U0YIDtkKF7BTaSIumS02e90Br?=
 =?us-ascii?Q?t0cjBDGUEHaFJKYuihbIfMnEbL8xyuWHRyWwFn46YZEUoChXEpbmIGfPS22f?=
 =?us-ascii?Q?2GJcphRYCuR/FEoc9bI5o1Xy4/g6suln64RHmUaZfSZcC123PP8d6oUwMakj?=
 =?us-ascii?Q?Gxj6Z1RBi8Pn8eqD0IfGKLAfH5sZEEJSpB1dxI6dnZEyrwrK3osOqSZEA3it?=
 =?us-ascii?Q?hOmNrTEK8aY3dDNWly2Jop402oIRvYZ6yllG9ROZKC+3cQuSmX6tfRTUCLbT?=
 =?us-ascii?Q?RENte3/5//yg+jIVYqbQQ3ZOXJGLXD64DnXSeYlopvFYoIm8z8zK0Z5JXedi?=
 =?us-ascii?Q?9QOPZs52tdI+1Bbzftbt9IvoBTzg8lp8nYnEUXuNW5anwD1okX092n8WSXX2?=
 =?us-ascii?Q?P6pLp3CkNliVjLm52jMHHtD5?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b44c895-d7e3-473f-58ea-08d918ff5258
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 06:45:12.7740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXJyjtP7/adwFppyZcTpqctHEzHeNUxaynoR9xCAnRe4Hozedea/wYd6JyerHZPdA3/5sV15iM2N1WEYkCMOuv7le9T/wIqIkWCsjtZK6Ig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4341
Received-SPF: pass client-ip=40.107.1.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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
---
 qapi/block-core.json | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 2ea294129e..f8fbcb6416 100644
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
 
@@ -3937,6 +3939,17 @@
   'base': 'BlockdevOptionsGenericFormat',
   'data': { '*bottom': 'str' } }
 
+##
+# @BlockdevOptionsCbw:
+#
+# Driver specific block device options for the copy-before-write driver.
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
@@ -3989,6 +4002,7 @@
       'bochs':      'BlockdevOptionsGenericFormat',
       'cloop':      'BlockdevOptionsGenericFormat',
       'compress':   'BlockdevOptionsGenericFormat',
+      'copy-before-write':'BlockdevOptionsCbw',
       'copy-on-read':'BlockdevOptionsCor',
       'dmg':        'BlockdevOptionsGenericFormat',
       'file':       'BlockdevOptionsFile',
-- 
2.29.2


