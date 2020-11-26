Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 521612C5C19
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 19:45:49 +0100 (CET)
Received: from localhost ([::1]:40072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiMH5-0000UL-QH
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 13:45:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kiMFs-0008GA-Dy; Thu, 26 Nov 2020 13:44:32 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:36093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kiMFq-0007T1-Hu; Thu, 26 Nov 2020 13:44:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=RDS4VF9nKMpWJg0jMrVJgM6mfOyAYlRuBwUiYJcoNRs=; b=NweNxH9XcYaTmSN5UfKawmfT8o
 GRItZjIQQZQqXTZNh1Z2Ev2y9QNQ3hKalwVqbOA2gcSr7CU3rtl0RYHdFb8JyqWKL8JgLEuY/KN31
 yNzDW7mcvaVNfWy2p5eXIEH2GJHVbIvlm8X6/wtY2BKPfJ3phwtojwBQ33VUpdw8UtdZT52Pw42Vd
 xASONNFld8bSqEjvPkRPRSzL3x3V8pSe4RlaTDBbiFrFBIpGTbYFGXFY0q174NZmcv/ayHJTpMl2L
 l5U99Z3bcrOTm+aos4ohEwVrI9TubNCd6aqxDBup9oE52xwfAqZYqbdXCnsaLGqD5RXro7wxKB12F
 2zEZzfaw==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Alex Chen <alex.chen@huawei.com>,
 qemu-trivial@nongnu.org, zhang.zhanghailiang@huawei.com
Subject: Re: [PATCH] virtfs-proxy-helper: Fix a resource leak in main()
Date: Thu, 26 Nov 2020 19:44:24 +0100
Message-ID: <13615133.E8RLdmFOkC@silver>
In-Reply-To: <20201126192719.7ea20846@bahia.lan>
References: <20201126101624.55714-1-alex.chen@huawei.com>
 <2017010.0bgJjaKMus@silver> <20201126192719.7ea20846@bahia.lan>
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

On Donnerstag, 26. November 2020 19:27:19 CET Greg Kurz wrote:
> On Thu, 26 Nov 2020 18:52:39 +0100
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Donnerstag, 26. November 2020 14:15:51 CET Alex Chen wrote:
> > > Hi Greg,
> > > 
> > > Thanks for your review.
> > > 
> > > On 2020/11/26 20:07, Greg Kurz wrote:
> > > > On Thu, 26 Nov 2020 10:16:24 +0000
> > > > 
> > > > Alex Chen <alex.chen@huawei.com> wrote:
> > > >> Only one of the options -s and -f can be used. When -f is used,
> > > >> the fd is created externally and does not need to be closed.
> > 
> > So somebody is really using the 9p proxy driver for something;
> > interesting.
> > 
> > > > The process running virtfs-proxy-helper has its own copy of
> > > > the fd inherited from its parent. And this fd will be closed
> > > > eventually when the process terminates.
> > > > 
> > > >> When -s is used, a new socket fd is created, and this socket fd
> > > >> needs to be closed at the end of main().
> > > > 
> > > > Same here, the new socket fd is closed when the process
> > > > terminates.
> > 
> > Does it? I haven't reviewed much of the 9p proxy code yet, however if
> > chroot() fails for instance, the fd would leak right now, wouldn't it?
> 
> This is done just at the end of main()... the leak won't last long.
> 
> > Or was your argument that it's the OS's job to free any file descriptor
> > automatically on process terminations in general?
> 
> That's exactly my point.
> 
> The only justification that'd deserve to be in the changelog of
> such a patch is something like "because this is good practice
> to rollback in case code moves to another function than main()".

Well, the actual motivation was rather a pragmatic one: to shut up a 
sanitizer's false positive, which I can understand.

Another option would be using a global variable for the fd instead of a 
temporary on stack. That should shut up the sanitizer as well and would not 
introduce change to the program flow.

I leave that up to Greg to decide whether or not to handle this. I'm 
Switzerland on this one.

Best regards,
Christian Schoenebeck



