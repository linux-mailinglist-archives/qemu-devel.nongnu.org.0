Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E2D5AE8CE
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 14:52:56 +0200 (CEST)
Received: from localhost ([::1]:60848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVY4V-00050G-DK
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 08:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVWpv-0005hc-Bv
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 07:33:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVWpq-0002Za-1M
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 07:33:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662464017;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oGzmIO4dgchnWJlA99IamP+Vc7/FdKeJ8jGfHl24q/A=;
 b=NeNLzwwBfGQaWbnPpnG5JfR2dHrs3Vzalfx0gYo/nBZEB6smdDZsz8enzw0m1NOrS5cjHU
 zZDhAgbN5AX3Q45Z3GXyawSPIfH+VO+aj47l/QRuFqI/a/zyXQP15b/gOv49DRrqefQU9F
 5zarUznCKuuxXeguWe/qyDmef3uHfY4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-y-XaiNTXPRK8GlMjpCtG_A-1; Tue, 06 Sep 2022 07:33:34 -0400
X-MC-Unique: y-XaiNTXPRK8GlMjpCtG_A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E62C806007;
 Tue,  6 Sep 2022 11:33:33 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC5964C816;
 Tue,  6 Sep 2022 11:33:31 +0000 (UTC)
Date: Tue, 6 Sep 2022 12:33:29 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 1/2] x86: only modify setup_data if the boot protocol
 indicates safety
Message-ID: <YxcwCQ0vymro0vbu@redhat.com>
References: <20220906103657.282785-1-Jason@zx2c4.com>
 <20220906063954-mutt-send-email-mst@kernel.org>
 <CAHmME9oyf5MmZ4gXkbm+dA3t1NBYB6XdPrk8N1OyKLi5Lke0Rg@mail.gmail.com>
 <20220906064500-mutt-send-email-mst@kernel.org>
 <CAMj1kXH3T48W=k42mrCbY15yc4KYvAfUaRaJJRrsfKbuOfE53A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMj1kXH3T48W=k42mrCbY15yc4KYvAfUaRaJJRrsfKbuOfE53A@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 06, 2022 at 01:14:50PM +0200, Ard Biesheuvel wrote:
> (cc Laszlo)
> 
> On Tue, 6 Sept 2022 at 12:45, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Sep 06, 2022 at 12:43:55PM +0200, Jason A. Donenfeld wrote:
> > > On Tue, Sep 6, 2022 at 12:40 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Tue, Sep 06, 2022 at 12:36:56PM +0200, Jason A. Donenfeld wrote:
> > > > > It's only safe to modify the setup_data pointer on newer kernels where
> > > > > the EFI stub loader will ignore it. So condition setting that offset on
> > > > > the newer boot protocol version. While we're at it, gate this on SEV too.
> > > > > This depends on the kernel commit linked below going upstream.
> > > > >
> > > > > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > > > Cc: Laurent Vivier <laurent@vivier.eu>
> > > > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > > > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > > > > Cc: Peter Maydell <peter.maydell@linaro.org>
> > > > > Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > > > > Cc: Richard Henderson <richard.henderson@linaro.org>
> > > > > Cc: Ard Biesheuvel <ardb@kernel.org>
> > > > > Link: https://lore.kernel.org/linux-efi/20220904165321.1140894-1-Jason@zx2c4.com/
> > > > > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > > >
> > > > BTW what does it have to do with SEV?
> > > > Is this because SEV is not going to trust the data to be random anyway?
> > >
> > > Daniel (now CC'd) pointed out in one of the previous threads that this
> > > breaks SEV, because the image hash changes.
> > >
> > > Jason
> >
> > Oh I see. I'd add a comment maybe and definitely mention this
> > in the commit log.
> >
> 
> This does raise the question (as I mentioned before) how things like
> secure boot and measured boot are affected when combined with direct
> kernel boot: AIUI, libvirt uses direct kernel boot at guest
> installation time, and modifying setup_data will corrupt the image
> signature.

IIUC, qemu already modifies setup_data when using direct kernel boot.

It put in logic to skip this if SEV is enabled, to avoid interfering
with SEV hashes over the kernel, but there's nothing doing this more
generally for non-SEV cases using UEFI. So potentially use of SecureBoot
may already be impacted when using direct kernel boot. I haven't formally
tested this myself though. I just saw that earlier versions of this
RNG patch broke SEV hashes and later versions addressed that problem
for SEV when the code was re-arranged.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


