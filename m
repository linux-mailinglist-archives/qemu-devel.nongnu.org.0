Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC313573BFC
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 19:28:23 +0200 (CEST)
Received: from localhost ([::1]:54968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBg9u-0003yj-9T
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 13:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oBg8V-0002QS-GL
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 13:26:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oBg8S-0005T8-MU
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 13:26:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657733211;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=TQ+R/VbEgQcfTnUmukKmu808CkpVigXW1HFVZ7jq8Jk=;
 b=AgBqjQOfQjytogNPA59qnSzJmbVeSfBB71I3CNI2YO07uiP80KdgzDnHGoeT18AtOTR5go
 jP1GpLSDsa3JAeU7m5rNDu8oBbLwU7tqB1kJvajCcZiYTIxqWCEY/SeXVOT0/DIrOZtU9q
 kQBgbIwkwp3rTvUPoiKhtVTvcaiWZw4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-KzxTjsSqOia6yYwm45LnZA-1; Wed, 13 Jul 2022 13:26:50 -0400
X-MC-Unique: KzxTjsSqOia6yYwm45LnZA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22DEB185A7B2
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 17:26:50 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC226C15D67;
 Wed, 13 Jul 2022 17:26:48 +0000 (UTC)
Date: Wed, 13 Jul 2022 18:26:46 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v6 12/13] qemu-sockets: update socket_uri() to be
 consistent with socket_parse()
Message-ID: <Ys8AVraNKGE11T8A@redhat.com>
References: <20220706062847.1396719-1-lvivier@redhat.com>
 <20220706064607.1397659-1-lvivier@redhat.com>
 <Ys1jck60PfCJPtXQ@work-vm>
 <cf99a3cf-90a5-6890-a9ec-68506de0ad38@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cf99a3cf-90a5-6890-a9ec-68506de0ad38@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Wed, Jul 13, 2022 at 06:46:17PM +0200, Laurent Vivier wrote:
> On 12/07/2022 14:05, Dr. David Alan Gilbert wrote:
> > * Laurent Vivier (lvivier@redhat.com) wrote:
> > > Remove 'tcp:' prefix for inet type (because inet can be 'tcp' or 'udp'
> > > and socket_parse() doesn't recognize it), the format is 'host:port'.
> > 
> > I don't think I understand why tests/qtest/migration-test.c
> > test_precopy_common is happy with this; it does:
> > 
> >      if (!args->connect_uri) {
> >          g_autofree char *local_connect_uri =
> >              migrate_get_socket_address(to, "socket-address");
> >          migrate_qmp(from, local_connect_uri, "{}");
> > 
> > which hmm, is the code you're changing what was in SocketAddress_to_str
> > which is what migrate_get_socket_address uses; but then the migrate_qmp
> > I don't think will take a migrate uri without the tcp: on the front.
> 
> It's a good point.
> 
> I think socket_parse() should accept the 'tcp:' prefix, and thus
> socket_uri() should generate it, so it will be usable with the qmp migrate
> command.
> 
> I'm going to add 'tcp:' case in socket_parse() and make socket_uri() to generate it.

I'd say any code in util/qemu-sockets.c should only work in terms of
generic concepts. If we're formattting/parsing a migration URI, the
helper APIs should live in the migration/ subdir.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


