Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA74230BF08
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:08:06 +0100 (CET)
Received: from localhost ([::1]:53982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vPa-0002uw-11
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:08:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v90-0001dy-MO; Tue, 02 Feb 2021 07:50:58 -0500
Received: from mail-eopbgr60133.outbound.protection.outlook.com
 ([40.107.6.133]:57568 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v8y-00022r-PE; Tue, 02 Feb 2021 07:50:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=io/fnaF6JHK9zGiJcRP0JxNrS6jfVyTHMYD9ZgkOT98dXg/AzaytH89U6rje7RvSHPQ1+nVZWiYbyxo44pNLMNS3wlsCH+/W7wDlit0kl29UhHBQKc2wWFANfVXwrVl4U+QxTH1dFi4/4aKZpT7ITmvVyVkfhz5Fp2Xrb+9Ti5Y3swlfK3U0s+/ocR+jlAASNT7Zj5XM4qz6QauKTvNgcJtE8fzm1TIvuQu9jqBL3I20lFfspAKJe7D1NRFcP8Z8dUdmqheeYWBnNI2ndklGSSCNNJMKsUEl+qZg4zjLQHNPrAL5yjehReNa7ZhYLemAEv7i7D7B4tJ7hawrV6DvSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lt+3wuX2e86j2Pnvr5qrDfn07c0EWNcNHtEUNru6QU=;
 b=Ybz2c9aAd6/1sYdZJHLVkX0Y7503DMitLyBlC85EL90V94rROYoZviM2kfQRBsKptDKLSdIrLN1GBI9FsK25A9Bd7beYaequ5XLVSFvI51WaLkkF/jfzoKcRUCQ5sNZhOgrYehhtMx3mqgXmlYHIrKEp9gphYo5doRKxokvE9LJ1KCP2ZBZFaOWkWVDR8nlXKA2a2m7Q6U7hP3I74VVX3FFINusApdlEJ0so5ACvw8u4Dl3a/dHJsF8dA0X32nRz5YM1EDNqZ6EvzjZ9s0dvOpYPHQ4jmiaHZ/t2cnfjk/yB+cmZRmbG/32WQtnvqugbhM6WpCTBCf2VVUBPkCpEyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lt+3wuX2e86j2Pnvr5qrDfn07c0EWNcNHtEUNru6QU=;
 b=i/v0Q0SWoL+JI/YpM++dsMhd5jNiv0UBkBC5d369nnraku6ziMZvWVmB0353KpLPtyytSHmBO4XY4Lms7sBToHM2qYckag4q7kqGf0iXyrt4XgblGjcL+TEPhJa3q7Nbfh8T86BxuLhEr+S8VdHMEy+/rAvps7X9dkcVPqZ38oM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3623.eurprd08.prod.outlook.com (2603:10a6:20b:48::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Tue, 2 Feb
 2021 12:50:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 12:50:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 14/14] block/qcow2: refactor qcow2_update_options_prepare
 error paths
Date: Tue,  2 Feb 2021 15:49:56 +0300
Message-Id: <20210202124956.63146-15-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202124956.63146-1-vsementsov@virtuozzo.com>
References: <20210202124956.63146-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.137]
X-ClientProxiedBy: AM0PR02CA0002.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.137) by
 AM0PR02CA0002.eurprd02.prod.outlook.com (2603:10a6:208:3e::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Tue, 2 Feb 2021 12:50:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 140dc376-7e9b-4224-c425-08d8c7792996
X-MS-TrafficTypeDiagnostic: AM6PR08MB3623:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB36238B75AA8E88BC813085D0C1B59@AM6PR08MB3623.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:92;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hmiKRuSC5+U7fNBHIoogGnsZk0aj6mrINQmciQEV2Ebu4hpLgxqLobKqLgE0ztuRZbBJ+/DOBFywjA+blUtHASd6bACZzm7rFk520VrFUtBinYPmaU5apnFb6g6AuvKToch9P4Lp6wRNotfXa+duHjX1CkJ4IBApkoMn4xQvDRTZSKs5eSWd9B4HVLSI3Klvtjpz33Qoqspic8Z3q7mLWQkcDK7/vJaQPPy6DkOuALOsoNXce4HlONf1Bx6x8WNKorZ5ChtAgR+PjPSPp2ep+1p/UDvH/qCl/XQ1BHldlvmz1//4Gb9aiwh/Bw0P1rPn+qYtPripZPIkxHz93pb9ZBlAuigBQwy72jbNjOUt7bdXqbOdRcZbJLsJ1w6P8oVOgjBNSkOHJ5jMcFKcG5MjHuuHxhDi3Sq0bn/3Yub0P7x0CByXi7EzNIbYzy9bU3FdvURdIdXJbfvRpHfXe3jUDTNlPhJWE5L1lqbWOYdV+2H5zipAQ/dl/zoIS1FF6uTcIm/EyNMs5xNQDznkSKOAXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39850400004)(376002)(396003)(136003)(2906002)(5660300002)(66476007)(316002)(66946007)(52116002)(6512007)(66556008)(36756003)(8936002)(6486002)(86362001)(7416002)(26005)(1076003)(83380400001)(186003)(4326008)(16526019)(6916009)(478600001)(2616005)(956004)(8676002)(6506007)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?SciJhnn9yD94Gt2FdQ0acu55c1aOGnExUHpJ8dbSLOUCe3P7wwDOAKTqkEg+?=
 =?us-ascii?Q?T+I1YI7Gb9vmmBgnl9CaEsmN1x0gGenHYIKvMfZp4KEtczRiUNttXJ8VMn5h?=
 =?us-ascii?Q?HQO+Dx2XZTKz5LwamBoWRokf24FaNhgNNNYB9RDzfuPzQS62WsczShxHKf9x?=
 =?us-ascii?Q?8T5C6jXKFT9oT3wn9AkwCt9tFwtOKMbv1H7HDg8kRoHwgxbtVhh1D1TCUXte?=
 =?us-ascii?Q?O3s7JCRsmEmk8Hd6jtowf/SzG9Vy7e64Wb6YAnlrhIFIuXrWoTphV6CrqdYy?=
 =?us-ascii?Q?PxnSHFN5mY3bx4ajDe4ChET0UJfZybuO5UT058O8Mvr80HqMo21PaTPefZG7?=
 =?us-ascii?Q?kEUIKOw2pzoTpdmhcJVfiSfPInlJ0eXA1mXQspwFmlKWDwlMOuHN1Q4m8Ecf?=
 =?us-ascii?Q?VPI0xOZ1wKAi1w5lUJui4Y6vdRMMH7y6H5WQD1hrWhHqzkZQ83l5pPcwu97/?=
 =?us-ascii?Q?jvX1p7qg/oVIOcLxILBIxcBLNMjjg7EZIuZbAbeNDizYziPQ1NMMyhRfPcLT?=
 =?us-ascii?Q?+QyqcNmWcZF30fISx3S2IizOYGa8Py9MZldrZxYmctJDyMi23agclKWVMeje?=
 =?us-ascii?Q?z5uJcggqNAebc40XqmRLqwPEm738fftmTHPLlZWpiL5N6LMwyHpqkx0Xy1rm?=
 =?us-ascii?Q?PjheTDXnpg+qegQPftP1sGloyH7/aGL1DkdpQeJK5l/Y1o2AI9GGwM4jRecC?=
 =?us-ascii?Q?Ved3OJMfur46fmIoiPZWBkRclc1UR2kYmzbYjGD/c13d6MJvmNpmklSAbDdl?=
 =?us-ascii?Q?TWSpHkeWXpe/Wlv5uz3c7xOKK862Xvxhr3Ka1gdoqTIMulbX3ecqwH1Xbtsz?=
 =?us-ascii?Q?z2m5/XVw8kupwmcfS14FIvSR+wYNuqOA6+obPNfnu4nApkZFKK3YMG3TvaLi?=
 =?us-ascii?Q?isFKfhRQUfsKVC/haw2xDCqTycghArHMGf9kMnYDaXFpkLgn5c7jxC0AeW52?=
 =?us-ascii?Q?RCbW+BsnanTay9P8Tci9Xl9ABqUU9Pr4gsRLnE2M0Vl4uSaIIVZi+rMlKYYn?=
 =?us-ascii?Q?IURIvdBqty5Q7p32KIJq5Ixm8O/LaxyHxcIi5dPrabMfs/0dDr5C4sF09VKi?=
 =?us-ascii?Q?7hezmMwx?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 140dc376-7e9b-4224-c425-08d8c7792996
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 12:50:47.7971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kzCJH1hYMDv+nKR4EVHFPNBtBck1oQ3daBo27NuMS/qDOGqXGrzY5+uM1FfHxyMopMZF8gJgXx9hNRunhZLTP99uWVO9954AeTMkPnTcoek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3623
Received-SPF: pass client-ip=40.107.6.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, mreitz@redhat.com, jsnow@redhat.com,
 ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Keep setting ret close to setting errp and don't merge different error
paths into one. This way it's more obvious that we don't return
error without setting errp.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 436bcf0a97..0aa6ae1e1f 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1158,6 +1158,10 @@ static int qcow2_update_options_prepare(BlockDriverState *bs,
         }
         qdict_put_str(encryptopts, "format", "qcow");
         r->crypto_opts = block_crypto_open_opts_init(encryptopts, errp);
+        if (!r->crypto_opts) {
+            ret = -EINVAL;
+            goto fail;
+        }
         break;
 
     case QCOW_CRYPT_LUKS:
@@ -1170,14 +1174,15 @@ static int qcow2_update_options_prepare(BlockDriverState *bs,
         }
         qdict_put_str(encryptopts, "format", "luks");
         r->crypto_opts = block_crypto_open_opts_init(encryptopts, errp);
+        if (!r->crypto_opts) {
+            ret = -EINVAL;
+            goto fail;
+        }
         break;
 
     default:
         error_setg(errp, "Unsupported encryption method %d",
                    s->crypt_method_header);
-        break;
-    }
-    if (s->crypt_method_header != QCOW_CRYPT_NONE && !r->crypto_opts) {
         ret = -EINVAL;
         goto fail;
     }
-- 
2.29.2


