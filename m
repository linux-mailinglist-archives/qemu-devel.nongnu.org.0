Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D91E4417747
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 17:11:42 +0200 (CEST)
Received: from localhost ([::1]:58742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTmrV-00014a-V6
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 11:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mTmoe-0005fz-Fb; Fri, 24 Sep 2021 11:08:45 -0400
Received: from mail-bn7nam10on2061b.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::61b]:14945
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mTmoa-0004iU-8m; Fri, 24 Sep 2021 11:08:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYJ9x8kh3HCRDxCy3iR4RGt02JCrV1UnRKBtW5cROmzpOCZqQwpM1HAcNhSqnyVp2wAMqUwmXSC0WCXr9B7nBgJ3BYH23+1/YmJFJPlYwS0g6KiRauJ5wcQ4gK0AnJrhItaNgNORC/5RbRmzr4+8DGQ86NK7HfVMercNRWHE7ul3KcYjDiFkat+O+A71npAXIhLIuzE+0jNPeUSgB47BGzrux1QFgKF+7DgKEePTpcKySbXHR36O0f2/n8apzz/99zZHE5GjMDaQbTGNPgPtaKOhtl4rkohvvrv4yZ0/4QuYAsEaxnAV/hLaYWU9Yml7Yn1JF3n41ulgCneywVj4eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=BW2vqz3zkIXnZiHBqUa2Jx9fEUz2oXO3i31uc/w9slk=;
 b=MRJia17Bqx9I2I0aclvG4BEprgwSvgVGOGgUggL0ggSGTkzSqP4LhpSEu1h7ItaPeF5MJVvwK2hwYhOyNmwXLmtiKWZgK05loVWnVMoXZaX5DdcmZI7LhOBVJJGzRYEDqL1kZ/sQp2AiQYk7j7piYnmP0z5hF701WGT1Vnb6Q9lz3SjFfFxQY1JgVCW0TuKP05Uv0kUpuQVix+mH66T7ynM07heEr4ENnGKNLkIvAh/NXwi7QJX7onpZReh9hoMNP6mzo/8RlANUoEgrBcQqXqnFLKmLgVQwIaKW5mFujHNfS8AFtxfEorfqbWCCKMG1gQ3zEFGXFhojJaeolOEYGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BW2vqz3zkIXnZiHBqUa2Jx9fEUz2oXO3i31uc/w9slk=;
 b=jpDW5FSlVklqUxlchtPKKm7X/YK4co/K13F94AwPfqB/dxyg/kohY1+ZkzwiKQvboLkpneg0t+ugcEb+aXJui9dPdZfGfPHh44gv4EkVqp6Sr9Ou9MJP5hvyY7SwZ1wFGqXpnKKGpfiwXZ0mGO2PPNgvlh8XoAzx/CdQm7ykMu8=
Authentication-Results: de.ibm.com; dkim=none (message not signed)
 header.d=none;de.ibm.com; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB3671.namprd12.prod.outlook.com (2603:10b6:610:23::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 15:03:28 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::f5af:373a:5a75:c353]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::f5af:373a:5a75:c353%8]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 15:03:27 +0000
Date: Fri, 24 Sep 2021 10:03:19 -0500
To: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Subject: Re: [PATCH] block: introduce max_hw_iov for use in scsi-generic
Message-ID: <20210924150319.hviyhwvt4hxhhocw@amd.com>
References: <20210923130436.1187591-1-pbonzini@redhat.com>
 <5ab3b92b-92ef-e13d-4ec0-f73bec5a3782@de.ibm.com>
 <CABgObfabAj_AyFAr0kXa5tXntpBXBfXxf+mB=Ocbg=jUh5FMzA@mail.gmail.com>
 <83191438-a91d-55d2-233f-ae87b99e29bc@de.ibm.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83191438-a91d-55d2-233f-ae87b99e29bc@de.ibm.com>
X-ClientProxiedBy: SN7PR04CA0167.namprd04.prod.outlook.com
 (2603:10b6:806:125::22) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
Received: from localhost (165.204.77.11) by
 SN7PR04CA0167.namprd04.prod.outlook.com (2603:10b6:806:125::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Fri, 24 Sep 2021 15:03:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73c9f18c-61d4-4b0b-a6ec-08d97f6c76d4
X-MS-TrafficTypeDiagnostic: CH2PR12MB3671:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3671ACE66007EEBF39B6AB3E95A49@CH2PR12MB3671.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xZ+o/2CSv6Cx5r5D3A08MrEbI8cK1AjummtcYQyn0nTyYjbGxGk1JBjdZnBoEABgssOTsPOCMYQkE/G87vmAbkVMeeaiCweptlsi9x2k2K0oCNdn7IGmvssJmUOXLAYFyIwOYvjeiyjUpx6kGQaANmiO57V/xPTORtHP7i/3xhF67PQBfDeKNYZpPLUjvpmcRO4ydC3GefnOj3Te/30ZZGyfS9r4OyYkVvbqAfahpc13KRtwPyhfq4uctybJoAE/mxAhNkml9QxDL/TcyvNI2Rm01e4Br+t7HMJjJH15u4w8+9qZ4D2is5nFmu5JLH/gzK0jYcLtJn8ZjnY3R+aXE4CnCIQZPP93s9qs2R3atcWbngqQWFEoyCNPayd2bdcWVAeE96H+U6YSrxtmfC0H0T8boSQZTE/CgFNy3uaCrtz8G+RiAScLfFDgbSbgQEk3YpSmoND3iIubl+fgQe09qDqPDljscrDpGIdM70RdW5ZFvV+7+Yebs6JRH1ClLHQ/vHsNRSVnqzx5EhM9GBoDaVPA4tdPe87o4y8Pak2Ec0x9iwQMgok5l5gep7duDeLPl2VUd4YpL7b1n3rfd7YAjIS1M4xkW/Zrw8ztcIDRLD9I0mclar4OByVitmElTbNiro+UYAL09xvbFA0agpgdLZlna5LamyBs9alwQtHKlxDXvJ3h6aDQvvoe+JmbBQXPbNWeDV8lcssnql06nA7I9x5eprINDW5uUT2TK1zFXlc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6496006)(36756003)(52116002)(44832011)(4326008)(508600001)(8936002)(2906002)(6916009)(54906003)(38350700002)(2616005)(8676002)(186003)(316002)(86362001)(26005)(66476007)(66556008)(5660300002)(6666004)(38100700002)(66946007)(83380400001)(956004)(6486002)(1076003)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3Du4MLowFYW4BeBXZofPJs7nj/+ay2HcxDF6TE1OvGnLE8smAydxGs839n?=
 =?iso-8859-1?Q?FTBSTNiIDHNhsRUaSGLggvDkdbD9qd1TNJO8X4Bkt1I2JX89w1sWgNx/5D?=
 =?iso-8859-1?Q?iFwHL8ZgIgauqtKpG5/Mdi0uCUj0Nhl1u8x6qgrqmRr6knyZVEAa7b5rlW?=
 =?iso-8859-1?Q?quKblhUU79LD6vOuGzTrU+LUl9tiCzpZ9s5B6bLovgQ9f7t8Oi8mBVby2g?=
 =?iso-8859-1?Q?YtNIgX6zgArbmIPhkfHYtvAJ+XYIjiQv3Yf/aVpCziBtIhlay9/j4ss6qg?=
 =?iso-8859-1?Q?+a20e4CrbMgOIVYygGS+amw/9QAFTM7k032BwKI9ze/R/tPt07dMgxSg7O?=
 =?iso-8859-1?Q?xBDFvb21zUdtCZuW+axwmiNS853RhoSy/0IgGZs32OpyaB8gLk1AhEsh7p?=
 =?iso-8859-1?Q?bs0jDGlKZ+9E0T7Ppuot/FLo9Va8Hn9Cggm7hO+eGKwp/9EmyMKVLXJ6EZ?=
 =?iso-8859-1?Q?yvyax4wfbc5y0FLWBk3iTKMqOaMaB4z1P4468psRfvH+DTZJuP3vS2tFO1?=
 =?iso-8859-1?Q?51hY7wvYItk1JpnTJLNYIH0OhXdxDidy8GaHOZVo/nduz9ep0OVoE/k3Ow?=
 =?iso-8859-1?Q?6qHoHFmCVnyxE0W5bABx38nfDLGdYz85X2ATLLa3ZI3vAOFgEjOxmmCDZz?=
 =?iso-8859-1?Q?aUgcy+azY2miZo6jwX7royt+YzpHzyVgfxZ8XusloyXvxvXREkS+PtGvUn?=
 =?iso-8859-1?Q?nuVVZXL0qlSIckLxrnroxAFuQGO+PxSbylC+j1kxGN6iPAK+fKWjTXY+oS?=
 =?iso-8859-1?Q?C/oOT2MFy60ub1fp4lkGCNdKj3xO42GJjw5qOiCzA6iAsrYJAoXwb6XQ8C?=
 =?iso-8859-1?Q?BJnOpaodLdWEJmLbgcgroUNoACAfdPD25H0MY4qKimri499rpWb5aHao6f?=
 =?iso-8859-1?Q?S4s7nWRKe/Ec3TmZ/UN97rwhF1f9wTUmIu5O76HvD7hJsrn834Vi4U7uLs?=
 =?iso-8859-1?Q?OYVl9CnWtUd/6NZu4oLOkeu6e8LElm5iQ0WKxIy4Xj4yPQPudYKWXlXmHP?=
 =?iso-8859-1?Q?g7wbnjalRnJLcpbQqNEdHU0WSwdIUCwbuc9DQZjc6tZF9QjCzxEOPbLwFf?=
 =?iso-8859-1?Q?7in6acWjXroaajjMfxYLr0cVT207WcHZ88jWrIa3qvctz9n8hi+I7Bi6lV?=
 =?iso-8859-1?Q?pTHcg33P5LOpxo1cqUC5EC9p/u+66lbq2BDCGN4WJCNU/0CWqqk+mfSqFZ?=
 =?iso-8859-1?Q?NmiDlFvQfkqKyzy4+wAKIoIUSx8tukw7Fq6jwW6q86WDNfH5cL9ZSI3TS8?=
 =?iso-8859-1?Q?CODnxyz/VZVEpSE5Oia+N9f/os9ct5O37+1I2ekcknnRf4OXGuM1mVuUtr?=
 =?iso-8859-1?Q?MJQcJXTi4HH5vk/B5q6HyShkvu2JujH0W8CP1ydHhMRoTiC5pbH1cJh6Ka?=
 =?iso-8859-1?Q?y8LBFqC/lH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c9f18c-61d4-4b0b-a6ec-08d97f6c76d4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 15:03:27.8360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vHfyc0PS+rzzv6eByN1V+/cRAMCrzrhdAQX1aS+88RFLLbW0tciQQeOLaj8HbZBWrYN//LLvEeR2+w+c8ICkJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3671
Received-SPF: softfail client-ip=2a01:111:f400:7e8a::61b;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Michael Roth <michael.roth@amd.com>
From:  Michael Roth via <qemu-devel@nongnu.org>

On Fri, Sep 24, 2021 at 08:50:05AM +0200, Christian Borntraeger wrote:
> Peter, Michael,
> 
> do we still do stable releases for QEMU or has this stopped?

Hi Christian,

Yes, it's just been a perfect storm of job moves / bad timing / much-needed
testing rework. I plan to restart the stable releases starting with 6.0.1 and
6.1.1 shortly after. I'll get the release schedules posted on the release wiki
week.

Sorry for the delays on this.

-Mike

> 
> Am 24.09.21 um 07:27 schrieb Paolo Bonzini:
> > Yes, the question is whether it still exists... Paolo El jue., 23 sept. 2021 16:48, Christian Borntraeger <borntraeger@de.ibm.com> escribió: Am 23.09.21 um 15:04 schrieb Paolo Bonzini: > Linux limits the size of iovecs to 1024 (UIO_MAXIOV ZjQcmQRYFpfptBannerStart
> > This Message Is From an External Sender
> > This message came from outside your organization.
> > ZjQcmQRYFpfptBannerEnd
> > Yes, the question is whether it still exists...
> > 
> > Paolo
> > 
> > El jue., 23 sept. 2021 16:48, Christian Borntraeger <borntraeger@de.ibm.com <mailto:borntraeger@de.ibm.com>> escribió:
> > 
> > 
> > 
> >     Am 23.09.21 um 15:04 schrieb Paolo Bonzini:
> >      > Linux limits the size of iovecs to 1024 (UIO_MAXIOV in the kernel
> >      > sources, IOV_MAX in POSIX).  Because of this, on some host adapters
> >      > requests with many iovecs are rejected with -EINVAL by the
> >      > io_submit() or readv()/writev() system calls.
> >      >
> >      > In fact, the same limit applies to SG_IO as well.  To fix both the
> >      > EINVAL and the possible performance issues from using fewer iovecs
> >      > than allowed by Linux (some HBAs have max_segments as low as 128),
> >      > introduce a separate entry in BlockLimits to hold the max_segments
> >      > value from sysfs.  This new limit is used only for SG_IO and clamped
> >      > to bs->bl.max_iov anyway, just like max_hw_transfer is clamped to
> >      > bs->bl.max_transfer.
> >      >
> >      > Reported-by: Halil Pasic <pasic@linux.ibm.com <mailto:pasic@linux.ibm.com>>
> >      > Cc: Hanna Reitz <hreitz@redhat.com <mailto:hreitz@redhat.com>>
> >      > Cc: Kevin Wolf <kwolf@redhat.com <mailto:kwolf@redhat.com>>
> >      > Cc: qemu-block@nongnu.org <mailto:qemu-block@nongnu.org>
> >      > Fixes: 18473467d5 ("file-posix: try BLKSECTGET on block devices too, do not round to power of 2", 2021-06-25)
> > 
> >     This sneaked in shortly before the 6.1 release (between rc0 and rc1 I think).
> >     Shouldnt that go to stable in cass this still exist?
> > 
> > 
> >      > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com <mailto:pbonzini@redhat.com>>
> >      > ---
> >      >   block/block-backend.c          | 6 ++++++
> >      >   block/file-posix.c             | 2 +-
> >      >   block/io.c                     | 1 +
> >      >   hw/scsi/scsi-generic.c         | 2 +-
> >      >   include/block/block_int.h      | 7 +++++++
> >      >   include/sysemu/block-backend.h | 1 +
> >      >   6 files changed, 17 insertions(+), 2 deletions(-)
> >      >
> >      > diff --git a/block/block-backend.c b/block/block-backend.c
> >      > index 6140d133e2..ba2b5ebb10 100644
> >      > --- a/block/block-backend.c
> >      > +++ b/block/block-backend.c
> >      > @@ -1986,6 +1986,12 @@ uint32_t blk_get_max_transfer(BlockBackend *blk)
> >      >       return ROUND_DOWN(max, blk_get_request_alignment(blk));
> >      >   }
> >      >
> >      > +int blk_get_max_hw_iov(BlockBackend *blk)
> >      > +{
> >      > +    return MIN_NON_ZERO(blk->root->bs->bl.max_hw_iov,
> >      > +                        blk->root->bs->bl.max_iov);
> >      > +}
> >      > +
> >      >   int blk_get_max_iov(BlockBackend *blk)
> >      >   {
> >      >       return blk->root->bs->bl.max_iov;
> >      > diff --git a/block/file-posix.c b/block/file-posix.c
> >      > index cb9bffe047..1567edb3d5 100644
> >      > --- a/block/file-posix.c
> >      > +++ b/block/file-posix.c
> >      > @@ -1273,7 +1273,7 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
> >      >
> >      >           ret = hdev_get_max_segments(s->fd, &st);
> >      >           if (ret > 0) {
> >      > -            bs->bl.max_iov = ret;
> >      > +            bs->bl.max_hw_iov = ret;
> >      >           }
> >      >       }
> >      >   }
> >      > diff --git a/block/io.c b/block/io.c
> >      > index a19942718b..f38e7f81d8 100644
> >      > --- a/block/io.c
> >      > +++ b/block/io.c
> >      > @@ -136,6 +136,7 @@ static void bdrv_merge_limits(BlockLimits *dst, const BlockLimits *src)
> >      >       dst->min_mem_alignment = MAX(dst->min_mem_alignment,
> >      >                                    src->min_mem_alignment);
> >      >       dst->max_iov = MIN_NON_ZERO(dst->max_iov, src->max_iov);
> >      > +    dst->max_hw_iov = MIN_NON_ZERO(dst->max_hw_iov, src->max_hw_iov);
> >      >   }
> >      >
> >      >   typedef struct BdrvRefreshLimitsState {
> >      > diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
> >      > index 665baf900e..0306ccc7b1 100644
> >      > --- a/hw/scsi/scsi-generic.c
> >      > +++ b/hw/scsi/scsi-generic.c
> >      > @@ -180,7 +180,7 @@ static int scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s, int len)
> >      >           page = r->req.cmd.buf[2];
> >      >           if (page == 0xb0) {
> >      >               uint64_t max_transfer = blk_get_max_hw_transfer(s->conf.blk);
> >      > -            uint32_t max_iov = blk_get_max_iov(s->conf.blk);
> >      > +            uint32_t max_iov = blk_get_max_hw_iov(s->conf.blk);
> >      >
> >      >               assert(max_transfer);
> >      >               max_transfer = MIN_NON_ZERO(max_transfer, max_iov * qemu_real_host_page_size)
> >      > diff --git a/include/block/block_int.h b/include/block/block_int.h
> >      > index f1a54db0f8..c31cbd034a 100644
> >      > --- a/include/block/block_int.h
> >      > +++ b/include/block/block_int.h
> >      > @@ -702,6 +702,13 @@ typedef struct BlockLimits {
> >      >        */
> >      >       uint64_t max_hw_transfer;
> >      >
> >      > +    /* Maximal number of scatter/gather elements allowed by the hardware.
> >      > +     * Applies whenever transfers to the device bypass the kernel I/O
> >      > +     * scheduler, for example with SG_IO.  If larger than max_iov
> >      > +     * or if zero, blk_get_max_hw_iov will fall back to max_iov.
> >      > +     */
> >      > +    int max_hw_iov;
> >      > +
> >      >       /* memory alignment, in bytes so that no bounce buffer is needed */
> >      >       size_t min_mem_alignment;
> >      >
> >      > diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
> >      > index 29d4fdbf63..82bae55161 100644
> >      > --- a/include/sysemu/block-backend.h
> >      > +++ b/include/sysemu/block-backend.h
> >      > @@ -211,6 +211,7 @@ uint32_t blk_get_request_alignment(BlockBackend *blk);
> >      >   uint32_t blk_get_max_transfer(BlockBackend *blk);
> >      >   uint64_t blk_get_max_hw_transfer(BlockBackend *blk);
> >      >   int blk_get_max_iov(BlockBackend *blk);
> >      > +int blk_get_max_hw_iov(BlockBackend *blk);
> >      >   void blk_set_guest_block_size(BlockBackend *blk, int align);
> >      >   void *blk_try_blockalign(BlockBackend *blk, size_t size);
> >      >   void *blk_blockalign(BlockBackend *blk, size_t size);
> >      >
> > 

