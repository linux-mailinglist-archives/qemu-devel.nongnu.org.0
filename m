Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3542210D1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jul 2020 17:27:34 +0200 (CEST)
Received: from localhost ([::1]:43230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvjJk-0005bf-K0
	for lists+qemu-devel@lfdr.de; Wed, 15 Jul 2020 11:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1jvjIx-000584-3n
 for qemu-devel@nongnu.org; Wed, 15 Jul 2020 11:26:43 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:36870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1jvjIu-0003S6-JB
 for qemu-devel@nongnu.org; Wed, 15 Jul 2020 11:26:42 -0400
Received: by mail-ot1-x342.google.com with SMTP id w17so1764805otl.4
 for <qemu-devel@nongnu.org>; Wed, 15 Jul 2020 08:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eVvR5f/Xmm3PdtG4V/M9T2OYMC8b9EZoa0ecgN8ek54=;
 b=eBK7fd3S3PqKjfBvAmxtZbzzCvB5HOm5J7JdF292K4yu/O6goXQ2SnxSaRHOWw/9N7
 jwlr7PKtzVGEDBRhcbpUEI4Bq8yhiRBW5kdwnx5DIcKPVZ1gG93Vca4626V+2QHdDdGM
 M2so3HcGvkuz2QJm0L2tZS5l/WLmyBT3s0BBombZ+oJvGU81aTzqT9C+FGm8crkyXVJH
 0arQqhkjLPmbOfp12HAYJhYtOe86WoGS205psP1/TAv1+ocf0I5hQlPGpS26OnZ2qpYl
 SfHLUAmO0uHX9CfNSj4GQU9xClBGz1GeOMu1k3m+ZvwEwirOMXojXOQ5f24PxSHAlTF0
 RmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eVvR5f/Xmm3PdtG4V/M9T2OYMC8b9EZoa0ecgN8ek54=;
 b=Z2lMo8VuAGbTmoRWkJODE5dD3pFPtpeuUq7dwlgD4sslD1W9hwQv4BAUgiZkzLnBls
 5neASzd+TqOpv2eEjNVlCkJ1U34FuoyXgtSfN3mZvybWwScL5sHJ39CqS08tnefDlu0u
 +F64dAWpDmU1OrSmoPXkg5Ls2cKdxyMVOgUsjEszJT2jX35Yq/ULFuOKJZbsjPhUDQjB
 hHvK97JqptVEBn7i/SZPBqp2W+o5nfbPjCfSDW2ochcUhbSavR91hg1kZm+loPC0MjRu
 EtnuG/8TcmtoluI4P5pFezErecxabdW1et2JzTPaqrbkbo0SuHObTdVXhhS2ikTBTKXN
 u5Lw==
X-Gm-Message-State: AOAM531pOArnjgDa86NUYU3MpkgBfi/jMvvPUuZduQnyRsYZPAH2j8XY
 EMm09bLFF7zzPhb6boKI1ZJfe4dEePn12Dg4SnUwpgdd40Q=
X-Google-Smtp-Source: ABdhPJzaiQQB2W3o23DTVE9CEq9cYKjvIj4hKfbPGHEQKrH+jc8esnBC3qHw2/sb6OMzgEVq7n1q/THvylQE2HkMMSI=
X-Received: by 2002:a9d:787:: with SMTP id 7mr112436oto.333.1594826799108;
 Wed, 15 Jul 2020 08:26:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200714160202.3121879-1-armbru@redhat.com>
 <20200714160202.3121879-4-armbru@redhat.com>
In-Reply-To: <20200714160202.3121879-4-armbru@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Wed, 15 Jul 2020 23:26:02 +0800
Message-ID: <CAKXe6S+f0F7qQsAVntMEPpbYPqe4Doeph6Cc4eSD9WCRdRkMtw@mail.gmail.com>
Subject: Re: [PATCH for-5.1 3/5] qom: Change
 object_get_canonical_path_component() not to malloc
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=liq3ea@gmail.com; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> =E4=BA=8E2020=E5=B9=B47=E6=9C=8815=E6=
=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=8812:08=E5=86=99=E9=81=93=EF=BC=9A
>
> object_get_canonical_path_component() returns a malloced copy of a
> property name on success, null on failure.
>
> 19 of its 25 callers immediately free the returned copy.
>
> Change object_get_canonical_path_component() to return the property
> name directly.  Since modifying the name would be wrong, adjust the
> return type to const char *.
>
> Drop the free from the 19 callers become simpler, add the g_strdup()
> to the other six.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Yes, I have seen more than once memory leak caused by this function.

Reviewed-by: Li Qiang <liq3ea@gmail.com>

> ---
>  include/qom/object.h       |  2 +-
>  backends/hostmem.c         |  2 +-
>  block/throttle-groups.c    |  2 +-
>  gdbstub.c                  |  2 +-
>  hw/arm/xlnx-zynqmp.c       |  6 ++----
>  hw/block/nvme.c            |  5 ++---
>  hw/core/machine-qmp-cmds.c |  2 +-
>  hw/core/machine.c          |  5 ++---
>  hw/mem/nvdimm.c            |  5 ++---
>  hw/mem/pc-dimm.c           |  5 ++---
>  hw/misc/ivshmem.c          |  5 ++---
>  hw/ppc/spapr_drc.c         |  3 +--
>  hw/virtio/virtio-crypto.c  |  5 ++---
>  hw/virtio/virtio-mem.c     |  6 ++----
>  hw/virtio/virtio-pmem.c    |  5 ++---
>  iothread.c                 |  9 ++++-----
>  net/net.c                  |  6 ++----
>  qom/object.c               |  7 +++----
>  qom/qom-hmp-cmds.c         | 11 ++++-------
>  scsi/pr-manager-helper.c   |  3 +--
>  scsi/pr-manager.c          |  2 +-
>  softmmu/memory.c           |  2 +-
>  hw/ppc/trace-events        |  2 +-
>  23 files changed, 41 insertions(+), 61 deletions(-)
>
> diff --git a/include/qom/object.h b/include/qom/object.h
> index 79c8f838b6..55d925d2c8 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -1462,7 +1462,7 @@ Object *object_get_internal_root(void);
>   * path is the path within the composition tree starting from the root.
>   * %NULL if the object doesn't have a parent (and thus a canonical path)=
.
>   */
> -char *object_get_canonical_path_component(const Object *obj);
> +const char *object_get_canonical_path_component(const Object *obj);
>
>  /**
>   * object_get_canonical_path:
> diff --git a/backends/hostmem.c b/backends/hostmem.c
> index c614f1bdc1..4bde00e8e7 100644
> --- a/backends/hostmem.c
> +++ b/backends/hostmem.c
> @@ -33,7 +33,7 @@ char *
>  host_memory_backend_get_name(HostMemoryBackend *backend)
>  {
>      if (!backend->use_canonical_path) {
> -        return object_get_canonical_path_component(OBJECT(backend));
> +        return g_strdup(object_get_canonical_path_component(OBJECT(backe=
nd)));
>      }
>
>      return object_get_canonical_path(OBJECT(backend));
> diff --git a/block/throttle-groups.c b/block/throttle-groups.c
> index 03a53c89ea..98fea7fd47 100644
> --- a/block/throttle-groups.c
> +++ b/block/throttle-groups.c
> @@ -771,7 +771,7 @@ static void throttle_group_obj_complete(UserCreatable=
 *obj, Error **errp)
>
>      /* set group name to object id if it exists */
>      if (!tg->name && tg->parent_obj.parent) {
> -        tg->name =3D object_get_canonical_path_component(OBJECT(obj));
> +        tg->name =3D g_strdup(object_get_canonical_path_component(OBJECT=
(obj)));
>      }
>      /* We must have a group name at this point */
>      assert(tg->name);
> diff --git a/gdbstub.c b/gdbstub.c
> index 6950fd243f..f3a318cd7f 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -2059,7 +2059,7 @@ static void handle_query_thread_extra(GdbCmdContext=
 *gdb_ctx, void *user_ctx)
>          /* Print the CPU model and name in multiprocess mode */
>          ObjectClass *oc =3D object_get_class(OBJECT(cpu));
>          const char *cpu_model =3D object_class_get_name(oc);
> -        g_autofree char *cpu_name =3D
> +        const char *cpu_name =3D
>              object_get_canonical_path_component(OBJECT(cpu));
>          g_string_printf(rs, "%s %s [%s]", cpu_model, cpu_name,
>                          cpu->halted ? "halted " : "running");
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 772cfa3771..e14323c991 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -190,7 +190,7 @@ static void xlnx_zynqmp_create_rpu(MachineState *ms, =
XlnxZynqMPState *s,
>      qdev_prop_set_uint32(DEVICE(&s->rpu_cluster), "cluster-id", 1);
>
>      for (i =3D 0; i < num_rpus; i++) {
> -        char *name;
> +        const char *name;
>
>          object_initialize_child(OBJECT(&s->rpu_cluster), "rpu-cpu[*]",
>                                  &s->rpu_cpu[i],
> @@ -204,7 +204,6 @@ static void xlnx_zynqmp_create_rpu(MachineState *ms, =
XlnxZynqMPState *s,
>          } else {
>              s->boot_cpu_ptr =3D &s->rpu_cpu[i];
>          }
> -        g_free(name);
>
>          object_property_set_bool(OBJECT(&s->rpu_cpu[i]), "reset-hivecs",=
 true,
>                                   &error_abort);
> @@ -341,7 +340,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Err=
or **errp)
>
>      /* Realize APUs before realizing the GIC. KVM requires this.  */
>      for (i =3D 0; i < num_apus; i++) {
> -        char *name;
> +        const char *name;
>
>          object_property_set_int(OBJECT(&s->apu_cpu[i]), "psci-conduit",
>                                  QEMU_PSCI_CONDUIT_SMC, &error_abort);
> @@ -354,7 +353,6 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Err=
or **errp)
>          } else {
>              s->boot_cpu_ptr =3D &s->apu_cpu[i];
>          }
> -        g_free(name);
>
>          object_property_set_bool(OBJECT(&s->apu_cpu[i]), "has_el3", s->s=
ecure,
>                                   NULL);
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 1aee042d4c..3426e17e65 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -1397,9 +1397,8 @@ static void nvme_check_constraints(NvmeCtrl *n, Err=
or **errp)
>
>      if (!n->params.cmb_size_mb && n->pmrdev) {
>          if (host_memory_backend_is_mapped(n->pmrdev)) {
> -            char *path =3D object_get_canonical_path_component(OBJECT(n-=
>pmrdev));
> -            error_setg(errp, "can't use already busy memdev: %s", path);
> -            g_free(path);
> +            error_setg(errp, "can't use already busy memdev: %s",
> +                       object_get_canonical_path_component(OBJECT(n->pmr=
dev)));
>              return;
>          }
>
> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> index 2c5da8413d..963088b798 100644
> --- a/hw/core/machine-qmp-cmds.c
> +++ b/hw/core/machine-qmp-cmds.c
> @@ -315,7 +315,7 @@ static int query_memdev(Object *obj, void *opaque)
>
>          m->value =3D g_malloc0(sizeof(*m->value));
>
> -        m->value->id =3D object_get_canonical_path_component(obj);
> +        m->value->id =3D g_strdup(object_get_canonical_path_component(ob=
j));
>          m->value->has_id =3D !!m->value->id;
>
>          m->value->size =3D object_property_get_uint(obj, "size",
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index eb267b828d..2f881d6d75 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1073,9 +1073,8 @@ MemoryRegion *machine_consume_memdev(MachineState *=
machine,
>      MemoryRegion *ret =3D host_memory_backend_get_memory(backend);
>
>      if (memory_region_is_mapped(ret)) {
> -        char *path =3D object_get_canonical_path_component(OBJECT(backen=
d));
> -        error_report("memory backend %s can't be used multiple times.", =
path);
> -        g_free(path);
> +        error_report("memory backend %s can't be used multiple times.",
> +                     object_get_canonical_path_component(OBJECT(backend)=
));
>          exit(EXIT_FAILURE);
>      }
>      host_memory_backend_set_mapped(backend, true);
> diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
> index d0d6e553cf..e1574bc07c 100644
> --- a/hw/mem/nvdimm.c
> +++ b/hw/mem/nvdimm.c
> @@ -137,13 +137,12 @@ static void nvdimm_prepare_memory_region(NVDIMMDevi=
ce *nvdimm, Error **errp)
>
>      if (size <=3D nvdimm->label_size || !pmem_size) {
>          HostMemoryBackend *hostmem =3D dimm->hostmem;
> -        char *path =3D object_get_canonical_path_component(OBJECT(hostme=
m));
>
>          error_setg(errp, "the size of memdev %s (0x%" PRIx64 ") is too "
>                     "small to contain nvdimm label (0x%" PRIx64 ") and "
>                     "aligned PMEM (0x%" PRIx64 ")",
> -                   path, memory_region_size(mr), nvdimm->label_size, ali=
gn);
> -        g_free(path);
> +                   object_get_canonical_path_component(OBJECT(hostmem)),
> +                   memory_region_size(mr), nvdimm->label_size, align);
>          return;
>      }
>
> diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
> index 9d3f0b9691..c30351070b 100644
> --- a/hw/mem/pc-dimm.c
> +++ b/hw/mem/pc-dimm.c
> @@ -179,9 +179,8 @@ static void pc_dimm_realize(DeviceState *dev, Error *=
*errp)
>          error_setg(errp, "'" PC_DIMM_MEMDEV_PROP "' property is not set"=
);
>          return;
>      } else if (host_memory_backend_is_mapped(dimm->hostmem)) {
> -        char *path =3D object_get_canonical_path_component(OBJECT(dimm->=
hostmem));
> -        error_setg(errp, "can't use already busy memdev: %s", path);
> -        g_free(path);
> +        error_setg(errp, "can't use already busy memdev: %s",
> +                   object_get_canonical_path_component(OBJECT(dimm->host=
mem)));
>          return;
>      }
>      if (((nb_numa_nodes > 0) && (dimm->node >=3D nb_numa_nodes)) ||
> diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
> index fc128b25e2..2b6882face 100644
> --- a/hw/misc/ivshmem.c
> +++ b/hw/misc/ivshmem.c
> @@ -1037,9 +1037,8 @@ static void ivshmem_plain_realize(PCIDevice *dev, E=
rror **errp)
>          error_setg(errp, "You must specify a 'memdev'");
>          return;
>      } else if (host_memory_backend_is_mapped(s->hostmem)) {
> -        char *path =3D object_get_canonical_path_component(OBJECT(s->hos=
tmem));
> -        error_setg(errp, "can't use already busy memdev: %s", path);
> -        g_free(path);
> +        error_setg(errp, "can't use already busy memdev: %s",
> +                   object_get_canonical_path_component(OBJECT(s->hostmem=
)));
>          return;
>      }
>
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index 43d12bc33a..fe998d8108 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -513,7 +513,7 @@ static void realize(DeviceState *d, Error **errp)
>      SpaprDrc *drc =3D SPAPR_DR_CONNECTOR(d);
>      Object *root_container;
>      gchar *link_name;
> -    char *child_name;
> +    const char *child_name;
>
>      trace_spapr_drc_realize(spapr_drc_index(drc));
>      /* NOTE: we do this as part of realize/unrealize due to the fact
> @@ -529,7 +529,6 @@ static void realize(DeviceState *d, Error **errp)
>      trace_spapr_drc_realize_child(spapr_drc_index(drc), child_name);
>      object_property_add_alias(root_container, link_name,
>                                drc->owner, child_name);
> -    g_free(child_name);
>      g_free(link_name);
>      vmstate_register(VMSTATE_IF(drc), spapr_drc_index(drc), &vmstate_spa=
pr_drc,
>                       drc);
> diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
> index bd9165c565..6da12e315f 100644
> --- a/hw/virtio/virtio-crypto.c
> +++ b/hw/virtio/virtio-crypto.c
> @@ -786,9 +786,8 @@ static void virtio_crypto_device_realize(DeviceState =
*dev, Error **errp)
>          error_setg(errp, "'cryptodev' parameter expects a valid object")=
;
>          return;
>      } else if (cryptodev_backend_is_used(vcrypto->cryptodev)) {
> -        char *path =3D object_get_canonical_path_component(OBJECT(vcrypt=
o->conf.cryptodev));
> -        error_setg(errp, "can't use already used cryptodev backend: %s",=
 path);
> -        g_free(path);
> +        error_setg(errp, "can't use already used cryptodev backend: %s",
> +                   object_get_canonical_path_component(OBJECT(vcrypto->c=
onf.cryptodev)));
>          return;
>      }
>
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index 65850530e7..c12e9f79b0 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -409,11 +409,9 @@ static void virtio_mem_device_realize(DeviceState *d=
ev, Error **errp)
>          error_setg(errp, "'%s' property is not set", VIRTIO_MEM_MEMDEV_P=
ROP);
>          return;
>      } else if (host_memory_backend_is_mapped(vmem->memdev)) {
> -        char *path =3D object_get_canonical_path_component(OBJECT(vmem->=
memdev));
> -
>          error_setg(errp, "'%s' property specifies a busy memdev: %s",
> -                   VIRTIO_MEM_MEMDEV_PROP, path);
> -        g_free(path);
> +                   VIRTIO_MEM_MEMDEV_PROP,
> +                   object_get_canonical_path_component(OBJECT(vmem->memd=
ev)));
>          return;
>      } else if (!memory_region_is_ram(&vmem->memdev->mr) ||
>          memory_region_is_rom(&vmem->memdev->mr) ||
> diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
> index c3374b2f3f..1e0c137497 100644
> --- a/hw/virtio/virtio-pmem.c
> +++ b/hw/virtio/virtio-pmem.c
> @@ -112,9 +112,8 @@ static void virtio_pmem_realize(DeviceState *dev, Err=
or **errp)
>      }
>
>      if (host_memory_backend_is_mapped(pmem->memdev)) {
> -        char *path =3D object_get_canonical_path_component(OBJECT(pmem->=
memdev));
> -        error_setg(errp, "can't use already busy memdev: %s", path);
> -        g_free(path);
> +        error_setg(errp, "can't use already busy memdev: %s",
> +                   object_get_canonical_path_component(OBJECT(pmem->memd=
ev)));
>          return;
>      }
>
> diff --git a/iothread.c b/iothread.c
> index 0598a6d20d..263ec6e5bc 100644
> --- a/iothread.c
> +++ b/iothread.c
> @@ -165,7 +165,7 @@ static void iothread_complete(UserCreatable *obj, Err=
or **errp)
>  {
>      Error *local_error =3D NULL;
>      IOThread *iothread =3D IOTHREAD(obj);
> -    char *name, *thread_name;
> +    char *thread_name;
>
>      iothread->stopping =3D false;
>      iothread->running =3D true;
> @@ -195,12 +195,11 @@ static void iothread_complete(UserCreatable *obj, E=
rror **errp)
>      /* This assumes we are called from a thread with useful CPU affinity=
 for us
>       * to inherit.
>       */
> -    name =3D object_get_canonical_path_component(OBJECT(obj));
> -    thread_name =3D g_strdup_printf("IO %s", name);
> +    thread_name =3D g_strdup_printf("IO %s",
> +                        object_get_canonical_path_component(OBJECT(obj))=
);
>      qemu_thread_create(&iothread->thread, thread_name, iothread_run,
>                         iothread, QEMU_THREAD_JOINABLE);
>      g_free(thread_name);
> -    g_free(name);
>
>      /* Wait for initialization to complete */
>      while (iothread->thread_id =3D=3D -1) {
> @@ -303,7 +302,7 @@ type_init(iothread_register_types)
>
>  char *iothread_get_id(IOThread *iothread)
>  {
> -    return object_get_canonical_path_component(OBJECT(iothread));
> +    return g_strdup(object_get_canonical_path_component(OBJECT(iothread)=
));
>  }
>
>  AioContext *iothread_get_aio_context(IOThread *iothread)
> diff --git a/net/net.c b/net/net.c
> index 7fddcebaa2..bbaedb3c7a 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1185,12 +1185,10 @@ void print_net_client(Monitor *mon, NetClientStat=
e *nc)
>          monitor_printf(mon, "filters:\n");
>      }
>      QTAILQ_FOREACH(nf, &nc->filters, next) {
> -        char *path =3D object_get_canonical_path_component(OBJECT(nf));
> -
> -        monitor_printf(mon, "  - %s: type=3D%s", path,
> +        monitor_printf(mon, "  - %s: type=3D%s",
> +                       object_get_canonical_path_component(OBJECT(nf)),
>                         object_get_typename(OBJECT(nf)));
>          netfilter_print_info(mon, nf);
> -        g_free(path);
>      }
>  }
>
> diff --git a/qom/object.c b/qom/object.c
> index 76f5f75239..00fdf89b3b 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -1931,7 +1931,7 @@ object_property_add_const_link(Object *obj, const c=
har *name,
>                                  NULL, OBJ_PROP_LINK_DIRECT);
>  }
>
> -char *object_get_canonical_path_component(const Object *obj)
> +const char *object_get_canonical_path_component(const Object *obj)
>  {
>      ObjectProperty *prop =3D NULL;
>      GHashTableIter iter;
> @@ -1947,7 +1947,7 @@ char *object_get_canonical_path_component(const Obj=
ect *obj)
>          }
>
>          if (prop->opaque =3D=3D obj) {
> -            return g_strdup(prop->name);
> +            return prop->name;
>          }
>      }
>
> @@ -1966,7 +1966,7 @@ char *object_get_canonical_path(const Object *obj)
>      }
>
>      do {
> -        char *component =3D object_get_canonical_path_component(obj);
> +        const char *component =3D object_get_canonical_path_component(ob=
j);
>
>          if (!component) {
>              /* A canonical path must be complete, so discard what was
> @@ -1978,7 +1978,6 @@ char *object_get_canonical_path(const Object *obj)
>
>          newpath =3D g_strdup_printf("/%s%s", component, path ? path : ""=
);
>          g_free(path);
> -        g_free(component);
>          path =3D newpath;
>          obj =3D obj->parent;
>      } while (obj !=3D root);
> diff --git a/qom/qom-hmp-cmds.c b/qom/qom-hmp-cmds.c
> index aaacadacca..4032c96089 100644
> --- a/qom/qom-hmp-cmds.c
> +++ b/qom/qom-hmp-cmds.c
> @@ -96,10 +96,8 @@ static void print_qom_composition(Monitor *mon, Object=
 *obj, int indent);
>
>  static int qom_composition_compare(const void *a, const void *b, void *i=
gnore)
>  {
> -    g_autofree char *ac =3D object_get_canonical_path_component(a);
> -    g_autofree char *bc =3D object_get_canonical_path_component(b);
> -
> -    return g_strcmp0(ac, bc);
> +    return g_strcmp0(object_get_canonical_path_component(a),
> +                     object_get_canonical_path_component(b));
>  }
>
>  static int insert_qom_composition_child(Object *obj, void *opaque)
> @@ -112,18 +110,17 @@ static int insert_qom_composition_child(Object *obj=
, void *opaque)
>
>  static void print_qom_composition(Monitor *mon, Object *obj, int indent)
>  {
> -    char *name;
> +    const char *name;
>      GQueue children;
>      Object *child;
>
>      if (obj =3D=3D object_get_root()) {
> -        name =3D g_strdup("");
> +        name =3D "";
>      } else {
>          name =3D object_get_canonical_path_component(obj);
>      }
>      monitor_printf(mon, "%*s/%s (%s)\n", indent, "", name,
>                     object_get_typename(obj));
> -    g_free(name);
>
>      g_queue_init(&children);
>      object_child_foreach(obj, insert_qom_composition_child, &children);
> diff --git a/scsi/pr-manager-helper.c b/scsi/pr-manager-helper.c
> index bf62cbec11..5acccfb4e3 100644
> --- a/scsi/pr-manager-helper.c
> +++ b/scsi/pr-manager-helper.c
> @@ -42,11 +42,10 @@ typedef struct PRManagerHelper {
>
>  static void pr_manager_send_status_changed_event(PRManagerHelper *pr_mgr=
)
>  {
> -    char *id =3D object_get_canonical_path_component(OBJECT(pr_mgr));
> +    const char *id =3D object_get_canonical_path_component(OBJECT(pr_mgr=
));
>
>      if (id) {
>          qapi_event_send_pr_manager_status_changed(id, !!pr_mgr->ioc);
> -        g_free(id);
>      }
>  }
>
> diff --git a/scsi/pr-manager.c b/scsi/pr-manager.c
> index 0c866e8698..32b9287e68 100644
> --- a/scsi/pr-manager.c
> +++ b/scsi/pr-manager.c
> @@ -128,7 +128,7 @@ static int query_one_pr_manager(Object *object, void =
*opaque)
>
>      elem =3D g_new0(PRManagerInfoList, 1);
>      info =3D g_new0(PRManagerInfo, 1);
> -    info->id =3D object_get_canonical_path_component(object);
> +    info->id =3D g_strdup(object_get_canonical_path_component(object));
>      info->connected =3D pr_manager_is_connected(pr_mgr);
>      elem->value =3D info;
>      elem->next =3D NULL;
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 9200b20130..af25987518 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1764,7 +1764,7 @@ const char *memory_region_name(const MemoryRegion *=
mr)
>  {
>      if (!mr->name) {
>          ((MemoryRegion *)mr)->name =3D
> -            object_get_canonical_path_component(OBJECT(mr));
> +            g_strdup(object_get_canonical_path_component(OBJECT(mr)));
>      }
>      return mr->name;
>  }
> diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
> index 9ea620f23c..7c0be4102e 100644
> --- a/hw/ppc/trace-events
> +++ b/hw/ppc/trace-events
> @@ -57,7 +57,7 @@ spapr_drc_detach(uint32_t index) "drc: 0x%"PRIx32
>  spapr_drc_awaiting_quiesce(uint32_t index) "drc: 0x%"PRIx32
>  spapr_drc_reset(uint32_t index) "drc: 0x%"PRIx32
>  spapr_drc_realize(uint32_t index) "drc: 0x%"PRIx32
> -spapr_drc_realize_child(uint32_t index, char *childname) "drc: 0x%"PRIx3=
2", child name: %s"
> +spapr_drc_realize_child(uint32_t index, const char *childname) "drc: 0x%=
"PRIx32", child name: %s"
>  spapr_drc_realize_complete(uint32_t index) "drc: 0x%"PRIx32
>  spapr_drc_unrealize(uint32_t index) "drc: 0x%"PRIx32
>
> --
> 2.26.2
>
>

