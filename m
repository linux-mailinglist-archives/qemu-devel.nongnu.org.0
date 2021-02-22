Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF10321A8B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:50:55 +0100 (CET)
Received: from localhost ([::1]:60854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lECY2-0004pt-TK
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:50:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lECUt-0002vJ-Un
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:47:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lECUq-0006fR-Rw
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:47:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614005255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KDB8RW+9ybnr/1S5BXvxjoPvCUPzsMd5yZFcY6xLmOY=;
 b=XJ7cKVihcEiW4raKXER5sx3xkLdvwMbsqpEjtsxwc6p/Mk1jErF3xB+BfrIdvMTyQMSjI3
 X6OsTRRhv/v9Xh4p5lWAS9cjwd9sSdOE4TJEnYT+nlB+9EhTflLBi5/eB/1jiDEhkpS8Sc
 HUoo7k/aTZeqUTBWTTvI/P4pP6mV6OY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-uNRZnhjhPVWd6pD3Xfa9hQ-1; Mon, 22 Feb 2021 09:47:33 -0500
X-MC-Unique: uNRZnhjhPVWd6pD3Xfa9hQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAA44107ACF3;
 Mon, 22 Feb 2021 14:47:31 +0000 (UTC)
Received: from horse.redhat.com (ovpn-115-91.rdu2.redhat.com [10.10.115.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12C695C290;
 Mon, 22 Feb 2021 14:47:25 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 8489422054F; Mon, 22 Feb 2021 09:47:24 -0500 (EST)
Date: Mon, 22 Feb 2021 09:47:24 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [PATCH v2 0/3] virtiofsd: Add options to enable/disable posix acl
Message-ID: <20210222144724.GC13715@redhat.com>
References: <20210217233046.81418-1-vgoyal@redhat.com> <87pn0wgtsx.fsf@suse.de>
 <20210219143403.GA3270@redhat.com>
 <CAJfpeguanq6PEf7jd9Ur_JO7aJ0eoojs65LXb6ukhoGGb_Ccdw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJfpeguanq6PEf7jd9Ur_JO7aJ0eoojs65LXb6ukhoGGb_Ccdw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: virtio-fs-list <virtio-fs@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Luis Henriques <lhenriques@suse.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 19, 2021 at 04:55:06PM +0100, Miklos Szeredi wrote:
> On Fri, Feb 19, 2021 at 3:34 PM Vivek Goyal <vgoyal@redhat.com> wrote:
> >
> > On Fri, Feb 19, 2021 at 11:50:54AM +0000, Luis Henriques wrote:
> > > Vivek Goyal <vgoyal@redhat.com> writes:
> > >
> > > > Hi,
> > > >
> > > > This is V2 of the patches. Changes since v1 are.
> > > >
> > > > - Rebased on top of latest master.
> > > > - Took care of Miklos's comments to block acl xattrs if user
> > > >   explicitly disabled posix acl.
> > > >
> > > > Luis Henriques reported that fstest generic/099 fails with virtiofs.
> > > > Little debugging showed that we don't enable acl support. So this
> > > > patch series provides option to enable/disable posix acl support. By
> > > > default it is disabled.
> > > >
> > > > I have run blogbench and pjdfstests with posix acl enabled and
> > > > things work fine.
> > > >
> > > > Luis, can you please apply these patches, and run virtiofsd with
> > > > "-o posix_acl" and see if it fixes the failure you are seeing. I
> > > > ran the steps you provided manually and it fixes the issue for
> > > > me.
> > >
> > > Sorry for the delay.  I've finally tested these patches and they indeed
> > > fix the problem I reported.  My only question about this fix is why is
> > > this option not enabled by default, since this is the documented behavior
> > > in acl(5) and umask(2)?  In fact, why is this an option at all?
> >
> > You mean why to not enable acl by default?
> >
> > I am concerned about performance drop this can lead to because extra
> > GETXATTR(system.posix_acl_*) messages which will trigger if acls are enabled.
> > And not all users might require these. That's why I preferred to not enable
> > acl by default. Those who need it can enable it explicitly.
> >
> > Another example is xattr support. Due to performance concerns, we don't
> > enable xattrs by default either.
> 
> Actually generic xattr is much worse, since there's no caching for
> them currently, as opposed to posix acls, which are cached both when
> positive and negative.
> 
> If we enable ACL by default in case xattrs are enabled, we should be
> safe, I think.

Hi Miklos,

Ok, this sounds reasonable.  I am running some quick tests and if I don't
notice any serious performance regression, I will respin my patch.

> Having an option to disable acls still makes sense,
> but it's an optional plus.

Agreed. If there are no serious negative performance issues with enabling
ACL, then an option to disable is an optional plus.

May be I will drop this for now and add this when somebody needs an
option to disable ACL.

Thanks
Vivek


