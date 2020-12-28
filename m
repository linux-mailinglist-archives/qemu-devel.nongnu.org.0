Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 807F12E3461
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 06:43:49 +0100 (CET)
Received: from localhost ([::1]:50028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktlJs-0006lY-4G
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 00:43:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ktlIk-0006Gw-38
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 00:42:38 -0500
Received: from mail-oln040092253028.outbound.protection.outlook.com
 ([40.92.253.28]:53696 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ktlIf-0002ul-SY
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 00:42:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUSdqzaVdWtekLWaDN9LzJhvWZcrM9hRBUE+Gs2DCvJtXECRelkFa+3/hGaIH/NqfNejQ/F+zqgxFkxsr6fSiJHGdEZYNyGd64lCk4YOYbOL8Q7IN+Z0RhPSlwTFRzgGt6+p6wrghObsZafxIEIVzUozRae11qU5YR+9L2gNxIjA5fnW6002roOXmukwfsbV1m58KLsKNHMMIQoyMlMCxUFfjcle2IJ3hlTl5sE4HxhZyOLvjbhq8pwI/r2eAsz1jhol/2jw0Sb1nr/BnC1Ea3rhe/MDM2+dU7zPM5irVbkWb0iz5HoX4Sp4rXQ9/4ngCX2yKfFCw7TiVF8z7IDSoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iw1o+6nld5Loo7Yzg+e0RELE3z4jjQeYibIDmhH+kyY=;
 b=c4BVTYMJ/BHbMUaJMDB/FJ/Khb+Zvitc0K4BL0YNurzYsBzuznFG5MvIfasTJN5+nyCJpfgTXyeBG8wFluMjh1rHtz/obXyWnm4H9k+902/6z4GFlkgTzhn1cJBdUdp4nuhonetyZXnXwUqhV0OsdOM0JoNbyzsgp1UL28ho64NtN/ggWyizoeZE0FsBpP0APoLS5nXrq6VBiQQ5oy9kiIOO6AwSXiKm/8TOz5iQ2+wRJ4qLQ83TQ0G1yv8lj299tnx8aEs3H+kJyMHDFWzga0XL526S7KBoAM6YMAyNnp3tRkhrsPXmcyzvveqpKbg8Kox/LXnk94AGHdTXLkrT+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iw1o+6nld5Loo7Yzg+e0RELE3z4jjQeYibIDmhH+kyY=;
 b=chsDeCQ1WQHBcxKEd75U76zUB3nzZDn4o3RsDGDiAU3sS8Y6SQ+KQrHYSI+LuJ2F9N0CtyJdSgjLBqBg5lIBmflLdqOGjP7iUVnaY4wTClyu5mAnIj0jhUgX67DefklJE0/cTUI3LpNTi7cpD9+wS+MHfH6brXedqPCIVzueJmMYiBsWCuv6V+//TMtvzMopCO1go44BRN+LqZ1lcSE2Ns5tfd7nI2ZsBCPDTg+tlmupsUywqzvY2oXNPHC4BR+0J8S44bImeW6MX+N8+oCuSwQdtS7Q9QQirF5SD2fPuJBca24WbnHXQ8JN8f0xFlC029h3KRY73ywRWRXP6fDB7w==
Received: from HK2APC01FT044.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::44) by
 HK2APC01HT035.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::350)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Mon, 28 Dec
 2020 05:27:17 +0000
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM (2a01:111:e400:7ebc::4f)
 by HK2APC01FT044.mail.protection.outlook.com
 (2a01:111:e400:7ebc::371) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Mon, 28 Dec 2020 05:27:17 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:5450B2F29E7CFDB7036697993CA47E2BC07DE49365C9F045F5C744B2CC567EF9;
 UpperCasedChecksum:93CB1E517F9AEEE033EBD5C3E657590DB0B18E5D60BA981BC1885ED484C2FA94;
 SizeAsReceived:7447; Count:45
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e]) by ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e%8]) with mapi id 15.20.3700.031; Mon, 28 Dec 2020
 05:27:17 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/7] fuzz: improve crash case minimization
Date: Mon, 28 Dec 2020 13:27:12 +0800
Message-ID: <ME3P282MB17458B2705C43E860A26171DFCD90@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [ZKIG2Lvn+TH9EVDRv95BTNhQKQeyXgxkLhVgbA/N2y6GkdDdT/7Zgks41UAXhE9t]
X-ClientProxiedBy: HK2P15301CA0023.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::33) To ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:ac::12)
X-Microsoft-Original-Message-ID: <20201228052712.3663702-1-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:2110:d78f:cec3:aac7) by
 HK2P15301CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.2 via Frontend Transport; Mon, 28 Dec 2020 05:27:16 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: a82cc84d-080b-4418-7d45-08d8aaf13dbd
X-MS-TrafficTypeDiagnostic: HK2APC01HT035:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hZi8BvywwqJ+3lYKVMvQey9LP2H/Ba5bYyOBQHTpLHJAz724ji8Jq0ONkB7Uun4NxEjj9BLE2lQCEdGJ7SXP9FmsxUZNiQNFowgy9ozGxHUrdkd3gLBqqhKPFpo1tbih9Ts0wa542rTK5vhODQ8Bs3YJ6q13HiJMBz/gX4uDlu7adn61ys4MslPu3iSb54+6yk4bc1IST+zxlgtyBjpgy6cm4lt/TTAgIl73BvBzKwWB76vAqBl46zpebU588t2m
X-MS-Exchange-AntiSpam-MessageData: ZRvarWE36Cq5d4sm9EtGWS9Pj+XYGDsnKcm2d7oXtbmUMm9ERg7RdZ3gfDExcR+sDySr+M+CHOAQO7C4cZSesDNf4iFg8WtJtEKeRyslogH67j9QIYpZAonzrCN3wGQ6sSV/QXWxl1GbSxCbKlbOImX3R6lILV/QiLxnfLf9RlOvnknOH9moJvIf5Sdiadtm46ySpSWkjiPpVPJVL9mb+g==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2020 05:27:17.1409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: a82cc84d-080b-4418-7d45-08d8aaf13dbd
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT044.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT035
Received-SPF: pass client-ip=40.92.253.28; envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
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
Cc: darren.kenny@oracle.com, bsd@redhat.com, thuth@redhat.com,
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

v1 --> v2: 
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
  fuzz: loop the remove minimizer and refactoring
  fuzz: set bits in operand of write/out to zero
  fuzz: add minimization options
  fuzz: heuristic split write based on past IOs

 scripts/oss-fuzz/minimize_qtest_trace.py | 256 ++++++++++++++++++-----
 1 file changed, 208 insertions(+), 48 deletions(-)

-- 
2.25.1


