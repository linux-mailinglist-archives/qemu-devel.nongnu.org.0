Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B30FE23BDE8
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Aug 2020 18:17:13 +0200 (CEST)
Received: from localhost ([::1]:54150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2zcm-0003Ok-E4
	for lists+qemu-devel@lfdr.de; Tue, 04 Aug 2020 12:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1k2zal-0001ps-CI
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 12:15:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33035
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1k2zai-0006ow-EF
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 12:15:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596557702;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=hmGfLtaylIexV9EvIeQXsVF0B8rZQCaFPLhongqJi64=;
 b=IMRZHK3QLD4dUWeybN3VtSiwU4fVh9Yq0S+m1jREYmHRiIbLoyla7LCRDTP3uKfsphgcJC
 omIcouMZPAKX5Lf9960Kukkx99Gzu/JhymPuRNPfNEcm6/CGaClRPqdz6Mdp29BSBz21xe
 gp8x46znnEgZGtxtB4j0NiSmnnDHYW4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-Jzu56AO_NNCygZumQh5HCg-1; Tue, 04 Aug 2020 12:14:57 -0400
X-MC-Unique: Jzu56AO_NNCygZumQh5HCg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45D481800D42;
 Tue,  4 Aug 2020 16:14:56 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC4E919D7E;
 Tue,  4 Aug 2020 16:14:54 +0000 (UTC)
Date: Tue, 4 Aug 2020 17:14:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v6 06/12] monitor: Make current monitor a per-coroutine
 property
Message-ID: <20200804161440.GL4020825@redhat.com>
References: <20200528153742.274164-1-kwolf@redhat.com>
 <20200528153742.274164-7-kwolf@redhat.com>
 <87tuxia5a9.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87tuxia5a9.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.14.5 (2020-06-23)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/04 01:28:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, marcandre.lureau@gmail.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 04, 2020 at 03:50:54PM +0200, Markus Armbruster wrote:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > This way, a monitor command handler will still be able to access the
> > current monitor, but when it yields, all other code code will correctly
> > get NULL from monitor_cur().
> >
> > Outside of coroutine context, qemu_coroutine_self() returns the leader
> > coroutine of the current thread.
> 
> Unsaid: you use it as a hash table key to map from coroutine to monitor,
> and for that you need it to return a value unique to the coroutine in
> coroutine context, and a value unique to the thread outside coroutine
> context.  Which qemu_coroutine_self() does.  Correct?
> 
> The hash table works, but I hate it just as much as I hate
> pthread_getspecific() / pthread_setspecific().
> 
> What we have here is a need for coroutine-local data.  Feels like a
> perfectly natural concept to me.
> 
> Are we going to create another hash table whenever we need another piece
> of coroutine-local data?  Or shall we reuse the hash table, suitably
> renamed and moved to another file?
> 
> Why not simply associate an opaque pointer with each coroutine?  All it
> takes is one more member of struct Coroutine.  Whatever creates the
> coroutine decides what to use it for.  The monitor coroutine would use
> it to point to the monitor.

Possible benefit of having the coroutine-local data stored in the
coroutine stack is that we can probably make it lock-less. Using
the hash table in monitor.c results in a serialization of across
all coroutines & threads.

Also, by providing a GDestroyNotify against the coroutine-local
data we can easily guarantee cleanup with the coroutine is freed.

Since we'll have a limited number of data items, we could make do
with a simple array in the coroutine struct, instead of a hashtable.
eg

  enum CoroutineLocalKeys {
     CO_LOCAL_CUR_MONITOR = 0,

     CO_LOCAL_LAST,
  };

  struct Coroutine {
    ...
    gpointer localData[CO_LOCAL_LAST];
    GDestroyNotify localDataFree[CO_LOCAL_LAST];
  };


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


