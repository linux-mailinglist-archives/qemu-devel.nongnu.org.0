Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D1F5B56C0
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 10:52:56 +0200 (CEST)
Received: from localhost ([::1]:35650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXfBW-0000LA-Jp
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 04:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oXf79-0006SO-96
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 04:48:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oXf75-0001Ur-J5
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 04:48:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662972498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q6Krzn2sYlOgboAyNOBC0mhGRRNbpgwoc1bVq6qvRnk=;
 b=Hv1QjzB1JFXg3A9ClXOqsfK7KlF3M0CZ3JlLZvOkoYuV8EB0Drx+OFViLtnklLtxB9nd02
 ukTuvETnwpLYpXkpp+tRK6dPFWSRANg2ya/Juo0RhBGD/Z+sYRJ9gj44uH8x6rzVnryy0V
 wxG6kEwWoZ7E8sqjHYbr26wGHJGnEzs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-7-JVm_sh-cOHGWCesuh6siTw-1; Mon, 12 Sep 2022 04:48:16 -0400
X-MC-Unique: JVm_sh-cOHGWCesuh6siTw-1
Received: by mail-ed1-f72.google.com with SMTP id
 w20-20020a05640234d400b00450f24c8ca6so5606257edc.13
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 01:48:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Q6Krzn2sYlOgboAyNOBC0mhGRRNbpgwoc1bVq6qvRnk=;
 b=MaATsfiu2a97c9R9OjHy0IF+AABTTklr55u7hwFfh6NgnTl9GajqZ+Gp0wN5UcmQtW
 TKtOkUhz+tqrEeTRm3YxN2q/NueDtY0+67R4MRFwhFqODESmmoHI8NV8/ErlLvUlpcGk
 HluoWxN7J5JDg5ellqyBVThoAlVGjUQ/d4nlZAOLMbiHz9QJKxXjCN8Qq3sp41UX8fWZ
 cdY8/OqO0SXT31Z4p8xgia7g7PC2wbfbnrS453Ce3eFf3yllnW9VxfFt3/TXKrwhLVYd
 QPBSyBdlILNcMeySyF7cIYeE/P8KhjkPTqnIFBVOU8YqdiFmGUgTsXKJSQSpdzCJY3Is
 +qJA==
X-Gm-Message-State: ACgBeo2cO5AotXRmICs/YcV0OhJqxBA29VUszzMNeQHwGgb5RemZarWL
 hDDcUjYRIciLqJ6mRsah3DNIe5v+Pyj40us3ClHPdjhzo7qLIgcQHUT4Mp1ogi6Z7NONcyoEsdq
 TAaEqMns0jLLW9OQ=
X-Received: by 2002:a17:907:783:b0:76e:f290:8b5 with SMTP id
 xd3-20020a170907078300b0076ef29008b5mr18282707ejb.395.1662972495502; 
 Mon, 12 Sep 2022 01:48:15 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7sjdBLkl/tOoaEpFbo31AI6bXSW9BZXs5WGlJ2JW/+68gmjnaZtwXUwrl1oQX5H46MWpP8Rg==
X-Received: by 2002:a17:907:783:b0:76e:f290:8b5 with SMTP id
 xd3-20020a170907078300b0076ef29008b5mr18282694ejb.395.1662972495300; 
 Mon, 12 Sep 2022 01:48:15 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a1709060cca00b007719eeac013sm4108625ejh.60.2022.09.12.01.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 01:48:14 -0700 (PDT)
Date: Mon, 12 Sep 2022 10:48:13 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Cc: mst@redhat.com, xiaoguangrong.eric@gmail.com, ani@anisinha.ca,
 dan.j.williams@intel.com, jingqi.liu@intel.com, qemu-devel@nongnu.org,
 robert.hu@intel.com
Subject: Re: [PATCH v3 4/5] acpi/nvdimm: Implement ACPI NVDIMM Label Methods
Message-ID: <20220912104813.53d1feca@redhat.com>
In-Reply-To: <52dd8913d8979efdc229a025e1bd23bb44ebadf3.camel@linux.intel.com>
References: <20220901032721.1392482-1-robert.hu@linux.intel.com>
 <20220901032721.1392482-5-robert.hu@linux.intel.com>
 <20220909153910.557fdbe7@redhat.com>
 <52dd8913d8979efdc229a025e1bd23bb44ebadf3.camel@linux.intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, 09 Sep 2022 22:02:34 +0800
Robert Hoo <robert.hu@linux.intel.com> wrote:

> On Fri, 2022-09-09 at 15:39 +0200, Igor Mammedov wrote:
> > On Thu,  1 Sep 2022 11:27:20 +0800
> > Robert Hoo <robert.hu@linux.intel.com> wrote:
> >   
> > > Recent ACPI spec [1] has defined NVDIMM Label Methods _LS{I,R,W},
> > > which
> > > deprecates corresponding _DSM Functions defined by PMEM _DSM
> > > Interface spec
> > > [2].
> > > 
> > > Since the semantics of the new Label Methods are same as old _DSM
> > > methods, the implementations here simply wrapper old ones.
> > > 
> > > ASL form diff can be found in next patch of updating golden master
> > > binaries.
> > > 
> > > [1] ACPI Spec v6.4, 6.5.10 NVDIMM Label Methods
> > > https://uefi.org/sites/default/files/resources/ACPI_Spec_6_4_Jan22.pdf
> > > [2] Intel PMEM _DSM Interface Spec v2.0, 3.10 Deprecated Functions
> > > https://pmem.io/documents/IntelOptanePMem_DSM_Interface-V2.0.pdf
> > > 
> > > Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> > > Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>  
> > 
> > looks more or less fine except of excessive use of named variables
> > which creates global scope variables.
> > 
> > I'd suggest to store temporary buffers/packages in LocalX variales,
> > you should be able to do that for everything modulo
> > aml_create_dword_field().
> > 
> > see an example below
> >   
> > > ---
> > >  hw/acpi/nvdimm.c | 91
> > > ++++++++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 91 insertions(+)
> > > 
> > > diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> > > index afff911c1e..516acfe53b 100644
> > > --- a/hw/acpi/nvdimm.c
> > > +++ b/hw/acpi/nvdimm.c
> > > @@ -1243,6 +1243,7 @@ static void nvdimm_build_fit(Aml *dev)
> > >  static void nvdimm_build_nvdimm_devices(Aml *root_dev, uint32_t
> > > ram_slots)
> > >  {
> > >      uint32_t slot;
> > > +    Aml *method, *pkg, *field, *com_call;
> > >  
> > >      for (slot = 0; slot < ram_slots; slot++) {
> > >          uint32_t handle = nvdimm_slot_to_handle(slot);
> > > @@ -1260,6 +1261,96 @@ static void nvdimm_build_nvdimm_devices(Aml
> > > *root_dev, uint32_t ram_slots)
> > >           */
> > >          aml_append(nvdimm_dev, aml_name_decl("_ADR",
> > > aml_int(handle)));
> > >  
> > > +        /*
> > > +         * ACPI v6.4: Section 6.5.10 NVDIMM Label Methods
> > > +         */
> > > +        /* _LSI */
> > > +        method = aml_method("_LSI", 0, AML_SERIALIZED);
> > > +        com_call = aml_call5(NVDIMM_COMMON_DSM,
> > > +                            aml_touuid(NVDIMM_DEVICE_DSM_UUID),
> > > +                            aml_int(1), aml_int(4), aml_int(0),
> > > +                            aml_int(handle));
> > > +        aml_append(method, aml_store(com_call, aml_local(0)));
> > > +
> > > +        aml_append(method, aml_create_dword_field(aml_local(0),
> > > +                                                  aml_int(0),
> > > "STTS"));
> > > +        aml_append(method, aml_create_dword_field(aml_local(0),
> > > aml_int(4),
> > > +                                                  "SLSA"));
> > > +        aml_append(method, aml_create_dword_field(aml_local(0),
> > > aml_int(8),
> > > +                                                  "MAXT"));
> > > +
> > > +        pkg = aml_package(3);
> > > +        aml_append(pkg, aml_name("STTS"));
> > > +        aml_append(pkg, aml_name("SLSA"));
> > > +        aml_append(pkg, aml_name("MAXT"));
> > > +        aml_append(method, aml_name_decl("RET", pkg));  
> > 
> > ex: put it in local instead of named variable and return that
> > the same applies to other named temporary named variables.  
> 
> Could you help provide the example in form of ASL?

see hw/i386/acpi-build.c: build_prt() or aml_pci_device_dsm()

> Thanks.
> >   
> > > +        aml_append(method, aml_return(aml_name("RET")));
> > > +
> > > +        aml_append(nvdimm_dev, method);
> > > +
> > > +        /* _LSR */
> > > +        method = aml_method("_LSR", 2, AML_SERIALIZED);
> > > +        aml_append(method, aml_name_decl("INPT", aml_buffer(8,
> > > NULL)));
> > > +
> > > +        aml_append(method,
> > > aml_create_dword_field(aml_name("INPT"),
> > > +                                                  aml_int(0),
> > > "OFST"));
> > > +        aml_append(method,
> > > aml_create_dword_field(aml_name("INPT"),
> > > +                                                  aml_int(4),
> > > "LEN"));
> > > +        aml_append(method, aml_store(aml_arg(0),
> > > aml_name("OFST")));
> > > +        aml_append(method, aml_store(aml_arg(1),
> > > aml_name("LEN")));
> > > +
> > > +        pkg = aml_package(1);
> > > +        aml_append(pkg, aml_name("INPT"));
> > > +        aml_append(method, aml_name_decl("PKG1", pkg));
> > > +
> > > +        com_call = aml_call5(NVDIMM_COMMON_DSM,
> > > +                            aml_touuid(NVDIMM_DEVICE_DSM_UUID),
> > > +                            aml_int(1), aml_int(5),
> > > aml_name("PKG1"),
> > > +                            aml_int(handle));
> > > +        aml_append(method, aml_store(com_call, aml_local(3)));
> > > +        field = aml_create_dword_field(aml_local(3), aml_int(0),
> > > "STTS");
> > > +        aml_append(method, field);
> > > +        field = aml_create_field(aml_local(3), aml_int(32),
> > > +                                 aml_shiftleft(aml_name("LEN"),
> > > aml_int(3)),
> > > +                                 "LDAT");
> > > +        aml_append(method, field);
> > > +        aml_append(method, aml_name_decl("LSA", aml_buffer(0,
> > > NULL)));
> > > +        aml_append(method, aml_to_buffer(aml_name("LDAT"),
> > > aml_name("LSA")));
> > > +        pkg = aml_package(2);
> > > +        aml_append(pkg, aml_name("STTS"));
> > > +        aml_append(pkg, aml_name("LSA"));
> > > +        aml_append(method, aml_name_decl("RET", pkg));
> > > +        aml_append(method, aml_return(aml_name("RET")));
> > > +        aml_append(nvdimm_dev, method);
> > > +
> > > +        /* _LSW */
> > > +        method = aml_method("_LSW", 3, AML_SERIALIZED);
> > > +        aml_append(method, aml_store(aml_arg(2), aml_local(2)));
> > > +        aml_append(method, aml_name_decl("INPT", aml_buffer(8,
> > > NULL)));
> > > +        field = aml_create_dword_field(aml_name("INPT"),
> > > +                                                  aml_int(0),
> > > "OFST");
> > > +        aml_append(method, field);
> > > +        field = aml_create_dword_field(aml_name("INPT"),
> > > +                                                  aml_int(4),
> > > "TLEN");
> > > +        aml_append(method, field);
> > > +        aml_append(method, aml_store(aml_arg(0),
> > > aml_name("OFST")));
> > > +        aml_append(method, aml_store(aml_arg(1),
> > > aml_name("TLEN")));
> > > +
> > > +        aml_append(method, aml_concatenate(aml_name("INPT"),
> > > aml_local(2),
> > > +                                            aml_name("INPT")));
> > > +        pkg = aml_package(1);
> > > +        aml_append(pkg, aml_name("INPT"));
> > > +        aml_append(method, aml_name_decl("PKG1", pkg));
> > > +        com_call = aml_call5(NVDIMM_COMMON_DSM,
> > > +                            aml_touuid(NVDIMM_DEVICE_DSM_UUID),
> > > +                            aml_int(1), aml_int(6),
> > > aml_name("PKG1"),
> > > +                            aml_int(handle));
> > > +        aml_append(method, aml_store(com_call, aml_local(3)));
> > > +        field = aml_create_dword_field(aml_local(3), aml_int(0),
> > > "STTS");
> > > +        aml_append(method, field);
> > > +        aml_append(method,
> > > aml_return(aml_to_integer(aml_name("STTS"))));  
> > 
> > why do you need explicitly convert DWORD field to integer?
> > it should be fine to return STTS directly (implicit conversion should
> > take care of the rest)
> >   
> > > +        aml_append(nvdimm_dev, method);
> > > +
> > >          nvdimm_build_device_dsm(nvdimm_dev, handle);
> > >          aml_append(root_dev, nvdimm_dev);
> > >      }  
> > 
> >   
> 


