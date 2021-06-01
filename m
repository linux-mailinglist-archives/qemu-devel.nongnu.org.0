Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E353978F2
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:19:30 +0200 (CEST)
Received: from localhost ([::1]:49906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo837-0002ke-5W
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7cB-0003pU-1E; Tue, 01 Jun 2021 12:51:39 -0400
Received: from mail-eopbgr150112.outbound.protection.outlook.com
 ([40.107.15.112]:35829 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7c6-0002O8-DM; Tue, 01 Jun 2021 12:51:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULXpm6UT1yABje4WrcaSftRVCT+dJUL9uJqn8qa2N9ztmpakbCc+jgBx4s+uOaVIKqZzIiF7Ob3GyEr+X039J10I2rSf1VX64Jz5LSCPjJMVgMOuMSAmO+4KwBh1CHAMAs3xYr1cJhHl3YayRZLixGczAMWHWAC5jaISm5jcUax5liDDY6gPPjnm1TyxJTO2KDf4ZCvcUFYwa7mK1jtsXHYxaTYGm+iA+HXJK0XPCPhNFaqPXHC9SE+xK7VTvptx/VqnScQWsRZaeZxzJqKkNRJhPoVpmdhRYPVwEmcoAluYgSRDN7mgOoYBfIfg3OWsbRSnSm6a2R+uE2k4zP5CcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/ymRGP0DRJKkxQ32QrnLjwjG5+iJC9P0zhZ7Hzl5to=;
 b=LCJ7nuRkT7pAOAaN3rvC5SFbNJhAybiTRDPMYA9TYBOc6cnP4v/T9TVdSOLPIIWWThy79StDm/XOpWfDQABwiyZl73JrsCi4OQUJSt6KoxtO/eaAForVp69hLQKHrkwQIFhvoeciex77EO7pfEPVEOw4yAYJupInQoevX8Rm+D/1ePfT51dlg36uyl2Ud3IIbg1+syhEoWyAMZ+ryXiCzdU0KRFxdaXBzB2j/G1U0ng2XYBmfSpu9OBb0dBJXs/8bIViBadnM6+jmfMQpH0Bx9AcLX/sEADrOH+zc/ymv+7kJW55QD5T8femJdK+bzTuDVIBmHbIMsV8zrTzmPPrQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/ymRGP0DRJKkxQ32QrnLjwjG5+iJC9P0zhZ7Hzl5to=;
 b=wihewFN+rxL3XfUzShwdOSgeS9k0sqG4arb3jgb/ZKsQv3ZIyxA/LTZv2+uHL0OapIDQKlQEGGqe0/PzhPtRC78AyqkPDkTrQcRKFsTwn86VE4qYk31p5nw4dbUyhXj30q2OXmxyR/FMMf1smToIzOFs8iJA70yuCKYtO5Ozylw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1972.eurprd08.prod.outlook.com (2603:10a6:203:4b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Tue, 1 Jun
 2021 16:51:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:51:19 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 27/35] iotests.py: VM: add own __enter__ method
Date: Tue,  1 Jun 2021 19:50:18 +0300
Message-Id: <20210601165026.326877-28-vsementsov@virtuozzo.com>
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
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:51:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c19de99b-e505-4240-89ea-08d9251d7aaf
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB19724EFD9B3CB54C0DB7EDB6C13E9@AM5PR0801MB1972.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Gqpn19vTT6/Ddeck28ss0IwF0eJnO2onkuS/DbQ58UvagnbIn1abGN802vY/jYYpFrY8xBv8RsBCDLZvDZzSTUFQv5t3ulMUG8c+49wNPYJG3uPjmqmStz+HvcM6Dpg+nSLmUSvpqQ7fMMs9SHgCBV0zQV/BxzADz/+htUvwM20WlG+l1HUsGmjfzjx2cZS+EKBEj/Qkswt4FpUrDlUWmX4n5AxNX6p1MCWTvCegp5XfSMIP4Dr/2YamgQhE2QDrYu1k/NxsVd6pBR1nT56vpwtnF+qTY3wSYBOW3nOLHZ+Sixfcgp+1dSoeuHf+ck26GHUlzo8LIuN8bbigWLEoRxeAv+hckCue7cegQ0mW9cUDeyyDBQLar0jchPuY+iSLKCq4K0CvuAuuYc4PmwzeWJWeW+i9KMeEGoTTnXTAXYPFXBJ7deIDGmwKEFnmQ5JEh8M5HVRiUhFbZ/hpJKpbFl0OjPqgB0AW78QFv+eVjBOduU0TzywyZNNpGGwYI0hmYZOAB4uPXkks4V0Eh50eXOKGaY1UNW67sHCbEJuASRpz8xT3CQa6JsIMSqv/VBEoeosUD0mvUysVgu+6Wzwd0orbJJ/7TEXIT2NQucnXa7QemftRqzkL2Hs27dKKhVt1P/tviopZ3zwDKAt2H1UbNzThjRtZffZ8FCpgFEripIdseGWDIsw+JM3zdGwcsE9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(39840400004)(346002)(52116002)(5660300002)(4744005)(2906002)(478600001)(26005)(6916009)(1076003)(8936002)(2616005)(6486002)(38100700002)(4326008)(16526019)(186003)(38350700002)(316002)(956004)(66556008)(86362001)(66476007)(66946007)(36756003)(6512007)(8676002)(7416002)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UIoP7kXLn4UE4aOZjCAt3roV3RTR44uDb1UA4pUpOKrL3MPKZYVAIH/wlZeJ?=
 =?us-ascii?Q?bO6IMho2t9kdGJlG0XWb8+LS3H00yg4rpJbit3UopzT71PNy4G+Kts+n1Fo0?=
 =?us-ascii?Q?bVpZTMh8TCvaj3Idjz31ZriXS913GV/VOQEq49/muADjJESKp3GeaPe0A3PZ?=
 =?us-ascii?Q?6oavQE7F/flOBJBEc2tCokwABXjg6a7ElXofH6HDnhNtBecUfAkomjxGzSpX?=
 =?us-ascii?Q?I1AfRJWI7zmv1p1VUVCGm9o7cTArk6/+DyVNjmI9XRp5GkOZUl4ODr5o4tn1?=
 =?us-ascii?Q?+bxAyURnd3IfDBk0qdqK+O9mdclXwePbp3nHtyj1hk7H2X+b/NquChtzf0qu?=
 =?us-ascii?Q?RU9nOEDgilRdBlQkpD/g+7riYt8cKnsncUMBWgsxdosCuBoVk/KxYV7R7H4r?=
 =?us-ascii?Q?OUbMN4gC9k9hStkWsvnHwe2pKwNcWf6AkrZV+zDJMhfcnGArqU8FvKsqDjV+?=
 =?us-ascii?Q?LoTGObgDEjy9IPhpvBseih/YOTsTHoij/yav4E2mbLHTeZE+5mGQ1AnJ+s0k?=
 =?us-ascii?Q?xuutDUzvcuT6sBjxgr/sNNYUtLr4LiP+WgPFtqp23fnQnffYC6iub0lM2caf?=
 =?us-ascii?Q?W5mVzj5do9MkQqFjvVYXNvI+qL/Ap95FPAiiYQL51iTj3PxpeUpK71RX0zUh?=
 =?us-ascii?Q?sJ89c5OTc9xDysVs0FMEXnhJkm7ITwZ83f/0PrNwsYdX1OOZAzB2wR+qUyNQ?=
 =?us-ascii?Q?vAYeVry/Csn2ZzexwUvO3kJxxSX76C0Jp4CnvlfTAZp9jGsDWZ/x22e4arlx?=
 =?us-ascii?Q?AtNlg0zE9wvOgrzxXCOu4XFdZB5B2uzMBC3IrM2cwHSrSmy0RxIcrDu2JNTb?=
 =?us-ascii?Q?oODb1yuknFLfAwl4JdGcDmvWrhbRRMNzmekgwdXlm9E0mF+GgEyd1W+LC4oT?=
 =?us-ascii?Q?iMyTDwG7zFdjdqAGRbRdbG0cmTJCNGxm9uIXfisHnmzSmXXpOLn3B5Kf/nth?=
 =?us-ascii?Q?/NV04OM6jSOzZgUbkmweAegWgUJQct/dvSgBsm6zfaojgR1w1G7GbG+AdONg?=
 =?us-ascii?Q?+Vz5Kx2jdoB74Y5AepTHZyLb7zZZn4dR7DhU0EHgm5WVn/QPCpWuB0DV7mAa?=
 =?us-ascii?Q?3Y0NKbXT6Dwqviarjq8focrBfdv/aI7xSxhmJyy0JVedsObIRTicitKf96R/?=
 =?us-ascii?Q?v/SLka8niSxDRp3S81GupSy1n+Ko855luPxfUe0s+xq/HYEH2/lkJTYnbYvH?=
 =?us-ascii?Q?Dzy37pD1leO0dKFFYOA7oAU+uu6CPbui8ZbIMut+3eS2OS1JTGr5krepvI3Y?=
 =?us-ascii?Q?HynMKR7zC1Vy5EmqC31Zy3mZ7jCjUsnyMb0tCZVWA67mjzQBA7JnAicuLZQN?=
 =?us-ascii?Q?1lJEflMtoa7zFvtqh98tdG0b?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c19de99b-e505-4240-89ea-08d9251d7aaf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:51:19.3573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +LXlLYtjVnYODceD9sYSV3t2qGYOrQr48jYoffK9NyuaHsaVLwtT2xiWAvpTfN61WeqOeQSRHDYuTvMPT20qt8jRlzFJ/uBZ0R/YCFTXExk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1972
Received-SPF: pass client-ip=40.107.15.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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
index 777fa2ec0e..c7ec16c082 100644
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


