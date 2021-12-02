Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C38D4668A7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 17:50:59 +0100 (CET)
Received: from localhost ([::1]:56622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mspIO-0003MK-7h
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 11:50:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mspFU-0000kz-S0
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 11:47:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mspFS-0005WQ-Ju
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 11:47:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638463674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=INWGFAbHGA/ZYq9jvbm41WQwSaChlXwAX5hgbj5gzT0=;
 b=UkXrbflZCtlx5rDaCKyQA5EfHg5WIscnUE5+gSs8TrL2Pt1NNNGCB24kKQn6ZJIiU0jrqe
 2ADOBwlkGBwZj4zkCjWGWeqYDlpcyegCkk866k41BE7Epzopkiv1C2dho+aJtVeqgBQ7Tk
 zicVIa+sjex8gA1zVh+A+mRR85MEF4w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-419-bqzy4GX9Pz6ZQsniP4w8bA-1; Thu, 02 Dec 2021 11:47:53 -0500
X-MC-Unique: bqzy4GX9Pz6ZQsniP4w8bA-1
Received: by mail-wm1-f71.google.com with SMTP id
 l6-20020a05600c4f0600b0033321934a39so87822wmq.9
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 08:47:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=INWGFAbHGA/ZYq9jvbm41WQwSaChlXwAX5hgbj5gzT0=;
 b=wj1A1KhI5XnYKbW7LVcgQsY96wSp7dsflCtglEQKbGHkAOY5usVZCsjUI6I8NaRQKF
 K4rN9PhWfYEiAbHf2C0ii2JryinzDhvMc0GgoElUjDROkhy29d2HRPtegYZWRnN7f7/Q
 9dsZOMTVRVUXOZc3mUQ9YvTA+JHENZnwiRUFA2kRhx4//NrGbygobFDdz7s8KFhL5k4S
 oJST28PLvr4yDWSk3Ke03iou7LbnxOWMSA9MrtI9hOxK8LTk/YFxuX/Q7FI2ALf7qAe4
 OTIHVu3vrgNt3jJ5THnLhvwJqFRolJic8sMUtdqj6tLqf+JKskbeoc21saFaWljGhKp1
 iIIA==
X-Gm-Message-State: AOAM533I+O6/29watuNdWlXrHhnWNW0mqnRG7Tov0/slqAnL0VKQgu1P
 uFvxVESLuBaz8GM1VEqn035Jz/BSIBCwK41l3/z4bYoHg0d5lS1iJWHKeqJeU1UoN/SF6jZOe+C
 9Bt6feyNh21T/tME=
X-Received: by 2002:a5d:404d:: with SMTP id w13mr15068696wrp.293.1638463612010; 
 Thu, 02 Dec 2021 08:46:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRmJ0wacwPXeJFQ6syL8uYxZ2MqKDl8YQlV9pK5jdQ3kQ3DNJ8HAXxLdsHJOqSF5MeNo7rrQ==
X-Received: by 2002:a5d:404d:: with SMTP id w13mr15068683wrp.293.1638463611830; 
 Thu, 02 Dec 2021 08:46:51 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id x13sm296568wrr.47.2021.12.02.08.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:46:51 -0800 (PST)
Date: Thu, 2 Dec 2021 16:46:49 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 21/23] multifd: Support for zero pages transmission
Message-ID: <Yaj4eclD4zbYa4aa@work-vm>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-22-quintela@redhat.com>
 <Yaiv0PazlhLdsf0O@work-vm> <871r2vgqfu.fsf@secure.mitica>
 <YajxVb0ex3v1COoW@work-vm> <87sfvbf08x.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <87sfvbf08x.fsf@secure.mitica>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > * Juan Quintela (quintela@redhat.com) wrote:
> >> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> >> > * Juan Quintela (quintela@redhat.com) wrote:
> >> >> This patch adds counters and similar.  Logic will be added on the
> >> >> following patch.
> >> >> 
> >> >> Signed-off-by: Juan Quintela <quintela@redhat.com>
> >> >> ---
> >> >>  migration/multifd.h    | 13 ++++++++++++-
> >> >>  migration/multifd.c    | 22 +++++++++++++++++++---
> >> >>  migration/trace-events |  2 +-
> >> >>  3 files changed, 32 insertions(+), 5 deletions(-)
> >> >> 
> >> >> diff --git a/migration/multifd.h b/migration/multifd.h
> >> >> index 39e55d7f05..973315b545 100644
> >> >> --- a/migration/multifd.h
> >> >> +++ b/migration/multifd.h
> >> >> @@ -49,7 +49,10 @@ typedef struct {
> >> >>      /* size of the next packet that contains pages */
> >> >>      uint32_t next_packet_size;
> >> >>      uint64_t packet_num;
> >> >> -    uint64_t unused[4];    /* Reserved for future use */
> >> >> +    /* zero pages */
> >> >> +    uint32_t zero_pages;
> >> >
> >> > Had you considered just adding a flag, MULTIFD_FLAG_ZERO to the packet?
> >> 
> >> I *have* to also add the flag.
> >
> > I meant can't you add a flag to say that this whole packet is zero pages
> > and then you only need one counter.
> 
> No, in general packets are going to transmit *both*, zero pages and
> normal pages.  It depends on the content that one receives.

OK, I'd wondered if it was just easier to send two packets; but fine.

Dave

> Later, Juan.
> 
> > Dave
> >
> >> I was waiting for 7.0 to get out, because I still have to do the
> >> compatibility bits.  Otherwise you can't migrate to an old multifd version.
> >> 
> >> >
> >> >> +    uint32_t unused32[1];    /* Reserved for future use */
> >> >> +    uint64_t unused64[3];    /* Reserved for future use */
> >> >>      char ramblock[256];
> >> >>      uint64_t offset[];
> >> >>  } __attribute__((packed)) MultiFDPacket_t;
> >> >> @@ -117,6 +120,10 @@ typedef struct {
> >> >>      ram_addr_t *normal;
> >> >>      /* num of non zero pages */
> >> >>      uint32_t normal_num;
> >> >> +    /* Pages that are  zero */
> >> >> +    ram_addr_t *zero;
> >> >> +    /* num of zero pages */
> >> >> +    uint32_t zero_num;
> >> >>      /* used for compression methods */
> >> >>      void *data;
> >> >>  }  MultiFDSendParams;
> >> >> @@ -162,6 +169,10 @@ typedef struct {
> >> >>      ram_addr_t *normal;
> >> >>      /* num of non zero pages */
> >> >>      uint32_t normal_num;
> >> >> +    /* Pages that are  zero */
> >> >> +    ram_addr_t *zero;
> >> >> +    /* num of zero pages */
> >> >> +    uint32_t zero_num;
> >> >>      /* used for de-compression methods */
> >> >>      void *data;
> >> >>  } MultiFDRecvParams;
> >> >> diff --git a/migration/multifd.c b/migration/multifd.c
> >> >> index d1ab823f98..2e4dffd6c6 100644
> >> >> --- a/migration/multifd.c
> >> >> +++ b/migration/multifd.c
> >> >> @@ -265,6 +265,7 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
> >> >>      packet->normal_pages = cpu_to_be32(p->normal_num);
> >> >>      packet->next_packet_size = cpu_to_be32(p->next_packet_size);
> >> >>      packet->packet_num = cpu_to_be64(p->packet_num);
> >> >> +    packet->zero_pages = cpu_to_be32(p->zero_num);
> >> >>  
> >> >>      if (p->pages->block) {
> >> >>          strncpy(packet->ramblock, p->pages->block->idstr, 256);
> >> >> @@ -327,7 +328,15 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
> >> >>      p->next_packet_size = be32_to_cpu(packet->next_packet_size);
> >> >>      p->packet_num = be64_to_cpu(packet->packet_num);
> >> >>  
> >> >> -    if (p->normal_num == 0) {
> >> >> +    p->zero_num = be32_to_cpu(packet->zero_pages);
> >> >> +    if (p->zero_num > packet->pages_alloc - p->normal_num) {
> >> >> +        error_setg(errp, "multifd: received packet "
> >> >> +                   "with %d zero pages and expected maximum pages are %d",
> >> >> +                   p->normal_num, packet->pages_alloc - p->zero_num) ;
> >> >
> >> > should that be p->zero_num, packet->pages_alloc - p->normal_num ?
> >> > (and be %u)
> >> 
> >> Copy and paste error.  You are right on both cases.
> >> 
> >> Thanks.
> >> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


