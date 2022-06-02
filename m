Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 859ED53BACA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 16:32:40 +0200 (CEST)
Received: from localhost ([::1]:35494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwlsN-0007TP-5d
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 10:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nwlrN-0006ms-45
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 10:31:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nwlrK-0005l0-BK
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 10:31:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654180292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AxYmkXRoOCTJf8CRBdxK8aoYG5aZQTl2RpuuWJWl3aw=;
 b=aBw+Nbd2qnU42YVRento9asHLFuN+M8OhurBGRJVN34zTZJxzeTf3gdLAjF3VugQF829up
 uVjOeAhYls4KaxVGkvcaGausbR9kl4tgflawgtogsSMjr+UyCS/P3zfKsVjK9IN0OVyeYd
 R8p/jrx3TQ9SNmAtCRjJLKkG0ONTjvc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-3Go6D5OyOKqdLkEcYMFCoA-1; Thu, 02 Jun 2022 10:31:29 -0400
X-MC-Unique: 3Go6D5OyOKqdLkEcYMFCoA-1
Received: by mail-ed1-f70.google.com with SMTP id
 q29-20020a056402249d00b0042d90fd98deso3609935eda.12
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 07:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AxYmkXRoOCTJf8CRBdxK8aoYG5aZQTl2RpuuWJWl3aw=;
 b=36fy1bZT2HnL1ysfA+hxgAzinzrf7SzkSQ/X65D8Xe5BPtXhKTyZCQsvJc+PdFowLA
 sSu4nleSqYrQh7ETwwvz6LQEyEF/MV9uC7IXeN8u8yl0LiHQRTozqB8xjb+ld6dyx1QP
 chKS0b2oNZAUgs4VsLPFZnNJepTPb98xbvf9TTDdDRcHBI6wxBU3qegCONjDMSwFLaeK
 UZA+dHkjINiBE1633XgcvEj2MjcV4deLnmw6lVb+EYVDnhEzcwnYBI1rcug9neQ0BLrR
 LWmcgBLyoxvSx25gtcFU1jADBVCUO6NIlqzw9AVwY0fG+nQLLGMpJWOpCAaS8gXEy0be
 whYw==
X-Gm-Message-State: AOAM531mrbBGRMhCuLD9zgj1oQEl+Jujw6B5B4lioNWpZs1H4fYx/RYB
 LlDO9+lPK3Xb8lypJwPvuRHfuFORD9JO6l59GQKF2KAALJHhWalwDq/A+A5j1iBRD/uAPbar1fw
 hSnvWV/neskmicL8=
X-Received: by 2002:a17:907:d02:b0:6fe:c272:f8e with SMTP id
 gn2-20020a1709070d0200b006fec2720f8emr4476166ejc.444.1654180288177; 
 Thu, 02 Jun 2022 07:31:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcYJr0cZQTDdKIaXMMz3HrAcKfWhhIK1pmhIqgYiwCrzAgLj9Zab8gPTWZf0RSCMq9+ntE/Q==
X-Received: by 2002:a17:907:d02:b0:6fe:c272:f8e with SMTP id
 gn2-20020a1709070d0200b006fec2720f8emr4476148ejc.444.1654180287896; 
 Thu, 02 Jun 2022 07:31:27 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709067b8400b006f3ef214ddfsm14221ejo.69.2022.06.02.07.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 07:31:27 -0700 (PDT)
Date: Thu, 2 Jun 2022 16:31:25 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 1/5] hw/smbios: add core_count2 to smbios table type 4
Message-ID: <20220602163125.59794556@redhat.com>
In-Reply-To: <CAMDeoFUdUXs++V7yoDcaMTSdxD4BJAhQbFr7p_pSbymJM=5nHg@mail.gmail.com>
References: <20220527165651.28092-1-jusual@redhat.com>
 <20220527165651.28092-2-jusual@redhat.com>
 <alpine.DEB.2.22.394.2205280950260.153682@anisinha-lenovo>
 <CAMDeoFUdUXs++V7yoDcaMTSdxD4BJAhQbFr7p_pSbymJM=5nHg@mail.gmail.com>
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

On Tue, 31 May 2022 14:40:15 +0200
Julia Suvorova <jusual@redhat.com> wrote:

> On Sat, May 28, 2022 at 6:34 AM Ani Sinha <ani@anisinha.ca> wrote:
> >
> >
> >
> > On Fri, 27 May 2022, Julia Suvorova wrote:
> >  
> > > In order to use the increased number of cpus, we need to bring smbios
> > > tables in line with the SMBIOS 3.0 specification. This allows us to
> > > introduce core_count2 which acts as a duplicate of core_count if we have
> > > fewer cores than 256, and contains the actual core number per socket if
> > > we have more.
> > >
> > > core_enabled2 and thread_count2 fields work the same way.
> > >
> > > Signed-off-by: Julia Suvorova <jusual@redhat.com>  
> >
> > Other than the comment below,
> > Reviewed-by: Ani Sinha <ani@anisinha.ca>
> >  
> > > ---
> > >  include/hw/firmware/smbios.h |  3 +++
> > >  hw/smbios/smbios.c           | 11 +++++++++--
> > >  2 files changed, 12 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
> > > index 4b7ad77a44..c427ae5558 100644
> > > --- a/include/hw/firmware/smbios.h
> > > +++ b/include/hw/firmware/smbios.h
> > > @@ -187,6 +187,9 @@ struct smbios_type_4 {
> > >      uint8_t thread_count;
> > >      uint16_t processor_characteristics;
> > >      uint16_t processor_family2;
> > > +    uint16_t core_count2;
> > > +    uint16_t core_enabled2;
> > > +    uint16_t thread_count2;  
> >
> > I would add a comment along the lines of
> > /* section 7.5, table 21 smbios spec version 3.0.0 */  
> 
> Ok

With Ani's comment fixed 

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> > >  } QEMU_PACKED;
> > >
> > >  /* SMBIOS type 11 - OEM strings */
> > > diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> > > index 60349ee402..45d7be6b30 100644
> > > --- a/hw/smbios/smbios.c
> > > +++ b/hw/smbios/smbios.c
> > > @@ -709,8 +709,15 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
> > >      SMBIOS_TABLE_SET_STR(4, serial_number_str, type4.serial);
> > >      SMBIOS_TABLE_SET_STR(4, asset_tag_number_str, type4.asset);
> > >      SMBIOS_TABLE_SET_STR(4, part_number_str, type4.part);
> > > -    t->core_count = t->core_enabled = ms->smp.cores;
> > > -    t->thread_count = ms->smp.threads;
> > > +
> > > +    t->core_count = (ms->smp.cores > 255) ? 0xFF : ms->smp.cores;
> > > +    t->core_enabled = t->core_count;
> > > +
> > > +    t->core_count2 = t->core_enabled2 = cpu_to_le16(ms->smp.cores);
> > > +
> > > +    t->thread_count = (ms->smp.threads > 255) ? 0xFF : ms->smp.threads;
> > > +    t->thread_count2 = cpu_to_le16(ms->smp.threads);
> > > +
> > >      t->processor_characteristics = cpu_to_le16(0x02); /* Unknown */
> > >      t->processor_family2 = cpu_to_le16(0x01); /* Other */
> > >
> > > --
> > > 2.35.1
> > >
> > >  
> >  
> 


