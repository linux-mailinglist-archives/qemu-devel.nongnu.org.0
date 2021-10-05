Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E18A422F6D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:53:42 +0200 (CEST)
Received: from localhost ([::1]:40228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXodJ-0004Mb-8Z
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mXoF2-0002Qd-Na
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 13:28:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mXoEz-0007md-0R
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 13:28:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633454909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0pah1vYa+J7Q7Qdh0WNOxLsy7Ed1M9MlqjiO8WeUsLw=;
 b=ivcBJIRjAN2U5m+eU/MiXhUqyNHbZfPQC7d/eO/wiLO5ofD5dhEaJEfUdUz851mb4PPpJu
 Y4Sg+d9bYq1F0NfGWTvBQpT8mdqK++RDSFGGQTtsdREYk891jwZvOvLyTUhmdKgP3woc+r
 IJsq+r4pUsKdJFRUSSdCE/3ONnaXuks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-jsBUO3DHNQOTQ6aybYC9Nw-1; Tue, 05 Oct 2021 13:28:28 -0400
X-MC-Unique: jsBUO3DHNQOTQ6aybYC9Nw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C0B8802C87;
 Tue,  5 Oct 2021 17:28:27 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.9.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 133335F4E7;
 Tue,  5 Oct 2021 17:28:22 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id A28B6220BDB; Tue,  5 Oct 2021 13:28:21 -0400 (EDT)
Date: Tue, 5 Oct 2021 13:28:21 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Virtio-fs] [PATCH 13/13] virtiofsd, seccomp: Add
 clock_nanosleep() to allow list
Message-ID: <YVyLNQM8PXO8iDed@redhat.com>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-14-vgoyal@redhat.com>
 <YVxDouMEj3aqTNf3@stefanha-x1.localdomain>
 <YVxsQg+edz0kFmUl@redhat.com>
 <YVx0U8Wg7jahdoJD@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YVx0U8Wg7jahdoJD@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 04:50:43PM +0100, Stefan Hajnoczi wrote:
> On Tue, Oct 05, 2021 at 11:16:18AM -0400, Vivek Goyal wrote:
> > On Tue, Oct 05, 2021 at 01:22:58PM +0100, Stefan Hajnoczi wrote:
> > > On Thu, Sep 30, 2021 at 11:30:37AM -0400, Vivek Goyal wrote:
> > > > g_usleep() calls nanosleep() and that now seems to call clock_nanosleep()
> > > > syscall. Now these patches are making use of g_usleep(). So add
> > > > clock_nanosleep() to list of allowed syscalls.
> > > > 
> > > > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > > > ---
> > > >  tools/virtiofsd/passthrough_seccomp.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
> > > > index cd24b40b78..03080806c0 100644
> > > > --- a/tools/virtiofsd/passthrough_seccomp.c
> > > > +++ b/tools/virtiofsd/passthrough_seccomp.c
> > > > @@ -117,6 +117,7 @@ static const int syscall_allowlist[] = {
> > > >      SCMP_SYS(writev),
> > > >      SCMP_SYS(umask),
> > > >      SCMP_SYS(nanosleep),
> > > > +    SCMP_SYS(clock_nanosleep),
> > > 
> > > This patch can be dropped once sleep has been replaced by a condvar.
> > 
> > There is another sleep in do_pool_destroy() where we are waiting
> > for all current threads to exit.
> > 
> > do_pool_destroy() {
> >     g_usleep(10000);
> > }
> 
> That won't be necessary if there's a way to avoid the thread pool :).
> See my other reply about closing the OFD instead of using signals to
> cancel blocking fcntl(2).

Hi Stefan,

I responded to that email already. man fnctl does not say anything
about closing fd will unblock the waiter with -EINTR and I had a 
quick look at kernel code and did not find anything which suggested
closing fd will unblock current waiters.

So is this something you know works or you want me to try and see
if it works?

Thanks
Vivek


