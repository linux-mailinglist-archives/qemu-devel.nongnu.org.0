Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5693EFF66
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 10:41:04 +0200 (CEST)
Received: from localhost ([::1]:59890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGH8B-00067N-G0
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 04:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mGH6W-0004wJ-5g
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:39:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mGH6T-00026r-Pw
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629275956;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DegyRNp/URLsoZwr7RD3DXrKr4CCOJXz5usuQvongB0=;
 b=AequHLilLTIF+yiVNKJMucvie+fkGsl1viSBlo6xvJ1Jf9WedgX1EQQuNyGr2T6J1seM1v
 AWG2kT2qp12sRiadVa2+KwMj+BmwS8dxAsUFXLra7MOfxi15qtwaARJx4Pktj5Rnzk0DHm
 ryac4NQrJTprFe6zSiyx84WPv8Wf6vA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-FOw7qm9BMQe0PBEZckubhg-1; Wed, 18 Aug 2021 04:39:12 -0400
X-MC-Unique: FOw7qm9BMQe0PBEZckubhg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75FDC871827
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 08:39:11 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CE8A1ACBB;
 Wed, 18 Aug 2021 08:39:06 +0000 (UTC)
Date: Wed, 18 Aug 2021 09:39:03 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 2/2] monitor: Report EBADFD if fdset contains invalid FD
Message-ID: <YRzHJ3qpdNkHfBHi@redhat.com>
References: <cover.1629190206.git.mprivozn@redhat.com>
 <c0fa7920817020ae2744313ab631e7d76f4c1898.1629190206.git.mprivozn@redhat.com>
 <CAMxuvaxeHOrexy6sTBU=1PBBUThi60A2aJ7CWvE+DytR9q_Cuw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMxuvaxeHOrexy6sTBU=1PBBUThi60A2aJ7CWvE+DytR9q_Cuw@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Michal Privoznik <mprivozn@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 17, 2021 at 01:59:22PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Tue, Aug 17, 2021 at 12:56 PM Michal Privoznik <mprivozn@redhat.com>
> wrote:
> 
> > When opening a path that starts with "/dev/fdset/" the control
> > jumps into qemu_parse_fdset() and then into
> > monitor_fdset_dup_fd_add(). In here, corresponding fdset is found
> > and then all FDs from the set are iterated over trying to find an
> > FD that matches expected access mode. For instance, if caller
> > wants O_WRONLY then the FD set has to contain an O_WRONLY FD.
> >
> > If no such FD is found then errno is set to EACCES which results
> > in very misleading error messages, for instance:
> >
> >   Could not dup FD for /dev/fdset/3 flags 441: Permission denied
> >
> > There is no permission issue, the problem is that there was no FD
> > within given fdset that was in expected access mode. Therefore,
> > let's set errno to EBADFD, which gives us somewhat better
> > error messages:
> >
> >   Could not dup FD for /dev/fdset/3 flags 441: File descriptor in bad state
> >
> > Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> >
> 
> I am not sure this is any better. If you try to open a read-only file, the
> system also reports EACCES (Permission denied). This is what the current
> code models, I believe.

If we want better error reporting quality for this method we ought
to just stop using errno and wire up a Error **errp parameter.

> 
> 
> > ---
> >  monitor/misc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/monitor/misc.c b/monitor/misc.c
> > index ffe7966870..a0eda0d574 100644
> > --- a/monitor/misc.c
> > +++ b/monitor/misc.c
> > @@ -1347,7 +1347,7 @@ int monitor_fdset_dup_fd_add(int64_t fdset_id, int
> > flags)
> >          }
> >
> >          if (fd == -1) {
> > -            errno = EACCES;
> > +            errno = EBADFD;
> >              return -1;
> >          }
> >
> > --
> > 2.31.1
> >
> >

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


