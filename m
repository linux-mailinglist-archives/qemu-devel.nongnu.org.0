Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC8B2BAF2C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 16:43:52 +0100 (CET)
Received: from localhost ([::1]:43320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg8Zj-0005CD-Ol
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 10:43:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kg8YX-0004Sk-6S
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:42:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kg8YV-0001IY-Ia
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:42:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605886953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KGpt58nR+m8dRrR2ZL2kAqffa5GyhsnxMCIJdEWafw4=;
 b=NBNTz2UnrnLLkdIReavzs8jWHVokmhLY2+9uZo+v3hdaTrMVuAcZAUwKbJ/qJSKXymnhJP
 d4qGpZ13cdmkq3/eUAl4TOlEhrotkNPL1CJEdlESbuA6MTAJalj8pPP9WBByTXyeYxglg5
 DjOnq5jSvSMUpgny7XKau/LushYaIJ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-ae4gvJP-PsOIH7wgZVjOew-1; Fri, 20 Nov 2020 10:42:31 -0500
X-MC-Unique: ae4gvJP-PsOIH7wgZVjOew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A75CE81440F;
 Fri, 20 Nov 2020 15:42:30 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-21.ams2.redhat.com [10.36.115.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A30F60C05;
 Fri, 20 Nov 2020 15:42:29 +0000 (UTC)
Date: Fri, 20 Nov 2020 16:42:28 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Masayoshi Mizuma <msys.mizuma@gmail.com>
Subject: Re: [PATCH 1/2] file-posix: Use OFD lock only if the filesystem
 supports the lock
Message-ID: <20201120154228.GC5599@merkur.fritz.box>
References: <20201106040102.13892-1-msys.mizuma@gmail.com>
 <20201118154247.GB11988@merkur.fritz.box>
 <20201118191036.yk4rju2hk4vpkhfl@gabell>
 <20201118194837.b54rp2qpbvuelosx@gabell>
 <20201119104442.GB4530@merkur.fritz.box>
 <20201119235650.62vcbycc5fc4oxec@gabell>
MIME-Version: 1.0
In-Reply-To: <20201119235650.62vcbycc5fc4oxec@gabell>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 20.11.2020 um 00:56 hat Masayoshi Mizuma geschrieben:
> On Thu, Nov 19, 2020 at 11:44:42AM +0100, Kevin Wolf wrote:
> > Am 18.11.2020 um 20:48 hat Masayoshi Mizuma geschrieben:
> > > On Wed, Nov 18, 2020 at 02:10:36PM -0500, Masayoshi Mizuma wrote:
> > > > On Wed, Nov 18, 2020 at 04:42:47PM +0100, Kevin Wolf wrote:
> > > > > The logic looks fine to me, at least assuming that EINVAL is really what
> > > > > we will consistently get from the kernel if OFD locks are not supported.
> > > > > Is this documented anywhere? The fcntl manpage doesn't seem to mention
> > > > > this case.
> > > 
> > > The man page of fcntl(2) says:
> > > 
> > >        EINVAL The value specified in cmd is not recognized by this kernel.
> > > 
> > > So I think EINVAL is good enough to check whether the filesystem supports
> > > OFD locks or not...
> > 
> > A kernel not knowing the cmd at all is a somewhat different case (and
> > certainly a different code path) than a filesystem not supporting it.
> > 
> > I just had a look at the kernel code, and to me it seems that the
> > difference between POSIX locks and OFD locks is handled entirely in
> > filesystem independent code. A filesystem driver would in theory have
> > ways to distinguish both, but I don't see any driver in the kernel tree
> > that actually does this (and there is probably little reason for a
> > driver to do so).
> > 
> > So now I wonder what filesystem you are using? I'm curious what I
> > missed.
> 
> I'm using a proprietary filesystem, which isn't in the linux kernel.
> The filesystem supports posix lock only, doesn't support OFD lock...

Do you know why that proprietary filesystem driver makes a difference
between POSIX locks and OFD locks? The main difference between both
types is when they are released automatically, and this is handled by
generic kernel code and not the filesystem driver.

From a filesystem perspective, I don't see any reason to even
distuingish. So unless there are good reasons for making the
distinction, I'm currently inclined to view this as a filesystem
driver bug.

It makes handling this case hard because when the case isn't even
supposed to exist, of course there won't be a defined error code.

Kevin


