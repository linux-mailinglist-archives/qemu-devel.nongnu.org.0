Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD0D2B83A8
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 19:14:58 +0100 (CET)
Received: from localhost ([::1]:47768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfRyq-0002ow-PR
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 13:14:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfRpI-0004fb-4v; Wed, 18 Nov 2020 13:05:04 -0500
Received: from mail-eopbgr130110.outbound.protection.outlook.com
 ([40.107.13.110]:34980 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfRpG-0008Qn-7C; Wed, 18 Nov 2020 13:05:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0KhH2V70l9jpPElIscekX88LZmQ/iRJHzTk/l0kI+/1sw27RbZd6yRxCWUHUGV7Os/2y7g+4zKOzrMtbJlqsYwuD+XRsrlLiYM371iYpwtDgQSRtmpeiLf8OlSsAscS40RrSTJ2nrFgDH2WzENiUblRrsgctqi3mihfdPkDViEKvQLRqdn0deq4MvzCAhj7r6pfnP3W/lh8Lmu+Qebkp3Xs3RCLkVxHLQ6j1lIp4ovx94z02ewiHVOmUs4oWdjsAV620MTTTCpBBC4vE9WvNA+6P2WIwzlpWqwtqSR/C+wrNJ6NR3rp43NCWoUVGSloJXWHDiKLN62DE7hfIvb5WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyVCyf9dBHkPWsb7iCHyj5ACQR8Q4wX3ZvLLXdkkwTw=;
 b=beuncGo3dOqip8NEFgndOueTb8OX4o3Wnn/mmD1hN+o2rbIvxsaDzJ8XMqRYgIHYOwJkjxGna4rTolI1FoKS2SFOsA8+ayBhQ2+/dB3Y/9CPGGlHuBWFi0YpbsriVOq8xyHGV2lnoTs9quMvvohiNbMvrAdfA8Kqmo14UWnvl2IxS4dpBHVFfAb+qq4tm8Da5fTaiytIevT/eOaT5dji3YU9zDJwOLRDr2vJlc5js9ka8SMSCaCz4IDjvUIYbMjWOmEsWvZlZhuGuuegjoVqaUUyhx3oqFRUHE6aOgU5Yt3rCCAZ3wI2Fo174ElBWNjjg/ZbQ4BHTH3pIxsoJ3ukig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyVCyf9dBHkPWsb7iCHyj5ACQR8Q4wX3ZvLLXdkkwTw=;
 b=VCMOyAR4vb8Oe7dWPa97Da9eJPOTAecyYucKbTMn0kzcy7WbicanLniAwJBU3Iw7IskXauqTbbiAo5abaZR4+EYFIBI+CetMNEIfeSa92tQJ0bOSqUcvAIy3ZadokjwIIAC7TiU1yK4RQap0HjR+JO92psbBiiIzFFEq7mHW+60=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5912.eurprd08.prod.outlook.com (2603:10a6:20b:29f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 18:04:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Wed, 18 Nov 2020
 18:04:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH 04/11] job: add .cancel handler for the driver
Date: Wed, 18 Nov 2020 21:04:26 +0300
Message-Id: <20201118180433.11931-5-vsementsov@virtuozzo.com>
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
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 18:04:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04105e27-7f25-4019-3645-08d88bec70df
X-MS-TrafficTypeDiagnostic: AS8PR08MB5912:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB59123310EA0A2CAF24EA9923C1E10@AS8PR08MB5912.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wMQj742xRLdePW7lI23ikQ7fAYVJmb9WNjnwdYo4dhS0ugWHl8I4/gI4dKyW7dHUhySO8KkFEUHc6qSO4V5h1byljZvMSEf3gsiLpI00A2PN+3l0RvK2m5x+JcAEJmhyEotvxTWEKWN9rzolERAGYDS32BxCv5ejZVWXpp+oexbhzSeTr9PrM4Rt1W2SMFI0m4o+0/8n3nZ3w+xAdk2dVf/bJPhX+pGGbnGCeyOAiVYoemYOy27UxmPL3BzieitFfR2AcPvraldR4t1i4n9vp2zmSdY/puPErcG7xqJQEgXhNW2XMIYkSjb+dOS0LAs/fOKJS2w+bgOVatsazAoW0DPG9iLFxTZ/DTg/CVsP6IVcnRgCTkPQCYK4BtkApViC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(396003)(39840400004)(1076003)(6512007)(26005)(36756003)(478600001)(6506007)(6486002)(16526019)(2906002)(186003)(66556008)(66476007)(66946007)(5660300002)(86362001)(316002)(2616005)(8676002)(956004)(6666004)(4326008)(52116002)(6916009)(8936002)(107886003)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: lgH5xI8JiHgzYQL8B6Oxmt2J8GdcNMK34yqrMXjfVS99Qv2JH5NyLKie5+QS/satyryRY+T3mAGJ4gtwyXPeyJFBmgmYAEIBlFxTmAuVuTyc7cDbB6hiuVggFGtsibVBwcsVAdjd9HRFjZ1LuE5kwSy9k0XKx1MumS6pcWknaCQZG2AN1eBwPQdK5WdXfFMl4GdJzKD4kfU0YITJOBqZelpOyhEIwdvr/pRurQ6BNae5NXzwtpYlVRWWxmOhkfsHM9rChnwdGmer2ezVWt3PUg2vv/baRp8EK0ARF70k7jSXknWhiGCDFydyD4+4UOi5AiA0iclCj1c6rNzMrct9dOvuZWHk/uJvMFZplcyPwxF2UB70FcuELuaFmI8ghQ2cW86UT9DawejdBOcolurRDwby/fDuKmC/D7ZB5PJMZPOcL5cLqnxKDK9CMZMR1hfxjz0MThQ1QerImdWTvRD/kkziXaBA/YwXPU8r8UEoyXQ8FoDYMkC1WiyX2gZzArZ2u8Gz7GoFkrTb+AIIvqeICHAOXFHA4CyR6/I9GDE0FJ1i/Afeso7QvT4SoJ+TfX8CFDs8W2d/hOSLluaG1SXllsCy0PBaSdXnqcZxvD1cIuN4illLqghySSwoH6N4ZetcyBHzvxNI9Ej4r46I2Tax+Q==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04105e27-7f25-4019-3645-08d88bec70df
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 18:04:49.6349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /NN2zsUrkcw/6H0fjXyQQCZHAeSaiHQLCht8hF7pMZxMM/GA6HAMqkADybypjjG+ihRnmuTn7OHiwtpeYiB3AO3AQ1YtijNix0JWr6CYkr4=
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

To be used in mirror in the following commit to cancel in-flight io on
target to not waste the time.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qemu/job.h | 5 +++++
 job.c              | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index 32aabb1c60..efc6fa7544 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -251,6 +251,11 @@ struct JobDriver {
      */
     void (*clean)(Job *job);
 
+    /**
+     * If the callback is not NULL, it will be invoked in job_cancel_async
+     */
+    void (*cancel)(Job *job);
+
 
     /** Called when the job is freed */
     void (*free)(Job *job);
diff --git a/job.c b/job.c
index 8fecf38960..65012dbd03 100644
--- a/job.c
+++ b/job.c
@@ -712,6 +712,9 @@ static int job_finalize_single(Job *job)
 
 static void job_cancel_async(Job *job, bool force)
 {
+    if (job->driver->cancel) {
+        job->driver->cancel(job);
+    }
     if (job->user_paused) {
         /* Do not call job_enter here, the caller will handle it.  */
         if (job->driver->user_resume) {
-- 
2.21.3


