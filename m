Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F29622EA65E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 09:17:45 +0100 (CET)
Received: from localhost ([::1]:57988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwhXE-0000dQ-Ha
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 03:17:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kwhVO-00006P-7E
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 03:15:50 -0500
Received: from mail-oln040092253071.outbound.protection.outlook.com
 ([40.92.253.71]:3927 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kwhVJ-0004m5-4D
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 03:15:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HSRLxlVayg4/2RZ/O53wfzmjut1HZFcxfjJKHHFfHMa7mReOVn/4M+krwjyck2jYNe9xWNqojt5lU3ox2/mnOYoQfmKJsKMzoQRWrWoTcR5BihT6xV9d00u/vGPcvXqMU0MibJhMyM6ql122fb9H4CKfHdcb5XCMhliw8HptRAS5doouAVPLqz3t2aLcBf9SXvwMFvFYbfLujbMeEKbyi1wBIMMuK5IPupsFxGpO6KjlKjvf3nITy9c1QoLrpHymWF2RHyNY7IrmRgxobzuFlvJge/5xBrbLko1P+YQ8qhrGslAs1WHM0iaoXklzMD/s4ViRtVWvIZoPngippwxO1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDu/B/DDR/d4h0qsMv11MqzQS6juxlwoDmVWv8uTpyI=;
 b=cpzEqw0t1dF2jDo07vMQomM4IiholWRsaZ0UlEdwaPBf0yCPvd9iVuAJ4AtVPVPr3n7jjs5/ir8mLhWxUKnSCdz1J7VNxudbweQMwhElLqs9eqJt8NsuO6DHejpcqdIFd40z+Drix15Y3chIuO+P399t/u57lVFXGkkrxK6b7XGcymiAl6Dl++531Y7H/Iu8Iwxr3+jXY0LqfN3AgrWNYie5HTHas2BcIZrLvEZgQXhxjgeus2pAjZfsAt5fJjMrUoAe7rfowKl6mxQwqjPdyZErQ/R2Se5hHwfsD/euL4j3OoyUUXvZ26x+TV6DWsRoHeiuZxkEf6ymat8S1xpErw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDu/B/DDR/d4h0qsMv11MqzQS6juxlwoDmVWv8uTpyI=;
 b=UXUoPkeDD4S2193Q4Pxla7PU2HbYoJEwb9ti+Yd0g/H6+HYN0bco7IlIu44aA3dVBAgEG61flEV3nOkpQ8vQJ81xw0LdMIslCJ29Twrg/kD1f6c2iBqIwryeH2Yu22gpyb6TqUzavHUWjUphCILIW7Jy57dNetRe/wr2p8PP5ycIsi4JM0X6Bb91EBtv4/ICOnm/hJP/rwO+E8TcSE6N7D9/5B9yWqU0Xt+xeye8SkXNt7w7YcrKUdd4O0VIM2HJc3D1epZUhtuXRezlVzR3yx7Lf05x3Dky6M4QGX4O+YOXmsqMGQ17Ocj1RpZ5EwKPnji4cJIzoJVv8FEcOGGZww==
Received: from HK2APC01FT060.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::40) by
 HK2APC01HT068.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::471)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Tue, 5 Jan
 2021 08:00:20 +0000
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM (10.152.248.57) by
 HK2APC01FT060.mail.protection.outlook.com (10.152.249.160) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.20 via Frontend Transport; Tue, 5 Jan 2021 08:00:20 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:802EF3BE581888E6452A214D5E765CDB0235EBE78C9CEE07B81F466EA134D526;
 UpperCasedChecksum:8116B074E1AAE04601A9C6D5279CF823A96DAB5ED08A330F2D13025E0113A6AA;
 SizeAsReceived:8710; Count:47
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e]) by ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e%8]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 08:00:20 +0000
Message-ID: <ME3P282MB1745F56064F63115B9D001CCFCD10@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
Subject: Ping: [PATCH v4 0/7] fuzz: improve crash case minimization
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu, qemu-devel@nongnu.org
Date: Tue, 05 Jan 2021 16:00:07 +0800
In-Reply-To: <ME3P282MB17456B93AE422008F433C50DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB17456B93AE422008F433C50DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-TMN: [XlZ7Uqvxg1Sx4lgUQWWo26+TQywxYgdM]
X-ClientProxiedBy: BY5PR17CA0070.namprd17.prod.outlook.com
 (2603:10b6:a03:167::47) To ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:ac::12)
X-Microsoft-Original-Message-ID: <74eee2cc934078b68cae4e1b200c7d293dc17d28.camel@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (104.225.148.49) by
 BY5PR17CA0070.namprd17.prod.outlook.com (2603:10b6:a03:167::47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend
 Transport; Tue, 5 Jan 2021 08:00:15 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 89197174-d402-49c1-401e-08d8b14ff2c7
X-MS-TrafficTypeDiagnostic: HK2APC01HT068:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oO/sPld/GxOTXupAjOD0HyAJPNE90YdcUiqzbHzcKUz3K7G5DMKKTMSY8RJM1zqVdYDVHV9KeJLihiUf027H2U8Yfl6D4Q9NgKTzQKP+VjKCgkesiskWA94YArj7p/2afvSyUfWHMVXYTb2npC1U2FYVCcBCQaI25PmctBdOjsr65FszYI2hzycJ5txk22V7knfNOepUqnSaQ1iIisg2BoRb492N8NA7xqcWIKv9ILcosYd1MecLV25XAggj34aA
X-MS-Exchange-AntiSpam-MessageData: fEbzc4H2JJYs8l18nqIAPnzcIR3yayOzNSAz3/nwz1oPAlwpBada9VR9WzPpwuRPzU88jVJF5Obcd7V9+jwytIjH483sHx8YcEyCVKLBszJTLj5OorvZkgcyhLAsFR6wOYN2Xa557C9JDCjC5OlBAg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 08:00:20.6024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 89197174-d402-49c1-401e-08d8b14ff2c7
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT060.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT068
Received-SPF: pass client-ip=40.92.253.71; envelope-from=Qiuhao.Li@outlook.com;
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
Cc: darren.kenny@oracle.com, thuth@redhat.com, bsd@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kindly ping :)

Wondering if there is anything wrong with this patch?

On Tue, 2020-12-29 at 12:39 +0800, Qiuhao Li wrote:
> Extend and refine the crash case minimization process.
> 
> Test input:
>   Bug 1909261 full_reproducer
>   6500 QTest instructions (write mostly)
> 
> Refined (-M1 minimization level) vs. Original version:
>   real  38m31.942s  <-- real  532m57.192s
>   user  28m18.188s  <-- user  89m0.536s
>   sys   12m42.239s  <-- sys   50m33.074s
>   2558 instructions <-- 2846 instructions
> 
> Test Enviroment:
>   i7-8550U, 16GB LPDDR3, SSD 
>   Ubuntu 20.04.1 5.4.0-58-generic x86_64
>   Python 3.8.5
> 
> v4:
>   Fix: messy diff in [PATCH v3 4/7]
> 
> v3:
>   Fix: checkpatch.pl errors
> 
> v2: 
>   New: [PATCH v2 1/7]
>   New: [PATCH v2 2/7]
>   New: [PATCH v2 4/7]
>   New: [PATCH v2 6/7]
>   New: [PATCH v2 7/7]
>   Fix: [PATCH 2/4] split using binary approach
>   Fix: [PATCH 3/4] typo in comments
>   Discard: [PATCH 1/4] the hardcoded regex match for crash detection
>   Discard: [PATCH 4/4] the delaying minimizer
>   
> Thanks for the suggestions from:
>   Alexander Bulekov
> 
> Qiuhao Li (7):
>   fuzz: accelerate non-crash detection
>   fuzz: double the IOs to remove for every loop
>   fuzz: split write operand using binary approach
>   fuzz: loop the remove minimizer and refactoring
>   fuzz: set bits in operand of write/out to zero
>   fuzz: add minimization options
>   fuzz: heuristic split write based on past IOs
> 
>  scripts/oss-fuzz/minimize_qtest_trace.py | 257 ++++++++++++++++++---
> --
>  1 file changed, 209 insertions(+), 48 deletions(-)
> 


