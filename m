Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 956233F4B04
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 14:45:28 +0200 (CEST)
Received: from localhost ([::1]:39064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI9KM-0005QR-K9
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 08:45:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mI9H8-000181-TS
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 08:42:05 -0400
Received: from relay68.bu.edu ([128.197.228.73]:58483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mI9H5-0005UN-Qq
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 08:42:01 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 17NCfV5m018487
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 23 Aug 2021 08:41:34 -0400
Date: Mon, 23 Aug 2021 08:41:31 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: Re: fuzz: fuzz_dma_read_cb() may overlap with MMIO regions
Message-ID: <20210823124131.psbl4nfuubvyaoki@mozz.bu.edu>
References: <reply-76b541d3da83db84dd2a5b0ba3bba9ff@gitlab.com>
 <issue_92358130@gitlab.com> <note_656820217@gitlab.com>
 <note_657261050@gitlab.com> <note_657305687@gitlab.com>
 <20210823081403.l74lp7gay5tjy2m5@mozz.bu.edu>
 <PN0PR01MB6352A955D162E07966CC03B7FCC49@PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN0PR01MB6352A955D162E07966CC03B7FCC49@PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
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

On 210823 2034, Qiuhao Li wrote:
> I think the check in fuzz_dma_read_cb() is buggy because it doesn't
> consider when the write address is not in the mmio region but can
> overlap. For example, the mmio region is 0xe0000000 to 0xe0001000, and
> the write address is 0xdffff000 (not ram) and length is 0x2000. In this
> case, the address_space_translate() will return the sparse_mem_mr we
> created, thus bypassing the check and call qtest_memwrite().
> 
> Perhaps we need more detailed checks to ensure that the entire write
> operation occurs in the ram or won't overlap with mmio regions. What do
> you think?
> 
> 

Good catch. I think this will fix that:
https://lore.kernel.org/qemu-devel/20210713150037.9297-2-alxndr@bu.edu/

I mentioned that there were some fixes waiting for the 6.1 release, but
didn't realize you were talking about what seems to be the same issue.
-Alex

> mr1 = address_space_translate(first_cpu->as,
>                               addr, &addr1, &l, true,
>                               MEMTXATTRS_UNSPECIFIED);
> 
> if (!(memory_region_is_ram(mr1) ||
>       memory_region_is_romd(mr1)) && mr1 != sparse_mem_mr) {
>     l = memory_access_size(mr1, l, addr1);
> } else {
>     /* ROM/RAM case */
>     // mr1 == sparse_mem_mr but it's not RAM or ROM <--
>     // May overlap with mmio regions                <--
>     ...
>     qtest_memwrite(qts_global, addr, buf, l);
> 
> 
> Thanks.
>   Qiuhao Li
> 
> On Mon, 2021-08-23 at 04:14 -0400, Alexander Bulekov wrote:
> > I'm not sure I understand. We try to avoid writing to MMIO regions in
> > fuzz_dma_read_cb to avoid such false-positives. E.g. that's why we have
> > code to do address_space_translate and manually walk the AddressSpace
> > and verify that we are writing to RAM, before doing the actual
> > qtest_memwrite. There is a fix to that code that need to be applied,
> > but
> > those have to wait for the 6.1 release. BTW, since this is about the
> > generic-fuzzer rather than this bug, I cc-ed qemu-devel. Let's continue
> > the discussion there.
> > 
> > -Alex
> > 
> > On 210823 0132, 李秋豪 (@QiuhaoLi) wrote:
> > > 
> > > 
> > > 
> > > 李秋豪 commented on a discussion:
> > > https://gitlab.com/qemu-project/qemu/-/issues/541#note_657305687
> > > 
> > > Ok, I add a reply to my report about #540 and #541.
> > > 
> > > Btw, it suddenly occurred to me that our generic-fuzzer can also make
> > > reentry issues. For example, a device tries to read from a mmio
> > > region while being fuzzed, but the fuzz_dma_read_cb() will write to
> > > that region, thus leading to positive-false reentry issues. In short,
> > > we change a read action to write. Should we add checks?
> > > 
> > > -- 
> > > Reply to this email directly or view it on GitLab:
> > > https://gitlab.com/qemu-project/qemu/-/issues/541#note_657305687
> > > You're receiving this email because of your account on gitlab.com.
> > > 
> > > 
> > 
> 
> 

