Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4868E6A613E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 22:30:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX7Xi-0008Uh-T9; Tue, 28 Feb 2023 16:29:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pX7Xb-0008Bt-HE
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:29:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pX7XZ-00072y-N3
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:29:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677619780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kkj5VERFVpyXB7AnRzz5qBAo2mREZcsFkNd1PgEb8Cg=;
 b=Wqc9F0ySpffQHcIY520uSd7TF+62qHzlYow3oYg5FXZRP4kUH7z5zO43+czW/96L4tI/iT
 QcipDrpUNaZqX8nGsAcEt4UpsI8C/kHbHaiL3jJFeR2I1ULehegaK7UTcMBYj3E1Vnk4Lh
 FsITCCnue5XGe1XMJGtq7wu7jX6s6sk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-587-tMBXc-ngMNKOtq5xR4YpFQ-1; Tue, 28 Feb 2023 16:29:24 -0500
X-MC-Unique: tMBXc-ngMNKOtq5xR4YpFQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 bi27-20020a05600c3d9b00b003e9d0925341so4074780wmb.8
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 13:29:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677619763;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kkj5VERFVpyXB7AnRzz5qBAo2mREZcsFkNd1PgEb8Cg=;
 b=Tns7GmmueClnIH6E1cbqX1CAQB/IZqKYBWA8ZaLu+7KwAzqZ1II3TdOEhBZBNSQ39N
 Pr94fi2iF5Kog8O/Dm4swK59xE7TGQd0pxRPt6MKk3LDHB+A35VA3YEckAvKitPbPDe7
 0cYBmX3FYpcFhd59lOR+PqkDFV0fhU4MTxK4O7tkX9XxhKuPu94XIaRc/MO0BGDxUzGv
 8PjgPNEChQsUH9NyC4b6YSI+owEfRCPJuG7rS2Yu+msrTnZ5P4nI/i+bPrGRlr8vdsPN
 aLToRJzruA9S1GT1h7bCnCRcmZYK8lg9qNyoM1SFKZviCnUrOkK0W2E+V6YQIdotIFlr
 H/Kg==
X-Gm-Message-State: AO0yUKVwyojGjio1ZNpGn1F8aBgSDvl3ajpdtBfT2fhDUqSb4CgRbzpL
 l9F3qnkUqbLmLn5sK0HHssBRYKq7K+nOIuhRzPO6oDzIy/3XrzGYHT2XOVvPNj+nCnOkNuHebRW
 i9M6lqs1KwkmymRo=
X-Received: by 2002:a05:600c:358f:b0:3e9:9fc5:2c6d with SMTP id
 p15-20020a05600c358f00b003e99fc52c6dmr3363857wmq.14.1677619762795; 
 Tue, 28 Feb 2023 13:29:22 -0800 (PST)
X-Google-Smtp-Source: AK7set8LnDOaTsytxjy7ceWEz9rr5CAO4Q5X1p5D6oxFwDRfbmNqiD+hqDFIhboycFpeZGIG6hdjWg==
X-Received: by 2002:a05:600c:358f:b0:3e9:9fc5:2c6d with SMTP id
 p15-20020a05600c358f00b003e99fc52c6dmr3363848wmq.14.1677619762501; 
 Tue, 28 Feb 2023 13:29:22 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 y1-20020adfdf01000000b002c6d0462163sm10881228wrl.100.2023.02.28.13.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 13:29:21 -0800 (PST)
Date: Tue, 28 Feb 2023 16:29:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Anton Kuchin <antonkuchin@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtio-fs@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 1/1] vhost-user-fs: add migration type property
Message-ID: <20230228162500-mutt-send-email-mst@kernel.org>
References: <11593688-7ca4-def3-6212-7c26faa4d1c6@yandex-team.ru>
 <20230222121133-mutt-send-email-mst@kernel.org>
 <a477ca70-8aea-6c16-122e-1ded4af11f49@yandex-team.ru>
 <20230222151814-mutt-send-email-mst@kernel.org>
 <20230223023604-mutt-send-email-mst@kernel.org>
 <Y/fZm12yGIPnwaDX@fedora>
 <20230224034258-mutt-send-email-mst@kernel.org>
 <8611d901-0940-3747-c2cd-9c193c7f24f2@yandex-team.ru>
 <20230228094756-mutt-send-email-mst@kernel.org>
 <CAJSP0QWz4o8Sa_MHU=zkERqU2=iim8adN7Hg1eLZ_v+yfsHeFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJSP0QWz4o8Sa_MHU=zkERqU2=iim8adN7Hg1eLZ_v+yfsHeFQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 28, 2023 at 02:18:25PM -0500, Stefan Hajnoczi wrote:
> On Tue, 28 Feb 2023 at 09:58, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Feb 28, 2023 at 04:30:36PM +0200, Anton Kuchin wrote:
> > > I really don't understand why and what do you want to check on
> > > destination.
> >
> > Yes I understand your patch controls source. Let me try to rephrase
> > why I think it's better on destination.
> > Here's my understanding
> > - With vhost-user-fs state lives inside an external daemon.
> > A- If after load you connect to the same daemon you can get migration mostly
> >   for free.
> > B- If you connect to a different daemon then that daemon will need
> >   to pass information from original one.
> >
> > Is this a fair summary?
> >
> > Current solution is to set flag on the source meaning "I have an
> > orchestration tool that will make sure that either A or B is correct".
> >
> > However both A and B can only be known when destination is known.
> > Especially as long as what we are really trying to do is just allow qemu
> > restarts, Checking the flag on load will thus achive it in a cleaner
> > way, in that orchestration tool can reasonably keep the flag
> > clear normally and only set it if restarting qemu locally.
> >
> >
> > By comparison, with your approach orchestration tool will have
> > to either always set the flag (risky since then we lose the
> > extra check that we coded) or keep it clear and set before migration
> > (complex).
> >
> > I hope I explained what and why I want to check.
> >
> > I am far from a vhost-user-fs expert so maybe I am wrong but
> > I wanted to make sure I got the point across even if other
> > disagree.
> 
> How do the source QEMU and virtiofsd know which migration mode to use?
> The virtiofsd implementation might support both external and internal
> migration. Source QEMU needs to know whether to ask source virtiofsd
> for device state so it can be included in the migration stream or not.
> 
> Stefan

Well internal migration does not exist yet.  So it is simple.
When it does maybe then we worry about how to support it?
When it does will there be a reason to do external one at all?
Why?  We do internal for everything else after all.

Or maybe we tie it to machine property? We'll know more when
it actually exists, if it ever does.


-- 
MST


