Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1FB4668B8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 17:55:50 +0100 (CET)
Received: from localhost ([::1]:41030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mspN7-0003ey-T0
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 11:55:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mspJv-0007c5-Ol
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 11:52:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mspJr-0006Mw-09
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 11:52:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638463940;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=0txU/nJsw6YR/Ab/H+fo1DeWq8MacV5Pz7hyvEJX2iU=;
 b=gEFwBBmVlDC0DY7Afn8ouOlLxCCfLwZseqgA2n8he96+TykKrEniRJPlqMV6O+GWMmtcwj
 jxoNmssTYbe0cSp3oKIitZfM/c1lNZK2KI1XKXWksgDrCvTJpcPkcQ/vo9R4k3o52VI51h
 gX5dYcPjr/xX97m+IFo4p2nVxcnMPdc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-GJtW7EEnMS-3-V5HA9nynw-1; Thu, 02 Dec 2021 11:52:19 -0500
X-MC-Unique: GJtW7EEnMS-3-V5HA9nynw-1
Received: by mail-wm1-f72.google.com with SMTP id
 201-20020a1c04d2000000b003335bf8075fso173057wme.0
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 08:52:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=0txU/nJsw6YR/Ab/H+fo1DeWq8MacV5Pz7hyvEJX2iU=;
 b=pWyZgW32sAh7dXhWkjUISpcU4l8fuSoQN6gm6pOWIsc0uKkcs9qeRMbTTjW20z/QWt
 LKlgHstvfFmE/ZIG7sqoLC/Y3H+9+csCpndz0MEOIujDVsKqxHGbFWdR82v/TeXtlTwE
 GFwMdkJOVBLUEvTTWrxw+/wKbNWloC/QeEqwNHaqdsJdbreb5BuWUbKNn5tQqCahFSfA
 0BkLjsfrvYx7YTdwYaDTzlyNjBjj6lUWLniCOgNgZn6Dwtq+/n4RMpFKKXoKJ2g/rPQn
 t5YVFnUDpbpmNE/bthTXgHQ0PSAFTU+6eoaEFetPeyreZRHWviTxuiU+1wOSa6ulqKeE
 lwpw==
X-Gm-Message-State: AOAM532mIG3z0H9oxnmEmz6zTG9JbuOfaT1I/zGQWSLfuTo51pKemCh7
 ERguizyhuJ31ggSWXD6tCjRNRkBvbElnCyxCrj6jOj6Y2KPzRHJnxE7SSzefR+ef9+xzat39GOR
 cEpKdrcKkAbedltQ=
X-Received: by 2002:a5d:6211:: with SMTP id y17mr15831147wru.97.1638463938696; 
 Thu, 02 Dec 2021 08:52:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyx2BHzR0e+pYrRhF8tzbOCssYfbwMdtszaOMj9XyHTEXVj/kH2TUF0KQPy4qkswkA983v03g==
X-Received: by 2002:a5d:6211:: with SMTP id y17mr15831124wru.97.1638463938541; 
 Thu, 02 Dec 2021 08:52:18 -0800 (PST)
Received: from localhost (static-58-87-86-188.ipcom.comunitel.net.
 [188.86.87.58])
 by smtp.gmail.com with ESMTPSA id d8sm260166wrm.76.2021.12.02.08.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:52:18 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 21/23] multifd: Support for zero pages transmission
In-Reply-To: <Yaj4eclD4zbYa4aa@work-vm> (David Alan Gilbert's message of "Thu, 
 2 Dec 2021 16:46:49 +0000")
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-22-quintela@redhat.com>
 <Yaiv0PazlhLdsf0O@work-vm> <871r2vgqfu.fsf@secure.mitica>
 <YajxVb0ex3v1COoW@work-vm> <87sfvbf08x.fsf@secure.mitica>
 <Yaj4eclD4zbYa4aa@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 02 Dec 2021 17:52:17 +0100
Message-ID: <87k0gneypq.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Reply-To: quintela@redhat.com
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
>> > * Juan Quintela (quintela@redhat.com) wrote:
>> >> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
>> >> > * Juan Quintela (quintela@redhat.com) wrote:
>> >> >> This patch adds counters and similar.  Logic will be added on the
>> >> >> following patch.
>> >> >> 
>> >> >> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> >> >> ---
>> >> >>  migration/multifd.h    | 13 ++++++++++++-
>> >> >>  migration/multifd.c    | 22 +++++++++++++++++++---
>> >> >>  migration/trace-events |  2 +-
>> >> >>  3 files changed, 32 insertions(+), 5 deletions(-)
>> >> >> 
>> >> >> diff --git a/migration/multifd.h b/migration/multifd.h
>> >> >> index 39e55d7f05..973315b545 100644
>> >> >> --- a/migration/multifd.h
>> >> >> +++ b/migration/multifd.h
>> >> >> @@ -49,7 +49,10 @@ typedef struct {
>> >> >>      /* size of the next packet that contains pages */
>> >> >>      uint32_t next_packet_size;
>> >> >>      uint64_t packet_num;
>> >> >> -    uint64_t unused[4];    /* Reserved for future use */
>> >> >> +    /* zero pages */
>> >> >> +    uint32_t zero_pages;
>> >> >
>> >> > Had you considered just adding a flag, MULTIFD_FLAG_ZERO to the packet?
>> >> 
>> >> I *have* to also add the flag.
>> >
>> > I meant can't you add a flag to say that this whole packet is zero pages
>> > and then you only need one counter.
>> 
>> No, in general packets are going to transmit *both*, zero pages and
>> normal pages.  It depends on the content that one receives.
>
> OK, I'd wondered if it was just easier to send two packets; but fine.

Zero pages travel for free.

To have initial packets to the same size, we always send an array of 128
offsets in the packet (I am speaking x86_64 here).

And as we receive an array of 128 pages, we have space there for the
zero pages, no need of a different packet at all.

Later, Juan.


