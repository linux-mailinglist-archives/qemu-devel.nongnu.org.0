Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CFB43CA85
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 15:23:38 +0200 (CEST)
Received: from localhost ([::1]:32892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfiu1-0006eT-Fk
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 09:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mfidj-0007NE-TV
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:06:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mfidi-00047p-7q
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:06:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635340005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7QVjgT8jH7wzzuphRnM9x9BPuTqkQonNK5BRG9u6a9Q=;
 b=QhyVk6umnnqnpkFEgnsQVlHK9HAL5/1VisDaC/g9HkKnLEI0wB1gGdvv6dB5b+0wzHkFNa
 ASo1bucOHWRNQVaI0lJHjX7t4I1AHktkdR/Y61nj8nHcoeZ8UACArHCdKoy8klUGSy0HlY
 JvBsHjHDF0YXF7XfSm626bY4K6QehZE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-K2yovJLIO4KJ7CZJsVqX8w-1; Wed, 27 Oct 2021 09:06:42 -0400
X-MC-Unique: K2yovJLIO4KJ7CZJsVqX8w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B34810066F3;
 Wed, 27 Oct 2021 13:06:40 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D593562A41;
 Wed, 27 Oct 2021 13:06:38 +0000 (UTC)
Date: Wed, 27 Oct 2021 15:06:37 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v2 1/3] file-posix: add `aio-max-batch` option
Message-ID: <YXlO3c7/EC2DWk5R@redhat.com>
References: <20211026162346.253081-1-sgarzare@redhat.com>
 <20211026162346.253081-2-sgarzare@redhat.com>
 <87zgqvccqk.fsf@dusky.pond.sub.org>
 <20211027092304.43zhzjp5u6x66nbq@steredhat>
MIME-Version: 1.0
In-Reply-To: <20211027092304.43zhzjp5u6x66nbq@steredhat>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.10.2021 um 11:23 hat Stefano Garzarella geschrieben:
> On Wed, Oct 27, 2021 at 06:28:51AM +0200, Markus Armbruster wrote:
> > Stefano Garzarella <sgarzare@redhat.com> writes:
> > 
> > > Commit d7ddd0a161 ("linux-aio: limit the batch size using
> > > `aio-max-batch` parameter") added a way to limit the batch size
> > > of Linux AIO backend for the entire AIO context.
> > > 
> > > The same AIO context can be shared by multiple devices, so
> > > latency-sensitive devices may want to limit the batch size even
> > > more to avoid increasing latency.
> > > 
> > > For this reason we add the `aio-max-batch` option to the file
> > > backend, which will be used by the next commits to limit the size of
> > > batches including requests generated by this device.
> > > 
> > > Suggested-by: Kevin Wolf <kwolf@redhat.com>
> > > Reviewed-by: Kevin Wolf <kwolf@redhat.com>
> > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > ---
> > > 
> > > Notes:
> > >     v2:
> > >     - @aio-max-batch documentation rewrite [Stefan, Kevin]
> > > 
> > >  qapi/block-core.json | 7 +++++++
> > >  block/file-posix.c   | 9 +++++++++
> > >  2 files changed, 16 insertions(+)
> > > 
> > > diff --git a/qapi/block-core.json b/qapi/block-core.json
> > > index 6d3217abb6..fef76b0ea2 100644
> > > --- a/qapi/block-core.json
> > > +++ b/qapi/block-core.json
> > > @@ -2896,6 +2896,12 @@
> > >  #              for this device (default: none, forward the commands via SG_IO;
> > >  #              since 2.11)
> > >  # @aio: AIO backend (default: threads) (since: 2.8)
> > > +# @aio-max-batch: maximum number of requests to batch together into a single
> > > +#                 submission in the AIO backend. The smallest value between
> > > +#                 this and the aio-max-batch value of the IOThread object is
> > > +#                 chosen.
> > > +#                 0 means that the AIO backend will handle it automatically.
> > > +#                 (default: 0, since 6.2)
> > 
> > "(default 0) (since 6.2)" seems to be more common.
> 
> Indeed I wasn't sure, so I followed @drop-cache, the last one added in
> @BlockdevOptionsFile.

Actually, I think your style is more common, both globally and in
block-*:

    $ git grep -i '[,;] since' qapi/ | wc -l
    17
    $ git grep -i '[,;] since' qapi/block* | wc -l
    12

Compared to:

    $ git grep -i ') (since' qapi/ | wc -l
    14
    $ git grep -i ') (since' qapi/block* | wc -l
    7

Also a few instances with "(since: ...; default: ...)", but none in that
order with separate brackets.

So I'd rather merge this version if this is the only comment.

Kevin


