Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE87A2DBB2F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 07:26:44 +0100 (CET)
Received: from localhost ([::1]:40232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpQGq-0002Xb-17
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 01:26:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQ89-0002tE-NW; Wed, 16 Dec 2020 01:17:45 -0500
Received: from mail-eopbgr00135.outbound.protection.outlook.com
 ([40.107.0.135]:52920 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQ87-0001CD-Tk; Wed, 16 Dec 2020 01:17:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iND6B7p0JkmJT4rCZMQbq0sqm2imqlKtB3w72iBfWKOuel0WyyapTGnKNNEX4SvYU/183SNdV+YSp3hwFQawuDnctFSiQmJB78onvliCuyhLLVqri3XTMspRzDQJixY1vS9pMnm/0n9C6WquQxQqxMp7jvBzdPmYXUwfyrkppUtYPbMVJeLTLMM5R1N+6F9K1UjUIUcJ4ifgIKCakYH7YGS/EeTUXoC1uw+jRwbMhE6zeRWSm6iUEOtpKzR1U5B4xi3rUs0wOGCApiU7AaPUvOUbhzpMFBvy2ANbIBDnYXU5rzAY/hiTgwZIK9DXftJZmTQ1XjJTdHksA0ITnFpcTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4E+9NhwWrPoG2qRE8a9HR6Smd33Wp3DZ1RgaEhDAv6Q=;
 b=RNleRCGKUYwZBiESWAOdXrpSVCYKI/Ge+gWrl2TlE3+4dJiHWnD6zRuWfiEWGusiMO2LXTQlekp4XAb2v4SIyHD/8/yrCtH2px7CtcD/0xggsIIBBfysPT2wJp1qwImG0CgQLbcWeK4aTzB95zxNF3gX3hhns5s5IoFHZ8mcMZGhAHHrMT7symTmyoysK4s/tJsQP+WAIrSkXO+WmwbLk139vvfRbcQz4P8NedjMGaYNpHhToVjcAJAY2/dISZqyzzqRPtzTnCm1zWKZPn0KKt9T2hvtYEs85mOO8AYG3+Wui7udG149bM0QNUqKAlDIPuyhhku9IoWXJpJbWuVzpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4E+9NhwWrPoG2qRE8a9HR6Smd33Wp3DZ1RgaEhDAv6Q=;
 b=YrrXcytCZ8vqW5QSUVQgthD/hfnTBXTvcO97OKBbosduc9Xy7YTrurA963EHuxDHMi/GqCILGd+RGYSe8bD7+XJwZT0xIXZKHSFTgGHE0viqPSRhg9zACVuVvnIpUWidvkdnGMA4KKWRPxJ835AYgJ1XeM5bWJ3RF/9RXq2K9xs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6309.eurprd08.prod.outlook.com (2603:10a6:20b:29f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.24; Wed, 16 Dec
 2020 06:17:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.024; Wed, 16 Dec 2020
 06:17:28 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v15 11/13] iotests: 30: prepare to COR filter insertion by
 stream job
Date: Wed, 16 Dec 2020 09:17:01 +0300
Message-Id: <20201216061703.70908-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201216061703.70908-1-vsementsov@virtuozzo.com>
References: <20201216061703.70908-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM4PR0202CA0008.eurprd02.prod.outlook.com
 (2603:10a6:200:89::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.92) by
 AM4PR0202CA0008.eurprd02.prod.outlook.com (2603:10a6:200:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 16 Dec 2020 06:17:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 598a93a2-f83d-4540-7693-08d8a18a4396
X-MS-TrafficTypeDiagnostic: AS8PR08MB6309:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6309AC74D9067707A6D23914C1C50@AS8PR08MB6309.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vi1s+OuNeF07pQ/FiZpv1ueim8POVsactNJzH/WcRN0xo6CSyuXfXeXHSbPFGzDZuTf0qQPLzEKFaK5nD8Y7RlZmOdZCQZfwTKkShA0QOfDDGT6n4NulKdiks39zjCTLorp1JMGNXry5nZhf74asmgMPG/9Jg7xYY9vDoyEC5hB+dUF8lmLtH6hIM9VXMi1vddPr0qoVSOl+qS8iF0VRxGzHRxbj+H5efBI1ftznipQ3jIHotDZeeKdXKLMBkJ40hGYUMiho2yTjZhXSbDsq35VDE+eIHWCz6NHv2g/Gh+aTcfJlUHpMBm0mEWtmV7F/WtSnX2sLGf8s7qyDBYTmvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(366004)(346002)(39840400004)(4326008)(5660300002)(66556008)(66476007)(186003)(16526019)(956004)(6506007)(6512007)(2616005)(66946007)(36756003)(6666004)(1076003)(86362001)(6916009)(316002)(6486002)(52116002)(2906002)(8676002)(83380400001)(107886003)(478600001)(8936002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?GVN94FtmLHqKkjlXtADk8X3HDCruYEhXtY7OsvuFp5E0d7m57wMhgNIDiyJv?=
 =?us-ascii?Q?98SSNzJS+Lb9Tm1ZJ4/sCB9ks0nBO8gNwikXD3arahm2DhcwZK/8FdGZpTc8?=
 =?us-ascii?Q?CGPLHJHyZNVLZL/Oq62ESAZNCMnnIwvRF+xOO+FVCRZFyr7UDzEZGAw+loRn?=
 =?us-ascii?Q?TBVrNAe6cN83KJY/hE+TXHRPg9c/NtcAxuZqn1w8Z3xvnSinGGsFI44ORdHC?=
 =?us-ascii?Q?823EPDctxZrz+xBVpJkUEbx3XbZiPFbEA8CR+IAEloATl2U3no7vd/OChGDL?=
 =?us-ascii?Q?pcWo1YPQuw6KWpI4pS1WPuqskBEIE3IyOPZzFXLTyxIVt0qD3d54GWo8PcGt?=
 =?us-ascii?Q?U79nCWgN38SkdxKhiUEuA81mc83lEktLzoLnbPNVSsN4adVQxgZaZ1dA3xqF?=
 =?us-ascii?Q?r1LxETi3WAjc+6nL4CoAIHtHa3CdULGRkI2yYEyQOcpMLq2xR/fEqD4Blb2f?=
 =?us-ascii?Q?U6z4BE/SU/P65iFwPTAdE6u8JufCzTq7Ok5o84MDfcTPb/77Z+I09C+yleL0?=
 =?us-ascii?Q?cOmwKE4Xx9umxLdAYQsue9KvBHj1Mkl9V4/Ylptd9arnFxq6KNt7P0VdU4As?=
 =?us-ascii?Q?Si/rf/rk53Zr3BX1dJ7uwN5jzKJo/2uQuSlbrF45x2B6dz9Eso8ubaWlClY+?=
 =?us-ascii?Q?XWSyLcFquNvsmh73UkTNSY/TbxFCbLrl61CsyhbaqYvKordqaftAQhvTlTzi?=
 =?us-ascii?Q?YKdl+B0+7Jl+HBJV3XbEgf7P9/fb/1zDTlSriOAcjcD3bqfUeJm5H6nGGjVs?=
 =?us-ascii?Q?GmF7O57ympu17PF1dtm/A/2dK6ROtEzyYaWzVotRg3ZvjghWiGs/0kTYLDtq?=
 =?us-ascii?Q?96cblLjl8exDavKmIGQMBy4nbmL1QT7XMsVk7BssuXwUuXn6Y9TjBiquN8ZT?=
 =?us-ascii?Q?FGJdw7wzEhkvbVv6HKpMZmB03Koiabs3jfKItbiRGhJrrSV4ls4c+5qaqJQq?=
 =?us-ascii?Q?vnScHIAf+umaRRr1i8pMBupzxuRQI9ywPq4vIdQUj9LxcIEApsUtMZ6NOZ8+?=
 =?us-ascii?Q?W3Zi?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 06:17:28.3810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 598a93a2-f83d-4540-7693-08d8a18a4396
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yMnYoLyzRREKtUzHr2vrvr9bRN99/hIWJvvRVudLMh+ChtlgzVj2m2oC/OW2KinTdDYeGSsFdFcRpD3NjDLf0FiUsy/7nUxxYlRLEGEJzyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6309
Received-SPF: pass client-ip=40.107.0.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com, den@openvz.org,
 andrey.shinkevich@virtuozzo.com, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

test_stream_parallel run parallel stream jobs, intersecting so that top
of one is base of another. It's OK now, but it would be a problem if
insert the filter, as one job will want to use another job's filter as
above_base node.

Correct thing to do is move to new interface: "bottom" argument instead
of base. This guarantees that jobs don't intersect by their actions.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/030 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
index dcb4b5d6a6..bd8cf9cff7 100755
--- a/tests/qemu-iotests/030
+++ b/tests/qemu-iotests/030
@@ -245,7 +245,9 @@ class TestParallelOps(iotests.QMPTestCase):
             node_name = 'node%d' % i
             job_id = 'stream-%s' % node_name
             pending_jobs.append(job_id)
-            result = self.vm.qmp('block-stream', device=node_name, job_id=job_id, base=self.imgs[i-2], speed=1024)
+            result = self.vm.qmp('block-stream', device=node_name,
+                                 job_id=job_id, bottom=f'node{i-1}',
+                                 speed=1024)
             self.assert_qmp(result, 'return', {})
 
         for job in pending_jobs:
-- 
2.25.4


