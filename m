Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 460DC14091D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 12:38:05 +0100 (CET)
Received: from localhost ([::1]:55858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isPwy-0001Mh-DN
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 06:38:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36157)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1isPwD-0000y9-CC
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 06:37:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1isPw9-0002BO-QI
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 06:37:17 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42935
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1isPw9-0002Al-Mc
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 06:37:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579261033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mE/akJjvaA6md8087qCPjrhKItRun18fY6hENXI0ILM=;
 b=hEcHeG5jXqh7NleHJk/PWBCrr8TsYSQWoh7VtKh+qud/vW7HV4ISHMNOnU0/KYWwxTi2x1
 TbYCydEKwD6io0qd5HTW4nBzBbfBkGoPnTT0UZ9NK8CytA05IJtlu9mYajAeYLUWnZDdSW
 L0wK+d9PhlYBMv3HLEZYSB6wqEpKgs4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-tRzKtv47MlGWpQD0xxcL1Q-1; Fri, 17 Jan 2020 06:37:12 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA21F107ACC4;
 Fri, 17 Jan 2020 11:37:10 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D38D86CB7;
 Fri, 17 Jan 2020 11:37:07 +0000 (UTC)
Date: Fri, 17 Jan 2020 11:37:04 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Subject: Re: [PATCH 072/104] virtiofsd: passthrough_ll: fix refcounting on
 remove/rename
Message-ID: <20200117113704.GE3209@work-vm>
References: <20191212163904.159893-73-dgilbert@redhat.com>
 <20200116115603.5415-1-misono.tomohiro@jp.fujitsu.com>
 <20200116164511.GJ3108@work-vm>
 <CAOssrKfO1PZkR-Fonxae_b2oAOQMgx0=vU8A2UvCNKsgthKMbg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOssrKfO1PZkR-Fonxae_b2oAOQMgx0=vU8A2UvCNKsgthKMbg@mail.gmail.com>
User-Agent: Mutt/1.13.0 (2019-11-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: tRzKtv47MlGWpQD0xxcL1Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Vivek Goyal <vgoyal@redhat.com>,
 Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Miklos Szeredi (mszeredi@redhat.com) wrote:
> On Thu, Jan 16, 2020 at 5:45 PM Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Misono Tomohiro (misono.tomohiro@jp.fujitsu.com) wrote:
> > > > From: Miklos Szeredi <mszeredi@redhat.com>
> > > >
> > > > Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> > >
> > > I'm not familiar with qemu convention but shouldn't we put
> > > at least one line of description like linux kernel?
> >
> > Miklos: would you like to suggest a better commit message?
>=20
> Hmm, the patch doesn't really make sense, since the looked up inode is no=
t used.
>=20
> Not sure what happened here, this seems to be for supporting shared
> versions, and these changes are part of commit 06f78a397f00
> ("virtiofsd: add initial support for shared versions") in our gitlab
> qemu tree.  Was this intentionally split out?

I remember I did split the shared version support out when trying to
remove it into a separate patch; let me see if I can remove this
without breaking the merge around it.

Dave

> Thanks,
> Miklos
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


