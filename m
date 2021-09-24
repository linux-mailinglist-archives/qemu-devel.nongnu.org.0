Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C943E417BCA
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 21:26:28 +0200 (CEST)
Received: from localhost ([::1]:50058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTqq3-0001zB-4g
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 15:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTqn3-0008Jc-Ix
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 15:23:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTqn1-0000y2-Fj
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 15:23:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632511398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F9uaGAQ4ATVL0c1OkO4iI7W16Dsv5QRd0bRhqmjTlkU=;
 b=PhzkDXADEa+NKvfuO1/avR9+XuFvjqYqh7aG1ldMd2pPvApuC0iUP7n/phf61pSYpIFso+
 Q28Hf5RPDlBHmUmL81s3+a6lwx7GhufpbJhHqr+De793ONcSmIDg2HkyBfWi7wJf2eHZLx
 n2ljuEv1xuY3ISl1W131L9doa+Pmg0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-ZaV4R7tHM6KoYVpQs_BU2A-1; Fri, 24 Sep 2021 15:23:16 -0400
X-MC-Unique: ZaV4R7tHM6KoYVpQs_BU2A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD850A40C1;
 Fri, 24 Sep 2021 19:23:15 +0000 (UTC)
Received: from redhat.com (ovpn-115-8.phx2.redhat.com [10.3.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B4C55C1A3;
 Fri, 24 Sep 2021 19:23:15 +0000 (UTC)
Date: Fri, 24 Sep 2021 14:23:13 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2] nbd/server: Add --selinux-label option
Message-ID: <20210924192313.ulfa4wxjtliqdppd@redhat.com>
References: <20210723103303.1731437-1-rjones@redhat.com>
 <20210723103303.1731437-2-rjones@redhat.com>
 <YPrr72N494WKnJA5@redhat.com> <YPrwbgY9Q4e1ORP1@redhat.com>
 <20210825193504.d6ka3xzmpd54x2fq@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210825193504.d6ka3xzmpd54x2fq@redhat.com>
User-Agent: NeoMutt/20210205-773-8890a5
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping

On Wed, Aug 25, 2021 at 02:35:04PM -0500, Eric Blake wrote:
> On Fri, Jul 23, 2021 at 05:38:06PM +0100, Daniel P. Berrangé wrote:
> > On Fri, Jul 23, 2021 at 06:18:55PM +0200, Kevin Wolf wrote:
> > > Am 23.07.2021 um 12:33 hat Richard W.M. Jones geschrieben:
> > > > Under SELinux, Unix domain sockets have two labels.  One is on the
> > > > disk and can be set with commands such as chcon(1).  There is a
> > > > different label stored in memory (called the process label).  This can
> > > > only be set by the process creating the socket.  When using SELinux +
> > > > SVirt and wanting qemu to be able to connect to a qemu-nbd instance,
> > > > you must set both labels correctly first.
> > > > 
> > > > For qemu-nbd the options to set the second label are awkward.  You can
> > > > create the socket in a wrapper program and then exec into qemu-nbd.
> > > > Or you could try something with LD_PRELOAD.
> > > > 
> > > > This commit adds the ability to set the label straightforwardly on the
> > > > command line, via the new --selinux-label flag.  (The name of the flag
> > > > is the same as the equivalent nbdkit option.)
> > > > 
> > > > A worked example showing how to use the new option can be found in
> > > > this bug: https://bugzilla.redhat.com/show_bug.cgi?id=1984938
> > > > 
> > > > Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1984938
> > > > Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> > > 
> > > I suppose this would also be relevant for the built-in NBD server,
> > > especially in the context of qemu-storage-daemon?
> > 
> > It depends on the usage scenario really. nbdkit / qemu-nbd are
> > not commonly run under any SELinux policy, so then end up being
> > unconfined_t. A QEMU NBD client can't connect to an unconfined_t
> > socket, so we need to override it with this arg.
> > 
> > In the case of qemu system emulator, under libvirt, it will
> > already have a svirt_t type, so in that case there is no need
> > to override the type for the socket.
> > 
> > For qsd there's not really any strong practice established
> > but i expect most current usage is unconfined_t too and
> > would benefit from setting label.
> > 
> > > If so, is this something specific to NBD sockets, or would it actually
> > > make sense to have it as a generic option in UnixSocketAddress?
> > 
> > It is applicable to inet sockets too in fact.
> 
> So now that 6.2 is open, should I queue the patch as is, or wait for a
> v3 that makes the option more generic to all socket usage?
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


