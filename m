Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2828E567579
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 19:21:58 +0200 (CEST)
Received: from localhost ([::1]:41246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8mFJ-0003qS-8z
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 13:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8mDy-0002xf-0r
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 13:20:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8mDv-0000Ng-Al
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 13:20:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657041630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EoFAbA1fkwVIeAwAYkv50H2tA4N/eUG89LyjBEo6O18=;
 b=BU+aGQ5SxraLaUGNx6ALFOn+O71yUUTHJc+w+NWx59mjoUUY3r+LL8NdZCt2Q+0HGmhUTd
 bGFLSnIUdbliHOiiZkGEuCfWmUjgwoK8ANBDK9BWUthr9tkyXOvv8+5ttNlSbeYV7WzEnH
 2c1WDMy9QbP7YIGmcZYffszbwUHctv0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-T1i5EZQSP2KnsePTN7jEoA-1; Tue, 05 Jul 2022 13:20:23 -0400
X-MC-Unique: T1i5EZQSP2KnsePTN7jEoA-1
Received: by mail-wm1-f71.google.com with SMTP id
 o28-20020a05600c511c00b003a04f97f27aso7030887wms.9
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 10:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=EoFAbA1fkwVIeAwAYkv50H2tA4N/eUG89LyjBEo6O18=;
 b=BjjSSn0XM/Xobo9JvMgK+wgjBoN/HkxHl1i0YO/N0BYmQBpS31eS44gt9Kv6WOiMxK
 AA1gPTLiv4iT34ouaZaDB0d5wn0yKmLodob5UcaYxSZnF0DDAk2e1iAFzp5Pffr3UEe8
 qycj1lvW2b1UxZ3HzY4HG+4wPBBufIuGwoKehYGlINk5prGIX3utBoEj19Ys7pOQkA9U
 VOZQGbYBdwlS34/gUpkaPWrz0Ufzxs+MEIT3/4OfaMRdpiOsr3mRN4l1spDbOrU8hBMJ
 f1I/yVH1Lk4gG8FjhAdojEAy+Fq/dM7SDhxcfu8fxp8NacIEaeL7UoF3DQdWrCcG7hfn
 Gbrw==
X-Gm-Message-State: AJIora/jBNS1eAO6t80whHyCcuSGmC4DHfFj4YsD3Hf5JZ1Jo4dCRx75
 LmxS1aeN8J1n9Oml1KlSVALzQlHdsTXzh80g3k7SDFXMkTIsPuSBYOmc9E4DkBs3iWpruV41Nuv
 hlVMIeayYD7yKdjk=
X-Received: by 2002:a5d:59a6:0:b0:21b:a234:8314 with SMTP id
 p6-20020a5d59a6000000b0021ba2348314mr32766276wrr.316.1657041620678; 
 Tue, 05 Jul 2022 10:20:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uWsx0QrB22m/wa35HzmEjwrdOp+81CAGEeZEVAQy29wtmAPSJ22n5lXmb6SZJ+YVag/gJfeQ==
X-Received: by 2002:a5d:59a6:0:b0:21b:a234:8314 with SMTP id
 p6-20020a5d59a6000000b0021ba2348314mr32766261wrr.316.1657041620460; 
 Tue, 05 Jul 2022 10:20:20 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 h15-20020a1ccc0f000000b0039749b01ea7sm31193412wmb.32.2022.07.05.10.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 10:20:19 -0700 (PDT)
Date: Tue, 5 Jul 2022 18:20:17 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras <leobras@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH 5/5] multifd: Only sync once each full round of memory
Message-ID: <YsRy0VtnZvhIGiDd@work-vm>
References: <20220621140507.1246-1-quintela@redhat.com>
 <20220621140507.1246-6-quintela@redhat.com>
 <YsRDEyA0mjUD4DSB@work-vm> <8735ff1tn1.fsf@secure.mitica>
 <YsRsYiouIb8+GRua@redhat.com> <YsRxRCgSkQx6Ruqv@work-vm>
 <YsRx6sXGos52Nhar@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YsRx6sXGos52Nhar@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Tue, Jul 05, 2022 at 06:13:40PM +0100, Dr. David Alan Gilbert wrote:
> > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > > On Tue, Jul 05, 2022 at 05:11:46PM +0200, Juan Quintela wrote:
> > > > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > > > > * Juan Quintela (quintela@redhat.com) wrote:
> > > > >> We need to add a new flag to mean to sync at that point.
> > > > >> Notice that we still synchronize at the end of setup and at the end of
> > > > >> complete stages.
> > > > >> 
> > > > >> Signed-off-by: Juan Quintela <quintela@redhat.com>
> > > > >> ---
> > > > >>  migration/migration.c |  2 +-
> > > > >>  migration/ram.c       | 42 ++++++++++++++++++++++++++++++------------
> > > > >>  2 files changed, 31 insertions(+), 13 deletions(-)
> > > > >> 
> > > > >> diff --git a/migration/migration.c b/migration/migration.c
> > > > >> index 3f79df0b70..6627787fc2 100644
> > > > >> --- a/migration/migration.c
> > > > >> +++ b/migration/migration.c
> > > > >> @@ -4283,7 +4283,7 @@ static Property migration_properties[] = {
> > > > >>                        DEFAULT_MIGRATE_ANNOUNCE_STEP),
> > > > >>      /* We will change to false when we introduce the new mechanism */
> > > > >>      DEFINE_PROP_BOOL("multifd-sync-each-iteration", MigrationState,
> > > > >> -                      multifd_sync_each_iteration, true),
> > > > >> +                      multifd_sync_each_iteration, false),
> > > > >>  
> > > > >>      /* Migration capabilities */
> > > > >>      DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
> > > > >> diff --git a/migration/ram.c b/migration/ram.c
> > > > >> index 2c7289edad..6792986565 100644
> > > > >> --- a/migration/ram.c
> > > > >> +++ b/migration/ram.c
> > > > >> @@ -81,6 +81,7 @@
> > > > >>  #define RAM_SAVE_FLAG_XBZRLE   0x40
> > > > >>  /* 0x80 is reserved in migration.h start with 0x100 next */
> > > > >>  #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
> > > > >> +#define RAM_SAVE_FLAG_MULTIFD_SYNC     0x200
> > > > >
> > > > > Note this is the very last usable flag!
> > > > 
> > > > We can recover two flags right now:
> > > > 
> > > > RAM_SAVE_FLAG_FULL is not used anymore.
> > > > 0x80 is free since years ago.
> > > > 
> > > > Once multifd is default, there are some other that could go.
> > 
> > I have suggested that a few times in the past.
> > 
> > > Non-multifd migration isn't likely to go away any time soon, given
> > > distros desire to support migration between QEMU's with quite
> > > significantly different versions. So feels like quite a long time
> > > before we might reclaim more flags.
> > > 
> > > > > We could do with avoiding using them as flags where we dont need to.
> > > > 
> > > > I can't really think on another way to do it.  The other thing that I
> > > > can do is just reuse one of the flags that don't make sense for multifd
> > > > (RAM_SAVE_FLAG_ZERO after zero pages patch,
> > > > RAM_SAVE_FLAG_XBZRLE/COMPRESS_PAGE).
> > > 
> > > Re-using flags based on use context differences feels like a recipe
> > > to confuse people.
> > 
> > Note that most of these things aren't really 'flags'; in the sense that
> > only a few of them are actually combinable; so we should start using
> > combinations to mean things new.
> 
> IOW, treat the field as an enum of valid values instead, and just
> define enum entries for the few valid combinations, giving us many
> more values to play with ?

Right; some care needs to be taken with the ones that were interpreted
as flags; but since you're not going to send the new values to an old
qemu, you've got quite a bit of flexibility.

Dave

> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


