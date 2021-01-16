Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A67462F8D76
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 14:48:04 +0100 (CET)
Received: from localhost ([::1]:37150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0lvv-0005Yn-NY
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 08:48:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0ltD-0003G6-Ul; Sat, 16 Jan 2021 08:45:15 -0500
Received: from mail-db8eur05on2123.outbound.protection.outlook.com
 ([40.107.20.123]:62560 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0ltC-0007XP-76; Sat, 16 Jan 2021 08:45:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqqBZuX2Nd+RcoPYyTAVl1YctXVrRKxBo0i+tY/L3DV3li45Ln2rWdLCGQ/+rF6JLtoupzDwpsDNxOBOFr1iGElWLhIk+VRmUwYAMJ0o49Z2J4R2wzs3jp5huF0t5jul4sYBd1OW6KPgHqNGKrnTIWO9OnsgHsxqGd22HsE+D56gryQsWo+z3/8p4zbc8OXTgzBY0CaxQo5tGyZ5Q2lTwAccnlXhQvzfeOcNhxzDGB17GX30UaIhY52DEJxZ1Xky4TWcJulQVv029ZFq6tpXTo8fPz2Mk/uX+pD21zu0KflncBn5lPlJyzkY768/aBSFNqLEyrh3Uy1328I+6HO1ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49zj3gRR2AsSH3W0u0NdB90YiuUVTc9NjhzXP6v12Mg=;
 b=XzmZP6SI0wgrqPRJ2wlUBQQHzuqclDViIdehmc2Gvabvo75JbCkfXjvsudAqInZxz20b1diFgrJcMms1JGbnJpASa/gxWpzsFpOFtYaS4KFLS4UJhpO9cJE5yXIvivLddkIONJHtvvR7/toZmi0JYjeekz3AkRBt53WYoccAZEwxPfMbYNCzXjswcMJuXOldi0/xvg4d9gj/z4uY8O3TifcdrgoV7F8h5pik/8QLdEpYCRTpA1itfXHk73rxsakLPJAtk5Ac0NUWGqE7385M6E0QtmEdWvZSXvC/Vg0wpFgqxg6UXixnAyFbJRpMnEp7wU2+wrvKk/wl93j0pZJs+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49zj3gRR2AsSH3W0u0NdB90YiuUVTc9NjhzXP6v12Mg=;
 b=Y9ZId9mSoP3xGqOkreHKR5zYxT6HBLvJsVAAOO8IKV4VNIZrYwAMXB491iUE1PnyR+mcXYw/NiiPDMzM1jCUJ7e+rEyifLkS3T3I31ouPv4URWUBksjOI1WuuvYJH2MKE6kyqpF+WLmPU1BHrZwvfvaWke1UlrdzcgXh0lyySDk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2098.eurprd08.prod.outlook.com (2603:10a6:203:4a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Sat, 16 Jan
 2021 13:45:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 13:45:05 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 05/11] iotests/294: add shebang line
Date: Sat, 16 Jan 2021 16:44:18 +0300
Message-Id: <20210116134424.82867-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116134424.82867-1-vsementsov@virtuozzo.com>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM4PR0701CA0019.eurprd07.prod.outlook.com
 (2603:10a6:200:42::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM4PR0701CA0019.eurprd07.prod.outlook.com (2603:10a6:200:42::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.4 via Frontend
 Transport; Sat, 16 Jan 2021 13:45:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffa70899-3661-4d71-e281-08d8ba24ed9f
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2098:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB20989412D57816F49912BB52C1A60@AM5PR0801MB2098.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cpWjFzIrDw5zCDqXCMRxOzya6eAnYImOj64FBUqWUs2n/KIXaFwAf4Oepaw+wRfR9JvcMNtOXmgxu3m8l9c9eiXJdyqiKjL49hvE/uuvVKcLOUCL07U3S7eNZwy3pmXObbxAg1KdlYZKaIyNagq1cC/UNPsNZvyf0sPD722Ni6hRmgzRBiunupDhoqkURttUGsFDcIJuutWW+WPnRX15enzqk5legxDa1FOtiWrFkMHIVq68nnpFUiXYbQ4FqNeKf2H3lhoU2CbOWMujpAtoP5klbAhNjMSotf0Ak+bED0WDR3cR/q+k2awOE1PniABPdfoElmGWIBHaYhAdiaqB49bDix+xZ1VMUBjJZ4ZZpC/eojhk25XEXLqpwf3nDllYpuu+uafL0QusZ/lkKMSc7G0+CnHL0Zq0Z8QPFg9ckl9WLD0wN4khuZtxI+upqhv6PBsqfGvoa6BPzYOKyGcdTEvLDo0mugAUVUAU37FZMaFgzJvt3XeCIONaQYRiCwLdNqaCoA+SQOLYGBsMnKHwDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39830400003)(6916009)(36756003)(66946007)(6666004)(6512007)(86362001)(4744005)(1076003)(66556008)(5660300002)(6486002)(66476007)(6506007)(478600001)(4326008)(8676002)(8936002)(956004)(2906002)(52116002)(186003)(16526019)(316002)(26005)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?A1DQnt96NUJGtA/xIwBzmnx8LRfDtclryEgv5+lxRPUMjUNe3ZneFwxdv/OF?=
 =?us-ascii?Q?ERCnENjAXPLlY7DLTVwzKFg33Psdc0WAP4Stixl5Jarge7oKYMNmgsvT5aiK?=
 =?us-ascii?Q?Z0QO0U+EKSlFrjfz82NBVrcy56Bw4ge5/JA8F9nwKcVqDRfpa/ZSfS+n0EOo?=
 =?us-ascii?Q?39GJ5uHHNCGiE2yvwTVyTU6IgGeZwlUIPIq5o/ARD7Ck/w03vr7EuKGvZIYT?=
 =?us-ascii?Q?1ZJWfgxSG3WE2gW6hAzfrSeL3BTnJufBD2fxDJojdirf1+5wMrlUYTzPfPyv?=
 =?us-ascii?Q?EOpi4UDRDATZDsv6ybXsxJC+u4If3PYNzYrgnODrvP3h6UQ39vp193MC1BCN?=
 =?us-ascii?Q?d0d3Vim6Con6L1ENWAnjJWPkEgdcD/l3TcD9A5ZXSLMEifYTXp/8z8N9mwsO?=
 =?us-ascii?Q?8Vrl5D9Ef9ZOV/hCUwTg3KSAOmbJj0yuMy3dBJrHXIhrw7FCcDczb5dW1DIu?=
 =?us-ascii?Q?+sWlYzB0PVFj7mYggTnvni9qQRUkf9eI4KsJBIag20pJ6D/fJKJ1g8nPH9FY?=
 =?us-ascii?Q?4RWHtj6ytACynoI0hmxQZ0jCeQmhTNM0av+3hKBMCdrqsiSsIy00FkfxT213?=
 =?us-ascii?Q?QHSSJres9axot2E9nH++A505uwNNmXFHVaGk63geExGdHGuU8NsOBwqweMYF?=
 =?us-ascii?Q?giqfgArs+AaOWHPHTbwoYnIo23LI3FJZhiTe02k0lDJW/qVRcoBukC2g5+tP?=
 =?us-ascii?Q?/olBV05T5BbNisRWV3D1NkKcQSu6ycspy4FtMsmpSHgQWq3qVdZ6Lx8gUFeE?=
 =?us-ascii?Q?w+Up+EC/JsZiYDmcANE6bwwwB92BscMyR5Mx9H4UfI/x1OOuLTvHwomrJRoM?=
 =?us-ascii?Q?xmX2w26Khj4W+Vm/UC+U5WtkHbypGXrB7oHWYzx0GtJdvNnl5Ecec0nrXyHJ?=
 =?us-ascii?Q?GCvYHNdhOxb2YrCWrbjt6v02XFPReCAGQ3KBAytSKJmQVcd/Md2OOpimDwoc?=
 =?us-ascii?Q?1bX3KokyXMlQMWdlneyBSS2FzHujT3vVrJM/rU4ht9HoroMFs9FAfwPnO5cf?=
 =?us-ascii?Q?/Tjb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa70899-3661-4d71-e281-08d8ba24ed9f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 13:45:05.1900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +i+DN2LoZyrF1KWvtXmy+FVXjxxeOEgQcbcsFxu5B1IR76w4kAuLdnTH0ABMectAHpN7AkYWybK5+gFbNAAbP/TfRLW1ZjpOvqKnjvp1sis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2098
Received-SPF: pass client-ip=40.107.20.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/294 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qemu-iotests/294 b/tests/qemu-iotests/294
index 87da35db49..4c375ed609 100755
--- a/tests/qemu-iotests/294
+++ b/tests/qemu-iotests/294
@@ -1,3 +1,4 @@
+#!/usr/bin/env bash
 #
 # Copyright (C) 2019 Red Hat, Inc.
 #
-- 
2.29.2


