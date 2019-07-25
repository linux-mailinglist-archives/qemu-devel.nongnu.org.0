Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FD2746A0
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 07:55:51 +0200 (CEST)
Received: from localhost ([::1]:55910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqWjG-0004Pc-3o
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 01:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37349)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dovgaluk@ispras.ru>) id 1hqWj3-00041P-2R
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 01:55:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dovgaluk@ispras.ru>) id 1hqWj2-0000Qq-0v
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 01:55:36 -0400
Received: from mail.ispras.ru ([83.149.199.45]:38922)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <dovgaluk@ispras.ru>) id 1hqWj1-0000Q0-P1
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 01:55:35 -0400
Received: from PASHAISP (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 2A69B54006A;
 Thu, 25 Jul 2019 08:55:33 +0300 (MSK)
From: "Pavel Dovgalyuk" <dovgaluk@ispras.ru>
To: "'Paolo Bonzini'" <pbonzini@redhat.com>,
 "'Pavel Dovgalyuk'" <pavel.dovgaluk@gmail.com>, <qemu-devel@nongnu.org>
References: <156395778867.510.17588721322993616668.stgit@pasha-Precision-3630-Tower>
 <156395787270.510.3319575187228105326.stgit@pasha-Precision-3630-Tower>
 <968ae3fd-0482-24f2-b24d-459152ff226d@redhat.com>
In-Reply-To: <968ae3fd-0482-24f2-b24d-459152ff226d@redhat.com>
Date: Thu, 25 Jul 2019 08:55:35 +0300
Message-ID: <000601d542ad$947a5c00$bd6f1400$@ru>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 12.0
Content-Language: ru
Thread-Index: AdVCLP0flv9tSH0URxecFvzpJ/zAzwAgDUzQ
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 83.149.199.45
Subject: Re: [Qemu-devel] [PATCH for-4.2 14/14] icount: clean up cpu_can_io
 before jumping to the next block
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, pavel.dovgaluk@ispras.ru,
 quintela@redhat.com, ciro.santilli@gmail.com, jasowang@redhat.com,
 crosthwaite.peter@gmail.com, armbru@redhat.com, mreitz@redhat.com,
 alex.bennee@linaro.org, maria.klimushenkova@ispras.ru, mst@redhat.com,
 kraxel@redhat.com, boost.lists@gmail.com, thomas.dullien@googlemail.com,
 artem.k.pisarenko@gmail.com, dgilbert@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Paolo Bonzini [mailto:pbonzini@redhat.com]
> On 24/07/19 10:44, Pavel Dovgalyuk wrote:
> > From: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
> >
> > Most of IO instructions can be executed only at the end of the block in
> > icount mode. Therefore translator can set cpu_can_io flag when translating
> > the last instruction.
> > But when the blocks are chained, then this flag is not reset and may
> > remain set at the beginning of the next block.
> > This patch resets the flag before "chaining" the translation blocks.
> >
> > Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
> > ---
> >  accel/tcg/tcg-runtime.c |    2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/accel/tcg/tcg-runtime.c b/accel/tcg/tcg-runtime.c
> > index 8a1e408e31..fe6b83d0fc 100644
> > --- a/accel/tcg/tcg-runtime.c
> > +++ b/accel/tcg/tcg-runtime.c
> > @@ -151,6 +151,8 @@ void *HELPER(lookup_tb_ptr)(CPUArchState *env)
> >      target_ulong cs_base, pc;
> >      uint32_t flags;
> >
> > +    /* We are going to jump to the next block. can_do_io should be reset */
> > +    cpu->can_do_io = !use_icount;
> >      tb = tb_lookup__cpu_state(cpu, &pc, &cs_base, &flags, curr_cflags());
> >      if (tb == NULL) {
> >          return tcg_ctx->code_gen_epilogue;
> >
> 
> This only fixes indirect jumps though.
> 
> I think you do not need this patch if you remove the assignment in
> cpu_tb_exec, and compile a "move 0 to cpu->can_do_io" in gen_tb_start
> instead.

"move 0 to cpu->can_do_io" only for icount mode?
And we'll also need to set can_do_io to 1 somewhere, because it
is checked in non-icount mode too.

Pavel Dovgalyuk


