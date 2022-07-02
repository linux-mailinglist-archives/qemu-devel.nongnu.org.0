Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAB7563F88
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 13:05:20 +0200 (CEST)
Received: from localhost ([::1]:51244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7awB-0003ey-FJ
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 07:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o7auN-0002v1-UY
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 07:03:29 -0400
Received: from mail-os0jpn01on2071a.outbound.protection.outlook.com
 ([2a01:111:f403:700c::71a]:13732
 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o7auG-0005gA-Mv
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 07:03:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CX+TUtgiUFUjygI4r8ylq+jaWVjngPt66GuLN8hMwy5/gFp/oCqruakrJNPqvia3ogdRmXrHPPyOrTOBwUGXdui1TCcSvfKewGn/U0dixy3RxvxwPDDn8T9qVYMF/GeoYZpFv602SSHrCMK7tMCtYq4S1ltHXBgRby4WjAPLivNLR0j0gVbuMRuajhL2hCHgmOuCmSyH8Ot7MoXtk3A/AlSeFerWMVaYBZvFXqBWOP8V7SZTm2MvscPcZEFJC1cjiuk+lvM5czOZx6J92m5tb+NhPZlq385Gvh9T85PkwCDBc9piCW60nDIJWfG31Ov3oqQ7UHoepk/eZ1WgqdAM7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vC5jRlSVziu4bBlvc3brm65m6p5l9BL1NuUTBNZfvHk=;
 b=DkgTPyGWcA9tC/vaAqXUQCtj2xAk8r0TPO6EoV9lHbc0jN5u6p0bTSSDSVVPt09DzVe1O7QDPQZCfGIL3q8Oqt+7gdPy1o33lCCNGWUBpJAWYrleIGF0lalROMRYOaWMMRA1GtjiUYeluQQyGRhiZ5X0i/Cv9PYFw131XwzZKsp7KgkMw9IM0gLCu7X2Uw/d6ra/zYHPPjSIucWwnJ3qroNAxiNATwGeVH1OW17oMZHgcXrfQjtTqTdnPkhg3xIfOrzq3VjMsiygpsHALv60+qnwKH9Je1ZsYEqCAkHDnw7bjkfDRuX0LcjNhC9a5SpPrXJjmVNPO1ka+sAkgdq2og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vC5jRlSVziu4bBlvc3brm65m6p5l9BL1NuUTBNZfvHk=;
 b=j83TcyKNSkm95epibY7kX5TauLJLQaE3Yaz5NTDYJaR47UhXOJk2SEoJX+3fRf3dMOIbLhD2v9OPcc+n+17/YzVmFJWvMR5V+UjY3WYIVMQMlIKa/ZvL3CezDNArsXCZERulnoXX5ZN4VV/w0j5B34SdvyZh6OcCEsOxtQr7JhQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 OS3P286MB2727.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1fe::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14; Sat, 2 Jul 2022 10:58:10 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95%9]) with mapi id 15.20.5395.018; Sat, 2 Jul 2022
 10:58:10 +0000
Date: Sat, 2 Jul 2022 18:58:02 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, contact@canokeys.org,
 MkfsSion <myychina28759@gmail.com>
Subject: Re: [PATCH v2 0/3] CanoKey: Fix xHCI compatibility and CCID ZLP
Message-ID: <YsAkulsWj5bH7wrT@Sun>
References: <YqcptnhfCtUn2+T6@Sun> <YrSD1xGYsWWk996E@Sun>
 <20220701105106.fzlu44cgvfmb5z4g@sirius.home.kraxel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701105106.fzlu44cgvfmb5z4g@sirius.home.kraxel.org>
X-Operating-System: Linux Sun 5.15.26
X-Mailer: Mutt 2.2.1 (2022-02-19)
X-ClientProxiedBy: BY5PR16CA0021.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::34) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50586ab7-8d02-42e9-7f8c-08da5c19c084
X-MS-TrafficTypeDiagnostic: OS3P286MB2727:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4PV7i7CMqr/ZRFRgwHgvTcesd77Z2g/CbtQtp4aLfXCdvKQgh9quPLoZGDS+yherS65t7sGtMWGO8FiEg7fHEPA4VfmrMQ7SRqQZRO8Ipr1+SPbuzykwgbRIaTHSglWPFs+vbv312t4jywkGiOjCjXJu9wjbmNZrT1iOiSlccBrzZGwN6IAVA41+z76z31jJoN5jCXk1+O2HPkFa6oneOxblrtmvePxYVw6PYyJUm7mZ10xIZUwtNoMFlFp5sMCwPy6+VirdYqQUto5qKbJv7UrKt1v/CDe70sIUr0RAmlMvNeWOzbmbmUm/VtSlTHpOls3ho3NOrf5qlc450vIdSaioGkGSnyJoJqWjD15OUia/8OKfxGBa7G5/cOMaBf/bEZfVCoIVbilP4PWoIqGkaDUPWzgYWQ52di62yMFa9BdUSk+P4HGNECw26REuVlabAgYIMdb0MHC38kIyGnQDWQ4fimoLN6DMkdImuh5SosDDpO65YfCNZ1Sy4qBX950HhRtFrSJOIO1M6aXSpF+fjevr2yPqHZRMGqYXUYEA41jkf8Chlzc1x6pTc1VJ5VV/yp/w1pBgtzYit/c8Qn8aHhZCZJFvnxbNnKJDpuRWtczY7pPDKivdhd9e4Falir4Cb8Ef1/Ty6hwuA7yeCkhJwBjhteqebmWhk9TBXOThRipmwsweZ4rggJaJgnydXejF67ACfkPyVQ1TkR7mZy9yacXITR4pK6CFXiqSoH+EonfC8N/fzkLkFLmNFk0DmCbZmnX4GVdMfmht5fQOz81D0Q5sbD3Uwj8VTJ2WcmrIOCuDGL4QTmLQ23jLcjy9AGmX9Z7uw/Q7dCVJX3ScyNkQyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(376002)(346002)(39830400003)(136003)(366004)(396003)(8936002)(5660300002)(83380400001)(966005)(478600001)(41320700001)(6512007)(6486002)(4326008)(8676002)(52116002)(186003)(9686003)(6506007)(86362001)(2906002)(41300700001)(6666004)(38100700002)(786003)(6916009)(33716001)(316002)(66476007)(66556008)(66946007)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dtOGUJKW1ogeh4cMK8Z99ZtoATVm+VPTSUMH1zt0AAbpA7Zgtve5fhTFWf5p?=
 =?us-ascii?Q?2ySO1mhzrwIQJs/9YOarbyZeCvll7Zg0IBUC4rxLMFXhduhyWCGcCFso8bx8?=
 =?us-ascii?Q?ffKrZ5V6zzw/vT6D0ngm2zLEqXdMzGq+fCeYYgMIXtLqKB1ooUf9h7erQftY?=
 =?us-ascii?Q?gJfoXrKbFqAWG0tEgK+htUQ+eUCaT7cqyE6FnqFNNcapA4fHEjCqdtuEiZNa?=
 =?us-ascii?Q?wUFGCRbjH6/uXVihE27tdWKqm0FZl2g5qQc0+CrTLCEUkYZfbQEhn1Tvtfxo?=
 =?us-ascii?Q?OtJUozopN9kgdnBqqZEKYvXEbqkrJmLIX4VTdNmBcIRGcMTjv+wCx/WbyK2u?=
 =?us-ascii?Q?3oKEDj28UJ5+/rYRJx1tYf+xT0eKjx0fg0eN1msAhxzCaNgGUB3hyL9exADZ?=
 =?us-ascii?Q?KkfFdaqtjiA7oBvSj4Or7k4PqpH0hYfpxSQCjrHlag8svTvS0jjRzLNMSdnS?=
 =?us-ascii?Q?KRzCJC34VOXPT7tv7DYTY+fsqhS8hAk3l0hHVY2AnkWQAAB+B8SushODXV/h?=
 =?us-ascii?Q?1SC2WWGmS2t6efhLHED3buc4qbhDJVCOlXlsWI0dOzu+Q94bglAi5wxzGrfB?=
 =?us-ascii?Q?dGqZ7Oj3wdk5WwvQqNqAOb1clp1vqRK1OfN+HMqnArrIsInZGcqYbdFYHoIn?=
 =?us-ascii?Q?lkkni3w11ak8LjOcfuHwAuVA+9+RTNcgRlOexvTEXtKgDuQ5HqGfJjgXK0oh?=
 =?us-ascii?Q?VVztSAa0vYL/VsnhN5kMpAEfIRunuPSLLRXmtxZ/z2rP0ssSj7AtvM+fyRm4?=
 =?us-ascii?Q?H7jfQuMFAd4KmLxhoA2c4XxC5wKQ4yO3RLhQNSEqAwjKqKmB44GHmxPrr2LO?=
 =?us-ascii?Q?iqyXSshwNOq4wAUekGMPwCznnomFJeWofIY1XQAIxYw+RSc6DQZACShhIasI?=
 =?us-ascii?Q?bo3jES19wRLcx4en6RpxhiGxbU3yH6IaIskjlib+6HNNdri9/b5tDVT89r5t?=
 =?us-ascii?Q?gTgLtYIsrF/8kpDAvNToTSozIiG8SpyLZ0Y0HTI1eaHy+xCJa1W1xTpr8sVf?=
 =?us-ascii?Q?XYrYol8czPEUI2Fc1Q3ZBakNUP9aDu5DCXr7dah2JGT5q3bQkdYSFU0NorY0?=
 =?us-ascii?Q?4cxr3qTS02AiSX0beGe4nivwba9guJsxsiGjiVe6+L/c+iOqqdOpo7GaGus/?=
 =?us-ascii?Q?kG7NyLzRC/84Xzs4VjIqsu0aO5n2H6VCk5+GBWC02cPV0NPeTFnf6PFZyrwM?=
 =?us-ascii?Q?GP4h5HiUihebFnQRZ3u5w+LcCPz9gWZ6rX7usSsi9BH3QC5QjsuEYJL9/x8/?=
 =?us-ascii?Q?dtQEu7B8n+etrJNZ1f5c1AyxMiQ6NiGZnLOSNZJoUd6fy1/Yz43mfK03Qit8?=
 =?us-ascii?Q?WhqGJbAvgECNCy4qrU/CpcpuCz2CfeNXCflH2EHANh9mkDauCHyXPEydQD9I?=
 =?us-ascii?Q?cntDHIx2nom9hnIdBSVoiClJfvc11l8A9AGOG96TOMqq6s5Mi/qMkWWRMkn0?=
 =?us-ascii?Q?xe4alMnwcP8SYb+mN+SRxn9EbYbqMC97AFBe/i4aqI7DRLoP46eAS78YxUn+?=
 =?us-ascii?Q?TuEUhtuCuTeWnwwYQX9KvRvLCba48Ym4SqDOCH3Xqirmy0wGRifkqx+n9kQ3?=
 =?us-ascii?Q?Wk+J63ROqv4Spv5QNjbSK6KFkWx6bB/LkRpxJyk6?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 50586ab7-8d02-42e9-7f8c-08da5c19c084
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2022 10:58:10.3942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IdkJEowgkvewZiCJ+E/+00jcTPttNW6gYbKw2keFe4FrvMa9DGOqQcI232pxIlsH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB2727
Received-SPF: pass client-ip=2a01:111:f403:700c::71a;
 envelope-from=i@zenithal.me;
 helo=JPN01-OS0-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 01, 2022 at 12:51:06PM +0200, Gerd Hoffmann wrote:
> On Thu, Jun 23, 2022 at 11:16:39PM +0800, Hongren (Zenithal) Zheng wrote:
> > On Mon, Jun 13, 2022 at 08:12:38PM +0800, Hongren (Zenithal) Zheng wrote:
> >  
> > > ---
> > > v2: 
> > >   * use usb_ep_get instead of recording ep_in_pointer
> > >       as suggested by kraxel
> > >   * CI result for v2 is at
> > > https://gitlab.com/ZenithalHourlyRate/qemu/-/pipelines/562306905
> > 
> > Hi kraxel, is there any further feedback on this?
> > 
> > BTW, as the commit "add myself as CanoKey maintainer" has been
> > merged, how should I submit patches on CanoKey to you and QEMU?
> 
> Sending to the list with /me Cc'ed is fine.
> 
> > For other contributors, before I can send PULL (my key is not signed yet)
> > I think I should first give Reviewed-by tags then request you
> > to pass them.
> 
> Yes.
> 
> Series queued up now.

Thanks!

> Also I want to add CanoKey in ChangeLog/7.1 in QEMU wiki.
> But the account for wiki should be created by some other
> people with existing accounts. I wonder if you or anyone
> on the list could kindly do me a favor? Thanks!
> 
> My preferred username is Zenithal.

Could you please also add a wiki account for me?

There are two additional patches reviewed by me, and you have been Cc'ed.
I wonder if you could queue them up.

[PATCH v4 1/2] hw: canokey: Remove HS support as not compliant to the spec
[PATCH v4] docs/system/devices/canokey: Document limitations on usb-ehci

> 
> thanks,
>   Gerd
> 

