Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 184483A9C05
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 15:30:48 +0200 (CEST)
Received: from localhost ([::1]:58028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltVd1-0007wm-5U
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 09:30:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ltVbu-0006wM-7Q
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:29:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ltVbs-0005Ok-IH
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:29:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623850175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zeC5hc2nWicwHW49ugO3ozSE3V12l6cpaBR2v0Hb+Hs=;
 b=Xepc7C4CUmCxtTQiJA4YAv1Y/ecPst9WkxRMDx+jyKdWiC9EFDJ1SIHoXCVeS5himMd9ch
 EoaY7f/XOtY1dXuFT2HehzcZH7cwnq8PoPA2dolrMm8o/DXkGXT6dBj29Sb+1yuMqQNESK
 FUkL+adOUUqcuZXHcK8lCkJ94iNWpHs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-TtYBUBcmPvWSXTae_7wUdg-1; Wed, 16 Jun 2021 09:29:34 -0400
X-MC-Unique: TtYBUBcmPvWSXTae_7wUdg-1
Received: by mail-qk1-f200.google.com with SMTP id
 2-20020a3709020000b02903aa9873df32so1737649qkj.15
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 06:29:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zeC5hc2nWicwHW49ugO3ozSE3V12l6cpaBR2v0Hb+Hs=;
 b=mRatbaI0tjsrx9SejJK+Ohz1MIPaj+6eum1AaKoX/IBHmqhYpaUSitDtoIJS3VXqUw
 iDpQssIJq48A4I6jjqH3cO53q9v9ftIvsNENTFJRiiyhBicp+WQWHvvQp/SoNXlDUVbi
 TRPnrIbsica88pGZcqjtfXs03dnCwMEsq5hx85xpTqb4eBwU3kTxYY+D4WYe/ZCMLf79
 6euoX58iv+SbUx/0ikfFZnTORUUjZ0D1sgknBk/HgdBRAvz0s09quTmfIIhKPx41K0ck
 HIXk4Si2Vg/2SG17KB0Fg0PoJcxMJvg0weOSixRvCkZCqhERt1M28u+g+rRGoQIo4tby
 N9Lw==
X-Gm-Message-State: AOAM531XfP3rCkxW6DSKhxszm7rZmvaqHDN+9sbNydGqVWEpelAk14rk
 i8LgtAcWSPSg19wqIGM3GM8xjIphRsecZUtH+WG9UUTdsAkREFEMwWwB6ku8AEkmv6bJH0VFab2
 Ww93ATyqX+Fqr7AQ=
X-Received: by 2002:a05:620a:622:: with SMTP id
 2mr3663598qkv.237.1623850174297; 
 Wed, 16 Jun 2021 06:29:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyo0w35o3IGc3zGHca5nw2w4Dgc9+6m9YC2NC0SGI2u4oFH/6j5aFUhB4x14cBa2bT7PVx+Mg==
X-Received: by 2002:a05:620a:622:: with SMTP id
 2mr3663583qkv.237.1623850174106; 
 Wed, 16 Jun 2021 06:29:34 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id z6sm1575974qke.24.2021.06.16.06.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 06:29:33 -0700 (PDT)
Date: Wed, 16 Jun 2021 09:29:32 -0400
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v2 2/2] tests: migration-test: Add dirty ring test
Message-ID: <YMn8vKrx2hOvisfB@t490s>
References: <20210615175523.439830-1-peterx@redhat.com>
 <20210615175523.439830-3-peterx@redhat.com>
 <87pmwm0y04.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <87pmwm0y04.fsf@secure.mitica>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 16, 2021 at 02:55:55PM +0200, Juan Quintela wrote:
> Peter Xu <peterx@redhat.com> wrote:
> > Add dirty ring test if kernel supports it.  Add the dirty ring parameter on
> > source should be mostly enough, but let's change the dest too to make them
> > match always.
> >
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> 
> Why we check with 4096 and not whatever the kernel returs?

Because the kernel returned value is the "maximum supported", while IMHO it's
better to test with some commonly used value (which should normally not the
maximum supported one; 4096 is suggested the default value to use so far in
e.g. qemu-options.hx).

> 
> So ....
> 
> > @@ -467,6 +471,8 @@ typedef struct {
> >      bool use_shmem;
> >      /* only launch the target process */
> >      bool only_target;
> > +    /* Use dirty ring if true; dirty logging otherwise */
> > +    bool use_dirty_ring;
> 
> make this an int
> 
> >      char *opts_source;
> >      char *opts_target;
> >  } MigrateStart;
> > @@ -573,11 +579,13 @@ static int test_migrate_start(QTestState **from, QTestState **to,
> >          shmem_opts = g_strdup("");
> >      }
> >  
> > -    cmd_source = g_strdup_printf("-accel kvm -accel tcg%s%s "
> > +    cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
> >                                   "-name source,debug-threads=on "
> >                                   "-m %s "
> >                                   "-serial file:%s/src_serial "
> >                                   "%s %s %s %s",
> > +                                 args->use_dirty_ring ?
> > +                                 ",dirty-ring-size=4096" : "",
> 
> check if it is > 0 here and otherwise pass it
> 
> >                                   machine_opts ? " -machine " : "",
> >                                   machine_opts ? machine_opts : "",
> >                                   memory_size, tmpfs,
> > @@ -587,12 +595,14 @@ static int test_migrate_start(QTestState **from, QTestState **to,
> >          *from = qtest_init(cmd_source);
> 
> > +static bool kvm_dirty_ring_supported(void)
> > +{
> > +#if defined(__linux__)
> > +    int ret, kvm_fd = open("/dev/kvm", O_RDONLY);
> > +
> > +    if (kvm_fd < 0) {
> > +        return false;
> > +    }
> > +
> > +    ret = ioctl(kvm_fd, KVM_CHECK_EXTENSION, KVM_CAP_DIRTY_LOG_RING);
> > +    close(kvm_fd);
> > +
> > +    /* We test with 4096 slots */
> > +    if (ret < 4096) {
> 
> And we return this value.
> 
> > +        return false;
> > +    }
> > +
> > +    return true;
> > +#else
> > +    return false;
> > +#endif
> > +}
> 
> Mental note, don't we have a function inside tests/ that check if
> a kvm feauture is there?
> 
> Quick check seems to imply no.
> 
> On the other hand, KVM_CHECK_EXTENSION is basically only used on
> kvm-all.c

Yeah, seems not there yet..  So we don't have guarantee to run this new test
because normally the host kernel is unpredictable, but it'll run on more hosts
as time flies and as people upgrade the kernels, meanwhile it can be run by
anyone who wants to regress dirty ring with a known new host kernel (so
e.g. for migration pull we can run migration-test with any host kernel newer
than 5.11+ and also run with root to cover all test cases there).

Thanks,

-- 
Peter Xu


