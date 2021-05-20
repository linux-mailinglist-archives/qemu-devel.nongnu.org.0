Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5163D38B203
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:40:14 +0200 (CEST)
Received: from localhost ([::1]:38056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjqP-00011b-BC
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljja2-0006df-W3; Thu, 20 May 2021 10:23:19 -0400
Received: from mail-eopbgr10092.outbound.protection.outlook.com
 ([40.107.1.92]:6738 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljja1-0005se-72; Thu, 20 May 2021 10:23:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2qznWBRfpVlqQelZn4Hbq0JMgeI1NHlouoHyq9FpkdP9i4hpGSUGQkuNc7JQ26pA4ULknRWXmNaKEq8nxZQxyK76+Y+M3VKACBT2R2YzD+RdIkm+P3HApStM6jq3TANUUeaM9+vt/S3FMl3aD72zYgXz8h/rBQNKN7AWWlaiPunF769aT7ft92W97dtx3BRHmoVM+x2/61ku2aRmsJk/mGVdJAqxFzjFrJvMf7jCDA24PjWQSQLSB6QQfuIwQuQociVKYWYkPqpsID98f4ZEBojDQqH9sPJa0GFSx3JE5g8AbFugLMaGkjkR0Pgd8ljATdP55MYjqQfFZ3R3HDJCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9BK0+EXKpsUU2pT5gSQsf6nPSCVz5+UlUSOWPbkdQs=;
 b=knEn4vLX97ZNAdtvlf+epOLMN336RKANGksf5sECjoru1cSJHltALWhMcM3psIFYIb6YougJNRlAPctcKrwhuvCsmeC1LTN9c9ya7AxDofmA01aMccqFowp+RHgPv0Scqd3WgNHyf6KGSVVnwRTakOnpWjym7I20E2r8jvl0n/0hh2+iRAh24P+wIiehQ0u1SS0mgF53FzEs1fCn0kwH2hE5n9WPi99JJLbHMmH5Su06a6rJf08ZHOuUx6YRM7nH3lpQ7GanKt+4uQ1aFoHVC2lFyJfwn+MhcBMA2Fy7fhxV8wWiE4REZW1ym/jHOK6Q9LWAGPzbGsDE0i2kryDLig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9BK0+EXKpsUU2pT5gSQsf6nPSCVz5+UlUSOWPbkdQs=;
 b=ptwOlRVO5gyga9lkw7Z9HKbYU7R0vE5WMX//gsj+yX26WiHVNrC/cD7ghoiD7hJMfQcIS3GHXgfNoj1Vde446yUdhGHTSiXTbq8/R7JmHZ2tTvWY7siEIcuyiJhKVNqR75XAacVnVP3P4Ugs8kHOM3B5PJLMw+Hf+uzjfz48Djo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4072.eurprd08.prod.outlook.com (2603:10a6:20b:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 20 May
 2021 14:23:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:23:04 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 29/33] iotests.py: hmp_qemu_io: support qdev
Date: Thu, 20 May 2021 17:22:01 +0300
Message-Id: <20210520142205.607501-30-vsementsov@virtuozzo.com>
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
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:23:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 915149df-45a3-4f34-91af-08d91b9ac7ff
X-MS-TrafficTypeDiagnostic: AM6PR08MB4072:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB407242D3EBC731E284A0812EC12A9@AM6PR08MB4072.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FoAdgiaLTc/FULI9Sk2CJ4tKnbVUpHmSeDImkDA4+5WG1oBzP1lP7lyywTLf4AkGAl9g5sjHFpxle2KY4G6/UaoYnCWBP5+Fa4gKvAL7//zv/EFixBnQRYtucH1lsafuk432NmgPC2mwdGoJEnFZ4cZwywW1pkx+SJIWNOif9tBVG/lwqII6D5lYFKeRCPzB3nNjCIdyyJUSBJMqBB8d8CBMAamKv9vnvMTKEUD/PbxXDkI03fuBZDNXnfI91o7vkjJ+o79zlsDOyIFwp2wPHtL91at9oackXjxiIJ9G2qo0YQTggYpJo/9CIa/7T6xZB/ZaFvNy3FYI74BnS8p3xKv7zZ33agBBym6mccA3JniWTXONb8S0zu2tLp1xEe9JXaUUKUfiofvT+kwF5Aq2cPW4Ko7EjXAGKDqj3HThyQ3eSN9/KfG1EEQSX1hiiUXRC0PMek+fa6kfugirGjCXyVurVBD7ouxTckOh5sEBZJj2sYHghWu/eqtrfz5RD//6zT5MgcEB1psSYw1Ylt6jN2Ebssm+z06K2EPYIJ4gednteccGlk9Uf3Aq/FpNGEdLnvl+XkEU3E1fmduRgYo1tUT4ryF0ntDEyISq3Mw0GnJIF1Ak2g9hO0tH8D23f24WYzbg0AOPsIiXIYqszpZf+5Se3DRT9qyeoDx2PIJ83HciHN8BcFYr0P1embVidsd8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(39840400004)(396003)(346002)(38100700002)(478600001)(186003)(1076003)(38350700002)(2906002)(36756003)(4326008)(4744005)(26005)(52116002)(6506007)(6486002)(66556008)(6512007)(66946007)(2616005)(66476007)(8676002)(16526019)(956004)(6916009)(8936002)(83380400001)(107886003)(86362001)(316002)(5660300002)(7416002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QbrR91F3GmT5VhGJZmItBFDXqFgtfMYOD6SzoG7C0nHOkOthIxRKbXvCm6yc?=
 =?us-ascii?Q?sTgrDPDu4Rdkhq/oeDj0VpaIAFnwuX7ehfbENx0S6XAHv3TFdNoRxmP0kIkc?=
 =?us-ascii?Q?DekgDOKhfdspZBoOUcDJBp6ddjkB8SeRTkdalBIIqkwnvSguYrB8WEyfppH2?=
 =?us-ascii?Q?OPa6vuD3R7K8gPj9DXhNtv1sN72vj1BvytWbHpSxC+E1M6FCcCYFKM9tMCA6?=
 =?us-ascii?Q?bhFB2sX3maKkVx2ebt2bp+7xQIAyBESv4efHeD9glcv2yY5gvuCBjpXydd4q?=
 =?us-ascii?Q?4hiq//ybkaSsCKHKgWKIX627wWfHZLL89nUia56rmhtGp/2LUR+vPx4JY/3u?=
 =?us-ascii?Q?jKFZsqvfl9Lk+8u9eDhi40x6nFNpRMrQYHwwFyTxaBIGIkJBXGtRn0p0Izhh?=
 =?us-ascii?Q?iVTXFxgxIZhzXMlDS7PPBpE2OHxkV9SV2azmlOeZLSKA6kQ4T+xoU+PI8vaP?=
 =?us-ascii?Q?MDnqH8kEp70vUmliAEl1UDrRmETaZNn2oO4MQJerszwhxaG1R5aFnLUqhsis?=
 =?us-ascii?Q?Z0VdPRAqZzu74sOa4tVIYV5zDztWLdrwX0ABAZ8CDJdqT79AYHagqYkNJSHO?=
 =?us-ascii?Q?tdMRZmDET0nZK73Hm9lwkmiVwQO6+9F6exSei/3FFpL0Hz8wAODfwARsEqYL?=
 =?us-ascii?Q?vOWhsuIGHhkaBpr4McnUYAggM+u6CnthD9bFCJpE/3K7hjTCgfhesyPgNoVq?=
 =?us-ascii?Q?XBxeGxXeCernNyNhzjg90kJSqNvkhnYMD1hLcXM1FXD3JTYhNY8Y/B9krLzW?=
 =?us-ascii?Q?AyAGDF3bvFi3If6AXUTS558LqguVVws9PQ/g5LnwBT6P2wu0kIQ6szD+aVS1?=
 =?us-ascii?Q?GvzaUQd3WJafuRBpxMaP6e/Urkq1fkveLVrO37sGw6rFVuiHKr8ElHYx48/E?=
 =?us-ascii?Q?HK/rZaY5vy5/vtONEWMYFhxQaZmiccxQlDa9IBKuU7YQtQ7JQ5nFfhI2mcn2?=
 =?us-ascii?Q?9Kc+MS65ItV6bP7qvPk/A7BF5T0XdwDA4orA4RONP0AaPu5ZJLIo97whVC+v?=
 =?us-ascii?Q?903ksyI03Nu578qfIHVVcrFSN1twV5HMUHl0pw9PAeUJaenyk4uhqhuzx/UX?=
 =?us-ascii?Q?75bwTs09GNfoPYB4T2dviWZmGuodnRZmZu2aLQ6893HPCclM4sebz1JM2GuC?=
 =?us-ascii?Q?roRRY8wFnxnT99qAmEGsFHGG5dBi+ZOzde/IXiXAwn7PNJQvxdpVTABsHhb9?=
 =?us-ascii?Q?Fyu2Eqbi8+5E1ysJud/EdojHkLkm7V7H4gwq+nyNcaN53OD6P8FEFnW7kIcM?=
 =?us-ascii?Q?HxX8lj+dVHpL+lproyJXYDWUr10MKZp2oSP+4/3fc3adOtIch1xtHEpzSwUe?=
 =?us-ascii?Q?Gh85xjL+qIuxrmoBqCDC1Ts2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 915149df-45a3-4f34-91af-08d91b9ac7ff
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:23:04.5497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lgcMFU67qfHEr7lAFNwEtkpX2p8e31kBn+VF5tP+6OSWWVnAJj4wqfzBFMOhfpnShJTvkcIfh4kmA8YtnPMX39Ka2qktJw16uMfy3Yj6lcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4072
Received-SPF: pass client-ip=40.107.1.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index c7ec16c082..9fa0162b07 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -655,9 +655,10 @@ def resume_drive(self, drive: str) -> None:
         self.hmp(f'qemu-io {drive} "remove_break bp_{drive}"')
 
     def hmp_qemu_io(self, drive: str, cmd: str,
-                    use_log: bool = False) -> QMPMessage:
+                    use_log: bool = False, qdev: bool = False) -> QMPMessage:
         """Write to a given drive using an HMP command"""
-        return self.hmp(f'qemu-io {drive} "{cmd}"', use_log=use_log)
+        d = '-d ' if qdev else ''
+        return self.hmp(f'qemu-io {d}{drive} "{cmd}"', use_log=use_log)
 
     def flatten_qmp_object(self, obj, output=None, basestr=''):
         if output is None:
-- 
2.29.2


