Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 877303978F7
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:21:21 +0200 (CEST)
Received: from localhost ([::1]:54430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo84u-0005nj-M3
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7cI-0004Gh-5S; Tue, 01 Jun 2021 12:51:46 -0400
Received: from mail-eopbgr130139.outbound.protection.outlook.com
 ([40.107.13.139]:37856 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7cA-0002Zc-BH; Tue, 01 Jun 2021 12:51:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AkHUDyOZ/fmyMbOop9wOyww3TH8fiXMcjj8ufDwdsvJUKM/8gwvcrWmEU6JYKn2OMVkgWUbr9+sp7OEOu3akRsK5f0vO7A7yMEAVmtdKywVVOVfZQ4DsKRtsLTSFy7XmB/Z2niSefxEckLyJ3Lz2nwgUVym7H219huoH2/MRB0T8jkLOHuQuwZp2FE5v2I7CMgJPbDrnujwPoOKcJCm+5cxybjjfsiBR6/eQxVPLBg1KjH/C+QT94dpTi08svvIkwjCqvaUXyxR8X0B+QLSeHm+46JkglI9mryeWzt+IadyfDJ74atcG5DSEHYenu64FUVh3wNbF6NjJLyG+y1oBog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCPQk2Vj1oy/h55SJ19zMBsNknD+DXREd/PLofRnW6o=;
 b=gn+KuOay9NHPawccbokkp+qmfinyFUM/+O/VKljGNDGVPE9uJjJSKB2LbpahLhj5itguTSZzhNd5l0vqYqPu2oUh1re35OXqb6yqldSSjYn9NGBqpk9UbzfPXF3njJpIvAomGLw5V8D9DzkdG5wSQ2AxUJ7n1PAOhsuYEREdBRadQiTpyikE2Byx350WnINi0SILJha4INaMf3ixab35FdlOsPCvHyZTgun15UNC00YfcACAOVdntxIFNr3uSZV0KGzW5ZpN9ljJEylJP7URh4HV6Loz7Jg2wcSms00+lDdq6JLPRLs5+CmYkNWh+MLYVsrVVG7RwQOUs3cQVOQIjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCPQk2Vj1oy/h55SJ19zMBsNknD+DXREd/PLofRnW6o=;
 b=Hp/11z4BejXg0mKlYBDAjK/ledxjtpo1n6JsjtuTYY2npXEUQpZ7tOTpuNGsWSx0Gty6QeLbd4Ka5471BpbvhExvqfXy6fpxTk0Mu5Z9A5BZ379BOiSfpoOoyRgkEvr1qoFe6I0vq12A6+/5LE3o/yT2L1m+jhalLx8RSLoqH+4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3864.eurprd08.prod.outlook.com (2603:10a6:20b:8e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.27; Tue, 1 Jun
 2021 16:51:24 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:51:24 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 31/35] iotests.py: hmp_qemu_io: support qdev
Date: Tue,  1 Jun 2021 19:50:22 +0300
Message-Id: <20210601165026.326877-32-vsementsov@virtuozzo.com>
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
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:51:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b240236e-9b55-47f9-bddb-08d9251d7dea
X-MS-TrafficTypeDiagnostic: AM6PR08MB3864:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB38643A953707FAADD8F3E089C13E9@AM6PR08MB3864.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PxGUUEGU/asIgEVp0OWnvYZp3LjYUn2ka9itsKpA9ZQ/sHyadG4U4sHaQBhlfXbel0FLxVmd6R5OKodjqZREBt3yxau7727C8i/YjkZBup0ogBCgXds1XXwvYts+3l3GnlglCQU19JA26a3xLwWzEdGERkKABeOF/HnvxpDFbucxutmE1onv5TsUkhd8S2xAGffdzctslWRBGXUx5kr+QKfqp4MUPKyq0Pgoa6c3VWaKbiXPGd/inOHNBp61Y0diy7nRkV8Jeaz28UUSlz1qIAlIeUdaaLxOFLlx9doXHIpr7QH5FRoO9N6rKW3xt9DIlcllsOI0OCBNc/dCUB2w5XEOJDt5QXgpnKAuq8Vm9HxTz8J+nCBYeMtveiHlKeSMHlOJrWjXmSE9/ym0jv8SB5a5iWC50ip4kijpIj+CycAHaI1ViXIbUUv7aFvtkyR2jd6ViTx9bsGfwny6umRBWwvltpa/htY/1aZ3FETO0HCxX15GdB1FyaGPruI191RuSnX8AKVj7+vaCJLkpHBlBWPXbwaUc+2HYLA0PNzjjGCO+7AnxLUipNag/F5oCTyOXNXBKuDInXrvmCI9ARn9SyK/VZ0x4Ib3QQuiaOBtIasRIstcHQcaWGDaXvwDCuAT3KTupk5r6QHjTKMyqUQDU8fLFgTrV0lT+/F9FAaEcgOboASJzjolZXD47CBZFq7/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39840400004)(4744005)(5660300002)(86362001)(26005)(1076003)(8936002)(66556008)(6486002)(83380400001)(478600001)(36756003)(8676002)(2616005)(66476007)(6506007)(38350700002)(6512007)(6916009)(7416002)(52116002)(2906002)(16526019)(4326008)(186003)(316002)(66946007)(38100700002)(956004)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wJiOEmT2dj5ynyXdRyS3vjdqd1To7Lofko6fiQDEZgUBuI0HJxC59lJ3JhBQ?=
 =?us-ascii?Q?QUJSnyTAI3K/Ys1hGIPgLuOW5Rb8t87/N/qjpcJI928hJucDmvmPWS8ii5Bl?=
 =?us-ascii?Q?WVzjw1B34ox6BxTr75UZCebfrx8tIWErtVrQnAwp51E3HaXx2ZZ0C/D7iqXG?=
 =?us-ascii?Q?iL5ELG3HMLp8QgcDckp3M983Fk+1aSBr43oIT6aguGrqlyGe4PsIZEtxFpcl?=
 =?us-ascii?Q?POeZjyECvmHHRIRb0mAPh1bT4VD6ItY5+RstnAo9xFdxoRHAbJGBHa1aHZrx?=
 =?us-ascii?Q?JRdhiEliVcSHGlztzC95dukjoT1aA6Cd5RcvcfYnLRO0DcqWSwKFrCoJyMOD?=
 =?us-ascii?Q?0WKLfO9qlyh3/fSHM9fEGkN7es8NkHkKeLVeNqu8GuFO8KX2I3V9IeezMM1p?=
 =?us-ascii?Q?TNQ8XQlcjNTjqRPpKyI690hMPmQ216m1knu8mx94LRSzhLx4BYytEnkCgnmA?=
 =?us-ascii?Q?JGQChVTIFSKccP1rwRumAk6rY/ihydiu/pqd5OaJp6gZXU5KoMsLNuoql2mL?=
 =?us-ascii?Q?smtcxAYSl+L6dxHaAMs/+mN3Ba1z7qcFy2+p/JnwOZVdfu3ZtzLhaG4Mkjwz?=
 =?us-ascii?Q?0zZeIg2mdHmJKwYjdEkUGtaise+9fTxEhAOisrQ+vOwI19R4n0ndKEfIeDqs?=
 =?us-ascii?Q?W7J3ZIyBcMqXCbnUoho+wMe7P2Y2iX1gcaxEN6Us0/f9nCQuw/RzA66UG1aE?=
 =?us-ascii?Q?Vv4RszZ/ksYsS8n1SQ3QlYJjQw+v0MTyV50tVfsBqJVIq8Xbyx9TJr5uyKoi?=
 =?us-ascii?Q?R6puv5H6qDf06svMbR/dKJ2L/jZ/KW13ULhhLXkIwkw0p2DGvdpQd/g59XES?=
 =?us-ascii?Q?BlnLflkFMOaqIFBczrbDRo+VCj+ROs87cIVXqqW8/KFvyCGN6hTHmii/nQAN?=
 =?us-ascii?Q?pslALy9ZC3BKnl4cEhPBLrkRAgHVLbtPdsFBCpMk6QhkWciHCdMDjjo2HupV?=
 =?us-ascii?Q?FQNmMqdYICm7yfmWy2drpHAKuVezYiVDmc2rw7KOwRZ7+r1MX70qOICz+xDN?=
 =?us-ascii?Q?t1z190EV9+pU6Ue45C5zOiXIgxcmEACQhGr05jtJaqbN9OmLPoR+yhPCYyfA?=
 =?us-ascii?Q?CtbpucdSKiy5eeyFNKaeGw6KeQQqyis61791vzVY+YUZq3rTQxJmCbUGEMbB?=
 =?us-ascii?Q?uA9j1WEs/lHT12NOYtYjpCzNkxR/nYk+3roQY1ViGc/Z6TO1G9Nv9JJ2cde3?=
 =?us-ascii?Q?ZWwVzv7C9ITJQX9alqeBKSye/Veu6almYFVsfzYe60jdOYfNe0+GhmSN60JP?=
 =?us-ascii?Q?Zt9NkolUmRshFKZY9mS+upq4ngMx8WUjADQy+tH4/i0oHygSDaU0FDR2UeSW?=
 =?us-ascii?Q?hHlk7A8ot7dv4FsMdINXAHr1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b240236e-9b55-47f9-bddb-08d9251d7dea
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:51:24.7874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRZKs5FfJyMyqfyIIQVCIFaeYwlGcQx+zM3bR9damAf0JXXOREBOJ4vU7SQEh/P6hVii55S2okmR1T0AhzlRO5b8+5S9YYZsxNcw3RXeCSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3864
Received-SPF: pass client-ip=40.107.13.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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


