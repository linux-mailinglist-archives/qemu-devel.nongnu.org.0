Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE643F4BF1
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 15:54:56 +0200 (CEST)
Received: from localhost ([::1]:59206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIAPe-0007vM-W9
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 09:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mIANp-0006aS-JQ
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 09:53:01 -0400
Received: from relay64.bu.edu ([128.197.228.104]:45276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mIANn-000051-Pj
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 09:53:01 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 17NDqbRo025752
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 23 Aug 2021 09:52:40 -0400
Date: Mon, 23 Aug 2021 09:52:37 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: Re: fuzz: fuzz_dma_read_cb() may overlap with MMIO regions
Message-ID: <20210823135237.gzohwtoatjjhkezb@mozz.bu.edu>
References: <reply-76b541d3da83db84dd2a5b0ba3bba9ff@gitlab.com>
 <issue_92358130@gitlab.com> <note_656820217@gitlab.com>
 <note_657261050@gitlab.com> <note_657305687@gitlab.com>
 <20210823081403.l74lp7gay5tjy2m5@mozz.bu.edu>
 <PN0PR01MB6352A955D162E07966CC03B7FCC49@PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM>
 <20210823124131.psbl4nfuubvyaoki@mozz.bu.edu>
 <PN0PR01MB6352C0097804F169E15BC2F0FCC49@PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN0PR01MB6352C0097804F169E15BC2F0FCC49@PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.885,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210823 2123, Qiuhao Li wrote:
> Aha! Nice patch.
> 
> My fault. I will search first next time :)

If you are interested in testing fuzzing code and you want to
automatically be cc-ed when something changes, you can send a patch
adding yourself to reviewers in the Fuzzing section of MAINTAINERS
-Alex

> 
> Thanks.
>   Qiuhao Li
> 
> On Mon, 2021-08-23 at 08:41 -0400, Alexander Bulekov wrote:
> > On 210823 2034, Qiuhao Li wrote:
> > > I think the check in fuzz_dma_read_cb() is buggy because it doesn't
> > > consider when the write address is not in the mmio region but can
> > > overlap. For example, the mmio region is 0xe0000000 to 0xe0001000,
> > > and
> > > the write address is 0xdffff000 (not ram) and length is 0x2000. In
> > > this
> > > case, the address_space_translate() will return the sparse_mem_mr
> > > we
> > > created, thus bypassing the check and call qtest_memwrite().
> > > 
> > > Perhaps we need more detailed checks to ensure that the entire
> > > write
> > > operation occurs in the ram or won't overlap with mmio regions.
> > > What do
> > > you think?
> > > 
> > > 
> > 
> > Good catch. I think this will fix that:
> > https://lore.kernel.org/qemu-devel/20210713150037.9297-2-alxndr@bu.edu/
> > 
> > I mentioned that there were some fixes waiting for the 6.1 release,
> > but
> > didn't realize you were talking about what seems to be the same
> > issue.
> > -Alex
> 
> 

