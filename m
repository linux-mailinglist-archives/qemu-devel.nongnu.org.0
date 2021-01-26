Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CF8304A43
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 21:41:38 +0100 (CET)
Received: from localhost ([::1]:41668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4V9d-0000SN-EV
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 15:41:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Wei.Huang2@amd.com>)
 id 1l4V8J-00080T-AA
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 15:40:16 -0500
Received: from mail-bn8nam11on2075.outbound.protection.outlook.com
 ([40.107.236.75]:39937 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Wei.Huang2@amd.com>)
 id 1l4V8F-0001HQ-FJ
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 15:40:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilirJ4xg5EngPVLmlfaPCalTxVw3iDgowRzSHY3004bcXdjyYvsFFHmc9ZnEpBY/gs9juVRRsGj2qmOUFJFcWiv6W2meFsnD5rGRhVaM7n3IDzRKj7w16LCY2JR99S99XdC++98RhjDnqHEdqYnPc/Mu4YwXd0NjPhnidHdIKFQ9AQfG1jzSMqlmlLPTAXwqVaef9f7JFixkZrc+jfrItQtGc9VS9Z1DLnDffj0WBqd2LcQVWWl3D89A6dLV9O7LIUN4zKQIWmxrK0aNTfJttCdb9fxDujOoLxBKDZxSiW9l5TugnysHT6a4D9SsgwqvYSSuzNs+MEinaJgcoJcDEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNPZSdYcS+YHueCgEO7+iHMJFxfXo1w8FshczxBc1Lo=;
 b=WNpeFSJr01KbcXrgYHFGIxPluE3bNjo/Nq+EbDlFrmHS2SK6YvJQ1UBwc6YpKiLVR3q/EYlqDYlMb7RbJnqcf78Q6JYEbI1/Hu3G3dGuQYZaqwI1Q5lq+dGRDDWJJajhX3O9jJT0b8TtTuKp7D7ohlhyRYLuaKIiAZW733F0EHxfWE0BpO1gVRpBj3s2m1JWIkLcxGRe70OZFq6sZR7zIL3IS8mp4ALbyONuD+nDsIWB8eYNIAxBCcpkOARz1PXzc64TMBNkHf0X8ggiXSMd5HW/NGJmzj3voy4AhN8qLlkkbF9JngIHcDpeqVm188wq+M+B01yb9wtmAtE62Osgkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNPZSdYcS+YHueCgEO7+iHMJFxfXo1w8FshczxBc1Lo=;
 b=FZ+Wunx53GhMONQusnHIZ370uF6WC1IK8cS3V+9GjFoqBN43s8u4t+XZoS5mKvOCcSkplR4xqmO5eydi3nI60QeLrCrjSyFeoRdLJgWnhnBycZl+iWrDfgI0eir6oc4y2yQUDBx9bcHsr+5opj1l8rX+zT0YpBUqA/gE7U8/ZbA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1494.namprd12.prod.outlook.com (2603:10b6:910:f::22)
 by CY4PR1201MB2485.namprd12.prod.outlook.com (2603:10b6:903:d2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.16; Tue, 26 Jan
 2021 20:25:03 +0000
Received: from CY4PR12MB1494.namprd12.prod.outlook.com
 ([fe80::25d2:a078:e7b:a819]) by CY4PR12MB1494.namprd12.prod.outlook.com
 ([fe80::25d2:a078:e7b:a819%11]) with mapi id 15.20.3784.017; Tue, 26 Jan 2021
 20:25:03 +0000
From: Wei Huang <wei.huang2@amd.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] x86/cpu: Populate SVM CPUID feature bits
Date: Tue, 26 Jan 2021 14:24:56 -0600
Message-Id: <20210126202456.589932-1-wei.huang2@amd.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [70.113.46.183]
X-ClientProxiedBy: SA9PR11CA0012.namprd11.prod.outlook.com
 (2603:10b6:806:6e::17) To CY4PR12MB1494.namprd12.prod.outlook.com
 (2603:10b6:910:f::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (70.113.46.183) by
 SA9PR11CA0012.namprd11.prod.outlook.com (2603:10b6:806:6e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.14 via Frontend Transport; Tue, 26 Jan 2021 20:25:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b44576e5-203a-4a1f-293f-08d8c2387643
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2485:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB2485016F306289136FF32DBDCFBC9@CY4PR1201MB2485.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cZpwvVfD47sY1eCMpPXlxsX7r8A8paH91Ahj430PZDfPe48ug1mNp7/YwGv8IMmGCG7TJxzVIvRMB5dqoXh4JCcHsNEEUYmmCnjb3rV1TeQelWhiefLClacrCE0nlbSY5umJEcfYgV6Ud5XM2xGFL/5apuBM3OzAdMo2w/HcI7oxbNRXHAQkxhdKNaeDVDceQJvwfKXUkxhDPQZ79WsGKMkki8uB4pr8P8VETZkhfbHRSV/mIhpBmq0XHkekQAVZqM7RcQGc/q6S0poNiXuJGu+jXvP7AZLlFzjN3RJIynXSxFn1PUErAQAEo8N920iJdEzu4mwqwJAZ64I3F8vmaNPP53P7VLgO4hglf7GAbYHLESF0oVShazFbFK48PCjlGcSO+xf1sauRDBa/IszMK1p2vE2M4883stXK5GJ6C3OCo3819d+U6j/PkmBHaQOW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(186003)(8676002)(6486002)(26005)(16526019)(6506007)(478600001)(2906002)(4326008)(6916009)(2616005)(8936002)(6666004)(316002)(36756003)(69590400011)(1076003)(86362001)(5660300002)(6512007)(66556008)(956004)(66946007)(83380400001)(52116002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?acupjpLgjSWEJaJ03mhTWi+ghX15o+WgDz3Ov6GWSBz7L2TUhwRuvo5ZSf6b?=
 =?us-ascii?Q?bBYBDAcYAvIJJS7ItmiTfkhrf1wuVbvgulxcqofBZX4hX26NinI1cTfFZ1zk?=
 =?us-ascii?Q?76lwDVOVDmq9UM0hlGIj0xK/PsG8Wb7X2wO7+tkfpb6Fxu4F51EE/zqNbfl7?=
 =?us-ascii?Q?6WRfxmS6deQ4P2tsNUfdpV1TxQUsmn9soWBgpXdB1QYkreAiKM2xFvSPqBPO?=
 =?us-ascii?Q?CeJffa1m3/glyjo2C5yvZMdMvJZ3vageNBsu8LYCqdD6btuWCAeIIuPFHE0R?=
 =?us-ascii?Q?aNLh7M0Ai54I9DgQX2nRRe5ozVF2sQZ8uufpOv6zIL0zX8W2EQjEJ/1Lo4GY?=
 =?us-ascii?Q?dId0vPLOZynE+dBvG4RqKZnntEBnLqEx7k8LNo+VZTUtgjzEFKW0EivoP7hX?=
 =?us-ascii?Q?VbgSevwItAQd6haYgOimffxRfKSxyZyMKXrl3CdcLIKOchK/S7ZkFS5EGpsi?=
 =?us-ascii?Q?2kj35jvX2ts5cvv9hHRLLhGa5FwVBlyLE6XpbN65MEwa0eqTVkhy2Owbb6UE?=
 =?us-ascii?Q?TUaxXDa21WeJ/sk81XSLf9jrRm7JA1J/wB8wjmoac9kL/X4GL0CFslgFzxIJ?=
 =?us-ascii?Q?2fTw11aXXkGHnlo+kvSgZiUbCVpXPeJbhyWlWcVoI3lCyP1et00YYOx26/yC?=
 =?us-ascii?Q?lWhVFRhowtholngVu+3vLbk2PQVcApnXrGHfTj1Y3VCbd7gCYf7IR13WnE3A?=
 =?us-ascii?Q?IucQTOCmUVKuOe8+I9eL7RPb4+VudCveTZQs38XneOlvIfweOxLkywfVC0B4?=
 =?us-ascii?Q?t0Idn4kUfQjb5AYdnD8D04ZT0E9D1SoYkpWBXZkQoftSKJ0NzuIbfSRsWTiY?=
 =?us-ascii?Q?tYiRAwpp/v4/NMA3UU4wSyDzyiI1X7KJTsP/cc4BVJz2hDdyqLZ33zFdti2+?=
 =?us-ascii?Q?d/6xhAzXBhonjn4BaMH9226kXnX4gBaG3WgM8sWJaYgy+F3KAueDqA4LKRmw?=
 =?us-ascii?Q?nQrJyCMMF6YocdI5ELQYn1s9X2OvJIOb8mfA+44qpyhi8Qbc0jPvGFMtAmWD?=
 =?us-ascii?Q?NbqWSLpfyM7O/fY8ByvzPHnwYbojnfhzB1sE08fv/d1PcZ2h+D52pTkCltPe?=
 =?us-ascii?Q?mhP/r1pu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b44576e5-203a-4a1f-293f-08d8c2387643
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 20:25:03.3284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gpdir03pLLh4NJ8HvVDXLw1fmAJcvzCBQ2G1bXU16hy3FPLy8cmuFXe+oQeEYN20
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2485
Received-SPF: softfail client-ip=40.107.236.75;
 envelope-from=Wei.Huang2@amd.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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
Cc: ehabkost@redhat.com, wei.huang2@amd.com, richard.henderson@linaro.org,
 dgilbert@redhat.com, mlevitsk@redhat.com, babu.moger@amd.com, bsd@redhat.com,
 pbonzini@redhat.com, vkuznets@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Newer AMD CPUs will add CPUID_0x8000000A_EDX[28] bit, which indicates
that SVM instructions (VMRUN/VMSAVE/VMLOAD) will trigger #VMEXIT before
CPU checking their EAX against reserved memory regions. This change will
allow the hypervisor to avoid intercepting #GP and emulating SVM
instructions. KVM turns on this CPUID bit for nested VMs. In order to
support it, let us populate this bit, along with other SVM feature bits,
in FEAT_SVM.

Signed-off-by: Wei Huang <wei.huang2@amd.com>
---
 target/i386/cpu.c |  6 +++---
 target/i386/cpu.h | 24 ++++++++++++++----------
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 72a79e6019b5..85e529157659 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -926,11 +926,11 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "npt", "lbrv", "svm-lock", "nrip-save",
             "tsc-scale", "vmcb-clean",  "flushbyasid", "decodeassists",
             NULL, NULL, "pause-filter", NULL,
-            "pfthreshold", NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
+            "pfthreshold", "avic", NULL, "v-vmsave-vmload",
+            "vgif", NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
+            "svme-addr-chk", NULL, NULL, NULL,
         },
         .cpuid = { .eax = 0x8000000A, .reg = R_EDX, },
         .tcg_features = TCG_SVM_FEATURES,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d23a5b340a8d..b39ec505de96 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -670,16 +670,20 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_EXT3_PERFCORE (1U << 23)
 #define CPUID_EXT3_PERFNB  (1U << 24)
 
-#define CPUID_SVM_NPT          (1U << 0)
-#define CPUID_SVM_LBRV         (1U << 1)
-#define CPUID_SVM_SVMLOCK      (1U << 2)
-#define CPUID_SVM_NRIPSAVE     (1U << 3)
-#define CPUID_SVM_TSCSCALE     (1U << 4)
-#define CPUID_SVM_VMCBCLEAN    (1U << 5)
-#define CPUID_SVM_FLUSHASID    (1U << 6)
-#define CPUID_SVM_DECODEASSIST (1U << 7)
-#define CPUID_SVM_PAUSEFILTER  (1U << 10)
-#define CPUID_SVM_PFTHRESHOLD  (1U << 12)
+#define CPUID_SVM_NPT             (1U << 0)
+#define CPUID_SVM_LBRV            (1U << 1)
+#define CPUID_SVM_SVMLOCK         (1U << 2)
+#define CPUID_SVM_NRIPSAVE        (1U << 3)
+#define CPUID_SVM_TSCSCALE        (1U << 4)
+#define CPUID_SVM_VMCBCLEAN       (1U << 5)
+#define CPUID_SVM_FLUSHASID       (1U << 6)
+#define CPUID_SVM_DECODEASSIST    (1U << 7)
+#define CPUID_SVM_PAUSEFILTER     (1U << 10)
+#define CPUID_SVM_PFTHRESHOLD     (1U << 12)
+#define CPUID_SVM_AVIC            (1U << 13)
+#define CPUID_SVM_V_VMSAVE_VMLOAD (1U << 15)
+#define CPUID_SVM_VGIF            (1U << 16)
+#define CPUID_SVM_SVME_ADDR_CHK   (1U << 28)
 
 /* Support RDFSBASE/RDGSBASE/WRFSBASE/WRGSBASE */
 #define CPUID_7_0_EBX_FSGSBASE          (1U << 0)
-- 
2.29.2


