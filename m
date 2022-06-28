Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD29555F037
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 23:12:00 +0200 (CEST)
Received: from localhost ([::1]:42408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6IV5-0002qv-Cz
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 17:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1o6ITK-0001mF-Mp; Tue, 28 Jun 2022 17:10:11 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:45578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1o6ITE-0007uM-0O; Tue, 28 Jun 2022 17:10:10 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7EC7B61865;
 Tue, 28 Jun 2022 21:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59CB1C341C8;
 Tue, 28 Jun 2022 21:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656450595;
 bh=1QJk4e5j0/pz9uIpQ4JWK8nVogVrZMYPM6m/PAoDjys=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=nsBw1UXuvcxUmPH3tNOnNFdZmPyjltPcid9fynO3ewZauLE/h0Zh18vREFpG4Nqzu
 OURDTsKPHFaUrB6xAS/uDBdZlT6nup9UQFWqRhV7bVH6dvrG2vyOgconcovvPAiI8T
 YjNjQtMDgVUJPw8gTKybzJR8uJnlc6pUBGobQBf2CENvKROG01H7xvF7nKGdEiIvNp
 05spaUErlHtzYRv6eXBbkgHYR3MmWa6k64+oOwWq4PkEy/1+g6OHMldslx6Cd72eOE
 kxE6BeyIZl2aTxC9kXzoZny7+GOf5ELCBrK194czS1pUKo3lMpZGRQ7A/j3ZPYBo4U
 FdTV4tqNYeaEQ==
Date: Tue, 28 Jun 2022 14:09:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: B <shentey@gmail.com>
cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 xen-devel@lists.xenproject.org, qemu-trivial@nongnu.org, 
 Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 0/2] Decouple Xen-HVM from PIIX
In-Reply-To: <D8EF825B-45A2-4DE5-A787-8FE7BE88D2E6@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2206281408490.247593@ubuntu-linux-20-04-desktop>
References: <20220626094656.15673-1-shentey@gmail.com>
 <D8EF825B-45A2-4DE5-A787-8FE7BE88D2E6@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=sstabellini@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, 28 Jun 2022, B wrote:
> Am 26. Juni 2022 09:46:54 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
> >hw/i386/xen/xen-hvm.c contains logic which is PIIX-specific. This makes xen-hvm.c depend on PIIX which can be avoided if PIIX logic was isolated in PIIX itself.
> >
> >
> >
> >Bernhard Beschow (2):
> >
> >  hw/i386/xen/xen-hvm: Allow for stubbing xen_set_pci_link_route()
> >
> >  hw/i386/xen/xen-hvm: Inline xen_piix_pci_write_config_client() and
> >
> >    remove it
> >
> >
> >
> > hw/i386/xen/xen-hvm.c       | 17 ++---------------
> >
> > hw/isa/piix3.c              | 15 ++++++++++++++-
> >
> > include/hw/xen/xen.h        |  2 +-
> >
> > include/hw/xen/xen_common.h |  6 ------
> >
> > stubs/xen-hw-stub.c         |  3 ++-
> >
> > 5 files changed, 19 insertions(+), 24 deletions(-)
> >
> >
> >
> >-- >
> >2.36.1
> >
> >
> >
> 
> Hi Laurent,
> 
> would you like to queue this as well? Both patches have been reviewed at least once, piix twice. Or would you rather keep the review period open for longer?
 
Paul reviewed them both -- I don't think we need further reviews.
Laurent could just take them.

