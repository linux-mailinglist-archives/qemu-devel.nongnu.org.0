Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA24434892
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:08:02 +0200 (CEST)
Received: from localhost ([::1]:53210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md8Vs-0000Ms-Cz
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8SH-00062s-Iv
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:04:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8SF-0002RF-J2
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:04:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634724255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0asX/LIiyEZCJeCGjmvKvPU3uZwMWTG+h7gxhqUSxu0=;
 b=i/n3idonv6EzYdEGb3oUDcBXSFh6nBTykdfAiOwKcimL9JGrUrlnCMCIzx/L55XQFqIGTe
 JaGdwFl1W1euIy6DKEnpwdqhqIkJqpTtGj3p39yUbmyKxD6a+LuKGZXIdkEl83sxeQNsZd
 5esoIhmBuAWB84irqTg9YeDPr7qwI3U=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-3T7OZ-_dPlOWBSGxeVTXFQ-1; Wed, 20 Oct 2021 06:04:13 -0400
X-MC-Unique: 3T7OZ-_dPlOWBSGxeVTXFQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 l10-20020a056402230a00b003db6977b694so20467372eda.23
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0asX/LIiyEZCJeCGjmvKvPU3uZwMWTG+h7gxhqUSxu0=;
 b=6iSAQox9Q09/RI3UO4OOV5VUBqfHkWOWLoMH4XJAmcOXTrwmnu97TSons+8MzefEkJ
 yBO0T6A9HxpNqaSFoFArWmj/du+bVqDautAmL50k7cP4pWh6BoLiVpKiLHm43sXDwi0Q
 k8EXlVIxNTIJuAIiB03XAm0EgMq7Zp5uD4rI5KzAtg4jqkFoWMOPB8HHkWASrom0q3bE
 TjrFD2OVCs4ymoyp0NUgbjcFD4Nn1IZ/Mnkjm1b+vkqtM74h3CzX8iMhkRpTGgaiaVMq
 /nkAjT3eskSZl3YdserociHQBwAI51JoAHPD5KjErWDTNGm4S/OMROGfnSIdXRdjX06g
 yovg==
X-Gm-Message-State: AOAM533OkiFF/joTWmRVJzbR2K8PogjsKAt/XvyJB6f3O6sCDaFHZFzr
 R251BSXmLTY3L8738g36Uaur3f4R0/EJu+azds2pOZ9valxcYFILJrLomNmLirQ5Krgt+P6FT4v
 RjRBEpaevNL6wNuc=
X-Received: by 2002:a17:906:c248:: with SMTP id
 bl8mr43503388ejb.360.1634724252487; 
 Wed, 20 Oct 2021 03:04:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRJgKwg3/iAhq2OQ4aD8sLKmw3bNLYQPz+l97K5fPhikYyrVS3qr2Dc0uISWmj1E8cdCjeiQ==
X-Received: by 2002:a17:906:c248:: with SMTP id
 bl8mr43503349ejb.360.1634724252140; 
 Wed, 20 Oct 2021 03:04:12 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id b22sm926544edj.83.2021.10.20.03.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:04:11 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:04:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [PATCH v8 4/8] hw/acpi/aml-build: Add Processor hierarchy node
 structure
Message-ID: <20211020060349-mutt-send-email-mst@kernel.org>
References: <20211014132206.19220-1-wangyanan55@huawei.com>
 <20211014132206.19220-5-wangyanan55@huawei.com>
 <3089e3c8-0eb0-3360-357d-4ba82ede8952@redhat.com>
 <f8f361b6-33b5-6314-cf07-e71efe8e362e@huawei.com>
MIME-Version: 1.0
In-Reply-To: <f8f361b6-33b5-6314-cf07-e71efe8e362e@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Eric Auger <eauger@redhat.com>, wanghaibin.wang@huawei.com,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 20, 2021 at 05:51:46PM +0800, wangyanan (Y) wrote:
> 
> On 2021/10/20 15:43, Eric Auger wrote:
> > Hi
> > 
> > On 10/14/21 3:22 PM, Yanan Wang wrote:
> > > Add a generic API to build Processor hierarchy node structure (Type 0),
> > > which is strictly consistent with descriptions in ACPI 6.2: 5.2.29.1.
> > > 
> > > This function will be used to build ACPI PPTT table for cpu topology.
> > > 
> > > Co-developed-by: Ying Fang <fangying1@huawei.com>
> > > Co-developed-by: Henglong Fan <fanhenglong@huawei.com>
> > > Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
> > > Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> > > Reviewed-by: Andrew Jones <drjones@redhat.com>
> > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > ---
> > >   hw/acpi/aml-build.c         | 26 ++++++++++++++++++++++++++
> > >   include/hw/acpi/aml-build.h |  4 ++++
> > >   2 files changed, 30 insertions(+)
> > > 
> > > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > > index 76af0ebaf9..b7b9db6888 100644
> > > --- a/hw/acpi/aml-build.c
> > > +++ b/hw/acpi/aml-build.c
> > > @@ -1964,6 +1964,32 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
> > >       acpi_table_end(linker, &table);
> > >   }
> > > +/* ACPI 6.2: 5.2.29.1 Processor hierarchy node structure (Type 0) */
> > > +void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
> > > +                                    uint32_t parent, uint32_t id,
> > > +                                    uint32_t *priv_rsrc, uint32_t priv_num)
> > > +{
> > > +    int i;
> > > +
> > > +    build_append_byte(tbl, 0);                 /* Type 0 - processor */
> > nit: I think Igor would generally prefer
> > build_append_byte(tbl, 0 /* processor structure */);  /* Type */
> > although it generates checkpatch warnings
> Ok.

I think it's ok as is. Right Igor?

> > 
> > > +    build_append_byte(tbl, 20 + priv_num * 4); /* Length */
> > > +    build_append_int_noprefix(tbl, 0, 2);      /* Reserved */
> > > +    build_append_int_noprefix(tbl, flags, 4);  /* Flags */
> > > +    build_append_int_noprefix(tbl, parent, 4); /* Parent */
> > > +    build_append_int_noprefix(tbl, id, 4);     /* ACPI Processor ID */
> > > +
> > > +    /* Number of private resources */
> > > +    build_append_int_noprefix(tbl, priv_num, 4);
> > > +
> > > +    /* Private resources[N] */
> > > +    if (priv_num > 0) {
> > > +        assert(priv_rsrc);
> > > +        for (i = 0; i < priv_num; i++) {
> > > +            build_append_int_noprefix(tbl, priv_rsrc[i], 4);
> > > +        }
> > > +    }
> > > +}
> > > +
> > >   /* build rev1/rev3/rev5.1 FADT */
> > >   void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
> > >                   const char *oem_id, const char *oem_table_id)
> > > diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> > > index 3cf6f2c1b9..2c457c8f17 100644
> > > --- a/include/hw/acpi/aml-build.h
> > > +++ b/include/hw/acpi/aml-build.h
> > > @@ -489,6 +489,10 @@ void build_srat_memory(GArray *table_data, uint64_t base,
> > >   void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
> > >                   const char *oem_id, const char *oem_table_id);
> > > +void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
> > > +                                    uint32_t parent, uint32_t id,
> > > +                                    uint32_t *priv_rsrc, uint32_t priv_num);
> > > +
> > >   void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
> > >                   const char *oem_id, const char *oem_table_id);
> > > 
> > Besides
> > Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Thanks for your review!
> 
> Yanan
> .
> > 
> > Eric
> > 
> > .


