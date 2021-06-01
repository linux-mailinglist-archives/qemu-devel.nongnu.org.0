Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A74A53978C4
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:08:49 +0200 (CEST)
Received: from localhost ([::1]:45060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7sm-0004yl-OY
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bs-0002eG-6U; Tue, 01 Jun 2021 12:51:20 -0400
Received: from mail-eopbgr150112.outbound.protection.outlook.com
 ([40.107.15.112]:35829 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bq-0002O8-Dl; Tue, 01 Jun 2021 12:51:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8lGkbnhzjtGCDQcOlVu7x6AGwLIpJMHGO55nZo5iPbaSoibEDbiTRdlB7iHWEvMyArSYrUo+ib8Al7iYSyi8mN1kx4C3kWya9rcNqtcfHnSjmayYyAA1km3jqriBfja40EKS4J8u0KDTkklsVQ5E7ywdjw3sd8hfeibEmrdeuHMhTzqQrT4Bl+lMTLYgHnsIiF3c53ozA3i7z0nboCvJepPy0cn2Wfx2I0jeWJutiaDHOIFbEDVjdz0k6QtH7vScwMSlcYdfnidmvbLmw1Qo9RjYuVxdDmPY6SqAppvnXynC8zuV6QdX7Z7gjkFXBJN6vDDElwUwlxgCVYl+78dFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6nSqQ8glRSbCauI3uUt4rS18W8WqtO0o2GDIenmgro=;
 b=R1CFF/MwnHSyPG1Ez3glDJmnoRoXdyZ3CWbgBM/U1McuguV8xS6dzRAZAdkJ2mh/HBk/7f3wk5pmSDeJNMucP5lerXLmGEVSVEc5Foo3WvbdgUJ/MZIW5YEQ3qp88NpBzWJDMKOH17j2qGQH8foFcIywuLgHErX7T0UDYwP33WA1lnaCK60SgjI743X3PJ/R5yQW9V1VX1sxXgsP27ivWW/127EZGSbSDBHyZpiKK8tkW5gPWeB9ebiimHaaaPdDmDjXdGT9Qf5v0vaEzxAbGGrr3Ri1f+LmOeCM4jdcMPqS5/TfxhuNdeYSbi/y6oKDQWd54BeoLH67cuXnHttHzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6nSqQ8glRSbCauI3uUt4rS18W8WqtO0o2GDIenmgro=;
 b=WMVSpXcf4VMt2vBiGiMg2/7jNAvjlAkB4vEZK/rLEf5sBeQtHK3mH6+ZCZ4aRgLdo4PEaUFDvCwDF6K4BX6nhD5nYqr/9Ln+950u6IJvqn/IiCP9MAPaRD3gDT32Yp+acN5ICOJTgjzOvYoNN6Vziw89GVn1G5cUIb8TibILuB8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1972.eurprd08.prod.outlook.com (2603:10a6:203:4b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Tue, 1 Jun
 2021 16:51:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:51:05 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 17/35] block/copy-before-write: cbw_init(): rename variables
Date: Tue,  1 Jun 2021 19:50:08 +0300
Message-Id: <20210601165026.326877-18-vsementsov@virtuozzo.com>
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
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:51:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1db5cc37-4d36-4007-98a4-08d9251d72a2
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB19724D703DFF6854F19AFEACC13E9@AM5PR0801MB1972.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a9pZrElhZNxUac9F6nx5FowBPOCzwh/mL9ewVCgJ+sMa5Z+HHqp5UrA7uf0+sRevFshSGaQAXTFIYmv6gFHxGv0rrhe9JIXnjtzJ9awHfVHJmCeiaAimeReIq1Cg9AVde9UCx9g2Xe1nHZZlr8X4oqEq3/neYPUV3YnwmRYCcazuh6Ufy97QFdWdETMjgHJD1K3Y+B+rgBhNJYxRFIR2xKkQ5ElXQOcd35ExlgmiA8UM0uD82AEhBhedKGgBKGaQPX0DLlEcHxnBs4NAbXuC84TNaAuut0Cn9D0kFuSnQ1WC5ZcB0A+uSXGCYPywapC/c86uAKJdOZg+2rkegOQNrtsLqkxJ2NTOfJ8ZSNRuTharZVMviQlycb96k5HYstM9iwPidRHK54MPGehY54aG0+xlaAGgvhNfhPVURT4+VKnYqImsDP0ufRuf+dntdEli5kySI7vTuPxdkPZpvfhc+8sd5BonkaQtIh6BhvtQb3meZ1cdf1zzbFj0P+AHN2czl0CrYHMANZyUP15WAw2xvIrci6/T7yEGBy9cSO7B777e8cEvog04idlkjk+8a9xwwjN9z6UggfD5BmCyyigbjik+iSk9jkEhoNf4sCAyRXULckHNbM+Bbit2oPbHgNRoBKNRWRvZvQ9nMfJWSzdQkyldgB0ns5S5iHNhKY1rgr1TXhiPjljpiI2INI4VBMV9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(39840400004)(346002)(52116002)(5660300002)(2906002)(478600001)(26005)(6916009)(1076003)(8936002)(2616005)(6486002)(38100700002)(4326008)(16526019)(186003)(38350700002)(316002)(83380400001)(956004)(66556008)(86362001)(66476007)(66946007)(36756003)(6512007)(8676002)(7416002)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?KcmviOedq+uvRz0OQq/Ko8BnuuRunVzc84dmI3gF3Sz28RqWnd7VGPAc3kiG?=
 =?us-ascii?Q?HjSwN3kuIWjZijtIOPf0jKokHvEhdQ/OikjnvWxehleqZSq5EjpIzw2Lt82M?=
 =?us-ascii?Q?PPXIc1wAbLpLRxhP/X1Jh2sMR+OYrvtMkkhgULaWOXX3AwfNzJcms2rSla/V?=
 =?us-ascii?Q?5LgvCJ7oKJz9Ep6PGvpt7HtVJXjG7tAdk3ko1FPYltbNWiXdNUQMl5A6sGmo?=
 =?us-ascii?Q?qLBSAaygq4/s5EBrDPR/r64tPKOPK2Jmxxvlfy3oXah84tjacC5u+OOSnwQN?=
 =?us-ascii?Q?KGydGN/KbxHpWxbOsEshs6XT/AcbGYtZJmz5GhXtF/yUFTOqihRjbRCh/5i2?=
 =?us-ascii?Q?IqP3fPCMYduFHhgHDR/l8ojoiYyEgUlwwQkaWBKsGdnsA8ZpIXAvT+EPZ3GP?=
 =?us-ascii?Q?hJxFxd0hP47Qnpt2iHpZo+5geIyLeyfDip5atmZFU/zi2L+jRy9J2wNA2mNh?=
 =?us-ascii?Q?5+wdw9dkNNOHUGIlwpl3gtBp4Bn90Rw7aQONnR02lOMwdD9qhs4eEbh0Rafp?=
 =?us-ascii?Q?o6kWSHhgt4a+ZI9dd+e3ibSWMHKYk7BpjGxcOIZ8+DE8ZMNlSn5ebF/clLFp?=
 =?us-ascii?Q?aI0Tw1EknRlcpETS1NkHKGxK1TomEnHN+PjZQ1EHNST/uodxMuuhK/v7YgF5?=
 =?us-ascii?Q?G6pQ9RKkO1Qu4QglH3MGslFXHPVj3fpNkDvypiQi4jUX6X2jR0L2sdnWUC1s?=
 =?us-ascii?Q?VmeFimRHYc99qw38pzQT1+oY+xx0IWmVdG4ymBO8UKK+WaUD6/WRZ6vJDlFq?=
 =?us-ascii?Q?E+m7ZZE2mPAhvCiO6WZxVwn8zMY4IUsxWVICAG3++6jixUr+nVyhs1apJe/Y?=
 =?us-ascii?Q?woKvJ8LjF9VKHgT0TYApAllcL9bdonFIaHZz/Pdvgi/nPetiRjUqDoec1YHn?=
 =?us-ascii?Q?Qsu8osWDvs88HEQ4ZvHShcRsCo9Pj2NXG1pVzi137856Ud+xEtvSX1LAA8ZJ?=
 =?us-ascii?Q?1C0nXgHIa5e0796eI+biSig6FRlQ2AHnP4g2ytvpHtU5uRJM+JmwfhIj5NE7?=
 =?us-ascii?Q?SJB+rvSpJDRKecoz/Iu09xaJXw8HPQY0rrHn4xxNsQKMgmqrLvbKBP+d2mYO?=
 =?us-ascii?Q?wXTpD+e+Hr9nT22CMF/822FLuxjOkdFEDwVhg2RikpE/A/YMpi2hRVheKdHx?=
 =?us-ascii?Q?2drphaaFgmgG72l8jiKKFWe9YvPQ1bElVGYr/Zh7I7amGtivdWHeX31ORt8j?=
 =?us-ascii?Q?Is+t/BzlEK3lnteAj8n3xIsWLGGcUbyJhOeqHosJc8Nbe5Vr0X6WO7UGwPqI?=
 =?us-ascii?Q?N4/TI1Djxk9cpFz4yz8QWAEIST6fAcT61NOCnsyEWyC1xTEdrig1/UgoRVDO?=
 =?us-ascii?Q?FcqjqJG1WEA/F2r37xiY/73P?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db5cc37-4d36-4007-98a4-08d9251d72a2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:51:05.8378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iLxg6BGIRJWQTfRpBuK5bdWu0pQzqwc1loMd7bTVCiho5/sqtT3hYWQirz0jKKp+4oF9mkgcffM3sLb9Nk8IzX8jOe+hMaSeAfGb4YBbLRc=
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

One more step closer to real .bdrv_open() handler: use more usual names
for bs being initialized and its state.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index a4fee645fd..d7f1833efa 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -144,38 +144,37 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
-static int cbw_init(BlockDriverState *top, BlockDriverState *source,
+static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
                     BlockDriverState *target, bool compress, Error **errp)
 {
-    BDRVCopyBeforeWriteState *state = top->opaque;
+    BDRVCopyBeforeWriteState *s = bs->opaque;
 
-    top->total_sectors = source->total_sectors;
-    top->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
+    bs->total_sectors = source->total_sectors;
+    bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
             (BDRV_REQ_FUA & source->supported_write_flags);
-    top->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
+    bs->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              source->supported_zero_flags);
 
     bdrv_ref(target);
-    state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
-                                      BDRV_CHILD_DATA, errp);
-    if (!state->target) {
+    s->target = bdrv_attach_child(bs, target, "target", &child_of_bds,
+                                  BDRV_CHILD_DATA, errp);
+    if (!s->target) {
         error_prepend(errp, "Cannot attach target child: ");
         return -EINVAL;
     }
 
     bdrv_ref(source);
-    top->file = bdrv_attach_child(top, source, "file", &child_of_bds,
-                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                                  errp);
-    if (!top->file) {
+    bs->file = bdrv_attach_child(bs, source, "file", &child_of_bds,
+                                 BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                                 errp);
+    if (!bs->file) {
         error_prepend(errp, "Cannot attach file child: ");
         return -EINVAL;
     }
 
-    state->bcs = block_copy_state_new(top->file, state->target, false, compress,
-                                      errp);
-    if (!state->bcs) {
+    s->bcs = block_copy_state_new(bs->file, s->target, false, compress, errp);
+    if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
     }
-- 
2.29.2


