Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A92D4565774
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:33:59 +0200 (CEST)
Received: from localhost ([::1]:36448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8MD8-0005wy-FK
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8LuK-0007is-9S
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:14:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8LuH-0001fW-7J
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:14:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656940468;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=11mBdQzlxfx2+tN/DknjA/nr28SMHUNP8Er3xaon0k8=;
 b=inQ5/QahSlOnHtTLrezEtiMjmdG1zC7wSk+YqYNVgxXVGu7YKeiU1X4VbNQZC0qmctqkTO
 cZZK92FPUlNMP8YwR/kBrfNyJjJtRoDG9HIf20nUoyzV+RB35Z3pzFZL3LPyaWYQzbnj4S
 nAnyJQ0KS3iqBiWH17KbD8lKHGKlxAY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-sVL-spRzONqEFT6I4kywEA-1; Mon, 04 Jul 2022 09:14:27 -0400
X-MC-Unique: sVL-spRzONqEFT6I4kywEA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1249A3806729
 for <qemu-devel@nongnu.org>; Mon,  4 Jul 2022 13:14:27 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A0BA492C3B;
 Mon,  4 Jul 2022 13:14:25 +0000 (UTC)
Date: Mon, 4 Jul 2022 14:14:22 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras <leobras@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/3] Add zero-copy-copied migration stat
Message-ID: <YsLnrgIGu5y88ZTu@redhat.com>
References: <20220701155935.482503-1-leobras@redhat.com>
 <20220701155935.482503-3-leobras@redhat.com>
 <877d4tz9gx.fsf@pond.sub.org> <YsKtm2O8+d5d0p/N@redhat.com>
 <YsLRmYjFpdGw0AjK@work-vm> <87k08tw0bq.fsf@pond.sub.org>
 <YsLaEWcn51z3m52e@redhat.com> <87czelvxrt.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87czelvxrt.fsf@pond.sub.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

On Mon, Jul 04, 2022 at 02:59:50PM +0200, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Mon, Jul 04, 2022 at 02:04:41PM +0200, Markus Armbruster wrote:
> 
> [...]
> 
> >> Please rephrase the documentation of @zero-copy-copied in terms of
> >> @dirty-sync-count.  Here's my attempt.
> >> 
> >> # @zero-copy-copied: Number of times dirty RAM synchronization could not
> >> #                    avoid copying zero pages.  This is between 0 and
> >> #                    @dirty-sync-count.  (since 7.1)
> >
> > Any one have preferences on the name - i get slight put off by the
> > repeated word in the property name here.
> >
> >    @zero-copy-rejects ?
> >    @zero-copy-misses ?
> >    @zero-copy-fails ?
> 
> I'd consider any of these an improvement.  Not a native speaker, but
> perhaps "failures" instead of "fails".
> 
> We could also express the connection to @dirty-sync-count right in the
> name, like @dirty-sync-rejected-zero-copy, @dirty-sync-missed-zero-copy,
> @dirty-sync-failed-zero-copy.  Or maybe -copies.

Yeah, @dirty-sync-missed-zero-copy   is probably my favourite.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


