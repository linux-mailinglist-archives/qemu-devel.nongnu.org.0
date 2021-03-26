Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D7A34ADD8
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 18:48:53 +0100 (CET)
Received: from localhost ([::1]:49660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPqZo-0006Sh-3C
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 13:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Valeriy.Vdovin@virtuozzo.com>)
 id 1lPqY8-0005GH-SG
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 13:47:08 -0400
Received: from mail-eopbgr80132.outbound.protection.outlook.com
 ([40.107.8.132]:3906 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Valeriy.Vdovin@virtuozzo.com>)
 id 1lPqXz-00033i-40
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 13:47:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WkRIHI5PgBvnDS3Eq31msTUNNorbIuOHVRk0J7mQod4r4r2/rq85d7z+/M1c/RiyIxvOuVpchCz6sFDN48bytdEmF9C+sPk7pQ7R/To1vL1MJ4AfCKjV9Bbmhj8Ihx5mPBLI75NCMw5ck269l4yl3Ytx+DRNu2Oi51Vc0+o5k4xMxH7l3XtHDVqR0kyfDBkZJ9xm9cKN8AzFMyI8DvaYq2kmswSH17bkHH2GllzcRf2RmwmdW/7pkWVNdaxZGJrVv2BiDLWdj5xoD04mHajoGeANZnLPB7wZcg+myZih8HjtrfTuE8KciR82+fyRz7xcNbJl2/1064PFJfJEMhNp6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKFvFuzToDmH2DXs41K6K9AmBhrqrUAeTFIKd/Hl5D0=;
 b=fNsVP43Q5eOJn84/SrG1zUYC/IFSybu3zSFQB4mcEXsihMDF1748oablHb5Q8UKZt72TpGUz8eAKtD0k8Lp5zSjq65sBO6mnlk5xGz3gUOoY9UfpBZwgVUhOKm7SSs38xyFzGOo83fsuSFRNQQ14J4hCNuF/9GmsEuUQPBkuaMcVR3wg3FLSIeMhUHcYruV1cu1f9AJelGedXrf1rgoKFIgaG4CgjJYQ0FRBMg3rbDYo4AqT3kajq+snrhpMxd3exA/q5lMvptRj1nUzF2kCGLsdtW7O40of9YmL7g1HFeTd6whxkyBz8M+mU4Uohfk8S5f2xK/uGrZfjLfOpyNqYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKFvFuzToDmH2DXs41K6K9AmBhrqrUAeTFIKd/Hl5D0=;
 b=A1c+dh7tszbou8XdTevKGrjTv+eN03ZWjN0Xs6fqUhS9Pgmre2TFtD51zwUuuIJ8amoDUI2x+np8C8bBQl6ItuVww7EhdkVwJaPhnLENphcjMnnqqyOEJbj7Tao0L8ZZ1bG+qoJy/ZnAG2OVPcG5l1Jfv89DLWHkIDhWiUH44Ok=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from PA4PR08MB5999.eurprd08.prod.outlook.com (2603:10a6:102:f2::17)
 by PAXPR08MB6590.eurprd08.prod.outlook.com (2603:10a6:102:152::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Fri, 26 Mar
 2021 17:31:51 +0000
Received: from PA4PR08MB5999.eurprd08.prod.outlook.com
 ([fe80::b47d:a1a6:cb8:7a05]) by PA4PR08MB5999.eurprd08.prod.outlook.com
 ([fe80::b47d:a1a6:cb8:7a05%7]) with mapi id 15.20.3977.030; Fri, 26 Mar 2021
 17:31:51 +0000
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
Subject: [PATCH v3] qapi: introduce 'query-cpu-model-cpuid' action
Date: Fri, 26 Mar 2021 20:30:00 +0300
Message-Id: <20210326173000.18750-1-valeriy.vdovin@virtuozzo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [176.106.247.78]
X-ClientProxiedBy: AS8PR04CA0076.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::21) To PA4PR08MB5999.eurprd08.prod.outlook.com
 (2603:10a6:102:f2::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (176.106.247.78) by
 AS8PR04CA0076.eurprd04.prod.outlook.com (2603:10a6:20b:313::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26 via Frontend
 Transport; Fri, 26 Mar 2021 17:31:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef4e9e6c-965b-4df0-fa7b-08d8f07d09fd
X-MS-TrafficTypeDiagnostic: PAXPR08MB6590:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PAXPR08MB6590498A5B13F125CBEDEF4187619@PAXPR08MB6590.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Aw9VyieY8lkjDTSfsKxdury+LQQiVHsoJ4zeLqx+0L0xkNuTPtC+G5S5r82TbpkugMo6SnYxpWbT4amsCkkDEn/PfVIlzdtVC8NfM0wgcLjLwGpCafsK8AGMlxhe+1ZrnGH5GjWvvlvZdIpq5alu18YGsSfv9JJWM7Rf7McfXg1G+ZeLiiVYE9H5z/4P9Xslo0Mskgsal5sM5qB4Ym3QB2ORWxCUcMSmiaPSx23lmLp9c4dOeJDnj0CrIinKrgoLdtZN4cR4plfKgsUwy+v039DtJzHJUEpqoBfsCMr4ME+eWzrXGVmMN4XmbHFa6Y32hFdWsrxx9B3huLfUGqLNTLwFWHZ+Y320H04oL/D1T0aMDhmsOi3nlOg12lYvWV5cyoUIqMRaJtqPrjOD9Jcy+y7rVW3/N0ZhRhI4jJrCNTYtj4MBT+4TGGUY4TjrglFLfCecwa/QujcKJgfIzt5Fk/1Y5qRR/sgkrqdRhV8ydiNNl6yisXk9RHqlv4xnHEr9vOyjCA0BS9/a+2h14jWYaJ4i/ekVFsS5oe5zOdK0/6adh3wYJI1z9WYsvRm9HQ9lDtX4aGZiDncqLV0wbqMLPkykWrESWpYras9qm2R5pdquhFwro6krnf+AqoFL/MrDvKk1YefR6HrV8EvDF72TDsYvnFX10ohRlmCsq/yVSFqP8icIhvC6vIZB6sVgWNKk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR08MB5999.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(376002)(136003)(346002)(396003)(8936002)(36756003)(66556008)(66476007)(66946007)(16526019)(6512007)(316002)(8676002)(69590400012)(26005)(186003)(5660300002)(1076003)(6666004)(2906002)(30864003)(38100700001)(52116002)(107886003)(6506007)(54906003)(44832011)(86362001)(4326008)(6916009)(2616005)(6486002)(478600001)(83380400001)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?84EtA/+Oo44WIAY4XxytOTSDTKULuxSaXZh/9S3BOwemzKxwkDKvqE0sNOxp?=
 =?us-ascii?Q?U6c0y6n0FTzt3QRhKj6nn9bK/fSqMgrfHyoe3p4onIEHDtJsxlABXuDwnyRk?=
 =?us-ascii?Q?IflWG10XJpXeJGrn0SMv/G47j7oC1a9WghzG9SyFYCEjuKmVgrUoqzZpKeV3?=
 =?us-ascii?Q?m7jzNx/WgB+kih6Y0EwMu+betO3uV4a8bGJmNt8IzlDf0J7JyXnhUOBNbtCg?=
 =?us-ascii?Q?mv3l6lglJEA/PRcd1jPFwSujHf2tFUbP7gV8MaXeqB7WtYU/JTBRUHV0Pxcj?=
 =?us-ascii?Q?O4U8ejA3XJ/wC7VFVxEfUlBG77Z9ein4QP1erSXTl3EOE2G/+i5uHiuEj+RW?=
 =?us-ascii?Q?eSxmbW9THTg0qklJ6Ta5UM/HKa4B1QTXckjBFzAFv0wEEWKp8o4N83sUtube?=
 =?us-ascii?Q?QQs4bECAD/jV5RtpRd8L76R+ugk8Hfw62gDBAM+AiTL/5lcvuAhP2smCtpmO?=
 =?us-ascii?Q?6z9pAofCnXjP/xyvdLWGjhCzz5OHRCYr1oLbkmePb9NszexDwDZVfHKv4jg0?=
 =?us-ascii?Q?+87263P0DpMUStBJ1WCk8K+uOoLdQeYS8Ks/z4d/mqXF2gi+y0W4QIS4StUi?=
 =?us-ascii?Q?KDn0Fw7YkNBAo58FBpXMXDSacGmi+NYrBc9vb4+kGhZZzT1Rej9S8l38hsMb?=
 =?us-ascii?Q?dnfc7PLPFMgVoJ6W9OGjwu/dlWdfZcIdtCygTusPADn13i2zbELWmqaiLq3X?=
 =?us-ascii?Q?wBBs/XoqP2F8F6RbSgYdHDeKuODzzyocE54p8cG8p2IYfzWVTM9/MSQwNe9H?=
 =?us-ascii?Q?Hibw2qYIl9qVAM2KH/kMtTrq/nQ/Vik6tj6Lal6ZRg4UuWkuhyxMUqHAuewH?=
 =?us-ascii?Q?HCB8kxU3RsK7mG722egVTI4Y8kgDHQsQe3/GyWPODywOeeEfV8PteC4R5iq3?=
 =?us-ascii?Q?1Uq86Fo8LPg+P0pT+ZToSnzNuCkXr3O5WG/M6AVFnhiQiG+meLmZ04fqHuFb?=
 =?us-ascii?Q?imZyJRzjNtHJskbqxFZokUqU0FemBgK/+z6+/BorAVvT8nN5N8afsRbGByx8?=
 =?us-ascii?Q?iBukZJTlKVnZNcwPLoy/psgp0tGT3r+zuI2yV6hgMjdvgstTpi5sHOQsa9/p?=
 =?us-ascii?Q?33DgMAg1HmgtR6ZRlNtZ6TF6tjgq1hqsXQKD+R/pqjmZVf4CuBy+IY+qXyLK?=
 =?us-ascii?Q?6YJuziQn1WmEmLqzU2wQ8kW1r8upRizvuTxTedMF8NBga/OhMojxDm/DvyZB?=
 =?us-ascii?Q?/QUeyBzNX+HL/wadpE8UQGj7lM0tR0c4Fj1gU6i8LUboHqVQyFHGiCLYRjNi?=
 =?us-ascii?Q?A0kDhdnfUiQlLyMgzt64gyHNpX+AJuDSjGOYSPziiatS0yGzs+Jd5Vxk1jgu?=
 =?us-ascii?Q?Wk0TZ2uRK7Em8hdtzD41I533?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4e9e6c-965b-4df0-fa7b-08d8f07d09fd
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB5999.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 17:31:50.7778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZYIALvveCRtd1pA6mSwKNhRpbJQ+wo1r2hlMPrkcH//bOXjPi+u7fKmdj1EVbvJTJoNynoYc6vlLPfkevpxY0JWz4qAFvJWXqzR+UZP+cs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6590
Received-SPF: pass client-ip=40.107.8.132;
 envelope-from=Valeriy.Vdovin@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
v3: - Fixed structure name coding style.
    - Added more comments
    - Ensured buildability for non-x86 targets.

 qapi/machine-target.json | 123 ++++++++++++++++++++++
 target/i386/cpu.h        |   2 +-
 target/i386/cpu.c        | 218 ++++++++++++++++++++++++++++++++++++---
 3 files changed, 325 insertions(+), 18 deletions(-)

diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index e7811654b7..6abbc1fb16 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -329,3 +329,126 @@
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
+            'subleaves' : [ 'CpuidSubleaf' ] },
+  'if': 'defined(TARGET_I386)' }
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
+  'data': {  'leaves' : [ 'CpuidLeaf' ] },
+  'if': 'defined(TARGET_I386)' }
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
+          },
+  'if': 'defined(TARGET_I386)' }
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
index 6b3e9467f1..a407978055 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5148,6 +5148,153 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
     return cpu_list;
 }
 
+/*
+ * struct CpuidLeafRange - helper struct that describes valid range of
+ * cpuid leaves as returned by CPUID in response to EAX=0 or EAX=0x80000000,
+ * etc.
+ *
+ * The purpose of this struct is to deal with a sparse nature of leaf value
+ * space. The CPUID logic of returning the maximum leaf is not straightforward
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
+typedef struct CpuidLeafRange {
+    uint32_t min;
+    uint32_t max;
+} CpuidLeafRange;
+
+typedef struct CpuidLeafRanges {
+    struct CpuidLeafRange ranges[CPUID_MAX_LEAF_RANGES];
+    int count;
+} CpuidLeafRanges;
+
+static void cpuid_get_cpuid_leaf_ranges(CPUX86State *env,
+                                        struct CpuidLeafRanges *r)
+{
+    struct CpuidLeafRange *rng;
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
+                                       struct CpuidLeafRange *r)
+{
+    return leaf >= r->min && leaf <= r->max;
+}
+
+static uint32_t cpuid_limit_from_leaf(CPUX86State *env, uint32_t leaf)
+{
+    CpuidLeafRanges ranges;
+    int i;
+
+    cpuid_get_cpuid_leaf_ranges(env, &ranges);
+    for (i = 0; i < ranges.count; ++i) {
+        if (cpuid_leaf_in_range(leaf, &ranges.ranges[i])) {
+            return ranges.ranges[i].max;
+        }
+    }
+    return 0;
+}
+
+static void cpu_model_fill_cpuid(Object *cpu, CpuModelCpuidDescription *info,
+                                 Error **errp)
+{
+    CpuidLeafRanges ranges;
+    CpuidLeafRange *range;
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
+    info->model_id = g_strdup(object_property_get_str(cpu, "model-id", errp));
+    info->vendor = g_strdup(object_property_get_str(cpu, "vendor", errp));
+
+    cpuid_get_cpuid_leaf_ranges(&x86_cpu->env, &ranges);
+    for (range_idx = 0; range_idx < ranges.count; ++range_idx) {
+        range = &ranges.ranges[range_idx];
+        for (leaf_idx = range->min; leaf_idx <= range->max; ++leaf_idx) {
+            subleaf_idx = 0;
+            if (!cpu_x86_cpuid(&x86_cpu->env, leaf_idx, subleaf_idx, &eax, &ebx,
+                               &ecx, &edx)) {
+                continue;
+            }
+
+            leaf = g_malloc0(sizeof(*leaf));
+            leaf->leaf = leaf_idx;
+            subleaf_tail = &leaf->subleaves;
+            do {
+                subleaf = g_malloc0(sizeof(*subleaf));
+                subleaf->subleaf = subleaf_idx;
+                subleaf->eax = eax;
+                subleaf->ebx = ebx;
+                subleaf->ecx = ecx;
+                subleaf->edx = edx;
+                QAPI_LIST_APPEND(subleaf_tail, subleaf);
+                subleaf_idx++;
+            } while (cpu_x86_cpuid(&x86_cpu->env, leaf_idx, subleaf_idx, &eax,
+                                   &ebx, &ecx, &edx));
+
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
@@ -5591,14 +5738,31 @@ void cpu_clear_apic_feature(CPUX86State *env)
 
 #endif /* !CONFIG_USER_ONLY */
 
-void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
+/*
+ * Emulates CPUID execution on a given x86 cpu model by filling the provided
+ * eax, ebx, ecx, edx output arguments according to CPUID instruction logic,
+ * where index is the value in EAX, when CPUID is called and count is ECX.
+ *
+ * Returns true if current index/count (leaf/subleaf) argument combination is
+ * valid and false in the opposite case.
+ * It's worth noticing that CPUID instruction already has it's own logic for
+ * responding to invalid leaf/subleaf argument combinations. Most of the time
+ * it will fill all output registers with zeroes. But there are cases when this
+ * function will zero out the result in response to a valid leaf/subleaf. Such
+ * response does not help caller to understand if the leaf/subleaf combination
+ * is valid or not, without knowing all the details about CPUID instruction.
+ *
+ * For such callers we explicitly return true of false to indicate exactly does
+ * the leaf or subleaf exist or not.
+ */
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
 
@@ -5607,15 +5771,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
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
@@ -5675,8 +5831,18 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
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
@@ -5724,6 +5890,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
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
@@ -5777,12 +5949,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
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
@@ -5812,6 +5984,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
 
         *ecx = count & 0xff;
         *edx = cpu->apic_id;
+        nr_subleaves = 3;
         switch (count) {
         case 0:
             *eax = apicid_core_offset(&topo_info);
@@ -5843,9 +6016,10 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
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
@@ -5876,9 +6050,10 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
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
@@ -6031,6 +6206,13 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
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
@@ -6052,7 +6234,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
             break;
         default: /* end of info */
             *eax = *ebx = *ecx = *edx = 0;
-            break;
+            nr_subleaves = 3;
         }
         break;
     case 0x8000001E:
@@ -6063,6 +6245,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
             *ebx = 0;
             *ecx = 0;
             *edx = 0;
+            return false;
         }
         break;
     case 0xC0000000:
@@ -6101,8 +6284,9 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         *ebx = 0;
         *ecx = 0;
         *edx = 0;
-        break;
+        return false;
     }
+    return count < nr_subleaves;
 }
 
 static void x86_cpu_reset(DeviceState *dev)
-- 
2.17.1


