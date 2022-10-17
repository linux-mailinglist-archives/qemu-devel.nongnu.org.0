Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48869601B30
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 23:21:29 +0200 (CEST)
Received: from localhost ([::1]:42682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okXY8-0000rX-Am
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 17:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1okXSf-0003N7-Vk
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 17:15:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1okXSa-00032L-JK
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 17:15:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666041343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZMuRt8AJLdXIU52WLHck9pN9PTLckPQg8rvxXmaQVhY=;
 b=SNXGw5bDtm8UWpzMGh9vzQEGSmvAwYVH472pH593LNST+98sZLnTgwqQppF9X5y0g79PuA
 w6AvJpx2ODx5jrieYlOXFCgIdmsQaTDtifcZmKwceiNFASugjvSR+YJBJs5fu8wUKux6Ct
 WqCFh2M6qS2eNz0It35pOG6sVdaDGkU=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-58-HVXb5LM6M9qoFddETJPltA-1; Mon, 17 Oct 2022 17:15:41 -0400
X-MC-Unique: HVXb5LM6M9qoFddETJPltA-1
Received: by mail-il1-f198.google.com with SMTP id
 i21-20020a056e021d1500b002f9e4f8eab7so10185033ila.7
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 14:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZMuRt8AJLdXIU52WLHck9pN9PTLckPQg8rvxXmaQVhY=;
 b=K1NdllouySgvlGPHG2WltopKfnVT+c/9lQkHe4D7dhAjrC4f/YFU6EtWoLTeFE56f8
 0gi171IsPiBXd6GKz2YnS13sO8h9tGQ43gDRuojabwi7YTa+Fg2MZsH+sAIcO+JJIgzO
 amYnCmxqVmBcOW35H4TeTshedTm2Su5zO9aGo7a60ntTw/Y9O0tJpFrNlLOsNnaE8DRO
 R/OBFvNbGU0ej18pp+UySSN+UUGhRLGx8ucunns205uKLIEsp0DjPmpASxfFXgIIKZWm
 aDuF3D+fZmtW9dlLwhLm/zsCyegjurpTVTqQniFXgKd6gXhy3dE9AbFBWQIFZEPHYl3L
 +78A==
X-Gm-Message-State: ACrzQf2QyjmTwBB8u/baLTNFj9/WcpsFe5sB5O3coHDVTQza4MnSaRr7
 Ve0jk+jPQdC6x2lO5UNFM3KQp3540Y5kc7ZBEnRnhNzJwzSorh9qk/E+8psOnN4WhhvdIpLs7Yk
 jJ388+8AgFRGCxjE=
X-Received: by 2002:a6b:c308:0:b0:6bc:8a23:c7aa with SMTP id
 t8-20020a6bc308000000b006bc8a23c7aamr5526147iof.0.1666041339469; 
 Mon, 17 Oct 2022 14:15:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4krRpZC0wV4gk0DkVeK4L3hsecKrOGOUk59/az1sIzXngRYAVfLiat1RJcWdH2wy9MK6si1g==
X-Received: by 2002:a6b:c308:0:b0:6bc:8a23:c7aa with SMTP id
 t8-20020a6bc308000000b006bc8a23c7aamr5526128iof.0.1666041339153; 
 Mon, 17 Oct 2022 14:15:39 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 e25-20020a026d59000000b00349c45fd3a8sm349891jaf.29.2022.10.17.14.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 14:15:38 -0700 (PDT)
Date: Mon, 17 Oct 2022 17:15:35 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Cc: "manish.mishra" <manish.mishra@nutanix.com>,
 qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: MultiFD and default channel out of order mapping on receive side.
Message-ID: <Y03F97gmi7N4cyMM@x1n>
References: <9f02255a-ceb9-9ca6-2606-b91c5e9e6459@nutanix.com>
 <Y0fJFcj9+wcnKYqd@redhat.com>
 <a4f67b8d-21ec-4261-6ffb-3162c854ce8f@nutanix.com>
 <Y00+tsrBs2m2CH6R@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y00+tsrBs2m2CH6R@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 17, 2022 at 12:38:30PM +0100, Daniel P. Berrangé wrote:
> On Mon, Oct 17, 2022 at 01:06:00PM +0530, manish.mishra wrote:
> > Hi Daniel,
> > 
> > I was thinking for some solutions for this so wanted to discuss that before going ahead. Also added Juan and Peter in loop.
> > 
> > 1. Earlier i was thinking, on destination side as of now for default
> > and multi-FD channel first data to be sent is MAGIC_NUMBER and VERSION
> > so may be we can decide mapping based on that. But then that does not
> > work for newly added post copy preempt channel as it does not send
> > any MAGIC number. Also even for multiFD just MAGIC number does not
> > tell which multifd channel number is it, even though as per my thinking
> > it does not matter. So MAGIC number should be good for indentifying
> > default vs multiFD channel?
> 
> Yep, you don't need to know more than the MAGIC value.
> 
> In migration_io_process_incoming, we need to use MSG_PEEK to look at
> the first 4 bytes pendingon the wire. If those bytes are 'QEVM' that's
> the primary channel, if those bytes are big endian 0x11223344, that's
> a multifd channel.  Using MSG_PEEK aviods need to modify thue later
> code that actually reads this data.
> 
> The challenge is how long to wait with the MSG_PEEK. If we do it
> in a blocking mode, its fine for main channel and multifd, but
> IIUC for the post-copy pre-empt channel we'd be waiting for
> something that will never arrive.
> 
> Having suggested MSG_PEEK though, this may well not work if the
> channel has TLS present. In fact it almost definitely won't work.
> 
> To cope with TLS migration_io_process_incoming would need to
> actually read the data off the wire, and later methods be
> taught to skip reading the magic.
> 
> > 2. For post-copy preempt may be we can initiate this channel only
> > after we have received a request from remote e.g. remote page fault.
> > This to me looks safest considering post-copy recorvery case too.
> > I can not think of any depedency on post copy preempt channel which
> > requires it to be initialised very early. May be Peter can confirm
> > this.
> 
> I guess that could work

Currently all preempt code still assumes when postcopy activated it's in
preempt mode.  IIUC such a change will bring an extra phase of postcopy
with no-preempt before preempt enabled.  We may need to teach qemu to
understand that if it's needed.

Meanwhile the initial page requests will not be able to benefit from the
new preempt channel too.

> 
> > 3. Another thing we can do is to have 2-way handshake on every
> > channel creation with some additional metadata, this to me looks
> > like cleanest approach and durable, i understand that can break
> > migration to/from old qemu, but then that can come as migration
> > capability?
> 
> The benefit of (1) is that the fix can be deployed for all existing
> QEMU releases by backporting it.  (3) will meanwhile need mgmt app
> updates to make it work, which is much more work to deploy.
> 
> We really shoulud have had a more formal handshake, and I've described
> ways to achieve this in the past, but it is quite alot of work.

I don't know whether (1) is a valid option if there are use cases that it
cannot cover (on either tls or preempt).  The handshake is definitely the
clean approach.

What's the outcome of such wrongly ordered connections?  Will migration
fail immediately and safely?

For multifd, I think it should fail immediately after the connection
established.

For preempt, I'd also expect the same thing because the only wrong order to
happen right now is having the preempt channel to be the migration channel,
then it should also fail immediately on the first qemu_get_byte().

Hopefully that's still not too bad - I mean, if we can fail constantly and
safely (never fail during postcopy), we can always retry and as long as
connections created successfully we can start the migration safely.  But
please correct me if it's not the case.

-- 
Peter Xu


