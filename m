Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D294C2B83C1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 19:25:10 +0100 (CET)
Received: from localhost ([::1]:38914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfS8j-0002px-Ot
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 13:25:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfRpe-0004mP-35; Wed, 18 Nov 2020 13:05:28 -0500
Received: from mail-eopbgr130110.outbound.protection.outlook.com
 ([40.107.13.110]:34980 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfRpW-0008Qn-L8; Wed, 18 Nov 2020 13:05:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSNOisMkxTBZCYboqT0dxZ0C6y6ztriSaXa9/YPw1bEqEEfBFf0vvsMhJuImAVshElfALp2mYlju/3TMCVk1+a00iqaJeWpOYS8Rwon81o94T/viect9oHz2mjDALvkOYF5C9332XRC5NZWkbfrONSh+LbBlyuIYQCiv5JvtxUoaqYALFJotChjx64MD+AEEatSBjTr0yKbAa7ivDR1mbE9sZ7lc13IuvQaSgFYxbmMDXqWknL0wjpd6NHj946TadHbFAObIWpCHdrRWSKa+xmMot3nVllwnJr14tj6gIQy8xbzRyzHHsuSZKKhfHXgUQWrvZDunVEN4Fq6FqXdQzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znpnMVQZieCVYtPB5nhu8lS3VKd3OkTMwhoturtWpx8=;
 b=QUhhISP1D7UB159PiOpjFV11RcNXgAW0/JRHH7dj7qU2GIEX+R1W2WmsJH+Uixcta8GQIt8YtO5QU5QrAt0LEKtcTfSqvEdti8vojD+zG1h7vErdALH3NygVNcae65IfdZ69HhI1mzQiczCpHfW+JHY0X6F4z/2wDcodemzhtV8RVzmjUbwGw71v4l4YkiFlUj9CVhkyBbbyh2iQ2OZLKMqFUs2Tb0jSOSPayTgRGZ9KmvbLOEEul3qRxsbj8EgqWSAd9JSPfbrBtxckESgBsFDfns6wZ0fhGTdBzo/TQMjnOvhn8awPSe5p91O2wVEQazuvL85X6iGCh3XQQ2Jj/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znpnMVQZieCVYtPB5nhu8lS3VKd3OkTMwhoturtWpx8=;
 b=t0QuFftCWmcqcTICjtWhdLkM3nR5sPKBsDBC+vByy8m2h1gqU97Is0AXgnRsGwMkQKgdXFjTTzmO7XTAlsldXhBh2/F2Zigo25ZFlvMtNcUxdIJgpl1Rv8vLpqfWQd0TceYGcfZSxPoKow9azhH98xTVdnGtdSi3yghByV10o7Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5912.eurprd08.prod.outlook.com (2603:10a6:20b:29f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 18:04:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Wed, 18 Nov 2020
 18:04:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH 08/11] iotests.py: qemu_nbd_popen: remove pid file after use
Date: Wed, 18 Nov 2020 21:04:30 +0300
Message-Id: <20201118180433.11931-9-vsementsov@virtuozzo.com>
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
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 18:04:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe8184a6-716a-43a9-6cae-08d88bec72de
X-MS-TrafficTypeDiagnostic: AS8PR08MB5912:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB59127E4917C7D79843FDA5EEC1E10@AS8PR08MB5912.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:111;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZJUBAW3UzSXWRx72z6vjEvQCSNcixWgAl4Us1/JzxNlPJ5eRAdGepWf5pb6NfXTYUWnbOx8jPf+4dkxBym/FXnQIIrQ6b2phE1SAP8bT49E/vhaQyIXdCZ/JA99DkLaHAQhywCIrTRRB12p/0xhhOW6Y9B1v6W2iRof/QVdbHfYw8eqnFS+rizt/hqVPBoYZCgmsQfwTa5UlKrWjtu7XzGfuDZu0HZWLERxBBjtiqYfX2wrflcuMATRje3KrPYK/vKvlfb+2xX6W5blVQApHoMm60X95dgEVj/lV+2pwo4tMt3vI9z4s/c6c6VCwLVlNjYHJ7Z5+KFnMuiJF1Ipcag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(396003)(39840400004)(1076003)(6512007)(26005)(36756003)(478600001)(6506007)(6486002)(83380400001)(16526019)(2906002)(186003)(66556008)(66476007)(66946007)(5660300002)(4744005)(86362001)(316002)(2616005)(8676002)(956004)(6666004)(4326008)(52116002)(6916009)(8936002)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 73SCGAA3dH4hrkKFpxkq5jL7hlAVGXWsCFAPMmQoiodvcbINPSa1DYXQQA6DKRU2L2/1GUf3DDHPMwJFaYDi3KCjNJz6U3Ep5w3bmJoM9ulqbCxY2UXUDP4afkgJvkIZKplLclCjw+cHtJaNgVXmaRZVQjCetqOEy8RrStKUcx6i6HZiSVFX+tAU0d1jBsyn757E33JWt5gywUUKAiDjBrrq6vcVx8mT1wtzS2wEm8igYNBhufBC/IxZBHM2by3xJ1yWyALhzNziYWjd7x9UU0RpSNabHSYmgGdD4JDchnIUDgfcHssBgryrplEUxk/2TUvml1TWStlS2ltw4zYqENP/HPG3mr7dGqIsg7nOLhnM95uj4O7ksPlAlsROItrl7yC25v1LP5EI0A830jHfQk6ox94hkzdBV1w9soQMGvHwzJ0OWq+cB4f9e6nHZq4sqWVhDX5s3bPl6c3qbIKNjROXK4HTk0E1JuEWPq3fNrNjWOVviYqAll29Nxang1hrhy3TgxHfExqJxniCQs+7Cav3+AvkZ0LSHw8HxoStYzIras7gpPORfznIqNnTCwwbrflCkDjFVDWPK6nwIticPgA1dk0SlKlnLQ5yhiLg7HLqh2tyo5dGnvwKQQa/r8xXTKi+1zcpndKDJ4ut9Sbw5A==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8184a6-716a-43a9-6cae-08d88bec72de
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 18:04:53.0738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBHg0H2TeJJs6288kKqDdC8GHeTehDn6RJ3+5c+f5SX0fYOLRLk+b3vBuFWClleJjgSJFXZTrq62UA9PNsQxlH2UX+xo7dUkeoZo8Vz7i/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5912
Received-SPF: pass client-ip=40.107.13.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 13:04:46
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

To note interfere with other qemu_nbd_popen() calls in same test.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index bcd4fe5b6f..6df280a97e 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -291,7 +291,9 @@ def qemu_nbd_list_log(*args: str) -> str:
 @contextmanager
 def qemu_nbd_popen(*args):
     '''Context manager running qemu-nbd within the context'''
-    pid_file = file_path("pid")
+    pid_file = file_path("qemu_nbd_popen-nbd-pid-file")
+
+    assert not os.path.exists(pid_file)
 
     cmd = list(qemu_nbd_args)
     cmd.extend(('--persistent', '--pid-file', pid_file))
@@ -309,6 +311,8 @@ def qemu_nbd_popen(*args):
             time.sleep(0.01)
         yield
     finally:
+        if os.path.exists(pid_file):
+            os.remove(pid_file)
         log('Kill NBD server')
         p.kill()
         p.wait()
-- 
2.21.3


