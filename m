Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F19354E160
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 15:04:00 +0200 (CEST)
Received: from localhost ([::1]:37162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1pAF-0008TC-96
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 09:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o1oj0-0004iJ-4C
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:35:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o1oiw-0003QH-SP
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655382946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j+y7VpUIoy8ejKuA7e0mKnsfww5OOvMgAhfK1LFuUP4=;
 b=XgpY0e6tqDe3I+lJbJFba5l69MqNdCUBi7APJZ2pj+Q5Dd5KGVVCV0MQH24US6GAIw/kzY
 VHhh48IYwurmqIBSaOvIWH3NUY4j3LtgfTxaBJax8/2/pISdHw0YRJjWmD6R1wjxPgIfrE
 pCYqYt3cMJpMH27E8vrFZWXL1pxpR/I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-RyZonnRUMrqblnDSuHd2_g-1; Thu, 16 Jun 2022 08:35:45 -0400
X-MC-Unique: RyZonnRUMrqblnDSuHd2_g-1
Received: by mail-wm1-f69.google.com with SMTP id
 p6-20020a05600c358600b0039c873184b9so844358wmq.4
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 05:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j+y7VpUIoy8ejKuA7e0mKnsfww5OOvMgAhfK1LFuUP4=;
 b=KhDaD4ZxwulaALYzvyJ3fwru1jsmIFR53WT/t6ke/BeM1XuSgnyNjVHQ1lRYRcVgIi
 hrSbOjcvyjNsUs/I4LhCJGj3ps6pHGr/j/izujNYdciaO31jBQfZBwHEceIQYnxEEgLH
 EycRgeCAKvd8FzDCmGYyH1GomQeq8OkDH9quz9q/6HWd2nx2i5DAwYn6AFfnOUrShwOi
 VhN9qFQ3ZnfJjkO5K4PfUSgN+AAg4eTfvN4J3gWe8MbvkzGxHjGPHdrvNKU3GJejxV6v
 854qHKKYiVk4kWvenzdmUzfujy5ZuAhaRFNXVB7KdGXRQTfh9zVXppmtqSbH1H1KgKye
 nZ3A==
X-Gm-Message-State: AJIora+5FKrvgU+wSEKDZ1vgzvqw0HFa8v+K5mt2yCo142LqTrtXYtQV
 qxwehFC4Jtb6LCd+Zc9N8OG1SKA5lucloK4hPt/ZdP/99Ulv/5NfM1mHdoS2RLZc2iAk0C3gmXX
 qeXTNngFfsYH+AvY=
X-Received: by 2002:a5d:48c1:0:b0:21a:3574:e70c with SMTP id
 p1-20020a5d48c1000000b0021a3574e70cmr2504619wrs.97.1655382943951; 
 Thu, 16 Jun 2022 05:35:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vUFxAiCG4nGFDSnQrrvCg7y5GRVcq2XpqEl5K78zUY+NciiP6q7Y/DcCYPsn0O1L1oSAeQ4w==
X-Received: by 2002:a5d:48c1:0:b0:21a:3574:e70c with SMTP id
 p1-20020a5d48c1000000b0021a3574e70cmr2504596wrs.97.1655382943662; 
 Thu, 16 Jun 2022 05:35:43 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 i22-20020a05600c355600b003973b9d0447sm7758562wmq.36.2022.06.16.05.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 05:35:43 -0700 (PDT)
Date: Thu, 16 Jun 2022 14:35:42 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Cc: mst@redhat.com, xiaoguangrong.eric@gmail.com, ani@anisinha.ca,
 dan.j.williams@intel.com, jingqi.liu@intel.com, qemu-devel@nongnu.org,
 robert.hu@intel.com
Subject: Re: [QEMU PATCH v2 6/6] acpi/nvdimm: Define trace events for NVDIMM
 and substitute nvdimm_debug()
Message-ID: <20220616143542.3e049a13@redhat.com>
In-Reply-To: <20220530034047.730356-7-robert.hu@linux.intel.com>
References: <20220530034047.730356-1-robert.hu@linux.intel.com>
 <20220530034047.730356-7-robert.hu@linux.intel.com>
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

On Mon, 30 May 2022 11:40:47 +0800
Robert Hoo <robert.hu@linux.intel.com> wrote:

suggest to put this patch as the 1st in series
(well you can rebase it on current master and
post that right away for merging since it doesn't
really depend on other patches, and post new patches on
top (whenever they are ready) will use tracing)

> Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>
> ---
>  hw/acpi/nvdimm.c        | 38 ++++++++++++++++++--------------------
>  hw/acpi/trace-events    | 14 ++++++++++++++
>  include/hw/mem/nvdimm.h |  8 --------
>  3 files changed, 32 insertions(+), 28 deletions(-)
>=20
> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> index 50ee85866b..fc777990e6 100644
> --- a/hw/acpi/nvdimm.c
> +++ b/hw/acpi/nvdimm.c
> @@ -35,6 +35,7 @@
>  #include "hw/nvram/fw_cfg.h"
>  #include "hw/mem/nvdimm.h"
>  #include "qemu/nvdimm-utils.h"
> +#include "trace.h"
> =20
>  /*
>   * define Byte Addressable Persistent Memory (PM) Region according to
> @@ -558,8 +559,8 @@ static void nvdimm_dsm_func_read_fit(NVDIMMState *sta=
te, NvdimmDsmIn *in,
> =20
>      fit =3D fit_buf->fit;
> =20
> -    nvdimm_debug("Read FIT: offset 0x%x FIT size 0x%x Dirty %s.\n",
> -                 read_fit->offset, fit->len, fit_buf->dirty ? "Yes" : "N=
o");
> +    trace_acpi_nvdimm_read_fit(read_fit->offset, fit->len,
> +                               fit_buf->dirty ? "Yes" : "No");
> =20
>      if (read_fit->offset > fit->len) {
>          func_ret_status =3D NVDIMM_DSM_RET_STATUS_INVALID;
> @@ -667,7 +668,7 @@ static void nvdimm_dsm_label_size(NVDIMMDevice *nvdim=
m, hwaddr dsm_mem_addr)
>      label_size =3D nvdimm->label_size;
>      mxfer =3D nvdimm_get_max_xfer_label_size();
> =20
> -    nvdimm_debug("label_size 0x%x, max_xfer 0x%x.\n", label_size, mxfer);
> +    trace_acpi_nvdimm_label_info(label_size, mxfer);
> =20
>      label_size_out.func_ret_status =3D cpu_to_le32(NVDIMM_DSM_RET_STATUS=
_SUCCESS);
>      label_size_out.label_size =3D cpu_to_le32(label_size);
> @@ -683,20 +684,18 @@ static uint32_t nvdimm_rw_label_data_check(NVDIMMDe=
vice *nvdimm,
>      uint32_t ret =3D NVDIMM_DSM_RET_STATUS_INVALID;
> =20
>      if (offset + length < offset) {
> -        nvdimm_debug("offset 0x%x + length 0x%x is overflow.\n", offset,
> -                     length);
> +        trace_acpi_nvdimm_label_overflow(offset, length);
>          return ret;
>      }
> =20
>      if (nvdimm->label_size < offset + length) {
> -        nvdimm_debug("position 0x%x is beyond label data (len =3D %" PRI=
x64 ").\n",
> -                     offset + length, nvdimm->label_size);
> +        trace_acpi_nvdimm_label_oversize(offset + length, nvdimm->label_=
size);
>          return ret;
>      }
> =20
>      if (length > nvdimm_get_max_xfer_label_size()) {
> -        nvdimm_debug("length (0x%x) is larger than max_xfer (0x%x).\n",
> -                     length, nvdimm_get_max_xfer_label_size());
> +        trace_acpi_nvdimm_label_xfer_exceed(length,
> +                                            nvdimm_get_max_xfer_label_si=
ze());
>          return ret;
>      }
> =20
> @@ -718,8 +717,8 @@ static void nvdimm_dsm_get_label_data(NVDIMMDevice *n=
vdimm,
>      get_label_data->offset =3D le32_to_cpu(get_label_data->offset);
>      get_label_data->length =3D le32_to_cpu(get_label_data->length);
> =20
> -    nvdimm_debug("Read Label Data: offset 0x%x length 0x%x.\n",
> -                 get_label_data->offset, get_label_data->length);
> +    trace_acpi_nvdimm_read_label(get_label_data->offset,
> +                                 get_label_data->length);
> =20
>      status =3D nvdimm_rw_label_data_check(nvdimm, get_label_data->offset,
>                                          get_label_data->length);
> @@ -755,8 +754,8 @@ static void nvdimm_dsm_set_label_data(NVDIMMDevice *n=
vdimm,
>      set_label_data->offset =3D le32_to_cpu(set_label_data->offset);
>      set_label_data->length =3D le32_to_cpu(set_label_data->length);
> =20
> -    nvdimm_debug("Write Label Data: offset 0x%x length 0x%x.\n",
> -                 set_label_data->offset, set_label_data->length);
> +    trace_acpi_nvdimm_write_label(set_label_data->offset,
> +                                  set_label_data->length);
> =20
>      status =3D nvdimm_rw_label_data_check(nvdimm, set_label_data->offset,
>                                          set_label_data->length);
> @@ -833,7 +832,7 @@ static void nvdimm_dsm_device(uint32_t nv_handle, Nvd=
immDsmIn *dsm_in,
>  static uint64_t
>  nvdimm_method_read(void *opaque, hwaddr addr, unsigned size)
>  {
> -    nvdimm_debug("BUG: we never read NVDIMM Method IO Port.\n");
> +    trace_acpi_nvdimm_read_io_port();
>      return 0;
>  }
> =20
> @@ -843,20 +842,19 @@ nvdimm_dsm_handle(void *opaque, NvdimmMthdIn *metho=
d_in, hwaddr dsm_mem_addr)
>      NVDIMMState *state =3D opaque;
>      NvdimmDsmIn *dsm_in =3D (NvdimmDsmIn *)method_in->args;
> =20
> -    nvdimm_debug("dsm memory address 0x%" HWADDR_PRIx ".\n", dsm_mem_add=
r);
> +    trace_acpi_nvdimm_dsm_mem_addr(dsm_mem_addr);
> =20
>      dsm_in->revision =3D le32_to_cpu(dsm_in->revision);
>      dsm_in->function =3D le32_to_cpu(dsm_in->function);
> =20
> -    nvdimm_debug("Revision 0x%x Handler 0x%x Function 0x%x.\n",
> -                 dsm_in->revision, method_in->handle, dsm_in->function);
> +    trace_acpi_nvdimm_dsm_info(dsm_in->revision,
> +                 method_in->handle, dsm_in->function);
>      /*
>       * Current NVDIMM _DSM Spec supports Rev1 and Rev2
>       * Intel=C2=AE OptanePersistent Memory Module DSM Interface, Revisio=
n 2.0
>       */
>      if (dsm_in->revision !=3D 0x1 && dsm_in->revision !=3D 0x2) {
> -        nvdimm_debug("Revision 0x%x is not supported, expect 0x1 or 0x2.=
\n",
> -                     dsm_in->revision);
> +        trace_acpi_nvdimm_invalid_revision(dsm_in->revision);
>          nvdimm_dsm_no_payload(NVDIMM_DSM_RET_STATUS_UNSUPPORT, dsm_mem_a=
ddr);
>          return;
>      }
> @@ -943,7 +941,7 @@ nvdimm_method_write(void *opaque, hwaddr addr, uint64=
_t val, unsigned size)
>          nvdimm_lsw_handle(method_in->handle, method_in->args, dsm_mem_ad=
dr);
>          break;
>      default:
> -        nvdimm_debug("%s: Unkown method 0x%x\n", __func__, method_in->me=
thod);
> +        trace_acpi_nvdimm_invalid_method(method_in->method);
>          break;
>      }
> =20
> diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
> index 2250126a22..db4c69009f 100644
> --- a/hw/acpi/trace-events
> +++ b/hw/acpi/trace-events
> @@ -70,3 +70,17 @@ acpi_erst_reset_out(unsigned record_count) "record_cou=
nt %u"
>  acpi_erst_post_load(void *header, unsigned slot_size) "header: 0x%p slot=
_size %u"
>  acpi_erst_class_init_in(void)
>  acpi_erst_class_init_out(void)
> +
> +# nvdimm.c
> +acpi_nvdimm_read_fit(uint32_t offset, uint32_t len, const char *dirty) "=
Read FIT: offset 0x%" PRIx32 " FIT size 0x%" PRIx32 " Dirty %s"
> +acpi_nvdimm_label_info(uint32_t label_size, uint32_t mxfer) "label_size =
0x%" PRIx32 ", max_xfer 0x%" PRIx32
> +acpi_nvdimm_label_overflow(uint32_t offset, uint32_t length) "offset 0x%=
" PRIx32 " + length 0x%" PRIx32 " is overflow"
> +acpi_nvdimm_label_oversize(uint32_t pos, uint64_t size) "position 0x%" P=
RIx32 " is beyond label data (len =3D %" PRIu64 ")"
> +acpi_nvdimm_label_xfer_exceed(uint32_t length, uint32_t max_xfer) "lengt=
h (0x%" PRIx32 ") is larger than max_xfer (0x%" PRIx32 ")"
> +acpi_nvdimm_read_label(uint32_t offset, uint32_t length) "Read Label Dat=
a: offset 0x%" PRIx32 " length 0x%" PRIx32
> +acpi_nvdimm_write_label(uint32_t offset, uint32_t length) "Write Label D=
ata: offset 0x%" PRIx32 " length 0x%" PRIx32
> +acpi_nvdimm_read_io_port(void) "Alert: we never read NVDIMM Method IO Po=
rt"
> +acpi_nvdimm_dsm_mem_addr(uint64_t dsm_mem_addr) "dsm memory address 0x%"=
 PRIx64
> +acpi_nvdimm_dsm_info(uint32_t revision, uint32_t handle, uint32_t functi=
on) "Revision 0x%" PRIx32 " Handle 0x%" PRIx32 " Function 0x%" PRIx32
> +acpi_nvdimm_invalid_revision(uint32_t revision) "Revision 0x%" PRIx32 " =
is not supported, expect 0x1 or 0x2"
> +acpi_nvdimm_invalid_method(uint32_t method) "Unkown method %" PRId32
> diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
> index 0206b6125b..c83e273829 100644
> --- a/include/hw/mem/nvdimm.h
> +++ b/include/hw/mem/nvdimm.h
> @@ -29,14 +29,6 @@
>  #include "hw/acpi/aml-build.h"
>  #include "qom/object.h"
> =20
> -#define NVDIMM_DEBUG 0
> -#define nvdimm_debug(fmt, ...)                                \
> -    do {                                                      \
> -        if (NVDIMM_DEBUG) {                                   \
> -            fprintf(stderr, "nvdimm: " fmt, ## __VA_ARGS__);  \
> -        }                                                     \
> -    } while (0)
> -
>  /* NVDIMM ACPI Methods */
>  #define NVDIMM_METHOD_DSM   0
>  #define NVDIMM_METHOD_LSI   0x100


