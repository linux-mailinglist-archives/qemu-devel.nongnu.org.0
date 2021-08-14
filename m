Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA563EBFFC
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 05:00:18 +0200 (CEST)
Received: from localhost ([::1]:55404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEjuD-00087h-1e
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 23:00:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1mEjsp-0007TR-BD
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 22:58:51 -0400
Received: from mail-bo1ind01olkn0177.outbound.protection.outlook.com
 ([104.47.101.177]:6140 helo=IND01-BO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1mEjsk-0005ZE-MF
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 22:58:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGsAoeAxWBv4Ha2dHKRShNaC1It94f234wHQBT4oTmO6tYa2DPAFWdyvfhcKQIKc8pNe42/gMgS+Xf/OZQYMAnwDsaLiVwJqco3x1w2r/v6ZyvOPnDe5xrui8PHo9LT1DavSmDchusR2m2RihiVSKZHysE3AFYks4FNcM13TltqUA9M6hy8jFaoWrjG3RGXW7Fxq8P5Q4bn5l17WHihC2/qFXFhtfpvM0wD5q5DOEwvqMvrqav3CGHZEzy3wvTdxd827TAor2tbG4P3qajOjTWjzz4GHLq1N5iEurx+yHVaogvnE82VXftDPQcv55MYQ8daAPbjNgqz8ggSJeMHd6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pO9fBFoyv/6kj4JA3tgrE3/2Ydgu19nlHhdtjRvueVg=;
 b=D/BEQqAJhnNIV3qvoNK+5A8VjieoT4ce/1fWHzmQhTKOsTJeIAh4ZCIVihtE8RxoMCyIDnx3yFPP2GbRKDWZNn8IgJG0mePvBe0u86pko0dXL1IrDC3g/zX855RqD4+dNyy5TsQWRSy1QScC9tnt5apXrt70DTq462UZQPLL0UV95AlM48OD6Ta/nKz0P25nCex9wq8Ug6ZwSHYq8Qu9ofGLq7r1W8MnTW4h8/zXryPkvC7Be1gE2I5UpqvnlkDoAMaxvmywuvxa939vTVgnL7vwtpnE3XuI7JgGFJwSXa2AwWAJygte7CwN8DbyY61t34LXuXq9m7Mpaww8Fcuz0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pO9fBFoyv/6kj4JA3tgrE3/2Ydgu19nlHhdtjRvueVg=;
 b=A01BJjHiLvyA8bJIUoM014G1UaJMy6ogMVI/89RsWJPI/N42oyxf+xcExJdB+tc5pHRmnRFfzKZkEZ2zyPHL7J9Qj+GGG7KjA3hiDzMdtJhZB7r2x7auvzTfTlQoQl8VPit/wCR80Py022p0XB+GoRd7Q1LhJp6ZDia7Q3c7Xnd7/DPatdDM07/dAue0DXgsVbbs4R3qvNvyxEby5++TFi9U+DielzvXIIRR38g3ljKTssi1mknNqYl82AYJ7/UHwfAdtDAM1gLkw9nVCzCQonTyfe7Sz5yx24evJO6rCqKet+tws4oBvu01Md+E5nHftOP7CX793D5ke61VjnqqFw==
Received: from PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:72::9)
 by PN0PR01MB6125.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:6a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Sat, 14 Aug
 2021 02:58:39 +0000
Received: from PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::41ec:5dc2:fd60:e64c]) by PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::41ec:5dc2:fd60:e64c%5]) with mapi id 15.20.4415.021; Sat, 14 Aug 2021
 02:58:39 +0000
Message-ID: <PN0PR01MB63528333474E48B3C7017625FCFB9@PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM>
Subject: Re: [Question] fuzz: double-fetches in a memory region map session
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: Alexander Bulekov <alxndr@bu.edu>
Date: Sat, 14 Aug 2021 10:57:55 +0800
In-Reply-To: <20210813105004.j7p6qhaokg7fj6ao@mozz.bu.edu>
References: <PN0PR01MB6352FCDBE92B94EF0A05E658FCF99@PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM>
 <20210813105004.j7p6qhaokg7fj6ao@mozz.bu.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0-1 
Content-Transfer-Encoding: 7bit
X-TMN: [9xTOJGztmcyBr+7dFtqevQoTQen22128]
X-ClientProxiedBy: HK2PR04CA0085.apcprd04.prod.outlook.com
 (2603:1096:202:15::29) To PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:72::9)
X-Microsoft-Original-Message-ID: <8eef73d3162f37d85dd5ee0ddaa82368071631c4.camel@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.101.209] (104.192.108.9) by
 HK2PR04CA0085.apcprd04.prod.outlook.com (2603:1096:202:15::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Sat, 14 Aug 2021 02:58:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 963483b9-13e6-4a17-cca6-08d95ecf6a50
X-MS-TrafficTypeDiagnostic: PN0PR01MB6125:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cwhdXFsObS0TkPtbtaFS1xha7dwsfX1jOgScqQQ9qbwSjXpf1ixipL2H744fEK9EmpM/N1xjO+OAFCLada5wkPtFjR/Wbs/heNJjC2H+eiJIXTaRsOQtS1+3EAwQKLByHMCUJb6YzKUVAY/kpjxanl3spemQTl+O+hNMWqbXCQ8LhyQBnLU4k5B/kyjrw8tkvqBk02rMcNCq5ViZ8AW4VjKeUArD92d0TRZWomvXoCB20QJS0/6tK2y/PIQ+5NUTE+MX56pD5mvP3pqXUfEpnyxh4xDVABROJkHK8oR6v1MFLyVjHyQcCpBtZJr9cIt/UasGegd+ahv98Ys/2n6iFC1gezJzPftNDGXCEa+z4F63J3Qh0/OQoRAmi6EIDOkhh0ayK0hdOvqGpCBpRhDOmpkikL3NgdnDPa5ij6qRW1B/syVEHOJ5qnC/2BYnV72stwAiSjuUInxujwbv0ok4msw+AhrLKJaY442n88085pU=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ipmXZl4f4SP1/0bN2SfM0PD1TCWRg+l5223/5HHNj0G3y3wivpyHUiiwrmrS9GcEuSYorz4iZkagG6mu6Nx904HoDgz46KAHG9y8zJ5Le7CxVzZN1767sxHk+mMTC7uu/mwh6Yd8NOzZxjsa3Uix/w==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 963483b9-13e6-4a17-cca6-08d95ecf6a50
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2021 02:58:39.4971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB6125
Received-SPF: pass client-ip=104.47.101.177;
 envelope-from=Qiuhao.Li@outlook.com;
 helo=IND01-BO1-obe.outbound.protection.outlook.com
X-Spam_score_int: 39
X-Spam_score: 3.9
X-Spam_bar: +++
X-Spam_report: (3.9 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
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
Cc: Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2021-08-13 at 06:50 -0400, Alexander Bulekov wrote:
> > 
> > My question is about address_space_map() -- How do we emulate double-
> > fetch
> > bugs in the same map/unmap session? For example:
> > 
> 
> Hi Qiuhao,
> Right now we don't. One strategy would be to use mprotect. When the
> code
> fetches data the first time, we get a SEGV, where we unprotect the
> page,
> write a pattern, and enable single-stepping. Then, after the
> single-step, re-protect the page, and disable single-step.
> 

Brilliant! I can always get a lot of inspiration from you :)

> On OSS-Fuzz, we disabled double-fetch detection, for now, as we did not
> want reproducers for normal-bugs to inadvertently contain
> double-fetches. To make the double-fetch detection useful for
> developers, we probably need to limit the double fetch capability to
> only fill the DMA regions twice, rather than 10 or 20 times. Then, in
> the report, we could give the call-stacks (from the SEGV handler, or
> dma_read hook) of the exact locations in the code that read from the
> same address twice.

Got it, this is indeed the most practical solution. I will try to
detect double-fetch bugs via pattern-based analysis [1]. But it may be
hard to write PoCs to convince and help developers fix bugs, and we
can't identify those bugs caused by the compiler [2] or preprocessor.

[1]
https://www.usenix.org/conference/usenixsecurity17/technical-sessions/presentation/wang-pengfei

[2]
https://www.voidsecurity.in/2018/08/from-compiler-optimization-to-code.html

Thanks,
  Qiuhao Li




