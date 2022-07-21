Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD2157C708
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 11:01:10 +0200 (CEST)
Received: from localhost ([::1]:49202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oES3Q-0003H1-NT
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 05:01:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oES1A-0001Pk-Bk
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 04:58:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oES15-0002aQ-IX
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 04:58:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658393922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LK8ajtuZb2dhheqtkec9gO5C2PHlYNzLxEu9gAK+SNE=;
 b=ABV9m7T6UcAIT6xtXnAMxUH+ahecDvwrfSOIFsTRQCejFLsWP7OiCLW8vlQ/yfsiRaf9Co
 84ZnO91lKbeD2Q8LMB6OLC9X2tH8Y4rGL4xVpFDa8sBA3VTm+MCqyDVyLKTaZaeEaJl5f1
 FS74CsapsDEfkCgRpKhAQ8xSGlpTq/Y=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-yHxDOKtqPr6eLAbaSUUULA-1; Thu, 21 Jul 2022 04:58:40 -0400
X-MC-Unique: yHxDOKtqPr6eLAbaSUUULA-1
Received: by mail-ed1-f71.google.com with SMTP id
 n8-20020a05640205c800b00434fb0c150cso704562edx.19
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 01:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LK8ajtuZb2dhheqtkec9gO5C2PHlYNzLxEu9gAK+SNE=;
 b=CQW6CbZH0FYbyV4BLNIQvJiedH0MVrr9qm9Ls5ftVRPdibgVHJPuktfXxQkqUQ0A/X
 +S8QnS0kjfJqUgNaLSzwdWSNqM681AEvzOGwa+z786LegJiMSLfrgGNqwru91/3a9OeH
 IEyKehHjjv9hbapJPAUkJ2V4v6NLYd4naM0ib6at8VY0T40e2xyuVGywH//wKpAXZERw
 TiQxDfx4z7f4kJvsvKt4s0Z4yj6wmJmF6TdxQfY+LyvYBHn/WvZ1K9L9kuEp4UjtWINz
 yG0jYEBRcbrYT0+aXvRDWGV8e1dspkdGsgntFIoQJtrwJexxeA+kjjgVUzOQLAA5l4qq
 Fj6A==
X-Gm-Message-State: AJIora80rIF5vQfC+xVl6KqsuD4sM5vzILjMpLKvxEAj9pI8dTGpGhdr
 a5Du0pJDMIvqoEuSPmOJmURp7gfaUwJOzpnx8ujLq5FEYE21slHaEr4h4mDSX4A0mNCTBnweoa7
 /U63JEYsY41tbT88=
X-Received: by 2002:a17:907:2722:b0:72b:735a:d3b4 with SMTP id
 d2-20020a170907272200b0072b735ad3b4mr38633119ejl.363.1658393919179; 
 Thu, 21 Jul 2022 01:58:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uN79NQteUh1ZJPs1zlHN6fUI2gBA4V5XtBsedxN0ziAQfg5MG8F156UNwbmZIBEL8OKSny6g==
X-Received: by 2002:a17:907:2722:b0:72b:735a:d3b4 with SMTP id
 d2-20020a170907272200b0072b735ad3b4mr38633085ejl.363.1658393918528; 
 Thu, 21 Jul 2022 01:58:38 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 b21-20020a17090630d500b0072aa1313f5csm573932ejb.201.2022.07.21.01.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 01:58:38 -0700 (PDT)
Date: Thu, 21 Jul 2022 10:58:37 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Cc: mst@redhat.com, xiaoguangrong.eric@gmail.com, ani@anisinha.ca,
 dan.j.williams@intel.com, jingqi.liu@intel.com, qemu-devel@nongnu.org,
 robert.hu@intel.com
Subject: Re: [QEMU PATCH v2 4/6] nvdimm: Implement ACPI NVDIMM Label Methods
Message-ID: <20220721105837.2344a47a@redhat.com>
In-Reply-To: <8a6a574aa3708f8f07c2dcc3fd84f6028ff1219f.camel@linux.intel.com>
References: <20220530034047.730356-1-robert.hu@linux.intel.com>
 <20220530034047.730356-5-robert.hu@linux.intel.com>
 <20220616143210.21605b6a@redhat.com>
 <8a6a574aa3708f8f07c2dcc3fd84f6028ff1219f.camel@linux.intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 01 Jul 2022 17:23:04 +0800
Robert Hoo <robert.hu@linux.intel.com> wrote:

> On Thu, 2022-06-16 at 14:32 +0200, Igor Mammedov wrote:
> > On Mon, 30 May 2022 11:40:45 +0800
> > Robert Hoo <robert.hu@linux.intel.com> wrote:
> >  =20
> > > Recent ACPI spec [1] has defined NVDIMM Label Methods _LS{I,R,W},
> > > which
> > > depricates corresponding _DSM Functions defined by PMEM _DSM
> > > Interface spec
> > > [2].
> > >=20
> > > In this implementation, we do 2 things
> > > 1. Generalize the QEMU<->ACPI BIOS NVDIMM interface, wrap it with
> > > ACPI
> > > method dispatch, _DSM is one of the branches. This also paves the
> > > way for
> > > adding other ACPI methods for NVDIMM.
> > > 2. Add _LS{I,R,W} method in each NVDIMM device in SSDT.
> > > ASL form of SSDT changes can be found in next test/qtest/bios-
> > > table-test
> > > commit message.
> > >=20
> > > [1] ACPI Spec v6.4, 6.5.10 NVDIMM Label Methods
> > > https://uefi.org/sites/default/files/resources/ACPI_Spec_6_4_Jan22.pdf
> > > [2] Intel PMEM _DSM Interface Spec v2.0, 3.10 Deprecated Functions
> > > https://pmem.io/documents/IntelOptanePMem_DSM_Interface-V2.0.pdf
> > >=20
> > > Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> > > Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>
> > > ---
> > >  hw/acpi/nvdimm.c        | 424 +++++++++++++++++++++++++++++++-----
> > > ---- =20
> >=20
> > This patch is too large and doing to many things to be reviewable.
> > It needs to be split into smaller distinct chunks.
> > (however hold your horses and read on)
> >=20
> > The patch it is too intrusive and my hunch is that it breaks
> > ABI and needs a bunch of compat knobs to work properly and
> > that I'd like to avoid unless there is not other way around
> > the problem. =20
>=20
> Is the ABI here you mentioned the "struct NvdimmMthdIn{}" stuff?
> and the compat knobs refers to related functions' input/output params?

ABI are structures that guest and QEMU pass through information
between each other. And knobs in this case would be compat variable[s]
to keep old behavior in place for old machine types.

> My thoughts is that eventually, sooner or later, more ACPI methods will
> be implemented per request, although now we can play the trick of
> wrapper new methods over the pipe of old _DSM implementation.
> Though this changes a little on existing struct NvdimmDsmIn {}, it
> paves the way for the future; and actually the change is more an
> extension or generalization, not fundamentally changes the framework.
>=20
> In short, my point is the change/generalization/extension will be
> inevitable, even if not present.

Expanding ABI (interface between host&guest) has 2 drawbacks
 * it exposes more attack surface of VMM to hostile guest
   and rises chances that vulnerability would slip through
   review/testing
 * migration wise, QEMU has to support any ABI for years
   and not only latest an greatest interface but also old
   ones to keep guest started on older QEMU working across
   migration, so any ABI change should be considered very
   carefully before being implemented otherwise it all
   quickly snowballs in unsupportable mess of compat
   variables smeared across host/guest.
   Reducing exposed ABI and constant need to expand it
   was a reason why we have moved ACPI code from firmware
   into QEMU, so we could describe hardware without costs
   associated with of maintaining ABI.

There might be need to extend ABI eventually, but not in this case.

> > I was skeptical about this approach during v1 review and
> > now I'm pretty much sure it's over-engineered and we can
> > just repack data we receive from existing label _DSM functions
> > to provide _LS{I,R,W} like it was suggested in v1.
> > It will be much simpler and affect only AML side without
> > complicating ABI and without any compat cruft and will work
> > with ping-pong migration without any issues. =20
>=20
> Ostensibly it may looks simpler, actually not, I think. The AML "common
> pipe" NCAL() is already complex, it packs all _DSMs and NFIT() function
> logics there, packing new stuff in/through it will be bug-prone.
> Though this time we can avert touching it, as the new ACPI methods
> deprecating old _DSM functionally is almost the same.
> How about next time? are we going to always packing new methods logic
> in NCAL()?
> My point is that we should implement new methods as itself, of course,
> as a general programming rule, we can/should abstract common routines,
> but not packing them in one large function.
> >=20
> >  =20
> > >  include/hw/mem/nvdimm.h |   6 +
> > >  2 files changed, 338 insertions(+), 92 deletions(-)
> > >=20
> > > diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> > > index 59b42afcf1..50ee85866b 100644
> > > --- a/hw/acpi/nvdimm.c
> > > +++ b/hw/acpi/nvdimm.c
> > > @@ -416,17 +416,22 @@ static void nvdimm_build_nfit(NVDIMMState
> > > *state, GArray *table_offsets,
> > > =20
> > >  #define NVDIMM_DSM_MEMORY_SIZE      4096
> > > =20
> > > -struct NvdimmDsmIn {
> > > +struct NvdimmMthdIn {
> > >      uint32_t handle;
> > > +    uint32_t method;
> > > +    uint8_t  args[4088];
> > > +} QEMU_PACKED;
> > > +typedef struct NvdimmMthdIn NvdimmMthdIn;
> > > +struct NvdimmDsmIn {
> > >      uint32_t revision;
> > >      uint32_t function;
> > >      /* the remaining size in the page is used by arg3. */
> > >      union {
> > > -        uint8_t arg3[4084];
> > > +        uint8_t arg3[4080];
> > >      };
> > >  } QEMU_PACKED;
> > >  typedef struct NvdimmDsmIn NvdimmDsmIn;
> > > -QEMU_BUILD_BUG_ON(sizeof(NvdimmDsmIn) !=3D NVDIMM_DSM_MEMORY_SIZE);
> > > +QEMU_BUILD_BUG_ON(sizeof(NvdimmMthdIn) !=3D NVDIMM_DSM_MEMORY_SIZE);
> > > =20
> > >  struct NvdimmDsmOut {
> > >      /* the size of buffer filled by QEMU. */
> > > @@ -470,7 +475,8 @@ struct NvdimmFuncGetLabelDataIn {
> > >  } QEMU_PACKED;
> > >  typedef struct NvdimmFuncGetLabelDataIn NvdimmFuncGetLabelDataIn;
> > >  QEMU_BUILD_BUG_ON(sizeof(NvdimmFuncGetLabelDataIn) +
> > > -                  offsetof(NvdimmDsmIn, arg3) >
> > > NVDIMM_DSM_MEMORY_SIZE);
> > > +                  offsetof(NvdimmDsmIn, arg3) +
> > > offsetof(NvdimmMthdIn, args) >
> > > +                  NVDIMM_DSM_MEMORY_SIZE);
> > > =20
> > >  struct NvdimmFuncGetLabelDataOut {
> > >      /* the size of buffer filled by QEMU. */
> > > @@ -488,14 +494,16 @@ struct NvdimmFuncSetLabelDataIn {
> > >  } QEMU_PACKED;
> > >  typedef struct NvdimmFuncSetLabelDataIn NvdimmFuncSetLabelDataIn;
> > >  QEMU_BUILD_BUG_ON(sizeof(NvdimmFuncSetLabelDataIn) +
> > > -                  offsetof(NvdimmDsmIn, arg3) >
> > > NVDIMM_DSM_MEMORY_SIZE);
> > > +                  offsetof(NvdimmDsmIn, arg3) +
> > > offsetof(NvdimmMthdIn, args) >
> > > +                  NVDIMM_DSM_MEMORY_SIZE);
> > > =20
> > >  struct NvdimmFuncReadFITIn {
> > >      uint32_t offset; /* the offset into FIT buffer. */
> > >  } QEMU_PACKED;
> > >  typedef struct NvdimmFuncReadFITIn NvdimmFuncReadFITIn;
> > >  QEMU_BUILD_BUG_ON(sizeof(NvdimmFuncReadFITIn) +
> > > -                  offsetof(NvdimmDsmIn, arg3) >
> > > NVDIMM_DSM_MEMORY_SIZE);
> > > +                  offsetof(NvdimmDsmIn, arg3) +
> > > offsetof(NvdimmMthdIn, args) >
> > > +                  NVDIMM_DSM_MEMORY_SIZE);
> > > =20
> > >  struct NvdimmFuncReadFITOut {
> > >      /* the size of buffer filled by QEMU. */
> > > @@ -636,7 +644,8 @@ static uint32_t
> > > nvdimm_get_max_xfer_label_size(void)
> > >       * the max data ACPI can write one time which is transferred
> > > by
> > >       * 'Set Namespace Label Data' function.
> > >       */
> > > -    max_set_size =3D dsm_memory_size - offsetof(NvdimmDsmIn, arg3) -
> > > +    max_set_size =3D dsm_memory_size - offsetof(NvdimmMthdIn, args)
> > > -
> > > +                   offsetof(NvdimmDsmIn, arg3) -
> > >                     sizeof(NvdimmFuncSetLabelDataIn);
> > > =20
> > >      return MIN(max_get_size, max_set_size);
> > > @@ -697,16 +706,15 @@ static uint32_t
> > > nvdimm_rw_label_data_check(NVDIMMDevice *nvdimm,
> > >  /*
> > >   * DSM Spec Rev1 4.5 Get Namespace Label Data (Function Index 5).
> > >   */
> > > -static void nvdimm_dsm_get_label_data(NVDIMMDevice *nvdimm,
> > > NvdimmDsmIn *in,
> > > -                                      hwaddr dsm_mem_addr)
> > > +static void nvdimm_dsm_get_label_data(NVDIMMDevice *nvdimm,
> > > +                                    NvdimmFuncGetLabelDataIn
> > > *get_label_data,
> > > +                                    hwaddr dsm_mem_addr)
> > >  {
> > >      NVDIMMClass *nvc =3D NVDIMM_GET_CLASS(nvdimm);
> > > -    NvdimmFuncGetLabelDataIn *get_label_data;
> > >      NvdimmFuncGetLabelDataOut *get_label_data_out;
> > >      uint32_t status;
> > >      int size;
> > > =20
> > > -    get_label_data =3D (NvdimmFuncGetLabelDataIn *)in->arg3;
> > >      get_label_data->offset =3D le32_to_cpu(get_label_data->offset);
> > >      get_label_data->length =3D le32_to_cpu(get_label_data->length);
> > > =20
> > > @@ -737,15 +745,13 @@ static void
> > > nvdimm_dsm_get_label_data(NVDIMMDevice *nvdimm, NvdimmDsmIn *in,
> > >  /*
> > >   * DSM Spec Rev1 4.6 Set Namespace Label Data (Function Index 6).
> > >   */
> > > -static void nvdimm_dsm_set_label_data(NVDIMMDevice *nvdimm,
> > > NvdimmDsmIn *in,
> > > +static void nvdimm_dsm_set_label_data(NVDIMMDevice *nvdimm,
> > > +                                      NvdimmFuncSetLabelDataIn
> > > *set_label_data,
> > >                                        hwaddr dsm_mem_addr)
> > >  {
> > >      NVDIMMClass *nvc =3D NVDIMM_GET_CLASS(nvdimm);
> > > -    NvdimmFuncSetLabelDataIn *set_label_data;
> > >      uint32_t status;
> > > =20
> > > -    set_label_data =3D (NvdimmFuncSetLabelDataIn *)in->arg3;
> > > -
> > >      set_label_data->offset =3D le32_to_cpu(set_label_data->offset);
> > >      set_label_data->length =3D le32_to_cpu(set_label_data->length);
> > > =20
> > > @@ -760,19 +766,21 @@ static void
> > > nvdimm_dsm_set_label_data(NVDIMMDevice *nvdimm, NvdimmDsmIn *in,
> > >      }
> > > =20
> > >      assert(offsetof(NvdimmDsmIn, arg3) + sizeof(*set_label_data) +
> > > -                    set_label_data->length <=3D
> > > NVDIMM_DSM_MEMORY_SIZE);
> > > +           set_label_data->length <=3D NVDIMM_DSM_MEMORY_SIZE -
> > > +           offsetof(NvdimmMthdIn, args));
> > > =20
> > >      nvc->write_label_data(nvdimm, set_label_data->in_buf,
> > >                            set_label_data->length, set_label_data- =20
> > > >offset); =20
> > >      nvdimm_dsm_no_payload(NVDIMM_DSM_RET_STATUS_SUCCESS,
> > > dsm_mem_addr);
> > >  }
> > > =20
> > > -static void nvdimm_dsm_device(NvdimmDsmIn *in, hwaddr
> > > dsm_mem_addr)
> > > +static void nvdimm_dsm_device(uint32_t nv_handle, NvdimmDsmIn
> > > *dsm_in,
> > > +                                    hwaddr dsm_mem_addr)
> > >  {
> > > -    NVDIMMDevice *nvdimm =3D nvdimm_get_device_by_handle(in- =20
> > > >handle); =20
> > > +    NVDIMMDevice *nvdimm =3D nvdimm_get_device_by_handle(nv_handle);
> > > =20
> > >      /* See the comments in nvdimm_dsm_root(). */
> > > -    if (!in->function) {
> > > +    if (!dsm_in->function) {
> > >          uint32_t supported_func =3D 0;
> > > =20
> > >          if (nvdimm && nvdimm->label_size) {
> > > @@ -794,7 +802,7 @@ static void nvdimm_dsm_device(NvdimmDsmIn *in,
> > > hwaddr dsm_mem_addr)
> > >      }
> > > =20
> > >      /* Encode DSM function according to DSM Spec Rev1. */
> > > -    switch (in->function) {
> > > +    switch (dsm_in->function) {
> > >      case 4 /* Get Namespace Label Size */:
> > >          if (nvdimm->label_size) {
> > >              nvdimm_dsm_label_size(nvdimm, dsm_mem_addr);
> > > @@ -803,13 +811,17 @@ static void nvdimm_dsm_device(NvdimmDsmIn
> > > *in, hwaddr dsm_mem_addr)
> > >          break;
> > >      case 5 /* Get Namespace Label Data */:
> > >          if (nvdimm->label_size) {
> > > -            nvdimm_dsm_get_label_data(nvdimm, in, dsm_mem_addr);
> > > +            nvdimm_dsm_get_label_data(nvdimm,
> > > +                                      (NvdimmFuncGetLabelDataIn
> > > *)dsm_in->arg3,
> > > +                                      dsm_mem_addr);
> > >              return;
> > >          }
> > >          break;
> > >      case 0x6 /* Set Namespace Label Data */:
> > >          if (nvdimm->label_size) {
> > > -            nvdimm_dsm_set_label_data(nvdimm, in, dsm_mem_addr);
> > > +            nvdimm_dsm_set_label_data(nvdimm,
> > > +                        (NvdimmFuncSetLabelDataIn *)dsm_in->arg3,
> > > +                        dsm_mem_addr);
> > >              return;
> > >          }
> > >          break;
> > > @@ -819,67 +831,128 @@ static void nvdimm_dsm_device(NvdimmDsmIn
> > > *in, hwaddr dsm_mem_addr)
> > >  }
> > > =20
> > >  static uint64_t
> > > -nvdimm_dsm_read(void *opaque, hwaddr addr, unsigned size)
> > > +nvdimm_method_read(void *opaque, hwaddr addr, unsigned size)
> > >  {
> > > -    nvdimm_debug("BUG: we never read _DSM IO Port.\n");
> > > +    nvdimm_debug("BUG: we never read NVDIMM Method IO Port.\n");
> > >      return 0;
> > >  }
> > > =20
> > >  static void
> > > -nvdimm_dsm_write(void *opaque, hwaddr addr, uint64_t val, unsigned
> > > size)
> > > +nvdimm_dsm_handle(void *opaque, NvdimmMthdIn *method_in, hwaddr
> > > dsm_mem_addr)
> > >  {
> > >      NVDIMMState *state =3D opaque;
> > > -    NvdimmDsmIn *in;
> > > -    hwaddr dsm_mem_addr =3D val;
> > > +    NvdimmDsmIn *dsm_in =3D (NvdimmDsmIn *)method_in->args;
> > > =20
> > >      nvdimm_debug("dsm memory address 0x%" HWADDR_PRIx ".\n",
> > > dsm_mem_addr);
> > > =20
> > > -    /*
> > > -     * The DSM memory is mapped to guest address space so an evil
> > > guest
> > > -     * can change its content while we are doing DSM emulation.
> > > Avoid
> > > -     * this by copying DSM memory to QEMU local memory.
> > > -     */
> > > -    in =3D g_new(NvdimmDsmIn, 1);
> > > -    cpu_physical_memory_read(dsm_mem_addr, in, sizeof(*in));
> > > -
> > > -    in->revision =3D le32_to_cpu(in->revision);
> > > -    in->function =3D le32_to_cpu(in->function);
> > > -    in->handle =3D le32_to_cpu(in->handle);
> > > -
> > > -    nvdimm_debug("Revision 0x%x Handler 0x%x Function 0x%x.\n",
> > > in->revision,
> > > -                 in->handle, in->function);
> > > +    dsm_in->revision =3D le32_to_cpu(dsm_in->revision);
> > > +    dsm_in->function =3D le32_to_cpu(dsm_in->function);
> > > =20
> > > +    nvdimm_debug("Revision 0x%x Handler 0x%x Function 0x%x.\n",
> > > +                 dsm_in->revision, method_in->handle, dsm_in- =20
> > > >function); =20
> > >      /*
> > >       * Current NVDIMM _DSM Spec supports Rev1 and Rev2
> > >       * Intel=C2=AE OptanePersistent Memory Module DSM Interface,
> > > Revision 2.0
> > >       */
> > > -    if (in->revision !=3D 0x1 && in->revision !=3D 0x2) {
> > > +    if (dsm_in->revision !=3D 0x1 && dsm_in->revision !=3D 0x2) {
> > >          nvdimm_debug("Revision 0x%x is not supported, expect 0x1
> > > or 0x2.\n",
> > > -                     in->revision);
> > > +                     dsm_in->revision);
> > >          nvdimm_dsm_no_payload(NVDIMM_DSM_RET_STATUS_UNSUPPORT,
> > > dsm_mem_addr);
> > > -        goto exit;
> > > +        return;
> > >      }
> > > =20
> > > -    if (in->handle =3D=3D NVDIMM_QEMU_RSVD_HANDLE_ROOT) {
> > > -        nvdimm_dsm_handle_reserved_root_method(state, in,
> > > dsm_mem_addr);
> > > -        goto exit;
> > > +    if (method_in->handle =3D=3D NVDIMM_QEMU_RSVD_HANDLE_ROOT) {
> > > +        nvdimm_dsm_handle_reserved_root_method(state, dsm_in,
> > > dsm_mem_addr);
> > > +        return;
> > >      }
> > > =20
> > >       /* Handle 0 is reserved for NVDIMM Root Device. */
> > > -    if (!in->handle) {
> > > -        nvdimm_dsm_root(in, dsm_mem_addr);
> > > -        goto exit;
> > > +    if (!method_in->handle) {
> > > +        nvdimm_dsm_root(dsm_in, dsm_mem_addr);
> > > +        return;
> > >      }
> > > =20
> > > -    nvdimm_dsm_device(in, dsm_mem_addr);
> > > +    nvdimm_dsm_device(method_in->handle, dsm_in, dsm_mem_addr);
> > > +}
> > > =20
> > > -exit:
> > > -    g_free(in);
> > > +static void nvdimm_lsi_handle(uint32_t nv_handle, hwaddr
> > > dsm_mem_addr)
> > > +{
> > > +    NVDIMMDevice *nvdimm =3D nvdimm_get_device_by_handle(nv_handle);
> > > +
> > > +    if (nvdimm->label_size) {
> > > +        nvdimm_dsm_label_size(nvdimm, dsm_mem_addr);
> > > +    }
> > > +
> > > +    return;
> > > +}
> > > +
> > > +static void nvdimm_lsr_handle(uint32_t nv_handle,
> > > +                                    void *data,
> > > +                                    hwaddr dsm_mem_addr)
> > > +{
> > > +    NVDIMMDevice *nvdimm =3D nvdimm_get_device_by_handle(nv_handle);
> > > +    NvdimmFuncGetLabelDataIn *get_label_data =3D data;
> > > +
> > > +    if (nvdimm->label_size) {
> > > +        nvdimm_dsm_get_label_data(nvdimm, get_label_data,
> > > dsm_mem_addr);
> > > +    }
> > > +    return;
> > > +}
> > > +
> > > +static void nvdimm_lsw_handle(uint32_t nv_handle,
> > > +                                    void *data,
> > > +                                    hwaddr dsm_mem_addr)
> > > +{
> > > +    NVDIMMDevice *nvdimm =3D nvdimm_get_device_by_handle(nv_handle);
> > > +    NvdimmFuncSetLabelDataIn *set_label_data =3D data;
> > > +
> > > +    if (nvdimm->label_size) {
> > > +        nvdimm_dsm_set_label_data(nvdimm, set_label_data,
> > > dsm_mem_addr);
> > > +    }
> > > +    return;
> > > +}
> > > +
> > > +static void
> > > +nvdimm_method_write(void *opaque, hwaddr addr, uint64_t val,
> > > unsigned size)
> > > +{
> > > +    NvdimmMthdIn *method_in;
> > > +    hwaddr dsm_mem_addr =3D val;
> > > +
> > > +    /*
> > > +     * The DSM memory is mapped to guest address space so an evil
> > > guest
> > > +     * can change its content while we are doing DSM emulation.
> > > Avoid
> > > +     * this by copying DSM memory to QEMU local memory.
> > > +     */
> > > +    method_in =3D g_new(NvdimmMthdIn, 1);
> > > +    cpu_physical_memory_read(dsm_mem_addr, method_in,
> > > sizeof(*method_in));
> > > +
> > > +    method_in->handle =3D le32_to_cpu(method_in->handle);
> > > +    method_in->method =3D le32_to_cpu(method_in->method);
> > > +
> > > +    switch (method_in->method) {
> > > +    case NVDIMM_METHOD_DSM:
> > > +        nvdimm_dsm_handle(opaque, method_in, dsm_mem_addr);
> > > +        break;
> > > +    case NVDIMM_METHOD_LSI:
> > > +        nvdimm_lsi_handle(method_in->handle, dsm_mem_addr);
> > > +        break;
> > > +    case NVDIMM_METHOD_LSR:
> > > +        nvdimm_lsr_handle(method_in->handle, method_in->args,
> > > dsm_mem_addr);
> > > +        break;
> > > +    case NVDIMM_METHOD_LSW:
> > > +        nvdimm_lsw_handle(method_in->handle, method_in->args,
> > > dsm_mem_addr);
> > > +        break;
> > > +    default:
> > > +        nvdimm_debug("%s: Unkown method 0x%x\n", __func__,
> > > method_in->method);
> > > +        break;
> > > +    }
> > > +
> > > +    g_free(method_in);
> > >  }
> > > =20
> > > -static const MemoryRegionOps nvdimm_dsm_ops =3D {
> > > -    .read =3D nvdimm_dsm_read,
> > > -    .write =3D nvdimm_dsm_write,
> > > +static const MemoryRegionOps nvdimm_method_ops =3D {
> > > +    .read =3D nvdimm_method_read,
> > > +    .write =3D nvdimm_method_write,
> > >      .endianness =3D DEVICE_LITTLE_ENDIAN,
> > >      .valid =3D {
> > >          .min_access_size =3D 4,
> > > @@ -899,12 +972,12 @@ void nvdimm_init_acpi_state(NVDIMMState
> > > *state, MemoryRegion *io,
> > >                              FWCfgState *fw_cfg, Object *owner)
> > >  {
> > >      state->dsm_io =3D dsm_io;
> > > -    memory_region_init_io(&state->io_mr, owner, &nvdimm_dsm_ops,
> > > state,
> > > +    memory_region_init_io(&state->io_mr, owner,
> > > &nvdimm_method_ops, state,
> > >                            "nvdimm-acpi-io", dsm_io.bit_width >>
> > > 3);
> > >      memory_region_add_subregion(io, dsm_io.address, &state- =20
> > > >io_mr); =20
> > > =20
> > >      state->dsm_mem =3D g_array_new(false, true /* clear */, 1);
> > > -    acpi_data_push(state->dsm_mem, sizeof(NvdimmDsmIn));
> > > +    acpi_data_push(state->dsm_mem, sizeof(NvdimmMthdIn));
> > >      fw_cfg_add_file(fw_cfg, NVDIMM_DSM_MEM_FILE, state->dsm_mem- =20
> > > >data, =20
> > >                      state->dsm_mem->len);
> > > =20
> > > @@ -918,13 +991,22 @@ void nvdimm_init_acpi_state(NVDIMMState
> > > *state, MemoryRegion *io,
> > >  #define NVDIMM_DSM_IOPORT       "NPIO"
> > > =20
> > >  #define NVDIMM_DSM_NOTIFY       "NTFI"
> > > +#define NVDIMM_DSM_METHOD       "MTHD"
> > >  #define NVDIMM_DSM_HANDLE       "HDLE"
> > >  #define NVDIMM_DSM_REVISION     "REVS"
> > >  #define NVDIMM_DSM_FUNCTION     "FUNC"
> > >  #define NVDIMM_DSM_ARG3         "FARG"
> > > =20
> > > -#define NVDIMM_DSM_OUT_BUF_SIZE "RLEN"
> > > -#define NVDIMM_DSM_OUT_BUF      "ODAT"
> > > +#define NVDIMM_DSM_OFFSET       "OFST"
> > > +#define NVDIMM_DSM_TRANS_LEN    "TRSL"
> > > +#define NVDIMM_DSM_IN_BUFF      "IDAT"
> > > +
> > > +#define NVDIMM_DSM_OUT_BUF_SIZE     "RLEN"
> > > +#define NVDIMM_DSM_OUT_BUF          "ODAT"
> > > +#define NVDIMM_DSM_OUT_STATUS       "STUS"
> > > +#define NVDIMM_DSM_OUT_LSA_SIZE     "SIZE"
> > > +#define NVDIMM_DSM_OUT_MAX_TRANS    "MAXT"
> > > +
> > > =20
> > >  #define NVDIMM_DSM_RFIT_STATUS  "RSTA"
> > > =20
> > > @@ -938,7 +1020,6 @@ static void nvdimm_build_common_dsm(Aml *dev,
> > >      Aml *pckg, *pckg_index, *pckg_buf, *field, *dsm_out_buf,
> > > *dsm_out_buf_size;
> > >      Aml *whilectx, *offset;
> > >      uint8_t byte_list[1];
> > > -    AmlRegionSpace rs;
> > > =20
> > >      method =3D aml_method(NVDIMM_COMMON_DSM, 5, AML_SERIALIZED);
> > >      uuid =3D aml_arg(0);
> > > @@ -949,37 +1030,15 @@ static void nvdimm_build_common_dsm(Aml
> > > *dev,
> > > =20
> > >      aml_append(method, aml_store(aml_name(NVDIMM_ACPI_MEM_ADDR),
> > > dsm_mem));
> > > =20
> > > -    if (nvdimm_state->dsm_io.space_id =3D=3D AML_AS_SYSTEM_IO) {
> > > -        rs =3D AML_SYSTEM_IO;
> > > -    } else {
> > > -        rs =3D AML_SYSTEM_MEMORY;
> > > -    }
> > > -
> > > -    /* map DSM memory and IO into ACPI namespace. */
> > > -    aml_append(method, aml_operation_region(NVDIMM_DSM_IOPORT, rs,
> > > -               aml_int(nvdimm_state->dsm_io.address),
> > > -               nvdimm_state->dsm_io.bit_width >> 3));
> > >      aml_append(method, aml_operation_region(NVDIMM_DSM_MEMORY,
> > > -               AML_SYSTEM_MEMORY, dsm_mem, sizeof(NvdimmDsmIn)));
> > > -
> > > -    /*
> > > -     * DSM notifier:
> > > -     * NVDIMM_DSM_NOTIFY: write the address of DSM memory and
> > > notify QEMU to
> > > -     *                    emulate the access.
> > > -     *
> > > -     * It is the IO port so that accessing them will cause VM-
> > > exit, the
> > > -     * control will be transferred to QEMU.
> > > -     */
> > > -    field =3D aml_field(NVDIMM_DSM_IOPORT, AML_DWORD_ACC,
> > > AML_NOLOCK,
> > > -                      AML_PRESERVE);
> > > -    aml_append(field, aml_named_field(NVDIMM_DSM_NOTIFY,
> > > -               nvdimm_state->dsm_io.bit_width));
> > > -    aml_append(method, field);
> > > +               AML_SYSTEM_MEMORY, dsm_mem, sizeof(NvdimmMthdIn)));
> > > =20
> > >      /*
> > >       * DSM input:
> > >       * NVDIMM_DSM_HANDLE: store device's handle, it's zero if the
> > > _DSM call
> > >       *                    happens on NVDIMM Root Device.
> > > +     * NVDIMM_DSM_METHOD: ACPI method indicator, to distinguish
> > > _DSM and
> > > +     *                    other ACPI methods.
> > >       * NVDIMM_DSM_REVISION: store the Arg1 of _DSM call.
> > >       * NVDIMM_DSM_FUNCTION: store the Arg2 of _DSM call.
> > >       * NVDIMM_DSM_ARG3: store the Arg3 of _DSM call which is a
> > > Package
> > > @@ -991,13 +1050,16 @@ static void nvdimm_build_common_dsm(Aml
> > > *dev,
> > >      field =3D aml_field(NVDIMM_DSM_MEMORY, AML_DWORD_ACC,
> > > AML_NOLOCK,
> > >                        AML_PRESERVE);
> > >      aml_append(field, aml_named_field(NVDIMM_DSM_HANDLE,
> > > -               sizeof(typeof_field(NvdimmDsmIn, handle)) *
> > > BITS_PER_BYTE));
> > > +               sizeof(typeof_field(NvdimmMthdIn, handle)) *
> > > BITS_PER_BYTE));
> > > +    aml_append(field, aml_named_field(NVDIMM_DSM_METHOD,
> > > +               sizeof(typeof_field(NvdimmMthdIn, method)) *
> > > BITS_PER_BYTE));
> > >      aml_append(field, aml_named_field(NVDIMM_DSM_REVISION,
> > >                 sizeof(typeof_field(NvdimmDsmIn, revision)) *
> > > BITS_PER_BYTE));
> > >      aml_append(field, aml_named_field(NVDIMM_DSM_FUNCTION,
> > >                 sizeof(typeof_field(NvdimmDsmIn, function)) *
> > > BITS_PER_BYTE));
> > >      aml_append(field, aml_named_field(NVDIMM_DSM_ARG3,
> > > -         (sizeof(NvdimmDsmIn) - offsetof(NvdimmDsmIn, arg3)) *
> > > BITS_PER_BYTE));
> > > +         (sizeof(NvdimmMthdIn) - offsetof(NvdimmMthdIn, args) -
> > > +          offsetof(NvdimmDsmIn, arg3)) * BITS_PER_BYTE));
> > >      aml_append(method, field);
> > > =20
> > >      /*
> > > @@ -1065,6 +1127,7 @@ static void nvdimm_build_common_dsm(Aml *dev,
> > >       * it reserves 0 for root device and is the handle for NVDIMM
> > > devices.
> > >       * See the comments in nvdimm_slot_to_handle().
> > >       */
> > > +    aml_append(method, aml_store(aml_int(0),
> > > aml_name(NVDIMM_DSM_METHOD)));
> > >      aml_append(method, aml_store(handle,
> > > aml_name(NVDIMM_DSM_HANDLE)));
> > >      aml_append(method, aml_store(aml_arg(1),
> > > aml_name(NVDIMM_DSM_REVISION)));
> > >      aml_append(method, aml_store(function,
> > > aml_name(NVDIMM_DSM_FUNCTION)));
> > > @@ -1250,6 +1313,7 @@ static void nvdimm_build_fit(Aml *dev)
> > >  static void nvdimm_build_nvdimm_devices(Aml *root_dev, uint32_t
> > > ram_slots)
> > >  {
> > >      uint32_t slot;
> > > +    Aml *method, *pkg, *field;
> > > =20
> > >      for (slot =3D 0; slot < ram_slots; slot++) {
> > >          uint32_t handle =3D nvdimm_slot_to_handle(slot);
> > > @@ -1266,6 +1330,155 @@ static void nvdimm_build_nvdimm_devices(Aml
> > > *root_dev, uint32_t ram_slots)
> > >           * table NFIT or _FIT.
> > >           */
> > >          aml_append(nvdimm_dev, aml_name_decl("_ADR",
> > > aml_int(handle)));
> > > +        aml_append(nvdimm_dev,
> > > aml_operation_region(NVDIMM_DSM_MEMORY,
> > > +                   AML_SYSTEM_MEMORY,
> > > aml_name(NVDIMM_ACPI_MEM_ADDR),
> > > +                   sizeof(NvdimmMthdIn)));
> > > +
> > > +        /* ACPI 6.4: 6.5.10 NVDIMM Label Methods, _LS{I,R,W} */
> > > +
> > > +        /* Begin of _LSI Block */
> > > +        method =3D aml_method("_LSI", 0, AML_SERIALIZED);
> > > +        /* _LSI Input field */
> > > +        field =3D aml_field(NVDIMM_DSM_MEMORY, AML_DWORD_ACC,
> > > AML_NOLOCK,
> > > +                          AML_PRESERVE);
> > > +        aml_append(field, aml_named_field(NVDIMM_DSM_HANDLE,
> > > +                   sizeof(typeof_field(NvdimmMthdIn, handle)) *
> > > BITS_PER_BYTE));
> > > +        aml_append(field, aml_named_field(NVDIMM_DSM_METHOD,
> > > +                   sizeof(typeof_field(NvdimmMthdIn, method)) *
> > > BITS_PER_BYTE));
> > > +        aml_append(method, field);
> > > +
> > > +        /* _LSI Output field */
> > > +        field =3D aml_field(NVDIMM_DSM_MEMORY, AML_DWORD_ACC,
> > > AML_NOLOCK,
> > > +                          AML_PRESERVE);
> > > +        aml_append(field, aml_named_field(NVDIMM_DSM_OUT_BUF_SIZE,
> > > +                   sizeof(typeof_field(NvdimmFuncGetLabelSizeOut,
> > > len)) *
> > > +                   BITS_PER_BYTE));
> > > +        aml_append(field, aml_named_field(NVDIMM_DSM_OUT_STATUS,
> > > +                   sizeof(typeof_field(NvdimmFuncGetLabelSizeOut,
> > > +                   func_ret_status)) * BITS_PER_BYTE));
> > > +        aml_append(field, aml_named_field(NVDIMM_DSM_OUT_LSA_SIZE,
> > > +                   sizeof(typeof_field(NvdimmFuncGetLabelSizeOut,
> > > label_size)) *
> > > +                   BITS_PER_BYTE));
> > > +        aml_append(field,
> > > aml_named_field(NVDIMM_DSM_OUT_MAX_TRANS,
> > > +                   sizeof(typeof_field(NvdimmFuncGetLabelSizeOut,
> > > max_xfer)) *
> > > +                   BITS_PER_BYTE));
> > > +        aml_append(method, field);
> > > +
> > > +        aml_append(method, aml_store(aml_int(handle),
> > > +                                      aml_name(NVDIMM_DSM_HANDLE))
> > > );
> > > +        aml_append(method, aml_store(aml_int(0x100),
> > > +                                      aml_name(NVDIMM_DSM_METHOD))
> > > );
> > > +        aml_append(method,
> > > aml_store(aml_name(NVDIMM_ACPI_MEM_ADDR),
> > > +                                      aml_name(NVDIMM_DSM_NOTIFY))
> > > );
> > > +
> > > +        pkg =3D aml_package(3);
> > > +        aml_append(pkg, aml_name(NVDIMM_DSM_OUT_STATUS));
> > > +        aml_append(pkg, aml_name(NVDIMM_DSM_OUT_LSA_SIZE));
> > > +        aml_append(pkg, aml_name(NVDIMM_DSM_OUT_MAX_TRANS));
> > > +
> > > +        aml_append(method, aml_name_decl("RPKG", pkg));
> > > +
> > > +        aml_append(method, aml_return(aml_name("RPKG")));
> > > +        aml_append(nvdimm_dev, method); /* End of _LSI Block */
> > > +
> > > +
> > > +        /* Begin of _LSR Block */
> > > +        method =3D aml_method("_LSR", 2, AML_SERIALIZED);
> > > +
> > > +        /* _LSR Input field */
> > > +        field =3D aml_field(NVDIMM_DSM_MEMORY, AML_DWORD_ACC,
> > > AML_NOLOCK,
> > > +                          AML_PRESERVE);
> > > +        aml_append(field, aml_named_field(NVDIMM_DSM_HANDLE,
> > > +                   sizeof(typeof_field(NvdimmMthdIn, handle)) *
> > > +                   BITS_PER_BYTE));
> > > +        aml_append(field, aml_named_field(NVDIMM_DSM_METHOD,
> > > +                   sizeof(typeof_field(NvdimmMthdIn, method)) *
> > > +                   BITS_PER_BYTE));
> > > +        aml_append(field, aml_named_field(NVDIMM_DSM_OFFSET,
> > > +                   sizeof(typeof_field(NvdimmFuncGetLabelDataIn,
> > > offset)) *
> > > +                   BITS_PER_BYTE));
> > > +        aml_append(field, aml_named_field(NVDIMM_DSM_TRANS_LEN,
> > > +                   sizeof(typeof_field(NvdimmFuncGetLabelDataIn,
> > > length)) *
> > > +                   BITS_PER_BYTE));
> > > +        aml_append(method, field);
> > > +
> > > +        /* _LSR Output field */
> > > +        field =3D aml_field(NVDIMM_DSM_MEMORY, AML_DWORD_ACC,
> > > AML_NOLOCK,
> > > +                          AML_PRESERVE);
> > > +        aml_append(field, aml_named_field(NVDIMM_DSM_OUT_BUF_SIZE,
> > > +                   sizeof(typeof_field(NvdimmFuncGetLabelDataOut,
> > > len)) *
> > > +                   BITS_PER_BYTE));
> > > +        aml_append(field, aml_named_field(NVDIMM_DSM_OUT_STATUS,
> > > +                   sizeof(typeof_field(NvdimmFuncGetLabelDataOut,
> > > +                   func_ret_status)) * BITS_PER_BYTE));
> > > +        aml_append(field, aml_named_field(NVDIMM_DSM_OUT_BUF,
> > > +                   (NVDIMM_DSM_MEMORY_SIZE -
> > > +                    offsetof(NvdimmFuncGetLabelDataOut, out_buf))
> > > *
> > > +                    BITS_PER_BYTE));
> > > +        aml_append(method, field);
> > > +
> > > +        aml_append(method, aml_store(aml_int(handle),
> > > +                                      aml_name(NVDIMM_DSM_HANDLE))
> > > );
> > > +        aml_append(method, aml_store(aml_int(0x101),
> > > +                                      aml_name(NVDIMM_DSM_METHOD))
> > > );
> > > +        aml_append(method, aml_store(aml_arg(0),
> > > aml_name(NVDIMM_DSM_OFFSET)));
> > > +        aml_append(method, aml_store(aml_arg(1),
> > > +                                      aml_name(NVDIMM_DSM_TRANS_LE
> > > N)));
> > > +        aml_append(method,
> > > aml_store(aml_name(NVDIMM_ACPI_MEM_ADDR),
> > > +                                      aml_name(NVDIMM_DSM_NOTIFY))
> > > );
> > > +
> > > +        aml_append(method, aml_store(aml_shiftleft(aml_arg(1),
> > > aml_int(3)),
> > > +                                         aml_local(1)));
> > > +        aml_append(method,
> > > aml_create_field(aml_name(NVDIMM_DSM_OUT_BUF),
> > > +                   aml_int(0), aml_local(1), "OBUF"));
> > > +
> > > +        pkg =3D aml_package(2);
> > > +        aml_append(pkg, aml_name(NVDIMM_DSM_OUT_STATUS));
> > > +        aml_append(pkg, aml_name("OBUF"));
> > > +        aml_append(method, aml_name_decl("RPKG", pkg));
> > > +
> > > +        aml_append(method, aml_return(aml_name("RPKG")));
> > > +        aml_append(nvdimm_dev, method); /* End of _LSR Block */
> > > +
> > > +        /* Begin of _LSW Block */
> > > +        method =3D aml_method("_LSW", 3, AML_SERIALIZED);
> > > +        /* _LSW Input field */
> > > +        field =3D aml_field(NVDIMM_DSM_MEMORY, AML_DWORD_ACC,
> > > AML_NOLOCK,
> > > +                          AML_PRESERVE);
> > > +        aml_append(field, aml_named_field(NVDIMM_DSM_HANDLE,
> > > +                   sizeof(typeof_field(NvdimmMthdIn, handle)) *
> > > BITS_PER_BYTE));
> > > +        aml_append(field, aml_named_field(NVDIMM_DSM_METHOD,
> > > +                   sizeof(typeof_field(NvdimmMthdIn, method)) *
> > > BITS_PER_BYTE));
> > > +        aml_append(field, aml_named_field(NVDIMM_DSM_OFFSET,
> > > +                   sizeof(typeof_field(NvdimmFuncSetLabelDataIn,
> > > offset)) *
> > > +                   BITS_PER_BYTE));
> > > +        aml_append(field, aml_named_field(NVDIMM_DSM_TRANS_LEN,
> > > +                   sizeof(typeof_field(NvdimmFuncSetLabelDataIn,
> > > length)) *
> > > +                   BITS_PER_BYTE));
> > > +        aml_append(field, aml_named_field(NVDIMM_DSM_IN_BUFF,
> > > 32640));
> > > +        aml_append(method, field);
> > > +
> > > +        /* _LSW Output field */
> > > +        field =3D aml_field(NVDIMM_DSM_MEMORY, AML_DWORD_ACC,
> > > AML_NOLOCK,
> > > +                          AML_PRESERVE);
> > > +        aml_append(field, aml_named_field(NVDIMM_DSM_OUT_BUF_SIZE,
> > > +                   sizeof(typeof_field(NvdimmDsmFuncNoPayloadOut,
> > > len)) *
> > > +                   BITS_PER_BYTE));
> > > +        aml_append(field, aml_named_field(NVDIMM_DSM_OUT_STATUS,
> > > +                   sizeof(typeof_field(NvdimmDsmFuncNoPayloadOut,
> > > +                   func_ret_status)) * BITS_PER_BYTE));
> > > +        aml_append(method, field);
> > > +
> > > +        aml_append(method, aml_store(aml_int(handle),
> > > aml_name(NVDIMM_DSM_HANDLE)));
> > > +        aml_append(method, aml_store(aml_int(0x102),
> > > aml_name(NVDIMM_DSM_METHOD)));
> > > +        aml_append(method, aml_store(aml_arg(0),
> > > aml_name(NVDIMM_DSM_OFFSET)));
> > > +        aml_append(method, aml_store(aml_arg(1),
> > > aml_name(NVDIMM_DSM_TRANS_LEN)));
> > > +        aml_append(method, aml_store(aml_arg(2),
> > > aml_name(NVDIMM_DSM_IN_BUFF)));
> > > +        aml_append(method,
> > > aml_store(aml_name(NVDIMM_ACPI_MEM_ADDR),
> > > +                                      aml_name(NVDIMM_DSM_NOTIFY))
> > > );
> > > +
> > > +        aml_append(method,
> > > aml_return(aml_name(NVDIMM_DSM_OUT_STATUS)));
> > > +        aml_append(nvdimm_dev, method); /* End of _LSW Block */
> > > =20
> > >          nvdimm_build_device_dsm(nvdimm_dev, handle);
> > >          aml_append(root_dev, nvdimm_dev);
> > > @@ -1278,7 +1491,8 @@ static void nvdimm_build_ssdt(GArray
> > > *table_offsets, GArray *table_data,
> > >                                uint32_t ram_slots, const char
> > > *oem_id)
> > >  {
> > >      int mem_addr_offset;
> > > -    Aml *ssdt, *sb_scope, *dev;
> > > +    Aml *ssdt, *sb_scope, *dev, *field;
> > > +    AmlRegionSpace rs;
> > >      AcpiTable table =3D { .sig =3D "SSDT", .rev =3D 1,
> > >                          .oem_id =3D oem_id, .oem_table_id =3D "NVDIM=
M"
> > > };
> > > =20
> > > @@ -1286,6 +1500,9 @@ static void nvdimm_build_ssdt(GArray
> > > *table_offsets, GArray *table_data,
> > > =20
> > >      acpi_table_begin(&table, table_data);
> > >      ssdt =3D init_aml_allocator();
> > > +
> > > +    mem_addr_offset =3D build_append_named_dword(table_data,
> > > +                                               NVDIMM_ACPI_MEM_ADD
> > > R);
> > >      sb_scope =3D aml_scope("\\_SB");
> > > =20
> > >      dev =3D aml_device("NVDR");
> > > @@ -1303,6 +1520,31 @@ static void nvdimm_build_ssdt(GArray
> > > *table_offsets, GArray *table_data,
> > >       */
> > >      aml_append(dev, aml_name_decl("_HID",
> > > aml_string("ACPI0012")));
> > > =20
> > > +    if (nvdimm_state->dsm_io.space_id =3D=3D AML_AS_SYSTEM_IO) {
> > > +        rs =3D AML_SYSTEM_IO;
> > > +    } else {
> > > +        rs =3D AML_SYSTEM_MEMORY;
> > > +    }
> > > +
> > > +    /* map DSM memory and IO into ACPI namespace. */
> > > +    aml_append(dev, aml_operation_region(NVDIMM_DSM_IOPORT, rs,
> > > +               aml_int(nvdimm_state->dsm_io.address),
> > > +               nvdimm_state->dsm_io.bit_width >> 3));
> > > +
> > > +    /*
> > > +     * DSM notifier:
> > > +     * NVDIMM_DSM_NOTIFY: write the address of DSM memory and
> > > notify QEMU to
> > > +     *                    emulate the access.
> > > +     *
> > > +     * It is the IO port so that accessing them will cause VM-
> > > exit, the
> > > +     * control will be transferred to QEMU.
> > > +     */
> > > +    field =3D aml_field(NVDIMM_DSM_IOPORT, AML_DWORD_ACC,
> > > AML_NOLOCK,
> > > +                      AML_PRESERVE);
> > > +    aml_append(field, aml_named_field(NVDIMM_DSM_NOTIFY,
> > > +               nvdimm_state->dsm_io.bit_width));
> > > +    aml_append(dev, field);
> > > +
> > >      nvdimm_build_common_dsm(dev, nvdimm_state);
> > > =20
> > >      /* 0 is reserved for root device. */
> > > @@ -1316,12 +1558,10 @@ static void nvdimm_build_ssdt(GArray
> > > *table_offsets, GArray *table_data,
> > > =20
> > >      /* copy AML table into ACPI tables blob and patch header there
> > > */
> > >      g_array_append_vals(table_data, ssdt->buf->data, ssdt->buf- =20
> > > >len); =20
> > > -    mem_addr_offset =3D build_append_named_dword(table_data,
> > > -                                               NVDIMM_ACPI_MEM_ADD
> > > R);
> > > =20
> > >      bios_linker_loader_alloc(linker,
> > >                               NVDIMM_DSM_MEM_FILE, nvdimm_state- =20
> > > >dsm_mem, =20
> > > -                             sizeof(NvdimmDsmIn), false /* high
> > > memory */);
> > > +                             sizeof(NvdimmMthdIn), false /* high
> > > memory */);
> > >      bios_linker_loader_add_pointer(linker,
> > >          ACPI_BUILD_TABLE_FILE, mem_addr_offset, sizeof(uint32_t),
> > >          NVDIMM_DSM_MEM_FILE, 0);
> > > diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
> > > index cf8f59be44..0206b6125b 100644
> > > --- a/include/hw/mem/nvdimm.h
> > > +++ b/include/hw/mem/nvdimm.h
> > > @@ -37,6 +37,12 @@
> > >          }                                                     \
> > >      } while (0)
> > > =20
> > > +/* NVDIMM ACPI Methods */
> > > +#define NVDIMM_METHOD_DSM   0
> > > +#define NVDIMM_METHOD_LSI   0x100
> > > +#define NVDIMM_METHOD_LSR   0x101
> > > +#define NVDIMM_METHOD_LSW   0x102
> > > +
> > >  /*
> > >   * The minimum label data size is required by NVDIMM Namespace
> > >   * specification, see the chapter 2 Namespaces: =20
> >=20
> >  =20
>=20


