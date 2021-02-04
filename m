Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4AF31000D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 23:27:02 +0100 (CET)
Received: from localhost ([::1]:37572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7n5Z-0001gG-Vt
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 17:27:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7n3g-0000m9-Gu
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 17:25:04 -0500
Received: from mail-db8eur05on2095.outbound.protection.outlook.com
 ([40.107.20.95]:47072 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7n3c-0002w1-Gc
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 17:25:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2H4IOtqF/XKKOidhDrCd7YvrjVjUrPrq+oOIe6Wh6HYaKf4kfP2aHu+eKDQZ2GjDYJadde8Cb/TRK7Z4PQin8Azcm4wvq9JE6IMtnoYCGF9AOi68sAawrYXsxeLodCsddAGUZfvEi/aKjAOkIp/IU2wLM0EUGo44CtNp6qsl/NClUsZ7F6j558KNcEYVqVcKYt9psVflJEBb6ZVGfxlCt1IO4lFo1fYLYPvfqGhqtjiJv8JhijNVo7fXf/8L0sGxojae8IzCkvKn5G3kj3RGQo3f6WVn/KKMtTVtFoLtbG66iVq2ixiqGaAvpPhq/rKmB6kRjjo7o6HaBkvPcSsng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCVea8OpEB7NCRS3o6kD94k9nGEnZv2udiKM3qPap1A=;
 b=gEcsR1Xk7hK6JxvbHKpyh7dv/bhc9Afm4SUGoVkksbo2GEGL3o4g2l4/HblFxs+E9d8wRHWq4LHCh+2gBOLmbxUSI9v+G5pOWzJVY9anN8nIoXi1bpXE6Iejy7D35bxBL0YFY5XBh3cZJtbMPEBUby3+fKmKSJH0hx8iyDSAqa8xH1rD3JL5leiUpaa2Fd00ff/ywxURz3VZcKj/tk80xCPr9cCvcQscNWXpxqfrcj4UX/SLqBeO4MqR+X12FKNAEMu+uxbfmq1RSO/a9FIzSV523Rx/qjsZX/AnzSmquyJK9R8eYeExVlozjCwV78eroZzq8+oxPnJU53gYgmMvHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCVea8OpEB7NCRS3o6kD94k9nGEnZv2udiKM3qPap1A=;
 b=p9vUCndjdEK4Zlu8hiJIbCgOm1HEp7aiVRZsdhFczvfY8a3Fs9oFnBYC8OwVoBgP8JD6KnlT+cJbsrSofIF7/MJ2Ot46KN+i0NIghOAwu9f2xrHnT96G39gw7lRgVXAmwlvCe8T6XIqs5ihTCWaJl7vSBoc0KhZEnZhSaPfFNTQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6357.eurprd08.prod.outlook.com (2603:10a6:20b:31b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Thu, 4 Feb
 2021 22:24:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Thu, 4 Feb 2021
 22:24:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	vsementsov@virtuozzo.com
Subject: [PATCH] monitor: trace qmp_send_response
Date: Fri,  5 Feb 2021 01:24:44 +0300
Message-Id: <20210204222444.22217-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.213]
X-ClientProxiedBy: AM9P192CA0020.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.213) by
 AM9P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.20 via Frontend Transport; Thu, 4 Feb 2021 22:24:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a887960-8854-467e-6222-08d8c95bb2ca
X-MS-TrafficTypeDiagnostic: AS8PR08MB6357:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6357A02AFDD004A480596316C1B39@AS8PR08MB6357.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:261;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0hXwGPme26IZhZdn+04/Mhpqw6amQchgyqYNiyaa73SHTH9LpZDwTucf0trwKFHpBq+vinYFfMTA1ePkvVVhDq8k+0U1M0c5QAzHihLXN7/LZyZgQt7G9KzDZzqCwWI2a7w/YTGHvvbhZnEufFI1yqIHOmab2iyJUkvjV1/7oLZhqV05pHXXxrW+BGnUXx42l2upmqsql0v6syq6B2txfy13tPKCxHTeZkpV2g2bjs0LfpjreYUDf5GkK9ceXoSXS/LOTtJRDK4E/QWvJpEG74YSOySm+vTJT0Ju6O4S1OCFSctScynI90tyzFc+XhesvW756GtY0LmMilltiWoUKlDHfZ3ACys7Y8gycBuU0jCb8BdqlE47OjrpQs0W9AEyoLToGYmj28s2HooeYWyBXw/fsiacchrzalI6UNIx91RkWXRrnBfKp23Y3LnNQRbOn5WNq/BWCxkE1npmiKx8M9gsURHdb/hjsfJ/pEoFjrCFzKJojkmP/3jXYhdfwCWGR0LBFQhNGCxiTWdxNqcVVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39830400003)(136003)(376002)(346002)(396003)(956004)(6486002)(6666004)(66946007)(2616005)(6916009)(316002)(83380400001)(5660300002)(478600001)(26005)(8676002)(6512007)(1076003)(16526019)(66476007)(8936002)(107886003)(186003)(52116002)(36756003)(86362001)(2906002)(4326008)(66556008)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?O6Sj3VOdzcvRJLkGtcoPKqDh5ikJFL0RZTVddh7Qk8Qj73UTFNW7dLSLwVbD?=
 =?us-ascii?Q?szDYShulFC6+f4+/lkSTMO5oIRds0xG3b8zU+uMvDJlhDkH5Hftge7vOQdQP?=
 =?us-ascii?Q?FVFVJBVl9IQS6w/13jSCCPegW0SnjmwOa0dQHXYHVRUn3WKVxSGtpHHvAQGK?=
 =?us-ascii?Q?T7viDi5yN5/BxHQSQgl0ov8tsjo2D9j7WxjdyVgiAOfOoqDzV51pYlY4V5nq?=
 =?us-ascii?Q?5XApEvAIUtctaLSyde+kiTsw3eX7Eal14b4zFLAXUJ3tUyWc0PG3NOskyu+r?=
 =?us-ascii?Q?bQJziRCSwP6IZ+kkXvU2UJeHQ5R556rDOUBQq2VIaVwsVmRPCpv7uwv5JvRa?=
 =?us-ascii?Q?j1OmINLJR4IGbmEryL4zYjf+MGiBBe18BsxtykkaDaee1457dfzv6TPNVaVj?=
 =?us-ascii?Q?7scvo6NzigK09K5KWV4fg0Pd9INo2Y9KBrE42xkb4WgKIRJkfLZ7PvCbrrQU?=
 =?us-ascii?Q?WcrNslYqVpZZI8FZ/lnaplOW1xw/Y49mazX9DEAxFRYUVuS6dVYZcTx+R0b0?=
 =?us-ascii?Q?h+V+j73XOv68UJhXN0T3U7MLJiGRu3l9AWKgBo1/5x7FkQc9HKCGGX7+KS1x?=
 =?us-ascii?Q?fpHW87L/Sr+jgDyyD+vCQg0ng+uf7AmLoLIJaDvVsTfO701yyCxNsljyoK95?=
 =?us-ascii?Q?KKmAhS2h466K4x4DK3QhLqdt0KbieOHK5mpv1tsDaDmwMC8AhrjE7wLoTJ8n?=
 =?us-ascii?Q?Uec+ZJa29MWDgQZEtg+tMQegMZqUbmPhNR2GLyR9Oy8L44/9ILz798uR1q0D?=
 =?us-ascii?Q?JsfUkxjJh60Ngdqx2UPPWflonUTVa5NAkx4oEJ0ClMHPoon9b2Rc4W4fa91K?=
 =?us-ascii?Q?B7fNGdBkPo1JNo6oHQnaqhmpb2VAyn+C28KJqBDhJTAqblCLCZR9im3Mh4rt?=
 =?us-ascii?Q?EvU/juj+Yjm5MgT8n13keEdwN6DfKjsj0M9ELuv5JLjwelWP/6SIyrVq6u3g?=
 =?us-ascii?Q?4Fy6PeN842/luRIWDr4jBPt8xeKY8NWm2dihGhXnWA2KwspCNMBSkF9OL8Hx?=
 =?us-ascii?Q?1SxPpFcXk0lg6cSa2aQTG1G9PEUqJ//fzVIT8xPXsaP4vabWBLD+06gHY4Kg?=
 =?us-ascii?Q?hqF6lgOLeNLc5gMDCXCjivepeGBiTF0xfC/6gNAEJQKgW39vaRlFZjTPqGRd?=
 =?us-ascii?Q?YyeYBffOof1zcz5c+WHYHhf2/Kz+VZVCQLL5Kq0aWOUYZJQlhiA3kiqGicD1?=
 =?us-ascii?Q?E8MXgKiaDql9Rv5NcSI7KMEIFiGBMkdvhElOkKA8tMQeJNQ6a1prgMbsSSpM?=
 =?us-ascii?Q?vbOQbOel2oQfdomYq5IU4+veltHIey4YVGAPwbAAeO2eO2Bxyb9aCMEmLVEU?=
 =?us-ascii?Q?83+zadVhKYrtnh623CwQtRpH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a887960-8854-467e-6222-08d8c95bb2ca
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 22:24:55.3691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZTl1S7WRFQuf92psJ5T4qA6h4EBEnXUq2U4EHBA5zeIDRp57enGD/FN+iS6waCUHWQ/UaSIGEDTlECUwaOg4RK8qbwwBcVEkX85nsG/eS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6357
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

Add a useful counterpart for trace_handle_qmp_command for debugging
libvirt guests.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 monitor/qmp.c        | 6 ++++++
 monitor/trace-events | 1 +
 2 files changed, 7 insertions(+)

diff --git a/monitor/qmp.c b/monitor/qmp.c
index 8f91af32be..772b9e7b30 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -111,6 +111,12 @@ void qmp_send_response(MonitorQMP *mon, const QDict *rsp)
     const QObject *data = QOBJECT(rsp);
     GString *json;
 
+    if (trace_event_get_state_backends(TRACE_QMP_SEND_RESPONSE)) {
+        json = qobject_to_json(data);
+        trace_qmp_send_response(mon, json->str);
+        g_string_free(json, true);
+    }
+
     json = qobject_to_json_pretty(data, mon->pretty);
     assert(json != NULL);
 
diff --git a/monitor/trace-events b/monitor/trace-events
index 0365ac4d99..12f0576c7b 100644
--- a/monitor/trace-events
+++ b/monitor/trace-events
@@ -13,3 +13,4 @@ monitor_suspend(void *ptr, int cnt) "mon %p: %d"
 monitor_qmp_cmd_in_band(const char *id) "%s"
 monitor_qmp_cmd_out_of_band(const char *id) "%s"
 handle_qmp_command(void *mon, const char *req) "mon %p req: %s"
+qmp_send_response(void *mon, const char *req) "mon %p req: %s"
-- 
2.29.2


