Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3348530FF91
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 22:48:14 +0100 (CET)
Received: from localhost ([::1]:36422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7mU1-0002cZ-16
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 16:48:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1l7mSI-00025h-Hh
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 16:46:26 -0500
Received: from mail-dm6nam10on2101.outbound.protection.outlook.com
 ([40.107.93.101]:26145 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1l7mSG-0003oU-As
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 16:46:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ST8OJnjpFnE6xd0WbIQrAsyC3zq3BXgXcZpXUJ6MiQJBhRitj1wmIXkQX4U8LgfVYLKXDzCBcUtW0bletS2djXUA1erYA0Ro4M0v5FcKpA/QtqSqwGTicYezwabF0IlC9kZlAj17USZaIWvd+Koogr7/geyLw4uzexgTn2B+AQIGp6DQQA47WcN+fNSH9N1eo1IgeJ6tx29DK1hYE+LPZjAvSL7w70Rmc1X729/XkqodetDTTKyOKHqNzC91e11KmzLZ8dxWC36YZ67huMD6A87lHA9EmrxJ8njsHRrtR6riw7Vf0OV/E6O0z1Ur1rgNcYhh7R7E47eFg9SL/B3wfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r14tG3UEoRHO6wLQjO2ou0OwMF4M4cuHTczDMv1VLh4=;
 b=Iy1URtTUxkX4F+ThMLiyjW4GL0Wvlq1Fti7eUGlrg92zOsArZ2zLeDf4c1RQ36jHPkd33BZhtNPlXbddnhdASg/s61bOZqo5vFmr7lkcFE0RsrVO/Ga4kgZigZBX7vx5Ujk8tQGYQy5zhpLbEQi81/RuA6eUn1jhZT4ym7RLi76vYPm5Y8c0hJxVl9mNNEHiee4uth8j4YVAV/oGPCYKlq0uRNvCt3XYW5Z+udihdk/uFp5G1ssg+wiKacn3A8LtDl+cIG39VKfxYanJPaxeh6pvTmctuwRqINFe3npoTPDIh2Rukk6Su6h2KFtmnsMO1qSR2FUTmwIGTBIO2kwWmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r14tG3UEoRHO6wLQjO2ou0OwMF4M4cuHTczDMv1VLh4=;
 b=CEtqVjymUgAMNtYV2BIk2r4KgrmO0nMiJPSS/BmPJa3HyB1hVcYy6zKKwsl2Ng0d2ZHcxMBbfAntwVaUuHFotyf9PPwj5gYVD3oKUET5oirmcnBK8MdNpaM/xXM27/gKZ8bFTvV6yMfJFNKIzBjRNYCatMJEF79EDxuZAyfxGCM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SA1PR01MB6768.prod.exchangelabs.com (2603:10b6:806:1a9::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.27; Thu, 4 Feb 2021 21:31:12 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5%6]) with mapi id 15.20.3805.027; Thu, 4 Feb 2021
 21:31:11 +0000
Date: Thu, 4 Feb 2021 16:31:01 -0500
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, cota@braap.org,
 richard.henderson@linaro.org
Subject: Re: Detecting Faulting Instructions From Plugins
Message-ID: <YBxnlZFkp7YA9PXL@strawberry.localdomain>
References: <YBTRSK4/F5KLH+FZ@strawberry.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBTRSK4/F5KLH+FZ@strawberry.localdomain>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BL1PR13CA0352.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::27) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BL1PR13CA0352.namprd13.prod.outlook.com (2603:10b6:208:2c6::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.11 via Frontend
 Transport; Thu, 4 Feb 2021 21:31:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c7a16cc-1060-478f-702e-08d8c954315d
X-MS-TrafficTypeDiagnostic: SA1PR01MB6768:
X-Microsoft-Antispam-PRVS: <SA1PR01MB676893A711FDBC30B3CF20588AB39@SA1PR01MB6768.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ulz5raib+bNgmaAgW0HfYN5jfPb5ifuJJ1JkE/i7C3Aw4BZ1rP/GP3LglKAVZHeOHgtEK2YIReLZTzVddBbQXwBtBnYROGJ8J/YMDls74rThS+NZn/cHjBIUQiZ7l3PNOrGJyIHGKaHDL8dUS8MC6Gq2uHUsrn5A4oIBIYBrpqHFEmQrg/KL7vzih3K3Ux+3lwy6rroBYYVa/AA8lDActN/Z117zC6XWxn29AUx7wGhuMXx2tDVQbIGnd2x8AjDR7WVxwTtHayf4CgYa0k0vQGzBaJB81SknoMK+/LGx9HOV7VILYfr/tgIGoXu55ZXvwis/pFfrazFZX+gY4e1FEfENq1x4zjBhwnrkbpxyV7FOPd2YFbFO1PapvNR3SuC2wu0Zg5mdCGiGzKT9JcW6R2KmunRnhloYeTtMnlaQIdsiwgBGALvL9iIezaizp7aEIF3tZKjGD+LaJz3LMWQOOiIA+G5/04Qr2JPtqqpfjr8h9WKuYbT59urD9fU9udggekUVzkkaeaifkYD24p79SQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(39840400004)(366004)(396003)(2906002)(316002)(8676002)(55016002)(26005)(4326008)(16526019)(6666004)(5660300002)(86362001)(956004)(186003)(66476007)(6916009)(66556008)(52116002)(7696005)(478600001)(8936002)(9686003)(6506007)(66946007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?VPn2/WLELJGzmumAWbNCBEVV7SvxsFU3aGa3euRt7ItwY4F9YBN+lmEZUeYR?=
 =?us-ascii?Q?Y4bknpLCJziM/1w/UfXDDPzOVlXwOJIVLpZvvQtQz6bJpCMizLsiRdQaCDdJ?=
 =?us-ascii?Q?Wf+NIb58P6gXUSgfylH/yk/CbSqHEqqXmv2r5EvFotEGW0WeZehUikzK81FD?=
 =?us-ascii?Q?Lswp4mjAWEUGLDRgkCqaK2wg7/D0V9sSL5fB4YEr9yWsdo7xGNUnVbBKD4lE?=
 =?us-ascii?Q?DH+V+EHVaT4XOeVcAnaSdIXJ1S//2XFJBiogOEPRE9SJhvJkVtZBE8duxbyl?=
 =?us-ascii?Q?Tb2DFYUP3qUjNJhzjoB1yXjVzrWkUN8bOpZOPfpT8ILP7u5fGsIV3ozuSy+v?=
 =?us-ascii?Q?4VAkS1aAGgXXcsKfvjWvG8ro7q9pkimUoE7S0CWNxfcJ67rnBSzM0vHQvXMh?=
 =?us-ascii?Q?/l9jaJ181IZDZVixLdJnHRFDcRggFYQwBvc+6eKjMNUQmafx8DXPM6sOsYQ1?=
 =?us-ascii?Q?6mST1RvwDl9qiQGk6iLKnjKaDaAS1btH09Oirwwt78vSBZdngCl7E7c/W5WG?=
 =?us-ascii?Q?c4exnsdwK52OxL7ENZkM3AR0xDF6z5r+q40XqVXG1LpZHJOJFUiUzSnkZgKx?=
 =?us-ascii?Q?Kw2q3XDIIrYqi7ANn/DMo3SfrqEnykOOguwll3k0lYpHqcd8AIYQpJPAp30X?=
 =?us-ascii?Q?/Ha5BGc7sWZueIbG72n+0iwM40gQgRqSyH/8wjSfILdgI5dXo0I+PEprRPPT?=
 =?us-ascii?Q?Wcyy7od6ezXLIqA4MnTNawnh5lWghcM2uYrVbn1zMvw0wZJYBhcT37PdgMZv?=
 =?us-ascii?Q?GQNLVPm3OT3b0lo3gv28HiTi44Is+8XUzb7Sdwg9h6mcyCcZxatKkl/26Cz2?=
 =?us-ascii?Q?evWsB4Ri8sBVl6Q+7ES1nzf5M/cqxesXK9jKFUzyhPg9HW9w5frBJOeylqy0?=
 =?us-ascii?Q?/wrPqNIYWVU1Ts1AUKXkhTBuHMvXtglLE+lgaEHnS8tpT3/HPXXLYRS1/ugj?=
 =?us-ascii?Q?PZarme+YRu59vHAj/mbIVcHjl4QtGtRb3Pdo/zIej7SiAZ0jvxFOBJYwUbMZ?=
 =?us-ascii?Q?Q7MeppzZtzn6VUuq7AFCIsquwf6rK+EL+fptq4biJAHdUhyvm6qKt+tqM4Zd?=
 =?us-ascii?Q?vqemTJ9MoBpOuStukXR4KnMqtZjuEE64VF5OkJLWulOpChT+dDpqepNYDNij?=
 =?us-ascii?Q?rCTT/8hJEo6uJ2qb/FsDOVAy2N9fvC7vY4bmHbH3sjNYnnjjXzu6KRSeKcf/?=
 =?us-ascii?Q?ZU6guPyvyL174SO8BKKC5YBI9P2oLnc4AcIMZf419XEedBZunTiavYFzKbzD?=
 =?us-ascii?Q?kUfPq79XubJO4A1Y+2OkMR3C6opwtY+TQ+ivY0GmN1t/KQ52BGBTDF9Hh9AZ?=
 =?us-ascii?Q?DTn4LDb/ZBBKxfqEMsuvuzy/?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c7a16cc-1060-478f-702e-08d8c954315d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 21:31:11.8526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pCUEp7PoUjHQHmpuF9vp1kcy95hBwyrKkkti42E7RkfQstVRTUtjMTzdwjJdNGjI2hOFjniXE2oCfwbKc2uS49II0M3BYwVoU1H5oLC37ZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB6768
Received-SPF: pass client-ip=40.107.93.101;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

On Jan 29 22:23, Aaron Lindsay wrote:
> I appear to be seeing that if I register a callback for an instruction
> via `qemu_plugin_register_vcpu_insn_exec_cb` I receive a callback even
> if the instruction faults.

I was wrong about what I was seeing - I made some false assumptions
based on incomplete information. After adding some additional
instrumentation, I do not believe what I am seeing is explained by
translation faults, and think it might even be a bug.

For the below output, I've got a plugin which registers a callback via
`qemu_plugin_register_vcpu_insn_exec_cb` for each instruction executed.
I've enabled `-d in_asm` and added prints in my instruction execution
callback when it sees the opcode for the `ldr` instruction in question.
I'm running a local source build of the v5.2.0 release.

Note in the output below the instruction at 0xffffdd2f1d4102c0 is
getting re-translated for some reason, and that two callbacks are made
to my function registered with qemu_plugin_register_vcpu_insn_exec_cb
(the "*** saw encoding"... output) for what should be one instruction
execution.

Do you have any tips for debugging this further or ideas for ensuring the
callback is called only once for this instruction?

----------------
IN:
0xffffdd2f1d410250:  aa1e03e9  mov      x9, x30
0xffffdd2f1d410254:  d503201f  nop
0xffffdd2f1d410258:  a9bc7bfd  stp      x29, x30, [sp, #-0x40]!
0xffffdd2f1d41025c:  910003fd  mov      x29, sp
0xffffdd2f1d410260:  a90153f3  stp      x19, x20, [sp, #0x10]
0xffffdd2f1d410264:  b000f2d3  adrp     x19, #0xffffdd2f1f269000
0xffffdd2f1d410268:  911c4273  add      x19, x19, #0x710
0xffffdd2f1d41026c:  a9025bf5  stp      x21, x22, [sp, #0x20]
0xffffdd2f1d410270:  f000cad6  adrp     x22, #0xffffdd2f1ed6b000
0xffffdd2f1d410274:  aa0003f5  mov      x21, x0
0xffffdd2f1d410278:  f9409674  ldr      x20, [x19, #0x128]
0xffffdd2f1d41027c:  913d42d6  add      x22, x22, #0xf50
0xffffdd2f1d410280:  f9001bf7  str      x23, [sp, #0x30]
0xffffdd2f1d410284:  91003297  add      x23, x20, #0xc
0xffffdd2f1d410288:  91004294  add      x20, x20, #0x10
0xffffdd2f1d41028c:  1400000d  b        #0xffffdd2f1d4102c0

----------------
IN:
0xffffdd2f1d4102c0:  b94002e2  ldr      w2, [x23]
0xffffdd2f1d4102c4:  12002441  and      w1, w2, #0x3ff
0xffffdd2f1d4102c8:  710fec3f  cmp      w1, #0x3fb
0xffffdd2f1d4102cc:  54fffe29  b.ls     #0xffffdd2f1d410290

*** saw encoding 0xb94002e2 (@ 504107673 instructions)
----------------
IN:
0xffffdd2f1d4102c0:  b94002e2  ldr      w2, [x23]

*** saw encoding 0xb94002e2 (@ 504107674 instructions)
----------------
IN:
0xffffdd2f1d4102c4:  12002441  and      w1, w2, #0x3ff
0xffffdd2f1d4102c8:  710fec3f  cmp      w1, #0x3fb
0xffffdd2f1d4102cc:  54fffe29  b.ls     #0xffffdd2f1d410290

Thanks!

-Aaron

