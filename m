Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3508E373560
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:10:27 +0200 (CEST)
Received: from localhost ([::1]:34234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leBfu-0001il-8s
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:10:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leBWP-000816-P4; Wed, 05 May 2021 03:00:37 -0400
Received: from mail-eopbgr70118.outbound.protection.outlook.com
 ([40.107.7.118]:64516 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leBWN-0005yd-TQ; Wed, 05 May 2021 03:00:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOabiUTc1+sHPeI6BwiMX199snKRb+9SQglc7e2RPc4fOHVp+NJW7W70NAeyNLt3KVclcRe45/Do/rnCTPr+rzRObz3CB08PxPZx0wtnYCpn4w+t6RNcufww3Bs6pHiLaDYcM9UJPulgvQyn+JyGmHYfd9E2suZmTBVdDVhP9TTzSrbuBafdVIHg0yfRWvV7s+9cCVTTizzj4goyY/Zxqwv1TJ0j3HH0IdcJcKPdlHEe5qezUP4+cq/CG0tVEGxdEeHVhESRb6XSZgbkv8GblI0WQGOhzt2ranTLoyhANYetv6/NE/MqntoTJEwpJBPuwVVJ6EiiL3Bj/Nkqs3Mwiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mITfNRwR6VnM4DdBHnwK8EKwU+7oHqkKHfJG9q6oxEg=;
 b=DKnDH1ImlRjO/AA/K3i+R2ZePWiN02U2qVOlVRT+r4s35il6uiO3bjVnZewijdblBsKYmny+d8lRbOj6qhlwvjF8Ze6t67ykKHAGit0vNtT/eFqv35TlAecnQcp7X5+u345Kh06+HKJzPx8JhlyPbgWHk0hLf2vil/uHyGlkoiNPdoUGS/feDblaATl0HA62mOcK1Z+VQvNoipFU2EMOovj/Dqgl+gwACeVzQdPNCB0nSF8S+tcJyyDBTkekjbgKxJOoZLkdSHAqVR73kY3EI7fjALXXJaNisF1y8S5lWBVpqDQ+zJoXoXA6Aghc6/5MveARLJVXljSXTTWsk5uKoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mITfNRwR6VnM4DdBHnwK8EKwU+7oHqkKHfJG9q6oxEg=;
 b=OPUablxM/AVizPFQTvjeguab4xmzQJc2gP6VMeoVURoH00kr4ft7EOy+UQSoSbF4I3cGb8eFLFX3lw9DAvNDjuzMhMCh4B/JrzWHUwylsI7yLxEJHpH9HcJMGggjYXD+HKKJD4NjT4Ju+Cnn9bZMsBUPJgMnezk2/FIhNqFJoCc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Wed, 5 May
 2021 07:00:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 07:00:22 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, ktkhai@virtuozzo.com,
 eblake@redhat.com, berto@igalia.com
Subject: [PATCH v2 10/10] qcow2-refcount: check_refblocks(): add separate
 message for reserved
Date: Wed,  5 May 2021 09:59:55 +0300
Message-Id: <20210505065955.13964-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210505065955.13964-1-vsementsov@virtuozzo.com>
References: <20210505065955.13964-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: HE1PR0101CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 HE1PR0101CA0013.eurprd01.prod.exchangelabs.com (2603:10a6:3:77::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24 via Frontend
 Transport; Wed, 5 May 2021 07:00:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a8df628-f93e-4c52-9c38-08d90f93739d
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1652F2A6DA9C1035F93A3650C1599@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:198;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kYuxYfGXmXkwqcDJ3BeQAUXfFTDRyzmIAGoGKWTdI5JrHrG8Vl2W4MRRaROD4oRN1yXq5Xx4Lc3/2KWKiES4dfroPSx3LrpSa6Nr46YzXgYNNcWPs8I5Hfm3HLEC7A9JcTXOPXa+LinXhpRHnFJrI419sbcI1m8q7JrRpcMnSnWAuh4ZMxxCkaOm9HePHUgilHuXjbrK0MP05S0lXsV9StD2XTaNx36BfjXmrFT4jpDoAFKoPsBKcAoqhn9VT+jfid9EkPELW9LWd9qc97KH0L91WEIVKj7NsdGLIXIagOKILZLAvZEKrRG4Qtr/SXepoYaWEhpPuFYSxymp9Z2z8yNL0FuJleuB9JfA5k9ExhtyV1Pw3hJBqNk9+43kTxO6nIvGKGKIxjQVaQewXiLRP3kndRFl/1X1u43MWkMVz+kERyZiVW4xa2zHg1re89jqOyuOoxTo7C/BKXqhLTq5hI17rWPSxcSVW2znsomv0JxY/ko7Zt2wwN5TAofJC5q/y/q66yXU9UfUZZPw3O1xXIh4glmCG/FITb1kn9MPDtn4eRIXzK85CEOeixSpwj1KD0baqHEkZWpZLsBNS1fYF3pXZiObsRgOSkL3x9DbMoFIrJQ20yasVMc3k2hecdgPkH/r+CNhyXpzwRDsX2n/05giZXc5oJhqwPLl5DiRTY/HyKRVTCEmKYm56LSSTZJA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39840400004)(136003)(346002)(376002)(2616005)(2906002)(956004)(36756003)(66946007)(19627235002)(6486002)(8676002)(8936002)(6916009)(4326008)(6666004)(16526019)(186003)(6512007)(1076003)(316002)(38100700002)(86362001)(38350700002)(83380400001)(66556008)(26005)(6506007)(66476007)(5660300002)(52116002)(478600001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MbWL7ReUS263FwZm2+z8LoTQslzjhtstnCxVCjiFpdn2hMDNMd5tu0dvXKgP?=
 =?us-ascii?Q?VVDLblLyBa/2he/3Epd5CgUQtO5wYX5yiFUo6VU3PSUUr+vt7RLxzSe+HCPB?=
 =?us-ascii?Q?AA4D/J3o0Bf8UIQW5J1jBlIbE5dbZk2TogRwnlwS58qcwwDFIDDDK8Pfv8zD?=
 =?us-ascii?Q?+Ee3ZUkeCHgQ9NcAJIGES/GVmYgtv6VQ3YtuDYZLYLc4EEAwRYi9gn+v5fKT?=
 =?us-ascii?Q?ElfJr2mxKgRRkYRVHVZPF4LD2ByD+mh5E9HocLv+QHIkQbB0Wwj2O94gJrVp?=
 =?us-ascii?Q?6p7IpZaK7TgA3D7Lp/AysErIjPf98ny/qcxiKKSckARFwEgKP32RcUkcc0Uf?=
 =?us-ascii?Q?80qqw+7ZuQNcAktrqR6nGPFG/NEFiBN4IrLPMKxEKbMQzPVxCfwD3l7Q8P78?=
 =?us-ascii?Q?5BSDbwN996HU6oW8vfH2ZFow0n+cKWieSb0UjOhsoRwuXtR5+4Bbkuot6kCs?=
 =?us-ascii?Q?TuBgeH3wluP8FlYj+zaWrMK0t6WRfKef6WpfXTUW73SQDMNJ1ghzvPntZ2yI?=
 =?us-ascii?Q?xLlWU92mxC5I1x6ykIdBC/yP7w7NMmcEWNjzpoAa8zSklcbMOy1YzcWa+jMt?=
 =?us-ascii?Q?RiwWANYiB2WiJxri/oa2ilHWs1Zx8xlJWd2fhoal8mnUtSBRNsl/tuFskvT+?=
 =?us-ascii?Q?9mrYiw4fC/Z8zUAJZerDeDBFBfYCYE6psIKHYl3tQGwlp30CWf+RLfxA0lPX?=
 =?us-ascii?Q?aPcsESJrw4+8EBh31hyYVz9JeYYH+Pv4WLSGSnDQs4AsQRIJ24I2QHwJwTUF?=
 =?us-ascii?Q?qD9tJ7i0Wg5N+7GpUchVIPGoma1I5m2rto/UObdCWNZEu40nrWsZXMkkXufV?=
 =?us-ascii?Q?gSf4dbxda1TSestECu802b48nWU82S7htNDn8t+RjopluX4Rhj8vrZm+dYpU?=
 =?us-ascii?Q?5iKlwWXIJoWzdKGPTNc0+5bUE2yBORP3xm3OfBDR9v+hb/mxZ39Aax9IzbGi?=
 =?us-ascii?Q?dRBDlkRpxJbExzcuuheOPdfRZNB1ohfsfEWEBkmpyOaVz8+HRDU7xQ33QNrv?=
 =?us-ascii?Q?6lYKcifQfr2uNjctr3BMAGzuFX1u2fD/Fyk9PiZaJQ/QZYidpcga8a7xjtlp?=
 =?us-ascii?Q?ycj/acVxeYHdNrzpEGeIP4ggAUVC5CgI5Z/K43wIqE3g9HiKdwFhYmYvNIAb?=
 =?us-ascii?Q?irclgHe1JwuaavEVI/vcuccU+cSfkjTlOO+MibYU/a0Xkcl+2Eqjg6cawonU?=
 =?us-ascii?Q?2JHUNKTLhW4coOASsa5aT6BFf3P4lachhJtFTtVd9xTtmTmUD+hOjhruZHvM?=
 =?us-ascii?Q?Vbs6fyTSRsx431UMG3ouQRfQxlt08DqKlWTM10anuES4O2BYj9Oigu8RBaEx?=
 =?us-ascii?Q?05K5o6A4Ky6zGvAGLcPMFWG7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8df628-f93e-4c52-9c38-08d90f93739d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 07:00:22.5168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rTDGgAlGC3YItuO4VzPwcFV/sm5o3Wr8UNkaxCG6eVUAUQqF279GetoWKGkTVtDI5UNFIHvegn/e9pOdvsBs4Hopd+C9iLj6qw6wNorUe/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.7.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Split checking for reserved bits out of aligned offset check.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/qcow2.h          |  1 +
 block/qcow2-refcount.c | 10 +++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 58fd7f1678..fd48a89d45 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -591,6 +591,7 @@ typedef enum QCow2MetadataOverlap {
 #define L2E_STD_RESERVED_MASK 0x3f000000000001feULL
 
 #define REFT_OFFSET_MASK 0xfffffffffffffe00ULL
+#define REFT_RESERVED_MASK 0x1ffULL
 
 #define INV_OFFSET (-1ULL)
 
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 15c4f6b075..472a7026db 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -2091,9 +2091,17 @@ static int check_refblocks(BlockDriverState *bs, BdrvCheckResult *res,
 
     for(i = 0; i < s->refcount_table_size; i++) {
         uint64_t offset, cluster;
-        offset = s->refcount_table[i];
+        offset = s->refcount_table[i] & REFT_OFFSET_MASK;
         cluster = offset >> s->cluster_bits;
 
+        if (s->refcount_table[i] & REFT_RESERVED_MASK) {
+            fprintf(stderr, "ERROR refcount table entry %" PRId64 " has "
+                    "reserved bits set\n", i);
+            res->corruptions++;
+            *rebuild = true;
+            continue;
+        }
+
         /* Refcount blocks are cluster aligned */
         if (offset_into_cluster(s, offset)) {
             fprintf(stderr, "ERROR refcount block %" PRId64 " is not "
-- 
2.29.2


