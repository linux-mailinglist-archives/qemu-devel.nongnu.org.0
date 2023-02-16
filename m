Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D9E69945D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 13:30:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSdPB-00017v-Nn; Thu, 16 Feb 2023 07:30:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pSdP7-00016b-Jh
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:30:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pSdP2-0000qh-QG
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:30:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676550619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XaL4S1h6pDNmUovi+zpvOTcNsthdjH85bwaJcSCIgfw=;
 b=NVPckZ/E5fuC6HxKlPfXoWUdsFCVj/YnLz3nCPXG0Lh4rgfAaxhfIV686yxs3KWmMgODHQ
 tYNKuXnwy47TvvQH3emNaXCbV3LpNzyOCnDk0tyrZvgpdDc/LATKzP5oSW7cnXjX77d4Bi
 8MbwgbwY/iSQC31x2d15qyD1umZXvwc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-237-dBBH1Jl1N9G6sNq1xcJALw-1; Thu, 16 Feb 2023 07:30:18 -0500
X-MC-Unique: dBBH1Jl1N9G6sNq1xcJALw-1
Received: by mail-wm1-f70.google.com with SMTP id
 t18-20020a05600c451200b003e1f2de4b2bso3061336wmo.6
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 04:30:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XaL4S1h6pDNmUovi+zpvOTcNsthdjH85bwaJcSCIgfw=;
 b=6QJP6fZAUBTiaBhD2+Ju1SSChX/Dxk5et1rrxSNxbyxXz+l2A8iXBV44QIGYJjrS7V
 BhRnifjdoYW/6mSFyXRveeRao58CiM7hEi6+batcd4i9MfGIpC3DBLw88t9fmiZyRl1e
 vrH6i0CqeRrOkHFszEL7Zo55kqCatXf/Za8w0kSZmE0Pg/OalMNJZQJZl9DddjvicDXO
 XywA9PWmln8Lh8RhgJaia8KM9/50yVCyRmqGoL27/qq6ih6vVOMLqGLdxVi2a3ACDRDg
 aJCHZPMhjwrFfJPSiPhapYpasE5vrSpxSmd1eIippgYBG05o1ItmYxKI6vjCUMYbGGA6
 rthw==
X-Gm-Message-State: AO0yUKUz4+c6f2i5fITRJfjEze690sU1OeG0lPOxMP1YipxBqYsVay7s
 Y52U4howXErbC3egpHVBomsQpV6EWrnk9vXF3pkm2lDFA8Q9NwtsDgbNdtYnz+0p/umWXiW0ONO
 mnnu8E9tk1DpeX6M=
X-Received: by 2002:adf:f70e:0:b0:2bf:943d:bad6 with SMTP id
 r14-20020adff70e000000b002bf943dbad6mr4993961wrp.12.1676550616646; 
 Thu, 16 Feb 2023 04:30:16 -0800 (PST)
X-Google-Smtp-Source: AK7set8UH40r5cFyQQNngs1rlWyqxxSPt5e5oK3xMBAfVoHM12Nu3dR5Ke5QxRkCps4u/7iwan2LSw==
X-Received: by 2002:adf:f70e:0:b0:2bf:943d:bad6 with SMTP id
 r14-20020adff70e000000b002bf943dbad6mr4993909wrp.12.1676550615863; 
 Thu, 16 Feb 2023 04:30:15 -0800 (PST)
Received: from redhat.com ([2.52.5.34]) by smtp.gmail.com with ESMTPSA id
 a17-20020adff7d1000000b002c3d29d83d2sm1386531wrq.63.2023.02.16.04.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 04:30:15 -0800 (PST)
Date: Thu, 16 Feb 2023 07:30:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Greg Kurz <groug@kaod.org>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fam Zheng <fam@euphon.net>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 3/5] bulk: Have object_child_foreach() take Error* and
 return boolean
Message-ID: <20230216072959-mutt-send-email-mst@kernel.org>
References: <20230216122524.67212-1-philmd@linaro.org>
 <20230216122524.67212-4-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230216122524.67212-4-philmd@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 16, 2023 at 01:25:22PM +0100, Philippe Mathieu-Daudé wrote:
> Following the Error API best practices documented in commit
> e3fe3988d7 ("error: Document Error API usage rules"), have the
> object_child_foreach[_recursive]() handler take a Error* argument
> and return a boolean indicating whether this error is set or not.
> Convert all handler implementations.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  chardev/char-mux.c              |  6 ++--
>  chardev/char.c                  |  6 ++--
>  gdbstub/gdbstub.c               |  8 +++---
>  hw/acpi/cxl.c                   |  7 +++--
>  hw/acpi/viot.c                  |  6 ++--
>  hw/arm/boot.c                   |  6 ++--
>  hw/arm/virt-acpi-build.c        |  8 +++---
>  hw/core/machine-qmp-cmds.c      | 18 ++++++------
>  hw/core/nmi.c                   |  8 +++---
>  hw/core/qdev.c                  |  8 ++++--
>  hw/core/sysbus.c                | 10 +++----
>  hw/cpu/cluster.c                |  7 +++--
>  hw/display/virtio-gpu-udmabuf.c |  7 +++--
>  hw/i386/acpi-build.c            | 16 +++++------
>  hw/i386/intel_iommu.c           |  7 +++--
>  hw/i386/pc.c                    | 13 ++++-----
>  hw/i386/sgx.c                   |  7 ++---
>  hw/mem/memory-device.c          | 25 ++++++++---------
>  hw/mem/pc-dimm.c                |  8 +++---
>  hw/misc/mos6522.c               |  6 ++--
>  hw/ppc/pnv.c                    | 15 +++++-----
>  hw/ppc/pnv_bmc.c                |  9 +++---
>  hw/ppc/pnv_xscom.c              |  6 ++--
>  hw/ppc/spapr_pci.c              | 50 ++++++++++++++++-----------------
>  hw/ppc/spapr_rtas_ddw.c         | 16 +++++++----
>  hw/rdma/vmw/pvrdma_main.c       |  7 +++--
>  hw/virtio/virtio-balloon.c      |  7 ++---
>  include/qom/object.h            | 28 ++++++++++--------
>  iothread.c                      |  8 +++---
>  monitor/hmp-cmds.c              |  6 ++--
>  qom/object.c                    | 36 ++++++++++++------------
>  qom/qom-hmp-cmds.c              |  7 +++--
>  scsi/pr-manager.c               |  8 +++---
>  softmmu/physmem.c               | 13 +++++----
>  softmmu/qdev-monitor.c          |  9 +++---
>  tests/qtest/fuzz/generic_fuzz.c |  6 ++--
>  ui/dbus-chardev.c               | 14 ++++-----
>  util/nvdimm-utils.c             |  8 +++---
>  38 files changed, 225 insertions(+), 215 deletions(-)
> 
> diff --git a/chardev/char-mux.c b/chardev/char-mux.c
> index ee2d47b20d..17b5854e4c 100644
> --- a/chardev/char-mux.c
> +++ b/chardev/char-mux.c
> @@ -384,7 +384,7 @@ void suspend_mux_open(void)
>      muxes_opened = false;
>  }
>  
> -static int chardev_options_parsed_cb(Object *child, void *opaque)
> +static bool chardev_options_parsed_cb(Object *child, void *opaque, Error **errp)
>  {
>      Chardev *chr = (Chardev *)child;
>  
> @@ -392,14 +392,14 @@ static int chardev_options_parsed_cb(Object *child, void *opaque)
>          open_muxes(chr);
>      }
>  
> -    return 0;
> +    return true;
>  }
>  
>  void resume_mux_open(void)
>  {
>      muxes_opened = true;
>      object_child_foreach(get_chardevs_root(),
> -                         chardev_options_parsed_cb, NULL);
> +                         chardev_options_parsed_cb, NULL, NULL);
>  }
>  
>  static void char_mux_class_init(ObjectClass *oc, void *data)
> diff --git a/chardev/char.c b/chardev/char.c
> index 11eab7764c..542b835477 100644
> --- a/chardev/char.c
> +++ b/chardev/char.c
> @@ -742,7 +742,7 @@ Chardev *qemu_chr_new_mux_mon(const char *label, const char *filename,
>      return qemu_chr_new_permit_mux_mon(label, filename, true, context);
>  }
>  
> -static int qmp_query_chardev_foreach(Object *obj, void *data)
> +static bool qmp_query_chardev_foreach(Object *obj, void *data, Error **errp)
>  {
>      Chardev *chr = CHARDEV(obj);
>      ChardevInfoList **list = data;
> @@ -754,7 +754,7 @@ static int qmp_query_chardev_foreach(Object *obj, void *data)
>  
>      QAPI_LIST_PREPEND(*list, value);
>  
> -    return 0;
> +    return true;
>  }
>  
>  ChardevInfoList *qmp_query_chardev(Error **errp)
> @@ -762,7 +762,7 @@ ChardevInfoList *qmp_query_chardev(Error **errp)
>      ChardevInfoList *chr_list = NULL;
>  
>      object_child_foreach(get_chardevs_root(),
> -                         qmp_query_chardev_foreach, &chr_list);
> +                         qmp_query_chardev_foreach, &chr_list, NULL);
>  
>      return chr_list;
>  }
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index be88ca0d71..73d6352be5 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -3379,7 +3379,7 @@ static const TypeInfo char_gdb_type_info = {
>      .class_init = char_gdb_class_init,
>  };
>  
> -static int find_cpu_clusters(Object *child, void *opaque)
> +static bool find_cpu_clusters(Object *child, void *opaque, Error **errp)
>  {
>      if (object_dynamic_cast(child, TYPE_CPU_CLUSTER)) {
>          GDBState *s = (GDBState *) opaque;
> @@ -3400,10 +3400,10 @@ static int find_cpu_clusters(Object *child, void *opaque)
>          process->attached = false;
>          process->target_xml[0] = '\0';
>  
> -        return 0;
> +        return true;
>      }
>  
> -    return object_child_foreach(child, find_cpu_clusters, opaque);
> +    return object_child_foreach(child, find_cpu_clusters, opaque, errp);
>  }
>  
>  static int pid_order(const void *a, const void *b)
> @@ -3422,7 +3422,7 @@ static int pid_order(const void *a, const void *b)
>  
>  static void create_processes(GDBState *s)
>  {
> -    object_child_foreach(object_get_root(), find_cpu_clusters, s);
> +    object_child_foreach(object_get_root(), find_cpu_clusters, s, NULL);
>  
>      if (gdbserver_state.processes) {
>          /* Sort by PID */
> diff --git a/hw/acpi/cxl.c b/hw/acpi/cxl.c
> index 2bf8c07993..853be6f75a 100644
> --- a/hw/acpi/cxl.c
> +++ b/hw/acpi/cxl.c
> @@ -117,7 +117,7 @@ static void cedt_build_cfmws(GArray *table_data, CXLState *cxls)
>      }
>  }
>  
> -static int cxl_foreach_pxb_hb(Object *obj, void *opaque)
> +static bool cxl_foreach_pxb_hb(Object *obj, void *opaque, Error **errp)
>  {
>      Aml *cedt = opaque;
>  
> @@ -125,7 +125,7 @@ static int cxl_foreach_pxb_hb(Object *obj, void *opaque)
>          cedt_build_chbs(cedt->buf, PXB_CXL_DEV(obj));
>      }
>  
> -    return 0;
> +    return true;
>  }
>  
>  void cxl_build_cedt(GArray *table_offsets, GArray *table_data,
> @@ -142,7 +142,8 @@ void cxl_build_cedt(GArray *table_offsets, GArray *table_data,
>  
>      /* reserve space for CEDT header */
>  
> -    object_child_foreach_recursive(object_get_root(), cxl_foreach_pxb_hb, cedt);
> +    object_child_foreach_recursive(object_get_root(), cxl_foreach_pxb_hb,
> +                                   cedt, NULL);
>      cedt_build_cfmws(cedt->buf, cxl_state);
>  
>      /* copy AML table into ACPI tables blob and patch header there */
> diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
> index 4e0bf69067..9099cd9c15 100644
> --- a/hw/acpi/viot.c
> +++ b/hw/acpi/viot.c
> @@ -41,7 +41,7 @@ static void build_pci_host_range(GArray *table_data, int min_bus, int max_bus,
>  }
>  
>  /* Build PCI range for a given PCI host bridge */
> -static int enumerate_pci_host_bridges(Object *obj, void *opaque)
> +static bool enumerate_pci_host_bridges(Object *obj, void *opaque, Error **errp)
>  {
>      GArray *pci_host_ranges = opaque;
>  
> @@ -61,7 +61,7 @@ static int enumerate_pci_host_bridges(Object *obj, void *opaque)
>          }
>      }
>  
> -    return 0;
> +    return true;
>  }
>  
>  static gint pci_host_range_compare(gconstpointer a, gconstpointer b)
> @@ -99,7 +99,7 @@ void build_viot(MachineState *ms, GArray *table_data, BIOSLinker *linker,
>  
>      /* Build the list of PCI ranges that this viommu manages */
>      object_child_foreach_recursive(OBJECT(ms), enumerate_pci_host_bridges,
> -                                   pci_host_ranges);
> +                                   pci_host_ranges, NULL);
>  
>      /* Sort the pci host ranges by min_bus */
>      g_array_sort(pci_host_ranges, pci_host_range_compare);
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 3d7d11f782..64eda44f1d 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -831,7 +831,7 @@ static void do_cpu_reset(void *opaque)
>      }
>  }
>  
> -static int do_arm_linux_init(Object *obj, void *opaque)
> +static bool do_arm_linux_init(Object *obj, void *opaque, Error **errp)
>  {
>      if (object_dynamic_cast(obj, TYPE_ARM_LINUX_BOOT_IF)) {
>          ARMLinuxBootIf *albif = ARM_LINUX_BOOT_IF(obj);
> @@ -842,7 +842,7 @@ static int do_arm_linux_init(Object *obj, void *opaque)
>              albifc->arm_linux_init(albif, info->secure_boot);
>          }
>      }
> -    return 0;
> +    return true;
>  }
>  
>  static ssize_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
> @@ -1185,7 +1185,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
>           * that we're doing a direct kernel boot.
>           */
>          object_child_foreach_recursive(object_get_root(),
> -                                       do_arm_linux_init, info);
> +                                       do_arm_linux_init, info, NULL);
>      }
>      info->is_linux = is_linux;
>  
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 4156111d49..17e25c7f0f 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -266,8 +266,8 @@ struct AcpiIortIdMapping {
>  typedef struct AcpiIortIdMapping AcpiIortIdMapping;
>  
>  /* Build the iort ID mapping to SMMUv3 for a given PCI host bridge */
> -static int
> -iort_host_bridges(Object *obj, void *opaque)
> +static bool
> +iort_host_bridges(Object *obj, void *opaque, Error **errp)
>  {
>      GArray *idmap_blob = opaque;
>  
> @@ -287,7 +287,7 @@ iort_host_bridges(Object *obj, void *opaque)
>          }
>      }
>  
> -    return 0;
> +    return true;
>  }
>  
>  static int iort_idmap_compare(gconstpointer a, gconstpointer b)
> @@ -323,7 +323,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          AcpiIortIdMapping next_range = {0};
>  
>          object_child_foreach_recursive(object_get_root(),
> -                                       iort_host_bridges, smmu_idmaps);
> +                                       iort_host_bridges, smmu_idmaps, NULL);
>  
>          /* Sort the smmu idmap by input_base */
>          g_array_sort(smmu_idmaps, iort_idmap_compare);
> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> index 44b5da8880..06aa5830b5 100644
> --- a/hw/core/machine-qmp-cmds.c
> +++ b/hw/core/machine-qmp-cmds.c
> @@ -157,7 +157,7 @@ void qmp_set_numa_node(NumaOptions *cmd, Error **errp)
>      set_numa_options(MACHINE(qdev_get_machine()), cmd, errp);
>  }
>  
> -static int query_memdev(Object *obj, void *opaque)
> +static bool query_memdev(Object *obj, void *opaque, Error **errp)
>  {
>      Error *err = NULL;
>      MemdevList **list = opaque;
> @@ -194,7 +194,7 @@ static int query_memdev(Object *obj, void *opaque)
>          QAPI_LIST_PREPEND(*list, m);
>      }
>  
> -    return 0;
> +    return true;
>  }
>  
>  MemdevList *qmp_query_memdev(Error **errp)
> @@ -202,7 +202,7 @@ MemdevList *qmp_query_memdev(Error **errp)
>      Object *obj = object_get_objects_root();
>      MemdevList *list = NULL;
>  
> -    object_child_foreach(obj, query_memdev, &list);
> +    object_child_foreach(obj, query_memdev, &list, errp);
>      return list;
>  }
>  
> @@ -303,7 +303,7 @@ MemoryInfo *qmp_query_memory_size_summary(Error **errp)
>      return mem_info;
>  }
>  
> -static int qmp_x_query_rdma_foreach(Object *obj, void *opaque)
> +static bool qmp_x_query_rdma_foreach(Object *obj, void *opaque, Error **errp)
>  {
>      RdmaProvider *rdma;
>      RdmaProviderClass *k;
> @@ -321,7 +321,7 @@ static int qmp_x_query_rdma_foreach(Object *obj, void *opaque)
>          }
>      }
>  
> -    return 0;
> +    return true;
>  }
>  
>  HumanReadableText *qmp_x_query_rdma(Error **errp)
> @@ -329,7 +329,7 @@ HumanReadableText *qmp_x_query_rdma(Error **errp)
>      g_autoptr(GString) buf = g_string_new("");
>  
>      object_child_foreach_recursive(object_get_root(),
> -                                   qmp_x_query_rdma_foreach, buf);
> +                                   qmp_x_query_rdma_foreach, buf, NULL);
>  
>      return human_readable_text_from_str(buf);
>  }
> @@ -341,7 +341,7 @@ HumanReadableText *qmp_x_query_ramblock(Error **errp)
>      return human_readable_text_from_str(buf);
>  }
>  
> -static int qmp_x_query_irq_foreach(Object *obj, void *opaque)
> +static bool qmp_x_query_irq_foreach(Object *obj, void *opaque, Error **errp)
>  {
>      InterruptStatsProvider *intc;
>      InterruptStatsProviderClass *k;
> @@ -371,7 +371,7 @@ static int qmp_x_query_irq_foreach(Object *obj, void *opaque)
>          }
>      }
>  
> -    return 0;
> +    return true;
>  }
>  
>  HumanReadableText *qmp_x_query_irq(Error **errp)
> @@ -379,7 +379,7 @@ HumanReadableText *qmp_x_query_irq(Error **errp)
>      g_autoptr(GString) buf = g_string_new("");
>  
>      object_child_foreach_recursive(object_get_root(),
> -                                   qmp_x_query_irq_foreach, buf);
> +                                   qmp_x_query_irq_foreach, buf, NULL);
>  
>      return human_readable_text_from_str(buf);
>  }
> diff --git a/hw/core/nmi.c b/hw/core/nmi.c
> index 76cb3ba3b0..fa74c405f7 100644
> --- a/hw/core/nmi.c
> +++ b/hw/core/nmi.c
> @@ -34,7 +34,7 @@ struct do_nmi_s {
>  
>  static void nmi_children(Object *o, struct do_nmi_s *ns);
>  
> -static int do_nmi(Object *o, void *opaque)
> +static bool do_nmi(Object *o, void *opaque, Error **errp)
>  {
>      struct do_nmi_s *ns = opaque;
>      NMIState *n = (NMIState *) object_dynamic_cast(o, TYPE_NMI);
> @@ -44,17 +44,17 @@ static int do_nmi(Object *o, void *opaque)
>  
>          ns->handled = true;
>          if (!nc->nmi_monitor_handler(n, ns->cpu_index, &ns->err)) {
> -            return -1;
> +            return false;
>          }
>      }
>      nmi_children(o, ns);
>  
> -    return 0;
> +    return true;
>  }
>  
>  static void nmi_children(Object *o, struct do_nmi_s *ns)
>  {
> -    object_child_foreach(o, do_nmi, ns);
> +    object_child_foreach(o, do_nmi, ns, NULL);
>  }
>  
>  void nmi_monitor_handle(int cpu_index, Error **errp)
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index d759c4602c..949e89022e 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -306,7 +306,8 @@ void qdev_unrealize(DeviceState *dev)
>      object_property_set_bool(OBJECT(dev), "realized", false, &error_abort);
>  }
>  
> -static int qdev_assert_realized_properly_cb(Object *obj, void *opaque)
> +static bool qdev_assert_realized_properly_cb(Object *obj, void *opaque,
> +                                             Error **errp)
>  {
>      DeviceState *dev = DEVICE(object_dynamic_cast(obj, TYPE_DEVICE));
>      DeviceClass *dc;
> @@ -316,13 +317,14 @@ static int qdev_assert_realized_properly_cb(Object *obj, void *opaque)
>          assert(dev->realized);
>          assert(dev->parent_bus || !dc->bus_type);
>      }
> -    return 0;
> +    return true;
>  }
>  
>  void qdev_assert_realized_properly(void)
>  {
>      object_child_foreach_recursive(object_get_root(),
> -                                   qdev_assert_realized_properly_cb, NULL);
> +                                   qdev_assert_realized_properly_cb,
> +                                   NULL, NULL);
>  }
>  
>  bool qdev_machine_modified(void)
> diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
> index 35f902b582..41e70775b0 100644
> --- a/hw/core/sysbus.c
> +++ b/hw/core/sysbus.c
> @@ -33,7 +33,7 @@ typedef struct SysBusFind {
>  } SysBusFind;
>  
>  /* Run func() for every sysbus device, traverse the tree for everything else */
> -static int find_sysbus_device(Object *obj, void *opaque)
> +static bool find_sysbus_device(Object *obj, void *opaque, Error **errp)
>  {
>      SysBusFind *find = opaque;
>      Object *dev;
> @@ -44,12 +44,12 @@ static int find_sysbus_device(Object *obj, void *opaque)
>  
>      if (!sbdev) {
>          /* Container, traverse it for children */
> -        return object_child_foreach(obj, find_sysbus_device, opaque);
> +        return object_child_foreach(obj, find_sysbus_device, opaque, errp);
>      }
>  
>      find->func(sbdev, find->opaque);
>  
> -    return 0;
> +    return true;
>  }
>  
>  /*
> @@ -66,9 +66,9 @@ void foreach_dynamic_sysbus_device(FindSysbusDeviceFunc *func, void *opaque)
>  
>      /* Loop through all sysbus devices that were spawned outside the machine */
>      container = container_get(qdev_get_machine(), "/peripheral");
> -    find_sysbus_device(container, &find);
> +    find_sysbus_device(container, &find, NULL);
>      container = container_get(qdev_get_machine(), "/peripheral-anon");
> -    find_sysbus_device(container, &find);
> +    find_sysbus_device(container, &find, NULL);
>  }
>  
>  
> diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
> index e444b7c29d..bf3e27e945 100644
> --- a/hw/cpu/cluster.c
> +++ b/hw/cpu/cluster.c
> @@ -36,7 +36,7 @@ typedef struct CallbackData {
>      int cpu_count;
>  } CallbackData;
>  
> -static int add_cpu_to_cluster(Object *obj, void *opaque)
> +static bool add_cpu_to_cluster(Object *obj, void *opaque, Error **errp)
>  {
>      CallbackData *cbdata = opaque;
>      CPUState *cpu = (CPUState *)object_dynamic_cast(obj, TYPE_CPU);
> @@ -45,7 +45,7 @@ static int add_cpu_to_cluster(Object *obj, void *opaque)
>          cpu->cluster_index = cbdata->cluster->cluster_id;
>          cbdata->cpu_count++;
>      }
> -    return 0;
> +    return true;
>  }
>  
>  static void cpu_cluster_realize(DeviceState *dev, Error **errp)
> @@ -63,7 +63,8 @@ static void cpu_cluster_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> -    object_child_foreach_recursive(cluster_obj, add_cpu_to_cluster, &cbdata);
> +    object_child_foreach_recursive(cluster_obj, add_cpu_to_cluster,
> +                                   &cbdata, NULL);
>  
>      /*
>       * A cluster with no CPUs is a bug in the board/SoC code that created it;
> diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
> index 69e2cf0bd6..c3d3ea4f27 100644
> --- a/hw/display/virtio-gpu-udmabuf.c
> +++ b/hw/display/virtio-gpu-udmabuf.c
> @@ -90,7 +90,7 @@ static void virtio_gpu_destroy_udmabuf(struct virtio_gpu_simple_resource *res)
>      }
>  }
>  
> -static int find_memory_backend_type(Object *obj, void *opaque)
> +static bool find_memory_backend_type(Object *obj, void *opaque, Error **errp)
>  {
>      bool *memfd_backend = opaque;
>      int ret;
> @@ -107,7 +107,7 @@ static int find_memory_backend_type(Object *obj, void *opaque)
>          }
>      }
>  
> -    return 0;
> +    return true;
>  }
>  
>  bool virtio_gpu_have_udmabuf(void)
> @@ -122,7 +122,8 @@ bool virtio_gpu_have_udmabuf(void)
>      }
>  
>      memdev_root = object_resolve_path("/objects", NULL);
> -    object_child_foreach(memdev_root, find_memory_backend_type, &memfd_backend);
> +    object_child_foreach(memdev_root, find_memory_backend_type,
> +                         &memfd_backend, NULL);
>  
>      return memfd_backend;
>  }
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index b67dcbbb37..0079f98304 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2034,8 +2034,8 @@ insert_scope(PCIBus *bus, PCIDevice *dev, void *opaque)
>  }
>  
>  /* For a given PCI host bridge, walk and insert DMAR scope */
> -static int
> -dmar_host_bridges(Object *obj, void *opaque)
> +static bool
> +dmar_host_bridges(Object *obj, void *opaque, Error **errp)
>  {
>      GArray *scope_blob = opaque;
>  
> @@ -2047,7 +2047,7 @@ dmar_host_bridges(Object *obj, void *opaque)
>          }
>      }
>  
> -    return 0;
> +    return true;
>  }
>  
>  /*
> @@ -2077,7 +2077,7 @@ build_dmar_q35(GArray *table_data, BIOSLinker *linker, const char *oem_id,
>       * is attached to a bus with iommu enabled.
>       */
>      object_child_foreach_recursive(object_get_root(),
> -                                   dmar_host_bridges, scope_blob);
> +                                   dmar_host_bridges, scope_blob, NULL);
>  
>      assert(iommu);
>      if (x86_iommu_ir_supported(iommu)) {
> @@ -2240,8 +2240,8 @@ insert_ivhd(PCIBus *bus, PCIDevice *dev, void *opaque)
>  }
>  
>  /* For all PCI host bridges, walk and insert IVHD entries */
> -static int
> -ivrs_host_bridges(Object *obj, void *opaque)
> +static bool
> +ivrs_host_bridges(Object *obj, void *opaque, Error **errp)
>  {
>      GArray *ivhd_blob = opaque;
>  
> @@ -2253,7 +2253,7 @@ ivrs_host_bridges(Object *obj, void *opaque)
>          }
>      }
>  
> -    return 0;
> +    return true;
>  }
>  
>  static void
> @@ -2292,7 +2292,7 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
>       * is sufficient when no aliases are present.
>       */
>      object_child_foreach_recursive(object_get_root(),
> -                                   ivrs_host_bridges, ivhd_blob);
> +                                   ivrs_host_bridges, ivhd_blob, NULL);
>  
>      if (!ivhd_blob->len) {
>          /*
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 98a5c304a7..3d7f643dc7 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -4059,7 +4059,8 @@ static bool vtd_decide_config(IntelIOMMUState *s, Error **errp)
>      return true;
>  }
>  
> -static int vtd_machine_done_notify_one(Object *child, void *unused)
> +static bool vtd_machine_done_notify_one(Object *child, void *unused,
> +                                        Error **errp)
>  {
>      IntelIOMMUState *iommu = INTEL_IOMMU_DEVICE(x86_iommu_get_default());
>  
> @@ -4072,13 +4073,13 @@ static int vtd_machine_done_notify_one(Object *child, void *unused)
>          vtd_panic_require_caching_mode();
>      }
>  
> -    return 0;
> +    return true;
>  }
>  
>  static void vtd_machine_done_hook(Notifier *notifier, void *unused)
>  {
>      object_child_foreach_recursive(object_get_root(),
> -                                   vtd_machine_done_notify_one, NULL);
> +                                   vtd_machine_done_notify_one, NULL, NULL);
>  }
>  
>  static Notifier vtd_machine_done_notify = {
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 6e592bd969..310ca78560 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -546,22 +546,21 @@ typedef struct check_fdc_state {
>      bool multiple;
>  } CheckFdcState;
>  
> -static int check_fdc(Object *obj, void *opaque)
> +static bool check_fdc(Object *obj, void *opaque, Error **errp)
>  {
>      CheckFdcState *state = opaque;
>      Object *fdc;
>      uint32_t iobase;
> -    Error *local_err = NULL;
> +    g_autofree Error *local_err = NULL;
>  
>      fdc = object_dynamic_cast(obj, TYPE_ISA_FDC);
>      if (!fdc) {
> -        return 0;
> +        return true;
>      }
>  
>      iobase = object_property_get_uint(obj, "iobase", &local_err);
>      if (local_err || iobase != 0x3f0) {
> -        error_free(local_err);
> -        return 0;
> +        return true;
>      }
>  
>      if (state->floppy) {
> @@ -569,7 +568,7 @@ static int check_fdc(Object *obj, void *opaque)
>      } else {
>          state->floppy = ISA_DEVICE(obj);
>      }
> -    return 0;
> +    return true;
>  }
>  
>  static const char * const fdc_container_path[] = {
> @@ -588,7 +587,7 @@ static ISADevice *pc_find_fdc0(void)
>  
>      for (i = 0; i < ARRAY_SIZE(fdc_container_path); i++) {
>          container = container_get(qdev_get_machine(), fdc_container_path[i]);
> -        object_child_foreach(container, check_fdc, &state);
> +        object_child_foreach(container, check_fdc, &state, NULL);
>      }
>  
>      if (state.multiple) {
> diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
> index db004d17a6..c09ae42a3b 100644
> --- a/hw/i386/sgx.c
> +++ b/hw/i386/sgx.c
> @@ -37,7 +37,7 @@
>  
>  #define RETRY_NUM                       2
>  
> -static int sgx_epc_device_list(Object *obj, void *opaque)
> +static bool sgx_epc_device_list(Object *obj, void *opaque, Error **errp)
>  {
>      GSList **list = opaque;
>  
> @@ -45,15 +45,14 @@ static int sgx_epc_device_list(Object *obj, void *opaque)
>          *list = g_slist_append(*list, DEVICE(obj));
>      }
>  
> -    object_child_foreach(obj, sgx_epc_device_list, opaque);
> -    return 0;
> +    return object_child_foreach(obj, sgx_epc_device_list, opaque);
>  }
>  
>  static GSList *sgx_epc_get_device_list(void)
>  {
>      GSList *list = NULL;
>  
> -    object_child_foreach(qdev_get_machine(), sgx_epc_device_list, &list);
> +    object_child_foreach(qdev_get_machine(), sgx_epc_device_list, &list, NULL);
>      return list;
>  }
>  
> diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
> index d9f8301711..f0f47c0657 100644
> --- a/hw/mem/memory-device.c
> +++ b/hw/mem/memory-device.c
> @@ -35,7 +35,7 @@ static gint memory_device_addr_sort(gconstpointer a, gconstpointer b)
>      return 0;
>  }
>  
> -static int memory_device_build_list(Object *obj, void *opaque)
> +static bool memory_device_build_list(Object *obj, void *opaque, Error **errp)
>  {
>      GSList **list = opaque;
>  
> @@ -46,11 +46,11 @@ static int memory_device_build_list(Object *obj, void *opaque)
>          }
>      }
>  
> -    object_child_foreach(obj, memory_device_build_list, opaque);
> -    return 0;
> +    return object_child_foreach(obj, memory_device_build_list, opaque, errp);
>  }
>  
> -static int memory_device_used_region_size(Object *obj, void *opaque)
> +static bool memory_device_used_region_size(Object *obj, void *opaque,
> +                                           Error **errp)
>  {
>      uint64_t *size = opaque;
>  
> @@ -63,8 +63,8 @@ static int memory_device_used_region_size(Object *obj, void *opaque)
>          }
>      }
>  
> -    object_child_foreach(obj, memory_device_used_region_size, opaque);
> -    return 0;
> +    return object_child_foreach(obj, memory_device_used_region_size,
> +                                opaque, errp);
>  }
>  
>  static void memory_device_check_addable(MachineState *ms, uint64_t size,
> @@ -83,7 +83,7 @@ static void memory_device_check_addable(MachineState *ms, uint64_t size,
>      }
>  
>      /* will we exceed the total amount of memory specified */
> -    memory_device_used_region_size(OBJECT(ms), &used_region_size);
> +    memory_device_used_region_size(OBJECT(ms), &used_region_size, NULL);
>      if (used_region_size + size < used_region_size ||
>          used_region_size + size > ms->maxram_size - ms->ram_size) {
>          error_setg(errp, "not enough space, currently 0x%" PRIx64
> @@ -159,7 +159,7 @@ static uint64_t memory_device_get_free_addr(MachineState *ms,
>      }
>  
>      /* find address range that will fit new memory device */
> -    object_child_foreach(OBJECT(ms), memory_device_build_list, &list);
> +    object_child_foreach(OBJECT(ms), memory_device_build_list, &list, NULL);
>      for (item = list; item; item = g_slist_next(item)) {
>          const MemoryDeviceState *md = item->data;
>          const MemoryDeviceClass *mdc = MEMORY_DEVICE_GET_CLASS(OBJECT(md));
> @@ -202,7 +202,7 @@ MemoryDeviceInfoList *qmp_memory_device_list(void)
>      MemoryDeviceInfoList *list = NULL, **tail = &list;
>  
>      object_child_foreach(qdev_get_machine(), memory_device_build_list,
> -                         &devices);
> +                         &devices, NULL);
>  
>      for (item = devices; item; item = g_slist_next(item)) {
>          const MemoryDeviceState *md = MEMORY_DEVICE(item->data);
> @@ -219,7 +219,7 @@ MemoryDeviceInfoList *qmp_memory_device_list(void)
>      return list;
>  }
>  
> -static int memory_device_plugged_size(Object *obj, void *opaque)
> +static bool memory_device_plugged_size(Object *obj, void *opaque, Error **errp)
>  {
>      uint64_t *size = opaque;
>  
> @@ -233,15 +233,14 @@ static int memory_device_plugged_size(Object *obj, void *opaque)
>          }
>      }
>  
> -    object_child_foreach(obj, memory_device_plugged_size, opaque);
> -    return 0;
> +    return object_child_foreach(obj, memory_device_plugged_size, opaque, errp);
>  }
>  
>  uint64_t get_plugged_memory_size(void)
>  {
>      uint64_t size = 0;
>  
> -    memory_device_plugged_size(qdev_get_machine(), &size);
> +    memory_device_plugged_size(qdev_get_machine(), &size, NULL);
>  
>      return size;
>  }
> diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
> index 50ef83215c..4a722416ce 100644
> --- a/hw/mem/pc-dimm.c
> +++ b/hw/mem/pc-dimm.c
> @@ -92,7 +92,7 @@ void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine)
>      vmstate_unregister_ram(vmstate_mr, DEVICE(dimm));
>  }
>  
> -static int pc_dimm_slot2bitmap(Object *obj, void *opaque)
> +static bool pc_dimm_slot2bitmap(Object *obj, void *opaque, Error **errp)
>  {
>      unsigned long *bitmap = opaque;
>  
> @@ -104,8 +104,8 @@ static int pc_dimm_slot2bitmap(Object *obj, void *opaque)
>          }
>      }
>  
> -    object_child_foreach(obj, pc_dimm_slot2bitmap, opaque);
> -    return 0;
> +    object_child_foreach(obj, pc_dimm_slot2bitmap, opaque, errp);
> +    return true;
>  }
>  
>  static int pc_dimm_get_free_slot(const int *hint, int max_slots, Error **errp)
> @@ -120,7 +120,7 @@ static int pc_dimm_get_free_slot(const int *hint, int max_slots, Error **errp)
>      }
>  
>      bitmap = bitmap_new(max_slots);
> -    object_child_foreach(qdev_get_machine(), pc_dimm_slot2bitmap, bitmap);
> +    object_child_foreach(qdev_get_machine(), pc_dimm_slot2bitmap, bitmap, NULL);
>  
>      /* check if requested slot is not occupied */
>      if (hint) {
> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> index d6ba47bde9..d7a660a4a3 100644
> --- a/hw/misc/mos6522.c
> +++ b/hw/misc/mos6522.c
> @@ -497,7 +497,7 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>      }
>  }
>  
> -static int qmp_x_query_via_foreach(Object *obj, void *opaque)
> +static bool qmp_x_query_via_foreach(Object *obj, void *opaque, Error **errp)
>  {
>      GString *buf = opaque;
>  
> @@ -573,7 +573,7 @@ static int qmp_x_query_via_foreach(Object *obj, void *opaque)
>                                 get_next_irq_time(s, &s->timers[1], now));
>      }
>  
> -    return 0;
> +    return true;
>  }
>  
>  static HumanReadableText *qmp_x_query_via(Error **errp)
> @@ -581,7 +581,7 @@ static HumanReadableText *qmp_x_query_via(Error **errp)
>      g_autoptr(GString) buf = g_string_new("");
>  
>      object_child_foreach_recursive(object_get_root(),
> -                                   qmp_x_query_via_foreach, buf);
> +                                   qmp_x_query_via_foreach, buf, NULL);
>  
>      return human_readable_text_from_str(buf);
>  }
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 38e69f3b39..36b372dd95 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -747,18 +747,17 @@ static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
>      }
>  }
>  
> -static int pnv_chip_power9_pic_print_info_child(Object *child, void *opaque)
> +static bool pnv_chip_power9_pic_print_info_child(Object *child, void *opaque,
> +                                                 Error **errp)
>  {
>      Monitor *mon = opaque;
>      PnvPHB *phb =  (PnvPHB *) object_dynamic_cast(child, TYPE_PNV_PHB);
>  
> -    if (!phb) {
> -        return 0;
> +    if (phb) {
> +        pnv_phb4_pic_print_info(PNV_PHB4(phb->backend), mon);
>      }
>  
> -    pnv_phb4_pic_print_info(PNV_PHB4(phb->backend), mon);
> -
> -    return 0;
> +    return true;
>  }
>  
>  static void pnv_chip_power9_pic_print_info(PnvChip *chip, Monitor *mon)
> @@ -769,7 +768,7 @@ static void pnv_chip_power9_pic_print_info(PnvChip *chip, Monitor *mon)
>      pnv_psi_pic_print_info(&chip9->psi, mon);
>  
>      object_child_foreach_recursive(OBJECT(chip),
> -                         pnv_chip_power9_pic_print_info_child, mon);
> +                         pnv_chip_power9_pic_print_info_child, mon, NULL);
>  }
>  
>  static uint64_t pnv_chip_power8_xscom_core_base(PnvChip *chip,
> @@ -817,7 +816,7 @@ static void pnv_chip_power10_pic_print_info(PnvChip *chip, Monitor *mon)
>      pnv_psi_pic_print_info(&chip10->psi, mon);
>  
>      object_child_foreach_recursive(OBJECT(chip),
> -                         pnv_chip_power9_pic_print_info_child, mon);
> +                         pnv_chip_power9_pic_print_info_child, mon, NULL);
>  }
>  
>  /* Always give the first 1GB to chip 0 else we won't boot */
> diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
> index 99f1e8d7f9..05acc88a55 100644
> --- a/hw/ppc/pnv_bmc.c
> +++ b/hw/ppc/pnv_bmc.c
> @@ -283,17 +283,17 @@ typedef struct ForeachArgs {
>      Object *obj;
>  } ForeachArgs;
>  
> -static int bmc_find(Object *child, void *opaque)
> +static bool bmc_find(Object *child, void *opaque, Error **errp)
>  {
>      ForeachArgs *args = opaque;
>  
>      if (object_dynamic_cast(child, args->name)) {
>          if (args->obj) {
> -            return 1;
> +            return false;
>          }
>          args->obj = child;
>      }
> -    return 0;
> +    return true;
>  }
>  
>  IPMIBmc *pnv_bmc_find(Error **errp)
> @@ -301,7 +301,8 @@ IPMIBmc *pnv_bmc_find(Error **errp)
>      ForeachArgs args = { TYPE_IPMI_BMC, NULL };
>      int ret;
>  
> -    ret = object_child_foreach_recursive(object_get_root(), bmc_find, &args);
> +    ret = object_child_foreach_recursive(object_get_root(), bmc_find,
> +                                         &args, NULL);
>      if (ret) {
>          error_setg(errp, "machine should have only one BMC device. "
>                     "Use '-nodefaults'");
> diff --git a/hw/ppc/pnv_xscom.c b/hw/ppc/pnv_xscom.c
> index d820e05e40..c7ca5a5b4c 100644
> --- a/hw/ppc/pnv_xscom.c
> +++ b/hw/ppc/pnv_xscom.c
> @@ -254,7 +254,7 @@ typedef struct ForeachPopulateArgs {
>      int xscom_offset;
>  } ForeachPopulateArgs;
>  
> -static int xscom_dt_child(Object *child, void *opaque)
> +static bool xscom_dt_child(Object *child, void *opaque, Error **errp)
>  {
>      if (object_dynamic_cast(child, TYPE_PNV_XSCOM_INTERFACE)) {
>          ForeachPopulateArgs *args = opaque;
> @@ -268,7 +268,7 @@ static int xscom_dt_child(Object *child, void *opaque)
>              _FDT((xc->dt_xscom(xd, args->fdt, args->xscom_offset)));
>          }
>      }
> -    return 0;
> +    return true;
>  }
>  
>  int pnv_dt_xscom(PnvChip *chip, void *fdt, int root_offset,
> @@ -308,7 +308,7 @@ int pnv_dt_xscom(PnvChip *chip, void *fdt, int root_offset,
>       * PnvXScomInterface objects which can lie a bit deeper than the
>       * first layer.
>       */
> -    object_child_foreach_recursive(OBJECT(chip), xscom_dt_child, &args);
> +    object_child_foreach_recursive(OBJECT(chip), xscom_dt_child, &args, NULL);
>      return 0;
>  }
>  
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 75aacda65a..2eed33ab3b 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -1488,28 +1488,31 @@ static void spapr_pci_bridge_plug(SpaprPhbState *phb,
>  }
>  
>  /* Returns non-zero if the value of "chassis_nr" is already in use */
> -static int check_chassis_nr(Object *obj, void *opaque)
> +static bool check_chassis_nr(Object *obj, void *opaque, Error **errp)
>  {
> -    int new_chassis_nr =
> -        object_property_get_uint(opaque, "chassis_nr", &error_abort);
> -    int chassis_nr =
> -        object_property_get_uint(obj, "chassis_nr", NULL);
> -
> -    if (!object_dynamic_cast(obj, TYPE_PCI_BRIDGE)) {
> -        return 0;
> -    }
> -
> -    /* Skip unsupported bridge types */
> -    if (!chassis_nr) {
> -        return 0;
> -    }
> +    int chassis_nr;
>  
>      /* Skip self */
>      if (obj == opaque) {
> -        return 0;
> +        return true;
>      }
>  
> -    return chassis_nr == new_chassis_nr;
> +    if (!object_dynamic_cast(obj, TYPE_PCI_BRIDGE)) {
> +        return true;
> +    }
> +
> +    chassis_nr = object_property_get_uint(obj, "chassis_nr", NULL);
> +    /* Skip unsupported bridge types */
> +    if (!chassis_nr) {
> +        return true;
> +    }
> +
> +    if (chassis_nr == object_property_get_uint(opaque, "chassis_nr",
> +                                               &error_abort)) {
> +        error_setg(errp, "Bridge chassis %d already in use", chassis_nr);
> +        return false;
> +    }
> +    return true;
>  }
>  
>  static bool bridge_has_valid_chassis_nr(Object *bridge, Error **errp)
> @@ -1529,13 +1532,8 @@ static bool bridge_has_valid_chassis_nr(Object *bridge, Error **errp)
>      }
>  
>      /* We want unique values for "chassis_nr" */
> -    if (object_child_foreach_recursive(object_get_root(), check_chassis_nr,
> -                                       bridge)) {
> -        error_setg(errp, "Bridge chassis %d already in use", chassis_nr);
> -        return false;
> -    }
> -
> -    return true;
> +    return object_child_foreach_recursive(object_get_root(), check_chassis_nr,
> +                                          bridge, errp);
>  }
>  
>  static void spapr_pci_pre_plug(HotplugHandler *plug_handler,
> @@ -2035,7 +2033,7 @@ unrealize:
>      spapr_phb_unrealize(dev);
>  }
>  
> -static int spapr_phb_children_reset(Object *child, void *opaque)
> +static bool spapr_phb_children_reset(Object *child, void *opaque, Error **errp)
>  {
>      DeviceState *dev = (DeviceState *) object_dynamic_cast(child, TYPE_DEVICE);
>  
> @@ -2043,7 +2041,7 @@ static int spapr_phb_children_reset(Object *child, void *opaque)
>          device_cold_reset(dev);
>      }
>  
> -    return 0;
> +    return true;
>  }
>  
>  void spapr_phb_dma_reset(SpaprPhbState *sphb)
> @@ -2079,7 +2077,7 @@ static void spapr_phb_reset(DeviceState *qdev)
>      }
>  
>      /* Reset the IOMMU state */
> -    object_child_foreach(OBJECT(qdev), spapr_phb_children_reset, NULL);
> +    object_child_foreach(OBJECT(qdev), spapr_phb_children_reset, NULL, NULL);
>  
>      if (spapr_phb_eeh_available(SPAPR_PCI_HOST_BRIDGE(qdev))) {
>          spapr_phb_vfio_reset(qdev);
> diff --git a/hw/ppc/spapr_rtas_ddw.c b/hw/ppc/spapr_rtas_ddw.c
> index 98f1310c6e..48ba59e4b3 100644
> --- a/hw/ppc/spapr_rtas_ddw.c
> +++ b/hw/ppc/spapr_rtas_ddw.c
> @@ -24,7 +24,8 @@
>  #include "hw/pci-host/spapr.h"
>  #include "trace.h"
>  
> -static int spapr_phb_get_active_win_num_cb(Object *child, void *opaque)
> +static bool spapr_phb_get_active_win_num_cb(Object *child, void *opaque,
> +                                            Error **errp)
>  {
>      SpaprTceTable *tcet;
>  
> @@ -32,19 +33,21 @@ static int spapr_phb_get_active_win_num_cb(Object *child, void *opaque)
>      if (tcet && tcet->nb_table) {
>          ++*(unsigned *)opaque;
>      }
> -    return 0;
> +    return true;
>  }
>  
>  static unsigned spapr_phb_get_active_win_num(SpaprPhbState *sphb)
>  {
>      unsigned ret = 0;
>  
> -    object_child_foreach(OBJECT(sphb), spapr_phb_get_active_win_num_cb, &ret);
> +    object_child_foreach(OBJECT(sphb), spapr_phb_get_active_win_num_cb,
> +                         &ret, NULL);
>  
>      return ret;
>  }
>  
> -static int spapr_phb_get_free_liobn_cb(Object *child, void *opaque)
> +static bool spapr_phb_get_free_liobn_cb(Object *child, void *opaque,
> +                                        Error **errp)
>  {
>      SpaprTceTable *tcet;
>  
> @@ -52,14 +55,15 @@ static int spapr_phb_get_free_liobn_cb(Object *child, void *opaque)
>      if (tcet && !tcet->nb_table) {
>          *(uint32_t *)opaque = tcet->liobn;
>      }
> -    return 0;
> +    return true;
>  }
>  
>  static unsigned spapr_phb_get_free_liobn(SpaprPhbState *sphb)
>  {
>      uint32_t liobn = 0;
>  
> -    object_child_foreach(OBJECT(sphb), spapr_phb_get_free_liobn_cb, &liobn);
> +    object_child_foreach(OBJECT(sphb), spapr_phb_get_free_liobn_cb,
> +                         &liobn, NULL);
>  
>      return liobn;
>  }
> diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
> index 4fc6712025..5b25118edc 100644
> --- a/hw/rdma/vmw/pvrdma_main.c
> +++ b/hw/rdma/vmw/pvrdma_main.c
> @@ -574,7 +574,7 @@ static void init_dev_caps(PVRDMADev *dev)
>                                  dev->dev_attr.max_sge) - TARGET_PAGE_SIZE;
>  }
>  
> -static int pvrdma_check_ram_shared(Object *obj, void *opaque)
> +static bool pvrdma_check_ram_shared(Object *obj, void *opaque, Error **errp)
>  {
>      bool *shared = opaque;
>  
> @@ -582,7 +582,7 @@ static int pvrdma_check_ram_shared(Object *obj, void *opaque)
>          *shared = object_property_get_bool(obj, "share", NULL);
>      }
>  
> -    return 0;
> +    return true;
>  }
>  
>  static void pvrdma_shutdown_notifier(Notifier *n, void *opaque)
> @@ -623,7 +623,8 @@ static void pvrdma_realize(PCIDevice *pdev, Error **errp)
>  
>      memdev_root = object_resolve_path("/objects", NULL);
>      if (memdev_root) {
> -        object_child_foreach(memdev_root, pvrdma_check_ram_shared, &ram_shared);
> +        object_child_foreach(memdev_root, pvrdma_check_ram_shared,
> +                             &ram_shared, NULL);
>      }
>      if (!ram_shared) {
>          error_setg(errp, "Only shared memory backed ram is supported");
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index 746f07c4d2..84cd2a1334 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -729,7 +729,7 @@ static void virtio_balloon_get_config(VirtIODevice *vdev, uint8_t *config_data)
>      memcpy(config_data, &config, virtio_balloon_config_size(dev));
>  }
>  
> -static int build_dimm_list(Object *obj, void *opaque)
> +static bool build_dimm_list(Object *obj, void *opaque, Error **errp)
>  {
>      GSList **list = opaque;
>  
> @@ -740,8 +740,7 @@ static int build_dimm_list(Object *obj, void *opaque)
>          }
>      }
>  
> -    object_child_foreach(obj, build_dimm_list, opaque);
> -    return 0;
> +    return object_child_foreach(obj, build_dimm_list, opaque, errp);
>  }
>  
>  static ram_addr_t get_current_ram_size(void)
> @@ -749,7 +748,7 @@ static ram_addr_t get_current_ram_size(void)
>      GSList *list = NULL, *item;
>      ram_addr_t size = current_machine->ram_size;
>  
> -    build_dimm_list(qdev_get_machine(), &list);
> +    build_dimm_list(qdev_get_machine(), &list, NULL);
>      for (item = list; item; item = g_slist_next(item)) {
>          Object *obj = OBJECT(item->data);
>          if (!strcmp(object_get_typename(obj), TYPE_PC_DIMM)) {
> diff --git a/include/qom/object.h b/include/qom/object.h
> index ef7258a5e1..7809cd3925 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -1907,36 +1907,40 @@ void object_class_property_set_description(ObjectClass *klass, const char *name,
>   * @obj: the object whose children will be navigated
>   * @fn: the iterator function to be called
>   * @opaque: an opaque value that will be passed to the iterator
> + * @errp: pointer to a NULL-initialized error object
>   *
> - * Call @fn passing each child of @obj and @opaque to it, until @fn returns
> - * non-zero.
> + * Call @fn passing each child of @obj, @opaque and @errp to it,
> + * until @fn returns false.
>   *
>   * It is forbidden to add or remove children from @obj from the @fn
>   * callback.
>   *
> - * Returns: The last value returned by @fn, or 0 if there is no child.
> + * Returns: The last value returned by @fn, or %true if there is no child.
>   */
> -int object_child_foreach(Object *obj, int (*fn)(Object *child, void *opaque),
> -                         void *opaque);
> +bool object_child_foreach(Object *obj,
> +                          bool (*fn)(Object *child, void *opaque, Error **errp),
> +                          void *opaque, Error **errp);
>  
>  /**
>   * object_child_foreach_recursive:
>   * @obj: the object whose children will be navigated
>   * @fn: the iterator function to be called
>   * @opaque: an opaque value that will be passed to the iterator
> + * @errp: pointer to a NULL-initialized error object
>   *
> - * Call @fn passing each child of @obj and @opaque to it, until @fn returns
> - * non-zero. Calls recursively, all child nodes of @obj will also be passed
> - * all the way down to the leaf nodes of the tree. Depth first ordering.
> + * Call @fn passing each child of @obj, @opaque and @errp to it, until @fn
> + * returns false. Calls recursively, all child nodes of @obj will also be
> + * passed all the way down to the leaf nodes of the tree. Depth first ordering.
>   *
>   * It is forbidden to add or remove children from @obj (or its
>   * child nodes) from the @fn callback.
>   *
> - * Returns: The last value returned by @fn, or 0 if there is no child.
> + * Returns: The last value returned by @fn, or %true if there is no child.
>   */
> -int object_child_foreach_recursive(Object *obj,
> -                                   int (*fn)(Object *child, void *opaque),
> -                                   void *opaque);
> +bool object_child_foreach_recursive(Object *obj,
> +                                    bool (*fn)(Object *child, void *opaque,
> +                                               Error **errp),
> +                                    void *opaque, Error **errp);
>  /**
>   * container_get:
>   * @root: root of the #path, e.g., object_get_root()
> diff --git a/iothread.c b/iothread.c
> index 3862a64471..67ce6fe014 100644
> --- a/iothread.c
> +++ b/iothread.c
> @@ -342,7 +342,7 @@ AioContext *iothread_get_aio_context(IOThread *iothread)
>      return iothread->ctx;
>  }
>  
> -static int query_one_iothread(Object *object, void *opaque)
> +static bool query_one_iothread(Object *object, void *opaque, Error **errp)
>  {
>      IOThreadInfoList ***tail = opaque;
>      IOThreadInfo *info;
> @@ -350,7 +350,7 @@ static int query_one_iothread(Object *object, void *opaque)
>  
>      iothread = (IOThread *)object_dynamic_cast(object, TYPE_IOTHREAD);
>      if (!iothread) {
> -        return 0;
> +        return true;
>      }
>  
>      info = g_new0(IOThreadInfo, 1);
> @@ -362,7 +362,7 @@ static int query_one_iothread(Object *object, void *opaque)
>      info->aio_max_batch = iothread->parent_obj.aio_max_batch;
>  
>      QAPI_LIST_APPEND(*tail, info);
> -    return 0;
> +    return true;
>  }
>  
>  IOThreadInfoList *qmp_query_iothreads(Error **errp)
> @@ -371,7 +371,7 @@ IOThreadInfoList *qmp_query_iothreads(Error **errp)
>      IOThreadInfoList **prev = &head;
>      Object *container = object_get_objects_root();
>  
> -    object_child_foreach(container, query_one_iothread, &prev);
> +    object_child_foreach(container, query_one_iothread, &prev, errp);
>      return head;
>  }
>  
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 34bd8c67d7..1b8c406ed0 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -82,7 +82,7 @@ void hmp_info_version(Monitor *mon, const QDict *qdict)
>      qapi_free_VersionInfo(info);
>  }
>  
> -static int hmp_info_pic_foreach(Object *obj, void *opaque)
> +static bool hmp_info_pic_foreach(Object *obj, void *opaque, Error **errp)
>  {
>      InterruptStatsProvider *intc;
>      InterruptStatsProviderClass *k;
> @@ -99,13 +99,13 @@ static int hmp_info_pic_foreach(Object *obj, void *opaque)
>          }
>      }
>  
> -    return 0;
> +    return true;
>  }
>  
>  void hmp_info_pic(Monitor *mon, const QDict *qdict)
>  {
>      object_child_foreach_recursive(object_get_root(),
> -                                   hmp_info_pic_foreach, mon);
> +                                   hmp_info_pic_foreach, mon, NULL);
>  }
>  
>  void hmp_quit(Monitor *mon, const QDict *qdict)
> diff --git a/qom/object.c b/qom/object.c
> index e25f1e96db..665edd1693 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -1104,45 +1104,45 @@ void object_class_foreach(void (*fn)(ObjectClass *klass, void *opaque),
>      enumerating_types = false;
>  }
>  
> -static int do_object_child_foreach(Object *obj,
> -                                   int (*fn)(Object *child, void *opaque),
> -                                   void *opaque, bool recurse)
> +static bool do_object_child_foreach(Object *obj,
> +                                    bool (*fn)(Object *child, void *opaque,
> +                                               Error **errp),
> +                                    void *opaque, bool recurse, Error **errp)
>  {
>      GHashTableIter iter;
>      ObjectProperty *prop;
> -    int ret = 0;
>  
>      g_hash_table_iter_init(&iter, obj->properties);
>      while (g_hash_table_iter_next(&iter, NULL, (gpointer *)&prop)) {
>          if (object_property_is_child(prop)) {
>              Object *child = prop->opaque;
>  
> -            ret = fn(child, opaque);
> -            if (ret != 0) {
> -                break;
> +            if (!fn(child, opaque, errp)) {
> +                return false;
>              }
>              if (recurse) {
> -                ret = do_object_child_foreach(child, fn, opaque, true);
> -                if (ret != 0) {
> -                    break;
> +                if (!do_object_child_foreach(child, fn, opaque, true, errp)) {
> +                    return false;
>                  }
>              }
>          }
>      }
> -    return ret;
> +    return true;
>  }
>  
> -int object_child_foreach(Object *obj, int (*fn)(Object *child, void *opaque),
> -                         void *opaque)
> +bool object_child_foreach(Object *obj,
> +                          bool (*fn)(Object *child, void *opaque, Error **errp),
> +                          void *opaque, Error **errp)
>  {
> -    return do_object_child_foreach(obj, fn, opaque, false);
> +    return do_object_child_foreach(obj, fn, opaque, false, errp);
>  }
>  
> -int object_child_foreach_recursive(Object *obj,
> -                                   int (*fn)(Object *child, void *opaque),
> -                                   void *opaque)
> +bool object_child_foreach_recursive(Object *obj,
> +                                    bool (*fn)(Object *child, void *opaque,
> +                                               Error **errp),
> +                                    void *opaque, Error **errp)
>  {
> -    return do_object_child_foreach(obj, fn, opaque, true);
> +    return do_object_child_foreach(obj, fn, opaque, true, errp);
>  }
>  
>  static void object_class_get_list_tramp(ObjectClass *klass, void *opaque)
> diff --git a/qom/qom-hmp-cmds.c b/qom/qom-hmp-cmds.c
> index 6e3a2175a4..9a3267020e 100644
> --- a/qom/qom-hmp-cmds.c
> +++ b/qom/qom-hmp-cmds.c
> @@ -101,10 +101,11 @@ static int qom_composition_compare(const void *a, const void *b)
>                       object_get_canonical_path_component(*(Object **)b));
>  }
>  
> -static int insert_qom_composition_child(Object *obj, void *opaque)
> +static bool insert_qom_composition_child(Object *obj, void *opaque,
> +                                         Error **errp)
>  {
>      g_array_append_val(opaque, obj);
> -    return 0;
> +    return true;
>  }
>  
>  static void print_qom_composition(Monitor *mon, Object *obj, int indent)
> @@ -121,7 +122,7 @@ static void print_qom_composition(Monitor *mon, Object *obj, int indent)
>      monitor_printf(mon, "%*s/%s (%s)\n", indent, "", name,
>                     object_get_typename(obj));
>  
> -    object_child_foreach(obj, insert_qom_composition_child, children);
> +    object_child_foreach(obj, insert_qom_composition_child, children, NULL);
>      g_array_sort(children, qom_composition_compare);
>  
>      for (i = 0; i < children->len; i++) {
> diff --git a/scsi/pr-manager.c b/scsi/pr-manager.c
> index 2098d7e759..48a32729ba 100644
> --- a/scsi/pr-manager.c
> +++ b/scsi/pr-manager.c
> @@ -114,7 +114,7 @@ pr_manager_register_types(void)
>      type_register_static(&pr_manager_info);
>  }
>  
> -static int query_one_pr_manager(Object *object, void *opaque)
> +static bool query_one_pr_manager(Object *object, void *opaque, Error **errp)
>  {
>      PRManagerInfoList ***tail = opaque;
>      PRManagerInfo *info;
> @@ -122,14 +122,14 @@ static int query_one_pr_manager(Object *object, void *opaque)
>  
>      pr_mgr = (PRManager *)object_dynamic_cast(object, TYPE_PR_MANAGER);
>      if (!pr_mgr) {
> -        return 0;
> +        return true;
>      }
>  
>      info = g_new0(PRManagerInfo, 1);
>      info->id = g_strdup(object_get_canonical_path_component(object));
>      info->connected = pr_manager_is_connected(pr_mgr);
>      QAPI_LIST_APPEND(*tail, info);
> -    return 0;
> +    return true;
>  }
>  
>  PRManagerInfoList *qmp_query_pr_managers(Error **errp)
> @@ -138,7 +138,7 @@ PRManagerInfoList *qmp_query_pr_managers(Error **errp)
>      PRManagerInfoList **prev = &head;
>      Object *container = container_get(object_get_root(), PR_MANAGER_PATH);
>  
> -    object_child_foreach(container, query_one_pr_manager, &prev);
> +    object_child_foreach(container, query_one_pr_manager, &prev, errp);
>      return head;
>  }
>  
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index cb998cdf23..033f021030 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -1332,7 +1332,7 @@ GString *ram_block_format(void)
>      return buf;
>  }
>  
> -static int find_min_backend_pagesize(Object *obj, void *opaque)
> +static bool find_min_backend_pagesize(Object *obj, void *opaque, Error **errp)
>  {
>      long *hpsize_min = opaque;
>  
> @@ -1345,10 +1345,10 @@ static int find_min_backend_pagesize(Object *obj, void *opaque)
>          }
>      }
>  
> -    return 0;
> +    return true;
>  }
>  
> -static int find_max_backend_pagesize(Object *obj, void *opaque)
> +static bool find_max_backend_pagesize(Object *obj, void *opaque, Error **errp)
>  {
>      long *hpsize_max = opaque;
>  
> @@ -1361,7 +1361,7 @@ static int find_max_backend_pagesize(Object *obj, void *opaque)
>          }
>      }
>  
> -    return 0;
> +    return true;
>  }
>  
>  /*
> @@ -1373,7 +1373,7 @@ long qemu_minrampagesize(void)
>      long hpsize = LONG_MAX;
>      Object *memdev_root = object_resolve_path("/objects", NULL);
>  
> -    object_child_foreach(memdev_root, find_min_backend_pagesize, &hpsize);
> +    object_child_foreach(memdev_root, find_min_backend_pagesize, &hpsize, NULL);
>      return hpsize;
>  }
>  
> @@ -1382,7 +1382,8 @@ long qemu_maxrampagesize(void)
>      long pagesize = 0;
>      Object *memdev_root = object_resolve_path("/objects", NULL);
>  
> -    object_child_foreach(memdev_root, find_max_backend_pagesize, &pagesize);
> +    object_child_foreach(memdev_root, find_max_backend_pagesize, &pagesize,
> +                         NULL);
>      return pagesize;
>  }
>  
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index b8d2c4dadd..6d5747fce5 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -998,27 +998,28 @@ void device_add_completion(ReadLineState *rs, int nb_args, const char *str)
>      g_slist_free(list);
>  }
>  
> -static int qdev_add_hotpluggable_device(Object *obj, void *opaque)
> +static bool qdev_add_hotpluggable_device(Object *obj, void *opaque,
> +                                         Error **errp)
>  {
>      GSList **list = opaque;
>      DeviceState *dev = (DeviceState *)object_dynamic_cast(obj, TYPE_DEVICE);
>  
>      if (dev == NULL) {
> -        return 0;
> +        return true;
>      }
>  
>      if (dev->realized && object_property_get_bool(obj, "hotpluggable", NULL)) {
>          *list = g_slist_append(*list, dev);
>      }
>  
> -    return 0;
> +    return true;
>  }
>  
>  static GSList *qdev_build_hotpluggable_device_list(Object *peripheral)
>  {
>      GSList *list = NULL;
>  
> -    object_child_foreach(peripheral, qdev_add_hotpluggable_device, &list);
> +    object_child_foreach(peripheral, qdev_add_hotpluggable_device, &list, NULL);
>  
>      return list;
>  }
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index 7326f6840b..2bd5643372 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -761,7 +761,7 @@ static int locate_fuzz_memory_regions(Object *child, void *opaque)
>      return 0;
>  }
>  
> -static int locate_fuzz_objects(Object *child, void *opaque)
> +static bool locate_fuzz_objects(Object *child, void *opaque, Error **errp)
>  {
>      GString *type_name;
>      GString *path_name;
> @@ -800,7 +800,7 @@ static int locate_fuzz_objects(Object *child, void *opaque)
>          g_string_free(path_name, true);
>      }
>      g_string_free(type_name, true);
> -    return 0;
> +    return true;
>  }
>  
>  
> @@ -866,7 +866,7 @@ static void generic_pre_fuzz(QTestState *s)
>          printf("Matching objects by name %s\n", result[i]);
>          object_child_foreach_recursive(qdev_get_machine(),
>                                      locate_fuzz_objects,
> -                                    name_pattern->str);
> +                                    name_pattern->str, NULL);
>          g_string_free(name_pattern, true);
>      }
>      g_strfreev(result);
> diff --git a/ui/dbus-chardev.c b/ui/dbus-chardev.c
> index 940ef937cd..21de92fc98 100644
> --- a/ui/dbus-chardev.c
> +++ b/ui/dbus-chardev.c
> @@ -68,18 +68,16 @@ dbus_display_chardev_unexport(DBusDisplay *dpy, DBusChardev *chr)
>      chr->exported = false;
>  }
>  
> -static int
> -dbus_display_chardev_foreach(Object *obj, void *data)
> +static bool
> +dbus_display_chardev_foreach(Object *obj, void *data, Error **errp)
>  {
>      DBusDisplay *dpy = DBUS_DISPLAY(data);
>  
> -    if (!CHARDEV_IS_DBUS(obj)) {
> -        return 0;
> +    if (CHARDEV_IS_DBUS(obj)) {
> +        dbus_display_chardev_export(dpy, DBUS_CHARDEV(obj));
>      }
>  
> -    dbus_display_chardev_export(dpy, DBUS_CHARDEV(obj));
> -
> -    return 0;
> +    return true;
>  }
>  
>  static void
> @@ -105,7 +103,7 @@ dbus_chardev_init(DBusDisplay *dpy)
>      dbus_display_notifier_add(&dpy->notifier);
>  
>      object_child_foreach(container_get(object_get_root(), "/chardevs"),
> -                         dbus_display_chardev_foreach, dpy);
> +                         dbus_display_chardev_foreach, dpy, NULL);
>  }
>  
>  static gboolean
> diff --git a/util/nvdimm-utils.c b/util/nvdimm-utils.c
> index aa3d199f2d..b356a3fbea 100644
> --- a/util/nvdimm-utils.c
> +++ b/util/nvdimm-utils.c
> @@ -2,7 +2,7 @@
>  #include "qemu/nvdimm-utils.h"
>  #include "hw/mem/nvdimm.h"
>  
> -static int nvdimm_device_list(Object *obj, void *opaque)
> +static bool nvdimm_device_list(Object *obj, void *opaque, Error **errp)
>  {
>      GSList **list = opaque;
>  
> @@ -10,8 +10,8 @@ static int nvdimm_device_list(Object *obj, void *opaque)
>          *list = g_slist_append(*list, DEVICE(obj));
>      }
>  
> -    object_child_foreach(obj, nvdimm_device_list, opaque);
> -    return 0;
> +    object_child_foreach(obj, nvdimm_device_list, opaque, errp);
> +    return true;
>  }
>  
>  /*
> @@ -25,6 +25,6 @@ GSList *nvdimm_get_device_list(void)
>  {
>      GSList *list = NULL;
>  
> -    object_child_foreach(qdev_get_machine(), nvdimm_device_list, &list);
> +    object_child_foreach(qdev_get_machine(), nvdimm_device_list, &list, NULL);
>      return list;
>  }
> -- 
> 2.38.1


