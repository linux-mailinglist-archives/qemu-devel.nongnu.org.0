Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F60E2D3529
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:27:39 +0100 (CET)
Received: from localhost ([::1]:47370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkWI-00037A-20
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:27:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1kmj0f-0003Gt-Fi
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:50:55 -0500
Received: from mail-co1nam11on2115.outbound.protection.outlook.com
 ([40.107.220.115]:38465 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1kmj0d-0001Yb-6D
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:50:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m5/028Q3I6fwzKszgnMwf2o08Wo0ejWzrHnYn+AsjrqPNiFac8NOse9GzhdUJSnWhiwSnT+HOME5mDWIgJY6+f9G0/DA4yNJc2MXXioUs1WmzroBbNMR46Z3sNtDeGLX/za/gVObVh1SrsSl15MEZy1TnIW14c5wmflui4/Tpkxt6rkhch3isTzmSPLvL0b49GUCpwE9S3P9SU3XtQbyTR1VJ56AiyolC8IgsoGJRfQV0jN0BP4ZTCxOglvtPbwoSSPCTr+YIPS8APjBINNz29pZ4b5Y83i3hG9ZBHIdfPWT2ZHiktCHOVIgXcEvv2JiyHvZA13ff3krxZWGruuNQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+a7hRtfRGx6T5s129imB9zsdHExxvYN6df62kiu26tU=;
 b=S4d6Xt7E+BzXGcDOVfcQWkXczs8V+9w8OIQwK8o8wpCZYUslNeMp1AWeajNrrsiaQdpj4VdIRvgrpvEOAiDQ54EO9PmylRJ1Zj/9blHgU1i9FcZc+qQ1MJ0kvJinVlS+k6vMd8JM/6h4HhiNCAOdKiDO9h7snLRjBg7tSAfqcOhBGHS0o4iAfmL+f5c7IQsiX4dE3yD5uv7mDAoKuvk5844vnX8uWONM02fkkHK7mI89OaZBcCbUV+yp/7+3mJ0nfEwadzsxtY+ek/Lbya8DsID5VFthvaarjU7OGVYtmBacANAyGCIlaRX/n6EnFX0bh97F8W6tBoZcbKNJ8cU3rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+a7hRtfRGx6T5s129imB9zsdHExxvYN6df62kiu26tU=;
 b=QShVl1nlaTXTFRtJIVeVIevnzYNA9elmR9w4927b3eOnL6i+1Ge+U7fOrH/ZH+7D0LzrnPL+pqBhHk/pJbT/3aa0zEsh/G5z44LAy6RDzy+UGdAGQ2WuEnh0hsop4r9AIu7TOuizmqYjMBGwX5pFVaEmkxEyQ9y1GZbUG/vjexE=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB4399.prod.exchangelabs.com (2603:10b6:805:f0::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.19; Tue, 8 Dec 2020 19:50:48 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::882b:7534:1246:a8d9]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::882b:7534:1246:a8d9%5]) with mapi id 15.20.3632.021; Tue, 8 Dec 2020
 19:50:48 +0000
Date: Tue, 8 Dec 2020 14:49:46 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, richard.henderson@linaro.org
Subject: Re: Plugin Register Accesses
Message-ID: <X8/Y2suga/zfc2G/@strawberry.localdomain>
References: <X86YnHhHMpQBr2/G@strawberry.localdomain>
 <87a6uoh2fp.fsf@linaro.org>
 <X8+R05CCriFWT6G+@strawberry.localdomain>
 <871rg0gogo.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <871rg0gogo.fsf@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BL1PR13CA0449.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::34) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BL1PR13CA0449.namprd13.prod.outlook.com (2603:10b6:208:2c3::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.10 via Frontend
 Transport; Tue, 8 Dec 2020 19:50:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eabcd053-88ab-4215-b705-08d89bb28f53
X-MS-TrafficTypeDiagnostic: SN6PR01MB4399:
X-Microsoft-Antispam-PRVS: <SN6PR01MB43994B0579ABE3728BD2523B8ACD0@SN6PR01MB4399.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YofCgJopIrCDBgLJAZngO36dYLUJnFBqGGbLiATyYME/zZ2gpG5Va+ZirScza7kkyjnfAASvmZ+XXECV9E/njZh3cIRwgI3kAK/f3JKVq2LtPFGgEpHZ29nuOdey5CEV1ki5Q9ESlj10kltWkOuKFDiooLzjpUygpZ+S0/Qgnb9T0wr63MopUXWXfXuyuQHmUwvCdbzFYDmTQARS1t+IxycGU537jIPQgECUHCAy9h801sdg8FFJvJGVNemwzbMdNGcPfn2BZ2FB/JTa6V4TqCXfw3PgH/XBImdYv0f5w+q3KRzUZFVtNLu1sUrEIz4PTgJTcn8WSq9or1pkaoqReS2bddd5Q6uaTZGZpxC1+7dZIzJpNwsnvCqXrg46Zent
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(83380400001)(6506007)(55016002)(86362001)(7116003)(16526019)(6916009)(508600001)(186003)(5660300002)(8676002)(34490700003)(26005)(66476007)(66556008)(4326008)(3480700007)(66946007)(7696005)(2906002)(8936002)(956004)(9686003)(66574015)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?dDzPPVgZ6c5rPW/TdIvCVmxIa6l6Oc2gwZHmM9D/z32HS4FEpebuB2xcGV?=
 =?iso-8859-1?Q?eLIOhj+9niBGhvfK6KYrmny2AStaIrIyppmlWXJuxtjFDGIEStEyPwSKy3?=
 =?iso-8859-1?Q?AAgSdPxp2pER3GRoUtbv7Myq7klJsELerEKE866agQnKRfB0uQmoY9PcKR?=
 =?iso-8859-1?Q?ELY+RJVvTUQ1y7XcrI+9rrbx1xEfNOQCOgqO/sBlD2dZEPS2l8RLjRspO1?=
 =?iso-8859-1?Q?jb4K66SDwzHcfz4olYLCEstkWALiUO5J3IbaS5hii3xnXXNZQDBCjbiZPb?=
 =?iso-8859-1?Q?Tk5w8s41skADRelq4D1SbX8UI7xN6IyjuDszTDicKXWQ/rrYUoUlK/bCda?=
 =?iso-8859-1?Q?1GSwrT6BAIFB7sHu4SU6sVbnwCDSuwIrfwAqQ45NU2Zf86pAe7rr3ro6fx?=
 =?iso-8859-1?Q?/AnFdOigbsDYF/I/IbWboiqar82/6ZhP09iy02tGOGn+qu9E9v5iOJv7I8?=
 =?iso-8859-1?Q?lk2fJ7YwH1XLrvHQWSR3mu/TPZ2cpl+AMA55S4bJ2H0nSkUhZvfNh3sM2F?=
 =?iso-8859-1?Q?X89vCAHB7JlbX5o6qR8sOF9YM5mpiUZJLB6qnORC5VuoULrCF9vTTQH+oZ?=
 =?iso-8859-1?Q?hGEZ6Osbvyax8EvZQQhhQzVX6oqLFVoOzQluqY/VBL+lmId/YVxe8h+fED?=
 =?iso-8859-1?Q?gs5fpV80jOvy+LtjZEPtey2d9r/Uwshe/Gp1uAG4Z/plh6Bp+tlvsKcadu?=
 =?iso-8859-1?Q?e43nXc4Y8SU0I1e+kPTrlifFdWvYIu7EU44zq+9Tro/qF7QrYkEWtgkeUP?=
 =?iso-8859-1?Q?6zNJmvbZG7eMZpn1nmgpLc9pU5jsBBuu2U9JvO4u6uwvxn4LojgrH3kUG0?=
 =?iso-8859-1?Q?hse6ybxsC+S+fcVVH61jU3NmKewMnVq6zchg9shjp1v07pNqnzkdRXUsB0?=
 =?iso-8859-1?Q?rx6NAFb4ka+Mu34X9o2T9boC+sKxUjIrYpaf6aDqO9ke2l23pPHLdsjeI3?=
 =?iso-8859-1?Q?Y7UY8zSHVWKznAcfoHugMS9Da2H9xevl0+B+w9grcAkIYYrDgRuKGNtDz1?=
 =?iso-8859-1?Q?PqRaFnC+paRXzrR5o3I6NxyNTrF/piWxY2jAuU?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 19:50:48.3417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-Network-Message-Id: eabcd053-88ab-4215-b705-08d89bb28f53
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MWw4MQfusMWv/MZ1N93c1ozK7I14v94i9gicOGs9a6HcyTDcItvh1Zdwyfeco3aFZ0ZpPwE6fWEJaP7yuAl1Gy3wH7HLmTwwKENjBJ/v+yU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4399
Received-SPF: pass client-ip=40.107.220.115;
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
Reply-to: Aaron Lindsay <aaron@os.amperecomputing.com>
From: Aaron Lindsay via <qemu-devel@nongnu.org>

On Dec 08 17:56, Alex Bennée wrote:
> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> > On Dec 08 12:17, Alex Bennée wrote:
> >>   For registers I think there needs to be some re-factoring of QEMU's
> >>   internals to do it cleanly. Currently we have each front-end providing
> >>   hooks to the gdbstub as well as building up their own regid and xml to
> >>   be consumed by it. We probably want a architectural neutral central
> >>   repository that the front ends can register their registers (sic) and
> >>   helpers with. This would then provide hooks for gdbstub to cleanly
> >>   generate XML as well as an interface point for the plugin infrastructure
> >>   (and probably whatever the HMP uses as well).
> >
> > In a previous incarnation, I was proxying calls to the plugin API
> > directly through to gdb_read_register() in gdbstub.c and therefore using
> > gdb as the point of commonality. I'm not saying it's ideal but... it
> > works? One downside is that you have to know 'out-of-band' which integer
> > value corresponds to the register you want to query for your
> > architecture, though it hasn't been a significant issue for me.
> 
> Certainly workable for a private branch but I don't want to merge
> anything like that upstream.

Sure - I was more commenting on what I've done in case it's useful than
pushing for it to be upstreamed!

> As far as I can see there are a number of
> consumers of register information:
> 
>   - plugins
>   - gdbstub
>   - monitor (info registers)
>   - -d LOG_CPU logging
> 
> so rather than have them all have their hooks into every front-end I can
> see a case for consolidation.
> 
> For the plugin case providing an introspection helper to get a handle on
> the register makes sense and would be less painful than teachning
> plugins about gdb regids which can and do move around with new system
> registers.
> 
>   qemu_plugin_reg_t *handle = qemu_plugin_find_register("x2")
> 
> if we document the handle as usable across calls this can be done on
> start-up. Then it would be:
> 
>   uint64_t val = qemu_plugin_read_register(cpu_index, handle);

I recognize this is pseudocode, but I'm wondering "out loud" if this
would need to be variable-width instead of a uint64_t to allow for wider
registers in an actual implementation.

-Aaron

