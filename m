Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 720BA481646
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 20:26:55 +0100 (CET)
Received: from localhost ([::1]:59042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2eb8-0000tF-3f
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 14:26:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2eWK-0006bC-AW; Wed, 29 Dec 2021 14:21:57 -0500
Received: from mail-eopbgr70107.outbound.protection.outlook.com
 ([40.107.7.107]:6337 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2eWF-0000B6-VW; Wed, 29 Dec 2021 14:21:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMnlTw95WcdaKPpVZ0U5nVmGauz76bh6R8C+RZ0iJGMIcb7j7YW+NJrnWr3ZUgzNWtFxDuEsECKG137M7GxqcDO2YpJq00mOmSxB/YVTlbyMlciUYMf1zFQZ8jCs3kFFataARjhophccYOd32uxBZSzCngg0HXP03i8DS3kD6LRSXzEVKKrNInpDx7g+LrBfCCk7ofLzlkNWIhreIzSkG2dh2c/xLpsnEF9oA9BLOQInCh+xvOJ0cPNdzU6GSCj7pu8/EfNPeOjvQyIOuemAtPHqjdV6WtDko/dGS2LqbXonsPKGvrBH8Qao50HXUu+JdLeAykCxV65x/KEyOzTp6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4yPRjkH8qwCYrJOwOXKV9Jq+PT/sa0b2rVxOh+oEVM=;
 b=bQD2K7xnc2Uhz2oD1yfU31/hFCKqYVI+vV3W4hLqs4SAqLDEoYvWMxUeeI2NscEAu6PMZVQJ/JKm2KgLWsM85fsUY58/deXieem1dQnT86LAQhHdjXlPoMDeKdyVIzOGSj4oG/+Mkc1wCqP7mzjXSTPKs1xr9O7nEVoM9uGUnG+Ep75JT34bI2+yANVs5jhAL7b5+ynvpzA7EJUnmeHGMVOpzmEEb9Wq6UjpDf+xvkMDN/oNE0LCW+qlkkclrH3kWVJ6oFkTUBP3Atxpx2hvmjA3+oGMQOpdQ6LgkMuJFiVAKntZqE/z4Wr/4NJHLcRQ/IlYWxtmSzkFlAjM2AF6pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4yPRjkH8qwCYrJOwOXKV9Jq+PT/sa0b2rVxOh+oEVM=;
 b=oPOCmjRfml+9hRtdtdw6CshSUqAacXOUaxAm5Vx2Sqq6uWHgIF+RWB6+NT6cFoxC+mw6NHSpRzqDx7jqWje6zyeaqXO4OeueZ+RBfUEMoPGvlN+rxDVp8UnfDZqiWXFO28l8kCfSFojkojh5uhh40zFCttul8h/JlLDpmBQJBKQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR0802MB2276.eurprd08.prod.outlook.com (2603:10a6:200:5f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Wed, 29 Dec
 2021 19:21:44 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.023; Wed, 29 Dec 2021
 19:21:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 vsementsov@virtuozzo.com, jsnow@redhat.com,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 1/6] job.c: add missing notifier initialization
Date: Wed, 29 Dec 2021 20:21:22 +0100
Message-Id: <20211229192127.1772134-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229192127.1772134-1-vsementsov@virtuozzo.com>
References: <20211229192127.1772134-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0152.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::7) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0faad136-ce96-4ab7-1dc0-08d9cb0072ee
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2276:EE_
X-Microsoft-Antispam-PRVS: <AM4PR0802MB227699B2A046D137CBB06C7FC1449@AM4PR0802MB2276.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WtrEPN0OJDn12iDL5hGBnXLH8b488m16Q6spWH9JOtEnsMwT1ASNMEreEG4dctXU+13OCCM940pN5Mj3I2tv+w1TnpFlYCFmyf0K94v/KaGs9bJqn1hatiuCl3eZiAiR/f2desC5hvPsk4Qy9cnzRqYC94gTcsFxr8rwzlWkpAYIaO7/e8bg9IQt5cF8+/AIRj7OQlXS7MHyS1BiWFIAklQgLMgVNwJjZrwkUjkx0WlP3afxfX5uLIeh4a7fsvn9HlOYv71JVTeP/Ukd6jiu84DOsgaG9rOkhHITOf0724LuYO1BPB0reDy+YzXwgURnI0wB0xKRXrieaTBRLbkPy2xuDCkxHQGhCT+J04cMHiEPWenLINbal4z/KADFamck2VcvgdNKP8qz8hyXmScTKNRuKJfZorkX5usB6huuMjZXQPfLfJIOMj64YvCGVd+YoYiPw5jLc5fMoldQyoyEaN57IoP9VDOPZKEs4Quc8W90r2HRWvPxemeSbpalwpADU+W2GS25OvGFkPkiY5iz70bPUl+m4XKCM0UdYKRSqREvbMEqjlXoDuyMFfnNS/vPG1yVDj4Y87+fbapKb+JVgx49kECrGytpc33LGTCTtHoNn8IsAJbIWR0zBuAINkgCeHq/genqW/tgM1UGnOuK2qdFycrHCFGikl5jHowK9NxFBIJ/6UXVxtnutEXD9O3wSGhOFwpIQtiQ4UBPOIU0Og==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(52116002)(1076003)(6666004)(83380400001)(2616005)(2906002)(6512007)(36756003)(7416002)(6506007)(316002)(86362001)(38350700002)(8676002)(54906003)(66556008)(66946007)(66476007)(6916009)(38100700002)(5660300002)(8936002)(6486002)(186003)(26005)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzdyeGhKWlFiNEVSNi9XUjV1TTl5SzFaY1Y0bUowZHV0aWk0ZURQQ2ZHVFcy?=
 =?utf-8?B?S0hpbEJyOTVhSTRzQjdSV01Ic1ZDT1pkS0EzS1VGckxBaFI1a2UrMWw5QXp4?=
 =?utf-8?B?TGNWVzd5bGxQdnI5WS9uM0JQeGpDenlON1dZZ09xMlduaUlDc0J4Q08wNmJo?=
 =?utf-8?B?OGxETmZMMTVETDA5dExTT29GU2JjV2E4UEtRb2xadlpsaUxLdDYyNTQrN1ds?=
 =?utf-8?B?UjZZMmpscGI0S0FKS2ZOcFhOb1pEQW5YZmRwSWpNT0NTQU9NZWdUZy9vSXp6?=
 =?utf-8?B?dmdVWXhoc3Q1VytxR0cxY3dSclBoeFVYU0NVQkw5WDZiK0hqVWJPckM3dU1D?=
 =?utf-8?B?R2I2YjBOQ0QwN05pMEthQWRPWE5LaVhsbmRDd2xscEd6VGNqRGVzUldRNkdm?=
 =?utf-8?B?UUxsS1ZrNjczUGxkdGRUY1o4R1ZuZXVHTGprWC8rY2ZjYks0dVk5RVgvNXBo?=
 =?utf-8?B?anlwMlU5V0xOdkY1MXlUS2dDaHI1cnhUVllISHMvY1hTVWpCVk1CNWh4SUtJ?=
 =?utf-8?B?b1JLQVRiV053SVl1SDBWdUVCVjdjNmgrTVdOajBBVHVmbzdPWW5EMmZyN1VQ?=
 =?utf-8?B?Vm5kbk9XRGJzaG1QamVHTjE3T3dic2h3ZG0rS21yWWtZemhkUC9CSGdESzZG?=
 =?utf-8?B?a3BUcm5mS0k2ZC9Va3VWM2VKM2pra0JRWTBQMzVNdXF1eFhtQzBpWW1Vdmhj?=
 =?utf-8?B?N0s3bFRXWUxURDFyR0ZndWlnYkpKbWpGVmMwVGRGYWVGekpHZWx4REowS3Nu?=
 =?utf-8?B?b1N0SzhjRmkvT2o1bDNpOTFiTTMzZ0JLemJrUXIyRUloUm5SUEsvUUFBanVG?=
 =?utf-8?B?aXh5ZnVoZHg3SExkSUZKcVFZblUzSTA1Rk5rdDRST1llaXhjY1QzRzdpM0xu?=
 =?utf-8?B?TDFycHFOZnNlQmtpRnJwYW1Td1NueGoxR3B2SVc5ZHFCVXplbUp3bFBTQzBN?=
 =?utf-8?B?S0hYbGZ1WjdsRUJqbWErTnpleVNnL0RyRGYycXpBYlJJN2YrL2dyYzhoNUlo?=
 =?utf-8?B?OTh3OWpZbkZxVm90UC9VdUxNOXV0ZW80M0sxSklodHBCR1hOa01KWEVCK2pH?=
 =?utf-8?B?UzY0RWVsTlFsZmhvcGdEdkp0NE93ck8rQkZpL1JCWmpmSHdKZlgyVWR6Y2s3?=
 =?utf-8?B?cmhBeUEyMUR2NEZIaExwWU9MT2ZQVTd1OWpkZk1mWDRDbDUyNUxGcHR5aHJG?=
 =?utf-8?B?aWpBWit3R0xRTGZBL1M1Ync0WUpob2MveXRTNVgxeEMrM3ZERFU2Z3ZoZWFE?=
 =?utf-8?B?MUJic2JBR2hMcElibTlFTkJ1N3lBejZZZVlwd2NnM0p4aStFLzMzaHREcUhS?=
 =?utf-8?B?R1ByQ1g3R1BJR0hsNXJML2pzQTdFTFlEM0NVcGVhNHl1RHhGbHFuY1BPQ2du?=
 =?utf-8?B?ajQwRmtXODFWeC94Z2UwYjIyUXpKOVNiakhWWXBVRjhFUm9PR1BuV29SWGlo?=
 =?utf-8?B?TFROa2NFRFlZTEdHdEo5Z1kycHBaSnkxcG54c0Y2SU9TZERwa3g0bWFXRXg4?=
 =?utf-8?B?NURXTkNnb1Q3SWxJSWZaM09HdThTWXI2ZDJFK09GOUIzTlFZL0tiWFgzOVdE?=
 =?utf-8?B?eDQwQUdEdHdOT2swUlhFU294Q3RHbHAzNU9aVFFwc2lIT2g3czhBMnJWaXZG?=
 =?utf-8?B?bWwrVnNVNDJzemNsR29LWit2SjlwbkRPOVlrR3VsZnhmazNXWlRzazllcGxj?=
 =?utf-8?B?bkxqaWZuZHpiQ1RuSnkrd3lpOVJMOS9zbjlUWlZIZk5QT0tCU01OcHJpVzYr?=
 =?utf-8?B?azlQUXh0V2hhTEx5RENNclhSbHUxN3MxQS96UWxBRzdtSHR5YVVMREJhZGNj?=
 =?utf-8?B?T0s0T01hVVY4YVdyZnlPNWNmNTBTWkFibzV2V1JhR01mRGVUVFJwS2M0dmhQ?=
 =?utf-8?B?VTRJcEJCUzhEc3ZXNEVuWlMxOGxDYnZBQjZQWU5lcCswbXNHQ3NkUFFEMzRJ?=
 =?utf-8?B?TWN3N0kwRjRMYmlYT0V0VEk0bEJKczVUNitEdmtiTzNrYnh4NU9QRnhuMUIx?=
 =?utf-8?B?UjdvZEtCcnZLeU9YSDN1QzFUdXRYdThZeEFaM3g5S1BXNUhzdGVsK0xDNnAz?=
 =?utf-8?B?SHp3QklCM1RYSU9ycURoNUJ1aXQ1QW5ydWYwV0QvZzVWd0Z5eTAybXErTjBZ?=
 =?utf-8?B?dG9TbHlyODc2U291S0hBd0Z3ZTFIUCtHbVVGL0RQUlJKbjRGdGJEY0hpOFpC?=
 =?utf-8?B?cEQyWStFRXJSMjhKbDdtK2xjNlpqSDRYbUtpeXZYYTVtTXJyYjQxVlNFc2hm?=
 =?utf-8?Q?0IqaCFCPN+chMMqjQbPS4fLzM1WTLo1aSVFeqfXRak=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0faad136-ce96-4ab7-1dc0-08d9cb0072ee
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2021 19:21:43.9688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D+uJ74H+XyzUh0ifYFNFYcE+GnJYjvmu+7NSwEM08aU4a1qRCtPG2KSqqeZJ/AtSWL9qI5jVOQnCRxbPUfHlZP8hAk77eogcTgpxnnkAQy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2276
Received-SPF: pass client-ip=40.107.7.107;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

It seems that on_idle list is not properly initialized like
the other notifiers.

Fixes: 34dc97b9a0e ("blockjob: Wake up BDS when job becomes idle")
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 job.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/job.c b/job.c
index dbfa67bb0a..54db80df66 100644
--- a/job.c
+++ b/job.c
@@ -352,6 +352,7 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
     notifier_list_init(&job->on_finalize_completed);
     notifier_list_init(&job->on_pending);
     notifier_list_init(&job->on_ready);
+    notifier_list_init(&job->on_idle);
 
     job_state_transition(job, JOB_STATUS_CREATED);
     aio_timer_init(qemu_get_aio_context(), &job->sleep_timer,
-- 
2.31.1


