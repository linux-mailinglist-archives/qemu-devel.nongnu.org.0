Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20753ACF7D
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 17:53:34 +0200 (CEST)
Received: from localhost ([::1]:58670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luGoH-0000yy-KA
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 11:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1luGkD-00019g-RA
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:49:21 -0400
Received: from mail-bn8nam11on2115.outbound.protection.outlook.com
 ([40.107.236.115]:23557 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1luGkC-0004iY-CJ
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:49:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9yFEUgp3eB754Aau/AB9Y3wCx49Z/xaBiR7XbTrBtDlDLdWG6k3/3ZqVFzBeHEXKOmPpFdL98Bj+CsLVVNK4Y+e9v4KsznTko4jvu85nzi4REQimyrZYzQ4fRkrwYgaPrLqPSu54YpV89uKcx19vwVy0Y4Xc6kDxKX2sPE/JScAZ4H41KIfPtP8b7tkHtKPR3IGAW5fll8cbd1HzswU7PcvNHT2wSnmxOmsEe8Rc23l82LyPsIwM15N/q7udrMnu1210UzxOEEZadWM9z5JF8DD4OT4RzYw7mP+DNLfH8jMb/bce5V9tWJVBZEGmbFdRjCkTW/m9iCDjS8MaX1Rww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiGyNRA0plTpVD4IwYeevHK9XbHuuwfi5W2tkrB9Bys=;
 b=Xxgld8IcrwXwZ4p2otz5Es8NqSKgF98BfMxFa73SK0/8C31mLQWiUGnDNrRSbuYbQ3J1sBfEdBdZcD6id5O0CGI9iKrXXOtegDZ2Jf72CuG+1UywPHkl59//bMGa04JxR+XV42l8RvTEywdnXsb5cVZwwr0BDHra8bUGvvf9Qvt0RYJ0w63zVIITEpb6MMclGWT3Wrjlj7jM37eiDdLUhLfw34A6ALT5QHy7iWAvF1a/boJItRyuk1CjMVwbaoNjPdTwHnYHiDszyBM4Ny1XaLLy8CECH5qQGDqjIS20Zu5SOIawiYjeoaP6+dnR0+9NuUyeSK9UAJSjjFdupkOpIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiGyNRA0plTpVD4IwYeevHK9XbHuuwfi5W2tkrB9Bys=;
 b=QnqEZnPmbaUkWyW1uWiIMUHwW5lCcbvf9bFz6HBcb0Ml1qE9qDgKe26CQT8aaZ5C+mWrr8RSR5FyfF1w47cwf0pRTdgK/95Olod68wlwkCq4QND7HUUI5/r5VXLM8iY9N49oSHg71+7mi5J8HQ2FLKjOXOHCMSoEa87lETWVyVY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5769.namprd03.prod.outlook.com (2603:10b6:806:11b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Fri, 18 Jun
 2021 15:49:06 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 15:49:06 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] fuzz: fix the AC97 generic-fuzzer config.
Date: Fri, 18 Jun 2021 11:48:51 -0400
Message-Id: <20210618154852.5673-4-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210618154852.5673-1-alxndr@bu.edu>
References: <20210618154852.5673-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR20CA0006.namprd20.prod.outlook.com
 (2603:10b6:208:e8::19) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR20CA0006.namprd20.prod.outlook.com (2603:10b6:208:e8::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.15 via Frontend Transport; Fri, 18 Jun 2021 15:49:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7520afb-75c9-4b92-c70f-08d932709ae3
X-MS-TrafficTypeDiagnostic: SA2PR03MB5769:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB576928B1096D4BE4CB5073A6BA0D9@SA2PR03MB5769.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2JunUEfK1iDfzO8jXqN4YtuykQTnkM6pnC0KG1Tcs2NLt8xQoOwHK9ToNBTiv8Rpon2QuSsMtOjrRkA6TxuD9urDmHyCJhv2N9+ltEupxNamJVr1PerjZIlIyuY109j79Gpqt4Anva5PDFJLblSYIdOr2h70bFkWZrA3O9qi3h9T6qJKl0b3LJ87o4KYC1DP54BiG1zHoc7z8BZkdjIGezosZRinhRbyvCnQwCohQ+Js7tf2hmMuJQOyZblMXvjB5h0EK8Swe7RWbUdy5jQWl2ZB2rPvtv5QEZsmVjdS3hRKNCQlH/S2bgPXTt/+jP0hJuFommC0pCdSbg1Hu01aws6Mnv99ILQGBw3b67ZPzSzobILwd1ExhBQn6ll3rFqII8Wa8wOWBLAzf2uGy8j2NPqcQn7rLwLuBKPmVWirQo6cVANJVuyZlxtJ7vvNveJ590vqD8/jmpXsztSq/RAr/7VhxknFEyOjlcqOc7Og8OQCyt0c9KzVwXSeqXUibDmMYYEdYChdmG9LrUlyuHyZcbIdy5G2nx1VjHlI9p8U9cEGotv5N5XG0XuqqOgCbRAm4Y9rFFj2teg7xCoLyjjf+51pU0gpsvN4R+tDteXeV7YO5Lu1ozd/A5SzUJWinJt1EF5o187nRqm1BefNGvLu6pPSxSQm+eVyEov60RIUr68=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(478600001)(66946007)(54906003)(66476007)(8676002)(2906002)(786003)(5660300002)(26005)(6666004)(1076003)(8936002)(6512007)(316002)(4326008)(75432002)(186003)(956004)(38350700002)(38100700002)(16526019)(2616005)(66556008)(4744005)(36756003)(83380400001)(6486002)(86362001)(6506007)(52116002)(6916009)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ymVR0EmX5OXHa1vYEhyLec4e6rj08oyYAU9CLFCN2z3fB7Q4zbnsEn+6jruI?=
 =?us-ascii?Q?K2ucWM74Emh4BCI5X/BmUCpkIe/xfugE+asxqPGq4f/nZO7CDGH5RK4/nPJA?=
 =?us-ascii?Q?k4Kziw5Wr+tPxRIDiK0AJrKEiVryJO9Fv4DyC9cDFttG5FldGEiO+3QKbuxJ?=
 =?us-ascii?Q?Zj5Gi0VF9eK0ccFVu8A/xDQrK56nArXLXeD2AKv9A51TBlXlLPLb1PBPcW5D?=
 =?us-ascii?Q?6FTq6gSUa4fdvrh3302zlkqecGXHpOJlH560yt1XPShgaAAfTdecQePw5dxm?=
 =?us-ascii?Q?G3fucPcLfSjk7OcwmNb+rTux21zExrQTehkJG76lnm98JgUKmXSYFjgZVECG?=
 =?us-ascii?Q?v0DZLlFuLxlkfPYk2MKOdP/m8Ypl0KHzstACwBCoErjd6w7K9zeKS9xJU5my?=
 =?us-ascii?Q?/TUSFrqBgbd5Afdrd83bH4qUaoVK/uGwfOBsMlecTZ5tW50WVFxSMZ4P2VEy?=
 =?us-ascii?Q?RBs1MhvzKr4bZ9+AHCxzrBBnw/oez1WTPC8scrYbYcbg48KRuc36tFqjGVWS?=
 =?us-ascii?Q?uNbMqvcrA3Er6gX9aN/84Pm6zKzETB2H40Qp1Hggo2MuuCKvjqTnxDktYOru?=
 =?us-ascii?Q?nP9RfBqMLqA3nYE5ii3EXunGnzcYBXVOlid+oOZzWymFgPtNriSEfgsiAEWE?=
 =?us-ascii?Q?XFEJ3OwUZUQCal3dfDhOZIOuhWRBQQoPCiIXhZoGZYtuxUUM7PAxdlnzDsP9?=
 =?us-ascii?Q?qtmz5P0EQ0RuBe72am4LziXK4Utqo5fb0jTThUO/6fpS5oP1N/wBFu9qfZKf?=
 =?us-ascii?Q?CMu+kK7AhLNxTiKPqL6UhClHy16RJQ89rAQPWJ7lOBCEtp0ZaSmpF++6DuAU?=
 =?us-ascii?Q?hX8kKdzWuwXf83ENNqEsXQbf7KrdacwaozPb3Ub7GaD4Fsp7aEC+89kGKrzx?=
 =?us-ascii?Q?WbqV4ShN6gVsJGyQk04lgxqZdsJxpmE8QdP8JwUYkaq0HJmDpo1t7C9KcU08?=
 =?us-ascii?Q?h2WYeaHr6MY0gDz8G9bg/G0/c2vpNt1T1fBcvtsBYnlplz1K7eqi9wQd2biI?=
 =?us-ascii?Q?fBk8qJ9pgFbigyveJdyDwvERbAbOzImqtUGD810SZ5vt/rOoKDFlnD1H6ioA?=
 =?us-ascii?Q?dnyPoyceBjjml0kDXWF4+FoPDPluIP3FZiHUqsAb1jeVOJA0XKWFp10xsPIk?=
 =?us-ascii?Q?3dyz66oDAUh1OEJBc82uKm+wcKLZE532zQ2qYLxrNEcVhMtyWgmoqgk7nLlx?=
 =?us-ascii?Q?ZMg8ZcoGkYNe+hbjLmi2d9uQLmo6M6bFMsAJQyGVkv+YvBiJstpwzQIXgcQV?=
 =?us-ascii?Q?JGAma3JYlsVY0LzFkKQYukVp4TjQ7T6+sU6qxtAz87hFI3NcsNDvGA9FwhTS?=
 =?us-ascii?Q?GEPugjaewEBkrM14UxBIKGw5?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: a7520afb-75c9-4b92-c70f-08d932709ae3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 15:49:06.7679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZ8c/hy53qQmCtFDmQj007TjYpaXDQE22pKjRzvWQNN8Z+6LPrAcDWK2j0RaHsWb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5769
Received-SPF: pass client-ip=40.107.236.115; envelope-from=alxndr@bu.edu;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
 f4bug@amsat.org, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TYPE_AC97 is "AC97", capitalized. Fix the config to account for that.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz_configs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 004c701915..049697b974 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -218,7 +218,7 @@ const generic_fuzz_config predefined_configs[] = {
         .name = "ac97",
         .args = "-machine q35 -nodefaults "
         "-device ac97,audiodev=snd0 -audiodev none,id=snd0 -nodefaults",
-        .objects = "ac97*",
+        .objects = "ac97* AC97",
     },{
         .name = "cs4231a",
         .args = "-machine q35 -nodefaults "
-- 
2.28.0


