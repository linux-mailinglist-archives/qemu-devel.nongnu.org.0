Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9537E53912E
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 14:57:50 +0200 (CEST)
Received: from localhost ([::1]:57144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw1RS-0003Hl-Jd
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 08:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1nw1Ap-0001bE-Fg
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:40:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1nw1Ak-0008Gy-0z
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:40:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654000829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rTgPHJU4xS0a8jZOTVpRMvabXNBlnMo6EI8KEu+JviE=;
 b=G9UYRdsBoLysE92FYg6AZ9e3m5+sEeOHEy5ewKmkVTGsliKgogNI0n39tFTJRKXLSJi3Bl
 PE0OXNtCkHgMn+rMml9CnRZLZkhtQS8MWGh2mu9EufIywQP5SHPXf05h8Yyg3R2BGHYnhV
 gUhCkduen7tw80C4ARWUxo+NLKUWdzY=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-SqMv7OXnPQu1pjdgHPhtKg-1; Tue, 31 May 2022 08:40:28 -0400
X-MC-Unique: SqMv7OXnPQu1pjdgHPhtKg-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-e2b879af65so9330593fac.20
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 05:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rTgPHJU4xS0a8jZOTVpRMvabXNBlnMo6EI8KEu+JviE=;
 b=Ssqd/vh1sGz1tvNZyTIAJ7XKt1N6PGWkD3Q3anMpyAFwJWox0WLEUJXePdqbL6uJrs
 n9kR6OrH1BweN84OE8Yp4fQMfLPnPXRtJz9Zbe/T8qeMXcLP+zvevyKwhRLxZyz70Ff6
 Z2o+lSKm27KWz1/t+kmFbUAQWpYARv6f+42SWpg678MiljGgEBRna9+tH665fjfpgRt0
 wlFeTgqaTQvk+oIwtZ2se11/ViGwHKcxHsn0Alnd8zruPcmP9tLfCpHhq0Oj7BR+aDPH
 bIFHEVLeQkvLO2SDL9uj3yazqiNyCLHkfQqZ9348giTP+bjlPMQvYjpzYEEJUPUXV5N2
 d7LA==
X-Gm-Message-State: AOAM531I66T7kLbX8Q3g7NEaSphfgqPHDKlxc7CJVGh15iIJ+Yi66QaQ
 Mrkei8Iey7Z8hWH4rT/FjEy7FySFyOA/tAw37wRIhhqsqfQuMjqYIiozwFQQI45mdMWnJQiYbjO
 miTr9FIdV2+9fIqbjn7l2DAXHM2NCk8E=
X-Received: by 2002:a05:6808:1a1d:b0:32b:c730:7c7e with SMTP id
 bk29-20020a0568081a1d00b0032bc7307c7emr12041170oib.251.1654000826281; 
 Tue, 31 May 2022 05:40:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLIZLb81OwEwcFOtcEM9cQd4FPHpYm02fVjMh251pbYyHeti/D3EFVBz77eGWbTIK0a1GrhLKWs+cgd1NKUOM=
X-Received: by 2002:a05:6808:1a1d:b0:32b:c730:7c7e with SMTP id
 bk29-20020a0568081a1d00b0032bc7307c7emr12041161oib.251.1654000826100; Tue, 31
 May 2022 05:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220527165651.28092-1-jusual@redhat.com>
 <20220527165651.28092-2-jusual@redhat.com>
 <alpine.DEB.2.22.394.2205280950260.153682@anisinha-lenovo>
In-Reply-To: <alpine.DEB.2.22.394.2205280950260.153682@anisinha-lenovo>
From: Julia Suvorova <jusual@redhat.com>
Date: Tue, 31 May 2022 14:40:15 +0200
Message-ID: <CAMDeoFUdUXs++V7yoDcaMTSdxD4BJAhQbFr7p_pSbymJM=5nHg@mail.gmail.com>
Subject: Re: [PATCH 1/5] hw/smbios: add core_count2 to smbios table type 4
To: Ani Sinha <ani@anisinha.ca>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsuvorov@redhat.com;
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

On Sat, May 28, 2022 at 6:34 AM Ani Sinha <ani@anisinha.ca> wrote:
>
>
>
> On Fri, 27 May 2022, Julia Suvorova wrote:
>
> > In order to use the increased number of cpus, we need to bring smbios
> > tables in line with the SMBIOS 3.0 specification. This allows us to
> > introduce core_count2 which acts as a duplicate of core_count if we have
> > fewer cores than 256, and contains the actual core number per socket if
> > we have more.
> >
> > core_enabled2 and thread_count2 fields work the same way.
> >
> > Signed-off-by: Julia Suvorova <jusual@redhat.com>
>
> Other than the comment below,
> Reviewed-by: Ani Sinha <ani@anisinha.ca>
>
> > ---
> >  include/hw/firmware/smbios.h |  3 +++
> >  hw/smbios/smbios.c           | 11 +++++++++--
> >  2 files changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
> > index 4b7ad77a44..c427ae5558 100644
> > --- a/include/hw/firmware/smbios.h
> > +++ b/include/hw/firmware/smbios.h
> > @@ -187,6 +187,9 @@ struct smbios_type_4 {
> >      uint8_t thread_count;
> >      uint16_t processor_characteristics;
> >      uint16_t processor_family2;
> > +    uint16_t core_count2;
> > +    uint16_t core_enabled2;
> > +    uint16_t thread_count2;
>
> I would add a comment along the lines of
> /* section 7.5, table 21 smbios spec version 3.0.0 */

Ok

> >  } QEMU_PACKED;
> >
> >  /* SMBIOS type 11 - OEM strings */
> > diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> > index 60349ee402..45d7be6b30 100644
> > --- a/hw/smbios/smbios.c
> > +++ b/hw/smbios/smbios.c
> > @@ -709,8 +709,15 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
> >      SMBIOS_TABLE_SET_STR(4, serial_number_str, type4.serial);
> >      SMBIOS_TABLE_SET_STR(4, asset_tag_number_str, type4.asset);
> >      SMBIOS_TABLE_SET_STR(4, part_number_str, type4.part);
> > -    t->core_count = t->core_enabled = ms->smp.cores;
> > -    t->thread_count = ms->smp.threads;
> > +
> > +    t->core_count = (ms->smp.cores > 255) ? 0xFF : ms->smp.cores;
> > +    t->core_enabled = t->core_count;
> > +
> > +    t->core_count2 = t->core_enabled2 = cpu_to_le16(ms->smp.cores);
> > +
> > +    t->thread_count = (ms->smp.threads > 255) ? 0xFF : ms->smp.threads;
> > +    t->thread_count2 = cpu_to_le16(ms->smp.threads);
> > +
> >      t->processor_characteristics = cpu_to_le16(0x02); /* Unknown */
> >      t->processor_family2 = cpu_to_le16(0x01); /* Other */
> >
> > --
> > 2.35.1
> >
> >
>


