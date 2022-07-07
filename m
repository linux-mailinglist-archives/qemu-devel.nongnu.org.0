Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70134569E7F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 11:23:30 +0200 (CEST)
Received: from localhost ([::1]:56664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9NjN-0006TW-3E
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 05:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o9Nh9-0004JB-15
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 05:21:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o9Nh6-0004ab-GU
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 05:21:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657185667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7auTwtk9is5GPvsesKrIJE490oEzSkLvJ2J9utimD7Y=;
 b=drpwy+N9k3KvbtbMA3GI/Zb3f9su1RiLVhGS5oT9mAc1v4kNrCGwPP22WyiMXmU/DuUoyE
 ChKhyNb44d0Gy1yZsN7pbLIWkPTcd/+SHZFHdb5J3bgnrHDmaeQV0MnlDhjBpxRJ/j8zKG
 EddYVsoQP3i6V0J3vxxHJqPzn/X9M8c=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-CVp2QbHSNaGvsUR5Ma15eg-1; Thu, 07 Jul 2022 05:21:04 -0400
X-MC-Unique: CVp2QbHSNaGvsUR5Ma15eg-1
Received: by mail-ej1-f72.google.com with SMTP id
 hq41-20020a1709073f2900b00722e5ad076cso4603464ejc.20
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 02:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7auTwtk9is5GPvsesKrIJE490oEzSkLvJ2J9utimD7Y=;
 b=Ev/gA4XnTGOe6vVhHSzJbeyjt9Am9N9ErS04Y4DRtji8lGnfB3+U43BDbC8IYltP55
 V/sV4zxbJ3cgM5e7WqsAXNueBWQsyRrDGJubTXBOcS4wFlfTXMwUb/6drZFhrlmGE26D
 knEzB+MipiAZQj3OnC8Pbv7EEYf5qViYXNKpLdtkde+FziHvxfghvgtvuXyxEdzvwD77
 JfSRDVvCSNUgfKR2Jwp/mURfAq2d+RA6+si4/n4/d1sVKTwhr8Aqwk1zw+uO6VOnvevx
 F7OPBoPyhRZjKcxP44zqD+aW9a8J3rDuR1ZkGNZrncuPKIfkWy6DJ8zcwBjs44FsoKI5
 mb9Q==
X-Gm-Message-State: AJIora9C7BqKxm9GFat1eNHPFNe8Dn/a4PF8WiLaEgQK4nQWWfiMtChp
 ayjOc4PT9TN4eyPJL7FQcdE3n2GcGpY5R3fVqq67xwM3vsYllt3UUUkDIsTIA9q/ZJG09MwgsKg
 iwlmY7L1xi+42nYw=
X-Received: by 2002:a17:906:9bde:b0:72b:2e5:deb5 with SMTP id
 de30-20020a1709069bde00b0072b02e5deb5mr5026145ejc.21.1657185662828; 
 Thu, 07 Jul 2022 02:21:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tnqgu+zdXvESH9m2XxtKAejEDh5h+FBOLAZuHVBSvziTyhu7YkVpgRKIf42/0dp1XMxKwb6g==
X-Received: by 2002:a17:906:9bde:b0:72b:2e5:deb5 with SMTP id
 de30-20020a1709069bde00b0072b02e5deb5mr5026126ejc.21.1657185662645; 
 Thu, 07 Jul 2022 02:21:02 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a170906078200b006fe89cafc42sm18892285ejc.172.2022.07.07.02.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 02:21:02 -0700 (PDT)
Date: Thu, 7 Jul 2022 11:21:01 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Cc: mst@redhat.com, xiaoguangrong.eric@gmail.com, qemu-devel@nongnu.org,
 robert.hu@intel.com, Jingqi Liu <jingqi.liu@intel.com>
Subject: Re: [PATCH] acpi/nvdimm: Define trace events for NVDIMM and
 substitute nvdimm_debug()
Message-ID: <20220707112101.259acc3a@redhat.com>
In-Reply-To: <20220704085852.330005-1-robert.hu@linux.intel.com>
References: <20220704085852.330005-1-robert.hu@linux.intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
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

On Mon,  4 Jul 2022 16:58:52 +0800
Robert Hoo <robert.hu@linux.intel.com> wrote:

> Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> This is separated from patch set
> https://lore.kernel.org/qemu-devel/20220616143542.3e049a13@redhat.com/
> 
>  hw/acpi/nvdimm.c        | 35 ++++++++++++++++-------------------
>  hw/acpi/trace-events    | 13 +++++++++++++
>  include/hw/mem/nvdimm.h |  8 --------
>  3 files changed, 29 insertions(+), 27 deletions(-)
> 
> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> index 5f85b16327..31e46df0bd 100644
> --- a/hw/acpi/nvdimm.c
> +++ b/hw/acpi/nvdimm.c
> @@ -35,6 +35,7 @@
>  #include "hw/nvram/fw_cfg.h"
>  #include "hw/mem/nvdimm.h"
>  #include "qemu/nvdimm-utils.h"
> +#include "trace.h"
>  
>  /*
>   * define Byte Addressable Persistent Memory (PM) Region according to
> @@ -550,8 +551,8 @@ static void nvdimm_dsm_func_read_fit(NVDIMMState *state, NvdimmDsmIn *in,
>  
>      fit = fit_buf->fit;
>  
> -    nvdimm_debug("Read FIT: offset 0x%x FIT size 0x%x Dirty %s.\n",
> -                 read_fit->offset, fit->len, fit_buf->dirty ? "Yes" : "No");
> +    trace_acpi_nvdimm_read_fit(read_fit->offset, fit->len,
> +                               fit_buf->dirty ? "Yes" : "No");
>  
>      if (read_fit->offset > fit->len) {
>          func_ret_status = NVDIMM_DSM_RET_STATUS_INVALID;
> @@ -658,7 +659,7 @@ static void nvdimm_dsm_label_size(NVDIMMDevice *nvdimm, hwaddr dsm_mem_addr)
>      label_size = nvdimm->label_size;
>      mxfer = nvdimm_get_max_xfer_label_size();
>  
> -    nvdimm_debug("label_size 0x%x, max_xfer 0x%x.\n", label_size, mxfer);
> +    trace_acpi_nvdimm_label_info(label_size, mxfer);
>  
>      label_size_out.func_ret_status = cpu_to_le32(NVDIMM_DSM_RET_STATUS_SUCCESS);
>      label_size_out.label_size = cpu_to_le32(label_size);
> @@ -674,20 +675,18 @@ static uint32_t nvdimm_rw_label_data_check(NVDIMMDevice *nvdimm,
>      uint32_t ret = NVDIMM_DSM_RET_STATUS_INVALID;
>  
>      if (offset + length < offset) {
> -        nvdimm_debug("offset 0x%x + length 0x%x is overflow.\n", offset,
> -                     length);
> +        trace_acpi_nvdimm_label_overflow(offset, length);
>          return ret;
>      }
>  
>      if (nvdimm->label_size < offset + length) {
> -        nvdimm_debug("position 0x%x is beyond label data (len = %" PRIx64 ").\n",
> -                     offset + length, nvdimm->label_size);
> +        trace_acpi_nvdimm_label_oversize(offset + length, nvdimm->label_size);
>          return ret;
>      }
>  
>      if (length > nvdimm_get_max_xfer_label_size()) {
> -        nvdimm_debug("length (0x%x) is larger than max_xfer (0x%x).\n",
> -                     length, nvdimm_get_max_xfer_label_size());
> +        trace_acpi_nvdimm_label_xfer_exceed(length,
> +                                            nvdimm_get_max_xfer_label_size());
>          return ret;
>      }
>  
> @@ -710,8 +709,8 @@ static void nvdimm_dsm_get_label_data(NVDIMMDevice *nvdimm, NvdimmDsmIn *in,
>      get_label_data->offset = le32_to_cpu(get_label_data->offset);
>      get_label_data->length = le32_to_cpu(get_label_data->length);
>  
> -    nvdimm_debug("Read Label Data: offset 0x%x length 0x%x.\n",
> -                 get_label_data->offset, get_label_data->length);
> +    trace_acpi_nvdimm_read_label(get_label_data->offset,
> +                                 get_label_data->length);
>  
>      status = nvdimm_rw_label_data_check(nvdimm, get_label_data->offset,
>                                          get_label_data->length);
> @@ -749,8 +748,8 @@ static void nvdimm_dsm_set_label_data(NVDIMMDevice *nvdimm, NvdimmDsmIn *in,
>      set_label_data->offset = le32_to_cpu(set_label_data->offset);
>      set_label_data->length = le32_to_cpu(set_label_data->length);
>  
> -    nvdimm_debug("Write Label Data: offset 0x%x length 0x%x.\n",
> -                 set_label_data->offset, set_label_data->length);
> +    trace_acpi_nvdimm_write_label(set_label_data->offset,
> +                                  set_label_data->length);
>  
>      status = nvdimm_rw_label_data_check(nvdimm, set_label_data->offset,
>                                          set_label_data->length);
> @@ -821,7 +820,7 @@ static void nvdimm_dsm_device(NvdimmDsmIn *in, hwaddr dsm_mem_addr)
>  static uint64_t
>  nvdimm_dsm_read(void *opaque, hwaddr addr, unsigned size)
>  {
> -    nvdimm_debug("BUG: we never read _DSM IO Port.\n");
> +    trace_acpi_nvdimm_read_io_port();
>      return 0;
>  }
>  
> @@ -832,7 +831,7 @@ nvdimm_dsm_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>      NvdimmDsmIn *in;
>      hwaddr dsm_mem_addr = val;
>  
> -    nvdimm_debug("dsm memory address 0x%" HWADDR_PRIx ".\n", dsm_mem_addr);
> +    trace_acpi_nvdimm_dsm_mem_addr(dsm_mem_addr);
>  
>      /*
>       * The DSM memory is mapped to guest address space so an evil guest
> @@ -846,12 +845,10 @@ nvdimm_dsm_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>      in->function = le32_to_cpu(in->function);
>      in->handle = le32_to_cpu(in->handle);
>  
> -    nvdimm_debug("Revision 0x%x Handler 0x%x Function 0x%x.\n", in->revision,
> -                 in->handle, in->function);
> +    trace_acpi_nvdimm_dsm_info(in->revision, in->handle, in->function);
>  
>      if (in->revision != 0x1 /* Currently we only support DSM Spec Rev1. */) {
> -        nvdimm_debug("Revision 0x%x is not supported, expect 0x%x.\n",
> -                     in->revision, 0x1);
> +        trace_acpi_nvdimm_invalid_revision(in->revision);
>          nvdimm_dsm_no_payload(NVDIMM_DSM_RET_STATUS_UNSUPPORT, dsm_mem_addr);
>          goto exit;
>      }
> diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
> index 2250126a22..eb60b04f9b 100644
> --- a/hw/acpi/trace-events
> +++ b/hw/acpi/trace-events
> @@ -70,3 +70,16 @@ acpi_erst_reset_out(unsigned record_count) "record_count %u"
>  acpi_erst_post_load(void *header, unsigned slot_size) "header: 0x%p slot_size %u"
>  acpi_erst_class_init_in(void)
>  acpi_erst_class_init_out(void)
> +
> +# nvdimm.c
> +acpi_nvdimm_read_fit(uint32_t offset, uint32_t len, const char *dirty) "Read FIT: offset 0x%" PRIx32 " FIT size 0x%" PRIx32 " Dirty %s"
> +acpi_nvdimm_label_info(uint32_t label_size, uint32_t mxfer) "label_size 0x%" PRIx32 ", max_xfer 0x%" PRIx32
> +acpi_nvdimm_label_overflow(uint32_t offset, uint32_t length) "offset 0x%" PRIx32 " + length 0x%" PRIx32 " is overflow"
> +acpi_nvdimm_label_oversize(uint32_t pos, uint64_t size) "position 0x%" PRIx32 " is beyond label data (len = %" PRIu64 ")"
> +acpi_nvdimm_label_xfer_exceed(uint32_t length, uint32_t max_xfer) "length (0x%" PRIx32 ") is larger than max_xfer (0x%" PRIx32 ")"
> +acpi_nvdimm_read_label(uint32_t offset, uint32_t length) "Read Label Data: offset 0x%" PRIx32 " length 0x%" PRIx32
> +acpi_nvdimm_write_label(uint32_t offset, uint32_t length) "Write Label Data: offset 0x%" PRIx32 " length 0x%" PRIx32
> +acpi_nvdimm_read_io_port(void) "Alert: we never read _DSM IO Port"
> +acpi_nvdimm_dsm_mem_addr(uint64_t dsm_mem_addr) "dsm memory address 0x%" PRIx64
> +acpi_nvdimm_dsm_info(uint32_t revision, uint32_t handle, uint32_t function) "Revision 0x%" PRIx32 " Handle 0x%" PRIx32 " Function 0x%" PRIx32
> +acpi_nvdimm_invalid_revision(uint32_t revision) "Revision 0x%" PRIx32 " is not supported, expect 0x1"
> diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
> index cf8f59be44..acf887c83d 100644
> --- a/include/hw/mem/nvdimm.h
> +++ b/include/hw/mem/nvdimm.h
> @@ -29,14 +29,6 @@
>  #include "hw/acpi/aml-build.h"
>  #include "qom/object.h"
>  
> -#define NVDIMM_DEBUG 0
> -#define nvdimm_debug(fmt, ...)                                \
> -    do {                                                      \
> -        if (NVDIMM_DEBUG) {                                   \
> -            fprintf(stderr, "nvdimm: " fmt, ## __VA_ARGS__);  \
> -        }                                                     \
> -    } while (0)
> -
>  /*
>   * The minimum label data size is required by NVDIMM Namespace
>   * specification, see the chapter 2 Namespaces:
> 
> base-commit: e8e86b484eac70cd86e15fa10a2f0038a536cbba


