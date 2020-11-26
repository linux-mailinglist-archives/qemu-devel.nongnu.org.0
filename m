Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 023EA2C5B20
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 18:55:00 +0100 (CET)
Received: from localhost ([::1]:42116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiLTv-0003P9-3W
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 12:54:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kiLRs-0001r5-0S; Thu, 26 Nov 2020 12:52:52 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:53471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kiLRn-0000dz-Hf; Thu, 26 Nov 2020 12:52:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=GG7rO0ckcHFQAtHdHjhl3qMiMk2hkIkM6nZa1LPJWa0=; b=W0jvh1JW/VY5bcLPxOHOiwFOgv
 G8/7Ib2nJLCnOdv/bqqa/dOblBSZOJ1Xq/mxYf6S/+prY75yVZFCYVBC6/S6xWChlAV17zYYWzhfg
 JkZjcstaSPOfCnQscobXaIErYeYcLlUV2iMzlcQMJp4y3w/qOuv+njKBZ4ZyERjtK5sT7ne/K3CX0
 X91s6t9T+dbWwzQ5sbJXmDqrTMJVhIxsFbyq+A2K7JzamB2FWF3gfcLpej0rY8haYtUZCtM4AbPaf
 OH6cBF4QAAPL37q6s+y0QnQ1FHjfh5WddskBEupbmqOKvc4g6pr0C5/VmDvPbB8SVMSJiCmcL8IWW
 MtGnfbXg==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Alex Chen <alex.chen@huawei.com>, Greg Kurz <groug@kaod.org>,
 qemu-trivial@nongnu.org, zhang.zhanghailiang@huawei.com
Subject: Re: [PATCH] virtfs-proxy-helper: Fix a resource leak in main()
Date: Thu, 26 Nov 2020 18:52:39 +0100
Message-ID: <2017010.0bgJjaKMus@silver>
In-Reply-To: <5FBFAA87.5000400@huawei.com>
References: <20201126101624.55714-1-alex.chen@huawei.com>
 <20201126130734.56f2a84a@bahia.lan> <5FBFAA87.5000400@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Donnerstag, 26. November 2020 14:15:51 CET Alex Chen wrote:
> Hi Greg,
> 
> Thanks for your review.
> 
> On 2020/11/26 20:07, Greg Kurz wrote:
> > On Thu, 26 Nov 2020 10:16:24 +0000
> > 
> > Alex Chen <alex.chen@huawei.com> wrote:
> >> Only one of the options -s and -f can be used. When -f is used,
> >> the fd is created externally and does not need to be closed.

So somebody is really using the 9p proxy driver for something; interesting.

> > 
> > The process running virtfs-proxy-helper has its own copy of
> > the fd inherited from its parent. And this fd will be closed
> > eventually when the process terminates.
> > 
> >> When -s is used, a new socket fd is created, and this socket fd
> >> needs to be closed at the end of main().
> > 
> > Same here, the new socket fd is closed when the process
> > terminates.

Does it? I haven't reviewed much of the 9p proxy code yet, however if chroot() 
fails for instance, the fd would leak right now, wouldn't it?

Or was your argument that it's the OS's job to free any file descriptor 
automatically on process terminations in general?

> IMO, it's best to explicitly release resources before the process
> terminates, just as the variable 'rpath' is explicitly freed in main(),
> so socket fd also needs to be explicitly closed here.
> 
> Looking forward to your reply.
> 
> > The only justification to merge such a change would be if
> > the code was sitting in some other function, in which
> > case we should indeed do proper rollback. But it is main()
> > here, so this patch isn't needed.
> > 
> >> Reported-by: Euler Robot <euler.robot@huawei.com>
> > 
> > Can you provide a copy of the report in case I'm
> > missing something ?
> 
> Our codecheck tool reports a resource leak here, which is relatively simple,
> like the one below, I did not attach it.
> 
> ---------------------
> "Resource leak: sock"
> ---------------------

Yeah, not very helpful that output.

> 
> Thanks,
> Alex

Best regards,
Christian Schoenebeck



