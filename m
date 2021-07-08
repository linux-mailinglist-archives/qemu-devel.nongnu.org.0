Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E97B3C18C1
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:58:44 +0200 (CEST)
Received: from localhost ([::1]:49722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1YIN-0008D3-9D
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1m1XUq-0001mh-CC
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:07:32 -0400
Received: from mail-dm6nam12hn2247.outbound.protection.outlook.com
 ([52.100.166.247]:2536 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1m1XUn-0008HS-51
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:07:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGT9IZZoYiH5MEaQPeBuR/sr51gj7vwXmTgH1UNIKAXIVOAIobfJHIulQqVN7RVv8c0u7uMOWadzBknwfU9IiqnJi5zBL1d7ue8bsOE+JMrKSgrhPZSUf+hgS75x5VSSgLT/QJYKVM1QXzYP2J6Dctm8BrvKxp29YETTB9NBhYlQJ2t9nf01kQ5GtZfCNh97o+6firX7JM45iwk2Of9Xe0A+UyOCKn3dMTeNWg6uJWL9Sgr7yNwn2Kp8QVxXM9JX5QXXYiwINYPXW9XAoUC75n+3c4sKAloN3CY2fCd++xLohvm8H2hmqlx7rWFcDtOrLUV+CzByYqm8B57py1wDZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUM2Vq+1rjrw9B3vO6BKMUUOWYciCe95Fuva42KYwSk=;
 b=XJpTfrQIPi/xwgDc2V6bsBF2/X81+sde8wLvt9V4NZC6sNKyqr0T645V/P9tpCtXpPXQuyNi3iimkTTPMOU3NgFP27wO02ALL2FFS12qQGJPyfE+UHwH7krTeD8m6c6mrQXn/3/Ys+WAHDfOkdVocAL+UMzNGNBMCAzkIWawxtErvOq0kC5REDSmL+zoGHS2EtCN/Z0wLfhaOHM2iC5QhXdsA0IB0204GYiTQQoZGzWQgBXXsREScnCoRYNM79brOBb8d0zUCDGcrDLflmwYpWNtGEQbfTxWyeoSnx2VDVokVWX3d/ErD/C3JoxHChaft9qzzPffQ1KIJXlTFEWaeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUM2Vq+1rjrw9B3vO6BKMUUOWYciCe95Fuva42KYwSk=;
 b=1/0t0RJur5aEsyE18qxs+ClSVeKOCiMND52k6PbJRabiewXnVAQ4iWu/9lCB/lEH2g0BXqxTokwi4uBLChkDpko16KaAu4TzD0yq7RobumGd6AF4ZhQ8Y8CKB8DRLBF7No9648ANmZpi2iaPRlg3FgoisEOfuOjJdMsHAh/5jmc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4131.namprd12.prod.outlook.com (2603:10b6:a03:212::13)
 by BY5PR12MB4968.namprd12.prod.outlook.com (2603:10b6:a03:1d2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Thu, 8 Jul
 2021 17:07:25 +0000
Received: from BY5PR12MB4131.namprd12.prod.outlook.com
 ([fe80::8459:b572:85e3:f2c6]) by BY5PR12MB4131.namprd12.prod.outlook.com
 ([fe80::8459:b572:85e3:f2c6%5]) with mapi id 15.20.4308.023; Thu, 8 Jul 2021
 17:07:25 +0000
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Cc: zhenwei pi <pizhenwei@bytedance.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH] target/i386: Fix cpuid level for AMD
Date: Thu,  8 Jul 2021 12:06:41 -0500
Message-Id: <20210708170641.49410-1-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708003623.18665-1-michael.roth@amd.com>
References: <20210708003623.18665-1-michael.roth@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN6PR16CA0062.namprd16.prod.outlook.com
 (2603:10b6:805:ca::39) To BY5PR12MB4131.namprd12.prod.outlook.com
 (2603:10b6:a03:212::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.77.1) by
 SN6PR16CA0062.namprd16.prod.outlook.com (2603:10b6:805:ca::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Thu, 8 Jul 2021 17:07:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aef4ec84-a535-4a20-9ca6-08d94232dbc5
X-MS-TrafficTypeDiagnostic: BY5PR12MB4968:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4968AACDF797CF8D1435F62295199@BY5PR12MB4968.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mpPRjO9l5/qpT6gEQdTVG8zO7mxd6GNr+zL/sOR2M5nY1RFTaAXgsYQfc64F?=
 =?us-ascii?Q?x6ggH7d4Kz+FS8OYtUUqmtPiaRgtATezgbRjA0o9jPCoyEjy014pdRaj+8H+?=
 =?us-ascii?Q?5+psp99ClzS6n+uqLm+oCnp1O82YZq2FiieEz/CdanMli2tOaDLZqCU5wvQo?=
 =?us-ascii?Q?3UGvBFnM4TRB1CAC9/9Y41YolVfNCcvCNiqG+q0b9Qy6AiBtz+Ns7Sq0q+q3?=
 =?us-ascii?Q?0FtZCzJlsjUEJwdojLKpnRddVX2Wz9XT/EIkK6tlgoBRDM18hgdk/dzmcQNu?=
 =?us-ascii?Q?Yekw1FTjurHUIaZALXekgp+/QjV9qQFwbkv+i00C2pi+QdXUJ+zswcsUCJEW?=
 =?us-ascii?Q?1O3QCVZALn7uDdOYweO+gIpc5RFP4l3dViquDSn4AnoaA9i5NXj0xPZ1O2X/?=
 =?us-ascii?Q?psr+GJxE6sSVhYcEy2MKPZuj/hhuLp8a24IB4WfZ1XT7mOe0PZpPgpKar7tV?=
 =?us-ascii?Q?/bVS6xCCCWRn+mXmNqiR/qCqKsRvU07b6ZukRlmii2kio3czlYowViCUpVlu?=
 =?us-ascii?Q?ChAnZjQ0AhhQ+0pYpXKouFLnBtRB0mtokL0BHJUIsYI9ipy5c6u3CBL7Z558?=
 =?us-ascii?Q?hqAGmWXjJNe6AHT1zcva/2LO06NDIJbDyhbN3HA2XW57dPrwCFgTJWzGJw4r?=
 =?us-ascii?Q?V4R61vjG9iP28nFmIq7l5kqcCciEB7ZhzKaF2aYaMZIZmz7UDqrHiK/HyrTl?=
 =?us-ascii?Q?N9iXxaDrTSs5jO0e7V7mw0bS4hF7a12G5Y3Z+4g/eeB0XVE/Q8btOLkCOp3Q?=
 =?us-ascii?Q?jfu4QAjfTsNeELNy20Yy/DW1iLneD0bdZmsJuQLbiOaM8zuLZNjD1cVldkAU?=
 =?us-ascii?Q?9mqayTkBj0sug6n5GTLc9z+b+ZzppF9HYsL0JtzL4ZEpSVJSBgD1v2C2mdxf?=
 =?us-ascii?Q?7PRYCfsnHLMiBPusselJxRJqa80bCzNzJpf328CmkkxTZScN6oqCEj6BbQds?=
 =?us-ascii?Q?saWxrSiC6iQNgXwI/LNgQ38QSip0sjTbCnaG4I/z34FZcbBN19L6Arw1ewwv?=
 =?us-ascii?Q?S8SKXiARYzDMO83wEooNBJio1cSB1zT58IO+DWm7YGD0sJ8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:BY5PR12MB4131.namprd12.prod.outlook.com; PTR:; CAT:OSPM;
 SFS:(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(83380400001)(6916009)(26005)(2616005)(316002)(8676002)(54906003)(956004)(44832011)(36756003)(38100700002)(38350700002)(478600001)(186003)(6666004)(6486002)(86362001)(8936002)(52116002)(5660300002)(4326008)(66556008)(6496006)(66946007)(1076003)(66476007)(2906002)(23200700001);
 DIR:OUT; SFP:1501; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4zl0YzdpFmUffOONUvobywtpRrZPnflYrs1X5Rko1wiUUAB9oJ2CTDQQJ6OD?=
 =?us-ascii?Q?pTjsYmDCZFqbvCLfPzuynk27dk8DrjzThAThZqdFIJ3e/6LFdwKdGvWNH0Nb?=
 =?us-ascii?Q?CRo6PkdE9JQWNG6Sxj2M6HmHwwsbuLoWyJNoeelW70R3f47Qut54mynvFyKL?=
 =?us-ascii?Q?1rj6hgWcBdxf5kxihQalaZnP7aAQIQzeSFEm2P7ta9oCI57OIMP0s3DkOtOn?=
 =?us-ascii?Q?lvCjYG113XnpmFz6g0SrRQqaeFn1ep/+VCtKZJPh/jkC2AP15LkYIoiG+Vkr?=
 =?us-ascii?Q?noJUPWMeOoKYM0pRNx7eijXIg0pu8KwZZ6RNzEmVSHq7kADVim81S3d+iyfr?=
 =?us-ascii?Q?NklkFe+0ClcndahwgNXvAT6i7Yzyyv8ptQxMa4O70OL4YAFL3U3uFQytsFKi?=
 =?us-ascii?Q?RoHpRAp4dUaAFTvGAZF+1Wg9pmmtINp+uost6Ow8Ew1wSIgk/tvD64pdRtIN?=
 =?us-ascii?Q?rUwJdWr44h8dCPscDxzVPhkc6/383X3jYYLjzARznk3LmfIIdF/K0VMD5FS/?=
 =?us-ascii?Q?gRdgVhs5t3gXF7KtTqKPyrn1kZLy8hJQ7lcBoMmFTNapKwmL805rlU/Aqu6N?=
 =?us-ascii?Q?vvkpWUVpINObe9nj9TwwArU4nhxs/vZzsGgpefyOuLYKBk71cMIboiUWArYN?=
 =?us-ascii?Q?xribvi7dnmsW5XCckrX6lTP3vS5WjC24fEenZiIllNbt2BkQD12VoTKG8t3G?=
 =?us-ascii?Q?WGk03VNOT2VcyL/9c9XcC6eJkok5XZh1Vbsm8eQHqHXTY1/Tjc0fFf9DdYWr?=
 =?us-ascii?Q?s9BE/z60IpvWne6o9CtcaGUZmieqD7xNo0bY0EJO/htcpAvZ4zaIVxzhDdks?=
 =?us-ascii?Q?seMMKa4Rs2q5/AlHq/IsPP85kocsng/Q6eKrvjSgAhM1MB680HullXBiT3Vb?=
 =?us-ascii?Q?ZYe3QNGX8TW9qgLgJBrff+qrZ6qJHN1iwNX9fmE6mM3Or/cHPH8d/b5UIMda?=
 =?us-ascii?Q?0jreacx/IFgrJtTXYdsXHMkQF/fe/WjaJ4F2VMF5ULNG/WjYMIu0Na/qvFjn?=
 =?us-ascii?Q?Hvq3fdbsaJZYVridpDz87RrYXgMny05y71DG6FK+dowfZMkXYD2e3mM0BaB7?=
 =?us-ascii?Q?6ZYwV3TxI+9V7PnqAVpYYyqWlz6YnDr9TyGxSSWyfToilAVO4Psc66HDePAo?=
 =?us-ascii?Q?n1cp+gaD8Ivc5UBiJ51k3370t2zDS5lpMXE8sxxQq4omzL1G1enzOjRub700?=
 =?us-ascii?Q?URzl6qaL4X/hHxUK1VCf6JWQWpQLNuTxoxgM+WxR/D6QHb7l8X5CB2pwrqDc?=
 =?us-ascii?Q?RbNWuPoXeP4FFrIMLCAiLHdS+JMU5RVclpiEGT1w1D5Iqc7Mg6NhEOheK5ww?=
 =?us-ascii?Q?R1qwmvHIzh8CnOpnKU0P97hg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aef4ec84-a535-4a20-9ca6-08d94232dbc5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4131.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 17:07:25.4785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rjqxcLAwYll8xx3xeOLWeyUDFiPubXr3shjoNxWi4i3UfZ6AfdYCsHv/TDVrs3vxE0fRXXFi2BAdYzuTWjSh8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4968
Received-SPF: softfail client-ip=52.100.166.247;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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

From: zhenwei pi <pizhenwei@bytedance.com>

A AMD server typically has cpuid level 0x10(test on Rome/Milan), it
should not be changed to 0x1f in multi-dies case.

Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: zhenwei pi <pizhenwei@bytedance.com>
Fixes: a94e1428991 (target/i386: Add CPUID.1F generation support for multi-dies PCMachine)
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
* to maintain compatibility with older machine types, only implement
  this change when the CPU's "x-vendor-cpuid-only" property is false
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 target/i386/cpu.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 0b6c921e5a..289dd2b1d8 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5950,8 +5950,15 @@ void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
             }
         }
 
-        /* CPU topology with multi-dies support requires CPUID[0x1F] */
-        if (env->nr_dies > 1) {
+        /*
+         * Intel CPU topology with multi-dies support requires CPUID[0x1F].
+         * For AMD Rome/Milan, cpuid level is 0x10, and guest OS should detect
+         * extended toplogy by leaf 0xB. Only adjust it for Intel CPU, unless
+         * cpu->vendor_cpuid_only has been unset for compatibility with older
+         * machine types.
+         */
+        if ((env->nr_dies > 1) &&
+            (IS_INTEL_CPU(env) || !cpu->vendor_cpuid_only)) {
             x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x1F);
         }
 
-- 
2.25.1


