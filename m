Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F09F4CA84E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 15:37:24 +0100 (CET)
Received: from localhost ([::1]:47364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPQ6U-00029F-Nx
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 09:37:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=fxzG=TN=zx2c4.com=Jason@kernel.org>)
 id 1nPQ57-0001LD-L1
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 09:35:57 -0500
Received: from [2604:1380:4641:c500::1] (port=41254 helo=dfw.source.kernel.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=fxzG=TN=zx2c4.com=Jason@kernel.org>)
 id 1nPQ55-0000mm-DL
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 09:35:57 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 15E8861562;
 Wed,  2 Mar 2022 14:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65885C340ED;
 Wed,  2 Mar 2022 14:35:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="TYEG0cFg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1646231746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XGuMnK4OOgPCMwUmyaWZFFbNaYrxtgoILBjeCR8rojk=;
 b=TYEG0cFgyV9/JXbncaM4Z4+kmqmWkOAaZHoc8I/mCAGlDB9vYaT74K6vhubYquTDWAr+qk
 v4va5LWGM9xSmKOFJQRJgMOXGQqwJBuBgQz3jKkYz4vmBqYRv7Uvd1SvjJO2p45ulW0WKc
 B12ugOBKyN0QfjbUkssv2iT7UBk9rnE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6f2e4d35
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 2 Mar 2022 14:35:45 +0000 (UTC)
Date: Wed, 2 Mar 2022 15:35:40 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, linux-hyperv@vger.kernel.org,
 linux-crypto@vger.kernel.org, graf@amazon.com,
 mikelley@microsoft.com, gregkh@linuxfoundation.org,
 adrian@parity.io, lersek@redhat.com, berrange@redhat.com,
 linux@dominikbrodowski.net, jannh@google.com, mst@redhat.com,
 rafael@kernel.org, len.brown@intel.com, pavel@ucw.cz,
 linux-pm@vger.kernel.org, colmmacc@amazon.com, tytso@mit.edu, arnd@arndb.de
Subject: Re: propagating vmgenid outward and upward
Message-ID: <Yh+AvDzzxGjt240m@zx2c4.com>
References: <Yh4+9+UpanJWAIyZ@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yh4+9+UpanJWAIyZ@zx2c4.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2604:1380:4641:c500::1
 (failed)
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=fxzG=TN=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hey again,

On Tue, Mar 01, 2022 at 04:42:47PM +0100, Jason A. Donenfeld wrote:
> For (B), it's a little bit trickier. But I think our options follow the
> same rubric. We can expose a generation counter in the vDSO, with
> semantics akin to the extern integer I described above. Or we could
> expose that counter in a file that userspace could poll() on and receive
> notifications that way. Or perhaps a third way. I'm all ears here.
> Alex's team from Amazon last year proposed something similar to the vDSO
> idea, except using mmap on a sysfs file, though from what I can tell,
> that wound up being kind of complicated. Due to the fact that we're
> _already_ racy, I think I'm most inclined at this point toward the
> poll() approach for the same reasons as I prefer a notifier_block. But
> on userspace I could be convinced otherwise, and I'd be interested in
> totally different ideas here too.

I implemented the poll() case here in 15 lines of code and found it
remarkably simple to do:

https://lore.kernel.org/lkml/20220302143331.654426-1-Jason@zx2c4.com/

This is just a PoC/RFC for the sake of having something tangible to look
at for this thread. It is notable to me, though, that implementing this
was so minimal.

Regards,
Jason

