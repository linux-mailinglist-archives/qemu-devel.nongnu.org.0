Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA04250913E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 22:14:37 +0200 (CEST)
Received: from localhost ([::1]:41054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGii-0003Cg-Ps
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 16:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhG2B-00068N-0f
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:30:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhG26-0005RM-LP
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:30:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650483033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XjylbETOu7+0WKkykrw7cI2jYlbg3uDCK6EJxvvq6uY=;
 b=abKd+odIP9pk76TAjN2bbE1lGeI1yyOdD29zrfbNWsg4M78HGhS3697Nw0xa49pQjW8htA
 41l2nvPJ+YgUVT9pvxPPo96644dCriKg+BOUwaLDGDHDpNQ+wwKXMkLdfhhHYIzWCo2Qlx
 ZIzszXJNXTwdDAd2A1RRwgnZq10O1do=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-Sz3EOEVONteSsLyJn_Doag-1; Wed, 20 Apr 2022 15:30:32 -0400
X-MC-Unique: Sz3EOEVONteSsLyJn_Doag-1
Received: by mail-io1-f72.google.com with SMTP id
 a17-20020a056602209100b006549a9cd480so1836931ioa.15
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 12:30:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XjylbETOu7+0WKkykrw7cI2jYlbg3uDCK6EJxvvq6uY=;
 b=4jie0fCGIPohmgakET2DbBqOnM10/CtESIUhS+LufmLZh4yPPkyRX1cr+HjM8MCt7x
 DZRCnuYPDRo0U4wGq75NCs5BE58Cz+XHtCrs1dJ5XkSW54Zbs4kcSdbp1IsDwCQbUVnd
 dJlTcR6mKt99hKcj3/16agOVYyYU0KmBlEgLVIv/o6SvN4WlH0fxyArP5XuwoSs5ttIt
 hJZ39s82VDp4bQjbbszuKsAhTCkll+AeFKyRX3wk31/nJfYMK/qUl0AEjA23AhibC81t
 uRZlUb15CZ/vQkrxwv/A6nhjM0ZwrrEmieZFxzJzvESMP9CUfr7Iss1z9gZQXJ89Kynz
 HRoQ==
X-Gm-Message-State: AOAM532Tt200p8Vbb00XXmqGKRnx3uD5MBbBiMNmKWWi9RqL8lJrxLj+
 k8tK0MAtnlCxFddnVHkAxueAZJQWw5o5QxonMDv5ZFgkqNckox23/XVfUBGXoPXXrSq+d7FNRIk
 6yIoDUQWAs7HT+CQ=
X-Received: by 2002:a92:ca0b:0:b0:2cc:45da:de13 with SMTP id
 j11-20020a92ca0b000000b002cc45dade13mr4631487ils.146.1650483030863; 
 Wed, 20 Apr 2022 12:30:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7fiyWrH1Z0v0h8YFD7YbeijtGFdRe6OHkAJslDQ1zdzLMK0bnelpHc3et9qcs/AqvBWiZcQ==
X-Received: by 2002:a92:ca0b:0:b0:2cc:45da:de13 with SMTP id
 j11-20020a92ca0b000000b002cc45dade13mr4631474ils.146.1650483030303; 
 Wed, 20 Apr 2022 12:30:30 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 p66-20020a6bbf45000000b006499925f1f1sm12650941iof.19.2022.04.20.12.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 12:30:30 -0700 (PDT)
Date: Wed, 20 Apr 2022 15:30:29 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v4 04/19] migration: Move migrate_allow_multifd and
 helpers into migration.c
Message-ID: <YmBfVXzmYV9oaRQm@xz-m1.local>
References: <20220331150857.74406-1-peterx@redhat.com>
 <20220331150857.74406-5-peterx@redhat.com>
 <Yl/jWhsVaPp2OgPa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yl/jWhsVaPp2OgPa@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 20, 2022 at 11:41:30AM +0100, Daniel P. Berrangé wrote:
> On Thu, Mar 31, 2022 at 11:08:42AM -0400, Peter Xu wrote:
> > This variable, along with its helpers, is used to detect whether multiple
> > channel will be supported for migration.  In follow up patches, there'll be
> > other capability that requires multi-channels.  Hence move it outside multifd
> > specific code and make it public.  Meanwhile rename it from "multifd" to
> > "multi_channels" to show its real meaning.
> 
> FWIW, I would generally suggest separating the rename from the code
> movement into distinct patches.

Okay.  To still cherish Dave's R-b, I'll try to keep as-is this time, but
I'll remember it next time.

> 
> > 
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  migration/migration.c | 22 +++++++++++++++++-----
> >  migration/migration.h |  3 +++
> >  migration/multifd.c   | 19 ++++---------------
> >  migration/multifd.h   |  2 --
> >  4 files changed, 24 insertions(+), 22 deletions(-)
> > 
> > diff --git a/migration/migration.c b/migration/migration.c
> > index 281d33326b..596d3d30b4 100644
> > --- a/migration/migration.c
> > +++ b/migration/migration.c
> > @@ -180,6 +180,18 @@ static int migration_maybe_pause(MigrationState *s,
> >                                   int new_state);
> >  static void migrate_fd_cancel(MigrationState *s);
> >  
> > +static bool migrate_allow_multi_channels = true;
> 
> This is a pre-existing thing, but I'm curious why we default this to
> 'true', when the first thing qemu_start_incoming_migration() and
> qmp_migrate() do, is to set it to 'false' and then selectively
> put it back to 'true'.

Agreed, FWICT it's not needed, it just doesn't hurt either.

> 
> 
> >  static gint page_request_addr_cmp(gconstpointer ap, gconstpointer bp)
> >  {
> >      uintptr_t a = (uintptr_t) ap, b = (uintptr_t) bp;
> > @@ -469,12 +481,12 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
> >  {
> >      const char *p = NULL;
> >  
> > -    migrate_protocol_allow_multifd(false); /* reset it anyway */
> > +    migrate_protocol_allow_multi_channels(false); /* reset it anyway */
> >      qapi_event_send_migration(MIGRATION_STATUS_SETUP);
> >      if (strstart(uri, "tcp:", &p) ||
> >          strstart(uri, "unix:", NULL) ||
> >          strstart(uri, "vsock:", NULL)) {
> > -        migrate_protocol_allow_multifd(true);
> > +        migrate_protocol_allow_multi_channels(true);
> >          socket_start_incoming_migration(p ? p : uri, errp);
> 
> 
> 
> > @@ -2324,11 +2336,11 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
> >          }
> >      }
> >  
> > -    migrate_protocol_allow_multifd(false);
> > +    migrate_protocol_allow_multi_channels(false);
> >      if (strstart(uri, "tcp:", &p) ||
> >          strstart(uri, "unix:", NULL) ||
> >          strstart(uri, "vsock:", NULL)) {
> > -        migrate_protocol_allow_multifd(true);
> > +        migrate_protocol_allow_multi_channels(true);
> >          socket_start_outgoing_migration(s, p ? p : uri, &local_err);
> >  #ifdef CONFIG_RDMA
> >      } else if (strstart(uri, "rdma:", &p)) {
> 
> Regardless of comments above
> 
>   Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Thanks,

-- 
Peter Xu


