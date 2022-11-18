Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAACB62FFAB
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 23:04:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow9S3-0007J9-Id; Fri, 18 Nov 2022 17:03:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1ow9Rr-0007IR-UL
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 17:03:00 -0500
Received: from mail-bn8nam11on20700.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::700]
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1ow9Rq-0007TQ-BD
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 17:02:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0K54krdF27S0fBDbAzs3o7AQq/yyXDrv1mesAsFLe25cra/nqRiEv/PbqxEdjq9f+ZnZklY+MwT634TlJUDa5b+hOBideXzUYP7HcRtpmJzxwLQk1517Px5sANsDu+2pccuMTAvR53Fpb9INblrzQ3VHQrL+983KmlXb1m3Udc4Ut/NR0k3rr57nNbf3a1WQa48FyLhH3KKZh/O8izWntjTYEiQ4MG0KxkwWmlfJgZZg+XXXBxv5qXcZ1oSNnOLBDSBp/jLiooIGF6Vt7Te2rgZuC8/uUORSvPIomEayuZf4xyNk+fz9TZ4JB3iBxmyhwal2j2VnQtu4SX4KRFm9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WrflZsmKVuPgNbcHw7V7qlZJsqKtIhHmdHN/pT3p3U=;
 b=Keja8cwAe4SKki1a6mSWbaYInLvn1dhleB7vYvGYwbXoTCZ74UBFIBRpuQSB3HEmUtWUkCNGmLuRbpeBfRoA5wu6aIjGenY/LcNkzvrhwHOqh9PbVbSbs1cvPJX0CrI0BMVyiaf9j+gXiSAtV5yjTQz5xfAkjKi5/JUArCDpgND2U1LtvHMbGXxTlWMA4iJr3sugjidB40+R+egHNPtwhPKjn7CAd0kCY0DIqrP5+Cp/w9qZp8JyFhxrxEtzYkipdHwtKFbT6nSSwVd3OsWVh8THj/dj4WjiE48o4ie62YKghGVvcwNPQ7J1KxLfccUKRf81NmqE9vXr8DMeLtIrUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WrflZsmKVuPgNbcHw7V7qlZJsqKtIhHmdHN/pT3p3U=;
 b=Fbg17sQnFEY8HOSw7zf9aAnvmjI9TXfw5mVIBLzx67wyp2ialoa+WRuMYeifNMdkRQlvPxxUyQLR0bjLN7M2nCNOd8UHzgbuiJWPSGFKjEasKKvWr3V2jALoeju11IhgsN6ncYIyzJT5JtdrfVW22wLbVFrEH+7yEUkORi44hgU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 BN6PR01MB2324.prod.exchangelabs.com (2603:10b6:404:3f::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.16; Fri, 18 Nov 2022 22:02:52 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::24c2:adf2:5b97:f9a8]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::24c2:adf2:5b97:f9a8%9]) with mapi id 15.20.5813.017; Fri, 18 Nov 2022
 22:02:52 +0000
Date: Fri, 18 Nov 2022 17:02:38 -0500
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, "Emilio G. Cota" <cota@braap.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: Plugin Memory Callback Debugging
Message-ID: <Y3gA/i8bBkR7mgkQ@strawberry.localdomain>
References: <Y3QNRWUK8BLRQlaQ@strawberry.localdomain>
 <878rkbalba.fsf@linaro.org>
 <Y3gAIEythPY+z0q0@strawberry.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3gAIEythPY+z0q0@strawberry.localdomain>
X-ClientProxiedBy: CH0PR03CA0222.namprd03.prod.outlook.com
 (2603:10b6:610:e7::17) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|BN6PR01MB2324:EE_
X-MS-Office365-Filtering-Correlation-Id: aeaa79d6-ec7b-44cf-f6de-08dac9b0a365
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BUnuGzsbUgEn5mZgzzQiPzXn/Xxj8W3jvvkXy2uo8Rsh84xLMuXaUOdPJSt1yK3OZdp75p6bvc8TYmcStuXcx7bAjG8ksIZR84c/vGl+rIumTxAbMVdHMK+X38AcPQzdgSnr6DjpOpy4RlXZKMRLhvmtMmFbbKkDX9qd2hNw6Lrb/VdWfGD2eVrQhnZyIXlcsjr98dfblWYb1efN+L6QAk8D+1mbmDiczlS3pS9yYiNGREH3NEaZBfriVHFcy8/mIPSXUqu35BNMafNyyjcxUYTtAIbWL3BoYSGjbOAeZN1+DSxfZUlCZruECkJ9je8ROvP1G8CqTLcxcCOXUQR3lnYRulycdal38YlCoTlcpT2cjgnNVSoxEKAGu51LrGXS8jNiHY2Gf+Qt1K9oN4qgQj0CSZGHn1/DiSVmTCIzt2o1ajrba5C8kbLe6FhiU41OTJQfa23PQjGItEjHD9f5geFs99OtsZPwCLGzWY02SRmrRZVXSSplE1+7Ob0ZkoyxDwefLzEijVfBUvOyBNFSE3be0N5+N5J4+A6p96ff+xKF2o+4vSn1D2Xo4jH5k4Nv9E++7Zt3qkJ5qVLTYuXnLmh4s7JjUCOtuY3ohWkgat5vMO9aoe+WRO8IAxuC8P/4pYgyjCXT9dm5CcCBF1YSCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(396003)(39850400004)(346002)(136003)(451199015)(3480700007)(86362001)(38100700002)(54906003)(6916009)(316002)(6486002)(478600001)(66946007)(6666004)(4744005)(5660300002)(186003)(8936002)(2906002)(26005)(4326008)(8676002)(66476007)(6506007)(6512007)(9686003)(41300700001)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SFwjFwK3za7BoPx0K7g9lcNjDhtmsRCNqyWR0vEke85taBtTVmn9gFIuVkeW?=
 =?us-ascii?Q?GVbMouUDHb0JEMhDPXUTmuQ7Z8hHIzLxI/hySkd2xt117x4vSCWNBXPWflfA?=
 =?us-ascii?Q?kRlTVEEy9qEuU9G4m7dD/C6Z5WOe64gdhbkE4YAkDxmPBkiZcXFgInCMYhs/?=
 =?us-ascii?Q?/FeyN5RskO/GpWt+uonCsYIlnBQ5J8fKN5VL+j3WC0e6vOU5hYqinT2NIx8J?=
 =?us-ascii?Q?OOD2UTJXdoGbNmOuIF8cdJXG92dlF3UEdJSFSDgAdgZ7b/DiK8+k6oaG8c1G?=
 =?us-ascii?Q?lST5pz3hwYiCyBRdCRs0E3XbZ4MsHoqJxi1WNHViBrxDEvAoNYKYUTT8VM8q?=
 =?us-ascii?Q?P90OhgkdbWD17fepZwYUMwHf+dmZRtjICqPmURMvmNywisyN60wU8OnKXVH0?=
 =?us-ascii?Q?Ysw2VARthlgv9Z4HZUsE18KMtIxCILEBQxqObPip/NH/TckxiWIxdbN62gYy?=
 =?us-ascii?Q?deg1blE8xu72mEWkCTKBQmuhcda7JyO6tNq75q3k+JJG0CEkMR2s7m56FCHN?=
 =?us-ascii?Q?SbGPgb3jnqOOEk3NG+D8kzrX7gj6Fm2veROPeIlFJl6/0x9J9AmpUfb8ydFt?=
 =?us-ascii?Q?skBZSaMh/FGbbYXMfJ7hK4/6DN5LNNbu54ynFUIUKAkotY7Mjdgz9UqmtonT?=
 =?us-ascii?Q?Qk/0YHF5IyNZoDfxp+TQXT5XvPQLj10CITpkPxXZpleJdeQ7MLO5eivJOpAn?=
 =?us-ascii?Q?Hxw87alNBAMejz7bFekNPJ755JCyzzHMKraRWxa/R9UdLytJycWIoDh4II5I?=
 =?us-ascii?Q?v4cLX/3ra9hO8xb6yc3gPEL3SKCOAaAQSe5gKt3vJSWJi6/nJyvL80mwozhB?=
 =?us-ascii?Q?j7Q9CE5LViReaUHtBpxmbiAIbM/tu/xp/TLgqH+Jk4F+DsNhRc4/Q2SGBM/P?=
 =?us-ascii?Q?DKG6r6sOt6Ag+liHZbNqOo+RZrBT+K3S+KEQcSX10j/j741g5U1Xii5DLTz9?=
 =?us-ascii?Q?rALUSxtbWPrUN1tRFVZGKpzri4HwLaPATuvoTzK2TO8IswF3h1N9ym9Yd63S?=
 =?us-ascii?Q?vVdGAI6JNFZjfA0Wh7A+tZaJOSAYvXn12G0yKiB9GLBtYRIcEk1SMgeCiEgS?=
 =?us-ascii?Q?Xf2nwWc5ND/fRs7ARkIXdHcmWg4q9rxYSN7ujikzMcC7eesNu1YdUKWfJBD+?=
 =?us-ascii?Q?1RCOvi+groADfudX7SC+kFvX3Nvk6wT5ALKBY5rIGQVwl510k+VKwaidcPhM?=
 =?us-ascii?Q?HVfB8D5PQTpoblKFVSUxEagzWgy3E19KRvsbh1ieQLo8RqOKVsN3TEeUSEsn?=
 =?us-ascii?Q?e1V3tyykPUMh1iV25V3WUnYW4SB9D+yO23eC332q3L+9oZDT5AXkNo/y0vk0?=
 =?us-ascii?Q?MxXIDCftxy+E3XSFbWmhA/SpAO9ImN31Oulh3kdImpKNbyRnMtf+4wsNcPsR?=
 =?us-ascii?Q?pXgQ1xR6phPIYgL+cqxwI9AfBp2v+0ax9kQAKz/QhsU2bqEQnDiwQ8dZKUcl?=
 =?us-ascii?Q?SCuViOKqNkykQAiWjJkI+5tCaAPG/nosxm+ug684OnELW51nOt83skTcElQj?=
 =?us-ascii?Q?oVr9WBITyAhI457L5wPFgWlyAnU5YIoBRdN6AIIzRXFY7PDm3Pf5LaibXYVl?=
 =?us-ascii?Q?ZQKJceh7WoIlAECfhNw5+TjomotAC9cLoXdvFdyiakdfEnZ4oW4xSdxJvkw/?=
 =?us-ascii?Q?JGPD0jVe7PMZ2WDu6ttZnjY=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeaa79d6-ec7b-44cf-f6de-08dac9b0a365
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 22:02:52.0235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ksDi7oC7b9s1IiGx05mHGfbEQbKzV3f2hPoScjGiRCPcDNXCnKg0XIOrK7yjih4qQXfbDGu6wHsNKBwF3EHT86NbH2ZbaPanzUp6nijUFXcMtplRqBHR+iH2zLH7+Tsy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR01MB2324
Received-SPF: pass client-ip=2a01:111:f400:7eae::700;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Sorry, left off the very end of my timeline:

On Nov 18 16:58, Aaron Lindsay wrote:
> I have, so far, discovered the following timeline:
> 1. My plugin receives a instruction execution callback for a load
>    instruction. At this time, cpu->plugin_mem_cbs points to the same
>    memory which will later be freed
> 2. During the handling of this callback, my plugin calls qemu_plugin_reset()
> 3. Ostensibly something goes wrong here with the cleanup of
>    cpu->plugin_mem_cbs??? 
> 4. Step 2 triggers the TBs to be flushed, which frees the memory pointed
>    to by cpu->plugin_mem_cbs 

5. A store exclusive instruction is translated and then executed, which
   requires the use of a helper. When executed, this helper checks
   cpu->plugin_mem_cbs, which is non-null, so it attempts to dereference
   and use it, resulting in the assertion. 

-Aaron

