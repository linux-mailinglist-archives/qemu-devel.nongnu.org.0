Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 265442C23DD
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 12:09:31 +0100 (CET)
Received: from localhost ([::1]:38474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khWCQ-0000on-7o
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 06:09:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khW6Y-0004RJ-O0; Tue, 24 Nov 2020 06:03:27 -0500
Received: from mail-eopbgr130098.outbound.protection.outlook.com
 ([40.107.13.98]:10720 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khW6T-0007T8-NJ; Tue, 24 Nov 2020 06:03:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khnlY/R84SU6y0QV+kpmYQt7VxbJDi0VYflA7S50Hz4mOtBb+sRd+30/zKoyKDInvUbJ6SYmIWR1Ms6ONlJArszVHxAfmaTAb9KGcRw+F+AtocVXdB1v7gg/3qO/Pd6YO3mGgMaGpAsXswdgfVhWmbxLfkNc54D2ZvvKbAc4a1/hLYjIcJ/vEXPVpJhNeawBM24kTsGgJ17ZXqg18X3UVp9Ww3MIzUldKYAksJsQXQt3r1mW8ne8yHeq2+WXiaa+/GfIsaGRvprIBo+kNu20L2+jBlgNXjCECZeCUAU/+znr74UIUTBgO11twspJeEuGTRkPRP8gj0RBlFGX5s18lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a383XzbIMwNp9Bzk7Adpcs5xdstoKCXfMZ2Sij/NcMQ=;
 b=HaQfJe77Mgl3d/TeO0U9RhnjoPllrb17LYiC3KInY2zo/sbwxtfwpRlL1tN0BwUwddf+6YQs90mFwftBXolVBiUzJTA9KExvtV+0d/DsjyY2UoWFvwlHTPpjX06kGBjUlDIEUkVGxSIlfrHbB6JR2vemWaKDB3AvLHXBn40Cw6ZlNWSUOQvxx6mmWIS77sh1vdN3y7EpgM3tlCD0oXF5kdg/9wpz5PAiJEo5D2FU3nuHd2CR4dJ/ILHFoL1t+Cz5q7EtIEncugK6fjr6LyAQAqqFhaGbygu2mJwWFM7sZJtkhWLTx6zsYK01z34CF5vXG8zv92JNmRmo9MxmY1w38w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a383XzbIMwNp9Bzk7Adpcs5xdstoKCXfMZ2Sij/NcMQ=;
 b=L/uxdc/H/BZtINwpt/4Tat/mlP5azTLpWmtE8z5o2DykKg00AL8wGs5WcfI+qWlBzrcmk4vY9GSCx0FphwktGO+7/LzY8eZ+WAsBEi2KE6wfXticL0OrrnZmyQLqho2JmBt++B3Jp67i8SFZVN/daSAwARs8hJ84B82fHjFUq04=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5335.eurprd08.prod.outlook.com (2603:10a6:20b:101::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.25; Tue, 24 Nov
 2020 11:03:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 11:03:15 +0000
Subject: Re: [PATCH v2 2/2] monitor: increase amount of data for monitor to
 read
To: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, armbru@redhat.com, dgilbert@redhat.com,
 den@openvz.org
References: <1606146274-246154-1-git-send-email-andrey.shinkevich@virtuozzo.com>
 <1606146274-246154-3-git-send-email-andrey.shinkevich@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <edb0cc5c-62e6-7277-59ae-e49e721fa596@virtuozzo.com>
Date: Tue, 24 Nov 2020 14:03:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <1606146274-246154-3-git-send-email-andrey.shinkevich@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.100]
X-ClientProxiedBy: AM0PR04CA0100.eurprd04.prod.outlook.com
 (2603:10a6:208:be::41) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.100) by
 AM0PR04CA0100.eurprd04.prod.outlook.com (2603:10a6:208:be::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 11:03:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e895fc8-4464-423c-2188-08d890688aae
X-MS-TrafficTypeDiagnostic: AM7PR08MB5335:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB53355926B50315340A35EFC2C1FB0@AM7PR08MB5335.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RGg+WcHwVSodqw8dWx0YfN/LbPcgraQzJNGd8P/bmRv7mVaQXdJXmmuufAKJ0wex76cdxX6XQyJ848iHWhqc4kVDoTM4IPD51jVc312WRrdkQGprYrp5S16ka3cF3Z7oTSivWjVPl5y7sTJlaSM7KbuKXr8R/rcYn/GrkMzOtaUoqP4D5vH4NWlA1VdkxxSQto6Cff76efAaFkIf1FgFkWodK4SyjS8GvQstbnIulq6FLiZDTtqwkeF8t1mbPbekYOaX3If/pZTenpUYebVurvztybqqd2txZiy0xhV6o7Q2cz3PGx14NrPO0ViT7fQ/dXSJEmyXEtV2onE1m8OgA8tjHpmdAhC0SUVEQmU73TQyHJhR0eFprUljuQ1GWxzo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(136003)(346002)(366004)(376002)(16526019)(8936002)(478600001)(8676002)(186003)(52116002)(26005)(16576012)(316002)(4326008)(107886003)(6486002)(36756003)(66476007)(83380400001)(66556008)(2906002)(31686004)(5660300002)(956004)(2616005)(86362001)(66946007)(31696002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: vQIux543hVWOIQVqO4hroNVlMHEdcU5reyn6vbkBP7UAVbad6f755BoJqbPsKsvW4cqlFqkIlUdWYwsGYfSxM98t+GeiXIO6fecfPcbrTmlylSQFd6WDw1Llt8B893OQ8xcs0Czqa8hPfsqtVfm5e1fJr4G9dri+C7hvHklrEaX6Xh1gBR3/Od4wE0hJ1Grx54JnvNY2+syL2eyn8EF/PlH9UzCtUAW/nwzCpsIu29j6F/M/msXMmLWklyN0iwGy1zje4iqBKyzuepru1Ad1BFdkNrktYdjOtzOozFmfIkYVZq0I7PRE6nhX2DJGloq5aBrGbvoqKdM5t4mChkYr8RJNCt3utlrWuVImINkfibTGzmFjBijL7Btda58R+70SEe8+SFH3L0FoQ4y6XHcBJBbxoy8J6YaEWApGBxPlG4hDizdyEh3nZXtNCUoT/WstyLmw5IVx0ZpX2XkCCE7BtXUKdvR8umLak3vt5DAHApAuDbcSGzT/3ga6LNqsGFOLClDqKWpjnDbE80mCkMaooPskFBo9U6qgVNk5wZLEUuKHda3VkJDrck5z7jkCwRwjZBqnGFqAynKVlCOBSk2Pcas6GSZGYFxw0m0tdgsw8ou6c87yRUtjB8LDNL3q2/8B/1mtMtLpFvdmLPDoVKOjfF1Sikkm3b6MZPIYEARr/yrTw+3MEaciq4t18Of3LUhQxkmk2lXMkGzXZ/gipno8gNxScgLolJI9i43gBa27LbWvihnxEdwK/Jc+Mi55/hE7KR9mcrk9I2RLHl2/p75LUIv1bhYmt5nZm41ym1hPpWuZOEkNOuAaW6HweyMYkFcz7OfMT7zfibH3JKWbmufMjOp7jjJ8nPU/XDuSFsQRWKFNDxAyPqeDLO7JAMwS7b0yRxBBjPJ1mr9FBI4KbqNIRQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e895fc8-4464-423c-2188-08d890688aae
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 11:03:15.2094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ozCscgHPtErXOIrVLsq7lUC+6/kJgP5jFdr487bjGJzq8GXodPeCvCT4I+s8BmhqVIyLJ02vafjj+A35AsRcwQ6GiRdJReqDHFYX6nzVtTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5335
Received-SPF: pass client-ip=40.107.13.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

23.11.2020 18:44, Andrey Shinkevich wrote:
> QMP and HMP monitors read one byte at a time from the socket or stdin,
> which is very inefficient. With 100+ VMs on the host, this results in
> multiple extra system calls and CPU overuse.
> This patch increases the amount of read data up to 4096 bytes that fits
> the buffer size on the channel level.
> A JSON little parser is introduced to throttle QMP commands read from
> the buffer so that incoming requests do not overflow the monitor input
> queue.
> 
> Suggested-by: Denis V. Lunev<den@openvz.org>
> Signed-off-by: Andrey Shinkevich<andrey.shinkevich@virtuozzo.com>


Can't we just increase qmp queue instead? It seems a lot simpler:

diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index 348bfad3d5..7e721eee3f 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -8,7 +8,7 @@
  typedef struct MonitorHMP MonitorHMP;
  typedef struct MonitorOptions MonitorOptions;
  
-#define QMP_REQ_QUEUE_LEN_MAX 8
+#define QMP_REQ_QUEUE_LEN_MAX 4096
  
  extern QemuOptsList qemu_mon_opts;
  
diff --git a/monitor/monitor.c b/monitor/monitor.c
index 84222cd130..1588f00306 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -566,7 +566,7 @@ int monitor_can_read(void *opaque)
  {
      Monitor *mon = opaque;
  
-    return !qatomic_mb_read(&mon->suspend_cnt);
+    return !qatomic_mb_read(&mon->suspend_cnt) ? 4096 : 0;
  }


- with this patch tests pass and performance is even better.


-- 
Best regards,
Vladimir

