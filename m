Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 627C45EAD3B
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 18:53:10 +0200 (CEST)
Received: from localhost ([::1]:48288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocrLx-00073W-68
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 12:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=WzR3=Z5=zx2c4.com=Jason@kernel.org>)
 id 1ocqp0-0002wc-ER
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 12:19:08 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:45176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=WzR3=Z5=zx2c4.com=Jason@kernel.org>)
 id 1ocqoy-0004vM-5Y
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 12:19:06 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EA111B80B0D;
 Mon, 26 Sep 2022 16:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 536EEC433C1;
 Mon, 26 Sep 2022 16:19:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Wlr9bIQ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1664209138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oTRDkJshEHmGYk6p/i+g1olD7j4BO9oB+tZqPd4D9Ec=;
 b=Wlr9bIQ0Ykmun50Hzrh4fIGjfKL8GGXJQyD2Ve8MIJ4SNGZGjNPTTInAfue5gWZw6d6pEp
 9S2xqflgBTWJba1plDkqpf/dh+RY0T5jTD5oWCTUiW7iFtje+qsmOzx+OBafWPY4LNe8Bd
 W+MnaPqGf88xyHrEOCUJSSg9bUOlk9A=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ec94ab39
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 26 Sep 2022 16:18:58 +0000 (UTC)
Date: Mon, 26 Sep 2022 18:18:56 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] x86: re-initialize RNG seed when selecting kernel
Message-ID: <YzHQ8PnBS/FM3aEh@zx2c4.com>
References: <20220922152847.3670513-1-Jason@zx2c4.com>
 <CAHmME9oOSwx5hJBap-rbgxJrXZ7vfpPnzCymKfDt69RsNrBJyw@mail.gmail.com>
 <CABgObfbBMVnn29uwQETFUSCKQybzzHKRsL6EEq=-sK663dwxew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABgObfbBMVnn29uwQETFUSCKQybzzHKRsL6EEq=-sK663dwxew@mail.gmail.com>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=WzR3=Z5=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Paolo,

On Mon, Sep 26, 2022 at 06:07:43PM +0200, Paolo Bonzini wrote:
> On Mon, Sep 26, 2022 at 3:45 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > On Thu, Sep 22, 2022 at 5:28 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > > We don't want it to be possible to re-read the RNG seed after ingesting
> > > it, because this ruins forward secrecy. Currently, however, the setup
> > > data section can just be re-read. Since the kernel is always read after
> > > the setup data, use the selection of the kernel as a trigger to
> > > re-initialize the RNG seed, just like we do on reboot, to preserve
> > > forward secrecy.
> > >
> > > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > > ---
> > > Paolo- this applies on top of the 4 you merged this morning. -Jason
> >
> > Just bumping this, in hopes that this can go out with the same PULL
> > for the other 4 you merged last week.
> 
> Thanks, queued but I have a question.

Thank you. Also hope to see pc-bios/qboot.rom rebuilt based on that new
submodule commit. QEMU uses the prebuilt in its tree, rather than
rebuilding from the submodule. (I sent a patch earlier rebuilding
qboot.rom in the tree, but you should probably do this yourself because
it's pretty darn hard to verify binary diffs like that on the mailing
list.)

> If I understand correctly, this protects against rereading the seed while the
> OS is running. If so, does that mean that the device tree-based seed
> initialization does not have forward secrecy at all?

On both x86 and dtb-based archs, the seed in memory is zeroed out by the
kernel after reading. So, as far as the guest is concerned, there's
forward secrecy. Except! Except if the guest has someway of
re-requesting that seed from the host. This patch prevents that from
happening through fw_cfg on x86. Somebody told me last week that device
tree archs don't use fw_cfg, so this won't be a problem there. I haven't
yet looked to verify that yet, though, or looked if there are other
mechanisms.

Jason

