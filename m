Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3805521192
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 11:58:12 +0200 (CEST)
Received: from localhost ([::1]:33436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noMd9-0000lL-RH
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 05:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noMXq-0006AS-R5
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:52:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noMXp-00052C-1j
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:52:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652176359;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=fObRxwLvkOZ9wL6ZeUqSZysvd6fkDAeqZ1vaSDNd1dc=;
 b=Zon1uuqEImHeEDnMs7Gv0OxxAQT9WDhzGvHTadg+U/SvHYAGNMAUiV81dd8vF9HCAsrWD4
 qbLHu/6KcrOwQL8U5aI3AlJsPcXnTHNR1VYQsb4qS6JKD4/n8Y42qUrH7qmD6bSy1LcRn/
 yZTPh7S5YSr7re5P3p/1wXvDODUomF0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-8H39xSZWMemfR-iI0gwNEg-1; Tue, 10 May 2022 05:52:38 -0400
X-MC-Unique: 8H39xSZWMemfR-iI0gwNEg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6471D101AA6A
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 09:52:38 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4341642D4D8;
 Tue, 10 May 2022 09:52:37 +0000 (UTC)
Date: Tue, 10 May 2022 10:52:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, Victor Toso <victortoso@redhat.com>,
 qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
Message-ID: <Yno14p8M2ABKQCcp@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <CABJz62PBHFqUyBNtwd_K6pra9_zOz9Ps56JOsNZL8XHf2u35Uw@mail.gmail.com>
 <87a6c52u68.fsf@pond.sub.org>
 <CABJz62NaEgEzEkvdYbNZ5qfkx_gAYfnxt_YbQhGyD08gRH6EYg@mail.gmail.com>
 <87v8uos8lb.fsf@pond.sub.org>
 <CABJz62MTVhDHZo5+sTJKm5b+SZM_W+_o5VmMgx0NVyibYfs=hw@mail.gmail.com>
 <875ymop374.fsf@pond.sub.org>
 <CABJz62OsaZo0hJB=ucereGDOHbK-5Ym4ASqhgVePJr65JRu0gQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABJz62OsaZo0hJB=ucereGDOHbK-5Ym4ASqhgVePJr65JRu0gQ@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, May 02, 2022 at 10:01:41AM -0400, Andrea Bolognani wrote:
> > Times how many naming conventions?
> 
> Yeah, I don't think requiring all possible permutations to be spelled
> out in the schema is the way to go. That's exactly why my proposal
> was to offer a way to inject the semantic information that the parser
> can't figure out itself.
> 
> Once you have a way to inform the generator that "VNCProps" is made
> of the two words "vnc" and "props", and that "vnc" is an acronym,
> then it can generate an identifier appropriate for the target
> language without having to spell out anywhere that such an identifier
> would be VNCProps for Go and VncProps for Rust.
> 
> By the way, while looking around I realized that we also have to take
> into account things like D-Bus: the QAPI type ChardevDBus, for
> example, would probably translate verbatim to Go but have to be
> changed to ChardevDbus for Rust. Fun :)

The hardest one of all is probably

   QAuthZListPolicy

which must be split  'QAuthZ'  + 'List' + 'Policy'  - the trailing
uppercase ruins all heuristics you can come up with, as there's no
viable way to distinguish that scenario from 'ChardevDBus' which
is 'Chardev' + 'DBus' not  'ChardevD' + 'Bus'

> Revised proposal for the annotation:
> 
>   ns:word-WORD-WoRD-123Word

Ugly, but we should only need this in the fairly niche scenarios,
so not too pain ful to add a handful of these:

Essentially if have the schema use CamelCase with UPPERCASE
acronyms, and declare two rules:

 1. Split on every boundary from lower to upper
 2. Acronym detection if there's a sequence of 3 uppercase
    letters, then split before the last uppercase.

then we'll do the right thing with the vast majority of cases:

  ChardevSocket:
     Rule 1: Chardev + Socket
     Rule 2: Chardev + Socket

  VNCProps:
     Rule 1: VNCProps
     Rule 2: VNC + Props

  ChardevDBus
     Rule 1: Chardev + DBus
     Rule 2: Chardev + DBus

and fail on 

  QAuthZListPolicy

     Rule 1: QAuth + ZList + Policy
     Rule 2: QAuth + ZList + Policy

so only the last case needs   ns:QAuthZ-List-Policy  annotation, whcih
doesn't feel like a big burden


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


