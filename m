Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A4A54E153
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 15:00:48 +0200 (CEST)
Received: from localhost ([::1]:35940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1p78-0007co-6i
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 09:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o1ofh-00033p-JP
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:32:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o1ofZ-0001ki-JO
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:32:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655382735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pkIzlLE+pfApDAyLF8RZjxnN0QSDIoJ5ak3mHQiy7+U=;
 b=GPqR7Fg2T6+uH55m6Eka1AuWWj1v9ZwkAiiuctH0TaageUSlzSCDGrDFcYOF932GBRufbr
 E1kgP5Fa7W1F3XD6CGjIuprLicDeldcH/eWo3f3nX8bLKdAJm86/+ASVxEW+sapzGOkm0h
 6RHqZi28WbNdqrJVEi384wVsDuRqrbA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-cxsRzoxlMl2oWFIuYAdQ9Q-1; Thu, 16 Jun 2022 08:32:14 -0400
X-MC-Unique: cxsRzoxlMl2oWFIuYAdQ9Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 m18-20020adff392000000b0021848a78a53so221019wro.19
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 05:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pkIzlLE+pfApDAyLF8RZjxnN0QSDIoJ5ak3mHQiy7+U=;
 b=SddzVHwII4oARHkBLVSmnf98pvdyC4TILY2EfUCwDipIiHy5J4XdV+OXgkWxtiAin3
 bAz1rrWmNZqmT9HWp3sWC2nTJhmoaFMnBQzYH0FQ97tUb0C31qU2Guk/SS5znTxjfI5L
 PtgtgPr7xw9PhtAsEp+A+eXOE77KBuVaPg6E/NxXqbotqw/cg6L5cyhAjScQ6RTHehVW
 6cMbKoKHW05ZC61jLAeQbI1JS/pWVK4K2X0UEv14Hk6+LsqQCcQ7SprEqXJHnO/d4mt/
 xrAvPQfFxeIIdWujZWpt/4WAO4u7qlrMzGpMVBHVIKj2YAmd9BD9qEnnZEpUlYC1lLSL
 uefw==
X-Gm-Message-State: AJIora869MEWtnWoTIAnYFU9iS3SbCJ7gDu4UTF8RnFq/71IO+2Hzbj3
 WV48f5L577NNvooMRy844mbzsOaaN0qIV9twmXRA70u0fN/Fsib90BikOBIUWiyEj/09Uzc2lH6
 L9RabbKPvkoihPuU=
X-Received: by 2002:a5d:5a04:0:b0:21a:20b9:afbe with SMTP id
 bq4-20020a5d5a04000000b0021a20b9afbemr4447724wrb.550.1655382732855; 
 Thu, 16 Jun 2022 05:32:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vUXUZeEQzG8UQ6eJ2UJ0qO8pI9I0zibqAWO+j2845U+4nqPinq3IYLmMsUcF84ehX0fwAyJA==
X-Received: by 2002:a5d:5a04:0:b0:21a:20b9:afbe with SMTP id
 bq4-20020a5d5a04000000b0021a20b9afbemr4447692wrb.550.1655382732384; 
 Thu, 16 Jun 2022 05:32:12 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a056000055200b0021a38089e99sm1445714wrf.57.2022.06.16.05.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 05:32:11 -0700 (PDT)
Date: Thu, 16 Jun 2022 14:32:10 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Cc: mst@redhat.com, xiaoguangrong.eric@gmail.com, ani@anisinha.ca,
 dan.j.williams@intel.com, jingqi.liu@intel.com, qemu-devel@nongnu.org,
 robert.hu@intel.com
Subject: Re: [QEMU PATCH v2 4/6] nvdimm: Implement ACPI NVDIMM Label Methods
Message-ID: <20220616143210.21605b6a@redhat.com>
In-Reply-To: <20220530034047.730356-5-robert.hu@linux.intel.com>
References: <20220530034047.730356-1-robert.hu@linux.intel.com>
 <20220530034047.730356-5-robert.hu@linux.intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Mon, 30 May 2022 11:40:45 +0800
Robert Hoo <robert.hu@linux.intel.com> wrote:

> Recent ACPI spec [1] has defined NVDIMM Label Methods _LS{I,R,W}, which
> depricates corresponding _DSM Functions defined by PMEM _DSM Interface sp=
ec
> [2].
>=20
> In this implementation, we do 2 things
> 1. Generalize the QEMU<->ACPI BIOS NVDIMM interface, wrap it with ACPI
> method dispatch, _DSM is one of the branches. This also paves the way for
> adding other ACPI methods for NVDIMM.
> 2. Add _LS{I,R,W} method in each NVDIMM device in SSDT.
> ASL form of SSDT changes can be found in next test/qtest/bios-table-test
> commit message.
>=20
> [1] ACPI Spec v6.4, 6.5.10 NVDIMM Label Methods
> https://uefi.org/sites/default/files/resources/ACPI_Spec_6_4_Jan22.pdf
> [2] Intel PMEM _DSM Interface Spec v2.0, 3.10 Deprecated Functions
> https://pmem.io/documents/IntelOptanePMem_DSM_Interface-V2.0.pdf
>=20
> Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>
> ---
>  hw/acpi/nvdimm.c        | 424 +++++++++++++++++++++++++++++++---------

This patch is too large and doing to many things to be reviewable.
It needs to be split into smaller distinct chunks.
(however hold your horses and read on)

The patch it is too intrusive and my hunch is that it breaks
ABI and needs a bunch of compat knobs to work properly and
that I'd like to avoid unless there is not other way around
the problem.

I was skeptical about this approach during v1 review and
now I'm pretty much sure it's over-engineered and we can
just repack data we receive from existing label _DSM functions
to provide _LS{I,R,W} like it was suggested in v1.
It will be much simpler and affect only AML side without
complicating ABI and without any compat cruft and will work
with ping-pong migration without any issues.


>  include/hw/mem/nvdimm.h |   6 +
>  2 files changed, 338 insertions(+), 92 deletions(-)
>=20
> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> index 59b42afcf1..50ee85866b 100644
> --- a/hw/acpi/nvdimm.c
> +++ b/hw/acpi/nvdimm.c
> @@ -416,17 +416,22 @@ static void nvdimm_build_nfit(NVDIMMState *state, G=
Array *table_offsets,
> =20
>  #define NVDIMM_DSM_MEMORY_SIZE      4096
> =20
> -struct NvdimmDsmIn {
> +struct NvdimmMthdIn {
>      uint32_t handle;
> +    uint32_t method;
> +    uint8_t  args[4088];
> +} QEMU_PACKED;
> +typedef struct NvdimmMthdIn NvdimmMthdIn;
> +struct NvdimmDsmIn {
>      uint32_t revision;
>      uint32_t function;
>      /* the remaining size in the page is used by arg3. */
>      union {
> -        uint8_t arg3[4084];
> +        uint8_t arg3[4080];
>      };
>  } QEMU_PACKED;
>  typedef struct NvdimmDsmIn NvdimmDsmIn;
> -QEMU_BUILD_BUG_ON(sizeof(NvdimmDsmIn) !=3D NVDIMM_DSM_MEMORY_SIZE);
> +QEMU_BUILD_BUG_ON(sizeof(NvdimmMthdIn) !=3D NVDIMM_DSM_MEMORY_SIZE);
> =20
>  struct NvdimmDsmOut {
>      /* the size of buffer filled by QEMU. */
> @@ -470,7 +475,8 @@ struct NvdimmFuncGetLabelDataIn {
>  } QEMU_PACKED;
>  typedef struct NvdimmFuncGetLabelDataIn NvdimmFuncGetLabelDataIn;
>  QEMU_BUILD_BUG_ON(sizeof(NvdimmFuncGetLabelDataIn) +
> -                  offsetof(NvdimmDsmIn, arg3) > NVDIMM_DSM_MEMORY_SIZE);
> +                  offsetof(NvdimmDsmIn, arg3) + offsetof(NvdimmMthdIn, a=
rgs) >
> +                  NVDIMM_DSM_MEMORY_SIZE);
> =20
>  struct NvdimmFuncGetLabelDataOut {
>      /* the size of buffer filled by QEMU. */
> @@ -488,14 +494,16 @@ struct NvdimmFuncSetLabelDataIn {
>  } QEMU_PACKED;
>  typedef struct NvdimmFuncSetLabelDataIn NvdimmFuncSetLabelDataIn;
>  QEMU_BUILD_BUG_ON(sizeof(NvdimmFuncSetLabelDataIn) +
> -                  offsetof(NvdimmDsmIn, arg3) > NVDIMM_DSM_MEMORY_SIZE);
> +                  offsetof(NvdimmDsmIn, arg3) + offsetof(NvdimmMthdIn, a=
rgs) >
> +                  NVDIMM_DSM_MEMORY_SIZE);
> =20
>  struct NvdimmFuncReadFITIn {
>      uint32_t offset; /* the offset into FIT buffer. */
>  } QEMU_PACKED;
>  typedef struct NvdimmFuncReadFITIn NvdimmFuncReadFITIn;
>  QEMU_BUILD_BUG_ON(sizeof(NvdimmFuncReadFITIn) +
> -                  offsetof(NvdimmDsmIn, arg3) > NVDIMM_DSM_MEMORY_SIZE);
> +                  offsetof(NvdimmDsmIn, arg3) + offsetof(NvdimmMthdIn, a=
rgs) >
> +                  NVDIMM_DSM_MEMORY_SIZE);
> =20
>  struct NvdimmFuncReadFITOut {
>      /* the size of buffer filled by QEMU. */
> @@ -636,7 +644,8 @@ static uint32_t nvdimm_get_max_xfer_label_size(void)
>       * the max data ACPI can write one time which is transferred by
>       * 'Set Namespace Label Data' function.
>       */
> -    max_set_size =3D dsm_memory_size - offsetof(NvdimmDsmIn, arg3) -
> +    max_set_size =3D dsm_memory_size - offsetof(NvdimmMthdIn, args) -
> +                   offsetof(NvdimmDsmIn, arg3) -
>                     sizeof(NvdimmFuncSetLabelDataIn);
> =20
>      return MIN(max_get_size, max_set_size);
> @@ -697,16 +706,15 @@ static uint32_t nvdimm_rw_label_data_check(NVDIMMDe=
vice *nvdimm,
>  /*
>   * DSM Spec Rev1 4.5 Get Namespace Label Data (Function Index 5).
>   */
> -static void nvdimm_dsm_get_label_data(NVDIMMDevice *nvdimm, NvdimmDsmIn =
*in,
> -                                      hwaddr dsm_mem_addr)
> +static void nvdimm_dsm_get_label_data(NVDIMMDevice *nvdimm,
> +                                    NvdimmFuncGetLabelDataIn *get_label_=
data,
> +                                    hwaddr dsm_mem_addr)
>  {
>      NVDIMMClass *nvc =3D NVDIMM_GET_CLASS(nvdimm);
> -    NvdimmFuncGetLabelDataIn *get_label_data;
>      NvdimmFuncGetLabelDataOut *get_label_data_out;
>      uint32_t status;
>      int size;
> =20
> -    get_label_data =3D (NvdimmFuncGetLabelDataIn *)in->arg3;
>      get_label_data->offset =3D le32_to_cpu(get_label_data->offset);
>      get_label_data->length =3D le32_to_cpu(get_label_data->length);
> =20
> @@ -737,15 +745,13 @@ static void nvdimm_dsm_get_label_data(NVDIMMDevice =
*nvdimm, NvdimmDsmIn *in,
>  /*
>   * DSM Spec Rev1 4.6 Set Namespace Label Data (Function Index 6).
>   */
> -static void nvdimm_dsm_set_label_data(NVDIMMDevice *nvdimm, NvdimmDsmIn =
*in,
> +static void nvdimm_dsm_set_label_data(NVDIMMDevice *nvdimm,
> +                                      NvdimmFuncSetLabelDataIn *set_labe=
l_data,
>                                        hwaddr dsm_mem_addr)
>  {
>      NVDIMMClass *nvc =3D NVDIMM_GET_CLASS(nvdimm);
> -    NvdimmFuncSetLabelDataIn *set_label_data;
>      uint32_t status;
> =20
> -    set_label_data =3D (NvdimmFuncSetLabelDataIn *)in->arg3;
> -
>      set_label_data->offset =3D le32_to_cpu(set_label_data->offset);
>      set_label_data->length =3D le32_to_cpu(set_label_data->length);
> =20
> @@ -760,19 +766,21 @@ static void nvdimm_dsm_set_label_data(NVDIMMDevice =
*nvdimm, NvdimmDsmIn *in,
>      }
> =20
>      assert(offsetof(NvdimmDsmIn, arg3) + sizeof(*set_label_data) +
> -                    set_label_data->length <=3D NVDIMM_DSM_MEMORY_SIZE);
> +           set_label_data->length <=3D NVDIMM_DSM_MEMORY_SIZE -
> +           offsetof(NvdimmMthdIn, args));
> =20
>      nvc->write_label_data(nvdimm, set_label_data->in_buf,
>                            set_label_data->length, set_label_data->offset=
);
>      nvdimm_dsm_no_payload(NVDIMM_DSM_RET_STATUS_SUCCESS, dsm_mem_addr);
>  }
> =20
> -static void nvdimm_dsm_device(NvdimmDsmIn *in, hwaddr dsm_mem_addr)
> +static void nvdimm_dsm_device(uint32_t nv_handle, NvdimmDsmIn *dsm_in,
> +                                    hwaddr dsm_mem_addr)
>  {
> -    NVDIMMDevice *nvdimm =3D nvdimm_get_device_by_handle(in->handle);
> +    NVDIMMDevice *nvdimm =3D nvdimm_get_device_by_handle(nv_handle);
> =20
>      /* See the comments in nvdimm_dsm_root(). */
> -    if (!in->function) {
> +    if (!dsm_in->function) {
>          uint32_t supported_func =3D 0;
> =20
>          if (nvdimm && nvdimm->label_size) {
> @@ -794,7 +802,7 @@ static void nvdimm_dsm_device(NvdimmDsmIn *in, hwaddr=
 dsm_mem_addr)
>      }
> =20
>      /* Encode DSM function according to DSM Spec Rev1. */
> -    switch (in->function) {
> +    switch (dsm_in->function) {
>      case 4 /* Get Namespace Label Size */:
>          if (nvdimm->label_size) {
>              nvdimm_dsm_label_size(nvdimm, dsm_mem_addr);
> @@ -803,13 +811,17 @@ static void nvdimm_dsm_device(NvdimmDsmIn *in, hwad=
dr dsm_mem_addr)
>          break;
>      case 5 /* Get Namespace Label Data */:
>          if (nvdimm->label_size) {
> -            nvdimm_dsm_get_label_data(nvdimm, in, dsm_mem_addr);
> +            nvdimm_dsm_get_label_data(nvdimm,
> +                                      (NvdimmFuncGetLabelDataIn *)dsm_in=
->arg3,
> +                                      dsm_mem_addr);
>              return;
>          }
>          break;
>      case 0x6 /* Set Namespace Label Data */:
>          if (nvdimm->label_size) {
> -            nvdimm_dsm_set_label_data(nvdimm, in, dsm_mem_addr);
> +            nvdimm_dsm_set_label_data(nvdimm,
> +                        (NvdimmFuncSetLabelDataIn *)dsm_in->arg3,
> +                        dsm_mem_addr);
>              return;
>          }
>          break;
> @@ -819,67 +831,128 @@ static void nvdimm_dsm_device(NvdimmDsmIn *in, hwa=
ddr dsm_mem_addr)
>  }
> =20
>  static uint64_t
> -nvdimm_dsm_read(void *opaque, hwaddr addr, unsigned size)
> +nvdimm_method_read(void *opaque, hwaddr addr, unsigned size)
>  {
> -    nvdimm_debug("BUG: we never read _DSM IO Port.\n");
> +    nvdimm_debug("BUG: we never read NVDIMM Method IO Port.\n");
>      return 0;
>  }
> =20
>  static void
> -nvdimm_dsm_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
> +nvdimm_dsm_handle(void *opaque, NvdimmMthdIn *method_in, hwaddr dsm_mem_=
addr)
>  {
>      NVDIMMState *state =3D opaque;
> -    NvdimmDsmIn *in;
> -    hwaddr dsm_mem_addr =3D val;
> +    NvdimmDsmIn *dsm_in =3D (NvdimmDsmIn *)method_in->args;
> =20
>      nvdimm_debug("dsm memory address 0x%" HWADDR_PRIx ".\n", dsm_mem_add=
r);
> =20
> -    /*
> -     * The DSM memory is mapped to guest address space so an evil guest
> -     * can change its content while we are doing DSM emulation. Avoid
> -     * this by copying DSM memory to QEMU local memory.
> -     */
> -    in =3D g_new(NvdimmDsmIn, 1);
> -    cpu_physical_memory_read(dsm_mem_addr, in, sizeof(*in));
> -
> -    in->revision =3D le32_to_cpu(in->revision);
> -    in->function =3D le32_to_cpu(in->function);
> -    in->handle =3D le32_to_cpu(in->handle);
> -
> -    nvdimm_debug("Revision 0x%x Handler 0x%x Function 0x%x.\n", in->revi=
sion,
> -                 in->handle, in->function);
> +    dsm_in->revision =3D le32_to_cpu(dsm_in->revision);
> +    dsm_in->function =3D le32_to_cpu(dsm_in->function);
> =20
> +    nvdimm_debug("Revision 0x%x Handler 0x%x Function 0x%x.\n",
> +                 dsm_in->revision, method_in->handle, dsm_in->function);
>      /*
>       * Current NVDIMM _DSM Spec supports Rev1 and Rev2
>       * Intel=C2=AE OptanePersistent Memory Module DSM Interface, Revisio=
n 2.0
>       */
> -    if (in->revision !=3D 0x1 && in->revision !=3D 0x2) {
> +    if (dsm_in->revision !=3D 0x1 && dsm_in->revision !=3D 0x2) {
>          nvdimm_debug("Revision 0x%x is not supported, expect 0x1 or 0x2.=
\n",
> -                     in->revision);
> +                     dsm_in->revision);
>          nvdimm_dsm_no_payload(NVDIMM_DSM_RET_STATUS_UNSUPPORT, dsm_mem_a=
ddr);
> -        goto exit;
> +        return;
>      }
> =20
> -    if (in->handle =3D=3D NVDIMM_QEMU_RSVD_HANDLE_ROOT) {
> -        nvdimm_dsm_handle_reserved_root_method(state, in, dsm_mem_addr);
> -        goto exit;
> +    if (method_in->handle =3D=3D NVDIMM_QEMU_RSVD_HANDLE_ROOT) {
> +        nvdimm_dsm_handle_reserved_root_method(state, dsm_in, dsm_mem_ad=
dr);
> +        return;
>      }
> =20
>       /* Handle 0 is reserved for NVDIMM Root Device. */
> -    if (!in->handle) {
> -        nvdimm_dsm_root(in, dsm_mem_addr);
> -        goto exit;
> +    if (!method_in->handle) {
> +        nvdimm_dsm_root(dsm_in, dsm_mem_addr);
> +        return;
>      }
> =20
> -    nvdimm_dsm_device(in, dsm_mem_addr);
> +    nvdimm_dsm_device(method_in->handle, dsm_in, dsm_mem_addr);
> +}
> =20
> -exit:
> -    g_free(in);
> +static void nvdimm_lsi_handle(uint32_t nv_handle, hwaddr dsm_mem_addr)
> +{
> +    NVDIMMDevice *nvdimm =3D nvdimm_get_device_by_handle(nv_handle);
> +
> +    if (nvdimm->label_size) {
> +        nvdimm_dsm_label_size(nvdimm, dsm_mem_addr);
> +    }
> +
> +    return;
> +}
> +
> +static void nvdimm_lsr_handle(uint32_t nv_handle,
> +                                    void *data,
> +                                    hwaddr dsm_mem_addr)
> +{
> +    NVDIMMDevice *nvdimm =3D nvdimm_get_device_by_handle(nv_handle);
> +    NvdimmFuncGetLabelDataIn *get_label_data =3D data;
> +
> +    if (nvdimm->label_size) {
> +        nvdimm_dsm_get_label_data(nvdimm, get_label_data, dsm_mem_addr);
> +    }
> +    return;
> +}
> +
> +static void nvdimm_lsw_handle(uint32_t nv_handle,
> +                                    void *data,
> +                                    hwaddr dsm_mem_addr)
> +{
> +    NVDIMMDevice *nvdimm =3D nvdimm_get_device_by_handle(nv_handle);
> +    NvdimmFuncSetLabelDataIn *set_label_data =3D data;
> +
> +    if (nvdimm->label_size) {
> +        nvdimm_dsm_set_label_data(nvdimm, set_label_data, dsm_mem_addr);
> +    }
> +    return;
> +}
> +
> +static void
> +nvdimm_method_write(void *opaque, hwaddr addr, uint64_t val, unsigned si=
ze)
> +{
> +    NvdimmMthdIn *method_in;
> +    hwaddr dsm_mem_addr =3D val;
> +
> +    /*
> +     * The DSM memory is mapped to guest address space so an evil guest
> +     * can change its content while we are doing DSM emulation. Avoid
> +     * this by copying DSM memory to QEMU local memory.
> +     */
> +    method_in =3D g_new(NvdimmMthdIn, 1);
> +    cpu_physical_memory_read(dsm_mem_addr, method_in, sizeof(*method_in)=
);
> +
> +    method_in->handle =3D le32_to_cpu(method_in->handle);
> +    method_in->method =3D le32_to_cpu(method_in->method);
> +
> +    switch (method_in->method) {
> +    case NVDIMM_METHOD_DSM:
> +        nvdimm_dsm_handle(opaque, method_in, dsm_mem_addr);
> +        break;
> +    case NVDIMM_METHOD_LSI:
> +        nvdimm_lsi_handle(method_in->handle, dsm_mem_addr);
> +        break;
> +    case NVDIMM_METHOD_LSR:
> +        nvdimm_lsr_handle(method_in->handle, method_in->args, dsm_mem_ad=
dr);
> +        break;
> +    case NVDIMM_METHOD_LSW:
> +        nvdimm_lsw_handle(method_in->handle, method_in->args, dsm_mem_ad=
dr);
> +        break;
> +    default:
> +        nvdimm_debug("%s: Unkown method 0x%x\n", __func__, method_in->me=
thod);
> +        break;
> +    }
> +
> +    g_free(method_in);
>  }
> =20
> -static const MemoryRegionOps nvdimm_dsm_ops =3D {
> -    .read =3D nvdimm_dsm_read,
> -    .write =3D nvdimm_dsm_write,
> +static const MemoryRegionOps nvdimm_method_ops =3D {
> +    .read =3D nvdimm_method_read,
> +    .write =3D nvdimm_method_write,
>      .endianness =3D DEVICE_LITTLE_ENDIAN,
>      .valid =3D {
>          .min_access_size =3D 4,
> @@ -899,12 +972,12 @@ void nvdimm_init_acpi_state(NVDIMMState *state, Mem=
oryRegion *io,
>                              FWCfgState *fw_cfg, Object *owner)
>  {
>      state->dsm_io =3D dsm_io;
> -    memory_region_init_io(&state->io_mr, owner, &nvdimm_dsm_ops, state,
> +    memory_region_init_io(&state->io_mr, owner, &nvdimm_method_ops, stat=
e,
>                            "nvdimm-acpi-io", dsm_io.bit_width >> 3);
>      memory_region_add_subregion(io, dsm_io.address, &state->io_mr);
> =20
>      state->dsm_mem =3D g_array_new(false, true /* clear */, 1);
> -    acpi_data_push(state->dsm_mem, sizeof(NvdimmDsmIn));
> +    acpi_data_push(state->dsm_mem, sizeof(NvdimmMthdIn));
>      fw_cfg_add_file(fw_cfg, NVDIMM_DSM_MEM_FILE, state->dsm_mem->data,
>                      state->dsm_mem->len);
> =20
> @@ -918,13 +991,22 @@ void nvdimm_init_acpi_state(NVDIMMState *state, Mem=
oryRegion *io,
>  #define NVDIMM_DSM_IOPORT       "NPIO"
> =20
>  #define NVDIMM_DSM_NOTIFY       "NTFI"
> +#define NVDIMM_DSM_METHOD       "MTHD"
>  #define NVDIMM_DSM_HANDLE       "HDLE"
>  #define NVDIMM_DSM_REVISION     "REVS"
>  #define NVDIMM_DSM_FUNCTION     "FUNC"
>  #define NVDIMM_DSM_ARG3         "FARG"
> =20
> -#define NVDIMM_DSM_OUT_BUF_SIZE "RLEN"
> -#define NVDIMM_DSM_OUT_BUF      "ODAT"
> +#define NVDIMM_DSM_OFFSET       "OFST"
> +#define NVDIMM_DSM_TRANS_LEN    "TRSL"
> +#define NVDIMM_DSM_IN_BUFF      "IDAT"
> +
> +#define NVDIMM_DSM_OUT_BUF_SIZE     "RLEN"
> +#define NVDIMM_DSM_OUT_BUF          "ODAT"
> +#define NVDIMM_DSM_OUT_STATUS       "STUS"
> +#define NVDIMM_DSM_OUT_LSA_SIZE     "SIZE"
> +#define NVDIMM_DSM_OUT_MAX_TRANS    "MAXT"
> +
> =20
>  #define NVDIMM_DSM_RFIT_STATUS  "RSTA"
> =20
> @@ -938,7 +1020,6 @@ static void nvdimm_build_common_dsm(Aml *dev,
>      Aml *pckg, *pckg_index, *pckg_buf, *field, *dsm_out_buf, *dsm_out_bu=
f_size;
>      Aml *whilectx, *offset;
>      uint8_t byte_list[1];
> -    AmlRegionSpace rs;
> =20
>      method =3D aml_method(NVDIMM_COMMON_DSM, 5, AML_SERIALIZED);
>      uuid =3D aml_arg(0);
> @@ -949,37 +1030,15 @@ static void nvdimm_build_common_dsm(Aml *dev,
> =20
>      aml_append(method, aml_store(aml_name(NVDIMM_ACPI_MEM_ADDR), dsm_mem=
));
> =20
> -    if (nvdimm_state->dsm_io.space_id =3D=3D AML_AS_SYSTEM_IO) {
> -        rs =3D AML_SYSTEM_IO;
> -    } else {
> -        rs =3D AML_SYSTEM_MEMORY;
> -    }
> -
> -    /* map DSM memory and IO into ACPI namespace. */
> -    aml_append(method, aml_operation_region(NVDIMM_DSM_IOPORT, rs,
> -               aml_int(nvdimm_state->dsm_io.address),
> -               nvdimm_state->dsm_io.bit_width >> 3));
>      aml_append(method, aml_operation_region(NVDIMM_DSM_MEMORY,
> -               AML_SYSTEM_MEMORY, dsm_mem, sizeof(NvdimmDsmIn)));
> -
> -    /*
> -     * DSM notifier:
> -     * NVDIMM_DSM_NOTIFY: write the address of DSM memory and notify QEM=
U to
> -     *                    emulate the access.
> -     *
> -     * It is the IO port so that accessing them will cause VM-exit, the
> -     * control will be transferred to QEMU.
> -     */
> -    field =3D aml_field(NVDIMM_DSM_IOPORT, AML_DWORD_ACC, AML_NOLOCK,
> -                      AML_PRESERVE);
> -    aml_append(field, aml_named_field(NVDIMM_DSM_NOTIFY,
> -               nvdimm_state->dsm_io.bit_width));
> -    aml_append(method, field);
> +               AML_SYSTEM_MEMORY, dsm_mem, sizeof(NvdimmMthdIn)));
> =20
>      /*
>       * DSM input:
>       * NVDIMM_DSM_HANDLE: store device's handle, it's zero if the _DSM c=
all
>       *                    happens on NVDIMM Root Device.
> +     * NVDIMM_DSM_METHOD: ACPI method indicator, to distinguish _DSM and
> +     *                    other ACPI methods.
>       * NVDIMM_DSM_REVISION: store the Arg1 of _DSM call.
>       * NVDIMM_DSM_FUNCTION: store the Arg2 of _DSM call.
>       * NVDIMM_DSM_ARG3: store the Arg3 of _DSM call which is a Package
> @@ -991,13 +1050,16 @@ static void nvdimm_build_common_dsm(Aml *dev,
>      field =3D aml_field(NVDIMM_DSM_MEMORY, AML_DWORD_ACC, AML_NOLOCK,
>                        AML_PRESERVE);
>      aml_append(field, aml_named_field(NVDIMM_DSM_HANDLE,
> -               sizeof(typeof_field(NvdimmDsmIn, handle)) * BITS_PER_BYTE=
));
> +               sizeof(typeof_field(NvdimmMthdIn, handle)) * BITS_PER_BYT=
E));
> +    aml_append(field, aml_named_field(NVDIMM_DSM_METHOD,
> +               sizeof(typeof_field(NvdimmMthdIn, method)) * BITS_PER_BYT=
E));
>      aml_append(field, aml_named_field(NVDIMM_DSM_REVISION,
>                 sizeof(typeof_field(NvdimmDsmIn, revision)) * BITS_PER_BY=
TE));
>      aml_append(field, aml_named_field(NVDIMM_DSM_FUNCTION,
>                 sizeof(typeof_field(NvdimmDsmIn, function)) * BITS_PER_BY=
TE));
>      aml_append(field, aml_named_field(NVDIMM_DSM_ARG3,
> -         (sizeof(NvdimmDsmIn) - offsetof(NvdimmDsmIn, arg3)) * BITS_PER_=
BYTE));
> +         (sizeof(NvdimmMthdIn) - offsetof(NvdimmMthdIn, args) -
> +          offsetof(NvdimmDsmIn, arg3)) * BITS_PER_BYTE));
>      aml_append(method, field);
> =20
>      /*
> @@ -1065,6 +1127,7 @@ static void nvdimm_build_common_dsm(Aml *dev,
>       * it reserves 0 for root device and is the handle for NVDIMM device=
s.
>       * See the comments in nvdimm_slot_to_handle().
>       */
> +    aml_append(method, aml_store(aml_int(0), aml_name(NVDIMM_DSM_METHOD)=
));
>      aml_append(method, aml_store(handle, aml_name(NVDIMM_DSM_HANDLE)));
>      aml_append(method, aml_store(aml_arg(1), aml_name(NVDIMM_DSM_REVISIO=
N)));
>      aml_append(method, aml_store(function, aml_name(NVDIMM_DSM_FUNCTION)=
));
> @@ -1250,6 +1313,7 @@ static void nvdimm_build_fit(Aml *dev)
>  static void nvdimm_build_nvdimm_devices(Aml *root_dev, uint32_t ram_slot=
s)
>  {
>      uint32_t slot;
> +    Aml *method, *pkg, *field;
> =20
>      for (slot =3D 0; slot < ram_slots; slot++) {
>          uint32_t handle =3D nvdimm_slot_to_handle(slot);
> @@ -1266,6 +1330,155 @@ static void nvdimm_build_nvdimm_devices(Aml *root=
_dev, uint32_t ram_slots)
>           * table NFIT or _FIT.
>           */
>          aml_append(nvdimm_dev, aml_name_decl("_ADR", aml_int(handle)));
> +        aml_append(nvdimm_dev, aml_operation_region(NVDIMM_DSM_MEMORY,
> +                   AML_SYSTEM_MEMORY, aml_name(NVDIMM_ACPI_MEM_ADDR),
> +                   sizeof(NvdimmMthdIn)));
> +
> +        /* ACPI 6.4: 6.5.10 NVDIMM Label Methods, _LS{I,R,W} */
> +
> +        /* Begin of _LSI Block */
> +        method =3D aml_method("_LSI", 0, AML_SERIALIZED);
> +        /* _LSI Input field */
> +        field =3D aml_field(NVDIMM_DSM_MEMORY, AML_DWORD_ACC, AML_NOLOCK,
> +                          AML_PRESERVE);
> +        aml_append(field, aml_named_field(NVDIMM_DSM_HANDLE,
> +                   sizeof(typeof_field(NvdimmMthdIn, handle)) * BITS_PER=
_BYTE));
> +        aml_append(field, aml_named_field(NVDIMM_DSM_METHOD,
> +                   sizeof(typeof_field(NvdimmMthdIn, method)) * BITS_PER=
_BYTE));
> +        aml_append(method, field);
> +
> +        /* _LSI Output field */
> +        field =3D aml_field(NVDIMM_DSM_MEMORY, AML_DWORD_ACC, AML_NOLOCK,
> +                          AML_PRESERVE);
> +        aml_append(field, aml_named_field(NVDIMM_DSM_OUT_BUF_SIZE,
> +                   sizeof(typeof_field(NvdimmFuncGetLabelSizeOut, len)) *
> +                   BITS_PER_BYTE));
> +        aml_append(field, aml_named_field(NVDIMM_DSM_OUT_STATUS,
> +                   sizeof(typeof_field(NvdimmFuncGetLabelSizeOut,
> +                   func_ret_status)) * BITS_PER_BYTE));
> +        aml_append(field, aml_named_field(NVDIMM_DSM_OUT_LSA_SIZE,
> +                   sizeof(typeof_field(NvdimmFuncGetLabelSizeOut, label_=
size)) *
> +                   BITS_PER_BYTE));
> +        aml_append(field, aml_named_field(NVDIMM_DSM_OUT_MAX_TRANS,
> +                   sizeof(typeof_field(NvdimmFuncGetLabelSizeOut, max_xf=
er)) *
> +                   BITS_PER_BYTE));
> +        aml_append(method, field);
> +
> +        aml_append(method, aml_store(aml_int(handle),
> +                                      aml_name(NVDIMM_DSM_HANDLE)));
> +        aml_append(method, aml_store(aml_int(0x100),
> +                                      aml_name(NVDIMM_DSM_METHOD)));
> +        aml_append(method, aml_store(aml_name(NVDIMM_ACPI_MEM_ADDR),
> +                                      aml_name(NVDIMM_DSM_NOTIFY)));
> +
> +        pkg =3D aml_package(3);
> +        aml_append(pkg, aml_name(NVDIMM_DSM_OUT_STATUS));
> +        aml_append(pkg, aml_name(NVDIMM_DSM_OUT_LSA_SIZE));
> +        aml_append(pkg, aml_name(NVDIMM_DSM_OUT_MAX_TRANS));
> +
> +        aml_append(method, aml_name_decl("RPKG", pkg));
> +
> +        aml_append(method, aml_return(aml_name("RPKG")));
> +        aml_append(nvdimm_dev, method); /* End of _LSI Block */
> +
> +
> +        /* Begin of _LSR Block */
> +        method =3D aml_method("_LSR", 2, AML_SERIALIZED);
> +
> +        /* _LSR Input field */
> +        field =3D aml_field(NVDIMM_DSM_MEMORY, AML_DWORD_ACC, AML_NOLOCK,
> +                          AML_PRESERVE);
> +        aml_append(field, aml_named_field(NVDIMM_DSM_HANDLE,
> +                   sizeof(typeof_field(NvdimmMthdIn, handle)) *
> +                   BITS_PER_BYTE));
> +        aml_append(field, aml_named_field(NVDIMM_DSM_METHOD,
> +                   sizeof(typeof_field(NvdimmMthdIn, method)) *
> +                   BITS_PER_BYTE));
> +        aml_append(field, aml_named_field(NVDIMM_DSM_OFFSET,
> +                   sizeof(typeof_field(NvdimmFuncGetLabelDataIn, offset)=
) *
> +                   BITS_PER_BYTE));
> +        aml_append(field, aml_named_field(NVDIMM_DSM_TRANS_LEN,
> +                   sizeof(typeof_field(NvdimmFuncGetLabelDataIn, length)=
) *
> +                   BITS_PER_BYTE));
> +        aml_append(method, field);
> +
> +        /* _LSR Output field */
> +        field =3D aml_field(NVDIMM_DSM_MEMORY, AML_DWORD_ACC, AML_NOLOCK,
> +                          AML_PRESERVE);
> +        aml_append(field, aml_named_field(NVDIMM_DSM_OUT_BUF_SIZE,
> +                   sizeof(typeof_field(NvdimmFuncGetLabelDataOut, len)) *
> +                   BITS_PER_BYTE));
> +        aml_append(field, aml_named_field(NVDIMM_DSM_OUT_STATUS,
> +                   sizeof(typeof_field(NvdimmFuncGetLabelDataOut,
> +                   func_ret_status)) * BITS_PER_BYTE));
> +        aml_append(field, aml_named_field(NVDIMM_DSM_OUT_BUF,
> +                   (NVDIMM_DSM_MEMORY_SIZE -
> +                    offsetof(NvdimmFuncGetLabelDataOut, out_buf)) *
> +                    BITS_PER_BYTE));
> +        aml_append(method, field);
> +
> +        aml_append(method, aml_store(aml_int(handle),
> +                                      aml_name(NVDIMM_DSM_HANDLE)));
> +        aml_append(method, aml_store(aml_int(0x101),
> +                                      aml_name(NVDIMM_DSM_METHOD)));
> +        aml_append(method, aml_store(aml_arg(0), aml_name(NVDIMM_DSM_OFF=
SET)));
> +        aml_append(method, aml_store(aml_arg(1),
> +                                      aml_name(NVDIMM_DSM_TRANS_LEN)));
> +        aml_append(method, aml_store(aml_name(NVDIMM_ACPI_MEM_ADDR),
> +                                      aml_name(NVDIMM_DSM_NOTIFY)));
> +
> +        aml_append(method, aml_store(aml_shiftleft(aml_arg(1), aml_int(3=
)),
> +                                         aml_local(1)));
> +        aml_append(method, aml_create_field(aml_name(NVDIMM_DSM_OUT_BUF),
> +                   aml_int(0), aml_local(1), "OBUF"));
> +
> +        pkg =3D aml_package(2);
> +        aml_append(pkg, aml_name(NVDIMM_DSM_OUT_STATUS));
> +        aml_append(pkg, aml_name("OBUF"));
> +        aml_append(method, aml_name_decl("RPKG", pkg));
> +
> +        aml_append(method, aml_return(aml_name("RPKG")));
> +        aml_append(nvdimm_dev, method); /* End of _LSR Block */
> +
> +        /* Begin of _LSW Block */
> +        method =3D aml_method("_LSW", 3, AML_SERIALIZED);
> +        /* _LSW Input field */
> +        field =3D aml_field(NVDIMM_DSM_MEMORY, AML_DWORD_ACC, AML_NOLOCK,
> +                          AML_PRESERVE);
> +        aml_append(field, aml_named_field(NVDIMM_DSM_HANDLE,
> +                   sizeof(typeof_field(NvdimmMthdIn, handle)) * BITS_PER=
_BYTE));
> +        aml_append(field, aml_named_field(NVDIMM_DSM_METHOD,
> +                   sizeof(typeof_field(NvdimmMthdIn, method)) * BITS_PER=
_BYTE));
> +        aml_append(field, aml_named_field(NVDIMM_DSM_OFFSET,
> +                   sizeof(typeof_field(NvdimmFuncSetLabelDataIn, offset)=
) *
> +                   BITS_PER_BYTE));
> +        aml_append(field, aml_named_field(NVDIMM_DSM_TRANS_LEN,
> +                   sizeof(typeof_field(NvdimmFuncSetLabelDataIn, length)=
) *
> +                   BITS_PER_BYTE));
> +        aml_append(field, aml_named_field(NVDIMM_DSM_IN_BUFF, 32640));
> +        aml_append(method, field);
> +
> +        /* _LSW Output field */
> +        field =3D aml_field(NVDIMM_DSM_MEMORY, AML_DWORD_ACC, AML_NOLOCK,
> +                          AML_PRESERVE);
> +        aml_append(field, aml_named_field(NVDIMM_DSM_OUT_BUF_SIZE,
> +                   sizeof(typeof_field(NvdimmDsmFuncNoPayloadOut, len)) *
> +                   BITS_PER_BYTE));
> +        aml_append(field, aml_named_field(NVDIMM_DSM_OUT_STATUS,
> +                   sizeof(typeof_field(NvdimmDsmFuncNoPayloadOut,
> +                   func_ret_status)) * BITS_PER_BYTE));
> +        aml_append(method, field);
> +
> +        aml_append(method, aml_store(aml_int(handle), aml_name(NVDIMM_DS=
M_HANDLE)));
> +        aml_append(method, aml_store(aml_int(0x102), aml_name(NVDIMM_DSM=
_METHOD)));
> +        aml_append(method, aml_store(aml_arg(0), aml_name(NVDIMM_DSM_OFF=
SET)));
> +        aml_append(method, aml_store(aml_arg(1), aml_name(NVDIMM_DSM_TRA=
NS_LEN)));
> +        aml_append(method, aml_store(aml_arg(2), aml_name(NVDIMM_DSM_IN_=
BUFF)));
> +        aml_append(method, aml_store(aml_name(NVDIMM_ACPI_MEM_ADDR),
> +                                      aml_name(NVDIMM_DSM_NOTIFY)));
> +
> +        aml_append(method, aml_return(aml_name(NVDIMM_DSM_OUT_STATUS)));
> +        aml_append(nvdimm_dev, method); /* End of _LSW Block */
> =20
>          nvdimm_build_device_dsm(nvdimm_dev, handle);
>          aml_append(root_dev, nvdimm_dev);
> @@ -1278,7 +1491,8 @@ static void nvdimm_build_ssdt(GArray *table_offsets=
, GArray *table_data,
>                                uint32_t ram_slots, const char *oem_id)
>  {
>      int mem_addr_offset;
> -    Aml *ssdt, *sb_scope, *dev;
> +    Aml *ssdt, *sb_scope, *dev, *field;
> +    AmlRegionSpace rs;
>      AcpiTable table =3D { .sig =3D "SSDT", .rev =3D 1,
>                          .oem_id =3D oem_id, .oem_table_id =3D "NVDIMM" };
> =20
> @@ -1286,6 +1500,9 @@ static void nvdimm_build_ssdt(GArray *table_offsets=
, GArray *table_data,
> =20
>      acpi_table_begin(&table, table_data);
>      ssdt =3D init_aml_allocator();
> +
> +    mem_addr_offset =3D build_append_named_dword(table_data,
> +                                               NVDIMM_ACPI_MEM_ADDR);
>      sb_scope =3D aml_scope("\\_SB");
> =20
>      dev =3D aml_device("NVDR");
> @@ -1303,6 +1520,31 @@ static void nvdimm_build_ssdt(GArray *table_offset=
s, GArray *table_data,
>       */
>      aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0012")));
> =20
> +    if (nvdimm_state->dsm_io.space_id =3D=3D AML_AS_SYSTEM_IO) {
> +        rs =3D AML_SYSTEM_IO;
> +    } else {
> +        rs =3D AML_SYSTEM_MEMORY;
> +    }
> +
> +    /* map DSM memory and IO into ACPI namespace. */
> +    aml_append(dev, aml_operation_region(NVDIMM_DSM_IOPORT, rs,
> +               aml_int(nvdimm_state->dsm_io.address),
> +               nvdimm_state->dsm_io.bit_width >> 3));
> +
> +    /*
> +     * DSM notifier:
> +     * NVDIMM_DSM_NOTIFY: write the address of DSM memory and notify QEM=
U to
> +     *                    emulate the access.
> +     *
> +     * It is the IO port so that accessing them will cause VM-exit, the
> +     * control will be transferred to QEMU.
> +     */
> +    field =3D aml_field(NVDIMM_DSM_IOPORT, AML_DWORD_ACC, AML_NOLOCK,
> +                      AML_PRESERVE);
> +    aml_append(field, aml_named_field(NVDIMM_DSM_NOTIFY,
> +               nvdimm_state->dsm_io.bit_width));
> +    aml_append(dev, field);
> +
>      nvdimm_build_common_dsm(dev, nvdimm_state);
> =20
>      /* 0 is reserved for root device. */
> @@ -1316,12 +1558,10 @@ static void nvdimm_build_ssdt(GArray *table_offse=
ts, GArray *table_data,
> =20
>      /* copy AML table into ACPI tables blob and patch header there */
>      g_array_append_vals(table_data, ssdt->buf->data, ssdt->buf->len);
> -    mem_addr_offset =3D build_append_named_dword(table_data,
> -                                               NVDIMM_ACPI_MEM_ADDR);
> =20
>      bios_linker_loader_alloc(linker,
>                               NVDIMM_DSM_MEM_FILE, nvdimm_state->dsm_mem,
> -                             sizeof(NvdimmDsmIn), false /* high memory *=
/);
> +                             sizeof(NvdimmMthdIn), false /* high memory =
*/);
>      bios_linker_loader_add_pointer(linker,
>          ACPI_BUILD_TABLE_FILE, mem_addr_offset, sizeof(uint32_t),
>          NVDIMM_DSM_MEM_FILE, 0);
> diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
> index cf8f59be44..0206b6125b 100644
> --- a/include/hw/mem/nvdimm.h
> +++ b/include/hw/mem/nvdimm.h
> @@ -37,6 +37,12 @@
>          }                                                     \
>      } while (0)
> =20
> +/* NVDIMM ACPI Methods */
> +#define NVDIMM_METHOD_DSM   0
> +#define NVDIMM_METHOD_LSI   0x100
> +#define NVDIMM_METHOD_LSR   0x101
> +#define NVDIMM_METHOD_LSW   0x102
> +
>  /*
>   * The minimum label data size is required by NVDIMM Namespace
>   * specification, see the chapter 2 Namespaces:


