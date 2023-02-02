Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C65C6888CE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 22:13:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNgs5-0008Gn-Ux; Thu, 02 Feb 2023 16:11:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pNgs2-0008EL-VS; Thu, 02 Feb 2023 16:11:50 -0500
Received: from mail-bn7nam10on2070e.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::70e]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pNgs1-00088y-8X; Thu, 02 Feb 2023 16:11:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jwvgQ8/xjo4PSOi2JE2N1/xEgMozk6XNSmGefR78Ny7+UGRFfur1PCWze2eGZauLPZj4za5B0h1rbkbOwDwQ4Jlqu/hldtPUdm0x1vQZTXmWh4bCjrb5fGF/dR+8KWMi7lWFyRK3UqRc6b6V5QTaWgQ2Nv564BCs5J9UIAS1T7DTuj76g5yxfmyWA6vLHAJdVy0QvshLfqO0AMG8t4YOXpwXy54EnX7RUcGDgF4kcnV3YyrEuWMtHSef9EhkTgJzrE+6ATrfr28Rs6bR9tFiGbIk5ls9h+6o7UDQ+Q7pf4sY/sF0NWyoGcgMaa6bBweDfmKcoKWgXSGRAo/nvfKBEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdnUeiDw8d1UPxlgIx/ae7U6H4RyP/KDY59ynJtnUEQ=;
 b=YNU338U1sE0zHf3LhkTFeEcIchcOH5WTxo4zNuFdWN7tfuJj/bDgNvHKGu0gAbFP7gDDUqeRX5OuHvF8jkJtuanRoHcsb2fWpkKbkwvcsVBH2qR9bS+4BDgNsPMTIHzXqLlhQWf4ediVajH5X2dhtszXwciY6lFvmhFJEjYMRcLDP+RlFIKJqZ462/02SFA1vQ9KQlbZ5doHbUKM6zCYxf1ayT2m5W7rKAQakOphNVt3mE27Q8LYCOlWWROY/iKt7x0YVOFMjoZkaBhW8Gkb/GQ3ONX6XJBiPmV8Fb7xSoPJlbLgM2XOJMOs088auDY7oy3uci/e2o9DO3I/RJxyzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdnUeiDw8d1UPxlgIx/ae7U6H4RyP/KDY59ynJtnUEQ=;
 b=tTZHyfqxkHW7S16NzTxsCLz6bspGgyndRCwVu9SwJs8sDydUDCL8ie0+c8vgxu35qp89RRrQhvU28eZGsxKlno9py6OAqQ9LPlGJAqKA78d69VwElTg+v+fERP5mLe+EuzD979nly/unWTs6AFZDw3OPqUgcnnfC1UcAVux4yGM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 BL0PR01MB4801.prod.exchangelabs.com (2603:10b6:208:7c::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.38; Thu, 2 Feb 2023 21:11:43 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8%5]) with mapi id 15.20.6064.027; Thu, 2 Feb 2023
 21:11:43 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH 0/7] Implement Most ARMv8.3 Pointer Authentication Features
Date: Thu,  2 Feb 2023 16:11:22 -0500
Message-Id: <20230202211129.984060-1-aaron@os.amperecomputing.com>
X-Mailer: git-send-email 2.39.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR20CA0027.namprd20.prod.outlook.com
 (2603:10b6:610:58::37) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|BL0PR01MB4801:EE_
X-MS-Office365-Filtering-Correlation-Id: fc85a09b-0d43-479b-c773-08db0562157e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iICTxqKDfK63eaXvc8S1MDGRFP6xZ9LoXwUwLyekOKsuYZ9wuuXFiFIYdZBxkJ5XpVI9grsDj60KwVq+6aVieWUOaYRqE3qRuORZ4OaUMsfOJoMaG8q5c9lxTmQ1v7gsmUzoXXUk4HqF3vnWqJfXFRudjm0YF+7EPPifH36Zhw7tg68NfaMzMcTKqzRDX351uzEnoLn+jwENbmDpW0qefE6/caj9YULSTUzeev7+g96G5knQB9hi9obNwdTkJ+ZCdjBquXt25DwX6NBWpuX8v2PgqtMeSNJ7BsYNPKdCMVT+B+easdGn69toTKy4/FX4HmCl9TQJeGrvJXTI87OmFiEccZc57GdY4pfjygFs0/S3jZUKduYD9ykD8+sdyYxC/6VyWwF7EjiQOwiXD7Yf+MT89u/EAjGNgSZyxqamUZnBz7RouD623K9IG3LYUnEEo5cMW4NLhUlJ7xlH5Izo+MiWEWyJwcfq7omnSREruA9ofOtGL8IOBEQZvqMHLu9HLy3IZfZd+C7IJmRwpZ3lsppFDrjApkSBxBkAG2+ku99kVzVOOAPKcsP0RE72WS9Pdo5V9wK21W9Ph0O3chrCJokq7XT4Y8xcmcoQC4ovEfv1ByyhCqUNAJvNSmutgVLEZf39j9Al+nsOq4NgEu+SrYfrmw4gavL2hkMi4zPOIWLX3tqhARad9jiwLDOA2+iwJJmal+Us9TivJWOmn9DvUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(366004)(39850400004)(396003)(136003)(376002)(451199018)(186003)(4326008)(6512007)(26005)(1076003)(107886003)(6506007)(41300700001)(4744005)(8936002)(5660300002)(110136005)(6666004)(316002)(52116002)(66899018)(66946007)(86362001)(38100700002)(83380400001)(38350700002)(2616005)(2906002)(8676002)(66556008)(66476007)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LuBWqHlEK1D713XJnoq68wxViNO4Accj1vYq7OhFefv2FSN5+JofYASSzmDq?=
 =?us-ascii?Q?9DaVrZKLbPug6LPd7P63ZI2SF0b228jyhPMAutjOoGtc99Eds+Vr7+ibzj5A?=
 =?us-ascii?Q?ZlOf815YuKxyFORNS/Xs2BlSOGTnsyuMRBkLMYKpdj0veyOzumHYhoW09feE?=
 =?us-ascii?Q?RfISJOZaa/7P0I65R2FVFNmoW86BGk+OtJ8pyP9rHZwGdPGMS7iWWD/qyk6U?=
 =?us-ascii?Q?51e1TWpIwF6KRBX3vjHiku0I+Lp7Wqk8IPMa3N3TkuQghQ5aBI9yXfWnV/M1?=
 =?us-ascii?Q?6DKDqWByTGgvR22nwu/yS/GMpARWtQmAWXXZ/PQpu49Dw0mlcx+pQhGSiTWM?=
 =?us-ascii?Q?GEz4oscfI/BqjqzfKsCTOlM7mxrASvL2siWNydvJiwr/DdT/hEhegJe0/XXU?=
 =?us-ascii?Q?98/VasDKLBYvYKQywhpMUGVyq31USayo7ELugfd4H9Z6Kuk0FF0QldcNQTIE?=
 =?us-ascii?Q?LbGLmWvVpkEpWlcddjdjKK1m2CHhC+m00ICxplsbt8+CX5ZDMXGqUxwFspyj?=
 =?us-ascii?Q?x5FE+ytNptTKmkOL4JGE/2c3RMEh7HW2f9V0APRcXAXKnxucoyMn3mI9PNqS?=
 =?us-ascii?Q?jDDlFkOxBH4gZLRpZ0WRkdqyh7/iK+XaewG5dxXGBxyLOwc5SQIEHzaAhYA6?=
 =?us-ascii?Q?PXk1MxLQs6En5ZIkb1DkqfiB+MV7hS1ffc9s1XlBYn1AvK9aAlgJJTdDbiHE?=
 =?us-ascii?Q?dmrt1xIpAZc7BAQeGqaC63iue/sV1GTz4F642m3kxtXUTYxGHeNgey9VpGco?=
 =?us-ascii?Q?RAkAVEB3JIb/uwUfHztbJzVbGPSf552GLKiAyjTgwzKX9Ud0eGIQqn4HiEUG?=
 =?us-ascii?Q?N23mwsmN/zb6GF5/6j4oscZ9mug+iLZKSso+qNnH7TO11Hk8zYxXGkjWGZwC?=
 =?us-ascii?Q?qbi6v6JIMgiME3A4RH08IMlDX7+v9bG5UUXRteEfUUAg+3w9a9q9m058TpC6?=
 =?us-ascii?Q?G4YCGvC5UB1H88iHeh8qVNbBYCwquO/ZANB84Wi2wDdf3nnmFl5HcjVrGXiP?=
 =?us-ascii?Q?u1v8KAxgxt7XB69QEHqDCmsJ5n8QORfMy5SKdgaVdtByig66c3tf7VN81Z5Z?=
 =?us-ascii?Q?ddeGVC9XS8jYq/WOkW/1hAglDm4ekzUZLu/W1FLLndH8o6WOHFjcD7o9n1Kw?=
 =?us-ascii?Q?Bl9P58zKuMWICMwpjHhDNkB/uUbNzpbmmGBTjw+TUiPyENA0+Zvdng46hTsg?=
 =?us-ascii?Q?zdrzjGgVjXf8MHZk2M4TXxMgK88XJC1phT3ASbsfsQSIj5EpBOkokaOet9Wi?=
 =?us-ascii?Q?kTZB3NeNryf5pbR+VLlqxQxpclsEidfZAN7ykuqDDchvQzGsLO65XFNnK2UF?=
 =?us-ascii?Q?pc45G5DzdAI2FEN7wMusgXebSI11QNH031Y3mUa1lxGOFpRRtEv+Z/Oi9+E7?=
 =?us-ascii?Q?tcz9Eekw3tQ+2apUz0xT1NN0BVxAsuLwS5JxKAf2fAUSivCp3HuLsHyiT1qU?=
 =?us-ascii?Q?kf9puF9jOlExCs70fW0vxVIwtCBvdvZVAZl0GZqhCTN/sZ/3Ko21wRsQcTA+?=
 =?us-ascii?Q?x2KG2NJ0ZH7rkFahKAFc1lzbqHNEhcSCGwkydEg0W6jG/SDYNEAESg+jkNM4?=
 =?us-ascii?Q?GcbKe7uWh4lB0pGlyTNfduZadG7zZ4fU5kin4oMjQd5nfi549oIEJYl6C+It?=
 =?us-ascii?Q?IvW2SG3FVSRhOhydDaJ8U+0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc85a09b-0d43-479b-c773-08db0562157e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 21:11:43.0964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Amgehy2slyysUHnlIEZgy6IJ6a6EWvRBQVWg6Qh+zJHELh1+A6Siw/SmxOdRRiNK2NgWyT5KCPXMtS9vFK6pYx+EQs57PYtiU4L4MrCfmIUkHRMy6vfG8UeO854DvWaO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4801
Received-SPF: pass client-ip=2a01:111:f400:7e8a::70e;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello,

I've taken a first pass at implementing many of the ARMv8.3 Pointer
Authentication features and welcome your review.

Thanks!

-Aaron

Aaron Lindsay (7):
  target/arm: v8.3 PAC ID_AA64ISAR[12] feature-detection
  target/arm: Implement v8.3 QARMA3 PAC cipher
  target/arm: Implement v8.3 EnhancedPAC
  target/arm: Implement v8.3 Pauth2
  targer/arm: Inform helpers whether a PAC instruction is 'combined'
  target/arm: Implement v8.3 FPAC and FPACCOMBINE
  target/arm: Add CPU properties for most v8.3 PAC features

 target/arm/cpu.h           |  62 ++++++++++++-
 target/arm/cpu64.c         |  81 ++++++++++++++---
 target/arm/helper-a64.h    |   4 +
 target/arm/helper.c        |   4 +-
 target/arm/pauth_helper.c  | 182 ++++++++++++++++++++++++++++++-------
 target/arm/syndrome.h      |   6 ++
 target/arm/translate-a64.c |  20 ++--
 7 files changed, 296 insertions(+), 63 deletions(-)

-- 
2.25.1


