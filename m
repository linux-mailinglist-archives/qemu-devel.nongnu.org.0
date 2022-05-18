Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF5952BEE3
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 18:06:48 +0200 (CEST)
Received: from localhost ([::1]:38494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrMCE-0006x2-Tm
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 12:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nrM6L-0002Ns-5c
 for qemu-devel@nongnu.org; Wed, 18 May 2022 12:00:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nrM6H-0001m7-6M
 for qemu-devel@nongnu.org; Wed, 18 May 2022 12:00:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652889635;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=GxRPhBUgid1ujHhh407tsDGlMFUyPaX5T5gDCvj5YNY=;
 b=ROeMEbkRfM+RqqxgfbgIaSwNmDOXgeWoDJoNMrMtikyjB8XroUPtMnhV5W8fLKTnBquZIO
 L5la+d0jyxHmst4IIjGXX3EgHG4Qm8rvemSzpynPEzkuE8CYTXG2gGYbwqoNF3I+DSIt+t
 hMIOsx/dE8KwMCMtOndY9t0fY4+h7XE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-y4feToxqN6Obot05UCsNzw-1; Wed, 18 May 2022 12:00:31 -0400
X-MC-Unique: y4feToxqN6Obot05UCsNzw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8438F803D7B;
 Wed, 18 May 2022 16:00:30 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DE8AC27E8A;
 Wed, 18 May 2022 16:00:28 +0000 (UTC)
Date: Wed, 18 May 2022 17:00:26 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Juan Quintela <quintela@redhat.com>, Avihai Horon <avihaih@nvidia.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH 5/9] migration/qemu-file: Add qemu_file_get_to_fd()
Message-ID: <YoUYGhgILYFIwBvS@redhat.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-6-avihaih@nvidia.com>
 <87czgdsohs.fsf@secure.mitica>
 <970f0e4c-19bc-6528-2c4c-9cf7fbd5a789@nvidia.com>
 <87ee0rf43p.fsf@secure.mitica>
 <20220518154237.GK1343366@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220518154237.GK1343366@nvidia.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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

On Wed, May 18, 2022 at 12:42:37PM -0300, Jason Gunthorpe wrote:
> On Wed, May 18, 2022 at 01:54:34PM +0200, Juan Quintela wrote:
> 
> > >> Is there a really performance difference to just use:
> > >>
> > >> uint8_t buffer[size];
> > >>
> > >> qemu_get_buffer(f, buffer, size);
> > >> write(fd, buffer, size);
> > >>
> > >> Or telling it otherwise, what sizes are we talking here?
> > >
> > > It depends on the device, but It can range from a few MBs to several
> > > GBs AFAIK.
> > 
> > a few MB is ok.
> > 
> > Several GB on the main migration channel without a single
> > header/whatever?
> 
> IIRC it iterates in multi-megabyte chunks each which gets a header.
> 
> The chunking size is set by the size of the buffer mmap
> 
> The overall point is that memcpying GB's is going to be taxing so we
> want to eliminate copies on this path, especially copies that result
> in more system calls.
> 
> We are expecting to look into further optimization down the road here
> because even this is still too slow.

Considering the possibility of future optimization, IMHO adding this
kind of API at the QEMUFile level is too high. We'd be better pushing
the impl down into the QIOChannel API level.

   int64_t qio_channel_copy_range(QIOCHannel *srcioc,
                                  QIOChannel *tgtioc,
				  size_t len);

The QIOChannel impl can do pretty much what you showed in the general
case, but in special cases it could have the option to offload to the
kernel copy_range() syscall to avoid the context sitches.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


