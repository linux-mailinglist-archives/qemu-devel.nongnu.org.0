Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B190830DF4F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:12:00 +0100 (CET)
Received: from localhost ([::1]:58026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Kl5-0003IX-PN
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:11:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l7KiP-0000Ar-Tv
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:09:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l7KiO-0007JL-EW
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:09:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612368551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BSWjXZOlp7SYMeXY09vVto6IdQU1IiCyhRl6esZjlS0=;
 b=KUddYKpSefExPUN5iG0XKZYxNwHGK7GpWaoXPZly0SIt7mWqpVscIIraQQuuumlKp8gUWd
 gCYKyC1tA/Hx8FElwp3M0ldo8aX/dY9SiVrwPJXkuP1GAqCQVPv1jHZ7vlsfYY1gtE7Hhk
 OaEzDW34GMpst2MvIIXjRGyEt6kCgcg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-mHhwMitwOi2t9dibE40Khg-1; Wed, 03 Feb 2021 11:09:10 -0500
X-MC-Unique: mHhwMitwOi2t9dibE40Khg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 007CA1015941;
 Wed,  3 Feb 2021 16:09:09 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-88.rdu2.redhat.com [10.10.116.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2440C6E406;
 Wed,  3 Feb 2021 16:08:59 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id B69FE22054F; Wed,  3 Feb 2021 11:08:58 -0500 (EST)
Date: Wed, 3 Feb 2021 11:08:58 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v4 3/3] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
Message-ID: <20210203160858.GC3307@redhat.com>
References: <20210203113719.83633-1-stefanha@redhat.com>
 <20210203113719.83633-4-stefanha@redhat.com>
 <20210203152850.GA3307@redhat.com>
 <20210203170237.0c98f95f@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20210203170237.0c98f95f@bahia.lan>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mszeredi@redhat.com, Daniel Berrange <berrange@redhat.com>, slp@redhat.com,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 virtio-fs@redhat.com, Alex Xu <alex@alxu.ca>,
 Stefan Hajnoczi <stefanha@redhat.com>, P J P <ppandit@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 03, 2021 at 05:02:37PM +0100, Greg Kurz wrote:
> On Wed, 3 Feb 2021 10:28:50 -0500
> Vivek Goyal <vgoyal@redhat.com> wrote:
> 
> > On Wed, Feb 03, 2021 at 11:37:19AM +0000, Stefan Hajnoczi wrote:
> > 
> > [..]
> > > @@ -1727,36 +1764,38 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
> > >  
> > >      update_open_flags(lo->writeback, lo->allow_direct_io, fi);
> > >  
> > > -    fd = openat(parent_inode->fd, name, (fi->flags | O_CREAT) & ~O_NOFOLLOW,
> > > -                mode);
> > > +    /* Try to create a new file but don't open existing files */
> > > +    fd = openat(parent_inode->fd, name, fi->flags | O_CREAT | O_EXCL, mode);
> > >      err = fd == -1 ? errno : 0;
> > > +
> > >      lo_restore_cred(&old);
> > >  
> > > -    if (!err) {
> > > -        ssize_t fh;
> > > -
> > > -        pthread_mutex_lock(&lo->mutex);
> > > -        fh = lo_add_fd_mapping(lo, fd);
> > > -        pthread_mutex_unlock(&lo->mutex);
> > > -        if (fh == -1) {
> > > -            close(fd);
> > > -            err = ENOMEM;
> > > -            goto out;
> > > -        }
> > > +    /* Ignore the error if file exists and O_EXCL was not given */
> > > +    if (err && !(err == EEXIST && !(fi->flags & O_EXCL))) {
> > 
> > Can this check be simplified to.
> >        if (err && (err == EEXIST && (fi->flags & O_EXCL)) {
> 
> I guess you meant :
> 
>         if (err && (err != EEXIST || fi->flags & O_EXCL) {

This sounds correct. I forgot to take into account that if error is
not -EEXIST, we still want to bail out irrespective of O_EXCL.

Vivek


