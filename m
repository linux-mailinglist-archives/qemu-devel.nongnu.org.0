Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D02256554D
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 14:29:08 +0200 (CEST)
Received: from localhost ([::1]:37752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8LCN-0000NP-Dw
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 08:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8L0D-00039t-5R
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:16:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8L05-00081Q-RH
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:16:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656936985;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aOJCqS7UfWWzoRmXKF4POPT3Ix3gXK6plRtCN+7uK+0=;
 b=Cxw3mVgwAOcVIj8hghliBLMVitCT0brqTF32h01mHsag2guzcNeNV0dgBxrESMAZrC/jZh
 rpG/q7cgCS/WSfHRwRQBcy0bbXXZH1SdkX4Q867Qv9xPpLMdbiSKHKKhaCQfQj8bTHczd0
 SIGZ0aNPjanqXOvH5IYKR+D/1O/ihjE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-_ydnflfONJqXyqsuTFLrTg-1; Mon, 04 Jul 2022 08:16:23 -0400
X-MC-Unique: _ydnflfONJqXyqsuTFLrTg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77B32801E95
 for <qemu-devel@nongnu.org>; Mon,  4 Jul 2022 12:16:23 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7364A41617E;
 Mon,  4 Jul 2022 12:16:21 +0000 (UTC)
Date: Mon, 4 Jul 2022 13:16:17 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras <leobras@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/3] Add zero-copy-copied migration stat
Message-ID: <YsLaEWcn51z3m52e@redhat.com>
References: <20220701155935.482503-1-leobras@redhat.com>
 <20220701155935.482503-3-leobras@redhat.com>
 <877d4tz9gx.fsf@pond.sub.org> <YsKtm2O8+d5d0p/N@redhat.com>
 <YsLRmYjFpdGw0AjK@work-vm> <87k08tw0bq.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87k08tw0bq.fsf@pond.sub.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 04, 2022 at 02:04:41PM +0200, Markus Armbruster wrote:
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:
> 
> > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> >> On Mon, Jul 04, 2022 at 08:18:54AM +0200, Markus Armbruster wrote:
> >> > Leonardo Bras <leobras@redhat.com> writes:
> >> > 
> >> > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> >> > > ---
> >> > >  qapi/migration.json   | 5 ++++-
> >> > >  migration/migration.c | 1 +
> >> > >  monitor/hmp-cmds.c    | 4 ++++
> >> > >  3 files changed, 9 insertions(+), 1 deletion(-)
> >> > >
> >> > > diff --git a/qapi/migration.json b/qapi/migration.json
> >> > > index 7102e474a6..925f009868 100644
> >> > > --- a/qapi/migration.json
> >> > > +++ b/qapi/migration.json
> >> > > @@ -55,6 +55,9 @@
> >> > >  # @postcopy-bytes: The number of bytes sent during the post-copy phase
> >> > >  #                  (since 7.0).
> >> > >  #
> >> > > +# @zero-copy-copied: The number of zero-copy flushes that reported data sent
> >> > > +#                    using zero-copy that ended up being copied. (since 7.2)
> 
> since 7.1, unless you're planning for really tortuous review :)
> 
> >> > 
> >> > The description feels awkward.  What's a "zero-copy flush", and why
> >> > should the user care?  I figure what users care about is the number of
> >> > all-zero pages we had to "copy", i.e. send the bulky way.  Is this what
> >> > @zero-copy-copied reports?
> >> 
> >> MigrationCapability field @zero-copy-send instructs QEMU to try to
> >> avoid copying data between userspace and kernel space when transmitting
> >> RAM region.
> >> 
> >> Even if the kernel supports zero copy, it is not guaranteed to happen,
> >> it is merely a request to try.
> >> 
> >> QEMU periodically (once per migration iteration) flushes outstanding
> >> zero-copy requests and gets an indication back of whether any copies
> >> took place or not.
> >> 
> >> So this counter is a reflection of how many iterations resulted  in
> >> zero-copy not being fully honoured.
> >> 
> >> IOW, ideally this counter will always be zero. If it is non-zero,
> >> then the magnitude gives a very very very rough guide to what's
> >> going on. If it is '1' then it was just a transient limitation.
> >> If it matches the number of migration iterations, then it is a
> >> more systemic limitation.
> >> 
> >> Incidentally, do we report the migration iteration count ? I
> >> thought we did, but i'm not finding it now that I look.
> >
> > Yes we do; it's dirty-sync-count
> 
> Please rephrase the documentation of @zero-copy-copied in terms of
> @dirty-sync-count.  Here's my attempt.
> 
> # @zero-copy-copied: Number of times dirty RAM synchronization could not
> #                    avoid copying zero pages.  This is between 0 and
> #                    @dirty-sync-count.  (since 7.1)

Any one have preferences on the name - i get slight put off by the
repeated word in the property name here.

   @zero-copy-rejects ?
   @zero-copy-misses ?
   @zero-copy-fails ?



With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


