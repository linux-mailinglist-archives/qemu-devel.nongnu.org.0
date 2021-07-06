Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9CB3BDEA1
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 22:53:53 +0200 (CEST)
Received: from localhost ([::1]:51046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0s4m-0007oN-Bv
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 16:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1m0s3l-00079N-1P
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 16:52:49 -0400
Received: from mail-mw2nam08on20723.outbound.protection.outlook.com
 ([2a01:111:f400:7e8c::723]:43617
 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1m0s3i-0002f5-Mk
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 16:52:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Szm7ToscOQm3oKhivtT+IJyzzCX2NeLBMo0/5/cA0bp0qfNgtgW14f5hwzLdcTlCJAErDU2nYc5q7pU5liU2WTL1LGSi9TADYY2H0HXa76sckKybdn8QmeGHMRhzRcbkcPk8oOXbqkzqSvCwXSqMttI6eRPOUSTb2FSIVIfPZQSblRkgP9yUyeJGX4Tq5d4LV+BIiEQncNhCmp/+iwz6PhUqN0idRcbi34AYUzb3S4gN7O1a14QhtHCVZFX6Pt1v7ku7c59zAsrtMSG3o86EbbKeNYmzA2Yn9JaFVbBvuvA6zsd3/isZeZCROEQwaZjIwPCYJiWXV1uLccEfnzdGpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WMPBvjbuICkslulvNQ3CGdtmO9WeYTeVtILxfBVr9t4=;
 b=JVKQLZT3pLmVaJQjYHTIlkaEqTMXvN1qlnB1xZx+TCKr/oU6R7UHbtp0qObAh0nGpNZc0pXMN8Jv+gR7Lli1lrwGSYpOZe5TrCNDTMBGgjD1Y+RF9dqRmk4zqFlx3o+5HhTOPftmOca5V7qZDg89TBytRV5j4xL1Xcud6xa4hG4sVHDw9vYBEwWvH6whF8NdrilitJIJxNTKAtfKGjbxxtNZcJ1+g+AVPUx5jS7aOg2wbvkdSvPxAOCTNsFptvCpAO6qEDmMBiz/C6abXTkVPuww4t4y9I60h4XWaGtLlDCtexbZ1lJnQWggr5yKABVplz13m1iyxnsqxvqTY0Ouvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WMPBvjbuICkslulvNQ3CGdtmO9WeYTeVtILxfBVr9t4=;
 b=MLXam6ubNEzyi9RxfKUOZScyBRxJRakGYZyLzXy4OFPAjCz/lc7DbWGvlh+bbZBTZcv9bNvdS0se7LQj/VpCZeR1hW/2c16j9xVusxxtlKfhuEgr8bTyWAZt2336MrPu/3T1oQ7wvbNfk6edthFlXzLi7W8Tqt1jmI2PFfbw1DY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BL0PR01MB4291.prod.exchangelabs.com (2603:10b6:208:4b::28) by
 BL0PR01MB4385.prod.exchangelabs.com (2603:10b6:208:80::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.32; Tue, 6 Jul 2021 20:47:41 +0000
Received: from BL0PR01MB4291.prod.exchangelabs.com
 ([fe80::ed26:7a52:86dc:f1a]) by BL0PR01MB4291.prod.exchangelabs.com
 ([fe80::ed26:7a52:86dc:f1a%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 20:47:41 +0000
Date: Tue, 6 Jul 2021 16:47:34 -0400
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: cota@braap.org, richard.henderson@linaro.org
Subject: Plugin virtual-to-physical translation incorrect for some IO accesses
Message-ID: <YOTBZiyOcNYcqjOO@strawberry.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: CY4PR15CA0020.namprd15.prod.outlook.com
 (2603:10b6:910:14::30) To BL0PR01MB4291.prod.exchangelabs.com
 (2603:10b6:208:4b::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 CY4PR15CA0020.namprd15.prod.outlook.com (2603:10b6:910:14::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.24 via Frontend Transport; Tue, 6 Jul 2021 20:47:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed40bbe7-ae03-4a1d-51d3-08d940bf4c47
X-MS-TrafficTypeDiagnostic: BL0PR01MB4385:
X-Microsoft-Antispam-PRVS: <BL0PR01MB4385EA962B3AFE100197BD908A1B9@BL0PR01MB4385.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f1uLuDiCoc4dtYRLM3p7+/L6Y1q4XGG7+4xP8ky1GYzdwojt9rzQsTPdFS5JeLc9jp41wP8d7C/K/mYi0LSXGR4zsT+ElwfBLPq40mt75a8GkGE+wuYVl3TBqRZ6jojVo3OVBjH0ngipcH/kUQD5gzm1xcHS7X5tvuVbnmlgU4VGnzWmwNEFLVP3zHbEJygGm6U9nlyabmB4KrjR+SFSyStmfAfVuZbq3nL2BZ3g/N5HU/qBoLh3GODZONDbZw3Vdu64c5lgW8y9mGcqxMikEvnqZ82bjGNcpnloPIBbSAV4jvHEdy1b5gAfLw1EcgAaFG8r4jc8OadA0XleOzY3eYWt5AklklpQQRyebb8sZnSsZGUim3Z7/Yt6nMCK5irKqQ8Q5NbJohT1RVNwasETVVzBymWqcpYYIQgoH4qrLGhAW5djzI6qrax6xpvfyk0bJUyI94o58fkzOFVsP4AOUjX6IV4QINZ1hY23Zb9C44qhI0+MWkROcTWOJeunKSi2uOpK9OG6wjTNAAbZvrPEAnP5K30D/V9osUrU/OCRTMqFhY+9SBlm4TqR0pjsop3kxCt81psJr27pt/+yz+YvLbleTdBgujzMcBwoKtrcod2IeAeA88p6ev2vhhDvNSTUncr/6XOtTg/m/svfuXd8jLcLW2fhMvpXQN2Fx08/Z9IXVDEpkwbPilld3MsaU/2FgDCcKqjcIResJYRDIm3j6cECkG3btuTryKykRJrbR+QCYD1vp20AuQt/Qh4ZwAWcwi9pLvsVTY89Zy+3YJLsBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR01MB4291.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(346002)(136003)(39840400004)(186003)(86362001)(6666004)(316002)(4744005)(966005)(478600001)(956004)(38350700002)(6506007)(26005)(110136005)(8936002)(2906002)(52116002)(66476007)(55016002)(5660300002)(8676002)(66946007)(38100700002)(9686003)(7696005)(4326008)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B61zVB3/Ne57lYMplMwQKQhi6MGoLwO7820EAW8WeR9RRSAwX88tJeDENAYw?=
 =?us-ascii?Q?TbIykyfgpaz/JBaRv1Am5r0rj34PM4Zxj1esBdyLjdciKeUBkzPo02A70F/a?=
 =?us-ascii?Q?0DD2mHaCoW6O5jV39JAmAvD5zrPRqPan30nf5agLWBUlwSngDpdWpDqQCaO3?=
 =?us-ascii?Q?V4sCNZao1rHqr1pnbnaR+lQKbYDebkwofp7TBfz++t/wb2cYonjZDDEEmJO4?=
 =?us-ascii?Q?FOuusxvpTxFYp3VM9nkMllOaPQLZjLv1ezxerlDw0a5rKtMmpG+Kpy2YIvM2?=
 =?us-ascii?Q?9ftf0Pl4e55XKtvzYBJhMf1HsnlwMpXJhnO3dYiKTuCVc75h7afeXF9jgKWK?=
 =?us-ascii?Q?T43Egk1WsEfXje8w24rRhk8VovTfZ16MwjT6jfWWNJsYFHJhN1iLO7qUj9W8?=
 =?us-ascii?Q?QCwBOBg0uhrN/iq8j7VUIlfov+w2szcPkOShOttnufHaz5m9H5dwmEISVTzv?=
 =?us-ascii?Q?3EPzs+m+NEvBh/PmjtVNVXJ76DQHmt4NCOVkXE3jFA0/IXpIcHsrSwtIObKE?=
 =?us-ascii?Q?GZFlpixnG3yqlUxoUr1PQULWfOhQVqriuD4xyBPwVGI7k0zZc16Yk4h2ZANb?=
 =?us-ascii?Q?WLqJ+qzmMdh5gZhVw1y+AN51+A/Y5xw0aJvlju3NGI00Gt8c8uJ14QGIWdlH?=
 =?us-ascii?Q?2rMKsMl4GvSyTJ30yMXUbECL0hlWIfyOfta5uvUzisg2jvfvJ9PK8RI4HGpM?=
 =?us-ascii?Q?ti9g8Lc3Fg7zYpnos7ZKEEW2o8M0APXC9u0v4EyXw52S9qWg13Bpz8py1+tO?=
 =?us-ascii?Q?JKTTG8QztMoaLeG+1Wj8v9PU8x+AFOdlHyPEqmymx1HvEuxWQe0qdkLSRTl+?=
 =?us-ascii?Q?2BNBdIX3ysDhjG+Htd7pSJpimE6UPsCx8DVne8JcdxJdTK7gyUkts++TZWak?=
 =?us-ascii?Q?BjAt30y/zua+B741GXuGkKu2KYYIvLJVkLtotUw5X8nBoy3JUQwFgY0CIYbE?=
 =?us-ascii?Q?PbbvSvJ8YVGsYdKDHnZEAK6Z3agCWwA8NvhGtp2YfHP3/bA6A6GvkttNjMtM?=
 =?us-ascii?Q?JBLuPoPoOncOK719Bsj5O1qOqIm70ICMeNlC7I5xPItdv+G7scugkPOkEZNu?=
 =?us-ascii?Q?JHh9LNu7S9uXjJVf0XxFCykcG0mQnTUWfQNs6bSTOtJfWhay3AnjFBWmD27e?=
 =?us-ascii?Q?Ac77k8dQN9rg74nizW2U8a/JIoTN8LOSMYn2OJBsL+p18+Rp1iWPXdgQFPBN?=
 =?us-ascii?Q?G/h/P/BQOujbRKs55gG2K98+9+8HMAwDFeb096E9t+/gWyT66eArX/wMZAii?=
 =?us-ascii?Q?gxcSyYXhWkCCTYwoPQgW4u5oIE2iL0cma6Wdttl1Pcc4PuOgTsQfqwBfilGk?=
 =?us-ascii?Q?h70uq6z1YjX5pwTBzolUfPy3?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed40bbe7-ae03-4a1d-51d3-08d940bf4c47
X-MS-Exchange-CrossTenant-AuthSource: BL0PR01MB4291.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 20:47:41.3218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKCU88HftCDuxd3WncjilI6c90y2FNzktA4N3oG5ilWgV5XtobKmQ+/E+znKws3sqWxskRuHQRXNXhf/oWDjUF9HKuvhJUiboVyuklG8d2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4385
Received-SPF: pass client-ip=2a01:111:f400:7e8c::723;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, MSGID_FROM_MTA_HEADER=0.001,
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

Hello,

I previously supplied a patch which modified the plugin interface such
that it will return physical addresses for IO regions [0]. However, I
have now found a case where the interface does not appear to correctly
return the full physical addresses.

In particular, when in qemu_plugin_hwaddr_phys_addr() for a particular
store to IO memory (haddr->is_io==true), I find that haddr->v.io.offset
is 0x0 and mrs->mr->addr is 0x3000, meaning 0x3000 is the returned
"physical address". However, I also find that
mrs->offset_within_address_space is 0x8000007000 (and also that
0x8000007000 matches up with what an actual translation would be from
inspecting the page tables).

Would it be 'safe' to *always* begin using
mrs->offset_within_address_space as the returned physical address here
instead of `haddr->v.io.offset + mrs->mr->addr`, or is there a reason we
should not do that?

Thanks!

-Aaron

[0] https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg03137.html

