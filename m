Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3584A72FB
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 15:26:45 +0100 (CET)
Received: from localhost ([::1]:57490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFGap-000445-6g
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 09:26:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nFG5z-0006AU-3Z
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 08:54:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nFG5u-0007lu-Em
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 08:54:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643810040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HKff9peAG1mquT/7ZAPxAGA9XEIv5bxmi9MrKgg4be4=;
 b=Lf1swJJouGXDO/h0SF13DBNaqQ6XuN/nNCZW7SStzmpadiOPq/N0NjTmDpoJdFiZV1MWlc
 7Wftta7LTO8MAx4EbDlrEBe67tX/76LtN5rM1ZY+zDmK4ILfro5IN+yCmpvm5T3Kk1PTqG
 kJ8v8UjQuSg6NT6bxQo0Z8M9FDTL/6E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-ika0zZkDN2a2s4IN3Vs1_A-1; Wed, 02 Feb 2022 08:53:58 -0500
X-MC-Unique: ika0zZkDN2a2s4IN3Vs1_A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D2271091DA3;
 Wed,  2 Feb 2022 13:53:57 +0000 (UTC)
Received: from redhat.com (unknown [10.22.17.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F013F108BD45;
 Wed,  2 Feb 2022 13:53:55 +0000 (UTC)
Date: Wed, 2 Feb 2022 07:53:53 -0600
From: Eric Blake <eblake@redhat.com>
To: Fabian Ebner <f.ebner@proxmox.com>
Subject: Re: [PULL 18/20] block/nbd: drop connection_co
Message-ID: <20220202135353.dau24mip4zwib47z@redhat.com>
References: <20210927215545.3930309-1-eblake@redhat.com>
 <20210927215545.3930309-19-eblake@redhat.com>
 <8e8b69e4-a178-aff1-4de3-e697b942f3b3@proxmox.com>
MIME-Version: 1.0
In-Reply-To: <8e8b69e4-a178-aff1-4de3-e697b942f3b3@proxmox.com>
User-Agent: NeoMutt/20211029-256-77b59a
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 02, 2022 at 12:49:36PM +0100, Fabian Ebner wrote:
> Am 27.09.21 um 23:55 schrieb Eric Blake:
> > From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > 
> > OK, that's a big rewrite of the logic.
> > 
> > Pre-patch we have an always running coroutine - connection_co. It does
> > reply receiving and reconnecting. And it leads to a lot of difficult
> > and unobvious code around drained sections and context switch. We also
> > abuse bs->in_flight counter which is increased for connection_co and
> > temporary decreased in points where we want to allow drained section to
> > begin. One of these place is in another file: in nbd_read_eof() in
> > nbd/client.c.
> > 
> > We also cancel reconnect and requests waiting for reconnect on drained
> > begin which is not correct. And this patch fixes that.
> > 
> > Let's finally drop this always running coroutine and go another way:
> > do both reconnect and receiving in request coroutines.
> >
> 
> Hi,
> 
> while updating our stack to 6.2, one of our live-migration tests stopped
> working (backtrace is below) and bisecting led me to this patch.
> 
> The VM has a single qcow2 disk (converting to raw doesn't make a
> difference) and the issue only appears when using iothread (for both
> virtio-scsi-pci and virtio-block-pci).
> 
> Reverting 1af7737871fb3b66036f5e520acb0a98fc2605f7 (which lives on top)
> and 4ddb5d2fde6f22b2cf65f314107e890a7ca14fcf (the commit corresponding
> to this patch) in v6.2.0 makes the migration work again.
> 
> Backtrace:
> 
> Thread 1 (Thread 0x7f9d93458fc0 (LWP 56711) "kvm"):
> #0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
> #1  0x00007f9d9d6bc537 in __GI_abort () at abort.c:79
> #2  0x00007f9d9d6bc40f in __assert_fail_base (fmt=0x7f9d9d825128
> "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=0x5579153763f8
> "qemu_get_current_aio_context() == qemu_coroutine_get_aio_context(co)",
> file=0x5579153764f9 "../io/channel.c", line=483, function=<optimized
> out>) at assert.c:92

Given that this assertion is about which aio context is set, I wonder
if the conversation at
https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg00096.html is
relevant; if so, Vladimir may already be working on the patch.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


