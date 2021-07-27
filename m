Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF3B3D7A8D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 18:09:46 +0200 (CEST)
Received: from localhost ([::1]:45930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8PeL-0002mk-3r
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 12:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8PdG-0001gR-O4
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 12:08:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8Pd8-0000g9-TH
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 12:08:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627402109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8X7BDZj2kyOTBsqcK49p6o5fNjAyjBZ5Y5X/Z2qPShA=;
 b=iz1clAusHx1kjh/xxzKHZir0h84VDMxAjxdyRLP7UCpkNlHoP4HxXTebXIDD1WM8iJcpH7
 gDQ+f4HszQmHa6RidKG4P1vJL//X8uP9qnQDijxve/G2DgAU9GZSsjmJ+dfzzbBz9kXaaR
 FhczBnAqXWgvr2NAZ/B9UfQRjNtiMvY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-kbqQfXXEOGah_pumDNv08w-1; Tue, 27 Jul 2021 12:08:26 -0400
X-MC-Unique: kbqQfXXEOGah_pumDNv08w-1
Received: by mail-qv1-f69.google.com with SMTP id
 v16-20020a0562140510b029032511e85975so9780364qvw.23
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 09:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8X7BDZj2kyOTBsqcK49p6o5fNjAyjBZ5Y5X/Z2qPShA=;
 b=Z7L1EruSLoZsIeJvLdUKGO6O+dBK93gwwh21Q1mGofxXHFBrAtX/9IP2VXPgrlfd2f
 Y/VwYhxirZ3f7XU640iNK8bXW8+sSlmXDSN9i4El1s+D8fkSzIC8gDP1GxoljXYEyjY2
 6gImXcgbuesfgFC9fnsvzhR+yg8NXcNpz85hkGFtv7zTwmyD0EZ/ASHQ/SQ1lJ40F0pc
 l+qyPvXWkIAT77eZb05A15r9HpEZxgQayTRIziatS/KcIv8s0jdNL+8fz7ipPgTcD3W2
 eqyBq2sAISeiNDD6upTBHBw3cUdc7xgXV2J8jJDfKxncFN6M1tPZsmE+pTcfrKbVcMsz
 ncoQ==
X-Gm-Message-State: AOAM530KZQTJNIkP7uOoQ8f9yfd/8hbgfVjoJOBNV1YVM5wInF80DY/F
 yK6tBWq/qZz7tVBuZv0prBUuhFOQ/Kwqv2uH2woG2lb5qpijeOtWHqZ9lFNEXAi0DdXlF/ymEHq
 nGyDRqVMwkt6d7kM=
X-Received: by 2002:ac8:5ac7:: with SMTP id d7mr20027883qtd.240.1627402105859; 
 Tue, 27 Jul 2021 09:08:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyO/JN4qfecr+HwV6iG4ioqcERTONi0332orQRZYuhJj/DVGin5Q72alUlQHckGEYoPWmSW+Q==
X-Received: by 2002:ac8:5ac7:: with SMTP id d7mr20027864qtd.240.1627402105661; 
 Tue, 27 Jul 2021 09:08:25 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id az37sm1753481qkb.91.2021.07.27.09.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 09:08:24 -0700 (PDT)
Date: Tue, 27 Jul 2021 12:08:24 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 7/9] cpus: Introduce
 qemu_mutex_unlock_iothread_prepare()
Message-ID: <YQAveIvA2SB1SmSI@t490s>
References: <20210723193444.133412-1-peterx@redhat.com>
 <20210723193444.133412-8-peterx@redhat.com>
 <0fb73c64-f915-7630-ba64-0524c6b8ed40@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0fb73c64-f915-7630-ba64-0524c6b8ed40@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.717, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 27, 2021 at 02:59:26PM +0200, David Hildenbrand wrote:
> On 23.07.21 21:34, Peter Xu wrote:
> > The prepare function before unlocking BQL.  There're only three places that can
> > release the BQL: unlock(), cond_wait() or cond_timedwait().
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >   softmmu/cpus.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> > 
> > diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> > index 9131f77f87..6085f8edbe 100644
> > --- a/softmmu/cpus.c
> > +++ b/softmmu/cpus.c
> > @@ -66,6 +66,10 @@
> >   static QemuMutex qemu_global_mutex;
> > +static void qemu_mutex_unlock_iothread_prepare(void)
> > +{
> > +}
> > +
> >   bool cpu_is_stopped(CPUState *cpu)
> >   {
> >       return cpu->stopped || !runstate_is_running();
> > @@ -523,16 +527,19 @@ void qemu_mutex_unlock_iothread(void)
> >   {
> >       g_assert(qemu_mutex_iothread_locked());
> >       iothread_locked = false;
> > +    qemu_mutex_unlock_iothread_prepare();
> >       qemu_mutex_unlock(&qemu_global_mutex);
> >   }
> >   void qemu_cond_wait_iothread(QemuCond *cond)
> >   {
> > +    qemu_mutex_unlock_iothread_prepare();
> >       qemu_cond_wait(cond, &qemu_global_mutex);
> >   }
> >   void qemu_cond_timedwait_iothread(QemuCond *cond, int ms)
> >   {
> > +    qemu_mutex_unlock_iothread_prepare();
> >       qemu_cond_timedwait(cond, &qemu_global_mutex, ms);
> >   }
> > 
> 
> I'd squash this patch into the next one.
> 
> I don't quite like the function name, but don't really have a better
> suggestion .... maybe qemu_mutex_might_unlock_iothread(), similar to
> might_sleep() or might_fault() in the kernel. (although here it's pretty
> clear and not a "might"; could be useful in other context where we might
> conditionally unlock the BQL at some point in the future, though)

Yes, IMHO "might" describes a capability of doing something, here it's not
(this one should only be called right before releasing bql, not within any
context of having some capability).  The other option I thought was "pre" but
it will be just a short version of "prepare".

Let me know if you have a better suggestion on naming. :) Otherwise I'll keep
the naming, squash this patch into the next and keep your r-b for that.

Thanks,

-- 
Peter Xu


