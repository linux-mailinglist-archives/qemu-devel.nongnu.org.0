Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 948CD310D50
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:44:25 +0100 (CET)
Received: from localhost ([::1]:53132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l83HU-0005El-Kf
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:44:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1l83GN-0004PW-0D
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:43:15 -0500
Received: from mail-co1nam11on2139.outbound.protection.outlook.com
 ([40.107.220.139]:36864 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1l83GL-0002WD-2p
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:43:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SEIfBvzxaAyNSYQsXXizNbXYP0n+biVncg0aFsPHoS0Mf+J+C75X2TaZQ2/Zaov0iKuk3bV86gGdSK0ELQK6LvAxfNSADPg5EvqztyzLHUfwqBLoz87pEIGB9e/IZnitKRLitqN4z5i9XV74eAM59ccEENIFXitLMh1M6H4ok7a9vz1skxxrhkXN/FWiRjCafPgJH+nW7Scfm+acxxhVdMY4PEP+P1kejgLNBblBpyfPnAH3ssHGvrwdqwRYTWqQeVPHia5+DGPxTeHqm9XwM5FedOqDw3DABhp/LBHfBYcEn2+l0w4svEWsLR37+snXencCR1u+qsGXxFJNiEg0iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/MjTpS9x+65FauoR1PkAq4rAwT0sWWKRHPIoG1tsvI=;
 b=Jj2rji2MrWmdnRv4nfEavQP3mr0aLK8gvqExsD56f0ff33DjmrMuHXZRA6ChhhHb++HNPKG8CcJU7INB3Rz+k5v9FncVCFdvHj9RLr3jJjALITQU+JniYres4TR1PNtUYX8zfptenldWvycBWtw3wdpHrwn8lKvAIZ5owULjwJcSoxmxF2JStQWiOr/IuvM68mCvRQQfnAFa7B4djpl0Avpw9oCy0fjqa0h1o/4WoXugqHEHekgtAANTVsCjQK8CdQcKwDGQI1aLAnyBqhVF4yqkv76m78vtuo3Gscskv37NIp8yWIeLQrWMp5zkbvVpPYJ/tIiUgnPwps49UvkuGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/MjTpS9x+65FauoR1PkAq4rAwT0sWWKRHPIoG1tsvI=;
 b=TMVLC1T2mggtg7GCspO1UWbN+BTPhyfyS4pCWoXh0ZF+7EACAT/NSp3G06Giz4C0eJwHk31dE16EMXo6KR84yaD0l+Si2cdaAAC1iw3t6F1jKEovRzwtEZteW0kVymyEJ6troN5kWawQrfRtLmyuY6kiIFhcttxxhAY+xX4vnZM=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SA1PR01MB6558.prod.exchangelabs.com (2603:10b6:806:1a3::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.28; Fri, 5 Feb 2021 15:43:09 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5%6]) with mapi id 15.20.3825.025; Fri, 5 Feb 2021
 15:43:09 +0000
Date: Fri, 5 Feb 2021 10:42:55 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, richard.henderson@linaro.org
Subject: Re: Detecting Faulting Instructions From Plugins
Message-ID: <YB1nf/M613d0B+Pm@strawberry.localdomain>
References: <YBTRSK4/F5KLH+FZ@strawberry.localdomain>
 <YBxnlZFkp7YA9PXL@strawberry.localdomain>
 <871rdupw3h.fsf@linaro.org>
 <YB1VljlPQPRRZUvc@strawberry.localdomain>
 <87v9b6o8bu.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v9b6o8bu.fsf@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BL0PR02CA0087.namprd02.prod.outlook.com
 (2603:10b6:208:51::28) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BL0PR02CA0087.namprd02.prod.outlook.com (2603:10b6:208:51::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Fri, 5 Feb 2021 15:43:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01ea462a-dede-4545-741d-08d8c9ecbc6d
X-MS-TrafficTypeDiagnostic: SA1PR01MB6558:
X-Microsoft-Antispam-PRVS: <SA1PR01MB655888E78EB3A2EF6F9887C78AB29@SA1PR01MB6558.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W6QjF2czWXZFZlgRa+KVtz7TbOV1vezxwkhGjZAjOBjIlI0ey55GYveab+d6TODp0c3VoynlUmD/31vcv9pdSCMiVaysfs02uP8NvBEMTCOqJOnlEvL69vjGqUgUqgoZpTjDqN5YjCmFHmwgPATcPuk2g9TsAMRkCKVZXTkxyCOJ8Bp7q4QYS9rDgqleDx5GrNMskzY0R7SaZhGyXY6hn+/2phVrcCYTkEipgqnXpf/5JruHyU/93cxAZHBn7Xc4JHAP/5znR6pEvAB/2gop2hbZyA/bkmSr4ptdAAxvFqYBLMKCSiU3aBR5+FNuOgJ9dQSopLKYGll0SdUeE2SvaCSUP/tW5/Xvvhp+KNT7Rl30n75dQ71ziH6E1H7nT48GZeOqHkP2ymwl7vwZfY9/V18Uld+lXrcR3On64iY/1oaryxNvO6KxNUlpnerx/IIMN2vzc20OveFcwQJ4EPa8UhLe4KdS31Mhlu/QmImCXnZ4eEQIHt4dzODyuX8Rrm80rzBSXRe9YEEruZEakTKOjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(366004)(136003)(396003)(346002)(376002)(26005)(6506007)(55016002)(6916009)(86362001)(956004)(9686003)(52116002)(186003)(8676002)(66476007)(2906002)(316002)(478600001)(66946007)(83380400001)(6666004)(4326008)(7696005)(5660300002)(8936002)(66574015)(16526019)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?YiubJS5HX82JxsqEp16LQacHOJz8UyJ42tAhmAlsU2GuCFfogIMdgzPvN8?=
 =?iso-8859-1?Q?bhywW0qQR7BRtxokiLCo0QbT3bYr9t2MMwxhdSzUN8U54xGwkH5nKICElu?=
 =?iso-8859-1?Q?sDp/ViFgdsVOVsZ0jR+BBO6xbq0JG9Aq7z61dVXwd3Uivd+K0M3kFUwia0?=
 =?iso-8859-1?Q?t/S3mr+XvZpwoA6BB5K2R6XYDW+k7SpM91TtJjo9wNWCKR5PFkzWP8u0hJ?=
 =?iso-8859-1?Q?/pbUMDYPaEhcIuIm+SghSiWaWC1CFfmgzyBcWl57PMn8O3JDTsW1v04Vdv?=
 =?iso-8859-1?Q?D/eP0ePazbvQEobR0mACN7fZEgW0H28h/og0x9MjKKPJxmCeL62ATn70af?=
 =?iso-8859-1?Q?lQ26Hzt+KPqIz/yDtHccu1+bGCrofBvpssVxdg3Ibi96Zs7DvBGqsgkY2f?=
 =?iso-8859-1?Q?GCqN0l0JEedWSZ5WBzVRCKMMkBBvEMN6HsamjiSR952asXFsmo1ZlDH6Og?=
 =?iso-8859-1?Q?hUzu4VIY2eVZPqrqVskcADuLdB+a26YGT4XRQ39HzPgsUSyEjaIk1iGMRq?=
 =?iso-8859-1?Q?twIfB69ceio/nVPMmBg29+yOot8mYreuQ4IZnJDqCyTQ2yyPCo+JGmSmWy?=
 =?iso-8859-1?Q?5PpI3LamSmyXFpgu0VdHZGD4sbmbntLlY+2PpTC7xeNarwStP2a853i1fg?=
 =?iso-8859-1?Q?9bSEWARH2s9xOXrFWocYLVuhONDcifgHnl9uwvvs44Y0WkMe15bwjFyth2?=
 =?iso-8859-1?Q?8wxV8JqkIGaH/q1q/LmbTeJQyIgqGGlIMgHv+YxSWBYmvbgPEp4J0iIe/r?=
 =?iso-8859-1?Q?WkBJyxH/Ps6HgrbnnnmBZqum5E7cLE3qP6UPQnXS4KymcPzwS4kMWAgjlO?=
 =?iso-8859-1?Q?te1rTNbzbmrj8L2lNXF+4IDy6hNLrgo++iB9tEMGieUQmm5z7zjJfllDJt?=
 =?iso-8859-1?Q?A6r3EVFDM4l75cJJui3pjHGbTfIsonlWKC2N42akwbb0dQN8/UOGzMyYn0?=
 =?iso-8859-1?Q?WR7L2sxXze3Y0+JfDnmzgOCgzXqiHjScATW+l4ZvplIcX1W7X5O9d9s3VZ?=
 =?iso-8859-1?Q?kgC+MVY+hxEQD3JDpXbz5a4FYhJ6EU9o3Lv3suNVm5OcT72FrhoqRRsLPX?=
 =?iso-8859-1?Q?2sCNg1otD+s+WI2eeTBA0xhIY9oS6yYByyBERGGvUQwAwgwaBJyAnHVYXB?=
 =?iso-8859-1?Q?Pcl5FnZbhQpoA9OlB5SVbD6lwr7cHYGOAxJLCTFusdTzdb1o8LJD0E599g?=
 =?iso-8859-1?Q?lnb7WKmW6YZCPbDXQaYyDe8qGMH+auVgwIm5TZ9n7b0NayXTRRcvqpFhRp?=
 =?iso-8859-1?Q?vqX0c2JcrWLrQPpJlJchXkGA4Q7aF6HJz7yM1TxcZm/+ZQssqrs5BVfk3H?=
 =?iso-8859-1?Q?/NS6FJ8c8g2VklmeBlkEFxxQQV0HXS+1yjph0vuaCHQwD6dTn3RHh/aBK4?=
 =?iso-8859-1?Q?W5laCVVDq4?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ea462a-dede-4545-741d-08d8c9ecbc6d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 15:43:08.9766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3wrxe9N5L0dEpVIBvTFFi/5RxCfj0Vy85A2NX57G0Wx7XCyMnhHpfnxKEOOleS5T2DWoZhXOBND/IBpBWmMJ1nYtvh7XjREiMbKV1l/DB2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB6558
Received-SPF: pass client-ip=40.107.220.139;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Aaron Lindsay <aaron@os.amperecomputing.com>
From:  Aaron Lindsay via <qemu-devel@nongnu.org>

On Feb 05 15:03, Alex Bennée wrote:
> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> > Assuming you're right that TCG is detecting "a io_readx/io_writex when
> > ->can_do_io is not true", could we detect this case when it occurs and
> > omit the instruction callbacks for the re-translation of the single
> > instruction (allow the initial callback to stand instead of trying to
> > turn back time, in a way, to prevent it)? Maybe there would have be some
> > bookkeeping in the plugin infrastructure side rather than entirely
> > omitting the callbacks when re-translating, in case that translation got
> > re-used in a case which didn't hit the same behavior and shouldn't be
> > skipped?
> 
> They are happening in two separate phases. The translation phase has no
> idea what the runtime condition will be. Once we get to runtime it's too
> late - and we trigger a new translation phase.

I believe I understand why we can't catch the initial translation. To
make sure I'm communicating well, my current understanding is that the
timeline for this case goes something like:

1) translate large block of instructions, including ldr
2) attempt to execute ldr, calling instruction callback
3) notice that access is to IO, trigger re-translation of single
   ldr instruction
4) execute block with single ldr instruction to completion, calling both
   instruction and memory callbacks

I was wondering if it would be possible to inform the re-translation in
step 3 that it's for a re-translated IO access so that it could
ultimately cause the second of the duplicate instruction callbacks to be
omitted during execution in 4.

-Aaron

