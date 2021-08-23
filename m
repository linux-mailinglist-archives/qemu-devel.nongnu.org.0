Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D839C3F4BA8
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 15:24:53 +0200 (CEST)
Received: from localhost ([::1]:40000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI9wa-0001hm-VC
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 09:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1mI9vH-0000cs-Qz
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 09:23:31 -0400
Received: from mail-ma1ind01olkn0143.outbound.protection.outlook.com
 ([104.47.100.143]:32155 helo=IND01-MA1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1mI9vE-0000E5-14
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 09:23:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAWOFR+lQ8w35r9TnbDqqiFTRrN1H8n+0tH3I9bUvBTi+27/ERSg89XJjSbvDbbjzJJBvFReV2vSAXQl3MjrD9G5jQscaj4310d/uiA/ptQSrngEF8sbBbvlwveqcHs2JEbhH7lbWTwO0ob/jGwgXeQXRwLkHwh6tWGlNVvBcGZH76wtXI83rv4esnp2/ItIMYrDtrW0BaADxjENDToV8RprBIQiDM3ohnX8JJPLpxefMv/60IFQtF9cEIwarjmSqvWaWJZRxQK0gG5BmrHxdbgQEin5g5DTAYtoeSWSUXcNWMtEo154HfXDvgXZfflIbWvlLVk6Fe2ub6GuD6iELA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M453Fii97tAxbQq51dnvsCuozx8G/v+rvjDWuprXmCU=;
 b=IiSOMlS2K5ppvzzICUChToHY8wc0DJXFJbZa/qB4Np8T4YA3AmSCIvwcdQZGc3HTnr5GAZPh4GofVWs+oTt2VqqkNcpKYauCs+3+6Gbn4uIzug1a5M6WI7tf0OqXw4WBNCk4UyBelkK3XDPnvzlqDGANFd508NCEcXtThvL4GyNq/zgfxwQk5Lj2GsTGoAzLmanFdMbHi2El2LtVZdNZ2jNMPDzc3qM5wr5Tb0wfCH3xpwBMCIa5c0xwoDznaGhPhl3RGJo7TUAnB3EqreYtrKvKdN/J+KkF9GlVlriHTTwWfAfXtB19itHsl+aUuIlXDD7KkbgA8E3jUb4Pb+rdkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M453Fii97tAxbQq51dnvsCuozx8G/v+rvjDWuprXmCU=;
 b=FMgFaGe97gkj4p6JwSrfDiiq1wa8LSpZU2F4DVWyZ1URhZ3ab392uQ+WVFR6Ik/R0hHZUWdR9/brturyhQIjuBOq2PqGZpaKifh8lafSjTfNyrNc7shlIy86dcxpdLz0GIV3Ru/aaC81NjQ0/LX+fWQDuGedS+hLwbndJZ/VUhVquSCk/hVNo1/LeKr17XMU3DG6PBXz4EljlMLP9MdDw7gOCH3NyPAiYVvVEBvwEQlP/LN43WxQEUWrE/4W3vwuD/ZNXq7ous1zS+8YxOid0iNxYDKRz7IjFZTJf73m+TCaKsPt6+3apaOEysmo5OOZIrRROIer6CajXnRy8J7QTQ==
Received: from PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:72::9)
 by PN0PR01MB5829.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:64::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Mon, 23 Aug
 2021 13:23:20 +0000
Received: from PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::41ec:5dc2:fd60:e64c]) by PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::41ec:5dc2:fd60:e64c%6]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 13:23:20 +0000
Message-ID: <PN0PR01MB6352C0097804F169E15BC2F0FCC49@PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM>
Subject: Re: fuzz: fuzz_dma_read_cb() may overlap with MMIO regions
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: Alexander Bulekov <alxndr@bu.edu>
Date: Mon, 23 Aug 2021 21:23:09 +0800
In-Reply-To: <20210823124131.psbl4nfuubvyaoki@mozz.bu.edu>
References: <reply-76b541d3da83db84dd2a5b0ba3bba9ff@gitlab.com>
 <issue_92358130@gitlab.com> <note_656820217@gitlab.com>
 <note_657261050@gitlab.com> <note_657305687@gitlab.com>
 <20210823081403.l74lp7gay5tjy2m5@mozz.bu.edu>
 <PN0PR01MB6352A955D162E07966CC03B7FCC49@PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM>
 <20210823124131.psbl4nfuubvyaoki@mozz.bu.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0-1 
Content-Transfer-Encoding: 7bit
X-TMN: [swu05GOUPeStC1IO0hDVNQrjLobvWE+T+KfkwaIF9Rk=]
X-ClientProxiedBy: SJ0PR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::27) To PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:72::9)
X-Microsoft-Original-Message-ID: <e07cc3da394974232a1f41571287c1b44433b369.camel@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [127.0.0.1] (199.193.126.122) by
 SJ0PR05CA0052.namprd05.prod.outlook.com (2603:10b6:a03:33f::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.6 via Frontend
 Transport; Mon, 23 Aug 2021 13:23:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd3f00b6-212c-4f68-04ff-08d966392d35
X-MS-TrafficTypeDiagnostic: PN0PR01MB5829:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nAlsanxqyogWNJYY6gZeMo685AlvNU6WUuUD0dHeoUOT3WKGjTRv/I1zBfSfOohr9Vspq4zmosh4Wcxhjib481i2D13575ljs8yqhvp/GD2fFUaVe0JVJnxqoLg/kaelM1q5c60wL2djnKif6b+mZz4gbu1FKiESxYPwzTcR4nXXcKECjWEHykdUSLiDJAZu9OJRuxdx8T8fhOsgLAW1SVIOVMRX7zfcEwMSm0U0lPh+5k+t3H9pmZBQwA7WpUhchxZ+gX/Nqj6/ynodwFSpm3uc4NbdudSmv36L9IVb4mpG/Fs4FAi005iazJRtPJ64q7JoM4RfZ8O2NdpMFeRqWZhJRwQKg9OlHhYqFBOQKwIQ6watvGFH7xN+Y5RBKOxwS63M/vrgymi/SVwL4U5q9wK/hsCULOaGJRPE+e7Nms6lOUvQT4HjnPTs3ARxHVmNSlSJ4je8wZLRHBk0akYNztNbpJtPTGjfgrp1Nq1ULoU=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /WZ1ENokalDVm7BEtX0RvJqoVZyOhmO/iJ0MrK1+0/3fJ+kzN9HlfiqulMaWvVu1CN0R7+m9JLKBRkJU4wg4NVFnpPOFqDLvTqPus5miWRpeKqsPzc7bNhASBqU5n31sJTMYdXfyuQUumavqan1ZdA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd3f00b6-212c-4f68-04ff-08d966392d35
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 13:23:20.9365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB5829
Received-SPF: pass client-ip=104.47.100.143;
 envelope-from=Qiuhao.Li@outlook.com;
 helo=IND01-MA1-obe.outbound.protection.outlook.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Aha! Nice patch.

My fault. I will search first next time :)

Thanks.
  Qiuhao Li

On Mon, 2021-08-23 at 08:41 -0400, Alexander Bulekov wrote:
> On 210823 2034, Qiuhao Li wrote:
> > I think the check in fuzz_dma_read_cb() is buggy because it doesn't
> > consider when the write address is not in the mmio region but can
> > overlap. For example, the mmio region is 0xe0000000 to 0xe0001000,
> > and
> > the write address is 0xdffff000 (not ram) and length is 0x2000. In
> > this
> > case, the address_space_translate() will return the sparse_mem_mr
> > we
> > created, thus bypassing the check and call qtest_memwrite().
> > 
> > Perhaps we need more detailed checks to ensure that the entire
> > write
> > operation occurs in the ram or won't overlap with mmio regions.
> > What do
> > you think?
> > 
> > 
> 
> Good catch. I think this will fix that:
> https://lore.kernel.org/qemu-devel/20210713150037.9297-2-alxndr@bu.edu/
> 
> I mentioned that there were some fixes waiting for the 6.1 release,
> but
> didn't realize you were talking about what seems to be the same
> issue.
> -Alex



