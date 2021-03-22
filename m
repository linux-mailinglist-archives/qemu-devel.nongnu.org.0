Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B2F343D39
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 10:51:40 +0100 (CET)
Received: from localhost ([::1]:59920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOHDn-0006Oa-Dx
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 05:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOHBt-0004tX-RI; Mon, 22 Mar 2021 05:49:41 -0400
Received: from mail-eopbgr60113.outbound.protection.outlook.com
 ([40.107.6.113]:25015 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOHBs-0007bG-7M; Mon, 22 Mar 2021 05:49:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5Vpzz8cX4eL/ov1jPLJiaovXT2CpZQmPdqyooXIs9zxXzbCZSrHklZk1/wI5x2WnknVyHRSvOE8sVhsmytlLRpOA35JFioBLuUnSlkKXdJkmoiE0N+cx0gAgsjj5sZF0lbWVRdv3qBkqPn0ayism21VjALzgDHb0zbfkyCVo1ts6IYdH3Uw0y2YGl7noh11j22OSIhJmxOLBdxt6r/jqMxpMxq1oQtffHW6tuFhjaHPwIXZER508pgBTB7kMh3x9sDxp8tBPuzV4ngXitGhyhPTGuD94cpQdRHqGIPS1jhytAvCIQ6+STxlv9M6m1mUj8uT86fftcLIEqIhExxLTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJ5G8VuzFLJHiVbP7Y1tHvIVylQ0doVKEgjprj36qGE=;
 b=AjQOVyeuHy03G7XqJRu7jewkRyjHZLiIvB8bEpk14oS8Iv3oIADAcaeb//6topOVSFsMnfJwU+2Nm2JXCvb3R062RGeEq11hVXVtVoZEIP9sXSIs8Gz6a72mFSKnyVGQJm3PMXU+O9cNr1XWgf85jbdK2NBWtLveMhWaNXJ0hbnTTGcddyMuKZa9ERhZDXolU/FYiJesWDJ0nZitjeibWXag5fw/K0svonzI76tJaP9uwQFsP7uoBaca4mwl4PtS/lgqk30SDvLUB+fg3PS/gAKK8V/+7wSRMp8XULLiMX+EMJvmrcn+vFjoMXMsQXW64ehgfAZN2RlkycgNVaBuwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJ5G8VuzFLJHiVbP7Y1tHvIVylQ0doVKEgjprj36qGE=;
 b=BBoV4piq2DkcrluBAKaUJA76nKUJ7B88OFdZYgnt0gBuNqtlpc788jtfPx+69y9TbdFl95oCdk36e8d3EsJ0ZzYwnfS6tmU5tU9APsXzmoiLqosE1wGKdTl25VqCZ/t0InfY9iVF0r6u3e25l6KwsuzaFRWuJ2bLTZLtyy7LOp4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VE1PR08MB5614.eurprd08.prod.outlook.com (2603:10a6:800:1a8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 09:49:24 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52%9]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 09:49:24 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 dgilbert@redhat.com, quintela@redhat.com, fam@euphon.net,
 stefanha@redhat.com, jsnow@redhat.com, vsementsov@virtuozzo.com,
 eblake@redhat.com
Subject: [PATCH 2/2] migrate-bitmaps-postcopy-test: check that we can't remove
 in-flight bitmaps
Date: Mon, 22 Mar 2021 12:49:06 +0300
Message-Id: <20210322094906.5079-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322094906.5079-1-vsementsov@virtuozzo.com>
References: <20210322094906.5079-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: ZR0P278CA0121.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::18) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 ZR0P278CA0121.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:20::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 09:49:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e5db146-8ca2-4ec8-674d-08d8ed17c6ab
X-MS-TrafficTypeDiagnostic: VE1PR08MB5614:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB5614B8AB591FDA1992AD8659C1659@VE1PR08MB5614.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:30;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mT4e8gWydA7mTq4MrZwbA9+66Ccki2MGqcfeSTsOnp5qknWP7LP6HjErvKt+JbUaKbGqg5GsVtttYvpoR4Omqji/5QNjXTmrKn9erqCDYLf5ABULU2EhhUWyJ8s7ut39Kz08jOx1iTTTu1QVXz3OVw+qosSKtjKAhcljhyfyxZK8M5jlp1JT021SwmRA/Uo0vmZojk70u7loCXqU23gK/r/5OwSBUP8tPijUomzvMWdimwcKykQEEkwEG2Z6uSPg5X5oLqN8QbWrw3S2A9hSHNH9SRqMZ4VDxz/NAZ/+bW0Fq8zIgFwheanwNLXIGUcXB3AgtHCJZPsdHHxEjjeM9MMubJCeYeK1waupEG6V2m0SRbZJWkkKCXItw7m6Gle6oGRINbSYccYxVCSn0xravD7QlUoWw9RIeZrZSANSSqntT4dZOIhLk+bfVCy4NjppMJu7eBRVg6HDoCLPsIu2f9WbUH4LnrImTzU37xyI1YhSVyz5kxy2zQMpgGd5trDiNn4V71Ei75z2zPGNppCaa4rp77++XYRRcoORnJCnZvwh6JemBuk/lukroFxt6So+JVImKajg2s11R5OwI4gB9VeadN3LQM7vrWP5oNoh7qHY1OzhzBNCBIpGG/NbZAeG41/g3QDX1oROmd0CRIsVrTxnc3mmRgarZ90qoBbOcZAGoiXvRXEngjmpP+kv2S+m
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(346002)(136003)(39840400004)(6916009)(5660300002)(36756003)(69590400012)(1076003)(83380400001)(2906002)(86362001)(478600001)(6506007)(316002)(6512007)(4326008)(38100700001)(66556008)(66476007)(2616005)(16526019)(956004)(6666004)(8676002)(8936002)(26005)(6486002)(186003)(7416002)(66946007)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1Nf/LmxT/hWojGhamnDBdu5njJxA7QG5RC6fI3Mee5avyKsR+bFmbo6ALgfL?=
 =?us-ascii?Q?n5u5w4xkYcnW9mrRDq+ijbUVd7XHTa7/CYlxbzQ2PAju6zEhwWLHBiM2aMdV?=
 =?us-ascii?Q?K05ZWUIJJScagrZcpGnJUjG14SHslDEWINdD5y+pzhWpIM1GUOFc57yODYYf?=
 =?us-ascii?Q?rCm3IHQ8wfv8LReKfD+kRobLZdUK3lzV7NbdHQS8V9q/r8nqNiczcgmQNktL?=
 =?us-ascii?Q?uEU/NOvWDNYt2zTIOYDZDxudcWjTGr/uRrWnjk2o9Pufz2CVF7/th4e3axBQ?=
 =?us-ascii?Q?0WUDRBDmVRXMi7L0taiVCGGnHGKT1YaHwl4hHU9IYSMEHYplH43i88XBakBr?=
 =?us-ascii?Q?Uq+B6M+0UXrZQG1q+VSkUwhccT8PDZi4aoLzFkceAsZxhBYHvHovK9WZavaH?=
 =?us-ascii?Q?onl94hUDzelerEJ1jVehaJbn9+lUuoU8RnIEnGUJW20Dms/WDRouhhKSFUnN?=
 =?us-ascii?Q?jvXvvtpiK35OcoEc3ziIWODIY5cj7eH9IDHNXxOxyv1gteUXQODJxgOlxldQ?=
 =?us-ascii?Q?Kzv9zly9N6tNOyQCwxbPd0PobtEmqHhYtuxT9naqPYCE5A9Vdsnuj7oW5N98?=
 =?us-ascii?Q?4V4Joa0tbNrvI+PvF7REuWxr1Dsn5GcARj2ClhLj67WulmNah4FSEYw+qzAR?=
 =?us-ascii?Q?4SLZ1zVAraD2edKCS+aM8UMn6fGhU1hJG0fW+IeOhpKlPIrGqbDC3rJMw6sB?=
 =?us-ascii?Q?X3fMEcZ4b3u8mtUNMWmkOUQQjkhE1ewVjBXanhLoZ4lNdqh8uHiWLI/iOGwN?=
 =?us-ascii?Q?U+Yvw0xD402gAr1Hk1JgPvH/X6u2YYsY22DbmcKKhaDUTinSS0wQCAdW238l?=
 =?us-ascii?Q?GXyulXUiPoofhx2Cu3yKuFJpdSeBRWNm9gWd0dICO5Lfsy0HY9zA74BgC517?=
 =?us-ascii?Q?fWra20b9T/pA8lhzv01B7ytLKf66AFgaTXNg0DtYfqLVf2S8xB5bH7iDMFsB?=
 =?us-ascii?Q?rFgTH2SU+c3dfcMBVXhUqfIeif1FlMVz18MEJXc+3zzM9WfbD2udAjEMm6MN?=
 =?us-ascii?Q?eu/BdHv8attQhMozODZjhcPlSXZNim+waFyIkInGzp2EBR25War8fOBCNIAJ?=
 =?us-ascii?Q?fJ+c47YG0pJHhHJdJRe2z45fdSBTAg3jD97WPw1ELnueIfYxsiEVOKMbV+VI?=
 =?us-ascii?Q?N0M26Rt1g+2UeSjCVec/8b5QPLC7jOvVPOB74+BE5Ycc+NAH/O1rryOl7HNy?=
 =?us-ascii?Q?Y+Hi5YZHhI9/TuspQsj+duOPz21jLXBS983seDXf9/o6+XYNDHVU8o1/kzCi?=
 =?us-ascii?Q?izSZY0Gl+JUQ7AQVB8zj2DXm0c2aFbpEj3LVlNWUWOnb/GfVlItqrU6V2baG?=
 =?us-ascii?Q?GIWN22XqXBV66TJ+TwXgFMZv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5db146-8ca2-4ec8-674d-08d8ed17c6ab
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 09:49:24.7770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cE6ePSFU7GOeK5S1hcqQ0/R31Im+oFdQOE45edn9TgX9vgd8Zp2PA2MoiBmRB6jLmULne4AR4c6cXjAzNyWbODoOedadSxN4cp7NtRhgKgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5614
Received-SPF: pass client-ip=40.107.6.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Check that we can't remove bitmaps being migrated on destination vm.
The new check proves that previous commit helps.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
index d046ebeb94..584062b412 100755
--- a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
+++ b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
@@ -224,6 +224,16 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
         self.start_postcopy()
 
         self.vm_b_events += self.vm_b.get_qmp_events()
+
+        # While being here, let's check that we can't remove in-flight bitmaps.
+        for vm in (self.vm_a, self.vm_b):
+            for i in range(0, nb_bitmaps):
+                result = vm.qmp('block-dirty-bitmap-remove', node='drive0',
+                                name=f'bitmap{i}')
+                self.assert_qmp(result, 'error/desc',
+                                f"Bitmap 'bitmap{i}' is currently in use by "
+                                "another operation and cannot be used")
+
         self.vm_b.shutdown()
         # recreate vm_b, so there is no incoming option, which prevents
         # loading bitmaps from disk
-- 
2.29.2


