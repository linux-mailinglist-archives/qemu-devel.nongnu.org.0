Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E4847E212
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 12:10:45 +0100 (CET)
Received: from localhost ([::1]:44078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Lze-0002sb-NI
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 06:10:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0LxF-0000TT-PJ; Thu, 23 Dec 2021 06:08:13 -0500
Received: from mail-eopbgr50093.outbound.protection.outlook.com
 ([40.107.5.93]:38670 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0LxB-0003iq-OA; Thu, 23 Dec 2021 06:08:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TDbAz6Mv2Caw21tUSE6wLa1rvRXmfMB5kmbtXpo0Xx7xz5wvjxuLUgIxU7KCyd/dJscO/A5FKGsLZjcAYXw80ESeSNIeJ2/8+jC/Gg3FxjXtx1KqYnnXPUbSiZpjvh2H4nm/hhPkAghhqejNy6MoD8RVP5vINgGdVy9ahTZSg7bmybONwcKoSDjdKOFVHKjHt95nGB4z0P68f7KqQLdy0I/IkQgAsCwWTZSl0MfIyr7oKtObG8wiDRrDSKt9vmfEco8qJCASzXNU4XEuPXPc6iaC5R1XKci9ZmtHjqIQr5mmCZ1i76Uo2MM9geyf+LdWGQd987+gJO4AaXOpwr18tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6iYRp1+YTZ7m/tutquYd2BA7bMAdLeLwMAkWwd3hFG8=;
 b=dCA21CMtXGyu8TZE9rqsVrYXo2j6G+VFQTRT78lsHJvgQJdxqoDQkHuoXqmI6X+Iu3a3cdW+K2/YhCtgPi8zlYmJ83fFzW/lUlKAqFWEC77FP8a4FdYgQRgJN31EA/9kx+/WF5OyJEmVQdGB8xnveiYqqAn7ox6K5b5Y2sKGfqAu47FCjSqT7d8rUo5m59n+qZDL1T/1qra11rXDS5qscI22U7AXxaz5wdUl2yfpubf+EQ08080wk5znMlRTB2kI7GsT4tmgJ4W+2h1R0XqXZ5yqYBYKufxl+DhspExigiM9oKdGvJIbcdPdTK1qAca5wGMHCUE8nmjYT9/YNONrZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6iYRp1+YTZ7m/tutquYd2BA7bMAdLeLwMAkWwd3hFG8=;
 b=KF1JRKBgIbchkHtUKDPdwW4bI1ml0l0RuXE+lRGJ4O3RLWE+JrJLbskQz9+7p7kQrBz1WdyhAtstXEHHBYaoLac9hQf46aIMaw1e7ipEma+ipOy9wbeoWAW2jyWyDcQqi4Ui/K8yf802CR+HCN20xOamcBl4qlrvXVInU55Rafw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB5393.eurprd08.prod.outlook.com (2603:10a6:208:18c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 11:08:06 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 11:08:05 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, michael.roth@amd.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, armbru@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com, philmd@redhat.com
Subject: [PATCH v2 1/4] jobs: drop qmp_ trace points
Date: Thu, 23 Dec 2021 12:07:53 +0100
Message-Id: <20211223110756.699148-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211223110756.699148-1-vsementsov@virtuozzo.com>
References: <20211223110756.699148-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0094.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::7) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd1b605f-adda-4fb4-4ab9-08d9c6047eac
X-MS-TrafficTypeDiagnostic: AM0PR08MB5393:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB5393C3920A703AFC4531D781C17E9@AM0PR08MB5393.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:194;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IFMBkqiQQyS/KcSzLc0ZvquX+r7ahhJ7jXslr/SHVtZOaIoN5eXlWPR52GrfAPCpuJNVucOUqFsOFnr2HbWCM9Y1yiFJopaDtDKuiyhyJrRUeYcb+rwmMDWBbcJEB3OIDHNJGhH0BDOXgwS/Y6Gxz/psucLED07iO+bK40pA0RBrIYZ6gMTdOSYMIKW/2SxMPssFRF8hQz3X07nsocMDPV4Ipo9yXi4P3wIMuB1fr6yY7Df6bdqIx4SKSY4jk9ae6bPjNBpjLLVsZr2RjaHAOfXlc8XeufkWtDbwg2YOJJtcPYRS0+4KHMqFdMxIPLMd3pdZNxmJ1ARw3gd/9yhX8jZjvhPS3UB1cM8jG8dDeMOqgEjkqMlmCny/TgCxIVEJJK5uOnhCT2Gy/uexxhJYigCAH9ncIzThuMy22sVTYPRougIdQxTwyqj2TPBh7uE1DS+iLGinAPmRP82F25E0MmnwekVmnkwPq78bu4kduUgP5NXmvNW3Jz/Ys61ZYmRSBpnBmkQGg1yhCjHn1FHBhzHGbNF9tIDe/x3PLuqVL6ie8hYBmgXiXegxwdlGAxv8dwDNLERpHgUPPT9Z3a43bd+VyFRNQLBn/POTwJ07zG7GlnBRrzHXUDogOeGYKpoSPmkMMcWhmgk8qX8t+Dt1Qx6XP0H9BXsV+CY2hZ/+1NwX7scFXp4xXaP0igAQqNI7lspJN76lK7FWic0tzPrKs6fSG8NCb/LRualKaFnaKnFF3Nw7HHnBJWR79Bpfg0t5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(8936002)(26005)(6506007)(52116002)(6916009)(36756003)(8676002)(316002)(508600001)(6512007)(38350700002)(5660300002)(4326008)(38100700002)(7416002)(2616005)(1076003)(6666004)(6486002)(83380400001)(86362001)(66556008)(66476007)(2906002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A2t1uy/KlDEUGXMM1KkmUu01OcmrykFB5WVWMHG3hH51TPyJqS+32DDfwWbs?=
 =?us-ascii?Q?1gJ53sdLdMr5qqGe+0veQzu7exTGv2vRy+/lZRPjT/lYVMBbgH/afQCzZ6sj?=
 =?us-ascii?Q?SGXqoOg0Pkziyko6IYRNb5SMjcaXeVfV5QT7HftcWO2p4xrXPfEw6hV1OesO?=
 =?us-ascii?Q?kJ6HtzvEmcz9cGnKjKTi+bI8KNUgZ2mzAICg9z0+2h8QTCWTOnLvcBopavL7?=
 =?us-ascii?Q?fd8yLWsGhaszf1VTn6cqOZlKn9E05JNgjHGwfSnT9IdlswUcODY64ioO4VEA?=
 =?us-ascii?Q?jf20Y42T+Y74iJW+CJVHjQpdAetCccTYq0PLn2aboVjeIHAQmZMJL4v69wPP?=
 =?us-ascii?Q?qlAkKSZwoaKwFNsNbvBNIgsuGxRtAXzxZcTvTQ0v4BbGrCu3LsTyttIetcyp?=
 =?us-ascii?Q?rHqz8CwFQuA3I1sIfw4keISlbXMMyUNGPRg86hO8UU8Bl7jThNXIFXpiF4uX?=
 =?us-ascii?Q?CfC/7Q4RIwaJWJATzKXusqlMWVYHZlEJBbTrXy9FA2apnsXfrviIgYNjkCwY?=
 =?us-ascii?Q?pk30vKiO7PBaNKBKBwUmz8XEJGjtasnZwHoR7Mqv5bpGhYdD2bKhluGxD6MS?=
 =?us-ascii?Q?HR4nJBdQooG24CQa69U0gAPZIAgIDFqdmcRN8RlbOMmHfv/LHfAPrcBQjPUl?=
 =?us-ascii?Q?PVTbcTZ+SwnT55QMuRcE/VjX1M6Wg0z+5+Kvy+WPXEvBuHk7+eqlgN/PWrg/?=
 =?us-ascii?Q?rXww5dDpZPlrWuj3oOfVfJzi6ShA3XDOXYo+866o9CvNCm4UT2gsBoo+zHVu?=
 =?us-ascii?Q?lPbC5YtWIRgdXc9grFtKdb/cuyzSRu4WLnR/T7bSkTfHSKhEWm10soXdl/Rf?=
 =?us-ascii?Q?73b8Fphw4OWwaXL07IoLb8N0vdBuhC5bmcPQ6g/H3kT1pbaYXmwQLKc4nB5t?=
 =?us-ascii?Q?NkwtAIeDJ01w0Sci5D/H5BTA1KHnyZ7tB9Gq+cxGuDb9sBRHr73JO7UQdlSt?=
 =?us-ascii?Q?/X7dMUHmaY0ffR4xenaLbOJERbJZSGM0t7YfB3uByk6dtQmd8XnJuH3mqUme?=
 =?us-ascii?Q?JZjjzgXyehAWlaXslKgvhXJ16/nTLNwWoNd+qQinqRRLj5tBT2Eo/N+4TVWw?=
 =?us-ascii?Q?/Ma82GZSXW/uYiu1buzSLnNT0tO6g8boLD9GrB152Q+Rp2WjHGwzTw6DNmNp?=
 =?us-ascii?Q?v44nhGOryX7xTwKzT69A0zQAFWYoefjenoQHwMfFGjCL18CLLIS7Fd23jZAi?=
 =?us-ascii?Q?EcgWFDgm1UhI3q+sAkr9s03sW82fsb142EB73M9yqmY09i11gdLhehJ+1ZlG?=
 =?us-ascii?Q?MjhSzROn+/Zs5b+1AV9NMkbNbTUjccbbGDPoSZ17aC7in0ynTQlLjx5DE4DG?=
 =?us-ascii?Q?Ql1YH+KmFsWIev/3NFApSAUKip8caqN+i53/Ihk/A56P7/xvh1lejN/dGrvv?=
 =?us-ascii?Q?HR9btCJmD3UFt27RvpaWS2ft9TWApNSI6hrs108ygkhVrbqTq3KbLfq9PvDI?=
 =?us-ascii?Q?hyf0ZEflmFvv2iKLkAqaKncSuQpK36WI1I7AsWzkpq2keQwfugBkNcBnroMb?=
 =?us-ascii?Q?sEY1x9SB5cN8XnAFSQ3hk2XljuEvOCdP3dVuJCdu+oKYzPNkzwCpQk6KB7+m?=
 =?us-ascii?Q?rmcx//ARcGlKYg350dkXLa9seF/y2k5KkYTf2RugEB22uxy5wNah33aLCiWd?=
 =?us-ascii?Q?7ZWSmihesna+t4/wbCA1JCf/PA8efUyKpH1aq6C0rP0RtgLILk5sn0auH8v/?=
 =?us-ascii?Q?6tnkekABM3UyDn9Y3e29q43wy5c=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd1b605f-adda-4fb4-4ab9-08d9c6047eac
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 11:08:05.8587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UpxElNTsf7Ojs9UPILUDGo5lrJRUdLwl0dm83Ao7NSmzCMXkXxRq0Sq9DXby3caVkztrgFJKD3I0v+2iCMo0zffsKnikDrTxWjYNjTLxMFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5393
Received-SPF: pass client-ip=40.107.5.93;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

We are going to implement automatic trace points for qmp commands.
These several trace points are in conflict with upcoming ones. So, drop
them now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 blockdev.c         | 8 --------
 job-qmp.c          | 6 ------
 block/trace-events | 9 ---------
 trace-events       | 8 --------
 4 files changed, 31 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 0eb2823b1b..10961d81a4 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2586,8 +2586,6 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
         goto out;
     }
 
-    trace_qmp_block_stream(bs);
-
 out:
     aio_context_release(aio_context);
 }
@@ -3354,7 +3352,6 @@ void qmp_block_job_cancel(const char *device,
         goto out;
     }
 
-    trace_qmp_block_job_cancel(job);
     job_user_cancel(&job->job, force, errp);
 out:
     aio_context_release(aio_context);
@@ -3369,7 +3366,6 @@ void qmp_block_job_pause(const char *device, Error **errp)
         return;
     }
 
-    trace_qmp_block_job_pause(job);
     job_user_pause(&job->job, errp);
     aio_context_release(aio_context);
 }
@@ -3383,7 +3379,6 @@ void qmp_block_job_resume(const char *device, Error **errp)
         return;
     }
 
-    trace_qmp_block_job_resume(job);
     job_user_resume(&job->job, errp);
     aio_context_release(aio_context);
 }
@@ -3397,7 +3392,6 @@ void qmp_block_job_complete(const char *device, Error **errp)
         return;
     }
 
-    trace_qmp_block_job_complete(job);
     job_complete(&job->job, errp);
     aio_context_release(aio_context);
 }
@@ -3411,7 +3405,6 @@ void qmp_block_job_finalize(const char *id, Error **errp)
         return;
     }
 
-    trace_qmp_block_job_finalize(job);
     job_ref(&job->job);
     job_finalize(&job->job, errp);
 
@@ -3435,7 +3428,6 @@ void qmp_block_job_dismiss(const char *id, Error **errp)
         return;
     }
 
-    trace_qmp_block_job_dismiss(bjob);
     job = &bjob->job;
     job_dismiss(&job, errp);
     aio_context_release(aio_context);
diff --git a/job-qmp.c b/job-qmp.c
index 829a28aa70..cf0cb9d717 100644
--- a/job-qmp.c
+++ b/job-qmp.c
@@ -57,7 +57,6 @@ void qmp_job_cancel(const char *id, Error **errp)
         return;
     }
 
-    trace_qmp_job_cancel(job);
     job_user_cancel(job, true, errp);
     aio_context_release(aio_context);
 }
@@ -71,7 +70,6 @@ void qmp_job_pause(const char *id, Error **errp)
         return;
     }
 
-    trace_qmp_job_pause(job);
     job_user_pause(job, errp);
     aio_context_release(aio_context);
 }
@@ -85,7 +83,6 @@ void qmp_job_resume(const char *id, Error **errp)
         return;
     }
 
-    trace_qmp_job_resume(job);
     job_user_resume(job, errp);
     aio_context_release(aio_context);
 }
@@ -99,7 +96,6 @@ void qmp_job_complete(const char *id, Error **errp)
         return;
     }
 
-    trace_qmp_job_complete(job);
     job_complete(job, errp);
     aio_context_release(aio_context);
 }
@@ -113,7 +109,6 @@ void qmp_job_finalize(const char *id, Error **errp)
         return;
     }
 
-    trace_qmp_job_finalize(job);
     job_ref(job);
     job_finalize(job, errp);
 
@@ -136,7 +131,6 @@ void qmp_job_dismiss(const char *id, Error **errp)
         return;
     }
 
-    trace_qmp_job_dismiss(job);
     job_dismiss(&job, errp);
     aio_context_release(aio_context);
 }
diff --git a/block/trace-events b/block/trace-events
index 549090d453..5be3e3913b 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -49,15 +49,6 @@ block_copy_read_fail(void *bcs, int64_t start, int ret) "bcs %p start %"PRId64"
 block_copy_write_fail(void *bcs, int64_t start, int ret) "bcs %p start %"PRId64" ret %d"
 block_copy_write_zeroes_fail(void *bcs, int64_t start, int ret) "bcs %p start %"PRId64" ret %d"
 
-# ../blockdev.c
-qmp_block_job_cancel(void *job) "job %p"
-qmp_block_job_pause(void *job) "job %p"
-qmp_block_job_resume(void *job) "job %p"
-qmp_block_job_complete(void *job) "job %p"
-qmp_block_job_finalize(void *job) "job %p"
-qmp_block_job_dismiss(void *job) "job %p"
-qmp_block_stream(void *bs) "bs %p"
-
 # file-win32.c
 file_paio_submit(void *acb, void *opaque, int64_t offset, int count, int type) "acb %p opaque %p offset %"PRId64" count %d type %d"
 
diff --git a/trace-events b/trace-events
index a637a61eba..1265f1e0cc 100644
--- a/trace-events
+++ b/trace-events
@@ -79,14 +79,6 @@ job_state_transition(void *job,  int ret, const char *legal, const char *s0, con
 job_apply_verb(void *job, const char *state, const char *verb, const char *legal) "job %p in state %s; applying verb %s (%s)"
 job_completed(void *job, int ret) "job %p ret %d"
 
-# job-qmp.c
-qmp_job_cancel(void *job) "job %p"
-qmp_job_pause(void *job) "job %p"
-qmp_job_resume(void *job) "job %p"
-qmp_job_complete(void *job) "job %p"
-qmp_job_finalize(void *job) "job %p"
-qmp_job_dismiss(void *job) "job %p"
-
 
 ### Guest events, keep at bottom
 
-- 
2.31.1


