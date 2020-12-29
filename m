Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFB12E6DC9
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 05:41:09 +0100 (CET)
Received: from localhost ([::1]:54574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ku6ol-00043C-Pr
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 23:41:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku6nW-0003UV-G5
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 23:39:50 -0500
Received: from mail-oln040092253059.outbound.protection.outlook.com
 ([40.92.253.59]:12299 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku6nR-0003f2-UH
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 23:39:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtmUXlaL2eTlG7ekXMU511fMNT0PMnOYuHhihWcR4W0wuIO4mjMybPF8cWqaTlGKIWVBp+FHuPKKFxrIMBFABgFmMbhPdp7EGeD49x4meq+5/jBLC9RjbXCp0kBOfdzYTO/XsmQ/1PXXDAgL3vvKR9yB5hD6m0mEuf/rOHBMCaebsAEtY/ydfs2qaHs0COq/GrgM/yusc4lxlYn2/KnHFusrwQrHvS1MNvvHzQGlm3OZFjPVdmwz7LtQQtljG8ZRwHahWwFKqLPuvmlgsUAQSNL1CKojQecQjaHq7WX3rVdpoIAWW1DhWwfV+VilVc6sPDtydSjpgCBA+P7T91AEXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4xwKTzIVPFFc9/ZodUXgpHWdXUz09QWfmb/pAg7+Mw=;
 b=TrdKp7saFh/4/O3++9TyGAsPkREEJmJloOoXRVsv0WfWZ33aYJbK8hEPVQJSk9p1tbXl3f2zbt8l8cG4QQxOzT4aSGWHztJ+W/1wHpDOFfCXluVPyAD60Gs9aMzgjWZ7gFgHeNROmbXLQLCPQBBeoh/iFiA8xl1HII+bPe9590UiXyaBX0AxxH7ZlFAvGREAEqDJA8+AidP/Z72LiQTokTqa6oxXku2JITYbtm1zFNked2bAGX+d6sssbflU3PclacQvKyk67SEBJQB347PcMM3VwH5QMBwvJtz4NDmNwY8XWZKfw/7P5EesgBNSp3esfboW1fmJ1fRCX5wjotCVCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4xwKTzIVPFFc9/ZodUXgpHWdXUz09QWfmb/pAg7+Mw=;
 b=GLld5wok7xDTk8goa/PP4tBde4PTyxMIt3/grHI7SNBpMVZlCAv283KNeHh3nHSvS4bOWjxmXTg7fw10EIxi44zGCFFy/Q2sGdLX/FNEu0urAWgzGpoiVSwNt+iPQWpvIKZ+nJDbJWTob5GTXt/ajt7VQjiMElxqcPmfWiExzED0zW2wmFqjB5C6cHAhu/fhFM6ei7lVpHfJjy6JS2hwKTtriFRNJmVpwlQ8/KEJJrBCdVvi3fJnj3HjBgjydRHJlM8xZH5cMRE9Y0fZObX51hsmO67Xp03CXAiV4mVWDZHewsBsXFRdJh1jN5DaXf8/+04t2yhGg4fZKf37KpKcyQ==
Received: from SG2APC01FT025.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::49) by
 SG2APC01HT009.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::197)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 04:39:32 +0000
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM (2a01:111:e400:7ebd::44)
 by SG2APC01FT025.mail.protection.outlook.com
 (2a01:111:e400:7ebd::187) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Tue, 29 Dec 2020 04:39:32 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:1D8BD707208D9F93CE229EF5BD79152C6517B0F6C0AFA59E93058B02B74183F4;
 UpperCasedChecksum:50101737E2AA65BC5BE4C602FE1C78169965582ADC3C5075FB9FE1BBA6F56E7A;
 SizeAsReceived:7460; Count:45
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e]) by ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e%8]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 04:39:31 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v4 0/7] fuzz: improve crash case minimization
Date: Tue, 29 Dec 2020 12:39:13 +0800
Message-ID: <ME3P282MB17456B93AE422008F433C50DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [WZQl/YUmocbHE74l4o0AJI7v7o4lpfcKUYbsk1F0+8huzxo/nDAQGhgrplddvGzQ]
X-ClientProxiedBy: TYXPR01CA0061.jpnprd01.prod.outlook.com
 (2603:1096:403:a::31) To ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:ac::12)
X-Microsoft-Original-Message-ID: <20201229043913.3706089-1-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:6d26:2348:77a5:f7ed) by
 TYXPR01CA0061.jpnprd01.prod.outlook.com (2603:1096:403:a::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 04:39:31 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 524954d1-985a-4a7c-4ea1-08d8abb3bc45
X-MS-Exchange-SLBlob-MailProps: gjx25WM8ZNXNvqD3/CHhguXtu0t+EKJepWF7lh9dBqKvQRwNZu0ml1+HStNj8Kh+sB8aF1tAQ1AVKS/0+GXGQ+NEaeoYq+ANK/1HoCtRYUJJIau88MvmmHOu6IZ5EP80noODuOpC0rtkJpar1l5VYEQkYBnydcIbpkF1W6Lgt6wlM0dTU13w05pu9bxNOLSECJNIPePghrSZf4EQtiuCfmrM2Yopx3RRu6dWHazGrT7rD39a4xgjypntBBbYwMmZX/ro5IwOAxvj0eviNKR+Rvp7EXD21buJOabmaOB+G3iG4+yZcut738spiVKC0rmTTQwAKc9g4LmmiEXrWy8IVnD39+W84WYydNFs6ShkZjXylDzv2GxQttRQn5u9rwTZOGLX3hCxFYMTcVFPYRS+7etWargV1fA8aHCi2mgyASHPU2ktUz2Hbpvuqh4ciPH4R2nwqqjP3k8cEFdIUmM/+090rgOp+nj5qSGAcKe5fmWoAM3JxNUEmZDEAEip9y5x8nPzkZ57kokqFGaifI93vzDhb4aj1pwu85XzOiL+raYjx1MMgKUrSGOePHyjL/rjNMErLFvUXXhSFiKY/fQrcsNPFVGV7597uivhWFbQckZu7KMe6CNAn7oddDlmRZXAX1GBWv30xn9eJnd2a8nTzz4xucSEI0TH2dxtfGdpab3PQ2YatWugGCtNhzPszj8k0B/ilKCK8lQKIVWk6nscYTP3i9xEWl9kiE+g3d4E4Wg=
X-MS-TrafficTypeDiagnostic: SG2APC01HT009:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b16/VEqfUdxYYKoAe8P4X7pJLs5MCXiNW2r96yJUkY4loRY5+P+tNVz3ckhk8U0SEa2wEUoieCnUhfYsNxbZUjU+uvlW9y6d10oB+J3THqNu+QkJ4XZ9yqa2+1MieGwLgxAhNq3Vi1GX7lOGVxxIwjJbWMCKucdfAWVYdShNTtaDteFeWFAqHp+sIgSMOlKuzaiu+yzsqC7me522/OJZjuPFyPjclENh1egH0rS4+gcGuY/t1Tc+wk/lv7xgQZV9
X-MS-Exchange-AntiSpam-MessageData: MA4yDn1gKhQj29OObyxdNGz6Reajnjwc0pLdlhKI44zcE5PjWlqrHfr4GOAPENVsmmssRAT81slreK9vbOrOf0nsXkEiR/2t4ei9h4h7kT/Nn6tZOan3JICEEIuA7CkIwgavZBfgtDpR7r3fxatGl5gyCrj91Eble2Z+ZsUIAgUYwNckhRdIs2x1Dk7imFLgn4ulS9eDmtVvz/RoApZN3A==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 04:39:31.8442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 524954d1-985a-4a7c-4ea1-08d8abb3bc45
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT025.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT009
Received-SPF: pass client-ip=40.92.253.59; envelope-from=Qiuhao.Li@outlook.com;
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
Cc: thuth@redhat.com, Qiuhao Li <Qiuhao.Li@outlook.com>,
 darren.kenny@oracle.com, bsd@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com
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
  fuzz: loop the remove minimizer and refactoring
  fuzz: set bits in operand of write/out to zero
  fuzz: add minimization options
  fuzz: heuristic split write based on past IOs

 scripts/oss-fuzz/minimize_qtest_trace.py | 257 ++++++++++++++++++-----
 1 file changed, 209 insertions(+), 48 deletions(-)

-- 
2.25.1


