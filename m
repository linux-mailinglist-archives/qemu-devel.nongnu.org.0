Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 923444678AD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 14:45:08 +0100 (CET)
Received: from localhost ([::1]:50358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt8s7-0005kz-NU
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 08:45:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8Iv-0002RF-Ru; Fri, 03 Dec 2021 08:08:46 -0500
Received: from mail-eopbgr40135.outbound.protection.outlook.com
 ([40.107.4.135]:40808 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8Iu-00071Q-1X; Fri, 03 Dec 2021 08:08:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVY4xXM481F1wGAqXr5aYH2Wv8M41q6Nx8wH3VsFlqyXGg4/I5Umx5oEkUsnf3s4ArmiKtkYUA/o8DphRWjAhx2knMEHJMMWUGRPrqFkbc+7lDkwypFUIiCuw+CWRGjIbKXJIN3nlw2sfsJTKz4Z4ohvW8vEHu57s2UV+ZXilQUYnOipQHaL6fSWv7/JtZcLxSy9NZuvCevxJXUn6fjRUP1JbhRyGkirHmpTpSRmVzZFjeuLeKhYx42E5NbL/fD4r0kQo+rb9sCipHOf+NyU/5cZjdRQrNWri3ZFNEO8xCiDGfSPY1wbYauf+R0UDYZdv2bkIiEbBlRD0moCIAFMSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBPMoASQarVNPpivG6QfxwVne5VyP6pZdhBUnZyQXb4=;
 b=oR4SrMat31y9NPrf6NNWh99QJ2rxl7fUu3C3vKNW2sP/fRn/CtgsX9Wes5FlkZFLavNrJwGhtYlgeOI5d33Yw1Q0UMrxCuGjGmLcshhq2y1lGPJz/Ftv4W/O9b/ojznN8LxjZZh/HJa/O2LxVCG2ULfjXUNoA4lAkhNNatbPnIWgZIE0PZFj2ARJOtc9T5x38r4XSXNZDW12D3B0Ev/vHpY0Exak1X/G8R/je8vNNV9lH1/RvAOA1m+z2yizMp+ky9/0MJLtpTbj6UOyWGLmBukU6DQ9o0lwRxfvqJbq7K2+Phf2f/9fd7V059iZBdek0wyXtGXadodmnIkzdI4UoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBPMoASQarVNPpivG6QfxwVne5VyP6pZdhBUnZyQXb4=;
 b=b1tjXUFKy/P0Wxd18ABEmHMsIgV2jVk/hQfJXl4BdTuuuGnR+nIGUM0Ppgg2WIDZ03aHEuh7PmuOearu99ueuF/HI3yyNqULDevo+Ur9fR3zwa5tgYB52lioc9plGxSmKtA/0W9ORHWcxfZor7YQrg8DOIo3beui+Mgpkckxd+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4515.eurprd08.prod.outlook.com (2603:10a6:208:148::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 13:08:16 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 13:08:19 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v4 16/19] iotest 214: explicit compression type
Date: Fri,  3 Dec 2021 14:07:34 +0100
Message-Id: <20211203130737.2924594-17-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203130737.2924594-1-vsementsov@virtuozzo.com>
References: <20211203130737.2924594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P194CA0095.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::36) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6P194CA0095.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 13:08:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b811c438-817c-435d-e127-08d9b65df9f6
X-MS-TrafficTypeDiagnostic: AM0PR08MB4515:
X-Microsoft-Antispam-PRVS: <AM0PR08MB45157AD946BBC0F9D5D13D39C16A9@AM0PR08MB4515.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a9DL8bVK06L0wC++U6RNygTrJ7MHhB2DpUkBWXmvpyBMoGKpyn4YcVXSyWsf7TauIXdR4u2QwuCwfdI68mEsmmYd+/a5eVhsABTGVuAguWYZVHSuRXrTySTGPOFpzGd6YIgAgpIou8rlNt0NIPIlRw24C3GIdxc+7pPjN6rdw/gGA/SEqeTUf2DnBI4a2np0LOKNEUpDF9xwAFBq9mNYl+W4C7MKg1pPKxROiBt76PdG70ialcg9gJubK753YfJFvC+INm+ZroouNE9ICXDcn3HHo1XBHuMZV5tLTU6PQNmZvp6qndUKef5VpXljhl5eBdi/SUw2BXaRNKWWDFSnMqZ1gewuEkfEDfD4uBBCXjIK2x1D9bBIWY0Wm64PD7GIQtb9lTCjE9La0KyuapspqNvsOZL+/FzQp5ALTSrwTDH+JqY7h6V6vz+l4Z6y4g62RVTW8UIpgUwgZ+hlA0sjt1a+U0QNe172Cg2JGPXrT0uz7O+emhOt6EMrzW8HkK8vtjBxkUgWk8VKDtbaTnNL9uX3Ey2SCZE21oNvyEBgFEde8qwitaQIhzOyzoCNrXtG6SfZ4KMtZDpPjAOaVapX/4ZP4HVTVmOKay30PJ9HiDxRGGqclurC4tFM3BAU6lIaqmm4lOBJrePbRQcUDPomceGSWbR1B6aTZsZzxBFqt/VK4lBbIBCpPg5EfHasJsCum1b4n5/qBs/zt21BtAm0GQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(4326008)(186003)(6512007)(52116002)(6506007)(1076003)(5660300002)(36756003)(86362001)(38100700002)(26005)(956004)(508600001)(2616005)(8676002)(316002)(6486002)(4744005)(66476007)(8936002)(66946007)(66556008)(6666004)(83380400001)(38350700002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DK7ST1dZua+L4Lchd8YNA6rabu0h9vgKG9vx+Nt6cusNfy/u385GEDozWCYs?=
 =?us-ascii?Q?yKXUlN/aTx0lrrIMYZo0vTcWxZ3Z5ZGPGk+SiH1lbgQkRFUUE6TO2xkywGLQ?=
 =?us-ascii?Q?joIIZxy+0LeevKJzyddQPwrT3vEDi9RDMGaySyUO2A+6bkFMEhLsgyfvu4Db?=
 =?us-ascii?Q?q39Oz4Q6KmOrjG7rDjxPBBwAeGxBAVXoZK5r2XrTb5K2QYj+mQqt48bvnTUW?=
 =?us-ascii?Q?dI95YRRV/GdVs57cAUQJCWtOsDF2x7KWS/oYeLLW/x40B/5ouoJlfEqJdgOr?=
 =?us-ascii?Q?Cv1wP/aEph/YPWtWxpl+bIQDm5ToY30x/8dU+ejT4BE5kHiZysE1sAwXChq5?=
 =?us-ascii?Q?gsX9PDfT2eAsqOjTb1F6YlbIDudCxfEEcA7inxb+Fmimng8cyOv5YwUd6uex?=
 =?us-ascii?Q?HI4Mqur2SL1ee/zF/m+v4DvDRqgppgGkeEx0bMZFbLxsiYwhL3sC0tiilfjr?=
 =?us-ascii?Q?GRaf1o7JTkvgWsEfyplfwSTUTV/SNNO6riOlMcnxIQP6piaUnuUhIwFCBe9G?=
 =?us-ascii?Q?AyCz/TeROrNkQf4T2py/936TQ2TmX5FiIp/mNIfh5CoC6xDxi/M7CwJqmo/9?=
 =?us-ascii?Q?VkOLWOP/ayAIkybd76zkHgUgggikBzgQPDR2oA3zGpoLVghhkjq2oP6Mji+/?=
 =?us-ascii?Q?bBaPvfzqxBQOdn55iB5/4FkXJ1lDeaOV0YZ4Ei84gBzUFk+MgetP+TI+kt04?=
 =?us-ascii?Q?csKXzRqc/0bUOde+2CP6dDa4FHIVfzmFmOVRfmMGx7LnfLjOWllc8fdDylFn?=
 =?us-ascii?Q?6zptxnOB50cfG7yD9lVj5jvmTL1de2UjUW5vqlV1Ra85A1wP7sWVQhwlJGOF?=
 =?us-ascii?Q?EqWfe/+I7HMM92R2bdkxYDbZ21CHVVyFcS5QcspA3Yriwt3Dy0nRVYL7+87v?=
 =?us-ascii?Q?mgUNQkWcweohnXDL2JEVkaQOC31y/HMX3RLBazrnmNqtcq4CDPfP27tB5C0P?=
 =?us-ascii?Q?5dWZwU7rwo6V7wclfnTJlkILsXpUkpILvYKXPBM9zINJhqw4+ZaAeQOzK/5g?=
 =?us-ascii?Q?DqfcUeqFn82qX1WXz7GRYzilKdQvx003+OWlgX+/zjTccHN7Rq7Mi80PT+A1?=
 =?us-ascii?Q?Ri6tyQBsZg/pPbgn2QsfCHEOdAPfCzIGDXiCeQycRSInFvptIZwTZVUb4RK8?=
 =?us-ascii?Q?FI/vn3tu0o7WqleTaPG+2cPMjLTVQEsRUfzLDFlKzniixHeAKeIyZLTmDJyQ?=
 =?us-ascii?Q?l1VgNPu9hWkUAsbBXcN2q5SzsTKAvcdqMuoGXAY7of5i2J0F3xZNJHr2xloD?=
 =?us-ascii?Q?eWX7oQrLJoGK+RpyOPdl2A8wgZyMmoNUmGeUFAEUMgvuNwA6E98dJyGhjgGs?=
 =?us-ascii?Q?lLmLpuWIgWd7RBsIcTyjR7PRkDHnZfr5R/R+snausdQNFx+gldRG+wAb5bgG?=
 =?us-ascii?Q?oQJIaD1Pqn2s46ZKlhV8/YoG0X6HXmxLoqQYC4wR0b3xWtYQ7KmrHfZ2SoKM?=
 =?us-ascii?Q?Ha7HvAa3aqBzbaIv93XM7GeloRyK+sajgHCe3Z4klN/KP3bFWCP02Gep1GUO?=
 =?us-ascii?Q?1iGrCqAeMi9/7NHWADanD0iv02yNPav7TC7AbjQXolwU7Dhr/NjrOrpgOr9C?=
 =?us-ascii?Q?hMB+cP90xrqge3uNfKo0X/0v1hzKsdOF6LbNN0MIIvsmjGiUi68GjQNI+HPK?=
 =?us-ascii?Q?ULqqdB6C3Rta39qkXOLkBffbjYD6SkVQYIMyaXNXa45Mec8MA9efRQdf6Vxz?=
 =?us-ascii?Q?2SVpbA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b811c438-817c-435d-e127-08d9b65df9f6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 13:08:19.3128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iDWxu7d/LgU5sNNrkNQyiEL5S5bwEuakEkPMagU1iu8uebekTQgeDAkHk1ofstqusMsUC/FB52EcnhHounbzhsRZpA+bZRuG29i0ZmWF5os=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4515
Received-SPF: pass client-ip=40.107.4.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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
X-Mailman-Version: 2.1.29
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

The test-case "Corrupted size field in compressed cluster descriptor"
heavily depends on zlib compression type. So, make it explicit. This
way test passes with IMGOPTS='compression_type=zstd'.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/214 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/214 b/tests/qemu-iotests/214
index 0889089d81..c66e246ba2 100755
--- a/tests/qemu-iotests/214
+++ b/tests/qemu-iotests/214
@@ -51,7 +51,7 @@ echo
 # The L2 entries of the two compressed clusters are located at
 # 0x800000 and 0x800008, their original values are 0x4008000000a00000
 # and 0x4008000000a00802 (5 sectors for compressed data each).
-_make_test_img 8M -o cluster_size=2M
+_make_test_img 8M -o cluster_size=2M,compression_type=zlib
 $QEMU_IO -c "write -c -P 0x11 0 2M" -c "write -c -P 0x11 2M 2M" "$TEST_IMG" \
          2>&1 | _filter_qemu_io | _filter_testdir
 
-- 
2.31.1


