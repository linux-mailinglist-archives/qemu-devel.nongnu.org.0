Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DDC2EED67
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 07:21:47 +0100 (CET)
Received: from localhost ([::1]:36000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxl9d-00019E-T6
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 01:21:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxl8B-00005q-98
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 01:20:15 -0500
Received: from mail-oln040092253108.outbound.protection.outlook.com
 ([40.92.253.108]:8143 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxl85-0007C9-IL
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 01:20:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3ELBzWg7owyaa72KIopes93bdA+jywiwRfa7pUmfXV0zJlAixOilUeUWcxrfByTOWHHSo+y+y3EitOE8U5dHthTUyGm7WomwJxcc5puphfK6aoZTk0lFahsQAyTUhMf8ddNi83aI9d0Zkfqm8OXBA2Xp9VVGYEqKcYwCkKLEjuFT6JuiLv9XGkwhxy4hSsmSPb2rQzU9Kl4PZJ0QvjKhWh2NfcUlsTiFSdWWy1uDQA2N9XQ86sguDgwosHjM0QUuMz0vDToXptn+ZSet+nX2sQmlE8iUC68YsZPHDF3m4XnkzBL0OakXC4P4zOWgh+HbZrzMb2s6po9/QnXBzqgvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnZil+J+qPA4e78/7mML14c5jm3SaZeHzXghtRk3kbs=;
 b=jQpIXjJze1sejy7grB46Foe2ZhTMt8wbNOR9c8RLd7zZcyPppi/u8i4P2A3M1nYWkEqPrToaZ0BLjD5t8ei8l4KvXM1L4QkxkTcysft8acfEPCwmQJGVp8HDaGMiz+88U3QQJaMFItkh909FYNzX3ykY5yDshvOke5dZjjwX8u0QtLh6WW+yrSDm/uk84BBFVHKcAnWmDHFJkSXOR47XGicj25Y03QIlxVtWMD/q/1niqAHRT4OONC1PMecxlsperMQWkmtN8G4c6/03AlTIZQBsZHy83xwLiznZUac5YTVcoAPIwX8FbXC1xLyHKeuWIKSKxKDqo21RnfGxsAcMXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnZil+J+qPA4e78/7mML14c5jm3SaZeHzXghtRk3kbs=;
 b=B6jbahf+T2LvP46rLj3OtCxgPpRlVAanmjhc9yuDyBSrYdELzWBvCFLgagSOl4WKuYkJDzaPXgePZUJhwlhUV2VBJngeBENUY4dqpeHWn8Rls64oP0FIGQMd9ITjP1mRknSitaFnmYFBIUhTlPYqLcVrLvEAt2kXNrAeofmIAhQl9iMZdpccvzFugW9xFpVldEQN4EYgyQpgAH0rYmePkXj63/O0p3Hpc7KnvuCOtsGx8q5he2sYoJQuM3qQlu4mbBiAk5fyW8FW44U7CSTi9uTnse2yCbPwM9YVSOFHiFx+pWfFBas6arFXTTcct7KMil63RAgT8Y+dhypLeVbT3Q==
Received: from SG2APC01FT060.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::47) by
 SG2APC01HT043.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::244)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 06:20:00 +0000
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com
 (2a01:111:e400:7ebd::4d) by SG2APC01FT060.mail.protection.outlook.com
 (2a01:111:e400:7ebd::409) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Fri, 8 Jan 2021 06:20:00 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:6652789A97EF7A4A07C5F60AC2F3AF227115040DE6C3F76E4FBE8329059DC65D;
 UpperCasedChecksum:A1A90AF8FB92700FD8E362DAA445C0C34A30A5C10B271A1FCC61A468A7CB11FE;
 SizeAsReceived:8761; Count:47
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50]) by MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50%7]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 06:20:00 +0000
Message-ID: <MEAPR01MB3494AD5BB9FE8C55A9B35274FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
Subject: Re: [PATCH v5 0/7] fuzz: improve crash case minimization
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: Alexander Bulekov <alxndr@bu.edu>
Date: Fri, 08 Jan 2021 14:19:43 +0800
In-Reply-To: <20210108043008.nqo3dssgduwjuyar@mozz.bu.edu>
References: <MEAPR01MB349464ED835FE8243FB09100FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
 <20210108043008.nqo3dssgduwjuyar@mozz.bu.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-TMN: [NEbuOns2nQsOlPVJ+A2toON5lOZy+Euo]
X-ClientProxiedBy: AM0PR10CA0041.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::21) To MEAPR01MB3494.ausprd01.prod.outlook.com
 (2603:10c6:201:39::11)
X-Microsoft-Original-Message-ID: <7d5f18e60d245b63efffc7dd03a72e924f548727.camel@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (104.193.8.207) by
 AM0PR10CA0041.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Fri, 8 Jan 2021 06:19:51 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: bb5ecea3-7f3f-4d8f-0dea-08d8b39d6dc3
X-MS-TrafficTypeDiagnostic: SG2APC01HT043:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SGZKOGaP9oRckCI2pspwSB6HAROTkWe/f9xgGin6hIHUwiLVSY0ZC0/Big3YDQSrlkwY9KmkYBCU/xeTSVEnJXvJsDhXudjhz+BXHU5ey+x7fpDBeqFLd4B8xK7QzKBn2vu0JbEJZixu1OW6rCxBrV54Bnofg4vDVqp8U8E7MasR+twzTcWOsJDgqSWSklLPo2Ha5RZiuwF54tkW4XVO96bIt+mBkXtC9FIu5yFn4WG6a99hjjmIO6jmicslEBLe
X-MS-Exchange-AntiSpam-MessageData: O+Im8NNpvEv7sKsYbmgpXQHa/VBNFnl0wnRNqfzZsImFjzDeRRcOxUHnkOowa9gBn8VlPBsjt6KhuV0AaEgHLWA9Q8P2irzGroUQidnEEoELpBuBH59DqIM9bIx3Sma9NJoHtBm68AgHh9gr5gbGGQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 06:20:00.1904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5ecea3-7f3f-4d8f-0dea-08d8b39d6dc3
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT060.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT043
Received-SPF: pass client-ip=40.92.253.108; envelope-from=Qiuhao.Li@outlook.com;
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
Cc: thuth@redhat.com, qemu-devel@nongnu.org, darren.kenny@oracle.com,
 bsd@redhat.com, stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2021-01-07 at 23:30 -0500, Alexander Bulekov wrote:
> Hi Qiuhao,
> Can you add my Reviewed-by: tags to the patches that I have reviewed?
> Thanks
> -Alex

Ok, fixed in version 6, thanks.

> 
> On 210108 1044, Qiuhao Li wrote:
> > Extend and refine the crash case minimization process.
> > 
> > Test input:
> >   Bug 1909261 full_reproducer
> >   6500 QTest instructions (write mostly)
> > 
> > Refined (-M1 minimization level) vs. Original version:
> >   real  38m31.942s  <-- real  532m57.192s
> >   user  28m18.188s  <-- user  89m0.536s
> >   sys   12m42.239s  <-- sys   50m33.074s
> >   2558 instructions <-- 2846 instructions
> > 
> > Test Enviroment:
> >   i7-8550U, 16GB LPDDR3, SSD 
> >   Ubuntu 20.04.1 5.4.0-58-generic x86_64
> >   Python 3.8.5
> > 
> > v5:
> >   Fix: send SIGKILL on timeout
> >   Fix: rename minimization functions
> > 
> > v4:
> >   Fix: messy diff in [PATCH v3 4/7]
> > 
> > v3:
> >   Fix: checkpatch.pl errors
> > 
> > v2: 
> >   New: [PATCH v2 1/7]
> >   New: [PATCH v2 2/7]
> >   New: [PATCH v2 4/7]
> >   New: [PATCH v2 6/7]
> >   New: [PATCH v2 7/7]
> >   Fix: [PATCH 2/4] split using binary approach
> >   Fix: [PATCH 3/4] typo in comments
> >   Discard: [PATCH 1/4] the hardcoded regex match for crash
> > detection
> >   Discard: [PATCH 4/4] the delaying minimizer
> >   
> > Thanks for the suggestions from:
> >   Alexander Bulekov
> > 
> > Qiuhao Li (7):
> >   fuzz: accelerate non-crash detection
> >   fuzz: double the IOs to remove for every loop
> >   fuzz: split write operand using binary approach
> >   fuzz: remove IO commands iteratively
> >   fuzz: set bits in operand of write/out to zero
> >   fuzz: add minimization options
> >   fuzz: heuristic split write based on past IOs
> > 
> >  scripts/oss-fuzz/minimize_qtest_trace.py | 257 ++++++++++++++++++-
> > ----
> >  1 file changed, 210 insertions(+), 47 deletions(-)
> > 
> > -- 
> > 2.25.1
> > 


