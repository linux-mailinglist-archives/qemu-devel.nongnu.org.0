Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 470DF2FD77B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:51:21 +0100 (CET)
Received: from localhost ([::1]:52126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2HdY-000689-2U
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:51:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPj-0000T7-SQ
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:37:05 -0500
Received: from mail-dm6nam12on2125.outbound.protection.outlook.com
 ([40.107.243.125]:3041 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPh-0002pJ-PB
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:37:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/FhGLgKBVr/a2kvXAm4F1SfKMgw4UgZdY9ImvdeDosUizrKG6zM3LWsEQerE6qXhWbH3vg1KNDnal4U1rhYfB2A69QVOAXqoWl1VVDs0euyVsh6Z15zCIHn+vt6iiyTxrNLEE0SxIgX279oEln9xvQdvmh4iC5mPZKm7BWIzHjaP0xvKvRv8UmAJrZf/xLycg8Rj6nZ0zJIxnnyaLkDlPOS/Y2HZNSAb1PH3KTNnUCBo+qKURrcnnGJYbLO+lPty1EFEY5gkp/gHWe0DIugype3qdBdam8zse7izrwwzA3WZuJwQbBpDBLr+Zsu5rCluew+Wj3ySQO4t8rIY1/R7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zruoEEMNXnOOSY/un968eYMVdoovUwwx1KHo3DKWNTY=;
 b=ndMORrJg9cOmRGTtg+NCk0YlMlGGDX3c9xYPhBQLZOsyE+bi3j2zFSNq3q9wc2iDOTfMTCZKJwW1XCemlIfopHC2rgWsGbjYAwBXN5+1viXz2qKZ43kJn0eWkVti7gc1nJkn8UPyk16w8viagQMVfaXiykUZKYUz31tDmj/HdDgonJkIwmAHcR5eHLYSIlVMLu23smdHJama07AJa91w+P/8Fj3saQcC1mHr3MC6SnWr3XHOsOV/XTmBe98KYswUNlaintxgg7rS32vQ9qBl/QUCUWAjKhyNkfhfHvSFfLFCP00PCGrd+mvT1fpapVZxXrvBeVPDj9hjd0pVGVuyjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zruoEEMNXnOOSY/un968eYMVdoovUwwx1KHo3DKWNTY=;
 b=qEJuYdhOpJyFwuf8R+a/3mmYteeVtytwTAvwoPWiAg4KkSNibI9dQNtE/Bmv4i4R7BriPhQXQlqnVuT4R5gwAeSXD2curcPcvpM3Whp424tBNBBj27gRGj1a0YICQ1kyyPFiSGQDPfjp82B7z3pSlyXH4mz10MkJENtDFwFYEM4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5530.namprd03.prod.outlook.com (2603:10b6:806:b0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.13; Wed, 20 Jan
 2021 17:36:50 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.012; Wed, 20 Jan 2021
 17:36:50 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] fuzz: add virtio-9p configurations for fuzzing
Date: Wed, 20 Jan 2021 12:35:31 -0500
Message-Id: <20210120173536.265601-10-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210120173536.265601-1-alxndr@bu.edu>
References: <20210120173536.265601-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL1PR13CA0142.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::27) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL1PR13CA0142.namprd13.prod.outlook.com (2603:10b6:208:2bb::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.8 via Frontend
 Transport; Wed, 20 Jan 2021 17:36:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb77cf7b-6836-44f0-c60e-08d8bd69f689
X-MS-TrafficTypeDiagnostic: SA0PR03MB5530:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB5530E83975AB53CBB5352F03BAA20@SA0PR03MB5530.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OzDefVZpw4hZkRCVF/5Pc9zEkvxvdPS/hv0brlkzr6+AFeAEwg20czQvc7hFUIuBvPuIJtjtOXlFd6rbH2fFFo8gbd+jW30mJnt1SG3Ek6H6IOuywb/qt1nubBo9ehwlxaUWZr0BxTU2h80rt6J2E74v8S0Add8VLTe5oYBvSZCBqtAsPVa0zu/iAjV4R0F4lS32rhXTNF4WO3BK+eSdko0N7NO/jTu2NhqTUg+/d/fMUzecPniTGk83TrDhDva+wdTn3MVvZj1v7v/FGXHEVK0FXc29Fr5yxJb5L5prKLr+x3tCIotLk3xEP2NKXJ/b9MPsAndIjrCdW+biHW8njiW9HNUqftcVTpzzZq4Xm2MuyUUXmxq/fnStgWRf6MtW5abdTPAn8r2LEkjyVF2SJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(8936002)(6512007)(66476007)(6486002)(8676002)(956004)(5660300002)(4326008)(2616005)(1076003)(75432002)(2906002)(66556008)(86362001)(83380400001)(6916009)(52116002)(186003)(6506007)(16526019)(498600001)(36756003)(54906003)(66946007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?aNyjrSRrVHl7dwoROIVr57+bhltkSUK+wPyO4M7/6KA54abIVEQpvw6oCzgd?=
 =?us-ascii?Q?d6pTkn5mFLwMzG7VHkA1K26D9o0+SyD2N8f4NkYc6nbIJO8VUuNYHJZYUjJd?=
 =?us-ascii?Q?He/ymCKBLjG0ujzcswqjQCaHhaw/4wt4bxwtwpRYlGBXLOtC5xRH8CoIWIbI?=
 =?us-ascii?Q?HD7int6uAWEKL6ZnhGLozJRCcvg7uljk7lrekFBSejr4ZRZViCbm1HzGYvpy?=
 =?us-ascii?Q?v0iAi4uzM62AtstsQdVfAFAqS2IoLJ+7vhbb4ZJ1rbZipMyDdZpwqFKBUH1f?=
 =?us-ascii?Q?+CC9iZz9hs3H/K5J1IQAAU6tTq7ZrwrFPP9l0B1OpSwYPPrCYcf2ZMAxotaq?=
 =?us-ascii?Q?IAHdnJA273w5wxocsW6qvwbLPMC6dXE+A0TrGcYAZCWiwn6WULCf0eWYe9e3?=
 =?us-ascii?Q?Bd5t3fnQtXTOsRFmZaXU7UyQQClRJjzctAIPjEgAMm6Cr8TG2CYFHAhdDEMv?=
 =?us-ascii?Q?gM2QWtWhkbelyLGqPF4mGkepx0zbUwTR1Ywln2Bvv3yqK8zAgJvSLdmiAXJQ?=
 =?us-ascii?Q?wDxxFJKN61bk53EXeBZz3Ksnqu+J9IehBhp7vy4rPPwyYtaOeVnc+SS8H6IS?=
 =?us-ascii?Q?UkxVKx1vYrlWHV7ATByOXBew62ZA0UNpAoCn1YbJ4tDA683KIRk39uIas10T?=
 =?us-ascii?Q?vPl4c6gqJ20fF0PkhYVdNWkuFj/qeXmvHdY7KTk8opBNNggW/tkJrWwxqnP2?=
 =?us-ascii?Q?b+dMnyFQMqkT0gXuR3vPp3iElVjp2Qdio8SgKpsSpvMpu1S4cpqoeQtHD7m5?=
 =?us-ascii?Q?UP9HTsiaForB68nQiqkViAB+P61/yEXpw7u826m8lORG9nqIJfbsiIqxU0Pc?=
 =?us-ascii?Q?rXa8KmsFnofEURQ7cJXnOezBiQMSspnJ+PSaPCFLoTarWJe4kzcsqAujdi8Z?=
 =?us-ascii?Q?sveqxF8dEVuKGnVAWPW3UiuV0nWX1312hU1CylRU5tS7WMpdip6uxXBXP+ze?=
 =?us-ascii?Q?oD9M6ssH+KFNCnihGX7gbGAd5+OjGFa4OE1fBzgM+OVuS9ll+8LD8FLggWtF?=
 =?us-ascii?Q?eLxL?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: eb77cf7b-6836-44f0-c60e-08d8bd69f689
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 17:36:50.0462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8xIBh8j0w67NInR+7CsOPfyFhOA5PSKSOA6OFQC0RwWFtXUz1NXQTzQ5hoAp4JNu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5530
Received-SPF: pass client-ip=40.107.243.125; envelope-from=alxndr@bu.edu;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.998,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtio-9p devices are often used to expose a virtual-filesystem to the
guest. There have been some bugs reported in this device, such as
CVE-2018-19364, and CVE-2021-20181. We should fuzz this device

This patch adds two virtio-9p configurations:
 * One with the widely used -fsdev local driver. This driver leaks some
   state in the form of files/directories created in the shared dir.
 * One with the synth driver. While it is not used in the real world, this
   driver won't leak leak state between fuzz inputs.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 tests/qtest/fuzz/generic_fuzz_configs.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 1a133655ee..f99657cdbc 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -19,6 +19,16 @@ typedef struct generic_fuzz_config {
     gchar* (*argfunc)(void); /* Result must be freeable by g_free() */
 } generic_fuzz_config;
 
+static inline gchar *generic_fuzzer_virtio_9p_args(void){
+    char tmpdir[] = "/tmp/qemu-fuzz.XXXXXX";
+    g_assert_nonnull(mkdtemp(tmpdir));
+
+    return g_strdup_printf("-machine q35 -nodefaults "
+    "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
+    "-fsdev local,id=hshare,path=%s,security_model=mapped-xattr,"
+    "writeout=immediate,fmode=0600,dmode=0700", tmpdir);
+}
+
 const generic_fuzz_config predefined_configs[] = {
     {
         .name = "virtio-net-pci-slirp",
@@ -60,6 +70,16 @@ const generic_fuzz_config predefined_configs[] = {
         .name = "virtio-mouse",
         .args = "-machine q35 -nodefaults -device virtio-mouse",
         .objects = "virtio*",
+    },{
+        .name = "virtio-9p",
+        .argfunc = generic_fuzzer_virtio_9p_args,
+        .objects = "virtio*",
+    },{
+        .name = "virtio-9p-synth",
+        .args = "-machine q35 -nodefaults "
+        "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
+        "-fsdev synth,id=hshare",
+        .objects = "virtio*",
     },{
         .name = "e1000",
         .args = "-M q35 -nodefaults "
-- 
2.28.0


