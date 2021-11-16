Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968B045380A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 17:47:56 +0100 (CET)
Received: from localhost ([::1]:58610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn1cg-0003QV-OU
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 11:47:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mn1VA-0001QM-Hh
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:40:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mn1V7-0006Be-4u
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:40:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637080804;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZhpZa6JoaloEfKzFZIlaq+BA2rXHPa4LXoVrktlu4NU=;
 b=LJ6BA9irue6+h2c+nTS/1uv+JFiK4IFDiLhKZEbop4FcLSRqqWIUv6xDR/7OduUwXadywN
 zlQTMGuzbdfQsWTVIrKsHqtbOmnla+SP0LJBL1RYoepyZXGhGk+hR04v0avUPnEG7/8JH/
 GKCS9Xe3DSgAC5QsozqiVKiU9YhYQIc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-ZuEdqQdmPY-zwA9zBbpPlQ-1; Tue, 16 Nov 2021 11:40:03 -0500
X-MC-Unique: ZuEdqQdmPY-zwA9zBbpPlQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48B0A101797A
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 16:40:02 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FAD260C13;
 Tue, 16 Nov 2021 16:39:55 +0000 (UTC)
Date: Tue, 16 Nov 2021 16:39:53 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v5 6/6] multifd: Implement zerocopy write in multifd
 migration (multifd-zerocopy)
Message-ID: <YZPe2Skxox5F6G0m@redhat.com>
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-7-leobras@redhat.com>
 <87pmr0ulqx.fsf@secure.mitica> <YZPZq5sC8F1x+TXE@redhat.com>
 <87czn0ukid.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <87czn0ukid.fsf@secure.mitica>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Leonardo Bras <leobras@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 16, 2021 at 05:34:50PM +0100, Juan Quintela wrote:
> Daniel P. Berrangé <berrange@redhat.com> wrote:
> 
> >> 
> >>     if (params->zerocopy &&
> >>         (params->parameters.multifd_compression != MULTIFD_COMPRESSION_NONE ||
> >>          migrate_use_tls())) {
> >>            error_setg(&err,
> >>                      "Zerocopy only available for non-compressed non-TLS multifd migration");
> >>         return false;
> >>     }
> >> 
> >> You have to do the equivalent of multifd_compression and tls enablement,
> >> to see that zerocopy is not enabled, of course.
> >> 
> >> I would prefer to check for QIO_CHANNEL_FEATUR_WRITE_ZEROCPY there, but
> >> I can't see a way of doing that without a qio.
> >
> > I don't think you need to check that feature flag.
> 
> Oh, I mean other thing.
> 
> When you set "zerocopy" capability, you don't know if the kernel support
> it.  My understanding is that the only way to check if it supported is
> here.

If you reqest it and it isn't supported you'll get an error back from
qio_channel_writev_zerocopy(). That's a bit too late though.

Ideally we should report an error straight after the migration code
creates the I/O channel, by querying for the feature.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


