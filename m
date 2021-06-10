Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73773A2AD3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:54:19 +0200 (CEST)
Received: from localhost ([::1]:53088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJGM-0005Ge-OV
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIqk-0004Nv-Go; Thu, 10 Jun 2021 07:27:50 -0400
Received: from mail-eopbgr40102.outbound.protection.outlook.com
 ([40.107.4.102]:59870 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIqZ-0004oO-O7; Thu, 10 Jun 2021 07:27:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5ZgG0EtRiiPE13h3TpMXVe3Hn+2jXy/t40SJ/3gZM1TrNbRO5CI3WRVnY+RFmN9O4KuQQLRIWGspL7mCEPrzpRgeg1Ud6lkPNyZBW7HImoqqW+G+VFl3IeyvLZeuCRLiuVizk6i1V1ekcSeJBDTseikdrEfXy1NGVAcZVwvw0Ao0Sq5dfUDh3zQX+7Rp9ptppXS3FK43iz6Ea+N6BWt68B5930mEH8ANpDzi1fYJCezGnFKJgiLxwoxJUpaCq12z9h+O3FY/jNCb9ii9xReGiOK2xRO/u/3fSMdWNWxVMl5VVEj8GbXdohdIwi5q+gQf20HufVPlJGrhoZHSGNrvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pm/DX8vEH9U0U4+GCtPJAxsZlteqTAW/fTB5aMXiQYE=;
 b=a1Z0930WLZ7EBZ9wYyzSfcheG1ggl4BFQUz5NC0Nei4XJbIkdLU1Xyyg7sKTedoWtc11Z93+QJsxktV8Hc8sflT0hKKlII8g4pDFPoLVDgiy2+yN9SubhJ20QYDdEod091t4dgzVF7kBvgGnJXREY2qi/pUNDurh2z0wfR7T1IfqWs+lDvlIQk8q+Av9ykVDxJFE+U0+tKX3aqDNAvU7Haes6jrTX3gjIlQvZo2U+ach6CAFFvdB4qjxJKHk+xiDUtact2ZJMJg8jW1/Y1iEEV1MX5APtr6Vhc08HgLOJThyiv5h0+TOt9mjf91rnFwS498CaKxc1GRdt2+6uJfwQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pm/DX8vEH9U0U4+GCtPJAxsZlteqTAW/fTB5aMXiQYE=;
 b=aPdmVsCbpVGTnQvr/rvF9Sv3rbuIaZ2B5CRUOnxqYbfJjG8bXVIaVqTHu2CPB9zWYq8Mez9zeDamPbEUAans/bB9LiBmrnVNmKlUnLSZ5K3EHNbHWADDiPw0I8ATy1h2U+pYmqcNTUOljYpbL0m0gQQHCSo+xvZ8XCZ1NpuF+oE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Thu, 10 Jun
 2021 11:27:35 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:27:35 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 30/35] iotests: move 222 to tests/image-fleecing
Date: Thu, 10 Jun 2021 14:26:13 +0300
Message-Id: <20210610112618.127378-31-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610112618.127378-1-vsementsov@virtuozzo.com>
References: <20210610112618.127378-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0902CA0037.eurprd09.prod.outlook.com
 (2603:10a6:7:15::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0902CA0037.eurprd09.prod.outlook.com (2603:10a6:7:15::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:27:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f87beba8-a9ef-4c18-673f-08d92c02ad28
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB338172757F8A6669680AEE99C1359@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:497;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v8SQTuCWqvWRjFe1zxZ6cs5NNO1Evn2U6272rW1UDwCVd6GL75te9bHF9zOhqIoHnuMfRnOuHH7icNJsoUjVaquP4GaYj7VJ/aVSTs6FetizwbCJmnZNjC9zq1VsfWZ8UfhyLgVVVWc5TTE3fjxSm+DUUPGShcrHiSTzAJXgJYeKNc3xOrIteaSBgH2xQB2AdHz4XPI4S5chMhwcJNZFdQ8TE9aZczhaskBauXF0aFn48U6wCdxXnvQh/4RMkXVszQ/dkBDON6tCXwbTy0TukFN2oYPrvtZsupabxWfvgSAKqwQ0dFdY3nOD1ACIeNXddF0wdx3o6KqiX37/AxqS1lOihQRBytqGNusIGBlcwpB0efRlop6NPA/CUctWz8IRgF4QlV8HeROH14KhqdqdOGQncvlzgqJRILW8Al0mJdPKeGqywN71UljtRdJZ3BATG4SDMapw+bzfWw8pXCqH+nH7vpRC2A+ANpSldctc+JMS2bzeMQlk4w7dQ3r5Mw/ugkmbcu9OupyCfO7HBUKyyxX22r6zWWJr555U2D+L6OM0PK6Iq8+XVLyw7+xMZ/8uDejQ1lfanF99Ra/mtzN+fq9M90fRY+fFW82Nt/qTLtSoYjR1QnGaEkI0z4aLi/lX2SBRWhzjjO8NcZn1/UUbxRMlW92F1IgDA8Kgtnbv35Kb+PPnRMPz9USyu7/d2N3W
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39840400004)(136003)(376002)(346002)(2616005)(66476007)(83380400001)(956004)(8676002)(8936002)(38100700002)(6666004)(66946007)(1076003)(5660300002)(66556008)(316002)(26005)(4744005)(4326008)(6512007)(478600001)(6486002)(186003)(2906002)(52116002)(38350700002)(6916009)(6506007)(36756003)(16526019)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?GTuQT/3Xb3dPXyCLVWms6788I1NSHOUapJnLgECRK5/3J9NTI1LNEW6dgDOd?=
 =?us-ascii?Q?RjBZN5nhvvbfgnoUssHRf8BpdHsgHUBIhiBYedzjAi6JHaYbbWKXJAzNQpQX?=
 =?us-ascii?Q?opyMoKq9ZgudM9DAQQ4fGa5JYYCinfsSRbea1HZRc5VPqLl7STq2pL3wDKqo?=
 =?us-ascii?Q?1xK285iYZQN2DwrIUFPnzqVFkcXi+arFd5FvxmFSRMGjXi5rM+Ylk9K5Q3Kn?=
 =?us-ascii?Q?HYb3QGqCDUvXG61BvRMIw01P4f4cn7TTozGm0NykZidU3AXP4DCvRt+cfYSk?=
 =?us-ascii?Q?YjOPklIXnl4FMRn8eYC024Wv43b8Cc5nGK9slkleu+heb6sZnDz5AE91ULfQ?=
 =?us-ascii?Q?2Msw2hZlJfURjCkXVWCybhJG0Rx0ck9VdJfolNdJJ7Vk/TsZ5Hi/x4AkBxBe?=
 =?us-ascii?Q?Lfl4OY8Qzax5Jk6G0ITPGoY5nHSOME+R0Ksl6X6lWNQQwInZULri4u/prbZr?=
 =?us-ascii?Q?YFIORinhcetGVxlk0kDG8pHQ62VeOnNql2h3sYQ0f1Xs6QNwIG5qsczIQZhe?=
 =?us-ascii?Q?NM0LIMngMA06+bllZPujwvygLSPKtHWFboIPXPFkAcKaHwDNgCIt2FLusx+w?=
 =?us-ascii?Q?Vzo448WyJ5jJBnJHjUmRpAxhWh1fS9vQ1ANT/FyB0MV99uBTyxakmI1Gu/2N?=
 =?us-ascii?Q?CI9lsY9HbOB90wv3g1EOPSEAA4kzmV1QqUExYdQUarPfSqlKqYBR0XMgtvkc?=
 =?us-ascii?Q?G0iL2p4OzdTeg4bK2dxpePhy5vNiUWKbfwfE4pIGhpvPkr+moCZ4T+OiTVtJ?=
 =?us-ascii?Q?YgRMn0Rzk4X07ODcxCC/qlAaAeAJ9zagjeaZJNuYgjEfbb2iOKo9ZHa+5z3c?=
 =?us-ascii?Q?UCx+5ua0r4kklIZEyOhwc1JnZ2I6nG3foN238mU9zD/SIFdlANtpLuWX+5NQ?=
 =?us-ascii?Q?v3bLgc1pWyMClph0+DFs7CNv7B6CctS/AjeFSYAN6uEM0xqVMTfgwV5SFccN?=
 =?us-ascii?Q?aqCHETfcZaCOLZA659uxXZvdbI4HSJSmJWo3Fxf5FmERdSGoxFnbnA1iIRnY?=
 =?us-ascii?Q?PtJfRIggSoPHgHritSUgMj5icdu0G1A8bSPbZyJbGjEqmHMg5izkyWziqo7e?=
 =?us-ascii?Q?YXzFLLh9l3fFf9LHPTK62vLSucLwChQ49r7apDvJfz494OvYq22D3oiyChh9?=
 =?us-ascii?Q?0KOBPsZCIJZZoMzoVlDs20ShCiSeX5Ti5v4316S3tk6X8JQL+hmTYMOAHtA9?=
 =?us-ascii?Q?jjJV8off08c0JQMjMnuVNo91EgRZ89vDpOYzWNRefD1ooBZigFf5tWSQo4vH?=
 =?us-ascii?Q?5/5djMuKkfpMbfTlyxmWK0c/Ui1T1m0AAO6m8KDd3gNPNJt3b0h/xSaoAhyK?=
 =?us-ascii?Q?cROlsZ7RHr90m9+LCP/GSRVc?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f87beba8-a9ef-4c18-673f-08d92c02ad28
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:27:05.7682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tcva+twJpHv6IR+aC7exG4AvUx6mTozHAUDZnB1vetQ5LkQp5/S4jqowhFcnxO0B2GCSAFjMuMicoE64jpMH39isOJtN7MUISgUtx16JmvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.4.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Give a good name to test file.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/{222 => tests/image-fleecing}         | 0
 tests/qemu-iotests/{222.out => tests/image-fleecing.out} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename tests/qemu-iotests/{222 => tests/image-fleecing} (100%)
 rename tests/qemu-iotests/{222.out => tests/image-fleecing.out} (100%)

diff --git a/tests/qemu-iotests/222 b/tests/qemu-iotests/tests/image-fleecing
similarity index 100%
rename from tests/qemu-iotests/222
rename to tests/qemu-iotests/tests/image-fleecing
diff --git a/tests/qemu-iotests/222.out b/tests/qemu-iotests/tests/image-fleecing.out
similarity index 100%
rename from tests/qemu-iotests/222.out
rename to tests/qemu-iotests/tests/image-fleecing.out
-- 
2.29.2


