Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7F63497B1
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 18:16:56 +0100 (CET)
Received: from localhost ([::1]:56222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPTbL-0004s3-Sb
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 13:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Valeriy.Vdovin@virtuozzo.com>)
 id 1lPTXF-0002Y7-Ho
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:12:41 -0400
Received: from mail-eopbgr70122.outbound.protection.outlook.com
 ([40.107.7.122]:42661 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Valeriy.Vdovin@virtuozzo.com>)
 id 1lPTX9-0001ZP-Vy
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:12:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWxx8gTOqtc75Es286EAH3Hty2Hz+Toopa9HTeXva9dQlgLo6BcpFR6HHZJDnlosFVXTxQvfGM1qng12ak42CTWSbpfMlFBQA9TtTx8LpMbAaz7HS4qdXSPeOsFXbFkA0dcaeRGN99u02ER7YQzDPr+XZzvfJOARq/tRL/cBavkceVYhB94EL7W+OjC0/e3nVvSN4qOWHKd3IVVyD1Q0tC8574P4J7bvLPtgmjg+YE9+F51Aw1iY+Go/t6v+jnh+rvuXN+H8iFYSmS0nZl7i9H63L07LFydSgsaQzelG0HrzxA857kJCSFDkVFrFxTXS9n2xepzTwqFqM6nqGK6AfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcWHLnmD96F9HGGjb9iu0HrX7bU+GtTEkmJJBlGeq9Y=;
 b=dIo+zML1AHBSSKtugiXiEIQMGWmJOgOLev+9xPbtmKulOIbFvZXka5V1kgypInXI8PFn2I7lWIkUaAsqah2UwJTM7DJeBfdUmh8/62AGe8YdEDHRCcgNFvQnAah6XLjEHRCqheRmCKxArI9+OxHk088VDaaSVuHxIOT4UQ9+kwdQsVMxRH+qeZkpPnaF/BeUHlAXMaKZLV/kYcYOszCCT/e6ku5xU1Jw5gVmTSp6CXmruUTVi007mwRqTV0g2pAsit5u4qjxqQOYs5NC1yUSa56q5OgJM/NET5xuO6FHrAEYyC2lSf5DMBbg5ui37okFz28U/N3HcB5r+n097ckvzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcWHLnmD96F9HGGjb9iu0HrX7bU+GtTEkmJJBlGeq9Y=;
 b=Lg1KSj57yGkLyrnRt80uNdyGS/oc2pFwjfkpC+Rts0Ugwo19jWBW4AIAfAYdor0wbxxMu+FHuOMKj/jQ/do0kZjgBWzNkh+V7Pld5AHOvRRb6XgKfzQF5sR7EsQekgNk3vERg0cFB8c3aLPwozZMHAF7DPpA8GWNGEveyUBR2Bw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB5988.eurprd08.prod.outlook.com (2603:10a6:20b:283::19)
 by AM0PR08MB3748.eurprd08.prod.outlook.com (2603:10a6:208:fb::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Thu, 25 Mar
 2021 16:57:22 +0000
Received: from AM9PR08MB5988.eurprd08.prod.outlook.com
 ([fe80::557:7687:5016:7c97]) by AM9PR08MB5988.eurprd08.prod.outlook.com
 ([fe80::557:7687:5016:7c97%7]) with mapi id 15.20.3977.025; Thu, 25 Mar 2021
 16:57:22 +0000
From: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Denis Lunev <den@openvz.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>
Subject: [PATCH v2] qapi: introduce 'query-cpu-model-cpuid' action
Date: Thu, 25 Mar 2021 19:57:05 +0300
Message-Id: <20210325165705.2342-1-valeriy.vdovin@virtuozzo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [176.106.247.78]
X-ClientProxiedBy: AM6PR0502CA0071.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::48) To AM9PR08MB5988.eurprd08.prod.outlook.com
 (2603:10a6:20b:283::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (176.106.247.78) by
 AM6PR0502CA0071.eurprd05.prod.outlook.com (2603:10a6:20b:56::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend
 Transport; Thu, 25 Mar 2021 16:57:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91fa0813-6f9e-4816-3c57-08d8efaf0e87
X-MS-TrafficTypeDiagnostic: AM0PR08MB3748:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB37484CA162F172E8DC1A2B5387629@AM0PR08MB3748.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Jn4gr8tpPhdv2FvJ71s7n1RuYmGj3KGQtsB6tzLgmdNHaA/65eQ1A8hCZowFGVD4/9TRBCQQczebFh+dDlg/Nb2XGzZHgpySckqI2OymPnDzxUm2TLexart13yMq2ebEbcT+11S+At4s5goGIbiRzKOtvoFxD2NoYm9kYjnNIyhc71nolOc6sysiBprFB4qAkqvnn4swyyOnPuWgmCVASJnCJgGQzY/ZgHwH0WI1cbWN5cEQMrVBeyRA73hPov5Cbv4b39hDRUROzymZfsG2/gMgusU+8f6fK4htUWRy16Vb4J6zNvad/afNGu7frHqg7O3Gzg49p7QjSrQ8nJ/7iHRX7jgfIii3Xgv9q3z6oOJwAYHF3/dPuz2MZrlniOBuYq7MY+grsPKDnVfKs4Yz5bF0sf+cOo6Vmatzs8b72EZ9ANO9yef87mbHJAkXc1X19xiV5xMM+XymxtkPWo89DIbnQZiacS6t3lqSCBzr6USccvsAgmYHjS3vJKfccR3RSlmoOiGIZcPgU3dT0S/Kzvd/vSdun68ULLb9jsshnx9yUzLyLejXAlyAKhyNpMXjDT81PHltfrFZxf+AWWU1kHPlRMpyOdzfGuKspdrq3qyHyCLNCoR0+ik6Y9pJNM1R4TlRnlSUpBg6ctbz7vcglKloxkLLSwnlavGAcHBc04PZ5kjzDEZK1oIz/eGanGJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB5988.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39840400004)(376002)(366004)(346002)(2616005)(5660300002)(30864003)(956004)(6916009)(54906003)(26005)(36756003)(83380400001)(16526019)(4326008)(478600001)(69590400012)(316002)(8676002)(6506007)(8936002)(86362001)(6512007)(44832011)(186003)(1076003)(66556008)(66946007)(66476007)(52116002)(107886003)(38100700001)(2906002)(6666004)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?BQJmrLsvlopnapvJWmjpSqDY8YTsp8I/25KbV5HpS8wd7BmWVLwcrW01chzO?=
 =?us-ascii?Q?KPJipKCWFpDt7+7My3OLShih53c7AsQsNiRNOSfJXMeI5ts2XKtGdDrCWE/n?=
 =?us-ascii?Q?2APCExEz9QAG3apfBnM/oBSeNkxGGcx724BklZJoNszqBWFP6xZ34CKuureV?=
 =?us-ascii?Q?t6Zl60AthtRgRHmO4wGYk1Z4NwEM6kdvPq4U9xv5sJSrO+BhJf3s13+4NFEx?=
 =?us-ascii?Q?QBQKXcO3I/cD3OMIRQYDlQQ+aJLZ0931CQB/erVUnlDUq3itDTWMR65vGXNN?=
 =?us-ascii?Q?j443PL2hPzHtQvdxEOw3dMGcXd3u80JB2aTd/2CVBemc4oFR8uQm64I9kMVm?=
 =?us-ascii?Q?Nb2L08hHa1iuySLtkNcuIzq6w8+OVNz39da3ELy6iY6XRUm6PvATCN8OEv20?=
 =?us-ascii?Q?Kc8+ciigSWP5hEIjTGJ09Wvuc3ZkojAYIJNaqOL2wqSKM+ytA7Abdv++MvYm?=
 =?us-ascii?Q?Q5Ds5tIts/stBPmiuskMKfKlNmvzdpO91Pj9qVRZiJLA+av64Xuf959gc+jS?=
 =?us-ascii?Q?rt0VzX1hj2/HY2Rw1qXWnpiwrB/cERlIHx7FfPSE/xhr7w4LPMb9nnR0wtj7?=
 =?us-ascii?Q?MlA1ZqX11veLvS079qqDmIEBrSm6rCPV6TQ4fFMPdEpL/F35d2rNo4E72SQ3?=
 =?us-ascii?Q?/5wjQaROGzz9VP70U5Oa8yJ293NvzxPO2touj1pXAOCI921oXSU8PQBUi8Mn?=
 =?us-ascii?Q?6LRF+fXDz8N+CNtHqsNaPmV4PXk7TCgBHpfrfBEF4yNVa8fk1soZOhvK7niP?=
 =?us-ascii?Q?+kmgLsD/xZmXH/jEVmR1mSAxxAEC7j86ifM0sBfrh6ouG75jDjSBqehdB1y4?=
 =?us-ascii?Q?aQzJLv1LVboVpkgELAyE2ZLaviTw1NU09RoRTIOIVeapxnngTox1JyrdjMzW?=
 =?us-ascii?Q?yKBRFSXmARwghZnfPsaaiH91XkAeIjsLC4DYWuA4PW1r7bzaH/gMIzQyU8qY?=
 =?us-ascii?Q?k69HAmOb6acNNWyseoCG2Od4KYtYhH+2ATiNfaA4XJE6+CAUlxy9IVwrCSBc?=
 =?us-ascii?Q?h1YdXQs+eUG0NARdFVhRwke493ZeT6PRwf3BxorKpxlAvqrDd8+TbTC42rt3?=
 =?us-ascii?Q?makS61IAD6jWVba9Giik4DcM7LHjG20RdDfV6EPJP81AKZfzBBJW9L3amPbJ?=
 =?us-ascii?Q?hzDBSKMSgo7i9Uzu1ffVWmiVbqyBfF4Y0Y0KKgxsRvG/s3DIb/+PBquuNnsN?=
 =?us-ascii?Q?QLNS5riHhHOow7su3a2fbw/H8lXHjJe3io4Q8xVRYFJUnUiCry+QRCDbAqZX?=
 =?us-ascii?Q?GlGf1LUOLu2pSaTN0wSQjceR1tueIgucx9jnFsXaA57PiVDz8mU2VSK7FhGd?=
 =?us-ascii?Q?cpYTpRsukKJ5bzIdhyquAHvG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91fa0813-6f9e-4816-3c57-08d8efaf0e87
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB5988.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 16:57:22.1654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9YbBOreKc5ZQOz90m3qio6wDJUPs7937zhfOBPNh/0jRByzPBzH72LfHjX3H4D6JNfOTrQ1pRmjVtecgrnUM6vNRj+kxiakTRSCWtayMSfo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3748
Received-SPF: pass client-ip=40.107.7.122;
 envelope-from=Valeriy.Vdovin@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Introducing new qapi method 'query-cpu-model-cpuid'. This method can be used to
get virtualized cpu model info generated by QEMU during VM initialization in
the form of cpuid representation.

Diving into more details about virtual cpu generation: QEMU first parses '-cpu'
command line option. From there it takes the name of the model as the basis for
feature set of the new virtual cpu. After that it uses trailing '-cpu' options,
that state if additional cpu features should be present on the virtual cpu or
excluded from it (tokens '+'/'-' or '=on'/'=off').
After that QEMU checks if the host's cpu can actually support the derived
feature set and applies host limitations to it.
After this initialization procedure, virtual cpu has it's model and
vendor names, and a working feature set and is ready for identification
instructions such as CPUID.

Currently full output for this method is only supported for x86 cpus.

To learn exactly how virtual cpu is presented to the guest machine via CPUID
instruction, new qapi method can be used. By calling 'query-cpu-model-cpuid'
method, one can get a full listing of all CPUID leafs with subleafs which are
supported by the initialized virtual cpu.

Other than debug, the method is useful in cases when we would like to
utilize QEMU's virtual cpu initialization routines and put the retrieved
values into kernel CPUID overriding mechanics for more precise control
over how various processes perceive its underlying hardware with
container processes as a good example.

Output format:
The core part of the returned JSON object can be described as a list of lists
with top level list contains leaf-level elements and the bottom level
containing subleafs, where 'leaf' is CPUID argument passed in EAX register and
'subleaf' is a value passed to CPUID in ECX register for some specific
leafs, that support that. Each most basic CPUID result is passed in a
maximum of 4 registers EAX, EBX, ECX and EDX, with most leafs not utilizing
all 4 registers at once.
Also note that 'subleaf' is a kind of extension, used by only a couple of
leafs, while most of the leafs don't have this. Nevertheless, the output
data structure presents ALL leafs as having at least a single 'subleaf'.
This is done for data structure uniformity, so that it could be
processed in a more straightforward manner, in this case no one suffers
from such simplification.

Use example:
virsh qemu-monitor-command VM --pretty '{ "execute": "query-cpu-model-cpuid" }'
{
  "return": {
    "cpuid": {
      "leafs": [
        {
          "leaf": 0,
          "subleafs": [
            {
              "eax": 13,
              "edx": 1231384169,
              "ecx": 1818588270,
              "ebx": 1970169159,
              "subleaf": 0
            }
          ]
        },
        {
          "leaf": 1,
          "subleafs": [
            {
              "eax": 329443,
              "edx": 529267711,
              "ecx": 4160369187,
              "ebx": 133120,
              "subleaf": 0
            }
          ]
        },
        {
          "leaf": 2,
          "subleafs": [
            {
              "eax": 1,
              "edx": 2895997,
              "ecx": 0,
              "ebx": 0,
              "subleaf": 0
            }
          ]
        },
      ]
    },
    "vendor": "GenuineIntel",
    "class-name": "Skylake-Client-IBRS-x86_64-cpu",
    "model-id": "Intel Core Processor (Skylake, IBRS)"
  },
  "id": "libvirt-40"
}

Signed-off-by: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>
---
v2: - Removed leaf/subleaf iterators.
    - Modified cpu_x86_cpuid to return false in cases when count is
      greater than supported subleaves.

 qapi/machine-target.json | 122 +++++++++++++++++++++++
 target/i386/cpu.h        |   2 +-
 target/i386/cpu.c        | 209 +++++++++++++++++++++++++++++++++++----
 3 files changed, 315 insertions(+), 18 deletions(-)

diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index e7811654b7..c5b137aa5c 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -329,3 +329,125 @@
 ##
 { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
   'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
+##
+
+
+# @CpuidSubleaf:
+#
+# CPUID leaf extension information, based on ECX value.
+#
+# CPUID x86 instruction has 'leaf' argument passed in EAX register. Leaf
+# argument identifies the type of information, the caller wants to retrieve in
+# single call to CPUID.
+# Some but not all leaves depend on the value passed in ECX register as an
+# additional argument to CPUID. This argument is present in cpuid documentation
+# as 'subleaf'.
+# If CPUID ignores the value in ECX, normally this means that leaf does not
+# have subleaves. Another way to see it is that each leaf has at least one
+# subleaf (one type of output).
+#
+# @subleaf: value passed to CPUID in ECX register. If CPUID leaf has only a
+#           single leaf, the value of ECX is ignored by CPU and should as well
+#           be ignored in this field.
+# @eax: value in eax after CPUID instruction
+# @ebx: value in ebx after CPUID instruction
+# @ecx: value in ecx after CPUID instruction
+# @edx: value in edx after CPUID instruction
+#
+# Since: 6.1
+##
+{ 'struct': 'CpuidSubleaf',
+  'data': { 'subleaf' : 'int',
+            'eax': 'int',
+            'ebx': 'int',
+            'ecx': 'int',
+            'edx': 'int'
+          }
+}
+
+##
+# @CpuidLeaf:
+#
+# A single CPUID leaf.
+#
+# CPUID instruction accepts 'leaf' argument passed in EAX register.
+# A 'leaf' is a single group of information about the CPU, that is returned
+# to the caller in EAX, EBX, ECX and EDX registers. A few of the leaves will
+# also have 'subleaves', the group of information would partially depend on the
+# value passed in the ECX register. If the leaf has subleaves, it will
+# only have more than one item in 'subleaves' array. If the leaf has no
+# subleaves, only one item will be present in the 'subleaves' list.
+#
+# @leaf: CPUID leaf or the value of EAX prior to CPUID execution.
+# @subleaves: array of subleaves.
+#
+# Since: 6.1
+##
+{ 'struct': 'CpuidLeaf',
+  'data': { 'leaf' : 'int',
+            'subleaves' : [ 'CpuidSubleaf' ] } }
+
+##
+# @CpuModelCpuid:
+#
+# Virtual CPU model.
+#
+# A CPU model consists of the name of a CPU definition, to which
+# delta changes are applied (e.g. features added/removed). Most magic values
+# that an architecture might require should be hidden behind the name.
+# However, if required, architectures can expose relevant properties.
+#
+# @leaves: array of all available cpuid leaves
+#
+# Since: 6.1
+##
+{ 'struct': 'CpuModelCpuid',
+  'data': {  'leaves' : [ 'CpuidLeaf' ] }
+}
+
+##
+# @CpuModelCpuidDescription:
+#
+# Virtual CPU model.
+#
+# This describes information generated by QEMU and used by it to respond CPUID
+# requests from guest along with some general information about the cpu model,
+# that might be useful for the caller of qapi requests.
+#
+# @class-name: class name of the CPU model in qemu object model
+# @model-id: CPU model name string that will be passed in CPUID, EAX=0
+# @vendor: CPU vendor name string that will be passed in CPUID, EAX=0
+# @cpuid: Full tree of CPUID leaves, that is generated by QEMU at virtual cpu
+#         initialization step by parsing "-cpu " option and creating the virtual cpu
+#         model. CpuModelCpuidDescription can be examined to predict QEMU's response to
+#         CPUID instructions from the guest.
+#
+# Since: 6.1
+##
+{ 'struct': 'CpuModelCpuidDescription',
+  'data': {  'class-name': 'str',
+             'model-id': 'str',
+             'vendor' : 'str',
+             'cpuid' : 'CpuModelCpuid'
+          }
+}
+
+##
+# @query-cpu-model-cpuid:
+#
+# Returns description of a virtual CPU model, created by QEMU after cpu
+# initialization routines. The resulting information is a reflection of a parsed
+# '-cpu' command line option, filtered by available host cpu features.
+#
+# Returns:  @CpuModelCpuidDescription
+#
+# Example:
+#
+# -> { "execute": "query-cpu-model-cpuid" }
+# <- { "return": 'CpuModelCpuidDescription' }
+#
+# Since: 6.1
+##
+{ 'command': 'query-cpu-model-cpuid',
+  'returns': 'CpuModelCpuidDescription',
+  'if': 'defined(TARGET_I386)' }
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 570f916878..19c1dfea60 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1926,7 +1926,7 @@ int cpu_x86_signal_handler(int host_signum, void *pinfo,
                            void *puc);
 
 /* cpu.c */
-void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
+bool cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
                    uint32_t *eax, uint32_t *ebx,
                    uint32_t *ecx, uint32_t *edx);
 void cpu_clear_apic_feature(CPUX86State *env);
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6b3e9467f1..9f3bc7d448 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5148,6 +5148,161 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
     return cpu_list;
 }
 
+/*
+ * struct cpuid_leaf_range - helper struct that describes valid range of
+ * cpuid leaves as returned by CPUID in response to EAX=0 or EAX=0x80000000,
+ * etc.
+ *
+ * The purpose of this struct is to deal with a sparse nature of leaf value
+ * space. Ther CPUID logic of returning the maximum leaf is not straightforward
+ * and requires inner knowledge of what cpuid extensions are available on a
+ * specific cpu. Also this logic is designed to be expandable across many years
+ * ahead. QEMU code would have to be updated as well. That's why there should
+ * be only one point where all cpuid leaf ranges logic will be modified.
+ *
+ * In practice this will be used to detect if any arbitrary cpuid leaf value
+ * is valid for a specific cpu model. For that one will call
+ * 'cpuid_get_cpuid_leaf_ranges' to get all valid ranges for a provided cpu
+ * model and then call 'cpu_leaf_in_range' to find out which of the ranges
+ * contains the leaf in question.
+ */
+#define CPUID_MAX_LEAF_RANGES 4
+
+struct cpuid_leaf_range {
+    uint32_t min;
+    uint32_t max;
+};
+
+struct cpuid_leaf_ranges {
+    struct cpuid_leaf_range ranges[CPUID_MAX_LEAF_RANGES];
+    int count;
+};
+
+static void cpuid_get_cpuid_leaf_ranges(CPUX86State *env,
+                                        struct cpuid_leaf_ranges *r)
+{
+    struct cpuid_leaf_range *rng;
+
+    r->count = 0;
+    rng = &r->ranges[r->count++];
+    rng->min = 0x00000000;
+    rng->max = env->cpuid_level;
+
+    rng = &r->ranges[r->count++];
+    rng->min = 0x40000000;
+    rng->max = 0x40000001;
+
+    if (env->cpuid_xlevel) {
+        rng = &r->ranges[r->count++];
+        rng->min = 0x80000000;
+        rng->max = env->cpuid_xlevel;
+    }
+
+    if (env->cpuid_xlevel2) {
+        rng = &r->ranges[r->count++];
+        rng->min = 0xC0000000;
+        rng->max = env->cpuid_xlevel2;
+    }
+}
+
+static inline bool cpuid_leaf_in_range(uint32_t leaf,
+                                       struct cpuid_leaf_range *r)
+{
+    return leaf >= r->min && leaf <= r->max;
+}
+
+static uint32_t cpuid_limit_from_leaf(CPUX86State *env, uint32_t leaf)
+{
+    struct cpuid_leaf_ranges ranges;
+    struct cpuid_leaf_range *current_range, *end_range;
+
+    cpuid_get_cpuid_leaf_ranges(env, &ranges);
+    current_range = &ranges.ranges[0];
+    end_range = current_range + ranges.count;
+    while (current_range != end_range) {
+        if (cpuid_leaf_in_range(leaf, current_range)) {
+            break;
+        }
+        current_range++;
+    }
+    if (current_range != end_range) {
+        return current_range->max;
+    }
+    return 0;
+}
+
+static void cpu_model_fill_cpuid(Object *cpu, CpuModelCpuidDescription *info,
+                                 Error **errp)
+{
+    struct cpuid_leaf_ranges ranges;
+    struct cpuid_leaf_range *range;
+    uint32_t eax, ebx, ecx, edx;
+    CpuidLeaf *leaf;
+    CpuidLeafList **leaf_tail;
+    CpuidSubleaf *subleaf;
+    CpuidSubleafList **subleaf_tail;
+    X86CPU *x86_cpu = X86_CPU(cpu);
+
+    int range_idx;
+    int leaf_idx, subleaf_idx;
+
+    info->cpuid = g_malloc0(sizeof(*info->cpuid));
+    leaf_tail = &info->cpuid->leaves;
+    info->model_id = object_property_get_str(cpu, "model-id", errp);
+    info->vendor = object_property_get_str(cpu, "vendor", errp);
+
+    cpuid_get_cpuid_leaf_ranges(&x86_cpu->env, &ranges);
+    for (range_idx = 0; range_idx < ranges.count; ++range_idx) {
+        range = &ranges.ranges[range_idx];
+        for (leaf_idx = range->min; leaf_idx <= range->max; ++leaf_idx) {
+            subleaf_idx = 0;
+            if (!cpu_x86_cpuid(&x86_cpu->env, leaf_idx, subleaf_idx, &eax, &ebx,
+                           &ecx, &edx)) {
+                continue;
+            }
+
+            leaf = g_malloc0(sizeof(*leaf));
+            leaf->leaf = leaf_idx;
+            subleaf_tail = &leaf->subleaves;
+            while (true) {
+                subleaf = g_malloc0(sizeof(*subleaf));
+                subleaf->subleaf = subleaf_idx;
+                subleaf->eax = eax;
+                subleaf->ebx = ebx;
+                subleaf->ecx = ecx;
+                subleaf->edx = edx;
+                QAPI_LIST_APPEND(subleaf_tail, subleaf);
+                subleaf_idx++;
+                if (!cpu_x86_cpuid(&x86_cpu->env, leaf_idx, subleaf_idx, &eax,
+                                   &ebx, &ecx, &edx)) {
+                    break;
+                }
+            }
+            QAPI_LIST_APPEND(leaf_tail, leaf);
+        }
+    }
+}
+
+CpuModelCpuidDescription *qmp_query_cpu_model_cpuid(Error **errp)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    const char *class_name;
+    CpuModelCpuidDescription *info;
+    SysEmuTarget target = qapi_enum_parse(&SysEmuTarget_lookup, TARGET_NAME,
+                                          -1, &error_abort);
+    Object *cpu = ms->possible_cpus->cpus[0].cpu;
+
+    class_name = object_class_get_name(object_get_class(cpu));
+    info = g_malloc0(sizeof(*info));
+    info->class_name = g_strdup(class_name);
+
+    if (target == SYS_EMU_TARGET_X86_64) {
+        cpu_model_fill_cpuid(cpu, info, errp);
+    }
+
+    return info;
+}
+
 static uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
                                                    bool migratable_only)
 {
@@ -5591,14 +5746,14 @@ void cpu_clear_apic_feature(CPUX86State *env)
 
 #endif /* !CONFIG_USER_ONLY */
 
-void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
+bool cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
                    uint32_t *eax, uint32_t *ebx,
                    uint32_t *ecx, uint32_t *edx)
 {
     X86CPU *cpu = env_archcpu(env);
     CPUState *cs = env_cpu(env);
     uint32_t die_offset;
-    uint32_t limit;
+    uint32_t limit, nr_subleaves = 1;
     uint32_t signature[3];
     X86CPUTopoInfo topo_info;
 
@@ -5607,15 +5762,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
     topo_info.threads_per_core = cs->nr_threads;
 
     /* Calculate & apply limits for different index ranges */
-    if (index >= 0xC0000000) {
-        limit = env->cpuid_xlevel2;
-    } else if (index >= 0x80000000) {
-        limit = env->cpuid_xlevel;
-    } else if (index >= 0x40000000) {
-        limit = 0x40000001;
-    } else {
-        limit = env->cpuid_level;
-    }
+    limit = cpuid_limit_from_leaf(env, index);
 
     if (index > limit) {
         /* Intel documentation states that invalid EAX input will
@@ -5675,8 +5822,18 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
             if ((*eax & 31) && cs->nr_cores > 1) {
                 *eax |= (cs->nr_cores - 1) << 26;
             }
+            if (*eax || *ebx || *ecx || *edx) {
+                /*
+                 * host_cpuid has returned some valid info, that means count
+                 * is a valid agrument. Now we need to return true at function
+                 * exit by altering nr_subleaves to pass the return condition.
+                 * This is special for leaf 4.
+                 */
+                nr_subleaves = count + 1;
+            }
         } else {
             *eax = 0;
+            nr_subleaves = 3;
             switch (count) {
             case 0: /* L1 dcache info */
                 encode_cache_cpuid4(env->cache_info_cpuid4.l1d_cache,
@@ -5724,6 +5881,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         break;
     case 7:
         /* Structured Extended Feature Flags Enumeration Leaf */
+
+        /*
+         * env->cpuid_level_func7 returns the maximum subleaf index, whereas
+         * nr_subleaves - is the count, that's why + 1.
+         */
+        nr_subleaves = env->cpuid_level_func7 + 1;
         if (count == 0) {
             /* Maximum ECX value for sub-leaves */
             *eax = env->cpuid_level_func7;
@@ -5777,12 +5940,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         /* Extended Topology Enumeration Leaf */
         if (!cpu->enable_cpuid_0xb) {
                 *eax = *ebx = *ecx = *edx = 0;
-                break;
+                return false;
         }
 
         *ecx = count & 0xff;
         *edx = cpu->apic_id;
-
+        nr_subleaves = 2;
         switch (count) {
         case 0:
             *eax = apicid_core_offset(&topo_info);
@@ -5812,6 +5975,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
 
         *ecx = count & 0xff;
         *edx = cpu->apic_id;
+        nr_subleaves = 3;
         switch (count) {
         case 0:
             *eax = apicid_core_offset(&topo_info);
@@ -5843,9 +6007,10 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         *ecx = 0;
         *edx = 0;
         if (!(env->features[FEAT_1_ECX] & CPUID_EXT_XSAVE)) {
-            break;
+            return false;
         }
 
+        nr_subleaves = ARRAY_SIZE(x86_ext_save_areas);
         if (count == 0) {
             *ecx = xsave_area_size(x86_cpu_xsave_components(cpu));
             *eax = env->features[FEAT_XSAVE_COMP_LO];
@@ -5876,9 +6041,10 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         *edx = 0;
         if (!(env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT) ||
             !kvm_enabled()) {
-            break;
+            return false;
         }
 
+        nr_subleaves = 2;
         if (count == 0) {
             *eax = INTEL_PT_MAX_SUBLEAF;
             *ebx = INTEL_PT_MINIMAL_EBX;
@@ -6031,6 +6197,13 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         *eax = 0;
         if (cpu->cache_info_passthrough) {
             host_cpuid(index, count, eax, ebx, ecx, edx);
+            /*
+             * Because we pass to the host we can only check how it fills
+             * output registers to check if count arg is valid.
+             */
+            if (!(*eax || *ebx || *ecx || *edx)) {
+                return false;
+            }
             break;
         }
         switch (count) {
@@ -6052,7 +6225,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
             break;
         default: /* end of info */
             *eax = *ebx = *ecx = *edx = 0;
-            break;
+            nr_subleaves = 3;
         }
         break;
     case 0x8000001E:
@@ -6063,6 +6236,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
             *ebx = 0;
             *ecx = 0;
             *edx = 0;
+            return false;
         }
         break;
     case 0xC0000000:
@@ -6101,8 +6275,9 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         *ebx = 0;
         *ecx = 0;
         *edx = 0;
-        break;
+        return false;
     }
+    return count < nr_subleaves ;
 }
 
 static void x86_cpu_reset(DeviceState *dev)
-- 
2.17.1


