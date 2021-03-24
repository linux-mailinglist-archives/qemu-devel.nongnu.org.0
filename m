Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E06D347BD3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 16:12:58 +0100 (CET)
Received: from localhost ([::1]:41652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP5Bp-0002M8-Ct
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 11:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Valeriy.Vdovin@virtuozzo.com>)
 id 1lP3yT-00052J-KT
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 09:55:05 -0400
Received: from mail-eopbgr80125.outbound.protection.outlook.com
 ([40.107.8.125]:25464 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Valeriy.Vdovin@virtuozzo.com>)
 id 1lP3yM-0002qb-Cv
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 09:55:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ModJWR3zy1+3VaoYms0aktRAEhSxxweWxJiOdL+gooQ3U1nMoKAg4zMFBhkvhe+Asa388u5iy/9lbJs8sShAhrehsXuqC6oWGFaKHqxj8f59aIFDH+NBfPB/PIUvAxHJHo1AqXeQ5l1P/6LMFknLY5JhMXEg2mzDJQ/bgf8jZAjAfeuYkncMORaAT0K3/WUBvJ4QaDFOOoMieupspnoFcPJkmOJEBJjLILCcsDM6y/L8PpgGR9shQWMOoYJkNwbqTeN6thUoIHXkR/RBqyXI2HHpzDUeIYHrOZuAeQPPkCCWIvNaen5Ruhf0EQ3tgcWts9mrVerFyBz+Uf0lZLTKdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8l2R13eHqvhEAx6yqz/PyOYRdsPp5qwyHoxhv5NfQs=;
 b=MQG2qQnnG/3czA1/Pn76G6yF+ly6O/h6FHh9k4C+OVrBzr5umjRut/Lvu9/SkpDi0WpKTpWPISbhiJ1eKtv+wcqdd91+lvm6EPgZ5AqFb1x110u81tmywRg4q9CP7hoKIafCj4DbuDSv3QqZ0LRq2gD4cChTrH9/4fJqhGETegoem9en+vgXQMU6RWH8bW3CNV7nZ2sV3i0+z9JOESdVQnZwwrXr9ZUSNJON0rRcdw5+KhoGwqKzYU0cQ4n9/8tkIKp32fPWzH7X1lTZTj8nDjLVIzQBcBlnCMYouo/iA0YYVerbRqQbrXZGRe8c9hknNpjzzs/7iLzxj1zXB/HdOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8l2R13eHqvhEAx6yqz/PyOYRdsPp5qwyHoxhv5NfQs=;
 b=UQLQC7k9oVrpbtkbAEAocZjOZl8+owgY+VcytbmmxW4yy0u4FkdwvWyBuEWsUmsu/wYojJFqvN6Hu6wJMxCXukVheoZn6G97kBOm596c9z5OZC90RZmWd2Qi7pYnNrJTGoiUTL1sM0JViXSmlLVKe+ue/rIj7rTIVxsSHsaZ9Lk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB5988.eurprd08.prod.outlook.com (2603:10a6:20b:283::19)
 by AM0PR08MB3745.eurprd08.prod.outlook.com (2603:10a6:208:ff::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Wed, 24 Mar
 2021 13:39:49 +0000
Received: from AM9PR08MB5988.eurprd08.prod.outlook.com
 ([fe80::557:7687:5016:7c97]) by AM9PR08MB5988.eurprd08.prod.outlook.com
 ([fe80::557:7687:5016:7c97%7]) with mapi id 15.20.3977.025; Wed, 24 Mar 2021
 13:39:49 +0000
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
Subject: [PATCH] qapi: introduce 'query-cpu-model-cpuid' action
Date: Wed, 24 Mar 2021 16:39:33 +0300
Message-Id: <20210324133933.18967-1-valeriy.vdovin@virtuozzo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [176.106.247.78]
X-ClientProxiedBy: AS8PR04CA0150.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::35) To AM9PR08MB5988.eurprd08.prod.outlook.com
 (2603:10a6:20b:283::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (176.106.247.78) by
 AS8PR04CA0150.eurprd04.prod.outlook.com (2603:10a6:20b:127::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26 via Frontend
 Transport; Wed, 24 Mar 2021 13:39:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe84fa8c-f2b6-496e-4610-08d8eeca4b8d
X-MS-TrafficTypeDiagnostic: AM0PR08MB3745:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB3745C1BC5F664E212973FD3787639@AM0PR08MB3745.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F0cdI3TuTlh4ik7bHeD3LgLABvXrkvtj4GpryVLlEKjEl+MgYGlFxAQv4wL12i8X0oLAjgdQ140iefV2542DMlK58DK1YS5VjhXgqOXdoptXyDcHTJA95+e9IWSnw599MnDCEcJGbMxOoA9eA822OACd4c/aWGB9FrDvbzbictUdEhIy93P+ohSfiAQDurkf31rUxJdMHoCEeawGEgMOjbJi1riKrZu/WsgHCZexNHSuzd2GkbALMqxW04RlhOWRziWygtAJ90o8XwTHFn/2FglkKIHtuXjlsEYJKVfs3qe2ASDKXHS/CvfZXo+ITxj2B7hBETaZtDK1rjVfkjvkIIY08g6B5qhl2PEixR2g8VbwrOTBWsLe1HwI3ho/lTWyY1I6bXX1poLcI8JpC9aNCzGoWkF/CkFxPfx6gP8v0QmWX1nBeG7ENG9xhJtwo9I0jYeRfj6CYc+UnC/KHWdr3p82dQtzVNDWFvBW9XPUBc08GtP+4CzESppCm66rSxPSKAmnEvZrlLzRxFH+Qfv8y1QyksANR6x4ee7piK67oDcKhxsXutoMba2cv1e/jrS1QtZv2TdMZE5a5cbKp8IqEOrsZDiyGnDk+TlscBCNS0+5Xr8eyL8w4dlXxNNaibh+oXON6Go1y8aja78DoM46bKkUSeitLsj5Nejk8RNp6Mp+AxoPy1F6jj31qppXOhts
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB5988.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(39840400004)(136003)(376002)(2906002)(54906003)(44832011)(8936002)(4326008)(5660300002)(6506007)(316002)(107886003)(26005)(6486002)(478600001)(6512007)(16526019)(69590400012)(6916009)(8676002)(52116002)(186003)(83380400001)(36756003)(66556008)(2616005)(86362001)(66946007)(66476007)(1076003)(6666004)(38100700001)(30864003)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bfdyc8TIi7y+oCOeJ0IqqXpNP85v8wStwQ0ZHR8w42Dkyb7yGL6/8LHbsTtE?=
 =?us-ascii?Q?m5NyylAaRgE7o19fZF+eRbimJZbCBmKZKgGvPRosO6GoVuJovCw0op3qTPBi?=
 =?us-ascii?Q?VXKMoKMtMrElbRGZYmQPWCDaSFOqrwTk4jt2HAK9qGrGFALjBORM4s6lBG/z?=
 =?us-ascii?Q?4B6OsBfN624pqMY+y9xhyvZfj1xYHcnfT/kHZdDvShZjILQwV6Z+U5KlWDrP?=
 =?us-ascii?Q?+o/HVkYY89fjOoBWIV5FbpHsjvIH/Y67y/LcuOLjUvAsIM3OVewIJXzDOjFD?=
 =?us-ascii?Q?fSOBwzRDqqO7cI0nDGhcuZb2eVqM/JMo7lfLveIYyUbnc+dB9DL6eJKwqeL2?=
 =?us-ascii?Q?4Q8TIWu0I/XuVk6+nB0EcWiwNrR4k89OQUYcq2Tl0cuA5jWDfWvUUhchKVlz?=
 =?us-ascii?Q?IWXfldWWBzW29LjsR/UXM6Hyne8ibuOy8nPA+4Ra1JBN6Yik4+k9XnS2Wbr+?=
 =?us-ascii?Q?FlPwUSaIfMSbcX8nZUR2M/GOgdWqzwTbKI0GXG90Bz+jC+Ah5GJFaxDQf89d?=
 =?us-ascii?Q?XqMHTAakeOj1pg+Gv9GSDOePg4UrUGOkTZP32U5MsASvusMTAUrRk5tnsZqN?=
 =?us-ascii?Q?jrZaLQSyxO9hGCgxeJAJCQJbaXG1R6CfYHpE0O2AWo9GC2/Uz7WLdUtdu2t1?=
 =?us-ascii?Q?EBQ+6dbl65nAal4gSSftxsOTZddhzfW02URqTI4JQHEB2d4oIYIlhgRFdeuK?=
 =?us-ascii?Q?SN2phWXIvED/CVIhYK8xdFcpuEg3AuZwguXWhfPUeZXwoWljoxuEPJ2lI/fE?=
 =?us-ascii?Q?feC+N9v0nXLWFROmxJWTmcrrjK7FbHYAWestMN1yqE2KRqAsKtRc1Z54RsjK?=
 =?us-ascii?Q?ZNAY2n/mJm6qp/2n80ojQLUDhdVSir2Hvy1PR0gzcHJBp2S1h/7eJBVWAp0Y?=
 =?us-ascii?Q?P+VHBoN/YQzeEhraLhlZM5F1puVfaeIHMJezVCDJwnySliDToYswPgaOyPaj?=
 =?us-ascii?Q?TiAyjInuhIQi3WrbMfpe5P3cZBN1ntmB8PyvQ6+H5o1qCFOXJK72f9Xd8LrZ?=
 =?us-ascii?Q?AjQGjd3Lcwoywv+TAysgnpXqAT6mYb2PThCN7yXjJ4AtlKGwot/CzobqZvnm?=
 =?us-ascii?Q?y6a/50b3ohqg+L6g5QpuLNMQSER0l2nB7lOj/WRIi5CvXfTewPi8A62SDNR4?=
 =?us-ascii?Q?vHZO4fQ9nCfOaCaTxmh7iLFA3+esPXofm3H8g4ifyGP9wg+o0+z4CJovAJ3h?=
 =?us-ascii?Q?V2tcNZ37Pml/sSJswaIQ+P2PmK0Q7Vo3nwEaEsvwrirIFVO4CijLLicE/Yy1?=
 =?us-ascii?Q?KzZlXbYby7D5233aD0aKQoH2paAH2NBnoXMm6rlkbgZzPDpe9+MFcF4uejKq?=
 =?us-ascii?Q?+7C5u4KSpUGmu5Eph35gJKpg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe84fa8c-f2b6-496e-4610-08d8eeca4b8d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB5988.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 13:39:49.5401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z4901OQ7YyOZLT7FHfx2Hx7XY6ZMNw9pZqpMqrs3BQabv4U8i/zJylHrV7vkHmq+M6tKBusvJS8woBvETUW1XFylPgJ8M4rwsCeA/mHf1bA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3745
Received-SPF: pass client-ip=40.107.8.125;
 envelope-from=Valeriy.Vdovin@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 24 Mar 2021 11:11:47 -0400
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
 qapi/machine-target.json | 122 ++++++++++++++++
 target/i386/cpu.c        | 292 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 405 insertions(+), 9 deletions(-)

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
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6b3e9467f1..14d29c9136 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5148,6 +5148,288 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
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
+/*
+ * cpuid_num_subleafs_map - array of values that map leaf values to the number
+ * of subleafs in it.
+ */
+struct leaf_to_num_subleaves_map {
+    uint32_t leaf;
+    uint32_t num_subleaves;
+};
+
+static const struct leaf_to_num_subleaves_map cpuid_num_subleaves_map[] = {
+    { .leaf = 0x00000004, .num_subleaves = 4 },
+    { .leaf = 0x00000007, .num_subleaves = 1 },
+    { .leaf = 0x0000000a, .num_subleaves = 1 },
+    { .leaf = 0x0000000b, .num_subleaves = 2 },
+    { .leaf = 0x0000000d, .num_subleaves = ARRAY_SIZE(x86_ext_save_areas) },
+    { .leaf = 0x00000014, .num_subleaves = 2 }
+};
+
+static uint32_t cpu_x86_cpuid_get_num_subleaves(CPUX86State *env,
+                                                uint32_t index)
+{
+    int i;
+    for (i = 0; i < ARRAY_SIZE(cpuid_num_subleaves_map); ++i) {
+        if (cpuid_num_subleaves_map[i].leaf == index) {
+            return cpuid_num_subleaves_map[i].num_subleaves;
+        }
+    }
+    return 1;
+}
+
+/*
+ * struct x86_cpuid_leaf_iter - CPUID leaves iterator.
+ * cpuid leaves iterator will hide the complex logic of walking over a full
+ * value space of leaves available to a specific cpu model.
+ *
+ * Purpose of this iterator: for each specific cpu model, initialized in
+ * QEMU, the amount of available cpuid leaves may vary and their enumeration
+ * is somewhat complex, considering the need to jump from basic info leaves to
+ * extended info leaves plus some additional more specific leaf ranges.
+ * This iterator hides this complexity and helps to separate leaf-walking logic
+ * from the actual use-case logic.
+ */
+struct x86_cpuid_leaf_iter {
+    CPUX86State *env;
+    uint32_t leaf;
+    bool valid;
+};
+
+static void x86_cpuid_leaf_iter_start(struct x86_cpuid_leaf_iter *i,
+                                      CPUX86State *env)
+{
+    i->env = env;
+    i->leaf = 0;
+    i->valid = true;
+}
+
+static void x86_cpuid_leaf_iter_next(struct x86_cpuid_leaf_iter *i)
+{
+    struct cpuid_leaf_ranges ranges;
+    struct cpuid_leaf_range *current_range, *end_range;
+
+    cpuid_get_cpuid_leaf_ranges(i->env, &ranges);
+    current_range = &ranges.ranges[0];
+    end_range = current_range + ranges.count;
+    while (current_range != end_range) {
+        if (cpuid_leaf_in_range(i->leaf, current_range)) {
+            break;
+        }
+        current_range++;
+    }
+    if (current_range != end_range) {
+        if (i->leaf < current_range->max) {
+            i->leaf++;
+            return;
+        }
+        current_range++;
+    }
+    if (current_range != end_range) {
+        i->leaf = current_range->min;
+        return;
+    }
+
+    i->valid = false;
+}
+
+static bool x86_cpuid_leaf_iter_valid(struct x86_cpuid_leaf_iter *i)
+{
+    return i->valid;
+}
+
+/*
+ * struct x86_cpuid_subleaf_iter - helps to iterate over all subleaves
+ * in a given CPUID leaf. Most of the cpuid leaves do not have varying output
+ * that is depenent of the subleaf value in ECX at all, but this maps into a
+ * single iteration to subleaf 0.
+ */
+struct x86_cpuid_subleaf_iter {
+    CPUX86State *env;
+    uint32_t leaf;
+    uint32_t subleaf;
+    bool valid;
+};
+
+static void x86_cpuid_subleaf_iter_start(struct x86_cpuid_subleaf_iter *i,
+                                  CPUX86State *env, uint32_t leaf)
+{
+    i->env = env;
+    i->leaf = leaf;
+    i->subleaf = 0;
+    i->valid = true;
+}
+
+static void x86_cpuid_subleaf_iter_next(struct x86_cpuid_subleaf_iter *i)
+{
+    uint32_t max_subleaf = cpu_x86_cpuid_get_num_subleaves(i->env, i->leaf) - 1;
+
+    if (i->subleaf < max_subleaf) {
+        i->subleaf++;
+    } else {
+        i->valid = false;
+    }
+}
+
+static bool x86_cpuid_subleaf_iter_valid(struct x86_cpuid_subleaf_iter *i)
+{
+    return i->valid;
+}
+
+static void cpu_model_fill_cpuid_subleaf(X86CPU *cpu, int leaf_idx,
+                                         int subleaf_idx,
+                                         CpuidSubleaf *subleaf)
+{
+    uint32_t eax, ebx, ecx, edx;
+
+    cpu_x86_cpuid(&cpu->env, leaf_idx, subleaf_idx, &eax, &ebx, &ecx, &edx);
+    subleaf->subleaf = subleaf_idx;
+    subleaf->eax = eax;
+    subleaf->ebx = ebx;
+    subleaf->ecx = ecx;
+    subleaf->edx = edx;
+}
+
+static void cpu_model_fill_cpuid_leaf(X86CPU *cpu, int leaf_idx,
+                                      CpuidLeaf *leaf)
+{
+    struct x86_cpuid_subleaf_iter it;
+    CpuidSubleaf *subleaf;
+    CpuidSubleafList **tail = &leaf->subleaves;
+
+    leaf->leaf = leaf_idx;
+    x86_cpuid_subleaf_iter_start(&it, &cpu->env, leaf_idx);
+    for (; x86_cpuid_subleaf_iter_valid(&it);
+        x86_cpuid_subleaf_iter_next(&it)) {
+        subleaf = g_malloc0(sizeof(*subleaf));
+        cpu_model_fill_cpuid_subleaf(cpu, leaf_idx, it.subleaf, subleaf);
+        QAPI_LIST_APPEND(tail, subleaf);
+    }
+}
+
+static void cpu_model_fill_cpuid(Object *cpu, CpuModelCpuidDescription *info,
+                                 Error **errp)
+{
+    X86CPU *x86_cpu = X86_CPU(cpu);
+    struct x86_cpuid_leaf_iter it;
+    CpuidLeaf *leaf;
+    CpuidLeafList **tail;
+
+    info->cpuid = g_malloc0(sizeof(*info->cpuid));
+    tail = &info->cpuid->leaves;
+    info->model_id = object_property_get_str(cpu, "model-id", errp);
+    info->vendor = object_property_get_str(cpu, "vendor", errp);
+    x86_cpuid_leaf_iter_start(&it, &x86_cpu->env);
+    for (; x86_cpuid_leaf_iter_valid(&it); x86_cpuid_leaf_iter_next(&it)) {
+        leaf = g_malloc0(sizeof(*leaf));
+        cpu_model_fill_cpuid_leaf(x86_cpu, it.leaf, leaf);
+        QAPI_LIST_APPEND(tail, leaf);
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
@@ -5607,15 +5889,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
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
-- 
2.17.1


