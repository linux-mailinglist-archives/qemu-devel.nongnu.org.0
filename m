Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B848D372803
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 11:20:59 +0200 (CEST)
Received: from localhost ([::1]:34402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldrEg-0002jT-QQ
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 05:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqwB-0000x3-AC; Tue, 04 May 2021 05:01:52 -0400
Received: from mail-eopbgr70111.outbound.protection.outlook.com
 ([40.107.7.111]:44193 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqw4-0001yk-Bp; Tue, 04 May 2021 05:01:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cftMbmOWNQLcLQ/sMd0xlczRQ8GO8nyqUD6h7RzJU471h3VTASMo72TkeAY9fEZ8esyDhl+EoZ6mO0AgS5fEtXWdbDSl7iBpEoXmy0GJIqQ5PRFzxwLXgJCrWvZnvqH+dP9mlzcecrwS1iqKVhjbQTrqH2auO1z6xte1rg+a/YSrkO6XwFtejK1fAoEfoE3dQpYZF0EzEQrIdUq7Nzl6pWybrhQUkSnQTZrKzm4Dr1vxgr8YAigBro4O5tnoh5r2LRplGJwKwDO0Oi5Uf2K+U1Utb8yIb788FCQwWSKxPi6nvheksmfaaBB5YEHDN3ZY+6tkN7IzXGN+BdjEFv5d9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guRhk6dmphbdiOmIJPMxDpWhjWH4+mX/MXne+N+xYcQ=;
 b=jxYHpnUGgFxuC5AqoF2mELT5AhFV2uC9exzRZeW30iJ9nsXhGXQExquS5mY5kjgS6eATHQ7jZQ8RMTAvGNbNBbPK0fgt3TIyQ4K1F59b7hzmHzkFlFRSQ2yW0xRFmwueLomhmpZpylXqH029CLUkBiTSMN0ME7PGwYmHV7l7aoebBeuS8IAvWuqtQUYGHk2SR7qX55+xVGOSbCVZnPCR6Zf7UKGSwnTnSfZtjfrouOI+5hgyGhlbDkyRfG6PAWNsqUpqIbVFmcksFf0ugGoc7i+UxjgypZZc72Zqyp5UVjfWe9YjFnVQUIF78OF+/TaS8EPElUqxs2OYfKmfLkwCEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guRhk6dmphbdiOmIJPMxDpWhjWH4+mX/MXne+N+xYcQ=;
 b=MZPbLheLLPf8w3Ei+HSyaXEp/8LDJwTsjhpEoQSz4JYGw8i0hRW95eOOpW+Ln3SFBXavlYwzexYqvyMkq5igC0uSxDcERTm4FKPiRVSOFtoY9uyUdi/EC16PzmYK8ce1nJSkQljO2RodFyIPlxkliychrcpD0fB2yQn7vbwDMoU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4280.eurprd08.prod.outlook.com (2603:10a6:20b:b6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Tue, 4 May
 2021 09:01:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 09:01:33 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, peter.maydell@linaro.org,
 John Snow <jsnow@redhat.com>
Subject: [PULL 5/9] simplebench/bench_block_job: handle error in
 BLOCK_JOB_COMPLETED
Date: Tue,  4 May 2021 12:01:09 +0300
Message-Id: <20210504090113.21311-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210504090113.21311-1-vsementsov@virtuozzo.com>
References: <20210504090113.21311-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::34)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 09:01:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c7381e6-8da2-4512-61e6-08d90edb3706
X-MS-TrafficTypeDiagnostic: AM6PR08MB4280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4280192D743CC21FF8B0B7E9C15A9@AM6PR08MB4280.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 67FBI5p6QUEp8rQmDQ6dxN5uH8XSozBAye5fS7umTCB/zKEQGOX6XeYhGbw7F0QNwpbWnCY2XI+LA5cZ8lRBKCslEkOwq+KXNebVViodEaxz+96RdPPUQeKcoPFkc2oEHg0mTgja2yAo5gYVsYdOBIW1cJYr3sEEGo/MnUKkfjuVGDcOI44pR67le+rNn1O+yjINkvnl0tQqCjc3TeHxjJta2bcq4Ttdkyqr8lwY00a7G0vj1DF8hCYJt4H9KqMDJdEsUWsyDtuHYN3qT1DtvcE6/C3cNRXeRL9LDBk5YAmeVtensHBYDfli6I0X03Az3zUG1JQVuc02Hzkh5ln+BeunjihNL08xZDpIUzSx4VyRlArLFgBxsDe2MVGRwDdDs38dLR3zKcfXRLIq3GAZdzTONS2qdP1K+CLMjc27tTt/nDzYSP18XEy+7XfpLJginDFLCtIqK76oDMtcBQUk+Qp0si+I906EjXJ3tHDrSfOxQIdRwwJAsy96p24LSJ6UUYHAVx8FoXnjGwbm9GyhYlEYt2fGbjm5NnN2z5wr73rQliOLO94OzpsyOFvjccZ2RT/ft9eqTP5mQZRXd1zlhVkGCPpyefzn4aCUieprsDOKGhwJwXD6acl+7PO8y0Eh4i1Sos5N4Q/Eumgw54H1t1XL0UNt/RCT6fNlQwp1O0zrXYWa0VTyWYmgKVzVtw+T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(396003)(346002)(376002)(366004)(1076003)(66556008)(52116002)(6486002)(6666004)(38350700002)(38100700002)(4326008)(66946007)(66476007)(316002)(4744005)(26005)(5660300002)(36756003)(6916009)(478600001)(8936002)(2906002)(86362001)(16526019)(8676002)(2616005)(6506007)(6512007)(956004)(186003)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?jLh8Tvt3/pknq0Ny2J9K2ajD7WTT+cNHP1w/LeT6bUJfbbUf3XslX2Fo1Z5R?=
 =?us-ascii?Q?04ruKYplvs+GtiUHtQD3q1pOwtpr2DJxqAnfmoVsXHGISKun3GC8vn/lYEjZ?=
 =?us-ascii?Q?Vh8DmttHQSI50/SshNxr0Rrwg4H/Ckc5kSClrYP25Rs+B9rz/sni+AMt6FFP?=
 =?us-ascii?Q?vr/2wlQcFa707FuLARnyWogDd7m0xrjWJcDWR7QKV+30Emakz/Y3+hlGspFg?=
 =?us-ascii?Q?wcQddgZSlZ/JC2C1Q321kEBMzbU+k6KbIHzYcSTCgKVyOxSUYjUYFCqpVWkT?=
 =?us-ascii?Q?s+l6pDRBhVHGhra07VmNS2pb4h45XS9mm69u5/s4d7feQTrbbI+cVkXxv7qz?=
 =?us-ascii?Q?ic/ZpdyW/rMfvklvQjRdbPMLlMdzMEMdGFTnlz84qFs6Acfrfa/OMvMgbhez?=
 =?us-ascii?Q?o9Tsn7t+Zf7YnwSUT/RgeNJz3SxXPfemY+YeK4KynUKn9CyvGAMIFQTKuf8k?=
 =?us-ascii?Q?+QHvCNZYcQ931VHVWQd/CcBzwAI1Dqep5mHQzd/TpmOfrJgcxYy53ghWIJf7?=
 =?us-ascii?Q?o5WpRc2EHqaouOpDW/bWLn+UHsk8RegSF1vafw51LNFcRdsaVLjlo9W24g08?=
 =?us-ascii?Q?C35aGOCcCuA/PGtoG0FqP+eH44Un8XieI2d+XZcGA6qJCisapptU4o9OKHEQ?=
 =?us-ascii?Q?ce8sX4RSO+q1AvF67E/L0GvNrNBN1Ul+DakK06wQTTti/s/gU7zt+Bdo88CA?=
 =?us-ascii?Q?kNzClMsmenxSHPe+lbqFT/+De51byBzQVRg8I8vYovGK6s+S6UIidhE4i8Q/?=
 =?us-ascii?Q?O6b3h56DGYE+GHBWfxm7QWmidsbraQB01mjfDsTTaer5hqnIf3JzZmIFBVf6?=
 =?us-ascii?Q?x/7E2h5QJuRYXfQLKgzwj+TBh45o9IbULbJTVVfrTKndDZ4ZSARSKV5KlNS6?=
 =?us-ascii?Q?zIKvW/cMi1ltLNouG4dowP7/UpVDDXUDRQt9mbutoN5Z/4Zr1nVJIaXoja6n?=
 =?us-ascii?Q?ofFV0EauV0rnYNduMfDNpn9xuZHUjL62D2r8FtW+K6CnKjciPjf7xk1s3AfD?=
 =?us-ascii?Q?AusERqUqgPiEhIxng6bKWgiT3WX5faNtwFi6AYvG3SLDAepWx4qg3SLyDDgK?=
 =?us-ascii?Q?tpmOwk70JuNKQZvrTApjU4gWiGFRYEYUbsdqPfgJfwMghzSduEeJyRUX2O89?=
 =?us-ascii?Q?SIOSj0E/Tj5APSvNCgXWYZfDuX14naz1qu08PsM1NjGk18hRPDhZASUOTgxw?=
 =?us-ascii?Q?MVR617JFWG6/xY3uThRtVt1cJf11XfMWajntGL18AUFc/KCKICYX6I7gqK9b?=
 =?us-ascii?Q?+EUr5e/+RF3IxlW3m9gIs2FRT46Kd6pAHjvv5NMR1ISuG/HeJ8dZNPm2N9fF?=
 =?us-ascii?Q?5VoyL0a0QmhDybOQSDsTTom6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7381e6-8da2-4512-61e6-08d90edb3706
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 09:01:33.4612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZDC1BKavJCzH2CL0382k/rYkSuQvYMDedfY2maBcz4tODiO8VKCAs9YNOYFZaFn3TnuOqCh6GlZ+pXyrL8UiujhA0qj5BiYopZ1ROUa9RDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4280
Received-SPF: pass client-ip=40.107.7.111;
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

We should not report success if there is an error in final event.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 scripts/simplebench/bench_block_job.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebench/bench_block_job.py
index 8f8385ccce..71d2e489c8 100755
--- a/scripts/simplebench/bench_block_job.py
+++ b/scripts/simplebench/bench_block_job.py
@@ -70,6 +70,10 @@ def bench_block_job(cmd, cmd_args, qemu_args):
             vm.shutdown()
             return {'error': 'block-job failed: ' + str(e),
                     'vm-log': vm.get_log()}
+        if 'error' in e['data']:
+            vm.shutdown()
+            return {'error': 'block-job failed: ' + e['data']['error'],
+                    'vm-log': vm.get_log()}
         end_ms = e['timestamp']['seconds'] * 1000000 + \
             e['timestamp']['microseconds']
     finally:
-- 
2.29.2


