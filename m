Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A8457D47B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 22:02:56 +0200 (CEST)
Received: from localhost ([::1]:39778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEcNr-0005uT-Sx
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 16:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oEcHv-00050E-8l
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 15:56:47 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:40440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oEcHo-0006aX-R0
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 15:56:46 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26LIKtfk027882;
 Thu, 21 Jul 2022 12:56:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=MTCDmLTNV67iF/RKDptn6o8I0Uk1BpY+Tae2pJSdK0E=;
 b=zQd7hkHy64Z6NUzNOXHfxMS38XZ/3K+Eogtab4krRJENI3+Z4i4o2AAqDM2cm/VMO9y9
 fXpqEJovupUWpr+xgg7sEB5rr7eu5MgnVeho8LM4IOXkIgPdFPWMZrRFZ2yRnU+d8EBT
 PDDQ8VdckBDyVvrw/4yAYAH0OJgsxErrI4JhhiynjntkvwkdrDItf5olp7Is5bKir6TC
 xkIVoNoIasA9s1bCIPg0VfI2+kBcz9jlAM2H+sJSNDydstEvQ3GC71pUH7oQA3jS1sHk
 pv6sRBilZ4FDbdeJ6/xxgW67rt9dM/eFzKgaUzHcMWX7rvV4yvLSB9NpEDIPCm/4xi4y yQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3hbvv244d6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 12:56:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXaOc5AZ5Y1psS8lgJxpBo09jzGgb+CWZXNBRsUVmtYsh0CTnxzAEKs0+cpMijsTqY5HSRUhyjwXuHqxl5JDbD3Yb4AmPgJN86sCGMncBFe7dlFQymrvmGweJWSewP31A9n7sBpyJja8+0mynLN1gPChc+AmqYSZTyTg3PFMQU65785ebawlr4yiwyydEL+gMFda5RjYGV1zWyiM2Llwsu3UTn3jK3KHX7pLCfPsbnMxfMnCsgK8zimT6eltv/Q125y4lGspTtrajX52kxVsniuqJJZ39tcY/XCZvOJUsyowWmjsjav6P24XPu1Cxa6hAYQJfUL8GDQ0PNpuKP+iQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTCDmLTNV67iF/RKDptn6o8I0Uk1BpY+Tae2pJSdK0E=;
 b=YNBua7shTvsmjACiy9QuSY6crf1zynSoB2OuD4HS6udGaUmzNVaJDQE2nUxt7pjT0qZY+PreK5stJF6UEonoY3SD8h8YGWUBWEsQ2wX6nsUnpTWkoGSM8VMmtJ/lsqKy2Wq98npKe/Ltifdcbh8o8Yz7214bapC0LHZRJKor+T4jByYZMgrrGXbGdLcq+2SDZGNszuG7anUtio1IHXvIdGVWpgcyZpgzYEoM44+hWa/i07c99Tb5Lv6LEl239Jpw/ss+QYIg7JNV2VtdXkciM343d4Jwf6KO4NUuYMRux8UKosO/w9Y2KJK24K8jSvIbVUi/ZXtLz9e9Ik9qgOWDFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by DM5PR02MB2825.namprd02.prod.outlook.com (2603:10b6:3:108::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 21 Jul
 2022 19:56:35 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f%5]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 19:56:35 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com, armbru@redhat.com, eblake@redhat.com,
 prerna.saxena@nutanix.com, Het Gala <het.gala@nutanix.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH v2 1/7] multifd: adding more helper functions in util files
 for live migration
Date: Thu, 21 Jul 2022 19:56:14 +0000
Message-Id: <20220721195620.123837-2-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20220721195620.123837-1-het.gala@nutanix.com>
References: <20220721195620.123837-1-het.gala@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0035.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::48) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c0ef3f7-dd4b-4766-ed82-08da6b531def
X-MS-TrafficTypeDiagnostic: DM5PR02MB2825:EE_
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M2cYFFPn4/4Pv248Eh22yTnHJPv6gp1TQKKnxTat+lwICj6ZWzUsYM3Nl37ZeSMgAFr1pA9Mhy7d69LxHzxKM5J9KvutIFx2bvzivC9SkJ4uYMPlkRNixX7OCDyMisU5r2P2xiWu2P8tCfARfGb82nJKZYol397hsZGccl7LD2Qkpl9+Q9r9a4kvoHD74S8CheuwphxqbvfMog074kdzBM8NUvCa1ew8LZVl4t72YtN0yWdQBKnga4mlDsfDECFkeRfCBPSM+vQklrPGMvAKx/affYSuhTtWyLgFzG3+vzj/URkHplfZivsXN+2atm8aK6xvphNVo5bUdxJvrq246uRkHWQu82+wP0MkNvV/tn5e9QODBtEPBy5JudoJVB2881U1wy3pcbDxl8ScxZ2e+g2EUbRS70NtnHsYXDGdgHG8W5dQWNvBtFcjzSXyNmjUG16utdXB1jRBtv0x9IYen1jVbiVjGYXZYMCjwyl/VBE592gDW4HSFtKaJLqxE00H5+0/I3jsKhliyJLhEecPcm+vLydEfrr3nxh3Qt3XdSNPAL1MFpVmiP6I1wX46tJLmAsQTfnv43zOb9jSvNnEhAr5DC/mInExDf79/o54nHVem7sDJnL+GHVM/RkZ1TTscUoepWNT9WmCD5vByAVpIVVIjP4I1YT/TirHcB0Kr4ufRhaoa/GpX9ZZbcukW5uN+9zaQ3PUbkxPETjvVH9Jt8QxGcN8OxqLXl/WchHg4g5fe+b3gkOUGizoNnnr1nhLuZaOBbafWzETvHOET6m11bb+72ntuJVGjY1+G3OqSNbJSyy03HREji6CJ6IrvXy/zVSMEdzau2JlqPn900RnQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(346002)(376002)(396003)(366004)(38350700002)(38100700002)(1076003)(83380400001)(36756003)(186003)(2616005)(26005)(86362001)(107886003)(6512007)(316002)(54906003)(478600001)(66946007)(6916009)(66556008)(52116002)(6506007)(41300700001)(5660300002)(4326008)(8676002)(8936002)(44832011)(6486002)(6666004)(66476007)(2906002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EIKJLjFHWuFd0EXNq1ia67GxyFCXHGpM2eMDxlJSEgD0sCYcuKfmzrsFpyJx?=
 =?us-ascii?Q?tUyOxmARbbWfvbuKrSkTVCinb+qpwRBzewJpX1RsKCUTwOmZrE2Fb8cw/nwC?=
 =?us-ascii?Q?LhQd9mYSuraHBY2yEWVu2RU2IY68WD1KBtjBRoFj1dj1EKwima0FlhwDgOF4?=
 =?us-ascii?Q?jnKCS3sViSb1CEFrB2nyqTQOaPcYWE0p1k7Y7OtrnVAbNM89C5X61Jbds2/j?=
 =?us-ascii?Q?gw/vTpEsJIH/UX0zxPYzQPqb1beNVLjR+PvsAvhkmpgZr4IJvv669NdTKsUe?=
 =?us-ascii?Q?HcPumgpHnWzNJixtPD4Jex/Pi7/PPMFvodRRA8tKVWNbai+lB6RqNQ669P16?=
 =?us-ascii?Q?kWlhbeZwtY4tOr7GnOjw/jOWLo9NXob+0TQA97fygevTkXaQyO+ueComeWBi?=
 =?us-ascii?Q?E7La9b03v83dNVyBgTjBG3jopRWvCZpc5ffd2h6uJvE8D6POUQQV3yb1uX5T?=
 =?us-ascii?Q?hj817Oh3VKipBNmCRufv1b4vUY7aEISWCLWBkiVOkOZpPIH12vAn6nSgyrzf?=
 =?us-ascii?Q?svXtDWl06oK3wfQ18XAitwOfdj9KeyPiTEP2/2z+RENvVP4syaRcRSxATQDy?=
 =?us-ascii?Q?vWVcG4ahi39JgKxIthIpnVaRvC+G83MncGJBrVvdJazjJQw4xvKOntX85XTK?=
 =?us-ascii?Q?ZWTCfvkkSLdd1RW7MU+dleAGB1C5JG58mX0t2yQZxmGhe9LbwXOIfOmExOyA?=
 =?us-ascii?Q?FMAvqFGx6dtDomk1Fzffxk5PQyqmi2E7Ms747grEu3r5WSkGaGeFDr/Y+iu8?=
 =?us-ascii?Q?+ZPKu/3J0WYCnCCWss2DpDDgcUdZL7wv7m3yMVgL1VsQhaGJYEez1l3qxJ1j?=
 =?us-ascii?Q?fPl/eLFpJ+akQOIj0QHbQMiBrj8E5hpc9I2icdc2TMa4WjzUQfpOsWwzjhVU?=
 =?us-ascii?Q?Hh2/llkrzT/6tkvsPxVpYjMTgUBGHykknGlbfB2nUwMX0vuo4DnGKPjvkFHT?=
 =?us-ascii?Q?OG58UehVtEs0L9cs36Xq8zzVk2CqwQnYrQsW/g+c31ISHCh0/4AOmrq5XvgQ?=
 =?us-ascii?Q?qz9FfdzgH2ZmGK0TWkV9Gk1Ebk8vJYmgAmMN82Weo99WnY6V/864SxpWRpS/?=
 =?us-ascii?Q?cbPSOUqjVEOKrtS6NBxxeJ6rPnxuccvaZh93xhZhYxCcubSLs46FnTU16zOE?=
 =?us-ascii?Q?9VAI82w0KaKgsVWFdYvcbXKwlXh+MK7wrxKEzGaW4PNvcC/wsRKqmRpWJGss?=
 =?us-ascii?Q?JR/y38TtylulZ36LA5//FBMK96RDMPciOLEjbIyWB6REFmDg015597MEqNvf?=
 =?us-ascii?Q?/0VxVhCgP7ts6qnS9/AkSqEqVHud4G+5MMUCJff8JbUIyfOIOnm5p3vRl9Vu?=
 =?us-ascii?Q?mOnlGLE1M3Zu+Npo5cmUUIPqr4IVFu+55TnSy6BMgYAhD+jr3UbOCQsqBu+L?=
 =?us-ascii?Q?TX8SFdo+8SzGG53hlFZLeFwbBdSYcTlYpli6pCyPbc4/QDHaCwmEn5frjQIr?=
 =?us-ascii?Q?Xmy4cGms2L9MHzPVb1zaZiQ0g1FqLoCNWiXwerfavRmE8efrZajXyqpdK65t?=
 =?us-ascii?Q?xgFYG/bKlU6kSsTjpjFa7PlECbvHo+nehUJuPBCQP75BZVQ6R8d3cOZz9LKQ?=
 =?us-ascii?Q?U+g+HTdniLcpYMA4PLQiauem6SZrBy5DJ+lF4qSI?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0ef3f7-dd4b-4766-ed82-08da6b531def
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 19:56:35.6629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +LbuxuBilR3bfSpR8Rg4L01iEb9vkjTSQ6BoxpFLyTbFUlvKTQhHgJDYPkvgmyThxJ9QNaNf8C9THWHTruA1CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2825
X-Proofpoint-ORIG-GUID: x7tIdFbDgcw6AqwhryEItGPreBUdRvA3
X-Proofpoint-GUID: x7tIdFbDgcw6AqwhryEItGPreBUdRvA3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_27,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

i) strList_from_string() shifted from hm-cmds.c -> qapi-util.c

ii) Adding qemu_string_count_delim() helper func. in qapi-util.c and
    QAPI_LIST_LENGTH() macro defined func. in util.h

Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 include/qapi/util.h | 12 ++++++++++++
 monitor/hmp-cmds.c  | 31 +++----------------------------
 qapi/qapi-util.c    | 35 +++++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+), 28 deletions(-)

diff --git a/include/qapi/util.h b/include/qapi/util.h
index 81a2b13a33..36164ca7ba 100644
--- a/include/qapi/util.h
+++ b/include/qapi/util.h
@@ -29,6 +29,8 @@ bool qapi_bool_parse(const char *name, const char *value, bool *obj,
                      Error **errp);
 
 int parse_qapi_name(const char *name, bool complete);
+struct strList *strList_from_string(const char *in, char c);
+int qemu_string_count_delim(const char *str, char delim);
 
 /*
  * For any GenericList @list, insert @element at the front.
@@ -56,4 +58,14 @@ int parse_qapi_name(const char *name, bool complete);
     (tail) = &(*(tail))->next; \
 } while (0)
 
+/* provides the length of any type of list */
+#define QAPI_LIST_LENGTH(list) ({ \
+    size_t _len = 0; \
+    typeof(list) _elem; \
+    for (_elem = list; _elem != NULL; _elem = _elem->next) { \
+        _len++; \
+    } \
+    _len; \
+})
+
 #endif
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index a6dc79e0d5..6bb6424215 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -43,6 +43,7 @@
 #include "qapi/qapi-commands-stats.h"
 #include "qapi/qapi-commands-tpm.h"
 #include "qapi/qapi-commands-ui.h"
+#include "qapi/util.h"
 #include "qapi/qapi-visit-net.h"
 #include "qapi/qapi-visit-migration.h"
 #include "qapi/qmp/qdict.h"
@@ -71,32 +72,6 @@ bool hmp_handle_error(Monitor *mon, Error *err)
     return false;
 }
 
-/*
- * Produce a strList from a comma separated list.
- * A NULL or empty input string return NULL.
- */
-static strList *strList_from_comma_list(const char *in)
-{
-    strList *res = NULL;
-    strList **tail = &res;
-
-    while (in && in[0]) {
-        char *comma = strchr(in, ',');
-        char *value;
-
-        if (comma) {
-            value = g_strndup(in, comma - in);
-            in = comma + 1; /* skip the , */
-        } else {
-            value = g_strdup(in);
-            in = NULL;
-        }
-        QAPI_LIST_APPEND(tail, value);
-    }
-
-    return res;
-}
-
 void hmp_info_name(Monitor *mon, const QDict *qdict)
 {
     NameInfo *info;
@@ -1121,7 +1096,7 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict)
                                             migrate_announce_params());
 
     qapi_free_strList(params->interfaces);
-    params->interfaces = strList_from_comma_list(interfaces_str);
+    params->interfaces = strList_from_string(interfaces_str, ',');
     params->has_interfaces = params->interfaces != NULL;
     params->id = g_strdup(id);
     params->has_id = !!params->id;
@@ -2399,7 +2374,7 @@ static StatsFilter *stats_filter(StatsTarget target, const char *names,
             request->provider = provider_idx;
             if (names && !g_str_equal(names, "*")) {
                 request->has_names = true;
-                request->names = strList_from_comma_list(names);
+                request->names = strList_from_string(names, ',');
             }
             QAPI_LIST_PREPEND(request_list, request);
         }
diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
index 63596e11c5..9672ac6018 100644
--- a/qapi/qapi-util.c
+++ b/qapi/qapi-util.c
@@ -152,3 +152,38 @@ int parse_qapi_name(const char *str, bool complete)
     }
     return p - str;
 }
+
+/*
+ * Produce a strList from a delimiter separated list.
+ * A NULL or empty input string return NULL.
+ */
+strList *strList_from_string(const char *in, char c)
+{
+    strList *res = NULL;
+    strList **tail = &res;
+
+    while (in && in[0]) {
+        char *ch = strchr(in, c);
+        char *value;
+
+        if (ch) {
+            value = g_strndup(in, ch - in);
+            in = ch + 1; /* skip the , */
+        } else {
+            value = g_strdup(in);
+            in = NULL;
+        }
+        QAPI_LIST_APPEND(tail, value);
+    }
+
+    return res;
+}
+
+int qemu_string_count_delim(const char *str, char delim)
+{
+    int count = 0;
+    for (int i = 0; i < strlen(str); i++) {
+        count += (str[i] == delim);
+    }
+    return count;
+}
-- 
2.22.3


