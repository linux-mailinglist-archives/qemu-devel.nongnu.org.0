Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 519E747E62E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 17:10:21 +0100 (CET)
Received: from localhost ([::1]:59788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Qfc-0007iW-Dg
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 11:10:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXl-0005CG-Km; Thu, 23 Dec 2021 11:02:13 -0500
Received: from mail-eopbgr150094.outbound.protection.outlook.com
 ([40.107.15.94]:1607 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXg-0005Ky-4y; Thu, 23 Dec 2021 11:02:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFLvdOFlIWW0orY69KHwEkJZWTg7k6XbSYJ3Ibnqftd1mNBSNCm+qeJrPoZJD/9+fufxR81yEjZbj/4045uNH8WMnAw4pxVNEFCIM60bgFcA/YWKwcEcBU+/qA/IGGW/lvyKyOpIGx4KISTc0S8MJRWvcP5sw2G/UTZv0eny2nlMrw2tU79a7zWnc2Ja8SYr5DoDoDFIQF4KPk/S7lzTFyg0rEug75BUNTz92eIBzSs9Yc3TDKHpxHnAdXOOxbANnMeHOS2f+OVzJjYBy2a0KcNf/mKpu1g8O/fLPqegkKyczDlpP73IopUWsD5nJis540Mvz7YdHT7W/g+RvDhm2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBPMoASQarVNPpivG6QfxwVne5VyP6pZdhBUnZyQXb4=;
 b=GgXJPQEYiG+7/ZG+Yzjz/HebQrdh2WM674HWajBJqtXKeDEZarll4mflhPdPjtDbgeCYSCaWEt8WXVsXWnPCq/ujcXxV1caLjTLRbH6q6rlgYTr8Fsf0f5k2pmROHxMsWowlYsc+989cnfH+svstcm+XHv0gnB3BdrfJp3hFNMSP4Pondl0RS1kXLZFihKLaZN7SKLMi+ROONCOMHZLaQ9VOggYK8oE/ef04/6+OtRQKvwMQfJfQmRSpzQ6D/+tRSHdbYpajj8puM3NSOmL6UEhdxlrnzT5fsb+sJDBn1xpfxa47HHtKQPnlAd0NFWcPQpmnfNgnhTMVK46pwgiDiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBPMoASQarVNPpivG6QfxwVne5VyP6pZdhBUnZyQXb4=;
 b=ds4bQzccYDI4HrGJWNkU/reyc58xuEfs6ea6Mbn3STQuUAzyAfgmJNNNpG5Ig5/x5578lHMaHeS2gCa2Xnq9Tdhr0niTtPMgcglrtzBPZo/bp4AZAXppYa+/KFFIWnvgUsYJFdx+5wOuNtFslVtReSqiT2AfZCJ2T/ejKOH8IAw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4147.eurprd08.prod.outlook.com (2603:10a6:208:12c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 16:02:01 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 16:02:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v5 18/19] iotest 214: explicit compression type
Date: Thu, 23 Dec 2021 17:01:43 +0100
Message-Id: <20211223160144.1097696-19-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211223160144.1097696-1-vsementsov@virtuozzo.com>
References: <20211223160144.1097696-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR0301CA0001.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::8) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3686b378-2d58-403b-f225-08d9c62d8e72
X-MS-TrafficTypeDiagnostic: AM0PR08MB4147:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB41472025B9F5A6D86BFA95B9C17E9@AM0PR08MB4147.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CmPOdkUHzeqhJn8FS5qWnuEWU4RLC7J2OdsCTXIAe5n7KM9GUUPw57BbHlUoNN1JNwPs4EEoGxQg0uJIPrT+B5MkR4hiHDUcspa5lYjW9VsjxVy9m60GznEEgNQ0w4tD20umKKlTDN2tLuX4TLdrmZP40Aq+6AfollX4WB28jrz0eJ378YgYhgkMgddEgBM7J1czxh4bpdPh6udnlQNiBz3UiNvZTO6nbPCItBVgQ5C7a+83NIt0WC1MCdPqZFZCrLSKt+f/RW3EaVUSzoqePhdEoJmKcpUAyBaybiLNQtTsoCm1tYYqelPNwmSpccIAV006vrozIP5dhYyypenOLOMaDvpAUrJCmSrWisSuAv8aYFjaPDH1906zodvHJHeA8PAmbVGYrKSPh25ZrnM9iDU1bA84S7wcLvmVabehXqfnOdbhBfj7l/LlUPxJyrH4cLlm14KjUaEVYgwniUJ+QoFXGvMmY1M+0rKAW0xErqRHGIZm51IObnzTHTVq+dvk2QaDEewKP4/sgV/wDLQj3eaKuIFuscT/gYQPn9881YyfFoU9pZMMRr6nx+vzRqyr9k0/BbzDooafjL1uS+3XkFFUk5v68V5SqpzXJzDyn6alkI1OKGBJRD4D3NoHiETWNw4ljHIk2kHBuWSg840x2ShL/i4CWEZMx7+CGL070cvYn2AS255ag8TWJkkeSAmhA8YzNZeXdPWl1xVz2ZhISw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(186003)(26005)(36756003)(508600001)(2906002)(6666004)(86362001)(1076003)(8936002)(316002)(52116002)(8676002)(6916009)(2616005)(5660300002)(6512007)(6486002)(38100700002)(66946007)(38350700002)(4326008)(4744005)(66476007)(66556008)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eMAAC0fr/2sWa4qZ5W25f3an7fsFp9tE5EKq5e4ZaWIdpv7aEgp1j/aCS5cW?=
 =?us-ascii?Q?vYlzKJe3RKLRgYXqDSvrn0YDunvw/lthuG+je33iHud8jBpsq1+q+JHCGrj4?=
 =?us-ascii?Q?0S7p2QZ506qbgk6pWTcF5vA/X3sniXavbfFdA46SSRxxiO40KNmoEOiedtHJ?=
 =?us-ascii?Q?N5opPQUYSVwAoHPblnPsvK5ZAyk/+b03c64wu0tthNT/8AltnWDGQx87Rn3W?=
 =?us-ascii?Q?Lo7gFlSI6KCF6zisv54PvfzpfuOoBItFfLBRlg0PKVWD9qu4AMTvIQBfFp2N?=
 =?us-ascii?Q?OmTyZuQKgBcSNgHyXkdx5hBm25ZbAeXcJiSUFoIDS9HveiZPl3p7bdY2bJzS?=
 =?us-ascii?Q?WsdeFc6oMbCplcyqmBjE4E1XbLQ356Pi5qDMqdeY6ioGy3gaFa6DXdcfjvTA?=
 =?us-ascii?Q?8O9QyzKAOkarcYtFv1OXRBGac/YQqTkZZ25muGysPIZ3jJAPSQiS+x9hXTyl?=
 =?us-ascii?Q?/a7rlbvHAywrvFWi5/b1ljQpjA8NAPE2LDctyLfTxZb4/xLdqhV1RXr2OvrW?=
 =?us-ascii?Q?4i4sAm/aPioTrkePy1ktTdLbxmccf5MiaFE+pf8Gt8reYvPmWAnLRvi2pGNY?=
 =?us-ascii?Q?mSpDdOyjZD0SJmCDbDXT4000XPykpkm152i9RibpFbiy0AbjxPgxZNpwT4oK?=
 =?us-ascii?Q?/FBAf9QfboRgs0t1V3OijGQn6+97fikvLW3AvvnuCcLCPeHpYhWDl5Hr/+2+?=
 =?us-ascii?Q?Tn6ceiEL2dWcYbGUpBtX0YQI5SdGMFDludEOli+bGtVUzYtl1xR5E9VVPzkA?=
 =?us-ascii?Q?GGA+4uiUY5xBFiAS8c0aHRd+Go9eiqyyuEebkY+hYfflgEGWHKuGH3H2tPZF?=
 =?us-ascii?Q?kHzbLcfRSYT212lK0ZagivHWQLPDxkK9yFmgdE48yCnL3VN9ioiwik7w9M1K?=
 =?us-ascii?Q?6in3/IJaQocJrlgtdH/xHfaiDGK9AA+PbFZbUCVe+aJM8WkPXV44dXk6K20l?=
 =?us-ascii?Q?6PLuK/SkfewpbzJTjtr+/XArZTuKRdubBcdUHuyCborMW3jGJv3m+zgbBSWm?=
 =?us-ascii?Q?MXA6fAJaVzkhJMTxiqJMfscAql6IpY9AQOdlUVDvXmomffQzZRMg0dyjwPIR?=
 =?us-ascii?Q?G9HvRoRINFauv8mE0D+FfD1gMKwfoFgIw/D+uL0Wkazm/LLxrSPKA/tIrLAJ?=
 =?us-ascii?Q?dHgKqGeSMN8e8PnWyFecrCQMF1UyTaZafRhTliiwZZCV040f/jywSy32iX8G?=
 =?us-ascii?Q?rdVcp36QFiQDMT/MBpdAxGCZHbq0Z9Xt4OYCsd3iN6fuQ9l6ayyiDPpKCma9?=
 =?us-ascii?Q?cIYVxFDnkDPDi3nvVrEMQtbVsh3en2wir7b1ROzU3T3iB+8tIyR5NXdYFbky?=
 =?us-ascii?Q?Ndy4v/z63caaUZXdHIu4W0RWTk0GyBmkihHBCQZfyohs9zP2VB+vNxf9Xm6q?=
 =?us-ascii?Q?6Fu/Z9dOYHs29aEZcW8Ogp2kwnerCOW2SOIfifvlLCPbs9Eh+WcaBxsFu887?=
 =?us-ascii?Q?/u9hgIQymLTBLAYb4lZypoYiiudoZTH74GLbYtava8NCKSsvR0ErpYZqKnvT?=
 =?us-ascii?Q?kNXpOKqn+jtORCNuUynYVpqxV2F2NzRD+IVlhARQ4OK98Ybck4S4Bu5tGqbu?=
 =?us-ascii?Q?CxNDFSUq/VXKLU3cftVA5YdJIiplFnoBmG9e/VbV93WKVuFd97lYc/XfnEbA?=
 =?us-ascii?Q?J85ZqC3lc4DzgKH27J7XJMykuqWSJ59k9EsVF+c0W1y/HWPk1QA7+Xoc8PmU?=
 =?us-ascii?Q?28iOl/ArhD7HjzT5q5zq/rwgfUc=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3686b378-2d58-403b-f225-08d9c62d8e72
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 16:02:01.6610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4uU2VVwvoH6UrlzxIrv8WaRA7atAjQiQ6uaSHNLiLM1FJ1zEXErPF0hw5BiTN8QtuS6jjhb54R6BgrxfmtBmhZrJENHeBwXQ+50NOPJXBj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4147
Received-SPF: pass client-ip=40.107.15.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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


