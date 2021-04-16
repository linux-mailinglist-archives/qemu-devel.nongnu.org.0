Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D69403622B7
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 16:50:36 +0200 (CEST)
Received: from localhost ([::1]:44848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXPnn-0004KX-Tr
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 10:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Valeriy.Vdovin@virtuozzo.com>)
 id 1lXPmh-0003Ch-V3
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 10:49:28 -0400
Received: from mail-eopbgr80130.outbound.protection.outlook.com
 ([40.107.8.130]:5185 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Valeriy.Vdovin@virtuozzo.com>)
 id 1lXPmY-0003uE-6z
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 10:49:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ElluA7XQsWhC/2Wncbd+fvoVIR2s4MjVJKxV5uoRcxQ9Q3n6flYLCt4KVnMfbKOUvmNSIVgoR5yoxjZpBcqk+za+TNNATKF89Kv0zajoSce52k45V2zZ5G117ZXqA6XN577eXAM+cyz3LMwGjqFpbsNTiRkGjG/0ipdFRaQ04dObcblqNsyEckh9aRvK++wjkePBKCLEfNxz50GlXqWc9xCR7gBhyzfIbPOmAjN+A1QBJQLkCSNvXEtee5x0LNiXkfYlaUJxvq3RLWsiPEUKGV+Kgr0mrBZ7H10H2fVd94KY1Ii604OhNoNDyLsGlaABjpAuZNbGP4yziYsE/IXWQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Taxt06XZ/Kr42qNuCaTIk+QG6a6ymtWjXsr/4hOqjfk=;
 b=m3Wh+1fwo8cXaboAvC/LJyoryWIl/PrC/XASpsuq1UcpSZKfTqnjJpnbrRQ64xUqzgoUQxjhEuXSLB0NFWhXr5w9vr69W2IftRVVzUy9NX2WuXAOTzEkoB1aNiK/X80uNYWeqedeJlZo9ZLN+khOWBYPw+HSCE34BE42hPCq+HtHowBikg6QGRmo2RNRq7X3qva4KC3B3QZJBZLRqdz0lObOyQ9ChtLLhaUd2tsEIgSd4XqVXatIQgKcm8lUX2LYGSG6898sqHDQA3ktLme0nYGic27VaXzM6udWHi3P+S2FK1BD25mPR1RAg++zzf2qt8NqwBnr/S4TPrcmU3uWaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Taxt06XZ/Kr42qNuCaTIk+QG6a6ymtWjXsr/4hOqjfk=;
 b=B6Uibs+SpmnnvensM0QGzzRf0oaB5KXqf+IPy2p9Nt4OW/8pRJKpe214VJYTVi1DHZBwsgHfvmiluQI+mUifTXtKwQLg3Qap3Sj5/DkMNuArH52WYf2G9fahtBue9Lxs9yM1dKVPn+btTyXQ46scVwysrkGLcRoPrZU5iMKOhBo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB5988.eurprd08.prod.outlook.com (2603:10a6:20b:283::19)
 by AM4PR08MB2769.eurprd08.prod.outlook.com (2603:10a6:205:a::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Fri, 16 Apr
 2021 14:34:09 +0000
Received: from AM9PR08MB5988.eurprd08.prod.outlook.com
 ([fe80::7d3f:e291:9411:c50f]) by AM9PR08MB5988.eurprd08.prod.outlook.com
 ([fe80::7d3f:e291:9411:c50f%7]) with mapi id 15.20.4042.018; Fri, 16 Apr 2021
 14:34:09 +0000
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
Subject: [PATCH v5] qapi: introduce 'query-cpu-model-cpuid' action
Date: Fri, 16 Apr 2021 17:33:42 +0300
Message-Id: <20210416143342.25510-1-valeriy.vdovin@virtuozzo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [176.106.247.78]
X-ClientProxiedBy: AM0PR02CA0085.eurprd02.prod.outlook.com
 (2603:10a6:208:154::26) To AM9PR08MB5988.eurprd08.prod.outlook.com
 (2603:10a6:20b:283::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (176.106.247.78) by
 AM0PR02CA0085.eurprd02.prod.outlook.com (2603:10a6:208:154::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Fri, 16 Apr 2021 14:34:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff0c7b35-4205-4c4a-3995-08d900e4b20f
X-MS-TrafficTypeDiagnostic: AM4PR08MB2769:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM4PR08MB27695DA6F47EE3068DA01B53874C9@AM4PR08MB2769.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6rYBNjMhtbA3KSrdTOMPB5CcQumFI/nIDsphBRYg0gh0DGBoDwVCZhxadlXiPUM1DQaQR333nR/TORLIyhaGOuzhE1Z6l/FBFALQIGvPf7w7XH7LZweCxxTeP+Xy/k71wgf1Pau3RiCnXzyS5DQSBR/By5jDKoC8Oyq8fvzPyEpdFzkcjxa4xm41iHBbIk4wRy9ipbhzshUrkS+gvQ+Pw7sHeeWV19Lh8BYKzTJodNsQZzOxeqEB0p7b90RGeQXwlmFutj88WPNYJJALrtIiY2AwmjxEdrTrZauGYR8PjReIDupzxbAtu0bumqcntACpN8AZZAyhOlLDcHSf3ohZeDyHh2sU2mHFMkUN6CXsc5JeYOlSChNbZBUI1LBqLFVcyX83xAAUsfyInTe+9PKnndM0ty8E5AB2t6Sxsf3eL12bp7K4W9wzrS3XhnvmWvJvIQvaW0ApgxpF+k+zKUxTinxHDSiN+nKWh6AHs05hVNoh15ZHMiE1gh9t3QxQqEOLs2FdKUFvs/aHBYFpRReZJaTQZPD9oK8CO3Saf3IApEIq/O9PjFXmmMlLgnDcqnaeHaQnnkp8ydQPbiFAqsShX4PnIYW8340X/0YZBKdkatyGXlY+wbeguXAPD9E5tg4bUGMUoiRHV26RCHyHoelrGPjnMisVaYyxAus0SJ2VpQdB/Ju5msTJ9cxnbiO7S5qX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB5988.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(376002)(39840400004)(366004)(16526019)(186003)(26005)(8676002)(30864003)(6666004)(86362001)(54906003)(4326008)(83380400001)(6512007)(316002)(38350700002)(38100700002)(107886003)(44832011)(6486002)(52116002)(5660300002)(6506007)(478600001)(6916009)(66476007)(66946007)(36756003)(66556008)(8936002)(2616005)(69590400012)(2906002)(1076003)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?mkmd6ApEgjc53UbmOUlI1DfCMtHklOfgWWKQ4UNV3bwrPkgfny4co9LI+EoX?=
 =?us-ascii?Q?RgLcas7bCxaSeOIWhUTtF43BjCHZU8BTzmewk5ZJ9kkBP7inZf7Wg04huVzP?=
 =?us-ascii?Q?l++lenjp3yaQz2NabQye8UDExpN0UQggcdrPT9Uc5BktptkTTZgRmvJQnNfS?=
 =?us-ascii?Q?Bqk4ZfbhBpURER5PLTrRqAZkRxyg+fU4IqnQ40mowO+/sfbYPSM2H4SLrr1U?=
 =?us-ascii?Q?gG+TiG+3VVmpcYEaB2L8zOBBWzfm+KepKQUKDwE3ULbuxz8QT5tMDuTi4QqW?=
 =?us-ascii?Q?bbQ5PA/4Griangi7PXuWFT8c79WRJTTeXC/WrQ3YOgI6OHMXxzACkj0rtGFf?=
 =?us-ascii?Q?3Jiu1q/LrKbig5d+UhjD3bdkM7UKN/LSj0dKRW9DOf1HDX2q1dAve4GB8xz0?=
 =?us-ascii?Q?xoWK8qQmkX+PEoyvbzX0AzBnXcKVD1dd5Ol7Rf6yMVGahLYf8+N+FVC5SyH1?=
 =?us-ascii?Q?qP4ftgWy4TF1/wgrp7fja5v34TCzSuYLsXiqYWsr2XVsI6IiM2NOnL3AxdGj?=
 =?us-ascii?Q?WZZOlT9ORt0nJ09iIv3X3ZkRseTHFbF6jYeHAVcZmm5Ehb+5oXp3UjW1CQUZ?=
 =?us-ascii?Q?tKLHn8Em9uRf4Vop5xCvbU7WNNw3/E8E3dcAV5Oat+AJSJ8TCRti4Ux2FopV?=
 =?us-ascii?Q?9vcGnV70YHN5vgDKuAku6g19rS1p6nYo6nMeoyiFNMEY878tVh/B6t3C+lYM?=
 =?us-ascii?Q?iYV6JsAbmMkTLa8lOPubMKiW3ojrrQ8Y4HToHOiZHoVJaU4YBqolLC3d3VFJ?=
 =?us-ascii?Q?cLZ4b2dK7JvXbdIKOs4C9wbUAczxdRObfx/2siiCh9Q9e4U99StPDO8Lj+Ko?=
 =?us-ascii?Q?5G0HHMbSeKraZUUmGrM9ljSND6ohvkjuZ2uqO/kvwpxwXGxqltdUq668DjUg?=
 =?us-ascii?Q?vwFRHosUprJBJVoNFCUNaBCPbsYUyDidbbd/GHkRn5Es5oYHNL2GqoMoyhSK?=
 =?us-ascii?Q?kUpUPmJABBB8WSZV/zr5IgoGaow149/B95ZmrSeyLqX2ZHrkw3qLBkvCwKuW?=
 =?us-ascii?Q?lKe4JxWYZk2USvQNqqy0T8O3vtymQr44UszXp5A0wfmw/c09nPFHwhdWm+NX?=
 =?us-ascii?Q?Ilaa594iUjez+Tva7djewpt7qHnOQU6sOlbbFJ5BXoMkRcVV4WXs6WFCVYdB?=
 =?us-ascii?Q?CIZGiRJyfFVUdvnobo0wWHVipeiGdICoDgyrTgmcwFtgYoriDZ7Y0CAonac2?=
 =?us-ascii?Q?SPXw0Mpb47UaGZMrW4w2z26Og97TSRygG9IxWJjRS+LEof1yyOtfWrVPuvkh?=
 =?us-ascii?Q?o4WD6Ra4g4IxouoAWtwwqNJHVWmQPwPKqofXgU/16zg1wMKPneYjw6vqFul6?=
 =?us-ascii?Q?Xi2o+uFDIPjFDgKOLQKGj/t4?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff0c7b35-4205-4c4a-3995-08d900e4b20f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB5988.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 14:34:09.1323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fdazsXMsXXwW4S23ablDRhCBcWTW9xBnJmJpwHS77ZXenSmcHUMf1Saa7R/mCGP6l+w1nMREB+LvTnob153Qj80qoxxIS34p8C0BKHSUIfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2769
Received-SPF: pass client-ip=40.107.8.130;
 envelope-from=Valeriy.Vdovin@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

Also, cpu_x86_cpuid function has been modified to return bool
value depending on what are the arguments of leaf and subleaf
(or index and count). In cases where leaf/subleaf arguments are
invalid the function returns false.

Signed-off-by: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>
---
v2: - Removed leaf/subleaf iterators.
    - Modified cpu_x86_cpuid to return false in cases when count is
      greater than supported subleaves.
v3: - Fixed structure name coding style.
    - Added more comments
    - Ensured buildability for non-x86 targets.
v4: - Fixed cpu_x86_cpuid return value logic and handling of 0xA leaf.
    - Fixed comments.
    - Removed target check in qmp_query_cpu_model_cpuid.
v5: - Added error handling code in qmp_query_cpu_model_cpuid
 qapi/machine-target.json | 123 +++++++++++++++++++++++
 target/i386/cpu.h        |   2 +-
 target/i386/cpu.c        | 212 +++++++++++++++++++++++++++++++++++----
 3 files changed, 318 insertions(+), 19 deletions(-)

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
index 6b3e9467f1..b76bfb31cf 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5148,6 +5148,157 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
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
+static void cpu_model_fill_cpuid(Object *cpu, CpuModelCpuidDescription *info)
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
+    Object *cpu = ms->possible_cpus->cpus[0].cpu;
+    char *model_id, *vendor;
+
+    class_name = object_class_get_name(object_get_class(cpu));
+    model_id = object_property_get_str(cpu, "model-id", errp);
+    if (!model_id) {
+        return NULL;
+    }
+    vendor = object_property_get_str(cpu, "vendor", errp);
+    if (!vendor) {
+        return NULL;
+    }
+
+    info = g_malloc0(sizeof(*info));
+    info->model_id = g_strdup(model_id);
+    info->vendor = g_strdup(vendor);
+    info->class_name = g_strdup(class_name);
+    cpu_model_fill_cpuid(cpu, info);
+
+    return info;
+}
+
 static uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
                                                    bool migratable_only)
 {
@@ -5591,14 +5742,31 @@ void cpu_clear_apic_feature(CPUX86State *env)
 
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
 
@@ -5607,15 +5775,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
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
@@ -5675,8 +5835,10 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
             if ((*eax & 31) && cs->nr_cores > 1) {
                 *eax |= (cs->nr_cores - 1) << 26;
             }
+            return *eax || *ebx || *ecx || *edx;
         } else {
             *eax = 0;
+            nr_subleaves = 3;
             switch (count) {
             case 0: /* L1 dcache info */
                 encode_cache_cpuid4(env->cache_info_cpuid4.l1d_cache,
@@ -5724,6 +5886,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
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
@@ -5761,28 +5929,31 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
             *ebx = kvm_arch_get_supported_cpuid(s, 0xA, count, R_EBX);
             *ecx = kvm_arch_get_supported_cpuid(s, 0xA, count, R_ECX);
             *edx = kvm_arch_get_supported_cpuid(s, 0xA, count, R_EDX);
+            return *eax || *ebx || *ecx || *edx;
         } else if (hvf_enabled() && cpu->enable_pmu) {
             *eax = hvf_get_supported_cpuid(0xA, count, R_EAX);
             *ebx = hvf_get_supported_cpuid(0xA, count, R_EBX);
             *ecx = hvf_get_supported_cpuid(0xA, count, R_ECX);
             *edx = hvf_get_supported_cpuid(0xA, count, R_EDX);
+            return *eax || *ebx || *ecx || *edx;
         } else {
             *eax = 0;
             *ebx = 0;
             *ecx = 0;
             *edx = 0;
+            return false;
         }
         break;
     case 0xB:
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
@@ -5812,6 +5983,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
 
         *ecx = count & 0xff;
         *edx = cpu->apic_id;
+        nr_subleaves = 3;
         switch (count) {
         case 0:
             *eax = apicid_core_offset(&topo_info);
@@ -5843,9 +6015,10 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
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
@@ -5876,9 +6049,10 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
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
@@ -6031,7 +6205,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         *eax = 0;
         if (cpu->cache_info_passthrough) {
             host_cpuid(index, count, eax, ebx, ecx, edx);
-            break;
+            return *eax || *ebx || *ecx || *edx;
         }
         switch (count) {
         case 0: /* L1 dcache info */
@@ -6054,7 +6228,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
             *eax = *ebx = *ecx = *edx = 0;
             break;
         }
-        break;
+        return count <= 3;
     case 0x8000001E:
         if (cpu->core_id <= 255) {
             encode_topo_cpuid8000001e(cpu, &topo_info, eax, ebx, ecx, edx);
@@ -6063,6 +6237,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
             *ebx = 0;
             *ecx = 0;
             *edx = 0;
+            return false;
         }
         break;
     case 0xC0000000:
@@ -6101,8 +6276,9 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
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


