Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E2E2B83B0
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 19:19:02 +0100 (CET)
Received: from localhost ([::1]:56972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfS2n-0006lw-CC
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 13:19:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfRpK-0004ho-69; Wed, 18 Nov 2020 13:05:06 -0500
Received: from mail-eopbgr140135.outbound.protection.outlook.com
 ([40.107.14.135]:60229 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfRpH-0008Rp-PK; Wed, 18 Nov 2020 13:05:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m34FTglYwjD04GQEEtwEByE/yACPkDiGNywMwjwDNVPjLy/SbfNzvTUgR1doT0j+xilPRUs59Ygu/1mzj3JmK3IbTyRX7w9QfLA1bYQR2bYKuOM7x9kzHp82lRazZ1bla2WazOto1M5urrdheliYO7Rkw/WJRCSVjABHOCAcviUs4OToIwFUMOMH4dqQPMduiqllyLJRjIMDspck9x5ZxAXwdWPaMrSYY3wbD0bH6sp8d6XkRHqdehZEkcPzPKu6bfgytYUEFhidcG3vvnjviEUrDVk0LvOmE/2Au7miPVVO433QH6g1Kx+6gi600tRIpAWmbA26fAty3FyM7mj9KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Jgh+v0Hxi2FekA58f7XruGGO6zqj5hJ0EV9Wif4Fnk=;
 b=ADDGDNVtxV4BVfRFJtyOD55LpcIMYOYXHFCDGuWWkQC8GTof1AemeumephAJRK6aKLVzmV+1qVcRzltC698HUXUFsDV9g0G1XlUBecwvgYz8AJE+uUL4ZKAzVmeJGsy5W35iCm4sWNUBP/FSRK0YWURAK5YzMbQhmi57QhcwYP1RxCTV4WjumUfgOGoq6KMICvStNo+OoiDGlZhcX4ORTYj8SPGhWGpHek3gER1MUXcw4vQ3wr+aGGrFzg5KnXSU2n/JopFo+CWrkVkeKU/f2FYfRsWbu1TBkx9WMloH8jzePFzyvu4LkFj+Pp+94sqzWu7uWlT2lALSc/87OV6b1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Jgh+v0Hxi2FekA58f7XruGGO6zqj5hJ0EV9Wif4Fnk=;
 b=Df1/4WLvpT35jQqrI7P9nFWd3VfyB3BCALNUPnjSaAbR00ULUY9PunLDr/S+nO8qEXV/am7t0US7AF5MI2/5MC5Uvs8GLUid1uZtSfAuevNJFQVN3YW/5upAkqFHwr7AMftAq+lgT+oCRKOWinjWSwpHDUi6LlPgmawmH2gkuPw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5912.eurprd08.prod.outlook.com (2603:10a6:20b:29f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 18:04:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Wed, 18 Nov 2020
 18:04:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH 05/11] block/mirror: implement .cancel job handler
Date: Wed, 18 Nov 2020 21:04:27 +0300
Message-Id: <20201118180433.11931-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201118180433.11931-1-vsementsov@virtuozzo.com>
References: <20201118180433.11931-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.112]
X-ClientProxiedBy: AM0PR04CA0123.eurprd04.prod.outlook.com
 (2603:10a6:208:55::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.112) by
 AM0PR04CA0123.eurprd04.prod.outlook.com (2603:10a6:208:55::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 18:04:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ccc3f9ef-fe5f-4b52-d9af-08d88bec715c
X-MS-TrafficTypeDiagnostic: AS8PR08MB5912:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5912BC61FA99D4177E63C780C1E10@AS8PR08MB5912.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:514;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ASQhDQu2VIj8FhN/1UzMDI6ASZRc5W4yQRucHcspOWsDopP4mLW4xI5nviX4QPf6LfvSO6HpWCX6zRdJYoU5/cxRcuqYadmf2P7UFugSPJcSO0WZfI3acpWh/CtlnNel5IAh9krkh0sElVirAx8jKzEWfQsVwu1mlg3wFU2u7bfjIL9RFcQ9ikr0A+zZZDCIa+nngv7MgEkfQGUZrT9mqaPIarRonL8MaUCW4Cn7mMlnKP0U2QqYWTE1UuzjPUYKs8FLUYKOXZGOYtEMaTnw45YrmEjSWV3JizrxvvRBGID7q3dWX95QTxi2V89MtwWpbNaXpoqx0Mc7ZD1Nw+1Ee7Zd/jEacTK/4cZUzSJY5Epxj/aWh+to0UgMnmlhAjASPaDhpRqpcJJq+izUDnj2ow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(396003)(39840400004)(1076003)(6512007)(26005)(36756003)(478600001)(6506007)(6486002)(83380400001)(16526019)(2906002)(186003)(66556008)(66476007)(66946007)(5660300002)(4744005)(86362001)(316002)(2616005)(8676002)(956004)(6666004)(4326008)(52116002)(6916009)(8936002)(107886003)(142923001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: XLdv6oQ7lCdqh3c+0Oz/KcKZ1wCu+Fkty14CCgiDI8pqzvDFG7Q2lCeHRgHB2tslNDHng/kpQTN4wh29ftsOc1pupga7JzolZTEwwDXkwcBcIyjcz4Dr/OZSNuGV3FdyiMQWWv7EFWnAuYNu/NVLRAvLSVdVZqK5DDbhiUFvGl9/ukdxf3PXTlb571XttRB2GI4PDcDsEDU1e1dUkCSOtjLa3VJI+MYaxulebbhLRoCFfp1jzvof8p8WS3MXXvQcyjd1L38erZAAW/W+1ipOoUi98F4p/ztXtcWa+ft4lx4p0ql7CMGhX3XKB5MYnBUsMbAoq1DtDPssKLDi9UNvvGwNH2sJjz3glPy9C5f6AwUQeeGNjQ1Kmqaam98Qhjymc7I/2OffHS3Y/tr/AVEdbyrbrl5vAwhZ5UH7P9n/CcP+dZ9T4cReFtMQMonJPs+dbqGzpK7janBr1oNwDnzdfqh786X3r4DcfDQ5WknALoU5E+b0a7JgFDDUGJNfidt8I2bLtc6FcqrECaBH3qi09NJEO9ILg+EKeS8KFZSq4EzQwaTtc8Vp6nlDI4rQeEE+gHDOgwqJmnHQ7im3GmYkHHnzBFYicr7bJrZ2N31W5cYNnygzDTPxZUgsPSgwctyf6+8UsgpFvFkE7vAiSE5Z7A==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc3f9ef-fe5f-4b52-d9af-08d88bec715c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 18:04:50.4772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1jg4ymjTvioXFAjpwO200o0aZOra2PCkVoWkzXeCbH5vjNA4P3KxE/ODEg66gh6j27NJHg5wkamI2WTQK+kS6FjI++3y47faJCrDYhhTQAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5912
Received-SPF: pass client-ip=40.107.14.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 13:04:54
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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

Cancel in-flight io on target to not waste the time.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/mirror.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/block/mirror.c b/block/mirror.c
index 8e1ad6eceb..9faffe4707 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1179,6 +1179,14 @@ static bool mirror_drained_poll(BlockJob *job)
     return !!s->in_flight;
 }
 
+static void mirror_cancel(Job *job)
+{
+    MirrorBlockJob *s = container_of(job, MirrorBlockJob, common.job);
+    BlockDriverState *target = blk_bs(s->target);
+
+    bdrv_cancel_in_flight(target);
+}
+
 static const BlockJobDriver mirror_job_driver = {
     .job_driver = {
         .instance_size          = sizeof(MirrorBlockJob),
@@ -1190,6 +1198,7 @@ static const BlockJobDriver mirror_job_driver = {
         .abort                  = mirror_abort,
         .pause                  = mirror_pause,
         .complete               = mirror_complete,
+        .cancel                 = mirror_cancel,
     },
     .drained_poll           = mirror_drained_poll,
 };
-- 
2.21.3


