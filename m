Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AED1E8B1A
	for <lists+qemu-devel@lfdr.de>; Sat, 30 May 2020 00:16:51 +0200 (CEST)
Received: from localhost ([::1]:54224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jenJ3-0002Pc-TF
	for lists+qemu-devel@lfdr.de; Fri, 29 May 2020 18:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1jenHQ-0000x7-Ag
 for qemu-devel@nongnu.org; Fri, 29 May 2020 18:15:08 -0400
Received: from mail-eopbgr760094.outbound.protection.outlook.com
 ([40.107.76.94]:12454 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1jenHP-0000fW-8u
 for qemu-devel@nongnu.org; Fri, 29 May 2020 18:15:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GoulZIdlybCk60CqOL7q1PQWWzkpdG2Im7vnmXIOo6WHs6fpTAXv2fOHilGUtIL7nCZIdwm/ysRHSe7el1PODbSJF4lv2NrFZounaFQFqCONqHZUj/An0Vevp15/0IPt7rUxGw3MUsYhI0n0AfCGWxHeOkjpNms4chgAAaPO59XD0XqfAZIz7XNHNu92QIqUj4rxXphyt1IyxtG9zLer0bEFLOvWPj5L81DTgrRyNu/+6ulrNRLGJ1psAjEaTjy3+4R787zTzKV/vqsvTpZJXKstticdDYR0RMXavKfGLqz5AihfR4BYREZFsd16/u54ZbvtZeSCYZj4sMPf9oQErw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4m5ISqO0A8WC70/qxjjRQJy3lIYm+P9apSkR8sEBLwg=;
 b=Y8rInTVTRTM5pv3Z0VR6omVGUsg9pI7VmoEzsGRiT0dmAlSrbeje3ktT3aoHwHe8oRHAxVSwT4RcIFQHKwZ1hVahBOQAsK7eJS6kAJiOcFo0wfvWvNuIvvwuyaVSdstqKDx3vIsQ9bcadSXahJ0D0ByMGDVzXyMvNHZal5SXZZ+8TcWkcPRyp5HkSp6V/WqCPyT+OZB3dqR9o4EB4rfMtbCSBFPLkTaHknptjyvknu/G5ZDUbaZCwJIZpsCInrofola7c1moRzSHqsmt5g/H3yytN+VEjRaQBmJErQTeCIHSl28ddD7CGGiEDGsGjopkqZC1GDsn/i+WQ4eOFsF7eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4m5ISqO0A8WC70/qxjjRQJy3lIYm+P9apSkR8sEBLwg=;
 b=GpF06IXUkEjtHstZGP3g4h1lI+ayXqJeyqOQWt5MOf8iBWhf8cn+XDYnuzh177IVnEVNvpLpsEpJ0R5yXEPt0uHDfcNItOclpC2nE0U8HHw0Un2HZk5im/xilmMKwARk/MEvGRzpctcnXRmqNevc3A+6IhoMegbr9UI4iJDXOWg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3455.namprd03.prod.outlook.com (2603:10b6:805:3f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Fri, 29 May
 2020 22:15:04 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::640a:1123:37c1:42db]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::640a:1123:37c1:42db%3]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 22:15:03 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] fuzz: Skip QTest serialization
Date: Fri, 29 May 2020 18:14:48 -0400
Message-Id: <20200529221450.26673-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.26.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR19CA0031.namprd19.prod.outlook.com
 (2603:10b6:208:178::44) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mozz.bu.edu (128.197.127.33) by
 MN2PR19CA0031.namprd19.prod.outlook.com (2603:10b6:208:178::44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.21 via Frontend
 Transport; Fri, 29 May 2020 22:15:02 +0000
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [128.197.127.33]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b034d907-305d-4b19-c66f-08d8041dbc48
X-MS-TrafficTypeDiagnostic: SN6PR03MB3455:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB34554E62205806D432F0B31DBA8F0@SN6PR03MB3455.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 04180B6720
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XzgDXaz53xgo7tAhBP83WxBappwFQkSdMeNHagqgLlSE0srhmXnysvumX8elgwhsWwMOqZ6tqMip8d+erNqJmSyK0ihwX3hBec1jI/AoQfv3IPThfbkMl4u+lo/oLbePQsGhGxSiku0aBw/IaD2SCWmsMg8kPtRo52afi1Zo6tVCaod8S6IA+H5xXouN8pC+R1JMEuwaClX1MNdnYoDe6oyu62dHD5hnBPFMRNWUGzEPxQU6QdgvJcL/ugMQoNsRW/LplVCtrgRzRvQIFOV+3nzaGB3Q9BUQuwIt8Qe+FdhGv7HB9DHeUGjv+or2lGc9kv3yGPQnhNUwKehqO9CAu35/JqrICUlxLpOy4ufJt5FfjUuFlMORf3GlrF3hjEh2OwjNFw8SjIVBQTXEbdvSCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(346002)(376002)(396003)(366004)(39860400002)(86362001)(6666004)(6916009)(478600001)(956004)(36756003)(26005)(4744005)(75432002)(966005)(16526019)(186003)(7696005)(5660300002)(66556008)(1076003)(8936002)(8676002)(2906002)(316002)(2616005)(4326008)(6486002)(83380400001)(66946007)(52116002)(786003)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: DhVSFQU/WcRSKx/8hzV1flYg7Y4dYb3SMmOqwIAfPnPsAisXLuv0P0ZX6SpaghxYtVDzgYxn/IonULv/xlTSYsKFljG0zmj0jEO2WDasUbYFepLHDVeja+bo+dhkfFVh6k+PcC6RHoe6FLBUBx8+38DB6ugNGJ7OBA8a72NN8zd2l09mPzNWNqcKNxX5zAPdW9iKFlFJRGbXZAbJXekMQ18szpq95szUWdw0XVYJ5XRq7py6CzE5I62v1PVZMoxtiw206Uw7Ih7Wkw2K/nUTWA9vy0EaOgUGxeNirSWcHneDBLF8YXYrFc04Lxd4axLtV3pAboKhbMAahxpQuGz8WcByJzpVtO+QLu92DHrsD5s8wKjD0gHO7mw2vWUvAeN+q/ysZrsD4DVqZwotnfgJsrSEm5GcLuRCAdEhQbjg/09NoHs5kpAjuCyqt12DwQAJriTAWjmg2nb41F96D50VXN6nyvhCNNjKtvXJUG4B8Ak=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: b034d907-305d-4b19-c66f-08d8041dbc48
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2020 22:15:03.7660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: juLgsrOp1CMKI2NwvMYUfxGFv2McTK/mW3B8dFH526bOOMladvsYIQAG4HsIYcfg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3455
Received-SPF: pass client-ip=40.107.76.94; envelope-from=alxndr@bu.edu;
 helo=NAM02-CY1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/29 18:15:05
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: darren.kenny@oracle.com, bsd@redhat.com, f4bug@amsat.org,
 stefanha@redhat.com, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the same vein as Philippe's patch:

https://patchew.org/QEMU/20200528165303.1877-1-f4bug@amsat.org/

This uses linker trickery to wrap calls to libqtest functions and
directly call the corresponding read/write functions, rather than
relying on the ASCII-serialized QTest protocol.

v2: applies properly

v3: add missing qtest_wrappers.c file and fix formatting in fuzz.c

Alexander Bulekov (2):
  fuzz: skip QTest serialization
  fuzz: Add support for logging QTest commands

 tests/qtest/fuzz/Makefile.include |  21 +++
 tests/qtest/fuzz/fuzz.c           |  20 ++-
 tests/qtest/fuzz/fuzz.h           |   3 +
 tests/qtest/fuzz/qtest_wrappers.c | 252 ++++++++++++++++++++++++++++++
 4 files changed, 295 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/fuzz/qtest_wrappers.c

-- 
2.26.2


