Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7DA350603
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 20:10:29 +0200 (CEST)
Received: from localhost ([::1]:54874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRfIS-0000w7-GU
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 14:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <S.E.Harris@kent.ac.uk>)
 id 1lRfDE-0007et-2c
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 14:05:10 -0400
Received: from mail-eopbgr40063.outbound.protection.outlook.com
 ([40.107.4.63]:46341 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <S.E.Harris@kent.ac.uk>)
 id 1lRfD5-0004SB-JQ
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 14:05:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZFVrLO1dccsKUQS62+N0+0cVUZLjMHwYB0ax0gJ1SO0bBoC4PugV0CiKQ1wSkNnXb8FRgzR0obW6+E1oSnpe7KhogQ5U2ASNAFz7TiiOZzOws5wLCnpNTmdHCj2aD+zALWRYoKlVYt6jcWQPaTjfy1vP/MFFRCA+TdKOY7bjciIbGq9RuBdqD9C7R5z0+Aw/Ve7Toba87cQ8FEyQtBSa4qyt9tNGgHqXe6R7lSBwaHtA/nkHuM+mur0QVPQOTr+3NifO0jTjrqAYpm8Ozqmp+w/Nf/pqgf3CDMu3DnZPzutSJrZQNnjfwUYCAgxR5OhTN30WHRR+TFx/Z+54teMjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90CkQE6igeaq4oGWEWRy5vhhirSR/RV75fbYUZkhQeI=;
 b=YDMvNMzMcV5MF+FriZI/BxXbYHaQN4g3nBanVSXH6W6s2NcAo8d1XzPPUC4YgbX+Pn3zTYnP1hQSKuDPy68XyKxtlDfmrw2T/D/yuqNJm4uzCezL3SFmQ+Ic+BHP3/sFN57O8XX70tKUpk/Al5giXBOW7nFEql0iE7AUwg3rwtiIRZZqnbMdFn8OrXN0S+HKSlYgU+cW0X6jp/5Hb0UnUGd5vkwbxeYhQk5ioB8vapvidVqD0x2ktz6MDCk1TZl5f4IELlNSZl3AaGrCh+ds5jf+JnFrPt9K4HtYd0jBIOGy7Zf6E30G2urg5Pg51ZI3pHC2x5akK2fBTh50200vyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kent.ac.uk; dmarc=pass action=none header.from=kent.ac.uk;
 dkim=pass header.d=kent.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livekentac.onmicrosoft.com; s=selector2-livekentac-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90CkQE6igeaq4oGWEWRy5vhhirSR/RV75fbYUZkhQeI=;
 b=Mb3gJGgJel3Cva0b5R/UujXgNCzBTxKQISusoK3oaguP74gqBA8WUiPLCN+jC/qI1rnwbtFDlGMqEzO9axuHkzeLep19b0AU/vmGue+KoBEctELWt+0lA7ht8zY2NcTj4VayrCkiTtSt2b16prX0ds24ZFkHrHjAMp2AfkdYK4M=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=kent.ac.uk;
Received: from DB7PR01MB4092.eurprd01.prod.exchangelabs.com
 (2603:10a6:5:2c::13) by DBAPR01MB7157.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:198::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Wed, 31 Mar
 2021 17:34:44 +0000
Received: from DB7PR01MB4092.eurprd01.prod.exchangelabs.com
 ([fe80::29f8:3034:6643:b516]) by DB7PR01MB4092.eurprd01.prod.exchangelabs.com
 ([fe80::29f8:3034:6643:b516%7]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 17:34:37 +0000
Date: Wed, 31 Mar 2021 18:42:21 +0100
From: Sarah Harris <seh53@kent.ac.uk>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: Status update for maintainers file
Message-Id: <20210331184221.d81b4ffed7c7c733c33f8c66@kent.ac.uk>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Originating-IP: [195.213.130.164]
X-ClientProxiedBy: LO3P265CA0010.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::15) To DB7PR01MB4092.eurprd01.prod.exchangelabs.com
 (2603:10a6:5:2c::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from cadance (195.213.130.164) by
 LO3P265CA0010.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:bb::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.32 via Frontend Transport; Wed, 31 Mar 2021 17:34:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1448d8d-5669-4cac-7dec-08d8f46b40fc
X-MS-TrafficTypeDiagnostic: DBAPR01MB7157:
X-Microsoft-Antispam-PRVS: <DBAPR01MB7157980AFC3F1BE449911E51F77C9@DBAPR01MB7157.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5vmnsEVhGByx0aVJfS/hogqBa4a0Oa++0KXwsc5i9cp/Z8mldFl5T4RN6XBmvAIPF2s4wTioQq202msgymSToaaCgIYNIphDER7QqXCHwyMMT1J/cYNbAJ/jO3p2HkSSyAVK4phbYFWn7ASUY2Hit7365hCnOJsDJJYtcElj/hZMfN+/zyKyTlPkZIJ8cTFide6TxThMZJ7ilfSf5EN0GmCR1gJaYHN4XRRXAEoZZ6kwv/6EoH0y9fraN2AQDN1TX0ng8EWH+FUzsU5h8HcPkNX35qiStduPIJcg2B7PYp9xg8mEbVi/ZJqLZc6TwRXbUJB1bbArWYTZXitaKbJp8VyGpTv4u0s5cCVe6qH55x1C3ntPHDcZZKmryiKh7lgVHhuvjy3zh3xaiTXOSoq/dLIPHEqHUWv0lNkf4MwVNhz+r/kkDG8RWXw7D1v3wM42xfZJBSmDwUd5ZowGOnytXokqYD+dPbCoTYc5TmCfwi0MPnXNa4Z37KrJt7bUe/ZOdaYs0mbiIfUOCULg/KHl0Nl9ueYv1c3RQO6TqQHH1027LpuFbA28xsHUHbRjn6r0IUx9mJFXlBt9mhR9AUre/i7M0987lqmA+Bh+IjBN1GLAF+TUyUbMGSAF4u83SMeYKTPsvyrTXrbQoMqo6NsxCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR01MB4092.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(39850400004)(376002)(396003)(186003)(956004)(2616005)(83380400001)(1076003)(4744005)(36756003)(16526019)(66946007)(478600001)(6486002)(66476007)(66556008)(6666004)(52116002)(8676002)(8936002)(5660300002)(38100700001)(6916009)(316002)(786003)(26005)(2906002)(6496006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?nc8dK0E8CntkE18P+tn2NMF7nw08MoY8DJWfKLIq0lEABR8jan9onc2Qj+rL?=
 =?us-ascii?Q?Abw8jE2cVEEnNzuA/As+ryxwGjDtj7csSaa1tAwlGOtxoBorcW+wgo3U1IiZ?=
 =?us-ascii?Q?xn+WPCXe3kmbaSPS/VToPrkN083xix+6wS7UKwiGr69EklKftOKsoacHYs27?=
 =?us-ascii?Q?xRliZbSU3Ut5poRA7WQmRBURzBv13zAvnxriQT1ObihentRwL/LzyIMeSmPx?=
 =?us-ascii?Q?PrDO/36E8kY7camLapXNObNZ/O7qmAvzwhXEbogYvx82Q9lSxl4WO5yFKLCU?=
 =?us-ascii?Q?vftL1uCuhGeBdf1sukDFwRWNXPHvyxZeXj0p2XUk/WVx8uByaYs+btYqivF9?=
 =?us-ascii?Q?ri+ToxUUaG1aNPmNSQS/Tr9kgRxfMxNjlU3V7Ng2YViKvGIrjEtdxxU4GRJZ?=
 =?us-ascii?Q?NqvJOS3xUT+iKY9DHbzql/B6PTL+iJwENP9aoq3YI5N3g/ebVhKPWkdWd57K?=
 =?us-ascii?Q?4hQeKSiCMIfV1GPWHcB6AFMfwMclezKho//D1rL4nOppSxRs58DJuFW5tH0k?=
 =?us-ascii?Q?b0mKNlI7YHNKAcbEymd4mcLKiTh77oal9IZHtYdFTIgyZqBetMDAyL/sI48Z?=
 =?us-ascii?Q?LVsSWs+cK5toBEnKqgF04MIqtUU5OG6KcVbPZJ5BkfnchRwWlKM+1fJJVsUR?=
 =?us-ascii?Q?ffJjTumyqFy/ctC/vu/Zu3In1wcUFq2B+u5s+MXk8jEJa4YVUfqx/6Ww3hPk?=
 =?us-ascii?Q?4/DnQByyQPOCJZyEr8AYeTbYsjOZUkU3RTi9JhTNQNMmDZ4B/zGavk1Xra0k?=
 =?us-ascii?Q?Wo3/LpbpqPkwx20kdOGnKcwAahSqdAYm4po92RKdWt9gh6mPW2XSzInQPmMp?=
 =?us-ascii?Q?GOXqTxLmTQM8RiX0+0TSnh5v7nmN0ynuAXcmgJp/Sbmg0gP9sRVL0fLnR84B?=
 =?us-ascii?Q?NKOM2I9Z1sW3nbC3f79O2E9T19/hrLlwQU2cnNgEUxMPUA53HREJcAnDcJh8?=
 =?us-ascii?Q?s8y2pViJi+YosmMN8EsWfy+JCH70eB+MPUCxqBRU2YbnnWiSB+Pf0PMgCkpT?=
 =?us-ascii?Q?H6xDFHiB4UfnmiEC1BfVVuToY0u2ByqHjgaX7+sxGnRA8p/VdB5IvV9YlpHd?=
 =?us-ascii?Q?cJNSYYXrRfWv5akF1/0j2hnQlvTug6L0TOWg8KZ78Xn5wxOzacVpdQELVCcH?=
 =?us-ascii?Q?vza50MK2YIUbXWKYpIj8PhqxjGQ8XvwzbQeCNGpQr3kJG8SFJrE+QResdToT?=
 =?us-ascii?Q?38MC7XIwwo2a+6z1axx4uMeLkPXfcop0F/KNw5kM6rlmEtR5Q4Z/yV2wfiKb?=
 =?us-ascii?Q?1i8gFLPG3RPex2+L+upfrWWo7b1c4eom9WnepE1+40j1b80vq1MTkioUxYNh?=
 =?us-ascii?Q?q7JbruiPsoxbpmF1jzD06wWb?=
X-OriginatorOrg: kent.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: c1448d8d-5669-4cac-7dec-08d8f46b40fc
X-MS-Exchange-CrossTenant-AuthSource: DB7PR01MB4092.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 17:34:37.4895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 51a9fa56-3f32-449a-a721-3e3f49aa5e9a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /gw4zUVQyZ5rEOkb+U9mJnBRYLcJKB+Ak04XJHreQlaAiPJNNJCJHllzM6jWBZcuz6r6rFYc6+v6OBFWk0saUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR01MB7157
Received-SPF: pass client-ip=40.107.4.63; envelope-from=S.E.Harris@kent.ac.uk;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

I was added as a reviewer (in MAINTAINERS) for the AVR target for the duration of my research work using it.
The funding for my project expires in the middle of April, so I will not be able to provide time for reviewing patches from that point.

I'm not sure what the process is for removing my reviewer entry, but I assume if someone needs to be notified they'll be a member of this list.

Kind regards,
Sarah Harris

