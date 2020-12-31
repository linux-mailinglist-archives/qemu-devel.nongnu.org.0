Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AAE2E802A
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 14:14:49 +0100 (CET)
Received: from localhost ([::1]:44528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuxmy-00051K-4f
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 08:14:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <utkarsh.tripathi@nutanix.com>)
 id 1kuxlu-0004QQ-Bk
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 08:13:42 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:48680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <utkarsh.tripathi@nutanix.com>)
 id 1kuxls-0004Uw-90
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 08:13:41 -0500
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BVDDaw6031707; Thu, 31 Dec 2020 05:13:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=proofpoint20171006; bh=ZP6fMDl7AKUIfvOCu34LN1mj3uRgIg/CYzlTCYOZhfo=;
 b=fW2rV5UilWmEmclDZDWg/ql7Vjflf9kVUc1Yk2g0Pl5c3FR8OhH1ldRvjWXjQ/VlBTk9
 Uw91BKmfqsevUwYyP6NFzHtWBwobOykswHmCJ5MM9dxo2c6bx7AWMbUl/f/vvBqpnptm
 GqaxdpvNtOL25KOhe15gV60fcWXDvr+/8IUEBqkVG4Vmpbag6tPPQWQOglrunZlwEyCK
 IaD3Vezrbec8yHqniRUi3WH2dzQ7y+fwBcDJDuL5U2rEY/k6qHI8HG/S3aKa0j86h5OC
 7g7CBUGrUivapfYJA3wkLem2ZzRPACt2d7djioQO+ZqzWN3i9QtdJpqS6OfJwEeym1KW Sw== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by mx0b-002c1b01.pphosted.com with ESMTP id 35rdsv2nq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Dec 2020 05:13:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K55QNkx203UgGrL6ryikqfHuHADNwK6PBqioIEBClByZXj/+Kc7469xOdzTQEYUdkpkJ1p+A+UDkElc3zFxPRJvCaVjNyd+7aJ8beOtr3w7mYIPxpOhSeEWFgLY+0WYqgQ4Z1Bs2Iv5vE0zi3r/WX1Jn7N9y76MIUQOHnLdtviLoi41FXi4rUMgQBrVIhs205nYHumN5d2X2F+cbP/A+yC+uere6tjUWfL0YqVPKyoke+MjukA6j4ONTXJiMP6CIUgGy6OM1qAOerEbhnVO2cM3xFhmGQb653wODloE00iT1FiLShkogpnAY/DGgptmgJhR5nN97uB1BnTtyaaEWoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZP6fMDl7AKUIfvOCu34LN1mj3uRgIg/CYzlTCYOZhfo=;
 b=Fgg1fGSNZOXsqApcEoJUKiieiBp2ebm7wU5rZCXJMyAtHP81Acgu16HnKvq3H/UvRyW5wJ67J452PhQJ0FFfBd2Gu4V9OQ4NnoQytpEdMeNiJ/x7B24QEiYvqRSpQUiAWnlvN8rsEncyanZ12u0UyXb3j2nhoU9cHOVGJyZawnipiv19ekghOof4Sw4UJA3PYhGVcl8hlO175srRDpC0IgJaW2/tcWT0IX/yTecbbmWjPNstCf4Ql4xD1d3eusIuH3yUj5BAR+TMGdKBkX+gKZhljUnJfuIc5yU2cv4/yTiy1sOZpRZXp53cV+dfTU9LJ3syYpjRL8rKOWRYjSmyIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=nutanix.com;
Received: from MW4PR02MB7268.namprd02.prod.outlook.com (2603:10b6:303:78::24)
 by CO6PR02MB7556.namprd02.prod.outlook.com (2603:10b6:303:a1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Thu, 31 Dec
 2020 13:13:33 +0000
Received: from MW4PR02MB7268.namprd02.prod.outlook.com
 ([fe80::a9df:f6c:551d:f46b]) by MW4PR02MB7268.namprd02.prod.outlook.com
 ([fe80::a9df:f6c:551d:f46b%6]) with mapi id 15.20.3721.020; Thu, 31 Dec 2020
 13:13:33 +0000
From: Utkarsh Tripathi <utkarsh.tripathi@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] cpu-throttle: Remove timer_mod() from cpu_throttle_set()
Date: Thu, 31 Dec 2020 13:13:04 +0000
Message-Id: <1609420384-119407-1-git-send-email-utkarsh.tripathi@nutanix.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-Originating-IP: [192.146.154.241]
X-ClientProxiedBy: BY5PR20CA0035.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::48) To MW4PR02MB7268.namprd02.prod.outlook.com
 (2603:10b6:303:78::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from utkarsh-tripathi.ubvm.nutanix.com (192.146.154.241) by
 BY5PR20CA0035.namprd20.prod.outlook.com (2603:10b6:a03:1f4::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend
 Transport; Thu, 31 Dec 2020 13:13:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f82e13ea-1daf-496a-b99f-08d8ad8de03c
X-MS-TrafficTypeDiagnostic: CO6PR02MB7556:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR02MB7556858D606BE47FFA7F426183D60@CO6PR02MB7556.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H0oatpMFQ9HjbHU8+qMpQvzXFOa30fIhWfGKL4XRp4sHemhJwNCclvLITPtPSj9jeUveyDMOOx+3Q9LqsDkEAVhTvwFt9TyKhk3K0To10zjW0jT69B4KtuXng6qdmojpapTJp03wXXdtheo94cucM8f8q8IeTaeQZI5/57o1DqGTyh5Of0uSUI+YaqmkX6umUk4x/0QQDjCCcPxhh2GOWBCPgpDJfncTpFVKliSullVPyOfialdKlCxeoPGHJPmZQgwGMqaLW6dCtrsdLeoVMIwvaiYAoQdW6jpjCXC4cvvPQIZf3ectUUiykFzq6XvkNVLDoDbMLIg0Vo3Fr4SxvqO2utt4H2h5jeJmle6kkdXFXsFcZS12gvlclAaBCk77p3pOrZiTz6SmwRufRXhtJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7268.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(396003)(346002)(39860400002)(136003)(8676002)(66476007)(478600001)(66946007)(86362001)(16526019)(44832011)(6916009)(54906003)(4326008)(8936002)(6666004)(36756003)(6486002)(83380400001)(7696005)(316002)(186003)(52116002)(5660300002)(2616005)(26005)(2906002)(956004)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?yJo4KY2Wjso8hma0wYv5/b97ea7N8GOvH3ypjRABsg6Dc+5OCYtj3cfH+GfR?=
 =?us-ascii?Q?kTwY/KHuv7LibMGq7OFSeKUQlb58or+g7AIAfWryGQ3swu1a3kB+4icze2wX?=
 =?us-ascii?Q?ATGtFuG0+qrlPUXxYtTpbWfuGQXSd+9FU4Sql4AzettC9Qq34n7AjUUxhq4+?=
 =?us-ascii?Q?dDQxOmdWyWPTv05fe5MIDHdBXfvNrG7aBVoKBwL88Pu5mJ/u7+NWimjes1lM?=
 =?us-ascii?Q?BYdXjfaqN3dSPB+rLK6Qd5HgR8V7aWFuAVO+CobDLccytD9vLAk8uC6MRB7/?=
 =?us-ascii?Q?ccLm8HEP0CRujrXJO7182yQ5l3NUThbh0RtO0Hbqvls2OqpSMniTDKStM5Lx?=
 =?us-ascii?Q?3DqZXiqLFbes9A+3oegb6eem5ExD4NgJLUosHMx2vEDguLVgGpPfP28hi51L?=
 =?us-ascii?Q?HoAwLikA6nxPGVJoZIyy1G9xgLqoEHMX8TEQmOucgnPK+z4l3Jg4L0TkA1Y/?=
 =?us-ascii?Q?Z4+0D8g3S1fVh7P1NIVjtd3MUM7Wx1+jsDCXy2s1WVL5smmvGOzG4lWXaBwg?=
 =?us-ascii?Q?UMoQH9KNWrGM07XyD5Omzmo4s0/UpQFC1+6oN32plzzv6WgwsoweCMVJ+79e?=
 =?us-ascii?Q?Zl58JAPFAu5kJ6/jT+mejCu66eLte+xNZFBnUVyRUbux5jOvDc2qS4xBw40h?=
 =?us-ascii?Q?cJ5PqlAnLSZ+4RQ0wYVgufE8YNl9v4JicIhI+OgjywEJ+q3YAbZG0AT0ZoJX?=
 =?us-ascii?Q?fF1Hnt7yS6pUW4gaQvE8WCvBma7GWAERYWFEU1k23T/pCS8abeI273ipaBYV?=
 =?us-ascii?Q?e8eem9lqYOEbRVnbKNFaT3cD247Lj15W2xrIJkFEC1lvPkTSKxyDi0nmKel4?=
 =?us-ascii?Q?lc3FJmwwTCmKXv4623Q7MTudkvSs+jjcsP721T4BgOABihVxseRSakJIQwyJ?=
 =?us-ascii?Q?6CCMl+6phEL/+AypVOoSqxbNRel3uBBOw1J8ZOtjepAdhggVtWidDpV9iXzT?=
 =?us-ascii?Q?fXdtOLt6N1PBtO7Y4h7hDIBeT4OgVppC6wY+wIs0Pc0mxqsQ58uaY0oi5hft?=
 =?us-ascii?Q?7+Lf?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7268.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2020 13:13:33.5452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-Network-Message-Id: f82e13ea-1daf-496a-b99f-08d8ad8de03c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y8+rX4i0wfwXn6Q90EUsj086sRY8oWagFW97Y5TRZ72xj0p+G/A9eF3mCrZkm2wuGQKtvNq5pQndJI9YU4Y6k7poaE5o4LjOrMs2Hwhzvg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7556
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-31_06:2020-12-31,
 2020-12-31 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=utkarsh.tripathi@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Utkarsh Tripathi <utkarsh.tripathi@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

During migrations, after each iteration, cpu_throttle_set() is called,
which irrespective of input, re-arms the timer according to value of
new_throttle_pct. This causes cpu_throttle_thread() to be delayed in
getting scheduled and consqeuntly lets guest run for more time than what
the throttle value should allow. This leads to spikes in guest throughput
at high cpu-throttle percentage whenever cpu_throttle_set() is called.

A solution would be not to modify the timer immediately in
cpu_throttle_set(), instead, only modify throttle_percentage so that the
throttle would automatically adjust to the required percentage when
cpu_throttle_timer_tick() is invoked.

Manually tested the patch using following configuration:

Guest:
Centos7 (3.10.0-123.el7.x86_64)
Total Memory - 64GB , CPUs - 16
Tool used - stress (1.0.4)
Workload - stress --vm 32 --vm-bytes 1G --vm-keep

Migration Parameters:
Network Bandwidth - 500MBPS
cpu-throttle-initial - 99

Results:
With timer_mod(): fails to converge, continues indefinitely
Without timer_mod(): converges in 249 sec

Signed-off-by: Utkarsh Tripathi <utkarsh.tripathi@nutanix.com>
---
 softmmu/cpu-throttle.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/softmmu/cpu-throttle.c b/softmmu/cpu-throttle.c
index 2ec4b8e..8c2144a 100644
--- a/softmmu/cpu-throttle.c
+++ b/softmmu/cpu-throttle.c
@@ -90,14 +90,21 @@ static void cpu_throttle_timer_tick(void *opaque)
 
 void cpu_throttle_set(int new_throttle_pct)
 {
+    /*
+     * boolean to store whether throttle is already active or not,
+     * before modifying throttle_percentage
+     */
+    bool throttle_active = cpu_throttle_active();
+
     /* Ensure throttle percentage is within valid range */
     new_throttle_pct = MIN(new_throttle_pct, CPU_THROTTLE_PCT_MAX);
     new_throttle_pct = MAX(new_throttle_pct, CPU_THROTTLE_PCT_MIN);
 
     qatomic_set(&throttle_percentage, new_throttle_pct);
 
-    timer_mod(throttle_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL_RT) +
-                                       CPU_THROTTLE_TIMESLICE_NS);
+    if (!throttle_active) {
+        cpu_throttle_timer_tick(NULL);
+    }
 }
 
 void cpu_throttle_stop(void)
-- 
1.8.3.1


