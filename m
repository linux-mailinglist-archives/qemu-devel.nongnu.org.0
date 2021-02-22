Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE52321E98
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:57:54 +0100 (CET)
Received: from localhost ([::1]:54552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEFSz-0001S1-MG
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lEFQ4-0006nt-8I
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:54:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lEFPx-0002nh-Q6
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:54:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614016485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HXQH0+kDFn6R9rhGfUD0pY3PYiz17nSnIZ5tMoglx/g=;
 b=F+NP/GKISSLqBQB7VahzMokt8DyYVkez+fS0yzyq0gxM8XLiWWF2AnE4xtfb8v+AbkUlnd
 /j1fDYHkhORYJqyEJEEfqaF1mIbnMDjbQnaAVWPPaz4nApplCdK5LoDcZ6oIs50SR24lWl
 to8i4TKeiBV4nLuM9fxpIgyRpD3F9J4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-65QRkVUjPmGjMiJmq8eNYg-1; Mon, 22 Feb 2021 12:54:43 -0500
X-MC-Unique: 65QRkVUjPmGjMiJmq8eNYg-1
Received: by mail-qt1-f197.google.com with SMTP id o7so8199077qtw.7
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 09:54:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=HXQH0+kDFn6R9rhGfUD0pY3PYiz17nSnIZ5tMoglx/g=;
 b=RobRyt5kh+3mDErM6uDaERERExN+LbepsKbF3Me+Ku0VHqXkeKW8Sy8cMTeFt9MF/0
 w1mfDN8yaUdXcgNc1HbqSpxB3Nyt7T7CmkMWpB920qVBpNM1pyzz0suAjarsOq4d1WoO
 4T8wzAV69DN9+7vGYP35xWC00U2ulXIFNbJn97U7pEFq+iJQrgAvYf7jVf0VpY7DGErm
 mA6dIlnEJUS4GJHm5uBG0lF/k3dE6y45kYMGyyVJgUupzBql6gvdCrlVc7fY2gT4TlYw
 wmMN3F0OmlqxXeomErD9SSU2ftwQaEpgzMckpRRzjO5oy1SuyRt8OPsXx1hwndmBL1Ma
 UqAQ==
X-Gm-Message-State: AOAM531ck9eHi2ykNGG6yPZM5gX+b3/W2eIMUczW9E8hOLhwh38lOc+g
 XtxSNsKWtCHZmTE5LPowRORxmYygolb/S+tBllr0+5fhq3bdCnxwkH65sKlyzjqpEFU0MoAFzvP
 /oRZC+Rmugiaakiw=
X-Received: by 2002:a05:620a:10aa:: with SMTP id
 h10mr22614121qkk.53.1614016482752; 
 Mon, 22 Feb 2021 09:54:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyw8X8I+XVtaWv62m5Ndw0aII35S8chJN/I1P9coEDzAWo2Wo/Gl7PWREcR5gILytYgyoOhCw==
X-Received: by 2002:a05:620a:10aa:: with SMTP id
 h10mr22614093qkk.53.1614016482557; 
 Mon, 22 Feb 2021 09:54:42 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id i75sm7303045qke.47.2021.02.22.09.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 09:54:42 -0800 (PST)
Date: Mon, 22 Feb 2021 12:54:40 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
Message-ID: <20210222175440.GT6669@xz-x1>
References: <20210219224719.GN6669@xz-x1>
 <68564940-6276-465D-9945-A50A900B90BF@redhat.com>
 <20210222172923.GS6669@xz-x1>
 <79ce6a7e-c40b-b64e-757e-1ec6e4177310@redhat.com>
MIME-Version: 1.0
In-Reply-To: <79ce6a7e-c40b-b64e-757e-1ec6e4177310@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alexander Duyck <alexander.duyck@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 David Hildenbrand <dhildenb@redhat.com>, Den Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 22, 2021 at 06:33:27PM +0100, David Hildenbrand wrote:
> On 22.02.21 18:29, Peter Xu wrote:
> > On Sat, Feb 20, 2021 at 02:59:42AM -0500, David Hildenbrand wrote:
> > > Live snapshotting ends up reading all guest memory (dirty bitmap starts with all 1s), which is not what we want for virtio-mem - we don’t want to read and migrate memory that has been discarded and has no stable content.
> > > 
> > > For ordinary migration we use the guest page hint API to clear bits in the dirty bitmap after dirty bitmap sync. Well, if we don‘t do bitmap syncs we‘ll never clear any dirty bits. That‘s the problem.
> > 
> > Using dirty bitmap for that information is less efficient, becase it's
> > definitely a larger granularity information than PAGE_SIZE.  If the disgarded
> > ranges are always continuous and at the end of a memory region, we should have
> > some parameter in the ramblock showing that where we got shrinked then we don't
> > check dirty bitmap at all, rather than always assuming used_length is the one.
> 
> They are randomly scattered across the whole RAMBlock. Shrinking/growing
> will be done to some degree in the future (but it won't get rid of the
> general sparse layout we can produce).

OK. Btw I think currently live snapshot should still be reading dirty bitmap,
so maybe it's still fine.  It's just that it's still not very clear to hide
virtio-mem information into dirty bitmap, imho, since that's not how we
interpret dirty bitmap - which is only for the sake of tracking page changes.

What's the granule of virtio-mem for this discard behavior?  Maybe we could
decouple it with dirty bitmap some day; if the unit is big enough it's also a
gain on efficiency so we skip in chunk rather than looping over tons of pages
knowing that they're discarded.

Thanks,

-- 
Peter Xu


