Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30748562E70
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 10:36:42 +0200 (CEST)
Received: from localhost ([::1]:38350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7C8n-00026V-AH
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 04:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1o7C7b-0001PV-2y
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 04:35:27 -0400
Received: from mga02.intel.com ([134.134.136.20]:3610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1o7C7Y-0002Z3-Mg
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 04:35:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656664524; x=1688200524;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hZkQ7J029VUEAOPMwJILgtZ1JKK7Lk+MSo8oS7Lo8xY=;
 b=SppQLtygGvQ5g5h18CFLx3YQpNNTP6epO28IlfpB1GsFrvF6QN2tfLIh
 JLx/qrKS9zCpIh2xaUZtqSJxVO3bstfnkNQZB+dr8PT8p8fIqNa16hWXW
 h2tKjC8GNvO/ooZuSjVuZWhoWJW3K8uvbOt7oFe6ABegwUm6yex3YADeQ
 MRKA1FNsepDvEdda4VmwSvQu28c7FFU8xNZ1iE/odhwEhw9VVj7XuvbKN
 fSYiE/NVHyitzi3x3hIh/nxDgOhAB1+4tabqQRk+cwVS66KVUDMkPCzX3
 XhkqIx6LI4ldBXTxQksAFrDDMbe8Orn/3+BtiNiQbfUVavdUG70GPGQkF w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="271362205"
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; d="scan'208";a="271362205"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 01:35:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; d="scan'208";a="624108199"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga001.jf.intel.com with ESMTP; 01 Jul 2022 01:35:19 -0700
Message-ID: <440a49c4fa5095cfe18a38b770b8db217dcdbf99.camel@linux.intel.com>
Subject: Re: [QEMU PATCH v2 6/6] acpi/nvdimm: Define trace events for NVDIMM
 and substitute nvdimm_debug()
From: Robert Hoo <robert.hu@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: mst@redhat.com, xiaoguangrong.eric@gmail.com, ani@anisinha.ca, 
 dan.j.williams@intel.com, jingqi.liu@intel.com, qemu-devel@nongnu.org, 
 robert.hu@intel.com
Date: Fri, 01 Jul 2022 16:35:18 +0800
In-Reply-To: <20220616143542.3e049a13@redhat.com>
References: <20220530034047.730356-1-robert.hu@linux.intel.com>
 <20220530034047.730356-7-robert.hu@linux.intel.com>
 <20220616143542.3e049a13@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=robert.hu@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, 2022-06-16 at 14:35 +0200, Igor Mammedov wrote:
> On Mon, 30 May 2022 11:40:47 +0800
> Robert Hoo <robert.hu@linux.intel.com> wrote:
> 
> suggest to put this patch as the 1st in series
> (well you can rebase it on current master and
> post that right away for merging since it doesn't
> really depend on other patches, and post new patches on
> top (whenever they are ready) will use tracing)

OK
> 
> > Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> > Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>
> > ---
> >  hw/acpi/nvdimm.c        | 38 ++++++++++++++++++-------------------
> > -
> >  hw/acpi/trace-events    | 14 ++++++++++++++
> >  include/hw/mem/nvdimm.h |  8 --------
> >  3 files changed, 32 insertions(+), 28 deletions(-)
> > 
> > diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> > index 50ee85866b..fc777990e6 100644
> > --- a/hw/acpi/nvdimm.c
> > +++ b/hw/acpi/nvdimm.c
> > @@ -35,6 +35,7 @@
> >  #include "hw/nvram/fw_cfg.h"
> >  #include "hw/mem/nvdimm.h"
> >  #include "qemu/nvdimm-utils.h"
> > +#include "trace.h"
> >  
> >  /*
> >   * define Byte Addressable Persistent Memory (PM) Region according
> > to
> > @@ -558,8 +559,8 @@ static void
> > nvdimm_dsm_func_read_fit(NVDIMMState *state, NvdimmDsmIn *in,
> >  
> >      fit = fit_buf->fit;
> >  
> > -    nvdimm_debug("Read FIT: offset 0x%x FIT size 0x%x Dirty
> > %s.\n",
> > -                 read_fit->offset, fit->len, fit_buf->dirty ?
> > "Yes" : "No");
> > +    trace_acpi_nvdimm_read_fit(read_fit->offset, fit->len,
> > +                               fit_buf->dirty ? "Yes" : "No");
> >  
> >      if (read_fit->offset > fit->len) {
> >          func_ret_status = NVDIMM_DSM_RET_STATUS_INVALID;
> > @@ -667,7 +668,7 @@ static void nvdimm_dsm_label_size(NVDIMMDevice
> > *nvdimm, hwaddr dsm_mem_addr)
> >      label_size = nvdimm->label_size;
> >      mxfer = nvdimm_get_max_xfer_label_size();
> >  
> > -    nvdimm_debug("label_size 0x%x, max_xfer 0x%x.\n", label_size,
> > mxfer);
> > +    trace_acpi_nvdimm_label_info(label_size, mxfer);
> >  
> >      label_size_out.func_ret_status =
> > cpu_to_le32(NVDIMM_DSM_RET_STATUS_SUCCESS);
> >      label_size_out.label_size = cpu_to_le32(label_size);
> > @@ -683,20 +684,18 @@ static uint32_t
> > nvdimm_rw_label_data_check(NVDIMMDevice *nvdimm,
> >      uint32_t ret = NVDIMM_DSM_RET_STATUS_INVALID;
> >  
> >      if (offset + length < offset) {
> > -        nvdimm_debug("offset 0x%x + length 0x%x is overflow.\n",
> > offset,
> > -                     length);
> > +        trace_acpi_nvdimm_label_overflow(offset, length);
> >          return ret;
> >      }
> >  
> >      if (nvdimm->label_size < offset + length) {
> > -        nvdimm_debug("position 0x%x is beyond label data (len = %"
> > PRIx64 ").\n",
> > -                     offset + length, nvdimm->label_size);
> > +        trace_acpi_nvdimm_label_oversize(offset + length, nvdimm-
> > >label_size);
> >          return ret;
> >      }
> >  
> >      if (length > nvdimm_get_max_xfer_label_size()) {
> > -        nvdimm_debug("length (0x%x) is larger than max_xfer
> > (0x%x).\n",
> > -                     length, nvdimm_get_max_xfer_label_size());
> > +        trace_acpi_nvdimm_label_xfer_exceed(length,
> > +                                            nvdimm_get_max_xfer_la
> > bel_size());
> >          return ret;
> >      }
> >  
> > @@ -718,8 +717,8 @@ static void
> > nvdimm_dsm_get_label_data(NVDIMMDevice *nvdimm,
> >      get_label_data->offset = le32_to_cpu(get_label_data->offset);
> >      get_label_data->length = le32_to_cpu(get_label_data->length);
> >  
> > -    nvdimm_debug("Read Label Data: offset 0x%x length 0x%x.\n",
> > -                 get_label_data->offset, get_label_data->length);
> > +    trace_acpi_nvdimm_read_label(get_label_data->offset,
> > +                                 get_label_data->length);
> >  
> >      status = nvdimm_rw_label_data_check(nvdimm, get_label_data-
> > >offset,
> >                                          get_label_data->length);
> > @@ -755,8 +754,8 @@ static void
> > nvdimm_dsm_set_label_data(NVDIMMDevice *nvdimm,
> >      set_label_data->offset = le32_to_cpu(set_label_data->offset);
> >      set_label_data->length = le32_to_cpu(set_label_data->length);
> >  
> > -    nvdimm_debug("Write Label Data: offset 0x%x length 0x%x.\n",
> > -                 set_label_data->offset, set_label_data->length);
> > +    trace_acpi_nvdimm_write_label(set_label_data->offset,
> > +                                  set_label_data->length);
> >  
> >      status = nvdimm_rw_label_data_check(nvdimm, set_label_data-
> > >offset,
> >                                          set_label_data->length);
> > @@ -833,7 +832,7 @@ static void nvdimm_dsm_device(uint32_t
> > nv_handle, NvdimmDsmIn *dsm_in,
> >  static uint64_t
> >  nvdimm_method_read(void *opaque, hwaddr addr, unsigned size)
> >  {
> > -    nvdimm_debug("BUG: we never read NVDIMM Method IO Port.\n");
> > +    trace_acpi_nvdimm_read_io_port();
> >      return 0;
> >  }
> >  
> > @@ -843,20 +842,19 @@ nvdimm_dsm_handle(void *opaque, NvdimmMthdIn
> > *method_in, hwaddr dsm_mem_addr)
> >      NVDIMMState *state = opaque;
> >      NvdimmDsmIn *dsm_in = (NvdimmDsmIn *)method_in->args;
> >  
> > -    nvdimm_debug("dsm memory address 0x%" HWADDR_PRIx ".\n",
> > dsm_mem_addr);
> > +    trace_acpi_nvdimm_dsm_mem_addr(dsm_mem_addr);
> >  
> >      dsm_in->revision = le32_to_cpu(dsm_in->revision);
> >      dsm_in->function = le32_to_cpu(dsm_in->function);
> >  
> > -    nvdimm_debug("Revision 0x%x Handler 0x%x Function 0x%x.\n",
> > -                 dsm_in->revision, method_in->handle, dsm_in-
> > >function);
> > +    trace_acpi_nvdimm_dsm_info(dsm_in->revision,
> > +                 method_in->handle, dsm_in->function);
> >      /*
> >       * Current NVDIMM _DSM Spec supports Rev1 and Rev2
> >       * Intel® OptanePersistent Memory Module DSM Interface,
> > Revision 2.0
> >       */
> >      if (dsm_in->revision != 0x1 && dsm_in->revision != 0x2) {
> > -        nvdimm_debug("Revision 0x%x is not supported, expect 0x1
> > or 0x2.\n",
> > -                     dsm_in->revision);
> > +        trace_acpi_nvdimm_invalid_revision(dsm_in->revision);
> >          nvdimm_dsm_no_payload(NVDIMM_DSM_RET_STATUS_UNSUPPORT,
> > dsm_mem_addr);
> >          return;
> >      }
> > @@ -943,7 +941,7 @@ nvdimm_method_write(void *opaque, hwaddr addr,
> > uint64_t val, unsigned size)
> >          nvdimm_lsw_handle(method_in->handle, method_in->args,
> > dsm_mem_addr);
> >          break;
> >      default:
> > -        nvdimm_debug("%s: Unkown method 0x%x\n", __func__,
> > method_in->method);
> > +        trace_acpi_nvdimm_invalid_method(method_in->method);
> >          break;
> >      }
> >  
> > diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
> > index 2250126a22..db4c69009f 100644
> > --- a/hw/acpi/trace-events
> > +++ b/hw/acpi/trace-events
> > @@ -70,3 +70,17 @@ acpi_erst_reset_out(unsigned record_count)
> > "record_count %u"
> >  acpi_erst_post_load(void *header, unsigned slot_size) "header:
> > 0x%p slot_size %u"
> >  acpi_erst_class_init_in(void)
> >  acpi_erst_class_init_out(void)
> > +
> > +# nvdimm.c
> > +acpi_nvdimm_read_fit(uint32_t offset, uint32_t len, const char
> > *dirty) "Read FIT: offset 0x%" PRIx32 " FIT size 0x%" PRIx32 "
> > Dirty %s"
> > +acpi_nvdimm_label_info(uint32_t label_size, uint32_t mxfer)
> > "label_size 0x%" PRIx32 ", max_xfer 0x%" PRIx32
> > +acpi_nvdimm_label_overflow(uint32_t offset, uint32_t length)
> > "offset 0x%" PRIx32 " + length 0x%" PRIx32 " is overflow"
> > +acpi_nvdimm_label_oversize(uint32_t pos, uint64_t size) "position
> > 0x%" PRIx32 " is beyond label data (len = %" PRIu64 ")"
> > +acpi_nvdimm_label_xfer_exceed(uint32_t length, uint32_t max_xfer)
> > "length (0x%" PRIx32 ") is larger than max_xfer (0x%" PRIx32 ")"
> > +acpi_nvdimm_read_label(uint32_t offset, uint32_t length) "Read
> > Label Data: offset 0x%" PRIx32 " length 0x%" PRIx32
> > +acpi_nvdimm_write_label(uint32_t offset, uint32_t length) "Write
> > Label Data: offset 0x%" PRIx32 " length 0x%" PRIx32
> > +acpi_nvdimm_read_io_port(void) "Alert: we never read NVDIMM Method
> > IO Port"
> > +acpi_nvdimm_dsm_mem_addr(uint64_t dsm_mem_addr) "dsm memory
> > address 0x%" PRIx64
> > +acpi_nvdimm_dsm_info(uint32_t revision, uint32_t handle, uint32_t
> > function) "Revision 0x%" PRIx32 " Handle 0x%" PRIx32 " Function
> > 0x%" PRIx32
> > +acpi_nvdimm_invalid_revision(uint32_t revision) "Revision 0x%"
> > PRIx32 " is not supported, expect 0x1 or 0x2"
> > +acpi_nvdimm_invalid_method(uint32_t method) "Unkown method %"
> > PRId32
> > diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
> > index 0206b6125b..c83e273829 100644
> > --- a/include/hw/mem/nvdimm.h
> > +++ b/include/hw/mem/nvdimm.h
> > @@ -29,14 +29,6 @@
> >  #include "hw/acpi/aml-build.h"
> >  #include "qom/object.h"
> >  
> > -#define NVDIMM_DEBUG 0
> > -#define nvdimm_debug(fmt, ...)                                \
> > -    do {                                                      \
> > -        if (NVDIMM_DEBUG) {                                   \
> > -            fprintf(stderr, "nvdimm: " fmt, ## __VA_ARGS__);  \
> > -        }                                                     \
> > -    } while (0)
> > -
> >  /* NVDIMM ACPI Methods */
> >  #define NVDIMM_METHOD_DSM   0
> >  #define NVDIMM_METHOD_LSI   0x100
> 
> 


