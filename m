Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8969545342B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 15:28:52 +0100 (CET)
Received: from localhost ([::1]:43862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmzS7-0008FW-NC
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 09:28:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mmzKh-0005Jz-Qh
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 09:21:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mmzKb-0003Gp-R9
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 09:21:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637072463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x7wjfvnS3z6S87UWZiDHbuGPMGteBwUNqKI7HtSbBIs=;
 b=MOhT/4PtCAC0jkacAN4g3G1vnI/8MVzjzPXdnEo4UoPKJqjAKL/SwIt8X8YaHDnGdIwMpc
 yFSUhxhSAEa1CvKx1OOmMgEMPA1NnSxdgbYay7pX49u+nVdVxrUuQFr8RmGRsFl8Ol9S3M
 YDQS8Z5P+TybU1AHtykekcxcfxzacBs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-95-t52TSfDrPsqLbgshc3qTfQ-1; Tue, 16 Nov 2021 09:21:00 -0500
X-MC-Unique: t52TSfDrPsqLbgshc3qTfQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5344804142;
 Tue, 16 Nov 2021 14:20:58 +0000 (UTC)
Received: from redhat.com (ovpn-114-146.phx2.redhat.com [10.3.114.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F0175DF56;
 Tue, 16 Nov 2021 14:20:42 +0000 (UTC)
Date: Tue, 16 Nov 2021 08:20:40 -0600
From: Eric Blake <eblake@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH for 6.2 v4] nbd/server: Add --selinux-label option
Message-ID: <20211116142040.u7yanlmliymwvx5v@redhat.com>
References: <20211115202944.615966-1-eblake@redhat.com>
 <9ea4ede4-f1aa-c430-9e94-cb2db9b1d372@redhat.com>
MIME-Version: 1.0
In-Reply-To: <9ea4ede4-f1aa-c430-9e94-cb2db9b1d372@redhat.com>
User-Agent: NeoMutt/20211029-16-b680fe
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, wainersm@redhat.com,
 rjones@redhat.com, willianr@redhat.com, pbonzini@redhat.com,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 16, 2021 at 08:06:03AM +0100, Thomas Huth wrote:
> On 15/11/2021 21.29, Eric Blake wrote:
> > From: "Richard W.M. Jones" <rjones@redhat.com>
> > 
> > Under SELinux, Unix domain sockets have two labels.  One is on the
> > disk and can be set with commands such as chcon(1).  There is a
> > different label stored in memory (called the process label).  This can
> > only be set by the process creating the socket.  When using SELinux +
> > SVirt and wanting qemu to be able to connect to a qemu-nbd instance,
> > you must set both labels correctly first.
> > 
> > For qemu-nbd the options to set the second label are awkward.  You can
> > create the socket in a wrapper program and then exec into qemu-nbd.
> > Or you could try something with LD_PRELOAD.
> > 
> > This commit adds the ability to set the label straightforwardly on the
> > command line, via the new --selinux-label flag.  (The name of the flag
> > is the same as the equivalent nbdkit option.)
> ...
> > @@ -3430,6 +3437,7 @@ summary_info += {'libdaxctl support': libdaxctl}
> >   summary_info += {'libudev':           libudev}
> >   # Dummy dependency, keep .found()
> >   summary_info += {'FUSE lseek':        fuse_lseek.found()}
> > +summary_info += {'selinux':           selinux.found()}
> 
> It's nicer if you do it like this (i.e. without the .found()):
> 
> summary_info += {'selinux':           selinux}
> 
> ... then meson prints out the version of the library, too.

Will tweak on the pull request.

> 
> Apart from that, patch looks fine to me:
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
>

Thanks. I'll send a pull request through my NBD tree soon.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


