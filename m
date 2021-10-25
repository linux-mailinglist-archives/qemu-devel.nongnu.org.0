Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E73E439947
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 16:51:20 +0200 (CEST)
Received: from localhost ([::1]:49140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf1Jn-0000YX-Nt
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 10:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mf19x-0008Ph-VP
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:41:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mf19t-0001R5-C8
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:41:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635172860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dwLF9AncyhJwDFuNzN1qp2XMX3boyI3z7McI3l6sgeM=;
 b=NP0E3bR95a+6tY6P+StbTLp8oQ+v+TQ09uKDPMEWYFb1IY2/Dcj/L+tVQymkVcJGwaYqCt
 BVlMyui5A51oIZ2oLCpFrGJybAaDOzMqaD1dlS3o7uLkbdkndtWvOrMze7oSA+/Z6j+myx
 He2FdJTgnRywZSeTxM0pp6M6epKe5pg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-VOqPY5rtOtesg9_Q3FfbNQ-1; Mon, 25 Oct 2021 10:40:59 -0400
X-MC-Unique: VOqPY5rtOtesg9_Q3FfbNQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 x13-20020a05640226cd00b003dd4720703bso4165996edd.8
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 07:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dwLF9AncyhJwDFuNzN1qp2XMX3boyI3z7McI3l6sgeM=;
 b=G4KECsDc1GLdhQZEgC19+4MxsfW0uODFIabltjFSWSSXPyM5L8CUENIIclMd7D8NLG
 q4x2AVFBTHIs/Vi/RBCFvV0/xvuGwaTLlfSaP70EEituOgt04vL61WVe9oSY6ElkNgrt
 9aGjafX6swLuV06REBe4eQqrbjU1XvMOcCusBEoWg6g2kDu9rc0TMC1CGf4gBQfi98g1
 znC8ziRzP+p1u1qJ1ACBNsi6ymfQDWv7rFo6Cm5Sfk9JxOXZvCehHCKKlJHx1r1F+EHd
 tFE+dIOdesNlkJI9yzrZb6fYW4DslK4s/hQIoMoYDHTI10le5He4rV/+ubqMJt4oDh0X
 jxiQ==
X-Gm-Message-State: AOAM531W+YbemdCJ9+GWVsIYj+u4IpNo8qOw4C1G4ohQKMC8EyZOGH+E
 uzD3iXnuajZb261/gBCQ9f8CupKN3XPeFUX0WRWEuMXCohe9kusNxHICJ///gLPpGYMdC/x5/9g
 JLNPDdzc7mUn4tHE=
X-Received: by 2002:a17:906:3990:: with SMTP id
 h16mr22256391eje.47.1635172858254; 
 Mon, 25 Oct 2021 07:40:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9xL2xVECw4/beSk00zRiLp08xVEissjxerlC9AhCKoLewfA4pO0rK8TzUwntvj772Bl7JmQ==
X-Received: by 2002:a17:906:3990:: with SMTP id
 h16mr22256366eje.47.1635172858050; 
 Mon, 25 Oct 2021 07:40:58 -0700 (PDT)
Received: from steredhat (host-79-30-88-77.retail.telecomitalia.it.
 [79.30.88.77])
 by smtp.gmail.com with ESMTPSA id hd17sm1570440ejc.92.2021.10.25.07.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 07:40:57 -0700 (PDT)
Date: Mon, 25 Oct 2021 16:40:55 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 1/3] file-posix: add `aio-max-batch` option
Message-ID: <20211025144055.3a7y4rhp2dz7ptmb@steredhat>
References: <20210923143100.182979-1-sgarzare@redhat.com>
 <20210923143100.182979-2-sgarzare@redhat.com>
 <YXGE0e/08DZXO1pj@stefanha-x1.localdomain>
 <20211025102006.hc6vjbqze3u7mqpr@steredhat>
 <YXa5ZesOSr/gd6v3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YXa5ZesOSr/gd6v3@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 25, 2021 at 04:04:21PM +0200, Kevin Wolf wrote:
>Am 25.10.2021 um 12:20 hat Stefano Garzarella geschrieben:
>> On Thu, Oct 21, 2021 at 04:18:41PM +0100, Stefan Hajnoczi wrote:
>> > On Thu, Sep 23, 2021 at 04:30:58PM +0200, Stefano Garzarella wrote:
>> > > Commit d7ddd0a161 ("linux-aio: limit the batch size using
>> > > `aio-max-batch` parameter") added a way to limit the batch size
>> > > of Linux AIO backend for the entire AIO context.
>> > >
>> > > The same AIO context can be shared by multiple devices, so
>> > > latency-sensitive devices may want to limit the batch size even
>> > > more to avoid increasing latency.
>> > >
>> > > For this reason we add the `aio-max-batch` option to the file
>> > > backend, which will be used by the next commits to limit the size of
>> > > batches including requests generated by this device.
>> > >
>> > > Suggested-by: Kevin Wolf <kwolf@redhat.com>
>> > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> > > ---
>> > >  qapi/block-core.json | 5 +++++
>> > >  block/file-posix.c   | 9 +++++++++
>> > >  2 files changed, 14 insertions(+)
>> > >
>> > > diff --git a/qapi/block-core.json b/qapi/block-core.json
>> > > index c8ce1d9d5d..1a8ed325bc 100644
>> > > --- a/qapi/block-core.json
>> > > +++ b/qapi/block-core.json
>> > > @@ -2851,6 +2851,10 @@
>> > >  #              for this device (default: none, forward the commands via SG_IO;
>> > >  #              since 2.11)
>> > >  # @aio: AIO backend (default: threads) (since: 2.8)
>> > > +# @aio-max-batch: maximum number of requests in an AIO backend batch that
>> > > +#                 contains request from this block device. 0 means that the
>> >
>> > The first sentence is a little unclear. I guess s/request/requests/ but
>> > that still doesn't doesn't fully explain how this works.
>> >
>> > Does the AIO backend use the minimum aio-max-batch value of all its
>> > blockdevs?
>>
>> It's a little simpler to avoid having to recalculate the minimum for each
>> attach/release of blockdevs.
>>
>> When the blockdev does submit or unplug, the queue is flushed if the number
>> of requests in the batch is greater or equal then the smallest aio-max-batch
>> value of the blockdev and the AIO context.
>>
>> >
>> > Maybe:
>> >
>> >  maximum number of requests to batch together into a single submission
>> >  in the AIO backend. If multiple BlockdevOptionsFile sharing an AIO
>> >  backend have different values the smallest value is chosen. ...
>>
>> Whath about this:
>>
>>   maximum number of requests to batch together into a single submission
>>   in the AIO backend. The smallest value between this and AIO context's
>> aio-max-batch value is chosen. ...
>
>I like this, except that AioContexts are an implementation detail. I
>think we should refer to the iothread object instead, which is the user
>visible interface to AioContexts.

Yep, definitely better:

   maximum number of requests to batch together into a single submission
   in the AIO backend. The smallest value between this and the
   aio-max-batch value of the IOThread object is chosen. ...


Thanks,
Stefano


