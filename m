Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E853D96A0
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 22:20:47 +0200 (CEST)
Received: from localhost ([::1]:33970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8q2o-00036k-SL
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 16:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8q1u-0002Q6-P0
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 16:19:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8q1s-0003Hx-N5
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 16:19:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627503587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VYI4pU+ToPtXo9ZkggD79RgbTleSXiVg6e74+/t3qw4=;
 b=Fs/AihnhVetAGBD66349K4M+gV8GY6ecSMG3wFt40G4k+dP8a/8YsGVyo1SRg48AyCOIoO
 i+8EQevPdMQtMI+yqDKRQkvugKquj2WDad9f6jwALti2pl3KsfQ97MTo4pU82ls3ag7K0b
 olnBk6N/NI2i4j4Qw73OMY8wo4q+pnY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-QWXzHpMuMh-Di0pqu9JrFA-1; Wed, 28 Jul 2021 16:19:46 -0400
X-MC-Unique: QWXzHpMuMh-Di0pqu9JrFA-1
Received: by mail-qv1-f71.google.com with SMTP id
 o32-20020a0c85a30000b0290328f91ede2bso2667400qva.1
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 13:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VYI4pU+ToPtXo9ZkggD79RgbTleSXiVg6e74+/t3qw4=;
 b=Sc9yUJL/QBMjHozmWV+r2aFuxvZlOh9nzIyDe+ColbBUFM2ynOIXAnuRw4ZYqh/2Qo
 e3Y3j+RMyY1EALQZQzliU8X16PIAfAXQhJkfwq9U32yCWw/pQRIFEyT+NiqEgxLUDnAo
 YKzv4jekndcqYVDliJ1QbRqCeMH0jFbeRs3cToHumI5NVQXKcmEsjs109pNWslbf5Oct
 cCtwmZAG9Ah0g+HC/d2IoYbESZ4PJSsgSDydI+v4/X8vc8qRvU7pJZK5YzERwi5Rqunn
 m1MYaEyYngoBbJ/Eawfirj1UiSx1GzNCVNEAvpUMl7mm15i4jj/df8KWVYp4H/NQgLKo
 /xzA==
X-Gm-Message-State: AOAM532yDvolPul+nJO5WTMhFJMa+fj45ULechZ4Kptjvauayt+JhpMA
 aU3bBgOyy86q4OBh7RKiDrYAHXvOInGWNuan5FCPvh3da0isDqxu/xt75f0kNodj17yVPLB1f/5
 AGjHbm9EVnLLL2Ng=
X-Received: by 2002:a05:620a:1274:: with SMTP id
 b20mr1575763qkl.376.1627503586183; 
 Wed, 28 Jul 2021 13:19:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAyEnxgeqOOW0c4yXh712gB2ARfSsqBpIEQyEXMpHPdyG1RlCCo40TMaiH2kSOiVF8KIgIoA==
X-Received: by 2002:a05:620a:1274:: with SMTP id
 b20mr1575734qkl.376.1627503585960; 
 Wed, 28 Jul 2021 13:19:45 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id c3sm563553qkd.12.2021.07.28.13.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 13:19:45 -0700 (PDT)
Date: Wed, 28 Jul 2021 16:19:44 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 0/6] migration/ram: Optimize for virtio-mem via
 RamDiscardManager
Message-ID: <YQG74AsEBE0uaN4U@t490s>
References: <YPlWqs8N+NiFH/yj@work-vm>
 <800e421c-70b8-1ef2-56f7-cdbce7a7706b@redhat.com>
 <YPrqfkCk7EM7QLpa@t490s>
 <ea9e9071-4ecb-9c28-9567-92585a18b4eb@redhat.com>
 <YPtAd+JqfNeQqGib@t490s>
 <da54f4ab-2f20-a780-1a9c-b6f4c1c50969@redhat.com>
 <YQA+CUCWV4YDdu9C@t490s>
 <74271964-c481-7168-2a70-ea9eb5067450@redhat.com>
 <YQGzLl9IHod5rJRb@t490s>
 <b54cab91-87a6-298c-e527-0f75f8c38c74@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b54cab91-87a6-298c-e527-0f75f8c38c74@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Juan Quintela <quintela@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 28, 2021 at 09:46:09PM +0200, David Hildenbrand wrote:
> On 28.07.21 21:42, Peter Xu wrote:
> > On Wed, Jul 28, 2021 at 07:39:39PM +0200, David Hildenbrand wrote:
> > > > Meanwhile, I still have no idea how much overhead the "loop" part could bring.
> > > > For a large virtio-mem region with frequent plugged/unplugged mem interacted,
> > > > it seems possible to take a while to me..  I have no solid idea yet.
> > > 
> > > Let's do some math. Assume the worst case on a 1TiB device with a 2MiB block
> > > size: We have 524288 blocks == bits. That's precisely a 64k bitmap in
> > > virtio-mem. In the worst case, every second bit would be clear
> > > ("discarded"). For each clear bit ("discarded"), we would have to clear 512
> > > bits (64 bytes) in the dirty bitmap. That's storing 32 MiB.
> > > 
> > > So scanning 64 KiB, writing 32 MiB. Certainly not perfect, but I am not sure
> > > if it will really matter doing that once on every bitmap sync. I guess the
> > > bitmap syncing itself is much more expensive -- and not syncing the
> > > discarded ranges (b ) above) would make a bigger impact I guess.
> > 
> > I'm not worried about the memory size to be accessed as bitmaps; it's more
> > about the loop itself.  500K blocks/bits means the cb() worse case can be
> > called 500K/2=250k times, no matter what's the hook is doing.
> > 
> > But yeah that's the worst case thing and for a 1TB chunk, I agree that can also
> > be too harsh.  It's just that if it's very easy to be done in bitmap init then
> > still worth thinking about it.
> > 
> > > 
> > > > 
> > > > The thing is I still think this extra operation during sync() can be ignored by
> > > > simply clear dirty log during bitmap init, then.. why not? :)
> > > 
> > > I guess clearing the dirty log (especially in KVM) might be more expensive.
> > 
> > If we send one ioctl per cb that'll be expensive for sure.  I think it'll be
> > fine if we send one clear ioctl to kvm, summarizing the whole bitmap to clear.
> > 
> > The other thing is imho having overhead during bitmap init is always better
> > than having that during sync(). :)
> 
> Oh, right, so you're saying, after we set the dirty bmap to all ones and
> excluded the discarded parts, setting the respective bits to 0, we simply
> issue clearing of the whole area?
> 
> For now I assumed we would have to clear per cb.

Hmm when I replied I thought we can pass in a bitmap to ->log_clear() but I
just remembered memory API actually hides the bitmap interface..

Reset the whole region works, but it'll slow down migration starts, more
importantly that'll be with mmu write lock so we will lose most clear-log
benefit for the initial round of migration and stuck the guest #pf at the
meantime...

Let's try do that in cb()s as you mentioned; I think that'll still be okay,
because so far the clear log block size is much larger (1gb), 1tb is worst case
1000 ioctls during bitmap init, slightly better than 250k calls during sync(),
maybe? :)

-- 
Peter Xu


