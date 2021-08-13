Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D4B3EB44C
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 12:52:14 +0200 (CEST)
Received: from localhost ([::1]:58812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEUnM-0007Xu-Rz
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 06:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mEUmX-0006o6-L8
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 06:51:21 -0400
Received: from relay64.bu.edu ([128.197.228.104]:39639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mEUmW-0002Ub-5d
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 06:51:21 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 17DAoCTM006811
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 13 Aug 2021 06:50:15 -0400
Date: Fri, 13 Aug 2021 06:50:12 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Li Qiuhao <Qiuhao.Li@outlook.com>
Subject: Re: [Question] fuzz: double-fetches in a memory region map session
Message-ID: <20210813105004.j7p6qhaokg7fj6ao@mozz.bu.edu>
References: <PN0PR01MB6352FCDBE92B94EF0A05E658FCF99@PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN0PR01MB6352FCDBE92B94EF0A05E658FCF99@PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.999,
 HK_RANDOM_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 210813 0349, Li Qiuhao wrote:
> Hi Alex,
> 
> Recently I was reading the DMA call-back functions in the fuzzer. It seems
> fuzz_dma_read_cb() is inserted into flatview_read_continue() and
> address_space_map() to make the host read changed content between different
> DMA actions.
> 
> My question is about address_space_map() -- How do we emulate double-fetch
> bugs in the same map/unmap session? For example:
> 

Hi Qiuhao,
Right now we don't. One strategy would be to use mprotect. When the code
fetches data the first time, we get a SEGV, where we unprotect the page,
write a pattern, and enable single-stepping. Then, after the
single-step, re-protect the page, and disable single-step.

On OSS-Fuzz, we disabled double-fetch detection, for now, as we did not
want reproducers for normal-bugs to inadvertently contain
double-fetches. To make the double-fetch detection useful for
developers, we probably need to limit the double fetch capability to
only fill the DMA regions twice, rather than 10 or 20 times. Then, in
the report, we could give the call-stacks (from the SEGV handler, or
dma_read hook) of the exact locations in the code that read from the
same address twice.

Thanks for your interest in this!
-Alex

> 
>   FOO *guest_foo = (FOO *) address_space_map(as, ...);

// mprotect in address_space_map hook   

// SEGV on the read. Un-mprotect, fill with pattern
>   uint64_t size = guest_foo->size;    // first fetch

// Single Step. Re-mprotect (or you could just immediately fill with a
// new pattern)

>   if size > limit
>     goto error;
>   
>   /* time window */
>   

// SEGV
>   memcpy(dest, src, guest_foo->size); // double-fetch ?
>   
>   error:
>   address_space_unmap(as, guest_foo, ...)
> 
> 
> Thanks,
>   Qiuhao Li

