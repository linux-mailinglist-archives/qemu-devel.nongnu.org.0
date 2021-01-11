Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAD62F0CC2
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 07:11:43 +0100 (CET)
Received: from localhost ([::1]:56244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyqQX-0002zx-V0
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 01:11:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyqPM-0002OA-Pa
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 01:10:28 -0500
Received: from mail-oln040092254016.outbound.protection.outlook.com
 ([40.92.254.16]:28449 helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyqPG-0001y9-LC
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 01:10:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nm7cY6Jk9i/zf6N4o4/A/YtGasJhVC9nviXhFUwBziBySErushTlWMnEhzXtdSj8Mi1uCT4prdxZTtXTHGfq/oGNQACqwhfXX8aX4ZRgF/8htie6SuWqsz1epYVkIqWuHRmE+Yv8gv2eWcplfIj3BnI4aX9Dxoi/t1EeFv9GcncAdpgNXBX9E8DTmwmJ6R3Whvh+aRI17Pg8YHV2Ra1eb5rdVM+M17q/fr0QV82kIqq44nWgYcd0804iiQ/LPJEwfZ7Z3TQenId7yHWS89LF57s669bWtHuzGuJH7abUyeVaw3D3LR/lIWXVtPFvMtS/FC+MmPbO7H1YxOmns2kw0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=og/MAoSgbJLHWZI+mTx7J5rt92qrm0F1TK12jQHDCUk=;
 b=eJ9MH57Tmev03xeRRFeEcEwed8Ct1R3W5/QpWWHgVjwjDMTLax25QDfDKirbRv4PQNuTeQzgD29s18BSOS4O5zWJBApJCs7KcLA2SHXwwEfr1vxOeQL32jrlbuSZovzMRRleK+W1yDVOofmIQkAZpiuh/YvbUrOpUYh6aI+5oWJUok9/ycEOsWGflNmzw4+2baXw7VRqtog4zr3DTNDOc59mP6qxRg1344P5FS2HtUvWCNjUHGyM6rBlS/0pnal5iHPUAMZvHYHGNSo43SRO2UDoet1WbDW7rnxyL6vCoSchSTVgKOyUPVfsFfuGwC/qYw51dcs/wzmaU38fxVefrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=og/MAoSgbJLHWZI+mTx7J5rt92qrm0F1TK12jQHDCUk=;
 b=YMFEijijt3oOGIlnNAJW/BX4SecBWLPtYl6s4AYXG/4j2WCKCaFKsFWSkORqA39vDg8KBhMHKO/7xxzqtEzmm1RSu/zD6gj6F8We9mtu3+isL4j/Jo8P7zA5tVwEXE4odIt8wvyRz8FljyE3YoVBAWU3CQ94VAMXQbcMgviWBJedfnRNlRxm8/XS6jwnet6zSbcRS4Jq9e1xDwbYTNi9tOe7urEtcvKtDpnF6cdD0ZZ0FD4NBlff4+NXAMLrgZBTouJFP4pc1jLvR0sB/MLq40K7uq+dvzjFy5laCY4Aa7kZSqEaUdmJF4LszK7KNzyABnJMhO6Nz0sE3XVjAFkWLA==
Received: from HK2APC01FT054.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::52) by
 HK2APC01HT210.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::385)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 06:10:11 +0000
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com (10.152.248.59) by
 HK2APC01FT054.mail.protection.outlook.com (10.152.249.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 06:10:11 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:58836878AF9E969EA467B7280CD31CFAA94B04D7459B1C5DEA3CACF6E9FC1D2C;
 UpperCasedChecksum:42100777C3B772C7CE8DBA7BEFE5AF2CB816594E88594F916CC3D3068D6BF066;
 SizeAsReceived:7357; Count:45
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780]) by SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780%5]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 06:10:10 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 0/7] fuzz: improve crash case minimization
Date: Mon, 11 Jan 2021 14:09:51 +0800
Message-ID: <SYCPR01MB3502FA4DB12C240DD3CFF1E0FCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [ahoqnknjHNSuf35pE8uG9eBHi/SMpyRw]
X-ClientProxiedBy: HK2PR02CA0194.apcprd02.prod.outlook.com
 (2603:1096:201:21::30) To SYCPR01MB3502.ausprd01.prod.outlook.com
 (2603:10c6:10:3e::12)
X-Microsoft-Original-Message-ID: <20210111060951.175963-1-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (111.176.239.56) by
 HK2PR02CA0194.apcprd02.prod.outlook.com (2603:1096:201:21::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 06:10:09 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 5f189786-cbaf-49e8-25a6-08d8b5f78d25
X-MS-Exchange-SLBlob-MailProps: gjx25WM8ZNWt8qMG3IjM1tewnTO4qKhaHQScpNj5/ZyJU/22nV2nvI7vhXS3zXq+0dgQnyt5VdIy8AeJzzhYBiM7qelxhUSQwIN7dnLf/LFpdjL4+O9BQWdggN8azLzLwedbnlBjqCgAU4ZErrVgr4eNjn8MkMbDsmj5eyXb4rs2ZN1cBD4h6KuUX48VGV2b1TbrQowIMIlBGu7prn0M4PwwxpeFb+7eQynNqJRq+UtznZlISS8xrLiP3iOjQGMuVMsnulgJFt4GBxmqfZ9t1A8/tJG72SD6XRDdokJHy3jj2tdJb80J6rSmh/T6IVtkCeMmqLB3Da3TXeKFmD5hnq212cM6+lPa6/v85KGHA5Pag+CuBt4q/7+GpmEIBzB3h3vXYoeOAwvshTlfAT0ih9q4pqBwFAD5gPlZpe80aiGh7HNfgiDwI+Yxht2GePdCHANY8Df/SC8tEoM6GXZBVakRrR156diKEAnLAvXvfjeew7tc6icjMZOZoBmUwV5Q1HMHImn0VwYQSbOUTgQTsSQejZmO3RbDgu8HYgx/t0ZXeQc5dEEoHorKff7Iob3k9qhWobsrqlVRd2lX6pn0E+pDQ4F+OtyCwZL23lexl8HHqDM4KDfegsWmFXzfp4wKcCU1yEBdFyAHQQ21HtWPe2aSX4rrjXa7WKRy5SOn04zCrJqZ+zEBie49JrOju1PLIXcaYGoG6biPDo5xTb3pCEtl+c1dPq4HkmjMFUmrw6w=
X-MS-TrafficTypeDiagnostic: HK2APC01HT210:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZaYjNG7PGKFRBqorJjrcRss3jGaJ7TZyQNG0vrvNAoM4m+lKPAVxY31ZGfSFaY4L2NKQ1pg31Lz5uAPR56Kxq6s15rgfMJfU1q3mByGYz6BGGvmx17+reqAu5LAuVglknaADyh5pHpMTC5bp/drCo2emQy46OfpRtb16Tp4snbZS3Ufg5S2WSGPHqhGex725tk61JPdXkrNPpXX1fIiAtMUa5fSnQVb/lrwf1JZ62Q9BhY/ooCSo3r5UTZ4FsllW
X-MS-Exchange-AntiSpam-MessageData: 9h5U1sdV/xawahtWhmM86N/zNlyx1dHIB02Y6jKnWCjG8g06tnhsoUbJQwo5MtHAlKzSTFR6cpODuCOzgEcWJTP1kqcQ6G/ta2U2PnddzdvIP2yF3qqCPrEb/96YhBrZUccL5JK8ziwiwrakQHGw+Q==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 06:10:10.2046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f189786-cbaf-49e8-25a6-08d8b5f78d25
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT054.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT210
Received-SPF: pass client-ip=40.92.254.16; envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-PU1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: thuth@redhat.com, darren.kenny@oracle.com,
 Qiuhao Li <Qiuhao.Li@outlook.com>, alxndr@bu.edu, bsd@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extend and refine the crash case minimization process.

Test input:
  Bug 1909261 full_reproducer
  6500 QTest instructions (write mostly)

Refined (-M1 minimization level) vs. Original version:
  real  38m31.942s  <-- real  532m57.192s
  user  28m18.188s  <-- user  89m0.536s
  sys   12m42.239s  <-- sys   50m33.074s
  2558 instructions <-- 2846 instructions

Test Enviroment:
  i7-8550U, 16GB LPDDR3, SSD 
  Ubuntu 20.04.1 5.4.0-58-generic x86_64
  Python 3.8.5

v8:
  Fix: [PATCH v7 1/7] misused the bytes type
  Add: [PATCH v7 1/7] warn when the CRASH_TOKEN cannot be found

v7:
  Fix: [PATCH v6 1/7] get stuck in crash detection

v6:
  Fix: add Reviewed-by and Tested-by tags

v5:
  Fix: send SIGKILL on timeout
  Fix: rename minimization functions

v4:
  Fix: messy diff in [PATCH v3 4/7]

v3:
  Fix: checkpatch.pl errors

v2: 
  New: [PATCH v2 1/7]
  New: [PATCH v2 2/7]
  New: [PATCH v2 4/7]
  New: [PATCH v2 6/7]
  New: [PATCH v2 7/7]
  Fix: [PATCH 2/4] split using binary approach
  Fix: [PATCH 3/4] typo in comments
  Discard: [PATCH 1/4] the hardcoded regex match for crash detection
  Discard: [PATCH 4/4] the delaying minimizer
  
Thanks for the suggestions from:
  Alexander Bulekov

Qiuhao Li (7):
  fuzz: accelerate non-crash detection
  fuzz: double the IOs to remove for every loop
  fuzz: split write operand using binary approach
  fuzz: remove IO commands iteratively
  fuzz: set bits in operand of write/out to zero
  fuzz: add minimization options
  fuzz: heuristic split write based on past IOs

 scripts/oss-fuzz/minimize_qtest_trace.py | 260 +++++++++++++++++++----
 1 file changed, 213 insertions(+), 47 deletions(-)

-- 
2.25.1


