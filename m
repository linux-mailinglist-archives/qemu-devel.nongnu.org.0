Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 714774B9238
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 21:22:30 +0100 (CET)
Received: from localhost ([::1]:49212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKQon-0000xC-HL
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 15:22:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQGi-00048Z-14; Wed, 16 Feb 2022 14:47:16 -0500
Received: from [2a01:111:f400:7e1b::707] (port=17600
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQGg-0006Dk-6N; Wed, 16 Feb 2022 14:47:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGyCXXrcRm9YXpt2c2vdaFa6ODa2ZbY50K9KVUOwUW+X7DeAqMTrXXXbgAk+ofu7jSmS0wD8HwAe3d3t3iUAZRXctrF+9dms+w2S5qmu1YPngaV1QcS8+qYpZptOTrbGlEmDEE7LyaH6kIBk6MKxjbhQcx9L/a0q3Vp4XL+sxDE+LzAnrfaO62TkEcoGovKl1XzI3d2bA1la1H318s03rtoaw53+f205uYVMkIbLnWO3ReHoIobOcOipe3EyLjpBAYQRhIaGSCh7wbZkiNWzbRwEzX7pzC1wFf1p6EbWrZQllV2PkafZFuMFhEV4dCSUyDRr6fGZXGO+kv4nzvKuXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6Lv6n4aDfXbnWlK6Y3BwZkIoJKkuHgj/qSRgG393+w=;
 b=PFrjs1p/k24ShrZ8r8I4Pitq+WLfdolnFobZ0y1Z/n/2gXzItqEU/yIgDakfVekhNITag+kCQC9JL8GbaJfREl5J1lWLgZDUvHipoCUT3nnWPFKJfPOzhBv6KpzjBMCNcixGgmcqFHVYSUYJPMFIh5fXOmBFGtgKj9bC7LbFgyG6DCpzPvx08CgJgZna0Iu+sxpCL/yNwVs/oB59rj/4lPr88Lc3FUUKPG7qQKsfYGcAi4uMFC9cQPhBHs6YNHOc+TUb9XiGQSE7RWRFevSyoPXSs8AQ/dmeq/kcdVtmRc3LHZMzsuPYR8urRFMgnuMk5WSB1ZaQVNedCDc4B1Pcjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6Lv6n4aDfXbnWlK6Y3BwZkIoJKkuHgj/qSRgG393+w=;
 b=Rdf5Yxf4ylEmLmgFISoERVDWy60LiwKfqCMC84bdYaPOLgeTCSTZVbmNP+b5wGAl+n9t0Gms+/FqMzqQkuxadvVe78xHoeb8iuTu1bR2JLqJUDxNQRLg6fU9nPYpmaAriQdJkpFWWqopofQFxZTsn06mozbh4HFYgQwWdcF/zPI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR08MB2851.eurprd08.prod.outlook.com (2603:10a6:205:d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Wed, 16 Feb
 2022 19:46:42 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 19:46:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, nikita.lapshin@virtuozzo.com
Subject: [PATCH v4 14/18] iotests.py: add qemu_io_pipe_and_status()
Date: Wed, 16 Feb 2022 20:46:13 +0100
Message-Id: <20220216194617.126484-15-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220216194617.126484-1-vsementsov@virtuozzo.com>
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR05CA0005.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::10) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1eed6a08-6410-4160-eb9d-08d9f1850e39
X-MS-TrafficTypeDiagnostic: AM4PR08MB2851:EE_
X-Microsoft-Antispam-PRVS: <AM4PR08MB2851433BF7B5A3BFFE43880CC1359@AM4PR08MB2851.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sprBzTMitKOKxFAkG5jtULGJdaQX6M4Esz0Q3Sea6IkHLTh21cksaNqOBXRyhF6IticMfsV5Qogl9qvhQqAGgz5I3TORhX4wo5iaOh7FH/02M0j3XQVLygpsaycpKgXl0PxGF3fR4XZAS9Cgi/aUuyOMz61tO9kMD3inDthYlhk+2ZPLf0VZQrOInUU3fHX/Jcyc++6NfnEPVoFM5mP4cemvPYX68Y6p5fpNp0I3zte6XEpJL4JQpf8mDJuMKOBhb14FAnlsl5aaSPDBfrEmnXjqBzWQzvlrcwWkgkdLzCPVPw3N+VfiLS6v7BcML7KYay/yLfR36dFNJ4PRhOkjVGrA7Lnqg6bTuypNaz+L6sH3GdRR+CbOeDZZEFJrRJBL47NJluElc2NxIb/eCtj/J7zwTLObBBA1f/f94F+Z6DdQqxITBEons05I5hfSL/KysjldpQPNlB7KbfK/g5xfGt6bUVGF6G4UbQGj2eYMZpoc3yIgXGv/ursuSsf+v50fY6tDAHQolayZ64PmvBpxehPIIr4moiFGdycOOhb7g2nP/O5dne7DvDJR7tXq7zUX13+LlQzJB+N6R1B6g34Svlej+Q6G0YOLc47ltJrYxRPUk22xKP/ID29dq1juaZDzrKMRcUkquhaYdKw2ZWn/MVun3+cKIvm5//717wMt1l2VdOkv9DTkrrAwAcnMrw/q/PUcskbbpXz/aM3NibhFLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(7416002)(6486002)(1076003)(36756003)(2906002)(86362001)(508600001)(316002)(6916009)(5660300002)(66946007)(66476007)(2616005)(6512007)(66556008)(8676002)(107886003)(4326008)(26005)(6506007)(8936002)(38350700002)(186003)(6666004)(4744005)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yazlqsZormULIHIm/x18V+fEdRaQF+mDuRiFOu6wmzBQQD0x6zpnIoiwMBfC?=
 =?us-ascii?Q?s9TILrCCoOFDD1ZXB4KOfCHy6I6uLILVNgVc5bgEPZ7RuGRkO1WM4bwZng3E?=
 =?us-ascii?Q?YxZiPoqdrmeg3gMUHXyEuDTwfjjv1NLCuZR7fa9mOn6oBcApbbT/8J3IZwgY?=
 =?us-ascii?Q?+fbLRzmpCyqfiDVlfXZ0+7aiK/9uiu6MXS/L0oniTmL37gQafnVpsavDnaxs?=
 =?us-ascii?Q?AMjVe0A5Ijn62ei3hAkgqzWo4xMIWe0bKK5ln5031iOH9e/LbHinzd4uO1CO?=
 =?us-ascii?Q?hnify3S8zHyDvBADXGiVTrkeH/+c5Zkk/nU9t8cyM2gwrl9wb1S/9dLA48p9?=
 =?us-ascii?Q?rG06fQH0TKXgGfuFlo3Pnanx8bC5/ITNguHQ2A2o1decY7uUpBfpmZuNCCen?=
 =?us-ascii?Q?HFmyd4egLdEC+9l7JGvCzhR5xgz9KY9/23GvlGEdk9ifuD73J+eFMyDZVLHt?=
 =?us-ascii?Q?la0+NpLhfIpeqeQJ+gOlFVr6kj7Bc/BH+B9Cj8W5qa7zsAD0RQpaLARapFWO?=
 =?us-ascii?Q?hOI5UPQrNprbOgjzXGLU1dcHrRj9iqs0YZ0+Ofxn99+ijo7OwmEZFcDohwMu?=
 =?us-ascii?Q?rH4p1a8NlZ9cFpZu1l5REu84aX99B2QQnYdVZvE3LL6Ju88jaSvq02rQ+pJh?=
 =?us-ascii?Q?/U4JtnpWBqN5MiEpibsRx4CvifDhSkaTIOwwlv9+r3tAdrASC/SpMo5OlMwi?=
 =?us-ascii?Q?HV0AeHNIzgdiXy3t3b7iTUghLm/2X2lTrE/G+61FZwNtsoGQ4qmsgMXdatbb?=
 =?us-ascii?Q?1xa8f4kDTkADgOHd4oajDGTYWoS2ccHgrQnJu6iPV//V37z6+o3r7oWMA0jf?=
 =?us-ascii?Q?JiXTOtHKL+6GGXu7ZHKhhQ7I1/okjygKd0N5NUTqJKfLjydJNs20DSL5dVE4?=
 =?us-ascii?Q?FkYH8ETXrUFE3Nmowf0UEIL+GKVS9Z9KWC0VWKj58NCjL7v2Zen19apQiDBn?=
 =?us-ascii?Q?UIHm7lv39xsFefSb8xOcv0nwwb5yTQ+lzGPwWXCnMp8LGj/GvSQdSxDlaAAC?=
 =?us-ascii?Q?MEpphhZPReSl/rD9rJEoYu9cPGSiewSyX0Vb+pe3at/EMV39ZxCexLpLJM3T?=
 =?us-ascii?Q?d/+bbG6zWhgmyJyr8+1evoanQCuLQpkRt5ehuWP34+w+up7jUbbR6aIDf6FH?=
 =?us-ascii?Q?jZI3szelqh/FhGzPcB7bVASjVjjwfhTmPTpmqE6POVxIMFnZJwZfGIZosXmY?=
 =?us-ascii?Q?x8IP63YvYxVTXI/OMESChJ/kQPUHaoR5Bwl0G3Dp2EYkWLXohquKfORTBoB0?=
 =?us-ascii?Q?IMnr/JyI8I2uDOyrFUTvq9IjBtoqIWjNdTG4xaHdVBkIvhKwu5+vH+XNie30?=
 =?us-ascii?Q?3RAHMLz5HRBq3ezkVn1PoXJVJDJekraSQPMFkv+YvEl1vxIe7ZuEdlXoww+j?=
 =?us-ascii?Q?0wS3Z/1V04+RbpCKmruFyC+Vuya2syTVio7lSKBY7b/dh4OjIoov/NgIZ2Ko?=
 =?us-ascii?Q?m4KXrBy22Mcj2jghyxTh3lQcmO8djNli2lrwVhpxpVTmhruAV67NEyai/WlL?=
 =?us-ascii?Q?662ZiQuKYtClBNtvZFtVG8mCEwTwzEf8DAWx4Qovr2f7MpvthDhyk6d5BFf0?=
 =?us-ascii?Q?RQWASIgiZsHg7KThX5kN54+muf+0epaPNaKHk0QsIed3EwCmM6lOugxjFQjD?=
 =?us-ascii?Q?YfYBNIkWR2StVlDY1GehduM1JIUrE6EvfqHux9Oi74tgsQCWprAuroHDTak/?=
 =?us-ascii?Q?+NyIWQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eed6a08-6410-4160-eb9d-08d9f1850e39
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 19:46:42.2663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ofvx2gle/SptIBrQL9UvSvrcIIiJZnuDi9LCx3iUUdWRAg1Ksz51ZkDDFbHFtWSyyYNK03zSeWN16/tYA4n/36+3f3ExdXnBY/MsJOxtDF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2851
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::707
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::707;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Add helper that returns both status and output, to be used in the
following commit

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 6ba65eb1ff..23bc6f686f 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -278,6 +278,10 @@ def qemu_io(*args):
     '''Run qemu-io and return the stdout data'''
     return qemu_tool_pipe_and_status('qemu-io', qemu_io_wrap_args(args))[0]
 
+def qemu_io_pipe_and_status(*args):
+    args = qemu_io_args + list(args)
+    return qemu_tool_pipe_and_status('qemu-io', args)
+
 def qemu_io_log(*args):
     result = qemu_io(*args)
     log(result, filters=[filter_testfiles, filter_qemu_io])
-- 
2.31.1


