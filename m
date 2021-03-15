Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD4C33C629
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:53:42 +0100 (CET)
Received: from localhost ([::1]:52236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsLV-0007xQ-V9
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLs72-00045S-22
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:38:44 -0400
Received: from mail-eopbgr750120.outbound.protection.outlook.com
 ([40.107.75.120]:38565 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLs6x-0006Ga-IK
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:38:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VkjTFzNnZF21W1O7Z2onlEuO7uVVpOPstnlemrs1QgFXlnwlP8ERmXaDP8JN2Pm+jQF2ThjQDKf+gLjzPkprWIdr4bRyZc/cCpQ5f63vjWMhyiVFyFSYdeLgXjwkkjh9zfhhOjt+IqZxKNmy9XzXIFGMPbiYLxfxObAS7yZt9GAgcU9PFP/FqdHe9sNAeeXnpRzhCLp1NfhEB2h4CAVrRgxgnSP3VSYJ1P9h8o6D6igioeMZOJCwsZu89WcdHEWHQzRfLLha7qw2hZ6vWWisAXU6kQX1lgArop8ZeOoOVRGJZnPI0I/FyzSRL9o+bIk9AKg2p+vICE4uELwbA1W2dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIOIJJ90FFWucgFBtGGD0XhZLeaoWd+C1gtLLU1KofA=;
 b=PRSxp3cducI3DeR11fsXip8HyhS1aqWtSq5y7UtVomwMTmUcI/I3McxVjll7Q4gOSqGnD5n8dQdQzFL3Ozqv9QKEel5uXeFZVTqNPLgJ8sUIaP7vLD/KOSV56U+mOm5qOTm1wscSYvmukV1HoyFGlITLEsOI4VN47Ymy7BY1TF3L0zBzs1maQgaPg8NLjhzaQJ4YKbvBCBaa7Mg1e8PqweroGfE4Umk55iPyBhGZ8vDbY1ny1xzwg56sdmQO37bG6X2Dap6vorZ1NejLR4Pgzv9PRWMvke/RDzYbnWiC/3ocJxbEpM1lmPXGhqrR0ZcTLbgpeJhnpUXRymKsfAqD/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIOIJJ90FFWucgFBtGGD0XhZLeaoWd+C1gtLLU1KofA=;
 b=Fc0EFVmvD8cTCNZr5TqDUS+yUzny79mJiYd47M0P6QUBRdY2pX2/7av7FnnTPJRD48a5UPXJDosqzPmVcvLE0WygpHC3aq3R6QIvSFpEKSOCVeLd4oem7AKtf4VdOZ0QDvsinWOr8o1UZI0pTpirQJ9TZYqjH77G07oS2zC9P9E=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5724.namprd03.prod.outlook.com (2603:10b6:806:113::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 15 Mar
 2021 18:38:30 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 18:38:30 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 08/11] fuzz: add a am53c974 generic-fuzzer config
Date: Mon, 15 Mar 2021 14:38:09 -0400
Message-Id: <20210315183812.27760-9-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210315183812.27760-1-alxndr@bu.edu>
References: <20210315183812.27760-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [128.197.127.33]
X-ClientProxiedBy: BL1PR13CA0323.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::28) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mozz.bu.edu (128.197.127.33) by
 BL1PR13CA0323.namprd13.prod.outlook.com (2603:10b6:208:2c1::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.11 via Frontend
 Transport; Mon, 15 Mar 2021 18:38:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e05af2f4-0be8-434a-a158-08d8e7e18764
X-MS-TrafficTypeDiagnostic: SA2PR03MB5724:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB57244D050881B1351A952187BA6C9@SA2PR03MB5724.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:389;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /+9JD7pcAk7mPAfPmEYtA2/49tcQPcAEQxxBJA03GZ00SpWldZm9rvpUAIvYKWId4ZZZK89lF+kyR8uRW2GV6UQ0+iox/w/KjAqwNhA5uM3hNcmhEdiT2HTgKPI/BnNwYtI47b1EPIKbFhicOfU9driSiwg15kQ4OUGf80G/V3PVI3kkvndb0UWmcyF3W0i/Koi1ovJEne7j1HbyIbtqTjc6JLrhm0dJNGcIDAsWRUBqDLE6MfRdTOTMpqJ8LDMmJ47qz9O8I2ijNOgFcTABU2vQ5w8iIBcA+oj1N0lHSpo4xjDatZuluu73pa65gvYopI53tgU61+dUm+N/yeI+sepPh4mRxuboSD9V03RpDzsphUMHXPvVzZvmaTxfFSLe+1RLSuRx/j8wNwahcVQbQKv6+18btX1V7EIgatzOtyw5P5h4jgcUUdZVzhomZxhnmlNSE5dsQG4J+16nL6dBh3fXWvBg73ABsaCm8E8sOdeAY+7VfvENDBvZo7UbulQQWKie3CIDBUq5rs2yD4pt0mzHbbaVmp0NtqNSTGKk+RVwb8tnweYqkAL+tEvXEAvJzJtaiubu+wzaEWyhG7VTBHXghPGiGHoVpo4SlUnYqb0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(4326008)(7696005)(36756003)(52116002)(83380400001)(6916009)(6666004)(6486002)(86362001)(4744005)(8936002)(66556008)(956004)(2616005)(54906003)(786003)(2906002)(16526019)(186003)(5660300002)(8676002)(75432002)(26005)(66476007)(478600001)(316002)(1076003)(66946007)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?u3szfNMFHAVfZWo2EZwR27oowH0DKJSnN7AtvsBiRaSGbI9hj8xASaramhmd?=
 =?us-ascii?Q?xSGq8pZd7w1pTKZ33ZslHCONhZkA7WELZOoj/M+TnkOlFYnjz/r7os3p1Xy2?=
 =?us-ascii?Q?NQIUWE63fEGQW4Ru09snmtdylsvFlQa7qWslHp0hyVQbLnyJ1dv184Rk9HXj?=
 =?us-ascii?Q?9NNo+jrA1/pi8v8YDlT0dZU+56PPV0wXxokeUAaZCcmisftBjAa/qA0N0eyV?=
 =?us-ascii?Q?3hO8RyaoHYhe6D7HpQmdK7yGCxB7Mxk/u9elv9oJhcDGn98bLj+QKXMV+/ff?=
 =?us-ascii?Q?GPaCF/+X8AEEJRIImrtMHDxtOD3XlOh7QLTW81E7adEZWo8UzxNS2ZBvdLIa?=
 =?us-ascii?Q?TgO6r71R6cu+0L93X8735PZf7vFRMXWg0lmh+Fwj5RrRmfd2OR4DleN3Nvvn?=
 =?us-ascii?Q?2wiY0qDUr/UOgMht2mOw/qhvXKCNmvlgUA71l9HOoMvw1UXk71qm6wug6dCC?=
 =?us-ascii?Q?UL9s+tIEEkdLC2m05chyDwH6A4bWKWhG5xldf9Zy0DZl/loOlFeEoewBYcYq?=
 =?us-ascii?Q?sIqtrOlW4aVD27zegx50ufkZgEF+Dph+P5g1XUik0W99k4WX7eUjp9NnMaaA?=
 =?us-ascii?Q?Qd1rRdms3PQQ7ZAYy/q9Jgpw5bj36d6GXvQdQw09/mP+Gt7c9whYOCPyqRfJ?=
 =?us-ascii?Q?ItCVEd+xkrz1L33bYNe2CUw0TZ9yGIzVdZJxz/LTD/vozmw8ZfVaJauYScPV?=
 =?us-ascii?Q?+vT7EiiZ0JShJwlUKAdyRR2ixWC/IyuNAuXHqKcbsaG9IpvPCV1EVLmg8aNT?=
 =?us-ascii?Q?GeEnweFs20MzP26ucofPVbCWRAeknvF3oPaZCZJ6EpwKOqQiN7pTUAocJPS/?=
 =?us-ascii?Q?NleS13F35wUm0IbMue7Ilyv+aN98ofwyhxDOT5k3mwZV1xfVJWyhbJjgfa9h?=
 =?us-ascii?Q?8/njJcd+J7BIu1ulVN2I5NVIDepe4q55XfmoywbcnJgPabFxsB7k5HRcr1bJ?=
 =?us-ascii?Q?ZBILXAQwek1SrPzr+6XeqCiuVZGC2Dyx9wAGNUK+14enV3ptQ6YNOTEn1hMl?=
 =?us-ascii?Q?VyBrYc2SUjdqX2s4AlNuF7d9JGFjTpXtyixB0oQz+aboi9aQiCiqiTHxDBHN?=
 =?us-ascii?Q?5Y6/+azkjJQ2MMxIItQewbLYzglCfrUL+ZpwPeI+7Gd5zNMtUX4fdHdFCCli?=
 =?us-ascii?Q?KziH44FeU4U6yOqfdgn62VERqVdEHXWh0aZzqV4R3SaAdQTUHdYe2p3V6s2A?=
 =?us-ascii?Q?OTyubDGoMH3K8y3kREZOGHYUgZOghXFNiy2fc/6LaOiPAvrbwadGazUk1VRm?=
 =?us-ascii?Q?/huOdDqKe0GS1ZGcO+wswtOP38XqYoz/3hzpWi/XqunkW6MCc5ZGF+aBBz3L?=
 =?us-ascii?Q?3XmJ3wQ4UET1FZr11yUz/3Zf?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: e05af2f4-0be8-434a-a158-08d8e7e18764
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 18:38:30.0070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lgPGZJJYrnSTQtLFz7YQuhnGTQgrLzqYAJGXVBDLh0DaocehUvK/7mMnzKULZr5R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5724
Received-SPF: pass client-ip=40.107.75.120; envelope-from=alxndr@bu.edu;
 helo=NAM02-BL2-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 tests/qtest/fuzz/generic_fuzz_configs.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 2454c627ff..8b8c7ac553 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -208,6 +208,12 @@ const generic_fuzz_config predefined_configs[] = {
         .args = "-machine q35 -nodefaults -device megasas -device scsi-cd,drive=null0 "
         "-blockdev driver=null-co,read-zeroes=on,node-name=null0",
         .objects = "megasas*",
+    },{
+        .name = "am53c974",
+        .args = "-device am53c974,id=scsi -device scsi-hd,drive=disk0 "
+                 "-drive id=disk0,if=none,file=null-co://,format=raw "
+                 "-nodefaults",
+        .objects = "*esp* *scsi* *am53c974*",
     },{
         .name = "ac97",
         .args = "-machine q35 -nodefaults "
-- 
2.27.0


