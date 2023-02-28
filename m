Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE90A6A61DB
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 22:55:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX7vq-0008Px-Ia; Tue, 28 Feb 2023 16:54:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pX7vp-0008Po-92
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:54:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pX7vn-0003lu-LF
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:54:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677621282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nne5bsCJSJwDiUGJ+gTiJzw93UrnQzdTyulK9hY0lug=;
 b=A5z5zRlfiintn/AQTvOlLBXTR1Nw3ZeMKfU4IQYYYONoYvFznFDXsOt4sFDENDDsS+ImCX
 UiMLTPPJ8fGg6Y4nHjQhbJLq6zTLiI+e/w8dSlmBoyVm0SYX9ldtCB1VTk+wRRQev6cfRk
 9AinEjcBpFJA1yaxMwVeq+ftzMZqEJk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-103-KI9q92JwOlSgNRGcWcfC6g-1; Tue, 28 Feb 2023 16:54:41 -0500
X-MC-Unique: KI9q92JwOlSgNRGcWcfC6g-1
Received: by mail-wm1-f70.google.com with SMTP id
 e22-20020a05600c219600b003e000facbb1so7470610wme.9
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 13:54:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677621280;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nne5bsCJSJwDiUGJ+gTiJzw93UrnQzdTyulK9hY0lug=;
 b=7pkNlEu9kzROobjmhF0rnbKkNMVSculImUp4EMQ5XU4xxZ//bwJmbVkiPz1hhz0ays
 CgsLQ14opM+DnTv9LZhTAcPjq4RWywtykpEeF0MotXg0pJfEbC6vlcowE6eHZhEFTsfX
 aLeXHp6TrNZC1E7EpTNWlIbZ2RhpEd2lieEdNtzMbzU53EQJbXfmrwsMiQjv0LXi+VNA
 7FJ7OYCz1ra32XJ2K6hlOX5zMHkptGvgAb7AP9WcbBKUINQ3YIhaJEOaR69U9zSv2I+g
 wy1MMggiRF6a/FnKOi9Y19/GIHtjJnSRy/LHuPu73O4abmUwAfcPfyVZ9YtFnZ1GLbi7
 2OMg==
X-Gm-Message-State: AO0yUKWIjRq1MbgqJNTlidAu0pFmdu7wHdT/2izWkbSIAzWGKF8N/6Zm
 DnPjIWuLboY/roQtiBAdsuhZ7pDLtJ8IXPx9OaysRkEkCLqzvlsUvv9RKLdcrFKJbQsb4Thf8lG
 CDvaOzP+EhqFnyMA=
X-Received: by 2002:a5d:4d03:0:b0:2c5:3ccf:e99a with SMTP id
 z3-20020a5d4d03000000b002c53ccfe99amr3139288wrt.6.1677621280109; 
 Tue, 28 Feb 2023 13:54:40 -0800 (PST)
X-Google-Smtp-Source: AK7set/k6k7DngEgzMJqRJVTbdsF9kQSLupy/kg7FJARD5AGHBHpqLNeqoIPWc51CsPyEE7pYJP2Xg==
X-Received: by 2002:a5d:4d03:0:b0:2c5:3ccf:e99a with SMTP id
 z3-20020a5d4d03000000b002c53ccfe99amr3139273wrt.6.1677621279799; 
 Tue, 28 Feb 2023 13:54:39 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 v12-20020adfedcc000000b002c5a1bd527dsm10847763wro.96.2023.02.28.13.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 13:54:39 -0800 (PST)
Date: Tue, 28 Feb 2023 16:54:35 -0500
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
Message-ID: <20230228165318-mutt-send-email-mst@kernel.org>
References: <20230222121133-mutt-send-email-mst@kernel.org>
 <a477ca70-8aea-6c16-122e-1ded4af11f49@yandex-team.ru>
 <20230222151814-mutt-send-email-mst@kernel.org>
 <20230223023604-mutt-send-email-mst@kernel.org>
 <Y/fZm12yGIPnwaDX@fedora>
 <20230224034258-mutt-send-email-mst@kernel.org>
 <8611d901-0940-3747-c2cd-9c193c7f24f2@yandex-team.ru>
 <20230228094756-mutt-send-email-mst@kernel.org>
 <CAJSP0QWz4o8Sa_MHU=zkERqU2=iim8adN7Hg1eLZ_v+yfsHeFQ@mail.gmail.com>
 <20230228162500-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228162500-mutt-send-email-mst@kernel.org>
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

On Tue, Feb 28, 2023 at 04:29:22PM -0500, Michael S. Tsirkin wrote:
> On Tue, Feb 28, 2023 at 02:18:25PM -0500, Stefan Hajnoczi wrote:
> > On Tue, 28 Feb 2023 at 09:58, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Tue, Feb 28, 2023 at 04:30:36PM +0200, Anton Kuchin wrote:
> > > > I really don't understand why and what do you want to check on
> > > > destination.
> > >
> > > Yes I understand your patch controls source. Let me try to rephrase
> > > why I think it's better on destination.
> > > Here's my understanding
> > > - With vhost-user-fs state lives inside an external daemon.
> > > A- If after load you connect to the same daemon you can get migration mostly
> > >   for free.
> > > B- If you connect to a different daemon then that daemon will need
> > >   to pass information from original one.
> > >
> > > Is this a fair summary?
> > >
> > > Current solution is to set flag on the source meaning "I have an
> > > orchestration tool that will make sure that either A or B is correct".
> > >
> > > However both A and B can only be known when destination is known.
> > > Especially as long as what we are really trying to do is just allow qemu
> > > restarts, Checking the flag on load will thus achive it in a cleaner
> > > way, in that orchestration tool can reasonably keep the flag
> > > clear normally and only set it if restarting qemu locally.
> > >
> > >
> > > By comparison, with your approach orchestration tool will have
> > > to either always set the flag (risky since then we lose the
> > > extra check that we coded) or keep it clear and set before migration
> > > (complex).
> > >
> > > I hope I explained what and why I want to check.
> > >
> > > I am far from a vhost-user-fs expert so maybe I am wrong but
> > > I wanted to make sure I got the point across even if other
> > > disagree.
> > 
> > How do the source QEMU and virtiofsd know which migration mode to use?
> > The virtiofsd implementation might support both external and internal
> > migration. Source QEMU needs to know whether to ask source virtiofsd
> > for device state so it can be included in the migration stream or not.
> > 
> > Stefan
> 
> Well internal migration does not exist yet.  So it is simple.
> When it does maybe then we worry about how to support it?
> When it does will there be a reason to do external one at all?
> Why?  We do internal for everything else after all.
> 
> Or maybe we tie it to machine property? We'll know more when
> it actually exists, if it ever does.

Or maybe there's a way to ask virtiofsd what does it support:
it has to be supported on both source and destination.
In short - we don't know, let's engineer for what we know and
not guess.

> 
> -- 
> MST


