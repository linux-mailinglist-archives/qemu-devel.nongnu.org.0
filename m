Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E9253FB10
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 12:19:14 +0200 (CEST)
Received: from localhost ([::1]:52988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyWIq-00038O-Lx
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 06:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyVs3-0002F0-Qh
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:51:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyVs0-00030U-9k
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:51:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654595485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Bb1KhEKiZOEQrDqXd58+dBqDUMn9Hsb1z3XiRWKlrw=;
 b=O8OwXTqOSxUqAEgpqkbPrraUM6Zt4BNQ2LBqIhWV0IGBQbHPZ/fmzCYwTu5Lch7u9bqYcF
 Avv/JtdDSEDQqYDeTvFVGfnkl0Zl8LBKpOaFd0Nwr3kYJv+Omda9SBNBCiwscM1NVtRGmX
 G/S0xMD/91gSUh/33tvUJwZNo0O+WNI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-k5Qg_5DVPCyPdi5mTiYwQQ-1; Tue, 07 Jun 2022 05:51:23 -0400
X-MC-Unique: k5Qg_5DVPCyPdi5mTiYwQQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 cy18-20020a0564021c9200b0042dc7b4f36fso12287829edb.4
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 02:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Bb1KhEKiZOEQrDqXd58+dBqDUMn9Hsb1z3XiRWKlrw=;
 b=WJwTHuSDK+nlNKdHMCknOGm8WYGXBzEY3T1GkeHhPjCTWW6055CdHLwkuXcc692VmY
 UnrqtXf8sk/1POywGZ6z3tWZ5NjnyPIBaNwkUi7SOitDF1tc7fjKjoAZFwxby11wh8J6
 MDfBqJ6sBsATldWud3jlWFbZDQefQeA1yT5ypXvbmNEcT5wKmvKhdEakOiDm477b7prw
 UsgtMJ7LOjmVOAvUBZwDI71Nremd16W3pY6m6CFgNxQ2Bii5WmN4QmHYtO431ciFBOrH
 hgz1xd0z7NQdQufHzLm7i29TfBmWX2FcorbILg5MpEanuO9cGLD9Q1+MrVqR2Q+MsI0m
 ZDQw==
X-Gm-Message-State: AOAM533l65f0nE3GW4yT8oWhHPF00uqnD6O4FCk+TfFBSqD6v48gLTLr
 95q8hh+1FUDdA1bgzcwMROloDRVmD72vhjmZXRfQdOzr8LPHvGXK50UwS85pBCbB+R53bcg3lGo
 uZ9g2rX9yNPsz6vU=
X-Received: by 2002:a17:906:58cf:b0:711:7acb:821f with SMTP id
 e15-20020a17090658cf00b007117acb821fmr12724000ejs.588.1654595482572; 
 Tue, 07 Jun 2022 02:51:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXSqr0gw6SukPmJvEHvN9b2RK9xeop1IvTmvaGR3YGtg8umGCbZ0Ks5TfXAyRg4CnNMmHsIw==
X-Received: by 2002:a17:906:58cf:b0:711:7acb:821f with SMTP id
 e15-20020a17090658cf00b007117acb821fmr12723975ejs.588.1654595482289; 
 Tue, 07 Jun 2022 02:51:22 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b0070776750bc5sm7304902ejc.109.2022.06.07.02.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 02:51:21 -0700 (PDT)
Date: Tue, 7 Jun 2022 11:51:20 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 1/5] hw/smbios: add core_count2 to smbios table type 4
Message-ID: <20220607115120.47084ee3@redhat.com>
In-Reply-To: <CAMDeoFU=BLqbD3H3RWY_QYqkP1MioM96coJ69Q6b7v0BsgjnmA@mail.gmail.com>
References: <20220527165651.28092-1-jusual@redhat.com>
 <20220527165651.28092-2-jusual@redhat.com>
 <alpine.DEB.2.22.394.2205280950260.153682@anisinha-lenovo>
 <CAMDeoFUdUXs++V7yoDcaMTSdxD4BJAhQbFr7p_pSbymJM=5nHg@mail.gmail.com>
 <20220602163125.59794556@redhat.com>
 <20220602163549.45e83221@redhat.com>
 <CAMDeoFU=BLqbD3H3RWY_QYqkP1MioM96coJ69Q6b7v0BsgjnmA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Mon, 6 Jun 2022 13:11:36 +0200
Julia Suvorova <jusual@redhat.com> wrote:

> On Thu, Jun 2, 2022 at 4:35 PM Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > On Thu, 2 Jun 2022 16:31:25 +0200
> > Igor Mammedov <imammedo@redhat.com> wrote:
> >  
> > > On Tue, 31 May 2022 14:40:15 +0200
> > > Julia Suvorova <jusual@redhat.com> wrote:
> > >  
> > > > On Sat, May 28, 2022 at 6:34 AM Ani Sinha <ani@anisinha.ca> wrote:  
> > > > >
> > > > >
> > > > >
> > > > > On Fri, 27 May 2022, Julia Suvorova wrote:
> > > > >  
> > > > > > In order to use the increased number of cpus, we need to bring smbios
> > > > > > tables in line with the SMBIOS 3.0 specification. This allows us to
> > > > > > introduce core_count2 which acts as a duplicate of core_count if we have
> > > > > > fewer cores than 256, and contains the actual core number per socket if
> > > > > > we have more.
> > > > > >
> > > > > > core_enabled2 and thread_count2 fields work the same way.
> > > > > >
> > > > > > Signed-off-by: Julia Suvorova <jusual@redhat.com>  
> > > > >
> > > > > Other than the comment below,
> > > > > Reviewed-by: Ani Sinha <ani@anisinha.ca>
> > > > >  
> > > > > > ---
> > > > > >  include/hw/firmware/smbios.h |  3 +++
> > > > > >  hw/smbios/smbios.c           | 11 +++++++++--
> > > > > >  2 files changed, 12 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
> > > > > > index 4b7ad77a44..c427ae5558 100644
> > > > > > --- a/include/hw/firmware/smbios.h
> > > > > > +++ b/include/hw/firmware/smbios.h
> > > > > > @@ -187,6 +187,9 @@ struct smbios_type_4 {
> > > > > >      uint8_t thread_count;
> > > > > >      uint16_t processor_characteristics;
> > > > > >      uint16_t processor_family2;
> > > > > > +    uint16_t core_count2;
> > > > > > +    uint16_t core_enabled2;
> > > > > > +    uint16_t thread_count2;  
> >
> > on the other hand,
> > is it ok unconditionally extend type 4 and use v3 structure
> > if qemu was started with v2 smbios?  
> 
> We have a flag for the entry point type, not the smbios version per
> se. Additional fields added to structures were not previously tracked
> (for instance, processor_family2 is v2.6 and status is v2.0). AFAIU it
that's a bug, unless there is a very good reason to keep doing that,
I'd not do that.

> can affect only the total table length and the maximum structure size

table length is fixed depending on used version,
so if we follow it, we should set length and use part of structure
correctly if old version is specified (i.e.
   1. old structure + v30 structure,
   2. copy only a relevant part of v30 structure and
      fixup length when v2 version is asked for
though, I'd prefer #1

> (word). But if you like, I can raise an error (warning) if someone
> tries to start a vm with cpus > 255 and smbios v2.

it's a separate thing, I'd error out
(it will break users that use v2 with too may CPUs but then
they should fix their configuration to use v3)

> Best regards, Julia Suvorova.
> 
> > > > >
> > > > > I would add a comment along the lines of
> > > > > /* section 7.5, table 21 smbios spec version 3.0.0 */  
> > > >
> > > > Ok  
> > >
> > > With Ani's comment fixed
> > >
> > > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > >  
> > > >  
> > > > > >  } QEMU_PACKED;
> > > > > >
> > > > > >  /* SMBIOS type 11 - OEM strings */
> > > > > > diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> > > > > > index 60349ee402..45d7be6b30 100644
> > > > > > --- a/hw/smbios/smbios.c
> > > > > > +++ b/hw/smbios/smbios.c
> > > > > > @@ -709,8 +709,15 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
> > > > > >      SMBIOS_TABLE_SET_STR(4, serial_number_str, type4.serial);
> > > > > >      SMBIOS_TABLE_SET_STR(4, asset_tag_number_str, type4.asset);
> > > > > >      SMBIOS_TABLE_SET_STR(4, part_number_str, type4.part);
> > > > > > -    t->core_count = t->core_enabled = ms->smp.cores;
> > > > > > -    t->thread_count = ms->smp.threads;
> > > > > > +
> > > > > > +    t->core_count = (ms->smp.cores > 255) ? 0xFF : ms->smp.cores;
> > > > > > +    t->core_enabled = t->core_count;
> > > > > > +
> > > > > > +    t->core_count2 = t->core_enabled2 = cpu_to_le16(ms->smp.cores);
> > > > > > +
> > > > > > +    t->thread_count = (ms->smp.threads > 255) ? 0xFF : ms->smp.threads;
> > > > > > +    t->thread_count2 = cpu_to_le16(ms->smp.threads);
> > > > > > +
> > > > > >      t->processor_characteristics = cpu_to_le16(0x02); /* Unknown */
> > > > > >      t->processor_family2 = cpu_to_le16(0x01); /* Other */
> > > > > >
> > > > > > --
> > > > > > 2.35.1
> > > > > >
> > > > > >  
> > > > >  
> > > >  
> > >  
> >  
> 


