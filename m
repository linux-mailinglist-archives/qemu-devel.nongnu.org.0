Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8960323ACB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 11:52:29 +0100 (CET)
Received: from localhost ([::1]:60038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lErmO-00048m-T9
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 05:52:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lErhm-0006z9-G3; Wed, 24 Feb 2021 05:47:42 -0500
Received: from mail-eopbgr80124.outbound.protection.outlook.com
 ([40.107.8.124]:36517 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lErhk-0007Jd-PS; Wed, 24 Feb 2021 05:47:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BU9Wc4i7CJSxiQAdjDfTBB/waWuYUQKWx/7ffPQNHNDIrMOf4b/YTY85bQ5fFdVCgEYxrhkkgPgBedbYnP6HGa1HdfFSa27nN+kxu/Oz6FxvW93C6kqiYJx4ln62wKWd46j2CVFiO5viLCWS6LPWoMlzrb/hggCLZzBgDP7snqFuxjR9p4FgNynfJSfKYwiETMt3IrBQY3vaAXieR0kry7MsuSEkboJ5L8Bu4Kpx91hRZ3Y3Ul1ti3cu1ety/IdhMDwfMhgBicQ/d5T1BIPqzwU5m7UXbioTOCNQckazRBxliTJTCwXqDLqGUdiU9enWRvRjvawl4u9JNQ90pFjZCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQl7AgIhQlAfhNGfT8b9lWU7zSJAvVmRANDnjxdJ8Lk=;
 b=iYZHDO7GIRe+WjrUa9GQsQv0j3s8wK57YCmTplc0eFwy+GPwdE9fh99Gxy0wSu5yT4uN/eDdVUAhHaXcBJ7myrVdK1WbeuqirNfd2P9a0RVbpu5VNfA2Spbai+1f2qiTEe8oKsTYEE/eXoEdZqwe/Mmfalmu5nnwQkCI8LgXdXcOx5K1gKoGj4JkjQjCSTPqamAmXZUBvSfhemrSgup7Ww/2AUBFWEUB94m32RLlfmihnCmAUFIubBJQifeIrlnGwFezyR5FzggVf1GEyMyKYrDvlHA5PBBKBI4vDE0LUmoP8DxEBkVy/CWK7j4eJyaoY6gjZ+bd+1t/8Dt0mO1e/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQl7AgIhQlAfhNGfT8b9lWU7zSJAvVmRANDnjxdJ8Lk=;
 b=L99pjQkqf1tORCcSj/RgQExZH57ieww2Pe9iPyD/dOTdQYNhclDzPo1TEDxHJR/pSjyJYj18Rgvh9eig5wGHzfgsD3C7ERuta2dQLVje+MM/nqAVnvGuUjMTAFFidA/NhLPiSxYiln6G1l/GELCHl1xqkhx6SD0QFdleY2XQdxY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4951.eurprd08.prod.outlook.com (2603:10a6:20b:eb::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 24 Feb
 2021 10:47:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.032; Wed, 24 Feb 2021
 10:47:31 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH v2 5/6] iotests.py: add unarchive_sample_image() helper
Date: Wed, 24 Feb 2021 13:47:06 +0300
Message-Id: <20210224104707.88430-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210224104707.88430-1-vsementsov@virtuozzo.com>
References: <20210224104707.88430-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.244]
X-ClientProxiedBy: HE1PR05CA0177.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.244) by
 HE1PR05CA0177.eurprd05.prod.outlook.com (2603:10a6:3:f8::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Wed, 24 Feb 2021 10:47:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e87d54b9-fa73-413a-00ab-08d8d8b19636
X-MS-TrafficTypeDiagnostic: AM6PR08MB4951:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4951C6D82D06FDE26E985B26C19F9@AM6PR08MB4951.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P/PVLDR+jX5j/2BU57h4/SVHaEM9lAbh4CUKFDgRl8M19xsstVVv0lgJTUBI7jrwC/UkJ6qAvVq4PUlLvHbQ7tjQDDtnuo+aD+bupSpPraDJGazh6gLGdUngrlQKbFN9z57740Sq3jgEAj01+IWfnINuGr6tykqjGitaJEXeUcLo2qbGpPjsKn+vsB82F7Y8sMF920XKd0n+V+e7UjytJILOPisXPC9UEPnJNN6pdN0UiK6xS0TNNiHd8XQFx9vUkMgRFCipfC3tWaMsmw1Nznl2mwF4KZzZh5QXjp4EsORV21cnM6LFZupeLeqL3jEysb4sMoR3KVdhXaiuQdS7yWbyXeUgIX8gS7V/R+i2C0MshMSiAloR7TGCYt/tia0fs0kVjU4hp1Mg7wFpvgEK6SUYnk9es4bpwehyY28qmVqkAC4lYY5/vXnIF6mLOOHCEYj7WnOeusPc71byoNmD3QKb6duJYxhJpn6u+AbpbBJgp5mYOZKHJW5rqi+/yf27tkGwM3/1CUncNSR7vJlAG6BL73Lt0rr15JjYeHYRlFVACZy9Oy3TSESSA/p/hDpS4fIb67LHrGyg2A2KIkwOUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(136003)(376002)(366004)(396003)(186003)(956004)(2616005)(36756003)(66946007)(2906002)(8936002)(6916009)(26005)(83380400001)(8676002)(16526019)(5660300002)(316002)(52116002)(6506007)(86362001)(4326008)(6512007)(478600001)(6486002)(1076003)(66556008)(69590400012)(66476007)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7C47DB3YQQsqXgTKpm2iMchNK+8Hzqxp40T/i7TGezJ6WHW0cgKNuHTmTxOs?=
 =?us-ascii?Q?a4LRd1mu9UDscg0DHbxqPMjq60ZfwGpGPnZOcuvWrhNO6gDfbegNBJCacMpe?=
 =?us-ascii?Q?JZfTwMaZeW197kPTL5l6xGLhANM3/FM3N51lkCZ8qASyxft1NwrcH7CaP1Qg?=
 =?us-ascii?Q?JKSdjHjMHXLQz6z+Piii9wAY9fxkdsrZ61xsz1E0Za4aY2l+sINl+bJIOZM/?=
 =?us-ascii?Q?0li7wtMOp1opyHAZTMgJMa50Oiwo0bu7PYqDwgsTmCxcmqGFjMwd7XjJjWgl?=
 =?us-ascii?Q?S8AGuPMl/AXv6rC6gamdyGEkrxkQcRBXfkvNBKDs819rqmx0XTswPyepmrRz?=
 =?us-ascii?Q?DxSldy7BQrMKjB3JX45GSPz8+zPHbfbM4AEQ6lUpQBx74Y9m2WdxxpZSXGdP?=
 =?us-ascii?Q?ySqTRTE9GT1fRIUOWUcxIgixIYPrmLQwX+mrmYBXt+hE+b/UJ68I/WHuhc2B?=
 =?us-ascii?Q?0PlKByYV4MYev2mkBiArqjC0xAoAChzyFHb6R+j5OdnWX/OimIDJXml14zzZ?=
 =?us-ascii?Q?F5199hCMhew41DeElq5eQ6shuLqU3GFg6y06uzlYs7AY7wUq9qJ3e5e9sK9s?=
 =?us-ascii?Q?ax1A8rwh4mtpNruSux8TsDxwxtcx4/itr5pbuhMtObMpDBUdtuBaaYK9YaOv?=
 =?us-ascii?Q?L5lYFxTo84xWowLN25giJW5SDrzK7aIa5BaCtsM7r8oKh2VdnSDkOBvRIFlf?=
 =?us-ascii?Q?qoMIABRqiprfXVkxGwZd79luduOSyikWXd1+s2xGCYt2FSB1mN2LZFLWjS6Y?=
 =?us-ascii?Q?ccB6eKZUW1CIUIo0DFYk9vPn5Pys5A0rL5tq/C/yLCDmZJ2LqHNW5S7rjcPX?=
 =?us-ascii?Q?9v94NdozX2ztGpZxsZrL7LeGZmNDBTqr/C9CRtLL61ZubXkQkT1fSym8/3Th?=
 =?us-ascii?Q?RM64vhEFPIM89Ggql9gCVrC8dWu294Nik6KO8mna5dtXMbAWfFYYbEvoo7/v?=
 =?us-ascii?Q?zvM+ozO1A3250kx17xqbuBzLCwYd0FDWjA6yL7d/xG8KoiR4osvpNyiWSvc1?=
 =?us-ascii?Q?fHsHAtOX+fVtRB5OK/BzqRYL8t+Vx126owrXx0XSATkIXWCdgzMMKL2gI8+k?=
 =?us-ascii?Q?lWlAVie+NU9PGLm6ZRZEEgZocStAAoT0AOXMtDV7/Bhl2rA7TWgwnsfNwg/u?=
 =?us-ascii?Q?Pj6/MIYVaQB+OxZKcvMQvPsQwRzNKM/hqhqZVmRN7LFWlzizBJQFGaWpYmiR?=
 =?us-ascii?Q?SmVsDqmB4sBwBaLrbITwb/RXRidR4WhYfacskQi6kn0lfFuyQuQzYIw4ILDX?=
 =?us-ascii?Q?P0VKxPMMP5F0L4Rzg+q4B7wP2FlQeA9QXjPeLCPeRqg8MJ0gGDE6JtDvIEaj?=
 =?us-ascii?Q?WzpCHJhuEA9z1l0XjELiBE4F?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e87d54b9-fa73-413a-00ab-08d8d8b19636
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 10:47:31.5619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 615ohcfyjtYIC1zouT7qOksodmzFVwq7Q7cG8n6FCwx0jDAjVYtnVNFx78uuvh7Xmtn2EYGW2VUYYBzTDGU3zqZ5WWoDBPEOPdhTHoSVpYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4951
Received-SPF: pass client-ip=40.107.8.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 4e758308f2..90d0b62523 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -17,6 +17,7 @@
 #
 
 import atexit
+import bz2
 from collections import OrderedDict
 import faulthandler
 import io
@@ -24,6 +25,7 @@
 import logging
 import os
 import re
+import shutil
 import signal
 import struct
 import subprocess
@@ -96,6 +98,14 @@
                              os.environ.get('IMGKEYSECRET', '')
 luks_default_key_secret_opt = 'key-secret=keysec0'
 
+sample_img_dir = os.environ['SAMPLE_IMG_DIR']
+
+
+def unarchive_sample_image(sample, fname):
+    sample_fname = os.path.join(sample_img_dir, sample + '.bz2')
+    with bz2.open(sample_fname) as f_in, open(fname, 'wb') as f_out:
+        shutil.copyfileobj(f_in, f_out)
+
 
 def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
                               connect_stderr: bool = True) -> Tuple[str, int]:
-- 
2.29.2


