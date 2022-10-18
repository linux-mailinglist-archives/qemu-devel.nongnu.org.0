Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 267D26034B1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 23:15:52 +0200 (CEST)
Received: from localhost ([::1]:39168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oktwE-0007zv-Ew
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 17:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1okthm-00088u-Uk
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 17:00:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1okthi-0003cx-8d
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 17:00:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666126847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m8gVzTEDrFdg9CcJA/+y7Vxy2FCjE7rW81kGSJ6GzjI=;
 b=WRi8egdYqmzbB77ouurUryIGb6LrnttUceUz+CoIS03uWjI6xquyOIWwfZ+mAhDIPD3fa2
 PWecBc0K4Ss0QoLkpWiQ5rqzlrdjw8jw+0jzTWJHNnD8jtIkcwk1k0rCnO5Az6bbfNMNNo
 HgHWN1YhuSqyDrxBH1DUxXEGghp/NdI=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-100-rb7tObo0MraTVA-Q5Cmy_g-1; Tue, 18 Oct 2022 17:00:44 -0400
X-MC-Unique: rb7tObo0MraTVA-Q5Cmy_g-1
Received: by mail-il1-f197.google.com with SMTP id
 j8-20020a056e02154800b002fc89e9ebeeso13545573ilu.16
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 14:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m8gVzTEDrFdg9CcJA/+y7Vxy2FCjE7rW81kGSJ6GzjI=;
 b=tkbYu36FmUn1exq8jij/kjijunUaX7ztzm5d3zVqL3VsUcWZLrLJ9UcEhXgHcNbd/L
 zboTi2c1fsYLtOC5lQuuQpJi9g7Z7WbQUSN0Vy6ZJO8nLB52n7wF22ROwlrgIQcRILjx
 fHS7L7D7UGK1bPCzthxWjF2G41CRipAxkNILqQX9nFWAyd6jKcEllqubfqBKTC79zEsq
 WyY2vp5uk9YRMKeZBXW2c4s+wa7GaC15FpLwj5cD+EIXC9INrDkgi/xjHmKu29vQ/1Vk
 zNFgrtdyxH+iUeQyOk3HGCQld+UEcGtbCtEJkBBFnGcVajitnsuuQ3Sa0FEaXUVMEfC4
 dxgg==
X-Gm-Message-State: ACrzQf0g6yys0rLT1tejxVOg9/ZV6pr2tZ403koU4LrX70+lmVoEI1JG
 Move+tdYNXKwrJ4iKUIkkfoCiC+glVFzHuGbmG0A3D+luKwkXeJevrnVCCEn3WAC510A5Zw2ysp
 YrUpy73RlkKrx8Ds=
X-Received: by 2002:a05:6e02:1c46:b0:2f8:e9cc:7ed3 with SMTP id
 d6-20020a056e021c4600b002f8e9cc7ed3mr3048102ilg.69.1666126843504; 
 Tue, 18 Oct 2022 14:00:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Z4TkDqED98DLEI+gwbavtItyF6NIa8AT4sjPkAl87t5YyxnD6PSnLoFb0rtc/ELAKeOBuyw==
X-Received: by 2002:a05:6e02:1c46:b0:2f8:e9cc:7ed3 with SMTP id
 d6-20020a056e021c4600b002f8e9cc7ed3mr3048082ilg.69.1666126843181; 
 Tue, 18 Oct 2022 14:00:43 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 p22-20020a056638217600b003628c926876sm1453749jak.45.2022.10.18.14.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 14:00:42 -0700 (PDT)
Date: Tue, 18 Oct 2022 17:00:40 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Manish Mishra <manish.mishra@nutanix.com>,
 qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: MultiFD and default channel out of order mapping on receive side.
Message-ID: <Y08T+DZQXh/89O/g@x1n>
References: <9f02255a-ceb9-9ca6-2606-b91c5e9e6459@nutanix.com>
 <Y0fJFcj9+wcnKYqd@redhat.com>
 <a4f67b8d-21ec-4261-6ffb-3162c854ce8f@nutanix.com>
 <Y00+tsrBs2m2CH6R@redhat.com> <Y03F97gmi7N4cyMM@x1n>
 <Y05hVC7AXdc0Ak4z@redhat.com> <Y069YMtwwOrmI6lM@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y069YMtwwOrmI6lM@x1n>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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

On Tue, Oct 18, 2022 at 10:51:12AM -0400, Peter Xu wrote:
> On Tue, Oct 18, 2022 at 09:18:28AM +0100, Daniel P. Berrangé wrote:
> > On Mon, Oct 17, 2022 at 05:15:35PM -0400, Peter Xu wrote:
> > > On Mon, Oct 17, 2022 at 12:38:30PM +0100, Daniel P. Berrangé wrote:
> > > > On Mon, Oct 17, 2022 at 01:06:00PM +0530, manish.mishra wrote:
> > > > > Hi Daniel,
> > > > > 
> > > > > I was thinking for some solutions for this so wanted to discuss that before going ahead. Also added Juan and Peter in loop.
> > > > > 
> > > > > 1. Earlier i was thinking, on destination side as of now for default
> > > > > and multi-FD channel first data to be sent is MAGIC_NUMBER and VERSION
> > > > > so may be we can decide mapping based on that. But then that does not
> > > > > work for newly added post copy preempt channel as it does not send
> > > > > any MAGIC number. Also even for multiFD just MAGIC number does not
> > > > > tell which multifd channel number is it, even though as per my thinking
> > > > > it does not matter. So MAGIC number should be good for indentifying
> > > > > default vs multiFD channel?
> > > > 
> > > > Yep, you don't need to know more than the MAGIC value.
> > > > 
> > > > In migration_io_process_incoming, we need to use MSG_PEEK to look at
> > > > the first 4 bytes pendingon the wire. If those bytes are 'QEVM' that's
> > > > the primary channel, if those bytes are big endian 0x11223344, that's
> > > > a multifd channel.  Using MSG_PEEK aviods need to modify thue later
> > > > code that actually reads this data.
> > > > 
> > > > The challenge is how long to wait with the MSG_PEEK. If we do it
> > > > in a blocking mode, its fine for main channel and multifd, but
> > > > IIUC for the post-copy pre-empt channel we'd be waiting for
> > > > something that will never arrive.
> > > > 
> > > > Having suggested MSG_PEEK though, this may well not work if the
> > > > channel has TLS present. In fact it almost definitely won't work.
> > > > 
> > > > To cope with TLS migration_io_process_incoming would need to
> > > > actually read the data off the wire, and later methods be
> > > > taught to skip reading the magic.
> > > > 
> > > > > 2. For post-copy preempt may be we can initiate this channel only
> > > > > after we have received a request from remote e.g. remote page fault.
> > > > > This to me looks safest considering post-copy recorvery case too.
> > > > > I can not think of any depedency on post copy preempt channel which
> > > > > requires it to be initialised very early. May be Peter can confirm
> > > > > this.
> > > > 
> > > > I guess that could work
> > > 
> > > Currently all preempt code still assumes when postcopy activated it's in
> > > preempt mode.  IIUC such a change will bring an extra phase of postcopy
> > > with no-preempt before preempt enabled.  We may need to teach qemu to
> > > understand that if it's needed.
> > > 
> > > Meanwhile the initial page requests will not be able to benefit from the
> > > new preempt channel too.
> > > 
> > > > 
> > > > > 3. Another thing we can do is to have 2-way handshake on every
> > > > > channel creation with some additional metadata, this to me looks
> > > > > like cleanest approach and durable, i understand that can break
> > > > > migration to/from old qemu, but then that can come as migration
> > > > > capability?
> > > > 
> > > > The benefit of (1) is that the fix can be deployed for all existing
> > > > QEMU releases by backporting it.  (3) will meanwhile need mgmt app
> > > > updates to make it work, which is much more work to deploy.
> > > > 
> > > > We really shoulud have had a more formal handshake, and I've described
> > > > ways to achieve this in the past, but it is quite alot of work.
> > > 
> > > I don't know whether (1) is a valid option if there are use cases that it
> > > cannot cover (on either tls or preempt).  The handshake is definitely the
> > > clean approach.
> > > 
> > > What's the outcome of such wrongly ordered connections?  Will migration
> > > fail immediately and safely?
> > > 
> > > For multifd, I think it should fail immediately after the connection
> > > established.
> > > 
> > > For preempt, I'd also expect the same thing because the only wrong order to
> > > happen right now is having the preempt channel to be the migration channel,
> > > then it should also fail immediately on the first qemu_get_byte().
> > > 
> > > Hopefully that's still not too bad - I mean, if we can fail constantly and
> > > safely (never fail during postcopy), we can always retry and as long as
> > > connections created successfully we can start the migration safely.  But
> > > please correct me if it's not the case.
> > 
> > It should typically fail as the magic bytes are different, which will not
> > pass validation. The exception being the postcopy pre-empt  channel which
> > may well cause migration to stall as nothing will be sent initially by
> > the src.
> 
> Hmm right..
> 
> Actually if preempt channel is special we can fix it alone.  As both of you
> discussed, we can postpone the preempt channel setup, maybe not as late as
> when we receive the 1st page request, but:
> 
>   (1) For newly established migration, we can postpone preempt channel
>       setup (postcopy_preempt_setup, resume=false) to the entrance of
>       postcopy_start().
> 
>   (2) For a postcopy recovery process, we can postpone preempt channel
>       setup (postcopy_preempt_setup, resume=true) to postcopy_do_resume(),
>       maybe between qemu_savevm_state_resume_prepare() and the final
>       handshake of postcopy_resume_handshake().
> 
> I need to try and test a bit for above idea.  But the same trick may not
> play well on multifd even if it works.

The sender side is relatively easy because migration thread can move on
without the preempt channel, then the main thread will keep taking care of
it, when connected it can notify the migration thread.

It seems trickier with dest node where the migration loading thread is only
a coroutine of the main thread, so during loading the vm I don't really see
how further socket connections can be established.  Now it's okay with
thread being shared because we only do migration_incoming_process() and
enter the coroutine if all channels are ready.

-- 
Peter Xu


