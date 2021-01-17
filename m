Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE17D2F9620
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 00:12:24 +0100 (CET)
Received: from localhost ([::1]:35562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1HDb-0006tH-Fz
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 18:12:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l1HB0-0005bl-SM
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 18:09:43 -0500
Received: from mail-eopbgr760103.outbound.protection.outlook.com
 ([40.107.76.103]:12485 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l1HAy-0006XA-Ly
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 18:09:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QKVtX42kndsIDd292iYd/M0Kz7KmGeY0AOwZwzoq7pOvBwRmkd67EZqW8JlbScS0WnbZ69FbMQo3vievIkgbsZsuzxtIRBKDlRg53W0zAKS4W3rhQCmbL3eghDAayOrTphlC+44Hr2oN39OosEE+w//N1EuLx57F32zeKC+MOvFyswP81wP1z/EcYbN8dvt8fINCWqpa3Ykwn4H3Jx0Hd8RB0RbusSkR9NZUE1xtWg3ujuBjd7tzE3WsR8Keh0g9x7NImkebJrJlCWDSD94WdWGmNHrHvszTt2LnWCeEyLYR4msj/e+wb3QJKpsBLAKC3oH4tvfpPA7o/KRdsx75HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yV4TKGcPLanKeb4fTwUMfOkPp6T9m4MhqCmi9JfUf6c=;
 b=DWCo0qWaQM+D+/QIL7eUuxHsJF4BPae/OvZuKy3N7ofa60PdgSDbXY2L7iif4zkR80QMDg8+ezD5zi1QIZmAqbyhVY1DuvFS1pbxlI+PXJbvk0C/HLewEV7XX9riUcbGJ5N0yWTsOhXJ80SjE0kchqDvlV0WsoZ4gNtV1T9Dco1E02haqkNSqpM706jhF2OR3JCG0/mGd5XvEsXKLGhVYCOYVRFxW4wHobl/vlU9sVAJu1BAmFYPu0RMwwz820gFMo+JUQkku7A7SXYn2tekRXenLHCct39rQr+iGfI17sUoA1JHhrfo+u/S1xxh73RFZOpRzPbitEz2qYpIT1nUhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yV4TKGcPLanKeb4fTwUMfOkPp6T9m4MhqCmi9JfUf6c=;
 b=gnZTFLszvjWE72/lVDEbeVlp8vZyUOOItOj9ES6x9QYEMhMm1IIxueKMwGEM/TqEurLaZQVTiQbMi1cF3Lfm2YRU7vK2ldq0SVoq8DtDMW2Q/Q8VaPVfTyvHRU62G3iZiulmDNZdrft4k0ETqykNWN0VLrb82NI9qPR6+hlgvZo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN2PR03MB2208.namprd03.prod.outlook.com (2603:10b6:804:c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Sun, 17 Jan
 2021 23:09:36 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3763.014; Sun, 17 Jan 2021
 23:09:36 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] fuzz: enable dynamic args for generic-fuzz configs
Date: Sun, 17 Jan 2021 18:09:22 -0500
Message-Id: <20210117230924.449676-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210117230924.449676-1-alxndr@bu.edu>
References: <20210117230924.449676-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:c0::31) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR05CA0018.namprd05.prod.outlook.com (2603:10b6:208:c0::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.7 via Frontend Transport; Sun, 17 Jan 2021 23:09:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f9dd350-8067-4c3b-4ff6-08d8bb3cf53d
X-MS-TrafficTypeDiagnostic: SN2PR03MB2208:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN2PR03MB2208D2A78A3E4E35C039E13EBAA50@SN2PR03MB2208.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IEU2Gfsa8saienRcPuNfjdaXL7BlCMRsEXiLO3WSC23nywj/31wyyxl9D1vFNuCZzAuLW3+2UEzL7ZYuN+TmChD9Dwbe+tsHjBnuFqSCISqH4df9E/X2y95EQbyeb5ftXDOZ7S/hbEauA1I9EtTALaIM6URf5sxIjh6j/379quGMFy6XEptroxp8wqXQV8swzKg6tbxyesFVzc1dqLkW83IBHocK7nle19TdINP9Rr4rPWmxQzYV87rTozjaKbkvBSjdauahTjG5K8kcPibTSEsCRqrm1cvYDOGFDCtJgB6X/2bQc/f0cOgm2b31ZzrBBmcFlCeFtjmXkAukMlANd8xMQKBx0Ju81coDMDIE2UDlApZIk5nL00Ov+F6vdzwodmpL0sdokmsCUhIUkJ/RcW6wFdi9hi1DBXEZC+EzA+dQfOE9hjAMJMMtqn6gJsZw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(6916009)(8676002)(54906003)(86362001)(8936002)(1076003)(2906002)(6506007)(16526019)(786003)(6486002)(36756003)(316002)(83380400001)(52116002)(478600001)(186003)(75432002)(26005)(6512007)(66946007)(66476007)(6666004)(5660300002)(956004)(4326008)(2616005)(66556008)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?t98w981koSz3OOrXQKmG5DqxHaPTWVyPggSxkg3E/WFwDfVFBFsgOpfP4Bht?=
 =?us-ascii?Q?OqzJllc6OlTQbSV3ex6F+Fq86BIsw2sMVy9JOuWMVjyb5Rdnu7B6OcHcOsGV?=
 =?us-ascii?Q?ZIKgM/YqNrA/Ijeb/nD1bcUsLfEahxlzhY2v2v1bnxILyx9Mb+sZRTQL1Hcv?=
 =?us-ascii?Q?zooc+4FJo1WRg/Mml1ulVF2SDhxj/SlcAYOyPkD5qRKzFm+5wNEZlztFLlvg?=
 =?us-ascii?Q?VT0uRO4CsqNfjR6sS3k3BeGEzOchG8nyxNJa9KRbkrabdz7DRs/JNk12FJpa?=
 =?us-ascii?Q?sKIIkhkfGXCn3yQK1g2URp7hpngVPleQdB+d6aTgUPfnAMUAFt54mcEkvK8s?=
 =?us-ascii?Q?nAmmM7fJF2Iy/RhqypKM9yM9cZR6hcX0SzAHDqUfTw3ASCfCrJzGzFcjzN2D?=
 =?us-ascii?Q?DS5KE2pJOVAXU3H3bCLTk/vRAb/Plr8M5j+53Z1Bq9EP1X33Y9wkhmd39gQd?=
 =?us-ascii?Q?vvoSP5VDZZondYkMXUgy6ToYXsUaiODY/FI8CRXSo6iHvI3MOinN3TfT1Ie2?=
 =?us-ascii?Q?tvE+JA7FrexZlTVyxbqUOLANp05OH0KXpljdCl8CmGv9eAqN/T61axOcPrMt?=
 =?us-ascii?Q?/vdBCo53n+dqIcz41kNidkmD5CIOL1hkodYW7mWtSOTOo+ts892zkzpUVPah?=
 =?us-ascii?Q?ozmsz/1MaFLlQDW/cn6bnfUBSsq/c42I87sm85w1fArC4EUrLW2GNcsGRyEq?=
 =?us-ascii?Q?H9sbGhogj/NuUwmjE2857P5b1wCZrkLIRrV1CekU2k6PFV/DjTR5nifVWfvh?=
 =?us-ascii?Q?0lfGsJBGI3pZsC+QzJ2nLWCnOD+Ggupfe8pddmIEXjPbieZZApNfw3tPKlh6?=
 =?us-ascii?Q?fDc3h6XbTNyqjzsIanC05ToEkUCYaQqPsaukX0OeV/HC3hNHaR5wjIp44L8b?=
 =?us-ascii?Q?eEF0/xatS9xAGajBLZVKZgqcV2wCX4UZ1Qxdl+PdCTRaEdEiUGF292GZCei2?=
 =?us-ascii?Q?pcnSMhuw7aX0au0gpYvskUsxdLIB9Lx2pSXADJbAdfX3AzADPTWq55eVIpxC?=
 =?us-ascii?Q?Bpas?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9dd350-8067-4c3b-4ff6-08d8bb3cf53d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2021 23:09:36.1754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j94HQAoOfdTwTPq9HoMZTomSxXddSJY2Xi36Pi01PSD+4X+0wWuLtkhxrpLXbCEl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2208
Received-SPF: pass client-ip=40.107.76.103; envelope-from=alxndr@bu.edu;
 helo=NAM02-CY1-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
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
---
 tests/qtest/fuzz/generic_fuzz.c         | 10 +++++++++-
 tests/qtest/fuzz/generic_fuzz_configs.h |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index be76d47d2d..6adf62a5be 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -936,12 +936,20 @@ static GString *generic_fuzz_cmdline(FuzzTarget *t)
 
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
index 7fed035345..1a133655ee 100644
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


