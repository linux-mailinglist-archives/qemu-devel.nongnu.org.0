Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C23923DF89
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 19:49:03 +0200 (CEST)
Received: from localhost ([::1]:48790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3k0k-00049X-En
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 13:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1k3jzo-0003Pe-Lz
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 13:48:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1k3jzm-0004Hl-Qs
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 13:48:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596736081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IRlvRQA1jw3tsQrF8GF4+UFoYZHnRT7UnmSWij+2etU=;
 b=GAqOWpuuCQVVTAC2s7yug6dC/PglQriMdsOzS8WI6BzmkUeNoEWvLbMAMM5xXMhPk63hID
 ja1M1coEyLsqSs5Wdj6oJ5nZXuEUIHm4jERE5cL50m9vi8D5ehsesfv0r5UFBZ5CI0B40i
 3QtblPjUrMhu17TbRAPk+s+Sx3KZMm0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-M2QXrRMRN4KgZ4JCqdEXSw-1; Thu, 06 Aug 2020 13:46:49 -0400
X-MC-Unique: M2QXrRMRN4KgZ4JCqdEXSw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECC641800D42;
 Thu,  6 Aug 2020 17:46:48 +0000 (UTC)
Received: from horse.redhat.com (ovpn-112-23.rdu2.redhat.com [10.10.112.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D24C15DA6B;
 Thu,  6 Aug 2020 17:46:45 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 64910220441; Thu,  6 Aug 2020 13:46:45 -0400 (EDT)
Date: Thu, 6 Aug 2020 13:46:45 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: Disable remote posix locks by
 default
Message-ID: <20200806174645.GG367847@redhat.com>
References: <20200727161841.GA54539@redhat.com>
 <OSBPR01MB4582AB9CD2DB32A48A8BB13FE5480@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <20200806174129.GK2711@work-vm>
MIME-Version: 1.0
In-Reply-To: <20200806174129.GK2711@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 13:48:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>,
 virtio-fs-list <virtio-fs@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 06, 2020 at 06:41:29PM +0100, Dr. David Alan Gilbert wrote:
> * misono.tomohiro@fujitsu.com (misono.tomohiro@fujitsu.com) wrote:
> > > Right now we enable remote posix locks by default. That means when guest does a posix lock it sends request to server
> > > (virtiofsd). But currently we only support non-blocking posix lock and return -EOPNOTSUPP for blocking version.
> > > 
> > > This means that existing applications which are doing blocking posix locks get -EOPNOTSUPP and fail. To avoid this,
> > > people have been running virtiosd with option "-o no_posix_lock". For new users it is still a surprise and trial and error
> > > takes them to this option.
> > > 
> > > Given posix lock implementation is not complete in virtiofsd, disable it by default. This means that posix locks will work
> > > with-in applications in a guest but not across guests. Anyway we don't support sharing filesystem among different guests
> > > yet in virtiofs so this should not lead to any kind of surprise or regression and will make life little easier for virtiofs users.
> > > 
> > > Reported-by: Aa Aa <jimbothom@yandex.com>
> > > Suggested-by: Miklos Szeredi <mszeredi@redhat.com>
> > > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > > ---
> > >  tools/virtiofsd/passthrough_ll.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > We should update docs/tools/virtiofsd.rst as well. Given that:
> >  Reviewed-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
> 
> Fixed up the doc.

Aha.. Looks like we were looking at this at the same time.

Thanks for taking care of this Dave.

Vivek


