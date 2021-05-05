Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD68B37355F
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:09:58 +0200 (CEST)
Received: from localhost ([::1]:60952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leBfR-00015h-QF
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leBWJ-0007wd-Rr; Wed, 05 May 2021 03:00:33 -0400
Received: from mail-db8eur05on2095.outbound.protection.outlook.com
 ([40.107.20.95]:22496 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leBWC-0005ys-Pl; Wed, 05 May 2021 03:00:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJRHzo2OWwG4BWPKqShX72+sVNcN5wcQilMRNw/jDquHXt3HalkL8WP/JDiK7ZKsL3IKPjVqnxh991SF1IufYI0xcboVWKpUY20H0W0tmupobwTcEw0tF1QGy5TaBlAV6Dex1IGd6UeE9gAbk2WHKpqOwL4Kn9eR5ilwOoebxR+d+IAzvcr1AnETTG0PN4742+gDaFcFKsbS19Pun5C8ivgty6OkUEQRnqMqVF8y56oLfCM3hxoXkBAGeSteIDC5WZy5A3q7I09OP4za8FVyBvmDrCoXMzxQlIvRlYxjwd0S1mvfkEiRctUQiknbs5omh/CTv0jurgQMSDc4gN3GZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYpsKTlYtMDBxc92hcBHQaJSSzgdGhHnQzOqqmwnDiQ=;
 b=HyblsqVTLs8LOBl6BDq1UR3xj1RB5iRTWSP/8SF1aIfLuBziimaV94BPDalhun5ZGWTVZAkEO8eINe2wWNHrpWlwS46OIxIdag0eHleshNbYvjWMS6nJgqnZWU44u4xyV1qn/2RLdNNF2v60/QImEqVADsl13gGxr6OQ3dw3NjXOGDf3u4akGKo7afEpBXFZEHD/eR5OnJ9VDy2JAv6Q0NoL92gQ9jp042DvO+Z+mXVYL9V8j1uwG++uJCl7S3/ok4951b15epo4w31Kr7MILtLwZ7SeQStGuaR4l7fB2nw428Vcs+f1L7GFQ5juU/pn8+CIIUh/6yPj9q1QqWYPqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYpsKTlYtMDBxc92hcBHQaJSSzgdGhHnQzOqqmwnDiQ=;
 b=ObD41VeRcxUo6z0wtSq/S8KdnW611qyNQzd/p5XA47RDedTSrB/Ye9VlDbbbPrn5MO5ZMK7/Ab+1FZnqb20FNYX2nNln3o+VOqtP0roMGglu3i9dA0yqB2tkupwc9PGGDSUR+B/ABgcvVQDvcbS3PhVQPjk4x4XN0ntWNXEmf4c=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5493.eurprd08.prod.outlook.com (2603:10a6:20b:102::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Wed, 5 May
 2021 07:00:21 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 07:00:21 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, ktkhai@virtuozzo.com,
 eblake@redhat.com, berto@igalia.com
Subject: [PATCH v2 09/10] qcow2-refcount: check_refcounts_l1(): check reserved
 bits
Date: Wed,  5 May 2021 09:59:54 +0300
Message-Id: <20210505065955.13964-10-vsementsov@virtuozzo.com>
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
 Transport; Wed, 5 May 2021 07:00:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29f779b0-35ae-43b7-6749-08d90f9372d3
X-MS-TrafficTypeDiagnostic: AM7PR08MB5493:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5493B06CDCACF8AE30C980E1C1599@AM7PR08MB5493.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:257;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p4kqrZsDHStQUshyUb14mxKAo5Dg4mycW0savMXlkxDuHZi2fFJulxLlARkA+CUz5TSIN0FRpqZuN1xWWnjqOP0iyB7YhjpyUG9fSwrZphjKU4qbj9SfAXiOPosLHSjB8rh0qONnxz9Xteog1XJOWT0ZRUbqzpvznyHxFpZhhytI47LO82nLAX1g7+DQ8xT5lMNfm0czzB+Op9bfhmnpA+rYmfuKwJGq8XCsodjT7bkGvHdEcy71TiA4KLvYIEpTZXnCpYCe0uejH6FiCqXEyPVaeEqOnPpldn4dgS6zcC4jENRFdwCD13ITd+/XYyRH+KCAhc7b2FyzIp3Lz1RqLOZ+DFuO/0pUfVxa2uJQcnVYEI7MSwQjEgTqDES3h3OBaAoSBPSJvCik7H2DMTrbWu+iuNYsaD1zltv09uNLNX5eEiqEzOUU0K0dpoEZ5UDlJVlA6Pz02aVSflBQkRB0BD3ary4PPS/lidESdcPzoimHEDULMeueSn+6WpJW8BvGr+v2AXF2YQBnGY3GDqvf7q0LUv7ttHV7F+MZ/9be/BZcS9kLOkNwXGHTSqB41HS7PUONB5BiR4+rDh72wyEU5KqU7/41XS//yPMrZYWtpuQHiY3jjesNNMACnppu+JQAP4ZOwVYTAvJIDXuQgjm1K1EUQG0duxil7C/qDBf+QgCOXoUqMHr984w5SOKEQ0xA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(376002)(366004)(136003)(346002)(1076003)(8676002)(38350700002)(2906002)(5660300002)(38100700002)(4326008)(36756003)(16526019)(66556008)(6512007)(66946007)(26005)(186003)(52116002)(83380400001)(19627235002)(66476007)(2616005)(8936002)(6486002)(956004)(86362001)(6666004)(316002)(6916009)(478600001)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?SrcYCx84K5BPONL04rOKj1bR5IOBuBXXOD30zsAGl7GCpA/tvdtGGrvclJbz?=
 =?us-ascii?Q?VYaJDv3fcoR8BHPqua3wImeIxGkF4ttbocMVwgMP1HC5RGwI6xe4QxzqmfX4?=
 =?us-ascii?Q?MQfa8F7MsF5yPz/5PEDEuzOBdIdP60keay3e/b+T0Uona0T/ZX1YZgVjoK2R?=
 =?us-ascii?Q?0ureNqm5iIsQL5z1fgZapp7OiyIxXeoJZmNhoUwxqO3d/Q2iKfTSl3VXYOe0?=
 =?us-ascii?Q?kx4QUQYMGH+y5F/CZKaDhv2U6f0ChxN2xckV3+HHA0Ghvag4tV2cgHde9UZS?=
 =?us-ascii?Q?XqmbMlW5QPFGKLjPjEyavT+2E/r+7xxAbd0RutPqoMld11xetfWXYOH+gulc?=
 =?us-ascii?Q?U/UxKG/k5qt2xVB7HjZj1qa+LPT2lKO018mwzioHtN8hE6ap2ijnaHq6RuU/?=
 =?us-ascii?Q?9Z+IaZbY0lSiJjGDqyUplnMQQMuLIDTUlikO7sRMjp3qjdazdK2eniFWPiQJ?=
 =?us-ascii?Q?TEkymC6DCeglxU4PJPW7j5HVXu+qtXA5dCYOwh+axUkdBu5akzJKMGLCGAZC?=
 =?us-ascii?Q?LdPiIoiZNyQ/IYM2j2mCsdwSfT+UDnz34LufGlxqLvVUP033hVjx5c6HAux3?=
 =?us-ascii?Q?68XfD8tCv3df1w2lmdtzegkmCINvsFsQ90XljD65iALNnADV0Rk4EYHoe/KI?=
 =?us-ascii?Q?BjS0irMnCWAtaER1BmaifDe8u0uT1udededkDEyBtcPuN4syH2lu7UAy0kjI?=
 =?us-ascii?Q?mX6h6CZ+YDrLNkmhitxFvJn+6R6iEjmG4wsneUbaVkpdBcGj0KaLRBZq7Mje?=
 =?us-ascii?Q?HIXgfn7R/E/gZLZTGum8Fs6Hx5rfC76JW8sLDXbcDpNdZPFhzzZryCOsfs72?=
 =?us-ascii?Q?+C09G0V1BXPBnVHkQ0JkkpNRnWnLEHtUDk3HQaC8ccHyxYqw/pWs/9Q5LZcj?=
 =?us-ascii?Q?rHhBdMClw/K+ZXPxu3Kfi4CK6E+CiiHT7DQMj9z9Bk+I2WI9COruXHYVpF4U?=
 =?us-ascii?Q?MptevteHwZY8eAnYNMtQQFur3Na2IkwhaOVC+c4MgOj59efLDnMV9BAapF5v?=
 =?us-ascii?Q?FAe9plCEGOyPt31SFFCnUWD/Bx23dP/vZ6yMixfWSq5ssPsE9Bzixc39QD1u?=
 =?us-ascii?Q?0WAJZH5QOcwf3D43q1L/BeWT/zTdY2V5KWCeU7jMoVrOuAqbLnJ2B+59YxPt?=
 =?us-ascii?Q?8BYoR4ROXnQQKQEF1hLawDxc9tezWZ9bk9JPpP6kIqiq45TLvanv1dTaR0GY?=
 =?us-ascii?Q?kTniD6F0SmBQ4OwNlarn6ISryO/1TP7KwESf5Jjb4WduxcdsDBVoxQR+aW+A?=
 =?us-ascii?Q?kIPE+NkQB2aXhafpwUr2JtOqNKkg/s4nkm8Crcw6puVx03VqhRXiyVxD9TRk?=
 =?us-ascii?Q?4eUtCggDcZFk+S5Njbhh2jSR?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f779b0-35ae-43b7-6749-08d90f9372d3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 07:00:21.3201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rdl/zGAtj51njH6H6WEPuoYoIqM2ePAGllYeRiYYuPNzYGDIKDx36Jigy5yfcrro+LBWLqif4JDoix4dM6/0NjyQLWRQKAm/DtSAq2EzBho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5493
Received-SPF: pass client-ip=40.107.20.95;
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
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/qcow2.h          | 1 +
 block/qcow2-refcount.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/block/qcow2.h b/block/qcow2.h
index b8b1093b61..58fd7f1678 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -586,6 +586,7 @@ typedef enum QCow2MetadataOverlap {
     (QCOW2_OL_CACHED | QCOW2_OL_INACTIVE_L2)
 
 #define L1E_OFFSET_MASK 0x00fffffffffffe00ULL
+#define L1E_RESERVED_MASK 0x7f000000000001ffULL
 #define L2E_OFFSET_MASK 0x00fffffffffffe00ULL
 #define L2E_STD_RESERVED_MASK 0x3f000000000001feULL
 
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 69294a94fe..15c4f6b075 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1904,6 +1904,12 @@ static int check_refcounts_l1(BlockDriverState *bs,
             continue;
         }
 
+        if (l1_table[i] & L1E_RESERVED_MASK) {
+            fprintf(stderr, "ERROR found L1 entry with reserved bits set: "
+                    "%" PRIx64, l1_table[i]);
+            res->corruptions++;
+        }
+
         l2_offset = l1_table[i] & L1E_OFFSET_MASK;
 
         /* Mark L2 table as used */
-- 
2.29.2


