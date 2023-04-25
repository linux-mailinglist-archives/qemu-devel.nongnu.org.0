Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1987E6EE53F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 18:07:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prLBN-0007Uq-Bh; Tue, 25 Apr 2023 12:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1prLBL-0007Ue-Cb
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 12:06:19 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1prLBI-0002SW-R4
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 12:06:19 -0400
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33PF1XYu019512; Tue, 25 Apr 2023 09:06:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=UiVZnwP/pPa+scJB0LZyhtHMnl9i2+uwmUOD50POLEg=;
 b=oIqFz+KNzE+R7qfBqUQ2UMdk8CrSGy99NRxnGyT6WcbUlOc1pGa1r68Ah1f2bFljS3Qo
 EsiVxBgxAOgxg4CWGcde6ZAYbivCD64cUCyj64OPnkTU4bHxPqvgYBUrKVhTMxL2hq3Q
 EoBUIq27dFd6XmWUkxzpRBM/2WVE9Oa2EZJHfBQwJ5AGM+QNRdksElyL+g/p4wKm2ea4
 xFJVH8CCsi0IPhxv+hrDO/fosv5EFYLID0nVicKFaYvg0ZLg6TsyvYvt3C3WBjLI2WoS
 MXa2Yfg12VoMX3qAwR1wiHdabGRQQmy3NFpyZ84ZYIeR+8teWLhbwTVgBMUPjqwNb2If hw== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam02lp2047.outbound.protection.outlook.com [104.47.51.47])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3q4ewgyujd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Apr 2023 09:06:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jn7xstWsTHkP47Z2kbUaL4QEsSxdHgoWEbbjVW7cAFPmRIiX72UUdhjIRKhUkWnvGHka3w230CDeJDs4by2i+bnve/KWl66x9ZAPGxm8wp9Z+glTWAD7GeePn2JBbHja8d3vIJwn6V/MTX4EojxFtnOxGQpQlFdz8brOl2mlotjYqhX5DuKcKDH6KCGnFiCRfKUOibXsrnJfYND8hsaEt9VLQYXIZJlq3ZlxSy+ZhnYBxE0e9woyJiq7eA7WA1ijirYUX1oBdBbHvqtvHKcTWEBcSUbPC6BX2RdkEKGVnelpvpW5+RkJxPb+n6UMySsdb8Nn0LheqRWtpe667BckFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UiVZnwP/pPa+scJB0LZyhtHMnl9i2+uwmUOD50POLEg=;
 b=Y7fxXtlaUeHC6eRzRKf8bQ/11dKi9hYyYkl07zyO2/tGkLqwzmJ/R6HpsTS3CCk39rbea1khTnf+99t+78hUgsvxjIhKKBSMXFUtfdZB5OY5KVU7QZxX7ap5Bf48/sazdj0iGGQlUp5l7ibzLiII3/ymSCYqY1wgztuxZ3dD2YDqUtD5LYxoUGNfgTRo4SNcAcWBzgwvEmXdw7Irv1UQYmE+AbQDZwqrUjH5cMvOZVMqUwRnOAVhH9OTa2m1+t+SXkXlPsn3NqIrZ88xknv9FIaNd9IX+HyiVYbALKN7dIjuwGI8oVt9XA1V/Qbqzpmg/o1sa4bLD3XY38u3PaLWtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UiVZnwP/pPa+scJB0LZyhtHMnl9i2+uwmUOD50POLEg=;
 b=WtCJnjmoxqG97dTqGIlvyoJidIO3DGEiOCOTxb6FIvXjdhMKUjazh938nINwP+q2crTJcG2IPhv9auRvyxKTL3kdAdKbBadGzDOHkmF9unEpMnq8F9QPUEUr0c2PUx8JImguade49qGWlKpjYXG9KNFW6sGaZoP72UKsJGtgbr5PKJkdJru+QzG10zKV9xOGHK7Ba5hJYOQz4oXUYCO+EFktYYiq5q5bbzdjYDja02sxSTZWkCfpQ5fDU157UuBS2aCLLg0jYe2voWscHY/zuMdI8XjDLX1kqQcdQP4dAQxJtD2OS/B0NchMmgPS5wC91hpsoKxYK5hx6KuYod4joA==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by CH3PR02MB9233.namprd02.prod.outlook.com (2603:10b6:610:150::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 16:06:08 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::f2fb:d9ab:6983:b2be]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::f2fb:d9ab:6983:b2be%7]) with mapi id 15.20.6340.020; Tue, 25 Apr 2023
 16:06:08 +0000
From: "manish.mishra" <manish.mishra@nutanix.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, peterx@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, lsoaresp@redhat.com,
 "manish.mishra" <manish.mishra@nutanix.com>
Subject: [PATCH] multifd: Avoid busy-wait in multifd_send_pages()
Date: Tue, 25 Apr 2023 16:05:55 +0000
Message-Id: <20230425160555.67373-1-manish.mishra@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0015.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::28) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|CH3PR02MB9233:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a3bf254-7258-4bc3-6a34-08db45a6fb2c
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tUZ37H5DCq5jiYtmHAY3dEimqPVKSsP10jWsC5ZWZ58sD23Q/cak0lV4tuoLUpbDeWUE4wZ1Uk0Qp5myYnl+NSKSwjThKUax21oPS0GWekKY9Ly+wZOI1Rz649ls4X2A3hbivHdd3s340dxbDL7074HIVmLJtd8U+n26zKviiZUZ64ySxY/qdMPNzSilgyYFPcKitP/nr2dAsCXkC6bYKYNYYjse0KzXsPHX3Hd8xPradY2uKMH9ntVFfE5rgD68qtUvBO9hgCsdDtuKjAHO0wXVjwOT5JxqzlNYtJhnWyUn4hBWfJ/L8VXh9Zedts/ScjtSV/PZ1B3uL1F7Ln//cqlt92i2Bo8QsIzjJFv1dnkT9/q+bYeSR4Oix/N6utT0cBYk0m4XIWDkX18ZZNqzVm/TT4E454DbIHi9+rn0DPYrJY3mm0W37TdPY+jursCqYqVA7x6YsZ6Jpu2itaU7d56B4Jz3WbqNON5kMixzST/lLw19Df4vud4dOf+j8W14SB7te7fqvt01ASqxsZCETkp/fQ0KlC2Kmcp7obubGGEPPDoh8TM6aMOeFNErHNEgjV3F2lj60AU/lF8Z7I+to0RV2L3gvYSP/xVA/gw666s0vXVQ6hdSpAwH3HZMNeZU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199021)(478600001)(86362001)(36756003)(107886003)(186003)(6486002)(26005)(52116002)(1076003)(6512007)(6506007)(4326008)(6916009)(66556008)(316002)(6666004)(66476007)(66946007)(83380400001)(2906002)(38100700002)(38350700002)(8676002)(41300700001)(5660300002)(8936002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?she3vuJravce0jHqHuxUSqU8mFKR4XeHp9x+w6/5uJcrTQ/M61H7tQ2CuYvT?=
 =?us-ascii?Q?Mrq5XzP1ps9j/vPveuiY+cwXV6MgShQc4rtTEpfo9DT6tGx57xeNDQg1x/wT?=
 =?us-ascii?Q?AjpsQ4O+6pTY2U9JDheFPiZMrRlrzNQjgwtWqAD/M846dCaUd3+BQ10FZXwR?=
 =?us-ascii?Q?7L5/xouVoComKs7qtfJEg6vKZWCDwYGotoPxsdgvhsZPKqSJ31SiTwwmnyYm?=
 =?us-ascii?Q?rlXSi79FmnF8aaCJ6bZoAZm0ZQxTzPljJkpUGZ87uSsUScT1mSKNZ6UHwh/4?=
 =?us-ascii?Q?CuHS/kgmQeqimdwEF5II4r0uzcY3cLk8PU2sSDWIc+Gw9qHcdD0xIA5G8tTT?=
 =?us-ascii?Q?GLyfmjjav5IejDmLgmJL1AdeC0p/sie1Bh1eEsuOnJj4OUv2+HQ6X+A8dMvZ?=
 =?us-ascii?Q?V454WMJ1hPweDIxu7zZp4ukO/KNAzDX2usmDkSCJyJyOi7+WClWMlSv5grt5?=
 =?us-ascii?Q?MrVZDAPE/Kky+x4a3J2CDkkTCzXWHYPUcrkjFFxiuuXPEZMiivv9o6E/SXxY?=
 =?us-ascii?Q?+uzvLiqNCL/6i2m3aicGYeUBiZRjpFujP+h42/H4sQQmtr6joGpmtepOcR+r?=
 =?us-ascii?Q?qbfrTrjgHcmTvtz1ZHzPIm0ZCuToZ5EuHiPrg8C7GAvO+XDLDKGF8I5H4FtH?=
 =?us-ascii?Q?oqKuppOtG/lRA+WW/6xGSQjEbZPGYsTluEuVGIaDGF3vYS63meWjtMlQlByh?=
 =?us-ascii?Q?RhEbM3J8hf5VR0ssMX2tFgrwXrBy2Jjv2h+OFhSarNU7LrkdVKmWRq3xSwjr?=
 =?us-ascii?Q?syOlVL6jTRmB1e1axZIDapf6Hb6wekwhGdOKbRDaFeE2ie68Jc9MBOvPHOnd?=
 =?us-ascii?Q?zQzZgPuNj0aS6LJULNOiyyAOhgOu21SGX2ohAtEkf/wqeJUKQ7LX4S3KiKsq?=
 =?us-ascii?Q?6kne59KwE8CZMQ06dYD+nxq7umabMT5kKIypeFiHir/NNJzKdCJY81fqZ5Wb?=
 =?us-ascii?Q?C/ufblwE0tZGY+H4Cpq8tELiCSlnh8KzUrLxUixQrqHGhmc3ygSFjWm3nbqk?=
 =?us-ascii?Q?EfwfnolVDoEgBZZYbOnbVYzaPVadBCASLGJ7bJ/+9qY6TtQZcOFln4wBn8Tp?=
 =?us-ascii?Q?4tmc8F7CjeBDKP/diMzXQO76FvmIGfiJLIbU8UtH8ruwyfgtcbTWIgVMjs2/?=
 =?us-ascii?Q?chEK4HMxwVuy+DpAhVBa4sRxOJlpRj4OeBKLCqZFbwKcQY5LsaGQ02jSk6xk?=
 =?us-ascii?Q?Bup+a2OYGCitT9Nc2cmvj2WkB0cqLS6vgnb+zHgyJg3qE1lkdnph+b4c6SQH?=
 =?us-ascii?Q?Tjx6DYR9UPA1jA1H3v+s3Hc+7qAikMX35WmOiiSFNRcxCrLTdSkR4s+EPD66?=
 =?us-ascii?Q?ZyUxSDpxPTTVTaaPMPyiqk2UtvtG32pfg1RTzCM0prRSWjGVryJngG5R9D5h?=
 =?us-ascii?Q?UK4ltCr9X0/2SgdJuFZxqd4iif+Ji0oQtp3ZPpgwWnNzYRGSV61IPS4obm4G?=
 =?us-ascii?Q?PEMzwg2cyPPsbAQsKH092sz+gfnGAgN57QMNUzzCRrGz934wUIG+SkLEj0vY?=
 =?us-ascii?Q?KCbW/qmRE3NvUnAGQU20ZbEZeFVe2TqCT+dcZHgfCRgtT/k96mZzkSIAfAyG?=
 =?us-ascii?Q?R8qcuk+m7mEbrqKz7MoqrFnJ54U0Kb1zl+CAnSNusR6OnHOfj8kwRpvgmafo?=
 =?us-ascii?Q?iw=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a3bf254-7258-4bc3-6a34-08db45a6fb2c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 16:06:08.5624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HDEBx2llDjuPYNSxPQg5ergufaJAYL5Gx3E3PbkP386C2XzCjsZsM7Kzd2yj44u55BDALfEoKdAvqfglAuZ+WUVuQFRdgXrEk4rR11jAjQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR02MB9233
X-Proofpoint-GUID: W1t6s8h5ATMBvjcncl2zTPXO-xrzGGic
X-Proofpoint-ORIG-GUID: W1t6s8h5ATMBvjcncl2zTPXO-xrzGGic
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_07,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

multifd_send_sync_main() posts request on the multifd channel
but does not call sem_wait() on channels_ready semaphore, making
the channels_ready semaphore count keep increasing.
As a result, sem_wait() on channels_ready in multifd_send_pages()
is always non-blocking hence multifd_send_pages() keeps searching
for a free channel in a busy loop until a channel is freed.

Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
---
 migration/multifd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index cce3ad6988..43d26e7012 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -615,6 +615,7 @@ int multifd_send_sync_main(QEMUFile *f)
 
         trace_multifd_send_sync_main_signal(p->id);
 
+        qemu_sem_wait(&multifd_send_state->channels_ready);
         qemu_mutex_lock(&p->mutex);
 
         if (p->quit) {
@@ -919,7 +920,7 @@ int multifd_save_setup(Error **errp)
     multifd_send_state = g_malloc0(sizeof(*multifd_send_state));
     multifd_send_state->params = g_new0(MultiFDSendParams, thread_count);
     multifd_send_state->pages = multifd_pages_init(page_count);
-    qemu_sem_init(&multifd_send_state->channels_ready, 0);
+    qemu_sem_init(&multifd_send_state->channels_ready, thread_count);
     qatomic_set(&multifd_send_state->exiting, 0);
     multifd_send_state->ops = multifd_ops[migrate_multifd_compression()];
 
-- 
2.22.3


