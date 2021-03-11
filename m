Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B169D337CF4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 19:51:55 +0100 (CET)
Received: from localhost ([::1]:49210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKQPa-00046J-29
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 13:51:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKQE4-0001BR-DQ
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:40:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKQE1-0001N2-0s
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:40:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615487992;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SXD7FDZuH7yd+HdrJqhPw9lCkX7jE89S4EHtpPwKs70=;
 b=XvcbmcrcHqHPI6EjgEW1E/uxmunBYC/opCz3O8Z//p28kMxrIirDPqaR5jWdXy65ql5fPB
 OnZqoZJERiE2hkmChfFQ++h1yq6L5vMkXP7F3+yWAYvR8doyh6QAR3J8NEGz/w+W45bqga
 QmSNSmFzh/33d6lP3GP4bFtuzDnZpkg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-cwULZmZQPgi9Hc45pBUSBA-1; Thu, 11 Mar 2021 13:39:50 -0500
X-MC-Unique: cwULZmZQPgi9Hc45pBUSBA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85D9C1923762;
 Thu, 11 Mar 2021 18:39:49 +0000 (UTC)
Received: from redhat.com (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A660D5B4A0;
 Thu, 11 Mar 2021 18:39:47 +0000 (UTC)
Date: Thu, 11 Mar 2021 18:39:44 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] migration: Remove time_t cast for OpenBSD
Message-ID: <YEpj8MsBzqfRDTWo@redhat.com>
References: <YDNdAiOkEYOfmbhT@humpty.home.comstyle.com>
 <7eaad721-9d2a-83ed-00fc-80c8ee37e156@redhat.com>
 <26c9c34a-3872-c044-4b01-06d2eb4bfbb1@vivier.eu>
 <YEphaTV6uzhDEY7R@work-vm>
MIME-Version: 1.0
In-Reply-To: <YEphaTV6uzhDEY7R@work-vm>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
 Laurent Vivier <laurent@vivier.eu>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 11, 2021 at 06:28:57PM +0000, Dr. David Alan Gilbert wrote:
> * Laurent Vivier (laurent@vivier.eu) wrote:
> > Le 08/03/2021 à 12:46, Thomas Huth a écrit :
> > > On 22/02/2021 08.28, Brad Smith wrote:
> > >> OpenBSD has supported 64-bit time_t across all archs since 5.5 released in 2014.
> > >>
> > >> Remove a time_t cast that is no longer necessary.
> > >>
> > >>
> > >> Signed-off-by: Brad Smith <brad@comstyle.com>
> > >>
> > >> diff --git a/migration/savevm.c b/migration/savevm.c
> > >> index 52e2d72e4b..9557f85ba9 100644
> > >> --- a/migration/savevm.c
> > >> +++ b/migration/savevm.c
> > >> @@ -2849,8 +2849,7 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
> > >>       if (name) {
> > >>           pstrcpy(sn->name, sizeof(sn->name), name);
> > >>       } else {
> > >> -        /* cast below needed for OpenBSD where tv_sec is still 'long' */
> > >> -        localtime_r((const time_t *)&tv.tv_sec, &tm);
> > >> +        localtime_r(&tv.tv_sec, &tm);
> > >>           strftime(sn->name, sizeof(sn->name), "vm-%Y%m%d%H%M%S", &tm);
> > >>       }
> > > 
> > 
> > but the qemu_timeval from "include/sysemu/os-win32.h" still uses a long: is this file compiled for
> > win32?
> 
> Yep this fails for me when built with x86_64-w64-mingw32- (it's fine
> with i686-w64-mingw32- )

We could just switch the code to use GDateTime from GLib and thus
avoid portability issues. I think this should be equivalent:

     g_autoptr(GDateTime) now = g_date_time_new_now_local();
     g_autofree char *nowstr = g_date_time_format(now, "vm-%Y%m%d%H%M%s");
     strncpy(sn->name, sizeof(sn->name), nowstr);


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


