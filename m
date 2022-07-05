Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C53567562
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 19:17:33 +0200 (CEST)
Received: from localhost ([::1]:32774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8mB1-0006Hz-Vh
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 13:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8m7X-0004mY-MQ
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 13:13:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8m7P-0007RT-W9
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 13:13:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657041226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fxqKM0qEd2lw7cssV1zizX4Z8fAWN22SJWALrY83oQE=;
 b=M6NaLG8xtuGL57709lSrxb3qNUrC3oyzvUHTjLK0HBrNjA6LaNT0TJOKSexmWtwEhtIiQn
 5sqwd2ecfJduEJnAAIKR0EvP2rGIq9qoaUrPQo8kws7ccmzZ8ggcddh2QjDWAzSasnSsjh
 79GTet08rX5bcMsZ7pIu1Iki0MD+URw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-4oWoe4r2Ouqn6uoDBJRfQw-1; Tue, 05 Jul 2022 13:13:45 -0400
X-MC-Unique: 4oWoe4r2Ouqn6uoDBJRfQw-1
Received: by mail-wm1-f71.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so7063808wmj.0
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 10:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=fxqKM0qEd2lw7cssV1zizX4Z8fAWN22SJWALrY83oQE=;
 b=pOOast2S9t4u8M/7s+eXoQbuKghJE86g9TEzEIHqEiBxN8ic5L9/9/5/0dN06WjmV4
 +7+e//N26lK15VOTbdoUBeq8rXWpCcl4s2Brw5Gb8FMbdf0RjUuA26eY04qNYvIvMe2L
 jw7kjFuedyGMHoaO9VXIsq4Q0hXpzvySYxpA7nRruIVd77eyKgjRzSO/HHjtiBx38YLl
 oy0q0moCnC0BZlpug+cKRUEh50VKb5S3Z+s/ojFXusTrJT7apYzNLSOhgqdcUOptQsxQ
 /xoh8W+GdiRG1774f4G0p5Ow0c87ovlJJ4j51UkGqe2pL9GU70gDDTa+mu9bR/GD5iz0
 eZeA==
X-Gm-Message-State: AJIora9CU58T63LXqzMIzREv6/Fxp5VRO139tOQoNToIDN2M32yvGRoO
 0rnVsg/IU2/hTRKjn3bF2i4whkahDGepOwLAyReUwCjpScypkM4wmNRLj8CRoeibqpIhTT3LX5o
 ztxIxndwdZ72ZFd8=
X-Received: by 2002:a05:6000:1686:b0:21d:6e46:2fa with SMTP id
 y6-20020a056000168600b0021d6e4602famr7512479wrd.691.1657041223540; 
 Tue, 05 Jul 2022 10:13:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tY/131HNC+mVlDWOk2iolc3D2VpSYj3cTaD7KWQ7jtcRg3N9w3Fr7N7TtLUpmjLp7o5aKapA==
X-Received: by 2002:a05:6000:1686:b0:21d:6e46:2fa with SMTP id
 y6-20020a056000168600b0021d6e4602famr7512463wrd.691.1657041223335; 
 Tue, 05 Jul 2022 10:13:43 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 t18-20020a05600c199200b003a1925aa19asm13720272wmq.21.2022.07.05.10.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 10:13:42 -0700 (PDT)
Date: Tue, 5 Jul 2022 18:13:40 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras <leobras@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH 5/5] multifd: Only sync once each full round of memory
Message-ID: <YsRxRCgSkQx6Ruqv@work-vm>
References: <20220621140507.1246-1-quintela@redhat.com>
 <20220621140507.1246-6-quintela@redhat.com>
 <YsRDEyA0mjUD4DSB@work-vm> <8735ff1tn1.fsf@secure.mitica>
 <YsRsYiouIb8+GRua@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YsRsYiouIb8+GRua@redhat.com>
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
> On Tue, Jul 05, 2022 at 05:11:46PM +0200, Juan Quintela wrote:
> > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > > * Juan Quintela (quintela@redhat.com) wrote:
> > >> We need to add a new flag to mean to sync at that point.
> > >> Notice that we still synchronize at the end of setup and at the end of
> > >> complete stages.
> > >> 
> > >> Signed-off-by: Juan Quintela <quintela@redhat.com>
> > >> ---
> > >>  migration/migration.c |  2 +-
> > >>  migration/ram.c       | 42 ++++++++++++++++++++++++++++++------------
> > >>  2 files changed, 31 insertions(+), 13 deletions(-)
> > >> 
> > >> diff --git a/migration/migration.c b/migration/migration.c
> > >> index 3f79df0b70..6627787fc2 100644
> > >> --- a/migration/migration.c
> > >> +++ b/migration/migration.c
> > >> @@ -4283,7 +4283,7 @@ static Property migration_properties[] = {
> > >>                        DEFAULT_MIGRATE_ANNOUNCE_STEP),
> > >>      /* We will change to false when we introduce the new mechanism */
> > >>      DEFINE_PROP_BOOL("multifd-sync-each-iteration", MigrationState,
> > >> -                      multifd_sync_each_iteration, true),
> > >> +                      multifd_sync_each_iteration, false),
> > >>  
> > >>      /* Migration capabilities */
> > >>      DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
> > >> diff --git a/migration/ram.c b/migration/ram.c
> > >> index 2c7289edad..6792986565 100644
> > >> --- a/migration/ram.c
> > >> +++ b/migration/ram.c
> > >> @@ -81,6 +81,7 @@
> > >>  #define RAM_SAVE_FLAG_XBZRLE   0x40
> > >>  /* 0x80 is reserved in migration.h start with 0x100 next */
> > >>  #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
> > >> +#define RAM_SAVE_FLAG_MULTIFD_SYNC     0x200
> > >
> > > Note this is the very last usable flag!
> > 
> > We can recover two flags right now:
> > 
> > RAM_SAVE_FLAG_FULL is not used anymore.
> > 0x80 is free since years ago.
> > 
> > Once multifd is default, there are some other that could go.

I have suggested that a few times in the past.

> Non-multifd migration isn't likely to go away any time soon, given
> distros desire to support migration between QEMU's with quite
> significantly different versions. So feels like quite a long time
> before we might reclaim more flags.
> 
> > > We could do with avoiding using them as flags where we dont need to.
> > 
> > I can't really think on another way to do it.  The other thing that I
> > can do is just reuse one of the flags that don't make sense for multifd
> > (RAM_SAVE_FLAG_ZERO after zero pages patch,
> > RAM_SAVE_FLAG_XBZRLE/COMPRESS_PAGE).
> 
> Re-using flags based on use context differences feels like a recipe
> to confuse people.

Note that most of these things aren't really 'flags'; in the sense that
only a few of them are actually combinable; so we should start using
combinations to mean things new.

Dave

> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


