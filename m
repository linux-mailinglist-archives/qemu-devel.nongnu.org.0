Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6051E4B6329
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 06:54:01 +0100 (CET)
Received: from localhost ([::1]:57302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJqml-0002Nx-UM
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 00:53:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rohit.kumar3@nutanix.com>)
 id 1nJql4-0001EM-NM
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 00:52:15 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:30544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rohit.kumar3@nutanix.com>)
 id 1nJql2-0000LI-26
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 00:52:14 -0500
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21EL5nkv014924;
 Mon, 14 Feb 2022 21:52:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=FhbmJmyre1rw9BjP+eaHpK0FlD/S3S1rRIjiehWzpak=;
 b=SCPdrisYqK3q9BQZYPBBai6VMEd7FSPV06HgjSgadfb6MIDR6e2iKkPNyUFA1COo6d/+
 t516ZhzQgPtPueMJ4yxdWIv7v/OjiUH+Re8d1lU2Yxh7FFqp5FAq17UiZ0Cj2DBvoF1D
 IH5LnRu1pHJyrk9D7TL8DF4Q6+b3UXhWoHgUXIf0re1hcQM+gt0eclDAfdwtNFN9TULO
 EuHsBLnB215+OUiqItGMapwHgmgmssp0Ue/Xp4vPs55vchxg6BcnRadq55IFZzfJVX5z
 2W9earkOzJIKAnhkD+Z7iUj6B8Kmynrd/ljEK/1nrkA7ps8/3hnSAwqdPenDPZj4XcqK bA== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3e7rgesmg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 21:52:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/4I5OC+SpWhf2bUUWGSLiXdJDB5/GsOJW0Q2AN11NTLJ86vWTAJlqhp/R5xKLh2WY3LCc6WM3uqJTpOBD5ZCm7OXEfT09Gz1RLqHfC89+UXEB3vr2l/etZFFpGQP9zLX9tC5PFWO3e+ah888e7z2pmbjzZsKgpPBJfm+RYzJTjBndE942mNW9asdR2UFCFvtQZEr0ZSPQIih3GMet7yZVr0E5RDNl8dFbHOssoN1ZrrmupWDVR4VrZHA8MMagcWRTwS9Feyy2RC38KxaaQqBl1mSSc8A+SX/CNTO0uzo3xxg65X5BQSYVjPJAQMlRufrk5rGZixjcuH1KDeaCpt0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhbmJmyre1rw9BjP+eaHpK0FlD/S3S1rRIjiehWzpak=;
 b=QdyMJLBoaH3VRPhEPjHlVjBQ7BfpTJSAU5uDo7/sPiUs+MyYy+EVAa7j+mqGJ2GCWhjczjDAx81onPShU9IX+qigwN6QX7SiJ2DyjDExXR+0chCCGckEfJMRVzqQm88kixGFNJmSs2eHLDJfnVyAjsPsFj034hOIdgYs1dqr0S81ucHlMrl/jZuvNY7qaPw1Me6ltLrC60bZFWt0DjF2d/i6M5F98mGaR9DlAdCGOeWhqYdJYfMUPxA7TAZCVOgL4InzwKLhHhRlZQumlwp8jF6kh1T3/qU4q8A0Ogz6y+1mdAQYzu7lauwoleQ5R2d8Uj5aPbRNX6L2DXHOIo0HAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SJ0PR02MB8564.namprd02.prod.outlook.com (2603:10b6:a03:3f6::16)
 by BYAPR02MB4135.namprd02.prod.outlook.com (2603:10b6:a03::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.15; Tue, 15 Feb 2022 05:52:03 +0000
Received: from SJ0PR02MB8564.namprd02.prod.outlook.com
 ([fe80::f58f:2ec1:820b:19f1]) by SJ0PR02MB8564.namprd02.prod.outlook.com
 ([fe80::f58f:2ec1:820b:19f1%3]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 05:52:03 +0000
From: Rohit Kumar <rohit.kumar3@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] Check and report for incomplete 'global' option format
Date: Mon, 14 Feb 2022 21:51:38 -0800
Message-Id: <20220215055138.267904-1-rohit.kumar3@nutanix.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0008.namprd08.prod.outlook.com
 (2603:10b6:a03:100::21) To SJ0PR02MB8564.namprd02.prod.outlook.com
 (2603:10b6:a03:3f6::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c52feb24-dd5c-47cf-4447-08d9f0474a2b
X-MS-TrafficTypeDiagnostic: BYAPR02MB4135:EE_
X-Microsoft-Antispam-PRVS: <BYAPR02MB413517EF56C9EDA252A4B3F6D1349@BYAPR02MB4135.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Oob-TLC-OOBClassifiers: OLM:513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: quAEpSNiKCK1eYjYksb6t5ZPo+sjAcBBbio5yZhsvpjkKXId6xspxLVys7KadwTnntSloiDaqu5H9xgWLyxiOFQzgCrGh1grejRowD/B3CIBMxviVo/l3fxt75vQCnw2VJRRygFczoZs3IJsmLXiyOivXJgLYCDcusk9yYr9tD5MW5wyxs9o3vhJZPNh3l/FvcmxJT9oKNFmyBTfwsNPZajUw64o+damc5h2tflROO6a0qK19YFXGHeDddthu6Kuuyp2zeBc2/8m79bU5ONdqyuOBduD4Aq9zIXtgQMyVbTMoWucCWgBGfJtiwRjqv361+NL4fSzud46KD7lZtEq6j4WYyh0PccIGLppiqvUU95vax8zYSewsrmHDA47MufqJ2WGNdsL2Tqlg0lNMqf5hG90Sgh52WESk8sesrSPtEmU4jfvRTKMgTBj7frhcDlpyUQFKl8xuNltu84f1xbW1RgpZB2XKBva6nlLKjQZkuTrJQbHXCih3mejs1mmNoqmZL3GGd/yqalFtoLIicW9R7GOVYwELNI57EXGC3K0HVLzVJimeooYNHjjGowe4oxUZfPBKEsi6Af2njPbQS5p3L+UDQqBMF7gILDiJK2ex6U7ZTDxJo41d6cUYNtAUNIWtcvUtZAQwgK1AB3H1GVOWSXWE6MZZKpEiPA4pl+AeYzPC+VBRtIsqmq8Ow5T2Mw3WgXIIw3kSKDFG331IW+Tbww9gMH5xYHmRGmlzCdcWjxuB24wEQmSn6K3cV0gUQAvsQJKn2uPFBWVgetjdemJUuH2q/ZcwFkCm9dI4Nu8ekg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB8564.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66476007)(966005)(4326008)(508600001)(6506007)(186003)(26005)(316002)(66556008)(6486002)(66946007)(8676002)(6916009)(2906002)(36756003)(86362001)(6512007)(1076003)(107886003)(2616005)(83380400001)(5660300002)(38100700002)(38350700002)(52116002)(6666004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6DLiYOpl0Kr5ctmwfwBofUZiBzsKZmNPACJs4drd/sUhot1mES35nfrfv1XZ?=
 =?us-ascii?Q?MIj9fLa0+WisRMMOUjnVYmMwvcmVSOJ/p8R3djZe27LwNZbMAXtUbEXkTJDX?=
 =?us-ascii?Q?PAsxFp2Py4xFeJNyWF4XkaNFTon5mpEsEcI0CCHxicMhg7wNA2ckKDAWpJBw?=
 =?us-ascii?Q?USrkF1UCfwooqwolW/sd3SHXyconm0HP5gmiMN22c6uscCtJ9dVQYOyMkMMn?=
 =?us-ascii?Q?n1cm+BK4o/DCkljK1JVuetUSC5FHGJn+J2Fy9xaM9jx2PEkssOqWh50nb25l?=
 =?us-ascii?Q?sqOgQZ/m85xh5BK1xVKVBIkeqtHIJ/pYsQ/zXxhG6HFLOVduP5OmfUkXqbFb?=
 =?us-ascii?Q?5MTmcz/uMF/01K8Dyihd1F85y48jcP3UUoQ+H/+Iebfa0eXerxDt61FPki0r?=
 =?us-ascii?Q?dA2OO4soahEMwSR1V6l4ZiXKzLhFeUqRIjZZMTj/z0dUcjW+dRD6XIY+KH0F?=
 =?us-ascii?Q?ll/blaI2UFjc/XNSilksmlQ61AgDX0Q2CWutebpe9N/dckMJ7DPnofmRhmeY?=
 =?us-ascii?Q?AGi7Azk6/ECKHRzmKAv45coEHsiKTRDqRUT/XMId00orEgCyI9wLBNrJkBVq?=
 =?us-ascii?Q?xrLekjgcoVr417l4w2NTqtoBYurlMRk97deDXWC6klRhBHHEKUft60fJ2ee/?=
 =?us-ascii?Q?KwfkXyhE90sKQbYNNsNJK0u3SQqVDCn4r1KGk1CKPbUbZiYXcLa/ANdRSfiL?=
 =?us-ascii?Q?CshUSy9aW/vLJ8H72XV5MZwEUc++1hPl1sJsHsN+O+gv2ZXlPSMQxnG0S+ai?=
 =?us-ascii?Q?wna3/54d6JsrW8eqaopwJZuneD15DtomLr9IC2afAXdlHzBnPhdOekQhPDus?=
 =?us-ascii?Q?SR0hAwVti6wZEVEtasFs75Ob/bgXc1T99We5yE6oBOwexzwl08HWeXkOID1e?=
 =?us-ascii?Q?Sm9QG8v3IqFqhgOwofHHO0YYfuvRm7v9MVLsIV74xxtxgMMclECbQqKsheXY?=
 =?us-ascii?Q?RP0p7Yxzqj1eKiabn3kmzax5q11WR8Ri4UA5LS4J6/Qvm9LCpB8dFl5E9mpD?=
 =?us-ascii?Q?nrjSR7Y9Hc8K9IpGqlzvVNNzIJQV4k9M9McLLHui6AbG9V7SFQm6Grv8nGwl?=
 =?us-ascii?Q?xoM2qUxmZwnmyj+wvIMSjDpinHjUgaPpavrGixMxGON/lxO6NHQDux47vTnY?=
 =?us-ascii?Q?fxWXG1IyxK4ILtlZSlj7EudtbHcSMRlCU7lv/RtqyC6r1jgwCqmvRY5hZ+/6?=
 =?us-ascii?Q?rI73kqpd83IU8mKcoZHdIFAoQAd/4aX58PE6Ftg8Bk0Xc0YmGGKHbL/AdjZH?=
 =?us-ascii?Q?USG4WGrPsDG3FGcsl9AhbkYHx+Eu5JX7ZD7ao5KKffqWjgY+NCvuhzC+I8Ig?=
 =?us-ascii?Q?HMSaKdhk+b5METMIlw3CWRN8k1WnVVYhvjlxjhe9n+d7lgWs9P4aaK9teiI6?=
 =?us-ascii?Q?r9knI5XrJWbAtdgOyd24zvev0tulZm8WTojNFSpf2zc9JscfcZG4DODxFagb?=
 =?us-ascii?Q?Su+dqg+g6cgIzyYNsyOaW5Jaj65+BgWvkzSWF3SWqNGqSUsKz4u9RB/YbGoh?=
 =?us-ascii?Q?JoevxGqXXK7ObRTp9dlwe6cwdPK3G87v9/dODbVU7Oen9qVwDcijfb3h4uw6?=
 =?us-ascii?Q?X97yeuKeA8AqDQBih3umSvnMsbG9CkBmn78eib6Z+sF1WvByADE+y97dtSKd?=
 =?us-ascii?Q?xYCZlqdJti6kD9Xnn0sAjCkg50pzlaZYAR5aD1KDPSJolR6JcVJFb4bhO2UG?=
 =?us-ascii?Q?3x+wqPQlzp1/52ljMlVQ06HVfhI=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c52feb24-dd5c-47cf-4447-08d9f0474a2b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB8564.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 05:52:02.9204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uqqpq4dfch7HV1CxXhV9UfNeODgdNUiJhf+oSKx115KrXVbKqe9RPN3c7qpqncvoDZt3cmz+JBhx6YV82IqFx73Xy15VZ+PQ3GZqWJYzGTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4135
X-Proofpoint-GUID: WNjeRu6vaG7DRW11VUcFt1dRHvT_Xg-C
X-Proofpoint-ORIG-GUID: WNjeRu6vaG7DRW11VUcFt1dRHvT_Xg-C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_02,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=rohit.kumar3@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: eduardo@habkost.net, thuth@redhat.com, berrange@redhat.com,
 prerna.saxena@nutanix.com, armbru@redhat.com, prachatos.mitra@nutanix.com,
 pbonzini@redhat.com, Rohit Kumar <rohit.kumar3@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Qemu might crash when provided incomplete '-global' option.
For example:
        qemu-system-x86_64 -global driver=isa-fdc
        qemu-system-x86_64: ../../devel/qemu/qapi/string-input-visitor.c:394:
        string_input_visitor_new: Assertion `str' failed.
        Aborted (core dumped)

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/604
Signed-off-by: Rohit Kumar <rohit.kumar3@nutanix.com>
---
 diff to v1:
  - Removed '\n' from error log message.

 softmmu/qdev-monitor.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 01f3834db5..51b33caeca 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -1020,6 +1020,7 @@ int qemu_global_option(const char *str)
     char driver[64], property[64];
     QemuOpts *opts;
     int rc, offset;
+    Error *err = NULL;
 
     rc = sscanf(str, "%63[^.=].%63[^=]%n", driver, property, &offset);
     if (rc == 2 && str[offset] == '=') {
@@ -1031,7 +1032,12 @@ int qemu_global_option(const char *str)
     }
 
     opts = qemu_opts_parse_noisily(&qemu_global_opts, str, false);
-    if (!opts) {
+    if (!opts || !qemu_opt_get(opts, "driver") || !qemu_opt_get(opts,"property") ||
+    !qemu_opt_get(opts, "value")) {
+        error_setg(&err, "Invalid 'global' option format! "
+        "Use -global <driver>.<property>=<value> or "
+        "-global driver=driver,property=property,value=value");
+        error_report_err(err);
         return -1;
     }
 
-- 
2.25.1


