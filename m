Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C8D2FD767
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:46:50 +0100 (CET)
Received: from localhost ([::1]:40384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2HZB-0000vr-Ja
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:46:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPi-0000Sf-Bh
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:37:02 -0500
Received: from mail-bn7nam10on2095.outbound.protection.outlook.com
 ([40.107.92.95]:32454 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPe-0002pL-UK
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:37:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGknHZwAJ74HrYu/y5Ud75Cp/yEKKehc8CBBZ97ZYdqGJ6bJ9AxxouBl+pJYMHumFHuPvg7+pW+p+66YByYOMmCSrEiRdXnZPZGkR1SzNtH26nIO51utwtV6TKp6+NnyT7TUsJ2Bnmy2QRxmIz1QZRWN6eyjRxz4iOoGozcBDS72XFAqARBH0ro+uJJh4egXSNUwvzTVg1CfOY2U/nanHZi03eariir7BeIUGhzmPYi8ABS2MDO7QQPTvjsOaFlUmAAVrGR9b0ZtB0M64MA1stRzVHjmD05pcm2lh+ad3D18MBXDYsFurKzgcM5QDpz29xG5E3GjU6ShPoleC4KsAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVgYJkhSqwv4Miwh4NFlVzR1B03y1tpvL4eVBWO8GA0=;
 b=GKEZPey2bo5aG6y/HNVQY+wmBdSMsRSPXTqe6JE3AV4Ctn+qA0wZD80u86BOPNL7eYzzX7nSlA2IYNFk3nGiFFRKGxGPnwxVT1UeYCKHlVxnOuFytLQ1/FC7npmXABWf57Nd0Y0FraPx/zS4v8+4kJTeTeMm7572t3oXH0XWMUsGZ4qMwYfr0Zj995+PsrcLww4BnbrM8qMV6vgHMCsSLwODDFBd2ekfBRsK7Cufk2WZbF9g0Ib4Jk0I2hJIJSaWPcg4uh1kRj9f7onRRwvnHEY3hXz8GI/R/UCBlCE4C8eK/Ek9XV8UaxtiJd91Qxa01t7+P+LvpY2nV/rylY6wyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVgYJkhSqwv4Miwh4NFlVzR1B03y1tpvL4eVBWO8GA0=;
 b=sYcHMCpwqC4kmLyTFSa6HGeE+nv1EN4I1xXlqY8WFUMSnqsXq5ZV1WIGbVYvNQMm8jXrBcYyLGm6SGYFObdw+h4jCKo1HXsJ1hQDhxiXyWShjrdy1Hwz6Qxqs01v6bFuAFgIaojjebSCL6vhjg48tMllcZrqukCHyhd4q6vg0+I=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5482.namprd03.prod.outlook.com (2603:10b6:806:b3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Wed, 20 Jan
 2021 17:36:51 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.012; Wed, 20 Jan 2021
 17:36:51 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] fuzz: enable dynamic args for generic-fuzz configs
Date: Wed, 20 Jan 2021 12:35:32 -0500
Message-Id: <20210120173536.265601-11-alxndr@bu.edu>
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
 Transport; Wed, 20 Jan 2021 17:36:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c546a8c3-1661-4f14-7527-08d8bd69f86a
X-MS-TrafficTypeDiagnostic: SA0PR03MB5482:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB5482914DA6515E2C7BEAB33EBAA20@SA0PR03MB5482.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rcqsxHcVkoep9GGbp/lRlaUv3gftfy8aa7Lyc1jTD5aTt7Qsz24Hj5U+ph65UYmKYdf0I9V9ejV5iXpRwMPbX1wTTdgnRIOUMYXI/8zrVqRJzcjQKSWDqUC06ENmTNhc2sgKWGy3jbtmGqA1SSSWphaufLblYduw64xkYjP9wLKiKs55WELINBM9DrqZa6MDdyG5FFKrF7BEagS5U9FEUy8uaVaxPb5IbUMqRQ5BZcrwGjS5HDY61VbhjOIu0WS1qk4MW9U+2NNAcV9yvyshFLk+hy2FNfoerZzu8tx7gu4SNawlN3k8ZjYHlcHhiS5LcHEkMAdAiLbgHOj6ObpYMPFDX14k0dJ0agefEXWGGOHFmiBv6NKqDwOjpbnKIqx+k/qUIiispELI+0zWzmf9e891dU4fumUO3/D1iHChalMcy0YyuFdWsoaOmMzc8WO8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(6506007)(26005)(66556008)(186003)(6512007)(66946007)(5660300002)(86362001)(83380400001)(6916009)(66476007)(956004)(16526019)(2616005)(54906003)(6666004)(1076003)(4326008)(2906002)(8676002)(52116002)(316002)(36756003)(8936002)(786003)(75432002)(6486002)(478600001)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?glnC0i4YIvNXxz1Zzx+AHP8FYfzFt43yaIS9JY6nNgkzpgVlpHPNG00RnCbE?=
 =?us-ascii?Q?GuIjcNYEUTNecSBpxlJOYP4R7PM7JPn6NQ2rSb1SQHjL3CHgUFL6kVhUQohl?=
 =?us-ascii?Q?SA7p1A+AwfTHwIrziYVAs+/91+zebn/YttVhpS73cAnqVontbOFODUXvzUBx?=
 =?us-ascii?Q?3HRgmpRDXGt7Kbe9nxH6lILRYjiyJ54JoEwcrrVxIXu7Sg7z/uZFal4RAIsm?=
 =?us-ascii?Q?EwmDj4ufUpybs1r6tjZ9Z6x5YIlKQ8yNkCWSPMvsT9BPP0DAU/5uUy0gzhjP?=
 =?us-ascii?Q?0+PxpzzI5yTFRbIFTTwjboQ1DyxNdqlJcVLJWu150aIRwKpmiudyjSocwBAb?=
 =?us-ascii?Q?1XoHRL5YFE7pj+cm54yCfsstPAsEl3yTqi7gPKVD+Tq1rA7dGHsWHyqeQHIu?=
 =?us-ascii?Q?/ZQco21VH1h91Yg36+X/Hc2rZZqw1tBv+Jz4XwflZ5rdkJRQiPhINknskMNH?=
 =?us-ascii?Q?/ylT69mWfBrqdkV/Ll/whTdKzzM0gJf6QbHcvr78VSz8SlDGAWLyS0FRvy/n?=
 =?us-ascii?Q?IwsDcUkqFd0DXbAuOBXk6emzbaEBeV3s30zCZACuff1J7Yw2YGbgCrMKNmkI?=
 =?us-ascii?Q?KqGLCp7Cy8pIV/gmTVfmwhZRHHqy2oOt3aZ44b92hEbaXuFbWME8Mmee2PqH?=
 =?us-ascii?Q?+8+uqdgySUpOEXGK1IlT6QxzL929krTN+/53D8NjilSv6qyuA3r53eE+v8/S?=
 =?us-ascii?Q?+sJAWEAxmJ5ocgW01VI2lw4rtGNT5MBm0kxOhjQroh4HahzFRoANgZJbNNqF?=
 =?us-ascii?Q?NnMjQtsrbFlIdDPSBzm+mhb4STcZon0n2DdT/tjISP0Ou6LvAH3k8+zPmPAb?=
 =?us-ascii?Q?sEYxfpKlOUI13euVQyYZBrHv4vBG+NsHn1hAUUCO9tMExFa/bzx6X9nvRsYO?=
 =?us-ascii?Q?msztFIMQw5fhNcUTOb6E28XPEYpc/3jQfRSJDnZnHPgU+FHXdxpGhyHtgmWR?=
 =?us-ascii?Q?wffICrPpzfbNHOckGDKMbufm0INx+9f+Rr7QFkndxkoxG6tHjcwnWgLj0eVC?=
 =?us-ascii?Q?ZHxf?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: c546a8c3-1661-4f14-7527-08d8bd69f86a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 17:36:51.5614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zEFRHK04/WRkmSE7SfLNUL0gY6vorXXyMdJVDvdwoxD9703dRTRWT2hc0azKr/RQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5482
Received-SPF: pass client-ip=40.107.92.95; envelope-from=alxndr@bu.edu;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For some device configurations, it is useful to configure some
resources, and adjust QEMU arguments at runtime, prior to fuzzing. This
patch adds an "argfunc" to generic the generic_fuzz_config. When
specified, it is responsible for configuring the resources and returning
a string containing the corresponding QEMU arguments. This can be useful
for targets that rely on e.g.:
 * a temporary qcow2 image
 * a temporary directory
 * an unused TCP port used to bind the VNC server

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/fuzz/generic_fuzz.c         | 10 +++++++++-
 tests/qtest/fuzz/generic_fuzz_configs.h |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index deb74f15be..ee8c17a04c 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -933,12 +933,20 @@ static GString *generic_fuzz_cmdline(FuzzTarget *t)
 
 static GString *generic_fuzz_predefined_config_cmdline(FuzzTarget *t)
 {
+    gchar *args;
     const generic_fuzz_config *config;
     g_assert(t->opaque);
 
     config = t->opaque;
     setenv("QEMU_AVOID_DOUBLE_FETCH", "1", 1);
-    setenv("QEMU_FUZZ_ARGS", config->args, 1);
+    if (config->argfunc) {
+        args = config->argfunc();
+        setenv("QEMU_FUZZ_ARGS", args, 1);
+        g_free(args);
+    } else {
+        g_assert_nonnull(config->args);
+        setenv("QEMU_FUZZ_ARGS", config->args, 1);
+    }
     setenv("QEMU_FUZZ_OBJECTS", config->objects, 1);
     return generic_fuzz_cmdline(t);
 }
diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index aa4c03f1ae..51e69c6e42 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -16,6 +16,7 @@
 
 typedef struct generic_fuzz_config {
     const char *name, *args, *objects;
+    gchar* (*argfunc)(void); /* Result must be freeable by g_free() */
 } generic_fuzz_config;
 
 const generic_fuzz_config predefined_configs[] = {
-- 
2.28.0


