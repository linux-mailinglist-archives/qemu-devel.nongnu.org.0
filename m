Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00065348135
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 20:06:48 +0100 (CET)
Received: from localhost ([::1]:36182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8q7-0004IA-IR
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 15:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lP8ac-00005E-Mk
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:50:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lP8aY-0003jI-Lo
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:50:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616611834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n208gq+ks71mswRPQf5lfAuC/y8GQgOLlRH1tz1mONA=;
 b=OxNdSPOMm8GbGy3KNoykT4c4WCQ3aNS4gGDquE4YI1DyJumiyZ9gmXoCN5h9yiyxN9Kxm5
 LQE1jSxldNV39ch+sKh71huOw4bVYTQtOWSBX3AjGTZH8AyP4wI3DJ/Ou0bFiY6hk1GNNp
 ygInFP4EbcR9GBRH1UdpAHaR5elwBjM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-cfjwB3y8PZut0ivGw3TpBw-1; Wed, 24 Mar 2021 14:50:32 -0400
X-MC-Unique: cfjwB3y8PZut0ivGw3TpBw-1
Received: by mail-qk1-f200.google.com with SMTP id y22so2274454qkb.23
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n208gq+ks71mswRPQf5lfAuC/y8GQgOLlRH1tz1mONA=;
 b=KXWIIX5nwfsNjrN46TUOPGLrFnfDRQLP9/pblg9Ets5QhL7gRgW+qlA0i00dkmOjvJ
 wWha+nWYEaKhaNlfBN5thpSxNvReNOsOSVTxbBiaqayaEOJC776kWRki9LrEvgjfGVHe
 NzaqyJE5E0EARzsaT0Nc+fcKGJhl9r2Hs9RNiLGv9RTDY/OlVFIEU5U/pzs+50A0vvRh
 mN8Hn8PvIBfUndgtvHdONbXii/CqXR2JBBFdcyetPpCpDHwC+skH9eaAtly6ZaTNMdzp
 bvFFtRGZRQXKl9B99plJWTCFb7Ijnxlopqgm2PXiRudP2K+CsjmCaF/rI7YAs8pGjKFA
 UeGg==
X-Gm-Message-State: AOAM533F0e63sYhy0xir1jKUm3btzf6oKdkLhHaFTHuFymQfhQQizmLV
 oRDuZiYR2C1EL8Broce0wT+dn7VRq8SvlI8ZCB4vL6pVHbvuJI5Llpwclpy21cekzlEsZ1GMtub
 1iMhdKv4v4zsWojw=
X-Received: by 2002:ac8:6ede:: with SMTP id f30mr4268631qtv.275.1616611832021; 
 Wed, 24 Mar 2021 11:50:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5axB6aF6RiV7d0os54QfzT87R2+wYvulfD4x/dIvMcv2s8yOGr5BOdhIHOwhNcieJ0vokiw==
X-Received: by 2002:ac8:6ede:: with SMTP id f30mr4268615qtv.275.1616611831801; 
 Wed, 24 Mar 2021 11:50:31 -0700 (PDT)
Received: from xz-x1 (bras-base-toroon474qw-grc-82-174-91-135-175.dsl.bell.ca.
 [174.91.135.175])
 by smtp.gmail.com with ESMTPSA id q64sm2045223qtd.32.2021.03.24.11.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 11:50:31 -0700 (PDT)
Date: Wed, 24 Mar 2021 14:50:30 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v1 1/3] migration: Fix missing qemu_fflush() on buffer
 file in bg_migration_thread
Message-ID: <20210324185030.GF219069@xz-x1>
References: <20210319145249.425189-1-andrey.gruzdev@virtuozzo.com>
 <20210319145249.425189-2-andrey.gruzdev@virtuozzo.com>
 <20210322201716.GG16645@xz-x1>
 <2fb49f83-e31c-8c93-50b7-833026b06518@virtuozzo.com>
 <20210323145457.GC6486@xz-x1>
 <9311f31b-298f-d235-45bd-0ed9d66f9468@virtuozzo.com>
 <20210323183537.GH6486@xz-x1> <YFt4cN4tmQ/u11mf@work-vm>
MIME-Version: 1.0
In-Reply-To: <YFt4cN4tmQ/u11mf@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
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
Cc: Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 24, 2021 at 05:35:44PM +0000, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > On Tue, Mar 23, 2021 at 08:21:43PM +0300, Andrey Gruzdev wrote:
> > > > For the long term I think we'd better have a helper:
> > > > 
> > > >          qemu_put_qio_channel_buffer(QEMUFile *file, QIOChannelBuffer *bioc)
> > > > 
> > > > So as to hide this flush operation, which is tricky. We'll have two users so
> > > > far:
> > > > 
> > > >          bg_migration_completion
> > > >          colo_do_checkpoint_transaction
> > > > 
> > > > IMHO it'll be nicer if you'd do it in this patch altogether!
> > > > 
> > > > Thanks,
> > > > 
> > > Sorry, can't get the idea, what's wrong with the fix.
> > 
> > I'm fine with the fix, but I've got one patch attached just to show what I
> > meant, so without any testing for sure..
> > 
> > Looks more complicated than I thought, but again I think we should hide that
> > buffer flush into another helper to avoid overlooking it.
> 
> I was wondering if I was missing the same fflush in postcopy, but I
> don't *think* so, although it's a bit round about; before sending the
> data I call:
> 
>   qemu_savevm_send_postcopy_run(fb)
> 
> and that calls qemu_savevm_command_send that ends in a fflish;  which is
> non-obvious.
> 
> While I'd leave that in there, it might be good to use that same thing.

Right, I was grepping qemu_put_buffer() previously, so as to easily got
qemu_savevm_send_packaged() overlooked..

Maybe I can make it a small patch series after the snapshot fixes got in.

Thanks,

-- 
Peter Xu


