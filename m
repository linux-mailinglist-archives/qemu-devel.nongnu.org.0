Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5A15F2C7A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 10:53:40 +0200 (CEST)
Received: from localhost ([::1]:45886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofHCk-00033s-TQ
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 04:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ofH4Q-0007Cg-Ue
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 04:45:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ofH4M-0002ca-IN
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 04:45:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664786696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1vKOWjRJ+AmUK0WmSTSwHBRb7yL24oPxr4qBWAjue4c=;
 b=PbAofXfSbZtV/qMwD7EVOZeCb7XdUyVoJC998gc8n6elwnd8NpcRw09WRnhvc2W4IvVzhV
 4hyd3Tm5LkUBHJctFGfZZFtIgENPGqyXMqL/0T++D2JZ1/Wqe/G/8glU+jm5wrO3YigmfI
 P2MVqxkg7/7gZhPZ2RxizLHAmuDEOv8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-96-8A6V8eT-M86eK_zeKBW-Mw-1; Mon, 03 Oct 2022 04:44:53 -0400
X-MC-Unique: 8A6V8eT-M86eK_zeKBW-Mw-1
Received: by mail-wm1-f72.google.com with SMTP id
 c130-20020a1c3588000000b003b56be513e1so6009123wma.0
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 01:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=1vKOWjRJ+AmUK0WmSTSwHBRb7yL24oPxr4qBWAjue4c=;
 b=Mb2M9FIaXm8ff8UgEqDFYt1pp82AqfZ/MeAespjxW86WcLGizSjUtFS9iKSOFg/a1N
 5GOoJHgKPK8NCHpAgYxb0rwts6eag8SLa5bLFC9h4F0ONJVplANEYoeMiPC3oqX5Ejbw
 jse3gmMfrfqiPr6ZLQlkZLE9cqWZii/n3qcH3AUoVm7tbRxl4sCUKdatHC+6FpZSff78
 1skxc8QHQLPG99rV3B3Fzvq5C549Z85SssidCyRleefxV6ZsPcEAnLG2WhCg8YTld3NW
 TOSFyNTXldwTmJNk2v3YdjbzXoTtsCu6x3YsHGLL8JEKKvybQV2OkLUFjMTb0UlsUgFC
 XE9Q==
X-Gm-Message-State: ACrzQf2O/nTxAzVG7aIqSylNbZqcRbF8YPcGVDVayKeLwPUHMs8OfdFr
 0wfMv2kcr69ejx4p8GfbgyVV3vn5T7b41+iwkbVU8fhVmWdx2WgxjlJdgVjKG35k2C5ex2dmoB+
 hqpQtaLNyhGnRuHw=
X-Received: by 2002:a05:6000:c9:b0:22e:4055:559c with SMTP id
 q9-20020a05600000c900b0022e4055559cmr1374222wrx.438.1664786691863; 
 Mon, 03 Oct 2022 01:44:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6T1VezPF54jV+Zv61OrxEbosPkRfGpnu3t0aFbtZHQzxw15jUbxWQ8QEtO6jzYBd/hDehr7g==
X-Received: by 2002:a05:6000:c9:b0:22e:4055:559c with SMTP id
 q9-20020a05600000c900b0022e4055559cmr1374202wrx.438.1664786691601; 
 Mon, 03 Oct 2022 01:44:51 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 j13-20020a5d452d000000b00228a6ce17b4sm9242095wra.37.2022.10.03.01.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 01:44:51 -0700 (PDT)
Date: Mon, 3 Oct 2022 09:44:49 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Palmer Dabbelt <palmer@rivosinc.com>, alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] RISC-V: Add support for Ztso
Message-ID: <YzqhAdsGwC0so55O@work-vm>
References: <YzXvIKVeFcHQ3ZQI@work-vm>
 <mhng-36837e18-1883-443f-85a7-69010d5d38ef@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-36837e18-1883-443f-85a7-69010d5d38ef@palmer-ri-x1c9>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Palmer Dabbelt (palmer@rivosinc.com) wrote:
> On Thu, 29 Sep 2022 12:16:48 PDT (-0700), dgilbert@redhat.com wrote:
> > * Palmer Dabbelt (palmer@rivosinc.com) wrote:
> > > Ztso, the RISC-V extension that provides the TSO memory model, was
> > > recently frozen.  This provides support for Ztso on targets that are
> > > themselves TSO.
> > > 
> > > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > 
> > > ---
> > > 
> > 
> > > diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
> > > index 00fcbe297d..2a43d54fcd 100644
> > > --- a/tcg/i386/tcg-target.h
> > > +++ b/tcg/i386/tcg-target.h
> > > @@ -236,6 +236,7 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
> > >  #include "tcg/tcg-mo.h"
> > > 
> > >  #define TCG_TARGET_DEFAULT_MO (TCG_MO_ALL & ~TCG_MO_ST_LD)
> > > +#define TCG_TARGET_SUPPORTS_MCTCG_RVTSO 1
> > 
> > Is x86's brand of memory ordering strong enough for Ztso?
> > I thought x86 had an optimisation where it was allowed to store forward
> > within the current CPU causing stores not to be quite strictly ordered.
> 
> I'm actually not sure: my understanding of the Intel memory model was that
> there's a bunch of subtle bits that don't match the various TSO
> formalizations, but the RISC-V folks are pretty adamant that Intel is
> exactly TSO.  I've gotten yelled at enough times on this one that I kind of
> just stopped caring, but that's not a good reason to have broken code so I'm
> happy to go fix it.

Many people make that mistake, please refer them to the Intel docs; the
big 'Intel 64 and IA-32 Architecture Software Developer's Manual,
Combined Volumes: 1,2A, 2B, 2C, 2D, 3A, 3B, 3C, 3D and 4'; in the recent
version I've got (April 2022) section 8.2 covers memory ordering and
8.2.2 Memory Ordering in P6 and More Recent Processor Families says on
page 8-7 (page 3090 ish):

  In a multiple-processor system, the following ordering principles apply:
....
  Writes from an individual processor are NOT ordered with respect to the writes from other processors.
....
  Any two stores are seen in a consistent order by processors other than those performing the stores

then a bit further down, '8.2.3.5 Intra-Processor Forwarding Is Allowed'
has an example and says

    'The memory-ordering model allows concurrent stores by two processors to be seen in
    different orders by those two processors; specifically, each processor may perceive
    its own store occurring before that of the other.'

Having said that, I remember it's realyl difficult to trigger; it's ~10
years since I saw an example to trigger it, and can't remember it.

> That said, when putting together the v2 (which has TCG barriers in the
> RISC-V front-end) I couldn't even really figure out how the TCG memory model
> works in any formal capacity -- I essentially just added the fences
> necessary for Ztso on RVWMO, but that's not a good proxy for Ztso on arm64
> (and I guess not on x86, either).  Also happy to go take a crack at that
> one, but I'm not really a formal memory model person so it might not be the
> best result.

Oh I don't know TCG's model, copying in Alex.

Dave

> > 
> > Dave
> > 
> > >  #define TCG_TARGET_HAS_MEMORY_BSWAP  have_movbe
> > > 
> > > diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
> > > index 23e2063667..f423c124a0 100644
> > > --- a/tcg/s390x/tcg-target.h
> > > +++ b/tcg/s390x/tcg-target.h
> > > @@ -171,6 +171,7 @@ extern uint64_t s390_facilities[3];
> > >  #define TCG_TARGET_HAS_MEMORY_BSWAP   1
> > > 
> > >  #define TCG_TARGET_DEFAULT_MO (TCG_MO_ALL & ~TCG_MO_ST_LD)
> > > +#define TCG_TARGET_SUPPORTS_MCTCG_RVTSO 1
> > > 
> > >  static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
> > >                                              uintptr_t jmp_rw, uintptr_t addr)
> > > --
> > > 2.34.1
> > > 
> > > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


