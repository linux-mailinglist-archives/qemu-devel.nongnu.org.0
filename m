Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC22439820
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 16:07:40 +0200 (CEST)
Received: from localhost ([::1]:54578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf0dW-0002gI-4B
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 10:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mf0ao-00011e-BA
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:04:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mf0aj-00019Y-Mh
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:04:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635170685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HKEnONRlH5Xxq5bRpDjorOFunO5VxQTFUTYvYjDa3lE=;
 b=E5nGjkmVaEoTgJaH/8/XbZc3itUbwu7nqI50mJteHRKNkltC3gfpuoOcjbP4+Fykjm9gP4
 FwCONNoPwlxdnGUYec0DcVGyNNfMVChSTFxQsnSNdK/Z7NnPrcmM19ZeK9FHcMT05Jn8Nc
 kyf1YOQ1znG4RgTplI2Kob91BroUp4Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-3R5HvcSzN7yWFYbApJVRow-1; Mon, 25 Oct 2021 10:04:41 -0400
X-MC-Unique: 3R5HvcSzN7yWFYbApJVRow-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE4358066F5;
 Mon, 25 Oct 2021 14:04:40 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E0E36F920;
 Mon, 25 Oct 2021 14:04:23 +0000 (UTC)
Date: Mon, 25 Oct 2021 16:04:21 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH 1/3] file-posix: add `aio-max-batch` option
Message-ID: <YXa5ZesOSr/gd6v3@redhat.com>
References: <20210923143100.182979-1-sgarzare@redhat.com>
 <20210923143100.182979-2-sgarzare@redhat.com>
 <YXGE0e/08DZXO1pj@stefanha-x1.localdomain>
 <20211025102006.hc6vjbqze3u7mqpr@steredhat>
MIME-Version: 1.0
In-Reply-To: <20211025102006.hc6vjbqze3u7mqpr@steredhat>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.10.2021 um 12:20 hat Stefano Garzarella geschrieben:
> On Thu, Oct 21, 2021 at 04:18:41PM +0100, Stefan Hajnoczi wrote:
> > On Thu, Sep 23, 2021 at 04:30:58PM +0200, Stefano Garzarella wrote:
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
> > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > ---
> > >  qapi/block-core.json | 5 +++++
> > >  block/file-posix.c   | 9 +++++++++
> > >  2 files changed, 14 insertions(+)
> > > 
> > > diff --git a/qapi/block-core.json b/qapi/block-core.json
> > > index c8ce1d9d5d..1a8ed325bc 100644
> > > --- a/qapi/block-core.json
> > > +++ b/qapi/block-core.json
> > > @@ -2851,6 +2851,10 @@
> > >  #              for this device (default: none, forward the commands via SG_IO;
> > >  #              since 2.11)
> > >  # @aio: AIO backend (default: threads) (since: 2.8)
> > > +# @aio-max-batch: maximum number of requests in an AIO backend batch that
> > > +#                 contains request from this block device. 0 means that the
> > 
> > The first sentence is a little unclear. I guess s/request/requests/ but
> > that still doesn't doesn't fully explain how this works.
> > 
> > Does the AIO backend use the minimum aio-max-batch value of all its
> > blockdevs?
> 
> It's a little simpler to avoid having to recalculate the minimum for each
> attach/release of blockdevs.
> 
> When the blockdev does submit or unplug, the queue is flushed if the number
> of requests in the batch is greater or equal then the smallest aio-max-batch
> value of the blockdev and the AIO context.
> 
> > 
> > Maybe:
> > 
> >  maximum number of requests to batch together into a single submission
> >  in the AIO backend. If multiple BlockdevOptionsFile sharing an AIO
> >  backend have different values the smallest value is chosen. ...
> 
> Whath about this:
> 
>   maximum number of requests to batch together into a single submission
>   in the AIO backend. The smallest value between this and AIO context's
> aio-max-batch value is chosen. ...

I like this, except that AioContexts are an implementation detail. I
think we should refer to the iothread object instead, which is the user
visible interface to AioContexts.

Kevin


