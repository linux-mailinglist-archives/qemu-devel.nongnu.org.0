Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B29C3DFEB7
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 12:02:11 +0200 (CEST)
Received: from localhost ([::1]:58806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDj0-0008NF-0l
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 06:02:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMy-0005qD-Cn; Wed, 04 Aug 2021 05:39:24 -0400
Received: from mail-db8eur05on2122.outbound.protection.outlook.com
 ([40.107.20.122]:30945 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMw-0006Wh-CE; Wed, 04 Aug 2021 05:39:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FkBKTkxibAtdxWhiNDjRpD3ld8wggiFx9iAYTKw3hYRfG/ygUv06R2SqOutplIJKkJ1gplXEzlAEoYlpLA72wDgM4hm+8bSeul8u4eX/htiPfkhzTvSBy9iCf1Y0Hrb8w5Bfr2MfteeyskZxwVbYMsPDdn6DPv+ydKXGgGGdiPX4fof5/KmTOGCBfFqHnkKBF66npcR5gu03/oMeIRtmeTT0lCJ+MNfobuKH5an2NIu19JCYlagMoN+4bmEfzJlJ+8EmRQeCxEJOZYhm9izpZ/guX9aVk5nysjF/u8wuFG1vxADrtOP49aokWMrBj0QZLatOC9llfn8K8BSLeCsGpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1D+TJWfNhK5y6L7kQjd0njVG6279vZagGyKFmMJ4ew=;
 b=ERWXZnO6v1H8otpB5LjyyZ5UC5+aXHsw8U7nM0AibmdqpRlzaZBG/z4bZ+OBfDDyk9mbc+bUqhEDAmALgRi4bJ4VLF/MloqVtnPL9/w079kEb6xpf/sTtvIgA5bpwVFXvSw4TIxnLCshZm6mElSC9X/HpSugXhlAHsjl+lFaadDF8D9Lwc7i+RPIl7Z/IU5cSvE2hIiPAKfqAunAwT7OMwr68ghNj1mPMs1DFdrfmqu2WAL9j5kk5Et6ap3MLId7KnLpnkOjS6Gf5zVtFqDzoeneZs4dx+aDikaEdvNGNdrNkoxON78piD20PcfaAKxrR9pNEOGGXZlcUchGGvLynQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1D+TJWfNhK5y6L7kQjd0njVG6279vZagGyKFmMJ4ew=;
 b=YvMW49ktJ7/yYOBYgqAIr+m3Eav/DS8DeMr/GWAhnykq1BmMhnnvmQXPihy8qZ3u4EJ34UKDz9YfVRstdJwpsbPbLPZ8ZwbQ1yvd54FRiEIFREU3f6Ej31KFq+jvnMUpKuy2s/LoBaQ/GU/XYDkAnWta2DiffwhkHAhU9oPGbrE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5336.eurprd08.prod.outlook.com (2603:10a6:20b:105::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 4 Aug
 2021 09:39:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:39:19 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 29/33] iotests.py: hmp_qemu_io: support qdev
Date: Wed,  4 Aug 2021 12:38:09 +0300
Message-Id: <20210804093813.20688-30-vsementsov@virtuozzo.com>
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
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:39:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36fa317e-369d-4d78-d40c-08d9572bbb7b
X-MS-TrafficTypeDiagnostic: AM7PR08MB5336:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB533600DDE0226A01B7C7F961C1F19@AM7PR08MB5336.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rw+baLGYt9RPtVhDNfOElc9mprIEpcmnny1H5ScGltHn+P8oR00CYKmkbVNV/mHKBU6DE/5z7ItCfO6qqGjm0oLO+insiAiGZCGxThblyPxsOQrDOo/5GUMEYoRshrbgidpSSCP72xPV3TLyQLiofwBfKf4BGKxn7xI9Ks2Mn/mJAgbLthJd0vJe63gZibk7+TdrRY2w7ZUpCagWWe8A2EKKYCsV/+kEjyq5KjAT1GR194vOzQ8eHvw/mlP3LbxrNRHsbAR42+DrzJ2F6+vYmdwBDIsXymKTWUvHhQwjGm6xXM8SkOnDMd/Y+HWpsWcyaGthav7DJAfm5eCyQbZaQLnXvzPw+kgLsktJ7kMFtEOM1faFJZDwrBMb/iiFMo61BETlfXndizyG4N4E3sU9mYu625Q99eUb2scF+bBVodZoJHxaGHajFnKuC4nr48OSBRkVvZwNRgERC71mnod1orct2F/PVtSLdkmTttwEd6vQQfUY9ryv205mp8shWsFXV7W4fiWFnNcoUiHNT/SejQ+47rTSJSRHRjsiYTuke1xoXjQl8LL25Wn1RdkXDLxykFsoJjowWA3ojAsGB8srG4Sj2C0ZEBX5GjDcz3VzXyxobagcjMHqJq33KUbqDJBYKA+TxuUC6d4MVAzSuja7GtpxlkPY9vUKhb17N66P8EW2hV9Kqiav0cr5IBtSFxoDNbAlAs9Y5p0f6i0fy7nkKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(39840400004)(396003)(316002)(36756003)(956004)(7416002)(2616005)(186003)(6666004)(38350700002)(86362001)(6512007)(26005)(38100700002)(6486002)(4744005)(1076003)(52116002)(478600001)(83380400001)(2906002)(66946007)(66476007)(8936002)(4326008)(5660300002)(6506007)(66556008)(8676002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1x5ZQdre3r06sft6NdOKkIOWVApteY983CzulvEXyOWkqp737Ig6YIaFQP1b?=
 =?us-ascii?Q?xqx9NVdFJPhVw1+b7nvaiPswXAaxeTzEDRgvl1Yvc/hq/NPCSR8XYiGfzkA0?=
 =?us-ascii?Q?kx97o+uQgMo+rBs/4iOCIgvpGRsAFigsPRzep542WQvVfQ/yHkICiSziGX4L?=
 =?us-ascii?Q?sShetOI6ie5v2XKG2EcRcGa2WEy1W7dsH7p0+yl1QWn8ROqifDRbNefcBvl+?=
 =?us-ascii?Q?uiTwfXV3a1+zmaQgeRiKjqoD7HYSVkhHVg85B+SdwxGorllhfEaAs2JYS63r?=
 =?us-ascii?Q?nHTtuhDLSCdONTpNX5PPZDrLzWxgVbVzsjpE+rmfHD0rgXzbp0lwuWoY3XwY?=
 =?us-ascii?Q?pHihTbmWxG/SlxMhheFb1Ra1VTJhC29vzDK8dy3y0BVvd8vlC41EasTILVWY?=
 =?us-ascii?Q?/1Wui+3REEn8+txrwHyJTdOKHh5PD0jN8UdBNZUtBcCUj/dW5QqdG14z6wYB?=
 =?us-ascii?Q?/t2YEwFh4g7iCCxplNpA0HurK/K3QMZhcIsJbaGLmkgbyUbKlH/cOUQ5e8/R?=
 =?us-ascii?Q?RFgWGTLJej6NCWEQ4I8xGWTW9HDMc8E73NG6u09u1udvYES5DCqv4pAUJ5dO?=
 =?us-ascii?Q?YRHqm0QEqNNEUXgaUdeGtg7+6di905/8PQOqeI8iQQTY305BXuDKyxYkvTh2?=
 =?us-ascii?Q?baNj8ySW8iiNyiXIFPBaTfwvLPMbmGFADeIL9mg5xyU5+cYUJViiXDwfeyDC?=
 =?us-ascii?Q?QQJd0ICIObBWT0ct/JqgUIkuGglSlx9LrcBNeSkulQaF0SqS9IkxBVLxk9ib?=
 =?us-ascii?Q?V/6SWzKJx9m/dk1WMCtVAflmIdOItAl9wyrkhoKbCpjq6zW66TmwbfX/eq5j?=
 =?us-ascii?Q?QMS1GJwlaM8Soh1jWFKP2gwyuarI8860xOCULgnCJv5y3LPrlQJvCKUMycor?=
 =?us-ascii?Q?ksooTFtAYOG4t9GlHcEURRSzQK+OtVLeTayTZT2fmxjbcdc/gJCApIZ5Jghl?=
 =?us-ascii?Q?b8uDwDp/bEFGqoTkQ6fq+Ndi//Wb832s7om4QObh2to9M9+dSVpxiYc+a9Wk?=
 =?us-ascii?Q?ElhOoMDgdl09lo43ZR+/ZatGh8poiLEPVCoF/cdSjWX8HJidjQTWVqJ/NGYj?=
 =?us-ascii?Q?TgYpocKXYVWy9ohmqd6H/p30QEUqu9c1aLZ+0U2KA0Q6GQtSio3k+2ta1Ufz?=
 =?us-ascii?Q?iWYtzZZ8/0oaSEC77vE+jbww4SMo1ZFFb1+FZ2FvN9flrM67aHPiPLzVlnOP?=
 =?us-ascii?Q?0hXfqsvKyNwAMt/FQcna0llYERJCDaSNRSihiCFIP5MAccWImSS9d+JBVlF6?=
 =?us-ascii?Q?YHGbgdPywjYXp3SIcsLprvAMQ64lZKDRvh2XaiBO/j4kaw/b5nhE8eMttOy5?=
 =?us-ascii?Q?YBzMlKhsi0UqNTA23Nm4ODx9?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36fa317e-369d-4d78-d40c-08d9572bbb7b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:39:19.2331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9H49HZZ1CYb7NGgoOVL05w5BNMPBHy93pVyLujebJXBr1rijJUAVvK1Grs/eS8KwilR4kWgblByQiz7oM+hr4vekcUpwowGnhuZECbPxOxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5336
Received-SPF: pass client-ip=40.107.20.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 025e288ddd..9d0031a0e8 100644
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


