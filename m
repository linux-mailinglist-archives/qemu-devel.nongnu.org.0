Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DE969F4EC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 13:55:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUoe9-0002I7-1f; Wed, 22 Feb 2023 07:54:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUoe7-0002Hu-6k
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 07:54:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUoe5-0003yR-A4
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 07:54:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677070492;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=11vzhwmPMm3b2hFRVtsgiXULEaPrZ6Jw66eG3CeTYps=;
 b=T/4Jg1OIjR/d4NJ/ZOzj2ReoYHAYBZjnm3YVLbR2KObYGhSSMPNEZrQgmDhRDhD6y0qedh
 sg7p1lhhf5TTzFcd+4bPnYsw7ro5zPn7iu0B8nl6KpTuzu/oTW/L9tJcvRCvCgFI3J492+
 SkPaB+T7XMJWq25ToAuHrjrjYqucwis=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-2S3YMT1lMiC0P2zgcnKEpQ-1; Wed, 22 Feb 2023 07:54:50 -0500
X-MC-Unique: 2S3YMT1lMiC0P2zgcnKEpQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85764802C18;
 Wed, 22 Feb 2023 12:54:50 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 328941121314;
 Wed, 22 Feb 2023 12:54:49 +0000 (UTC)
Date: Wed, 22 Feb 2023 12:54:46 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, hreitz@redhat.com, aesteve@redhat.com,
 nsoffer@redhat.com, vsementsov@yandex-team.ru
Subject: Re: Reference-counting and finalizers that can fail are uneasy
 partners (was: [PATCH 0/4] qemu-img: Fix exit code for errors closing the
 image)
Message-ID: <Y/YQlq3NXVMkCyzP@redhat.com>
References: <20230112191454.169353-1-kwolf@redhat.com>
 <874jsu51sj.fsf@pond.sub.org> <Y8FAkAC3L7oF5q48@redhat.com>
 <87cz6b9ivm.fsf@pond.sub.org> <87ttzdoqca.fsf_-_@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87ttzdoqca.fsf_-_@pond.sub.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 22, 2023 at 01:08:05PM +0100, Markus Armbruster wrote:
> A half-baked thought has been sloshing around in my head.  Perhaps I can
> bake it some more by writing it up.
> 
> Reference-counting and finalizers that can fail are uneasy partners.
> 
> When managing lifetimes manually, you control where finalization
> happens.  When finalization can fail, you're as empowered as you could
> be to make it fail in a place where you can handle the failure sensibly.
> 
> Manual resource management is tedious and error prone, and that's a
> serious problem.  Garbage collection takes it off your hands.  Good.
> But now finalization happens at some future time, and in garbage
> collection context.  Fine when finalization's side effects are
> sufficiently harmless.  But what if finalization can fail?  We trade one
> serious problem (manual resource management) for another one (handling
> finalization failures).
> 
> Reference counting is slightly different.  Here, finalization can only
> happen at unref, which means you retain more control than with garbage
> collection.  However, we do need unrefs in places where we can't
> sensibly handle failure.  For instance, when code operates on an object
> whose reference count can be dropped concurrently, we need to guard with
> a ref/unref bracket to keep the object alive while the code is messing
> with it.
> 
> The only way out I can see is to systematically avoid finalizers that
> can fail, by extracting the part that can fail into a shutdown method,
> to be called in a suitable context, and before finalization.

Yes, I concur with pretty much everything you say above.

Since finalizers can occur in any context the logic that runs in
them needs to be quite clearly defined and free of side effects
or unpredictable failure scenarios.

I would probably go further and say that finalizers need to be
able to execute in finite time, so that callers do not have
execution of their thread blocked arbitrarily if they happen to
be one the one that releases the last reference.

Finalizers should be releasing resources that are already in
a "safe" state. Releasing memory, decrementing references,
unregistering callbacks, are typical safe things.

Performing I/O is a clearly a bad idea / inappropriate for
a finalizer by this standard.

Garbage collection vs reference counts is tangential to this
problem, as you say, they'll both share the same problem we're
facing.

> Yes, this takes us back to manual resource management, only we manage
> shutdown instead of death.
> 
> Finalizing something that has not been shut down would be a programming
> error.  A recoverable one, I guess; we can have finalize attempt to shut
> down then, and if it fails, just weep into the logs and move on.

This is approximately what I did with QIOChannel.  There is a
qio_channel_close() method that is best practice to invoke to
release resources assoociated with the channel, possibly flushing
pending I/O, and reporting failures via an Error **errp.

If this is not called, however, the finalizer will call close
on your behalf, discarding errors. It'll probably be OK much of
the time, and if we find it isn't, then the missing explicit
close call needs to be addressed.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


