Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A06753510BF
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:19:50 +0200 (CEST)
Received: from localhost ([::1]:55556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRsYP-00069P-JX
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lRsTN-0000wx-NY
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:14:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lRsTK-0008Qu-JA
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:14:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617264873;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9HCo3EVttw54/+ofQrNs1s0gYoj0ueFZ5VZ5MMWpDvM=;
 b=D7QykBr2YuS4MdQqCAdvwqwGSoXDjJn6yEftpAJY5IN2caguCLThVFOiamYZQu0AtvNjsg
 pHspnij9xcg9SM2d7egopFrWuBW0vd4JFOZx3a9m9BkOqimI9X7vt0S1BLMy8TJvz99ibP
 E72d4plNZ2iRi+c3o5hwsrBxo1vCosY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-t_0JPwqJO4ymuMFy4833ZA-1; Thu, 01 Apr 2021 04:14:29 -0400
X-MC-Unique: t_0JPwqJO4ymuMFy4833ZA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB5D6801814;
 Thu,  1 Apr 2021 08:14:28 +0000 (UTC)
Received: from redhat.com (ovpn-114-106.ams2.redhat.com [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B76265F705;
 Thu,  1 Apr 2021 08:14:26 +0000 (UTC)
Date: Thu, 1 Apr 2021 09:14:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Brad Smith <brad@comstyle.com>
Subject: Re: [PATCH] migration: Remove time_t cast for OpenBSD
Message-ID: <YGWA4MSRe9JUmGqC@redhat.com>
References: <YDNdAiOkEYOfmbhT@humpty.home.comstyle.com>
 <7eaad721-9d2a-83ed-00fc-80c8ee37e156@redhat.com>
 <26c9c34a-3872-c044-4b01-06d2eb4bfbb1@vivier.eu>
 <YEphaTV6uzhDEY7R@work-vm> <YEpj8MsBzqfRDTWo@redhat.com>
 <70bda12d-17fc-5e41-b723-e1409017a599@comstyle.com>
 <31adf621-ab77-3ac3-5995-501ac87426b3@comstyle.com>
MIME-Version: 1.0
In-Reply-To: <31adf621-ab77-3ac3-5995-501ac87426b3@comstyle.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 31, 2021 at 03:26:16PM -0400, Brad Smith wrote:
> On 3/13/2021 6:33 PM, Brad Smith wrote:
> > On 3/11/2021 1:39 PM, Daniel P. Berrangé wrote:
> > > On Thu, Mar 11, 2021 at 06:28:57PM +0000, Dr. David Alan Gilbert wrote:
> > > > * Laurent Vivier (laurent@vivier.eu) wrote:
> > > > > Le 08/03/2021 à 12:46, Thomas Huth a écrit :
> > > > > > On 22/02/2021 08.28, Brad Smith wrote:
> > > > > > > OpenBSD has supported 64-bit time_t across all archs
> > > > > > > since 5.5 released in 2014.
> > > > > > > 
> > > > > > > Remove a time_t cast that is no longer necessary.
> > > > > > > 
> > > > > > > 
> > > > > > > Signed-off-by: Brad Smith <brad@comstyle.com>
> > > > > > > 
> > > > > > > diff --git a/migration/savevm.c b/migration/savevm.c
> > > > > > > index 52e2d72e4b..9557f85ba9 100644
> > > > > > > --- a/migration/savevm.c
> > > > > > > +++ b/migration/savevm.c
> > > > > > > @@ -2849,8 +2849,7 @@ bool save_snapshot(const char
> > > > > > > *name, bool overwrite, const char *vmstate,
> > > > > > >       if (name) {
> > > > > > >           pstrcpy(sn->name, sizeof(sn->name), name);
> > > > > > >       } else {
> > > > > > > -        /* cast below needed for OpenBSD where
> > > > > > > tv_sec is still 'long' */
> > > > > > > -        localtime_r((const time_t *)&tv.tv_sec, &tm);
> > > > > > > +        localtime_r(&tv.tv_sec, &tm);
> > > > > > >           strftime(sn->name, sizeof(sn->name),
> > > > > > > "vm-%Y%m%d%H%M%S", &tm);
> > > > > > >       }
> > > > > but the qemu_timeval from "include/sysemu/os-win32.h" still
> > > > > uses a long: is this file compiled for
> > > > > win32?
> > > > Yep this fails for me when built with x86_64-w64-mingw32- (it's fine
> > > > with i686-w64-mingw32- )
> > > We could just switch the code to use GDateTime from GLib and thus
> > > avoid portability issues. I think this should be equivalent:
> > > 
> > >       g_autoptr(GDateTime) now = g_date_time_new_now_local();
> > >       g_autofree char *nowstr = g_date_time_format(now,
> > > "vm-%Y%m%d%H%M%s");
> > >       strncpy(sn->name, sizeof(sn->name), nowstr);
> > 
> > Which way do you guys want to go? Something like above, remove the
> > comment
> > or some variation on the comment but not mentioning OpenBSD since it is
> > no
> > longer relevant?
> 
> Anyone?

Personally I always favour using GLib APIs if there's an applicable one,
since it eliminates portability problems - or rather offloads them to
the GLib maintainers, who have already solved them generally.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


