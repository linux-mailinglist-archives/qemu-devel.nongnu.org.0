Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD6C565064
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:08:34 +0200 (CEST)
Received: from localhost ([::1]:55684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8I4G-00059Z-UF
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8I2Z-0004E5-U0
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:06:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8I2W-00017x-B0
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:06:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656925603;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=cz+q/HFFKDNVFL5MRIyx+eFeOnPBtdYySp3CTyCinL8=;
 b=c7P5trBx1xLIOgG/6YpNlfg/sd5gW7YFC4aDR2FfNKwcIAaFOegFXGJmWO7uzqsM+8DQM1
 H8UMAAolCu1Eudmgx38o+CLu6FPwlp5pW073pG0kucXhl9fLvCmCvYK9RmvsYf2zyg7rOT
 XRhxmHDiG1t4Dma86xiZ+Py/DIL7yH0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-Igcmkys5MKiO0yOw7GS8cw-1; Mon, 04 Jul 2022 05:06:39 -0400
X-MC-Unique: Igcmkys5MKiO0yOw7GS8cw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B6C52999B47
 for <qemu-devel@nongnu.org>; Mon,  4 Jul 2022 09:06:39 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A89418EB7;
 Mon,  4 Jul 2022 09:06:37 +0000 (UTC)
Date: Mon, 4 Jul 2022 10:06:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/3] Add zero-copy-copied migration stat
Message-ID: <YsKtm2O8+d5d0p/N@redhat.com>
References: <20220701155935.482503-1-leobras@redhat.com>
 <20220701155935.482503-3-leobras@redhat.com>
 <877d4tz9gx.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <877d4tz9gx.fsf@pond.sub.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, Jul 04, 2022 at 08:18:54AM +0200, Markus Armbruster wrote:
> Leonardo Bras <leobras@redhat.com> writes:
> 
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  qapi/migration.json   | 5 ++++-
> >  migration/migration.c | 1 +
> >  monitor/hmp-cmds.c    | 4 ++++
> >  3 files changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/qapi/migration.json b/qapi/migration.json
> > index 7102e474a6..925f009868 100644
> > --- a/qapi/migration.json
> > +++ b/qapi/migration.json
> > @@ -55,6 +55,9 @@
> >  # @postcopy-bytes: The number of bytes sent during the post-copy phase
> >  #                  (since 7.0).
> >  #
> > +# @zero-copy-copied: The number of zero-copy flushes that reported data sent
> > +#                    using zero-copy that ended up being copied. (since 7.2)
> 
> The description feels awkward.  What's a "zero-copy flush", and why
> should the user care?  I figure what users care about is the number of
> all-zero pages we had to "copy", i.e. send the bulky way.  Is this what
> @zero-copy-copied reports?

MigrationCapability field @zero-copy-send instructs QEMU to try to
avoid copying data between userspace and kernel space when transmitting
RAM region.

Even if the kernel supports zero copy, it is not guaranteed to happen,
it is merely a request to try.

QEMU periodically (once per migration iteration) flushes outstanding
zero-copy requests and gets an indication back of whether any copies
took place or not.

So this counter is a reflection of how many iterations resulted  in
zero-copy not being fully honoured.

IOW, ideally this counter will always be zero. If it is non-zero,
then the magnitude gives a very very very rough guide to what's
going on. If it is '1' then it was just a transient limitation.
If it matches the number of migration iterations, then it is a
more systemic limitation.

Incidentally, do we report the migration iteration count ? I
thought we did, but i'm not finding it now that I look.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


