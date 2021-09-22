Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F052414B41
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 15:59:52 +0200 (CEST)
Received: from localhost ([::1]:57232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT2mt-0006so-Am
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 09:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mT2lr-0006CS-Gw
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:58:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mT2lp-0002yi-97
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:58:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632319124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xq9+pcDT6EALWycwghcTGMxEMDt6aJIwJLFDXpR98lc=;
 b=Ek8EpPQ9Qf8Dbbg3J0YOmbX+3fg/XZcHPfBl8S6LGYsKCV2hWMsRvZysybPxtaM2RjeYhj
 eLKLDusbcsWAtvU4/BzxJp0UsPs/H3sWrTnRQhdO3ApmPKsRFlBJzjBhKr9MiqUEdpUK/t
 NSWTj3p7pzKmqryVOEILwq1v8LNqnyg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-5DlB8M3PMxWcFeZE_QoJIQ-1; Wed, 22 Sep 2021 09:58:43 -0400
X-MC-Unique: 5DlB8M3PMxWcFeZE_QoJIQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 o18-20020a056402439200b003d2b11eb0a9so3104408edc.23
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 06:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xq9+pcDT6EALWycwghcTGMxEMDt6aJIwJLFDXpR98lc=;
 b=g3L2IjmqgS+IGrYmmWNWD+ASLXGGxPt0u2lRBVMYoqupVgQ0TQdabuzLn1GMQ/3ek5
 iQXi5Ct6Bt71EahumYAvTyFwHSc6RJqmoQnVrnM86KGz/0OWC2egRmFb+ItoEmStstig
 X7W3KUbKK3z01OByDKE0dmqiPbLRgvcId3wJ+GhNn5fRQbU3V4iRHXTgunoiWkzzoyHj
 hGBD8Q1oTYk/2GsquqAHGmEafnGGVaV0Y1ZRTaf1w5t/cyi+zUBOURgIgMa35VYzGC/E
 1oiy/9SUpaQ7KEHg7SG/UoVPYfQ2lAV2IAj7GrfROdXSakkmzunguDf2C2apLRCoWV/r
 Y/Ew==
X-Gm-Message-State: AOAM530LAVGdK4lvrX1XNuhsLNVMoXryMes6+COPIcFSthsLIFqqOnNs
 124huOYq82GhbqGOVJfpzRbpadptY14Lmd4KGcv7w6gfesG/+kCmzVRIEWDKEnWnt5n91sd/WyQ
 K0RC4nLSBlENg8cw=
X-Received: by 2002:a17:907:10c8:: with SMTP id
 rv8mr40706769ejb.280.1632319121527; 
 Wed, 22 Sep 2021 06:58:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUjfJMyEKp0kH8KtY1pEmih5yXT9AsORz0hyVy5NwzoLf4ijhOdrJQ0yvf/CVFp+/D524tpQ==
X-Received: by 2002:a17:907:10c8:: with SMTP id
 rv8mr40706753ejb.280.1632319121361; 
 Wed, 22 Sep 2021 06:58:41 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id bw25sm1133301ejb.20.2021.09.22.06.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 06:58:40 -0700 (PDT)
Date: Wed, 22 Sep 2021 15:58:39 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eauger@redhat.com>
Subject: Re: [PATCH v3 33/35] acpi: build_facs: use
 build_append_int_noprefix() API to compose table
Message-ID: <20210922155839.7153d145@redhat.com>
In-Reply-To: <d41d58c8-7978-e9e9-88bb-28ebc46f4fdc@redhat.com>
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-34-imammedo@redhat.com>
 <d41d58c8-7978-e9e9-88bb-28ebc46f4fdc@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Sep 2021 15:33:27 +0200
Eric Auger <eauger@redhat.com> wrote:

> On 9/7/21 4:48 PM, Igor Mammedov wrote:
> > Drop usage of packed structures and explicit endian
> > conversions when building table and use endian agnostic
> > build_append_int_noprefix() API to build it.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > CC: marcel.apfelbaum@gmail.com
> > ---
> >  include/hw/acpi/acpi-defs.h | 14 --------------
> >  include/hw/acpi/aml-build.h |  1 +
> >  hw/acpi/aml-build.c         |  2 +-
> >  hw/i386/acpi-build.c        | 18 ++++++++++++++----
> >  4 files changed, 16 insertions(+), 19 deletions(-)
> > 
> > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > index 0b375e7589..1a0774edd6 100644
> > --- a/include/hw/acpi/acpi-defs.h
> > +++ b/include/hw/acpi/acpi-defs.h
> > @@ -117,18 +117,4 @@ typedef struct AcpiFadtData {
> >  #define ACPI_FADT_ARM_PSCI_COMPLIANT  (1 << 0)
> >  #define ACPI_FADT_ARM_PSCI_USE_HVC    (1 << 1)
> >  
> > -/*
> > - * ACPI 1.0 Firmware ACPI Control Structure (FACS)
> > - */
> > -struct AcpiFacsDescriptorRev1 {
> > -    uint32_t signature;           /* ACPI Signature */
> > -    uint32_t length;                 /* Length of structure, in bytes */
> > -    uint32_t hardware_signature;     /* Hardware configuration signature */
> > -    uint32_t firmware_waking_vector; /* ACPI OS waking vector */
> > -    uint32_t global_lock;            /* Global Lock */
> > -    uint32_t flags;
> > -    uint8_t  resverved3 [40];        /* Reserved - must be zero */
> > -} QEMU_PACKED;
> > -typedef struct AcpiFacsDescriptorRev1 AcpiFacsDescriptorRev1;
> > -
> >  #endif
> > diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> > index 6e1f42e119..6f3d1de1b1 100644
> > --- a/include/hw/acpi/aml-build.h
> > +++ b/include/hw/acpi/aml-build.h
> > @@ -413,6 +413,7 @@ Aml *aml_concatenate(Aml *source1, Aml *source2, Aml *target);
> >  Aml *aml_object_type(Aml *object);
> >  
> >  void build_append_int_noprefix(GArray *table, uint64_t value, int size);
> > +void build_append_byte(GArray *array, uint8_t val);  
> what's the rationale behind changes related to build_append_byte?

looks like stray remnants from previous revisions, not really needed.
I'll drop it.

> >  
> >  typedef struct AcpiTable {
> >      const char *sig;
> > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > index 050fdb3f37..4135b385e5 100644
> > --- a/hw/acpi/aml-build.c
> > +++ b/hw/acpi/aml-build.c
> > @@ -47,7 +47,7 @@ static void build_prepend_byte(GArray *array, uint8_t val)
> >      g_array_prepend_val(array, val);
> >  }
> >  
> > -static void build_append_byte(GArray *array, uint8_t val)
> > +void build_append_byte(GArray *array, uint8_t val)
> >  {
> >      g_array_append_val(array, val);
> >  }
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index 9f888d5a2c..547cd4ed9d 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -345,13 +345,23 @@ static void acpi_align_size(GArray *blob, unsigned align)
> >      g_array_set_size(blob, ROUND_UP(acpi_data_len(blob), align));
> >  }
> >  
> > -/* FACS */
> > +/*
> > + * ACPI spec 1.0b,
> > + * 5.2.6 Firmware ACPI Control Structure
> > + */
> >  static void
> >  build_facs(GArray *table_data)
> >  {
> > -    AcpiFacsDescriptorRev1 *facs = acpi_data_push(table_data, sizeof *facs);
> > -    memcpy(&facs->signature, "FACS", 4);
> > -    facs->length = cpu_to_le32(sizeof(*facs));
> > +    const char *sig = "FACS";
> > +    const uint8_t reserved[40] = {};
> > +
> > +    g_array_append_vals(table_data, sig, 4); /* Signature */
> > +    build_append_int_noprefix(table_data, 64, 4); /* Length */
> > +    build_append_int_noprefix(table_data, 0, 4); /* Hardware Signature */
> > +    build_append_int_noprefix(table_data, 0, 4); /* Firmware Waking Vector */
> > +    build_append_int_noprefix(table_data, 0, 4); /* Global Lock */
> > +    build_append_int_noprefix(table_data, 0, 4); /* Flags */
> > +    g_array_append_vals(table_data, reserved, 40); /* Reserved */
> >  }
> >  
> >  static void build_append_pcihp_notify_entry(Aml *method, int slot)
> >   
> Without thoses changes
> 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> 


