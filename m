Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3642EFF74
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 13:33:03 +0100 (CET)
Received: from localhost ([::1]:32774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDQU-0005hA-VO
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 07:33:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDL5-00084u-I2; Sat, 09 Jan 2021 07:27:27 -0500
Received: from mail-am6eur05on2098.outbound.protection.outlook.com
 ([40.107.22.98]:57153 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDL3-00067J-Io; Sat, 09 Jan 2021 07:27:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QtKkIqCGz5mQkW4smupWseb42/JW6qQNOw+9aYbmvLD79V/RgCBuB982Y8dQOJmjFPA6zu6IYH5uZUAn0anUzz3RK/J9A74O2jYTNXjMrm2d6myq9PJkvE5P3AhaMY02pkziWLeMi5nHl69O5dJreyR7fFfgWsiRyKvd1DzQP5XmWvrExmfMP8v5T39AlQ+cY1Q3OC7m3w5wG4U/90kkuBXroTm/odvc+kDZmYFIOWaNCH2FPJLqMbEDUhCiHuhklKCoTfRJFm+5EDRnRG5fVss3P8U5ZUPSxZ+3OZv3VQvzdwDyHQ0WX2b3g/8bZ8VbvPwTSTW/Q0jf02+qogU1aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1m0XgJ96HrOpbFZ+rvnIn5myETWI0JN9SfBqZypyFZg=;
 b=ne83y3LoPoRkIrAXekAdmVdoteeTXWhSfp6eoQK3P0SDa2dGRWHSDwl5boqn7c+I6VYNxsEu1e3qId/77i2g5mlwIi97jX20RM//na8iT7YLYnTAst1jvOm7aNdtrkAcRt4ZCgEwiTLefAh4Mfr8K6M5dw/Xi+xnEStQO1eIFsj91fyzBYFFZ4xpDmUK0ynfS3jPG5VYPtMq3lflQJfTWeM8wiYWrAFK0//35EJ7MghkbIUF7TDWrz2F/DmzuGT8YZpBaZUhYeSa3v65To+2Dr96aheLZbREBupLmfM7af+ziDUhiLY0eggI8jIj29VH3q7dT9PWZWY4vZzgni79Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1m0XgJ96HrOpbFZ+rvnIn5myETWI0JN9SfBqZypyFZg=;
 b=WCAc27o8VsEUSwkMjFGoiaiU2W9g64PG1h+jc/h709SJqaMrZLbG73RLhe/B+oHzO1GQ3xl1gYGBFTOTK79LTpYX7njFFElXGcByXM7+bdxCVzmNHgoFJEsWr1iT+IXGArWK4KqChrEZwAm1/Srd4NQtabzkpbBfdb05T6waTcA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2529.eurprd08.prod.outlook.com (2603:10a6:203:9e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.11; Sat, 9 Jan
 2021 12:27:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 12:27:06 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 04/11] iotests: make tests executable
Date: Sat,  9 Jan 2021 15:26:24 +0300
Message-Id: <20210109122631.167314-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109122631.167314-1-vsementsov@virtuozzo.com>
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM0PR02CA0217.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.119) by
 AM0PR02CA0217.eurprd02.prod.outlook.com (2603:10a6:20b:28f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Sat, 9 Jan 2021 12:27:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0731eea6-067c-4c18-1214-08d8b499e0de
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2529:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB25290601F6F73AF046A6393FC1AD0@AM5PR0802MB2529.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:206;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RLCs2ttbUljEa1Kt+bLArS3FYNhGSN0VvDu0e0+J2qpSYVWuBJlRiuBrdYqwE+wJqJEBBdQ2NICfxHzHX/s8yZ1ixWrNkLXKCTGaW5HdlI6Kh5Yp6COQ6hP2RZ2u5nIWkAuDjBjW7uXMwyoLjELdh2BGQf3ccYGY+LScD6cM3Rf+Jtql792V85T0PTdOTRSKuTrQzPyNauHQwEWoQW0NKMJFvFr0SzSqkDNhwSTkexYqUeQrYFHmZ4aHPOUvyWs2w9dNAsR05u5nqXrDFkhAm4CM74JA8h4EBm+wyQrfpVD9zzsZHKv9T2yHYN9JgPYd0UK1ZD0LwKP4JAX0MuK/Mn6e0S9vQsO7L7xjcZpMaR6a0MERgxSehGF18q9dOtRV8H+kpoajIcCGU4JNb7/WDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39840400004)(366004)(396003)(376002)(8936002)(6666004)(1076003)(6506007)(52116002)(478600001)(4744005)(2906002)(8676002)(16526019)(5660300002)(186003)(26005)(36756003)(66556008)(66476007)(6916009)(66946007)(2616005)(6486002)(6512007)(4326008)(83380400001)(86362001)(956004)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+ufpb1RYRZ4LtpVq8EaThmZvqE5ytr+CFDVZd6UxlNlKGCi22x5WqIbqW1cX?=
 =?us-ascii?Q?llbB/J45VLkXbKkmdYd3kXhRf8+FIyKLqIisc6CoD32VNvnCXOnDPj6EHI/s?=
 =?us-ascii?Q?RXIuc9bCKeqfoM7kSlqicdYq+kUk5+7h3FeliAA+mHTSgKTjjmTXL5rG+9mz?=
 =?us-ascii?Q?2nDt3+dcQ4GFRJdGA2++ovbMUz0Yu9ynKE2XVbIsggVNJtzAH/gLNwnuQhJD?=
 =?us-ascii?Q?QhD2w672W6nFN63+T6u1/Z/g22jmyA0/HEy2OqFdFkYaSfUQ3fZjMrwyWtrK?=
 =?us-ascii?Q?zorXuK/bk6QvqmMI21QIw1Z9IOHaTKEqWa7NbOgi6QVmP1PVbfuIjcR5uGYc?=
 =?us-ascii?Q?6pBpugA1OkgOQl/IbmduiOQeiQfbS6nfJlFozIFz90sJpYjSWqqp0Egq4/5D?=
 =?us-ascii?Q?Z7hHleSZVGDsYZZD631fdsO5Flbz8q+7sd06xjVFFmkDSJ3XNLMc5mQkeTcV?=
 =?us-ascii?Q?DdcbP8MzygkSpy3bwcT+O3/NKOYa7T2Tdy+OtOvNsu4dL9vcgqqHOTOAbL4Q?=
 =?us-ascii?Q?31f/+epdJryHY9g4muqmyE4lgZ+AiTqMyVRCOANJ12B47pQR3zqZB/nx/++G?=
 =?us-ascii?Q?5BGdEGPc2hWghFWQkpiHDrMS10yYqsAqRfCgYxxEnGO8sY05ZuvLmMwhVrr0?=
 =?us-ascii?Q?0XrdjC4wfvEPncWcxDErCe/bUhgH8AylU0KTkYQc3MNqkZOfrAVen/ns/u/D?=
 =?us-ascii?Q?YPR1k/+mwKB9Hivoc/zTI/cbKqK8UjFXRafEPMeusuaNZ9zgQgaZQrL5SIX0?=
 =?us-ascii?Q?twZnTVgbb8INQIzBzhnFkD+tm53uw703Gv4rB1wn3XKVIGo7VpjNincj9Quu?=
 =?us-ascii?Q?rSeRfdJaoLBiZ9mHNWt0DIFfaQrraMbAhrL/+9auoTnAltzsa4iHJmROns1/?=
 =?us-ascii?Q?43rfPMnZ2yLXNNsqtTBDiGpiqLmBkGU8l3ZcpiY1qhDGpPjsUzQbtPBUwaAT?=
 =?us-ascii?Q?lU8heOr/I99CohbzbdpNyD4XXMq7lsKRr+y/GsAh+yJi0H5BtA5mslsf+N9F?=
 =?us-ascii?Q?uGnR?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 12:27:06.7963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 0731eea6-067c-4c18-1214-08d8b499e0de
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4wQ0vBPx5ocVktD1ELm6+JlfVgQGn0kc8zEITlmDXZV/8Fh01aWQVlJrY49C6N7JBDB13e3+dvLkBAo0cjd0DjEh7OlHVCbYib6yuUwc+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2529
Received-SPF: pass client-ip=40.107.22.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All other test files are executable. Fix these.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/283 | 0
 tests/qemu-iotests/298 | 0
 tests/qemu-iotests/299 | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 tests/qemu-iotests/283
 mode change 100644 => 100755 tests/qemu-iotests/298
 mode change 100644 => 100755 tests/qemu-iotests/299

diff --git a/tests/qemu-iotests/283 b/tests/qemu-iotests/283
old mode 100644
new mode 100755
diff --git a/tests/qemu-iotests/298 b/tests/qemu-iotests/298
old mode 100644
new mode 100755
diff --git a/tests/qemu-iotests/299 b/tests/qemu-iotests/299
old mode 100644
new mode 100755
-- 
2.29.2


