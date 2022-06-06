Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C98453E42C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 13:15:55 +0200 (CEST)
Received: from localhost ([::1]:56158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyAiA-0004eT-Fo
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 07:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1nyAeG-0002xI-AI
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 07:11:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1nyAeE-0005Hj-H9
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 07:11:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654513909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PPKxuuZBW2WzslCSPdHLg2g4dfteHqfQqyEQn5W5UhQ=;
 b=Qo6QvGm8mkQ7kSoiaH24gMG8if4kX7RmIPCm3IMEUHde10SeBC9Z9cvcA2cXvi734SQ/Sx
 RZ/nrhr4D/Wzfq3bnz5qy9E28wzmAwNVL0BIgjxfkcpXDbqbQC1vIQMGsmQ3X8mZu8meqz
 8srAE2y2U9znjOotAAAjA7QBqFLeWLA=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-o9VfDsoVMuC6wRfCYfc84w-1; Mon, 06 Jun 2022 07:11:48 -0400
X-MC-Unique: o9VfDsoVMuC6wRfCYfc84w-1
Received: by mail-ot1-f69.google.com with SMTP id
 c8-20020a9d67c8000000b0060bf699241cso1426982otn.16
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 04:11:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PPKxuuZBW2WzslCSPdHLg2g4dfteHqfQqyEQn5W5UhQ=;
 b=JKUg2B/FQ0zXAwCqDkl7yJvDrN1Q4hYiaXo20scPGX2O79aHvByzK0G7+X3Gc2DN79
 m3PDtc2eTcuyeOvuQ9kFxFdXCY4a0x0dWUN9DTHJcqxsu/fiFsbvOZKXIK1V9EwlD9r6
 x4HKvmN8M7RQ5F4CfqSfPNsbD3ERqAdrq9niK01FvnCkPE9I+2yM5SE7Jv4B3hxWisuB
 Ot4hC3RgU4e6ixDxcYbDdNWribaOUxIxiuSdfhqcJdiOY67RbEL/NwWulmv9xbx9SkJm
 rI+p9mWVmMi0Yac5ZqRL5BbcdXOXfAMerKQXOWucEb5oeG3PkIGV3//q3/P5sa9oFJps
 OmoA==
X-Gm-Message-State: AOAM533fvAYwA7NNt+Yc7FoTDxSTg8iOXPP1D7HgNG601Cr/3CA2o0g9
 vgYJuo4N46a2xElQsTZihiPRkTyB0zVwxOjrm7zq9cZty06G4zwzTxLobT/soz81N0gG4sQ+jWt
 3RpOIsadjIW63rYXXkNp5U5Ow85dB0dk=
X-Received: by 2002:a9d:c24:0:b0:608:c7a1:5908 with SMTP id
 33-20020a9d0c24000000b00608c7a15908mr10072382otr.88.1654513907822; 
 Mon, 06 Jun 2022 04:11:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYH7fSxdlp4SdT8FLaFaThs2sURouIdIpUOqvKLFUGeU4EUgDi/zFxyCRs8VlOsz7cytb+wtAbTvsLsbeVomY=
X-Received: by 2002:a9d:c24:0:b0:608:c7a1:5908 with SMTP id
 33-20020a9d0c24000000b00608c7a15908mr10072366otr.88.1654513907590; Mon, 06
 Jun 2022 04:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220527165651.28092-1-jusual@redhat.com>
 <20220527165651.28092-2-jusual@redhat.com>
 <alpine.DEB.2.22.394.2205280950260.153682@anisinha-lenovo>
 <CAMDeoFUdUXs++V7yoDcaMTSdxD4BJAhQbFr7p_pSbymJM=5nHg@mail.gmail.com>
 <20220602163125.59794556@redhat.com> <20220602163549.45e83221@redhat.com>
In-Reply-To: <20220602163549.45e83221@redhat.com>
From: Julia Suvorova <jusual@redhat.com>
Date: Mon, 6 Jun 2022 13:11:36 +0200
Message-ID: <CAMDeoFU=BLqbD3H3RWY_QYqkP1MioM96coJ69Q6b7v0BsgjnmA@mail.gmail.com>
Subject: Re: [PATCH 1/5] hw/smbios: add core_count2 to smbios table type 4
To: Igor Mammedov <imammedo@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, QEMU Developers <qemu-devel@nongnu.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>
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

On Thu, Jun 2, 2022 at 4:35 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Thu, 2 Jun 2022 16:31:25 +0200
> Igor Mammedov <imammedo@redhat.com> wrote:
>
> > On Tue, 31 May 2022 14:40:15 +0200
> > Julia Suvorova <jusual@redhat.com> wrote:
> >
> > > On Sat, May 28, 2022 at 6:34 AM Ani Sinha <ani@anisinha.ca> wrote:
> > > >
> > > >
> > > >
> > > > On Fri, 27 May 2022, Julia Suvorova wrote:
> > > >
> > > > > In order to use the increased number of cpus, we need to bring smbios
> > > > > tables in line with the SMBIOS 3.0 specification. This allows us to
> > > > > introduce core_count2 which acts as a duplicate of core_count if we have
> > > > > fewer cores than 256, and contains the actual core number per socket if
> > > > > we have more.
> > > > >
> > > > > core_enabled2 and thread_count2 fields work the same way.
> > > > >
> > > > > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > > >
> > > > Other than the comment below,
> > > > Reviewed-by: Ani Sinha <ani@anisinha.ca>
> > > >
> > > > > ---
> > > > >  include/hw/firmware/smbios.h |  3 +++
> > > > >  hw/smbios/smbios.c           | 11 +++++++++--
> > > > >  2 files changed, 12 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
> > > > > index 4b7ad77a44..c427ae5558 100644
> > > > > --- a/include/hw/firmware/smbios.h
> > > > > +++ b/include/hw/firmware/smbios.h
> > > > > @@ -187,6 +187,9 @@ struct smbios_type_4 {
> > > > >      uint8_t thread_count;
> > > > >      uint16_t processor_characteristics;
> > > > >      uint16_t processor_family2;
> > > > > +    uint16_t core_count2;
> > > > > +    uint16_t core_enabled2;
> > > > > +    uint16_t thread_count2;
>
> on the other hand,
> is it ok unconditionally extend type 4 and use v3 structure
> if qemu was started with v2 smbios?

We have a flag for the entry point type, not the smbios version per
se. Additional fields added to structures were not previously tracked
(for instance, processor_family2 is v2.6 and status is v2.0). AFAIU it
can affect only the total table length and the maximum structure size
(word). But if you like, I can raise an error (warning) if someone
tries to start a vm with cpus > 255 and smbios v2.

Best regards, Julia Suvorova.

> > > >
> > > > I would add a comment along the lines of
> > > > /* section 7.5, table 21 smbios spec version 3.0.0 */
> > >
> > > Ok
> >
> > With Ani's comment fixed
> >
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> >
> > >
> > > > >  } QEMU_PACKED;
> > > > >
> > > > >  /* SMBIOS type 11 - OEM strings */
> > > > > diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> > > > > index 60349ee402..45d7be6b30 100644
> > > > > --- a/hw/smbios/smbios.c
> > > > > +++ b/hw/smbios/smbios.c
> > > > > @@ -709,8 +709,15 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
> > > > >      SMBIOS_TABLE_SET_STR(4, serial_number_str, type4.serial);
> > > > >      SMBIOS_TABLE_SET_STR(4, asset_tag_number_str, type4.asset);
> > > > >      SMBIOS_TABLE_SET_STR(4, part_number_str, type4.part);
> > > > > -    t->core_count = t->core_enabled = ms->smp.cores;
> > > > > -    t->thread_count = ms->smp.threads;
> > > > > +
> > > > > +    t->core_count = (ms->smp.cores > 255) ? 0xFF : ms->smp.cores;
> > > > > +    t->core_enabled = t->core_count;
> > > > > +
> > > > > +    t->core_count2 = t->core_enabled2 = cpu_to_le16(ms->smp.cores);
> > > > > +
> > > > > +    t->thread_count = (ms->smp.threads > 255) ? 0xFF : ms->smp.threads;
> > > > > +    t->thread_count2 = cpu_to_le16(ms->smp.threads);
> > > > > +
> > > > >      t->processor_characteristics = cpu_to_le16(0x02); /* Unknown */
> > > > >      t->processor_family2 = cpu_to_le16(0x01); /* Other */
> > > > >
> > > > > --
> > > > > 2.35.1
> > > > >
> > > > >
> > > >
> > >
> >
>


