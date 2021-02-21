Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E2E3207DB
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 01:48:39 +0100 (CET)
Received: from localhost ([::1]:54502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDcvN-0001F7-J2
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 19:48:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lDcuR-0000UC-QG
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 19:47:40 -0500
Received: from mail-bn8nam12on2099.outbound.protection.outlook.com
 ([40.107.237.99]:13344 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lDcuP-00018D-Gw
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 19:47:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLYH20+zblfVfFoRiSSeKSGKNzREYMT0Uar/Pcb2hVoah+y8CgDeXJt1w1wlfvm1xrE8ngxkGGvopFaqT/bv45C8ikEcZWjAX289WTKUQ2wlHfQBI6cwFCY5GzvuQcfxeen7XPJtDs+QFXNNQtgd7bhh9/XnZgTN6kIYsF3iIYHklADy9KLvd4WNqzY2Ic4ySeUnePJaPSu1lGUTd2Noo+WklypK58zwqEuXXyoO4IymDMZSdTus4sKTp7nANnVPNy324uKj1Rx/dm5muXXcOaByvjs1JPJ8zFL5hpodP/gNkxL//YL00tpvPfd+PYv/beOnk+N9uykz+fC5C6xUVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ceuLqCvTfoz5eLfWz0bH+v4PO3LW+jEO+NLxUjHZAzk=;
 b=CendOALcIYVlON1+9xLjUvzBvqpXYP9tLFcen1XlTTTtFDair9v5N5alA2/lrM7qdTV8Mj1F5FugGjmhZlc5mH83mwFrVjmXeqz6KJv4NBX0Kx/3hX3KWeMRweRFTJfJ7I3BjooKBxlNuoDU/XE0K2O404y4CJc6gimm7Nb8avLcTkVqiRuIO6cCA0u4Djx5YWX1XA/FS71op2AX5JDJPrk0hsKYtIk+RU4B/mysouHdFa1C5C6q4MrxJ6XQY+Mf8bC0uWuJxFqHNJXfSKYK2cyWlgdL9+tsQyAey8gBX40UQG3m9fnzYhd0qlHEh7v1sgP57fTmKk+Mx2bQQQQQpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ceuLqCvTfoz5eLfWz0bH+v4PO3LW+jEO+NLxUjHZAzk=;
 b=Qv6FG05YT0mMdNCePA5HDcRSB29qTCskSt6hTssZ0CWrcMJN8JgojhkMq9mw3MrExNxAZXtaf2Ikt4ge69LoHD01H44Y4rme62YeNp3SfcNluh0zRhRnj3vEeLGRpbsy2gFn1geV6ZdH6S8jeuqnBBB2VJ+XhZJ7ZHCrGiFPcoo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4173.namprd03.prod.outlook.com (2603:10b6:805:c2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.31; Sun, 21 Feb
 2021 00:47:29 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::1ed:b27e:19a1:5bfc]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::1ed:b27e:19a1:5bfc%4]) with mapi id 15.20.3868.031; Sun, 21 Feb 2021
 00:47:29 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH] fuzz: fix the pro100 generic-fuzzer config
Date: Sat, 20 Feb 2021 19:47:17 -0500
Message-Id: <20210221004717.426903-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL1PR13CA0426.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::11) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL1PR13CA0426.namprd13.prod.outlook.com (2603:10b6:208:2c3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.9 via Frontend
 Transport; Sun, 21 Feb 2021 00:47:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35d3cbf2-d8c7-41c3-f0cf-08d8d6024402
X-MS-TrafficTypeDiagnostic: SN6PR03MB4173:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4173F2B7D217FFC2541CF9CCBA829@SN6PR03MB4173.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 54Gg9aua7HEZBOTtl3QjbWqwLx6xpfTQKssAJ4iSKwZ7mI8GkD7YTanBRxPJJdW6XExpfb9KtpHrrgDPx5wpCffPbNMNBuztVjo1ZGvhNS2XlcFsBFvDTT+5DZ8jaZZtsKWiaOQS7MUaQDq/gdt/VmaGku6TDoqvpZGhQebgLx96sq42lA+KNDZCtgRudK9Pggo6n3qfOxPWZYlA2ssf8liWwouqqXzDuPwIfZ8GaCxr7Hd9Z9Od9jsCmT9IKQFhgv8rtezOe48dVcLyGBUXeWqmkSPnNX3Hq/txU/Kxzfh33ujZVyG9mc+pCLDsSnJ8Mg9dCptbIUG3p/fBvmYC4nFXOFUf4SSKVeMmN4lfg37amaCKZlbMYn1J8NLlQ/i109c14aO5jGBUshHhIvxXRHo81I2QkrJOT6+dK53qAh58mfocgGQQrKj3+I3wTFhpu8a06bsoVXnqYWJBzNQWbzBxOvKzzyC2cSET9Yd3iiEboEPNUAfu17NU6AymnfeTgq/MoKEHkPJqNeL2cgrIoRcYTOAEbdS9mtH4aHmwgA2p4I+ilj857dOfLd5IJyvi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(66556008)(66946007)(6512007)(66476007)(75432002)(6486002)(478600001)(1076003)(4744005)(52116002)(6506007)(5660300002)(2906002)(316002)(2616005)(83380400001)(8936002)(6666004)(54906003)(86362001)(786003)(16526019)(956004)(36756003)(186003)(4326008)(6916009)(8676002)(26005)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?dWZhsB8oWzPrAucZybuTjQ4EYzKv6f5wSXvxl4f5wuh3L/5TBqtvyEj24bOD?=
 =?us-ascii?Q?eYKgAlF1lDdpIxNlIGDKMQ1GSptONAYSFVVIBqndTTB64+05eYAEr3hevowL?=
 =?us-ascii?Q?g8xN+Vp76dbR3ZqyS+aOa8+Uhz/8T+MmymcYpjT8veWuI2BJTy43jn7FYp9X?=
 =?us-ascii?Q?cPhKtrvNJ5+eDxtdN9OQlBSXwYepI0fCXKUbU9yQiaq7crBqZdu/NZIv7LXg?=
 =?us-ascii?Q?FFfVocaG6NYUUGBHfu0ljJZAqRFQe53UjqljzSU1x969HnFeXDcJSiCo/dms?=
 =?us-ascii?Q?cTdWqeVjJNj6jz+uGlkwU/mCBHtMqblVkAb3L9hIY3gG7FFP86EyhkLMq70w?=
 =?us-ascii?Q?eQlhj2vn+n/qZPtf8cX1XHDG4tl5jBTwHofz6w1oXDGVtS6miO+pATWNxNj3?=
 =?us-ascii?Q?WbzHtG2c04kuyO+Mkx4VZqFBy7z4fZUNa7tyLbbmSmBgrti1dORmx/PF0TeP?=
 =?us-ascii?Q?mIsnQe+TqtsR2t02E4qp7lwPYUAkDg8K9z/s9bFBfTH1pKsS9nFDNDBQDAFY?=
 =?us-ascii?Q?uCJmaUedLtmGRVUTU/daKpxSEvEA4vOAph0M5ORYxCv/SAIiNSgGeAl53b7B?=
 =?us-ascii?Q?4PUOaSlYy8Qivble5RcECCVKcQak1aCcrC87uQsyRnZr5+Yr+Ip0LZs7nxsb?=
 =?us-ascii?Q?DoBwWYZ24Qffl/eABA+h9RX7AdBc4jbpM0o89SZVbBvbuWA1NFKbgLVA9Fe1?=
 =?us-ascii?Q?1C3vCMvpyQmEoiPkxYFsL/S22D8WI5xi1XbYhz1XqTw6SwQkvitXncd81aKH?=
 =?us-ascii?Q?ysTjyq7WbdmrmBps1tEOjjHO1dB102z0tEVg6xwwzNIMDsswCTPweYVCxzt6?=
 =?us-ascii?Q?saFR+2QtXmo5ppnTWtQjE/XXC5jT/dYYzH1XU+1iChhMGA1FGpZXxiF8U7vv?=
 =?us-ascii?Q?GfFVqOlXkHlCBLPO6LLN2b/T2IOX7YHpJSJCxB+dSRYrZbohnWYuG91BXcQS?=
 =?us-ascii?Q?nRObvKn69RfuxKnC3bJb09OSrilRnfZ8+ODEsHqqccbkeUOqAwC84G1yX4YX?=
 =?us-ascii?Q?w6Oa2vD+wgHVqLyqNVhfBsx+oml3gsbMxeeKau9j0621KdE24vgMtaUxMYhG?=
 =?us-ascii?Q?vrM9gVdGcII9zvY542aihQKCiRTM9MRcWy1tDj0KZa1QuIJj8bqqKnF1CVKy?=
 =?us-ascii?Q?Y1uaSh9s8vUFHJF7Bsg9BSETBUbsaCKdpLh5C2zy3ITR9mPyu+xTCui680fY?=
 =?us-ascii?Q?2M5v/jzzswzmdyLAvKPpoVxJvpaStvk7XtZAsC3nrPxQhhdSs9u+AFo1W3Uz?=
 =?us-ascii?Q?bwlHxmmt0rln/gqbMu33KS5eVPV4P3ulaqLou53IsIeaUPt/rc4uf8jiwjdy?=
 =?us-ascii?Q?nyykIaa82vsprjLc7PNhOpnn?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d3cbf2-d8c7-41c3-f0cf-08d8d6024402
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2021 00:47:29.5465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LNK2ej3zpPAH8bdVZ96LIDJGTXhjyOvrCbWZJVscmLHp1xN46m2+2hCnJgJ78jc9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4173
Received-SPF: pass client-ip=40.107.237.99; envelope-from=alxndr@bu.edu;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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

The device-type names for the pro100 network cards, are i8255.. We were
matching "eepro", which catches the PCI PIO/MMIO regions for those
devices, however misses the actual PCI device, which we use to map the
BARs, before fuzzing. Fix that

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz_configs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 5d599765c4..2454c627ff 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -177,7 +177,7 @@ const generic_fuzz_config predefined_configs[] = {
         .name = "i82550",
         .args = "-machine q35 -nodefaults "
         "-device i82550,netdev=net0 -netdev user,id=net0",
-        .objects = "eepro*"
+        .objects = "i8255*"
     },{
         .name = "sdhci-v3",
         .args = "-nodefaults -device sdhci-pci,sd-spec-version=3 "
-- 
2.28.0


