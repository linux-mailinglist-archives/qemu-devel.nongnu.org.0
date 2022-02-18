Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B384BB90C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 13:22:43 +0100 (CET)
Received: from localhost ([::1]:53134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL2Ha-0005xd-IO
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 07:22:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nL2Fk-0004Un-Oj
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 07:20:48 -0500
Received: from [2a00:1450:4864:20::433] (port=39701
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nL2Fh-0006Of-8h
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 07:20:48 -0500
Received: by mail-wr1-x433.google.com with SMTP id d27so14275248wrc.6
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 04:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lOdn7Cwcw2n8KEBsNMb2m5Ys0Fm+/1cWhYGb/Rx8AN0=;
 b=qbq+2aqq7f/SdTPDXleBom5yJT7ULvmkcwZZNAA+gl0XAl+EBGJDWII9aj8HzL+8ui
 DZJ+NuoJqNfz56I5Ew1tTU2Ld9zN7shjE7fgJLclV2jAjjes/VGrXmjkkqfbb353l8gD
 2cq9y6zXgBjPLSLYFJztYr76y5sxzQd8a7jGDom4VYldVOjhEtcinPj1Z3DndF/X5Pnz
 wKyjxy+ZKrsNxH3nxKis0e8hYl/TnEYRrNd+d4xkQfIuDQRyC9xfhiiU+j5nxzeeN8t2
 NNIW3FqE/qVwAlD36Lk5HeYwrMCLNOL95xtHtSQltqcWpOk3zw4l3Bj/WDEf3d4nRnvY
 jf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lOdn7Cwcw2n8KEBsNMb2m5Ys0Fm+/1cWhYGb/Rx8AN0=;
 b=UmtNEaSghcUEr2CnaThhfFzEDpfGr8ijJEZuT6NlE7ePj4NBNQFyPJ22bUnO5bf3rV
 FggKoY531jg37DLP5SK0YUXBLmecuq+zeJI8EkgeSIx2Qao3WC09iqzdqHgn39VFRn91
 AwSZK4T19qy2BJeOhHI4B6T6dsHCXdEGY+QAkgrkKvanqjYwPJsa5lBv6YLlhe4NIbVS
 zESeZmUmfZprGdauxotU/if4Oqy/mKwTUMVTFF+mY3hXNN4rs9Uz+QtNJNPJkcAwS75u
 J/J84M7tbzWbCewOumW6JfFr+GrWRB7WXKJWJsq+5f/lDhcDD7hPRihGvO/ySpXTpRar
 4fRg==
X-Gm-Message-State: AOAM532acujJpH5Z1MSKkVMq5r/0B5VNsOjCcP6GgF4fb7Xm3ZVwf9yK
 Sv+ZtAOTNAxw1UiSI/3NEkw=
X-Google-Smtp-Source: ABdhPJyS4VD1veVqvKRS3cqoLQt2vy9zi7LSHcuUmgDIoDt9q/SGVooKoIx61azkzX9+kYTRUc/Iyw==
X-Received: by 2002:adf:e549:0:b0:1e3:42a:1cfd with SMTP id
 z9-20020adfe549000000b001e3042a1cfdmr5755169wrm.79.1645186843538; 
 Fri, 18 Feb 2022 04:20:43 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id e9sm3995749wme.12.2022.02.18.04.20.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 04:20:43 -0800 (PST)
Message-ID: <a4d07579-d2c4-24bb-e99f-9fb1f61953af@redhat.com>
Date: Fri, 18 Feb 2022 13:20:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 17/19] vfio-user: register handlers to facilitate
 migration
Content-Language: en-US
To: Jagannathan Raman <jag.raman@oracle.com>, qemu-devel@nongnu.org
References: <cover.1645079934.git.jag.raman@oracle.com>
 <2f2921668f8b3d05bb1ce1dcc10e90e61cd20405.1645079934.git.jag.raman@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <2f2921668f8b3d05bb1ce1dcc10e90e61cd20405.1645079934.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, f4bug@amsat.org, quintela@redhat.com,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/22 08:49, Jagannathan Raman wrote:
> Store and load the device's state during migration. use libvfio-user's
> handlers for this purpose
> 
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>

Why does no one call clear_deferred_backend_init?

Paolo

> ---
>   include/block/block.h       |   1 +
>   include/migration/vmstate.h |   2 +
>   migration/savevm.h          |   2 +
>   block.c                     |   5 +
>   hw/remote/machine.c         |   7 +
>   hw/remote/vfio-user-obj.c   | 467 ++++++++++++++++++++++++++++++++++++
>   migration/savevm.c          |  89 +++++++
>   migration/vmstate.c         |  19 ++
>   8 files changed, 592 insertions(+)
> 
> diff --git a/include/block/block.h b/include/block/block.h
> index e1713ee306..02b89e0668 100644
> --- a/include/block/block.h
> +++ b/include/block/block.h
> @@ -495,6 +495,7 @@ int generated_co_wrapper bdrv_invalidate_cache(BlockDriverState *bs,
>                                                  Error **errp);
>   void bdrv_invalidate_cache_all(Error **errp);
>   int bdrv_inactivate_all(void);
> +int bdrv_inactivate(BlockDriverState *bs);
>   
>   /* Ensure contents are flushed to disk.  */
>   int generated_co_wrapper bdrv_flush(BlockDriverState *bs);
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index 017c03675c..68bea576ea 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -1165,6 +1165,8 @@ extern const VMStateInfo vmstate_info_qlist;
>   #define VMSTATE_END_OF_LIST()                                         \
>       {}
>   
> +uint64_t vmstate_vmsd_size(PCIDevice *pci_dev);
> +
>   int vmstate_load_state(QEMUFile *f, const VMStateDescription *vmsd,
>                          void *opaque, int version_id);
>   int vmstate_save_state(QEMUFile *f, const VMStateDescription *vmsd,
> diff --git a/migration/savevm.h b/migration/savevm.h
> index 6461342cb4..8007064ff2 100644
> --- a/migration/savevm.h
> +++ b/migration/savevm.h
> @@ -67,5 +67,7 @@ int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis);
>   int qemu_load_device_state(QEMUFile *f);
>   int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>           bool in_postcopy, bool inactivate_disks);
> +int qemu_remote_savevm(QEMUFile *f, DeviceState *dev);
> +int qemu_remote_loadvm(QEMUFile *f);
>   
>   #endif
> diff --git a/block.c b/block.c
> index b54d59d1fa..e90aaee30c 100644
> --- a/block.c
> +++ b/block.c
> @@ -6565,6 +6565,11 @@ static int bdrv_inactivate_recurse(BlockDriverState *bs)
>       return 0;
>   }
>   
> +int bdrv_inactivate(BlockDriverState *bs)
> +{
> +    return bdrv_inactivate_recurse(bs);
> +}
> +
>   int bdrv_inactivate_all(void)
>   {
>       BlockDriverState *bs = NULL;
> diff --git a/hw/remote/machine.c b/hw/remote/machine.c
> index a8b4a3aef3..31ef401e43 100644
> --- a/hw/remote/machine.c
> +++ b/hw/remote/machine.c
> @@ -24,6 +24,7 @@
>   #include "hw/qdev-core.h"
>   #include "hw/remote/iommu.h"
>   #include "hw/remote/vfio-user-obj.h"
> +#include "sysemu/sysemu.h"
>   
>   static void remote_machine_init(MachineState *machine)
>   {
> @@ -86,6 +87,11 @@ static void remote_machine_set_vfio_user(Object *obj, bool value, Error **errp)
>       s->vfio_user = value;
>   }
>   
> +static void remote_machine_instance_init(Object *obj)
> +{
> +    set_deferred_backend_init();
> +}
> +
>   static void remote_machine_class_init(ObjectClass *oc, void *data)
>   {
>       MachineClass *mc = MACHINE_CLASS(oc);
> @@ -105,6 +111,7 @@ static const TypeInfo remote_machine = {
>       .name = TYPE_REMOTE_MACHINE,
>       .parent = TYPE_MACHINE,
>       .instance_size = sizeof(RemoteMachineState),
> +    .instance_init = remote_machine_instance_init,
>       .class_init = remote_machine_class_init,
>       .interfaces = (InterfaceInfo[]) {
>           { TYPE_HOTPLUG_HANDLER },
> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
> index d79bab87f1..2304643003 100644
> --- a/hw/remote/vfio-user-obj.c
> +++ b/hw/remote/vfio-user-obj.c
> @@ -57,6 +57,13 @@
>   #include "hw/pci/msi.h"
>   #include "hw/pci/msix.h"
>   #include "hw/remote/vfio-user-obj.h"
> +#include "migration/qemu-file.h"
> +#include "migration/savevm.h"
> +#include "migration/vmstate.h"
> +#include "migration/global_state.h"
> +#include "block/block.h"
> +#include "sysemu/block-backend.h"
> +#include "net/net.h"
>   
>   #define TYPE_VFU_OBJECT "x-vfio-user-server"
>   OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
> @@ -108,12 +115,49 @@ struct VfuObject {
>       Error *unplug_blocker;
>   
>       int vfu_poll_fd;
> +
> +    /*
> +     * vfu_mig_buf holds the migration data. In the remote server, this
> +     * buffer replaces the role of an IO channel which links the source
> +     * and the destination.
> +     *
> +     * Whenever the client QEMU process initiates migration, the remote
> +     * server gets notified via libvfio-user callbacks. The remote server
> +     * sets up a QEMUFile object using this buffer as backend. The remote
> +     * server passes this object to its migration subsystem, which slurps
> +     * the VMSD of the device ('devid' above) referenced by this object
> +     * and stores the VMSD in this buffer.
> +     *
> +     * The client subsequetly asks the remote server for any data that
> +     * needs to be moved over to the destination via libvfio-user
> +     * library's vfu_migration_callbacks_t callbacks. The remote hands
> +     * over this buffer as data at this time.
> +     *
> +     * A reverse of this process happens at the destination.
> +     */
> +    uint8_t *vfu_mig_buf;
> +
> +    uint64_t vfu_mig_buf_size;
> +
> +    uint64_t vfu_mig_buf_pending;
> +
> +    uint64_t vfu_mig_data_written;
> +
> +    uint64_t vfu_mig_section_offset;
> +
> +    QEMUFile *vfu_mig_file;
> +
> +    vfu_migr_state_t vfu_state;
>   };
>   
>   static GHashTable *vfu_object_bdf_to_ctx_table;
>   
>   #define INT2VOIDP(i) (void *)(uintptr_t)(i)
>   
> +#define KB(x)    ((size_t) (x) << 10)
> +
> +#define VFU_OBJECT_MIG_WINDOW KB(64)
> +
>   static void vfu_object_init_ctx(VfuObject *o, Error **errp);
>   
>   static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
> @@ -163,6 +207,394 @@ static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
>       vfu_object_init_ctx(o, errp);
>   }
>   
> +/**
> + * Migration helper functions
> + *
> + * vfu_mig_buf_read & vfu_mig_buf_write are used by QEMU's migration
> + * subsystem - qemu_remote_loadvm & qemu_remote_savevm. loadvm/savevm
> + * call these functions via QEMUFileOps to load/save the VMSD of a
> + * device into vfu_mig_buf
> + *
> + */
> +static ssize_t vfu_mig_buf_read(void *opaque, uint8_t *buf, int64_t pos,
> +                                size_t size, Error **errp)
> +{
> +    VfuObject *o = opaque;
> +
> +    if (pos > o->vfu_mig_buf_size) {
> +        size = 0;
> +    } else if ((pos + size) > o->vfu_mig_buf_size) {
> +        size = o->vfu_mig_buf_size - pos;
> +    }
> +
> +    memcpy(buf, (o->vfu_mig_buf + pos), size);
> +
> +    return size;
> +}
> +
> +static ssize_t vfu_mig_buf_write(void *opaque, struct iovec *iov, int iovcnt,
> +                                 int64_t pos, Error **errp)
> +{
> +    ERRP_GUARD();
> +    VfuObject *o = opaque;
> +    uint64_t end = pos + iov_size(iov, iovcnt);
> +    int i;
> +
> +    if (o->vfu_mig_buf_pending) {
> +        error_setg(errp, "Migration is ongoing");
> +        return 0;
> +    }
> +
> +    if (end > o->vfu_mig_buf_size) {
> +        o->vfu_mig_buf = g_realloc(o->vfu_mig_buf, end);
> +    }
> +
> +    for (i = 0; i < iovcnt; i++) {
> +        memcpy((o->vfu_mig_buf + o->vfu_mig_buf_size), iov[i].iov_base,
> +               iov[i].iov_len);
> +        o->vfu_mig_buf_size += iov[i].iov_len;
> +    }
> +
> +    return iov_size(iov, iovcnt);
> +}
> +
> +static int vfu_mig_buf_shutdown(void *opaque, bool rd, bool wr, Error **errp)
> +{
> +    VfuObject *o = opaque;
> +
> +    o->vfu_mig_buf_size = 0;
> +
> +    g_free(o->vfu_mig_buf);
> +
> +    o->vfu_mig_buf = NULL;
> +
> +    o->vfu_mig_buf_pending = 0;
> +
> +    o->vfu_mig_data_written = 0;
> +
> +    o->vfu_mig_section_offset = 0;
> +
> +    return 0;
> +}
> +
> +static const QEMUFileOps vfu_mig_fops_save = {
> +    .writev_buffer  = vfu_mig_buf_write,
> +    .shut_down      = vfu_mig_buf_shutdown,
> +};
> +
> +static const QEMUFileOps vfu_mig_fops_load = {
> +    .get_buffer     = vfu_mig_buf_read,
> +    .shut_down      = vfu_mig_buf_shutdown,
> +};
> +
> +static BlockDriverState *vfu_object_find_bs_by_dev(DeviceState *dev)
> +{
> +    BlockBackend *blk = blk_by_dev(dev);
> +
> +    if (!blk) {
> +        return NULL;
> +    }
> +
> +    return blk_bs(blk);
> +}
> +
> +static int vfu_object_bdrv_invalidate_cache_by_dev(DeviceState *dev)
> +{
> +    BlockDriverState *bs = NULL;
> +    Error *local_err = NULL;
> +
> +    bs = vfu_object_find_bs_by_dev(dev);
> +    if (!bs) {
> +        return 0;
> +    }
> +
> +    bdrv_invalidate_cache(bs, &local_err);
> +    if (local_err) {
> +        error_report_err(local_err);
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
> +static int vfu_object_bdrv_inactivate_by_dev(DeviceState *dev)
> +{
> +    BlockDriverState *bs = NULL;
> +
> +    bs = vfu_object_find_bs_by_dev(dev);
> +    if (!bs) {
> +        return 0;
> +    }
> +
> +    return bdrv_inactivate(bs);
> +}
> +
> +static void vfu_object_start_stop_netdev(DeviceState *dev, bool start)
> +{
> +    NetClientState *nc = NULL;
> +    Error *local_err = NULL;
> +    char *netdev = NULL;
> +
> +    netdev = object_property_get_str(OBJECT(dev), "netdev", &local_err);
> +    if (local_err) {
> +        /**
> +         * object_property_get_str() sets Error if netdev property is
> +         * not found, not necessarily an error in the context of
> +         * this function
> +         */
> +        error_free(local_err);
> +        return;
> +    }
> +
> +    if (!netdev) {
> +        return;
> +    }
> +
> +    nc = qemu_find_netdev(netdev);
> +
> +    if (!nc) {
> +        return;
> +    }
> +
> +    if (!start) {
> +        qemu_flush_or_purge_queued_packets(nc, true);
> +
> +        if (nc->info && nc->info->cleanup) {
> +            nc->info->cleanup(nc);
> +        }
> +    } else if (nc->peer) {
> +        qemu_flush_or_purge_queued_packets(nc->peer, false);
> +    }
> +}
> +
> +static int vfu_object_start_devs(DeviceState *dev, void *opaque)
> +{
> +    int ret = vfu_object_bdrv_invalidate_cache_by_dev(dev);
> +
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    vfu_object_start_stop_netdev(dev, true);
> +
> +    return ret;
> +}
> +
> +static int vfu_object_stop_devs(DeviceState *dev, void *opaque)
> +{
> +    int ret = vfu_object_bdrv_inactivate_by_dev(dev);
> +
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    vfu_object_start_stop_netdev(dev, false);
> +
> +    return ret;
> +}
> +
> +/**
> + * handlers for vfu_migration_callbacks_t
> + *
> + * The libvfio-user library accesses these handlers to drive the migration
> + * at the remote end, and also to transport the data stored in vfu_mig_buf
> + *
> + */
> +static void vfu_mig_state_stop_and_copy(vfu_ctx_t *vfu_ctx)
> +{
> +    VfuObject *o = vfu_get_private(vfu_ctx);
> +    int ret;
> +
> +    if (!o->vfu_mig_file) {
> +        o->vfu_mig_file = qemu_fopen_ops(o, &vfu_mig_fops_save, false);
> +    }
> +
> +    ret = qemu_remote_savevm(o->vfu_mig_file, DEVICE(o->pci_dev));
> +    if (ret) {
> +        qemu_file_shutdown(o->vfu_mig_file);
> +        o->vfu_mig_file = NULL;
> +        return;
> +    }
> +
> +    qemu_fflush(o->vfu_mig_file);
> +}
> +
> +static void vfu_mig_state_running(vfu_ctx_t *vfu_ctx)
> +{
> +    VfuObject *o = vfu_get_private(vfu_ctx);
> +    int ret;
> +
> +    if (o->vfu_state != VFU_MIGR_STATE_RESUME) {
> +        goto run_ctx;
> +    }
> +
> +    if (!o->vfu_mig_file) {
> +        o->vfu_mig_file = qemu_fopen_ops(o, &vfu_mig_fops_load, false);
> +    }
> +
> +    ret = qemu_remote_loadvm(o->vfu_mig_file);
> +    if (ret) {
> +        VFU_OBJECT_ERROR(o, "vfu: failed to restore device state");
> +        return;
> +    }
> +
> +    qemu_file_shutdown(o->vfu_mig_file);
> +    o->vfu_mig_file = NULL;
> +
> +run_ctx:
> +    ret = qdev_walk_children(DEVICE(o->pci_dev), NULL, NULL,
> +                             vfu_object_start_devs,
> +                             NULL, NULL);
> +    if (ret) {
> +        VFU_OBJECT_ERROR(o, "vfu: failed to setup backends for %s",
> +                         o->device);
> +        return;
> +    }
> +}
> +
> +static void vfu_mig_state_stop(vfu_ctx_t *vfu_ctx)
> +{
> +    VfuObject *o = vfu_get_private(vfu_ctx);
> +    int ret;
> +
> +    ret = qdev_walk_children(DEVICE(o->pci_dev), NULL, NULL,
> +                             vfu_object_stop_devs,
> +                             NULL, NULL);
> +    if (ret) {
> +        VFU_OBJECT_ERROR(o, "vfu: failed to inactivate backends for %s",
> +                         o->device);
> +    }
> +}
> +
> +static int vfu_mig_transition(vfu_ctx_t *vfu_ctx, vfu_migr_state_t state)
> +{
> +    VfuObject *o = vfu_get_private(vfu_ctx);
> +
> +    if (o->vfu_state == state) {
> +        return 0;
> +    }
> +
> +    switch (state) {
> +    case VFU_MIGR_STATE_RESUME:
> +        break;
> +    case VFU_MIGR_STATE_STOP_AND_COPY:
> +        vfu_mig_state_stop_and_copy(vfu_ctx);
> +        break;
> +    case VFU_MIGR_STATE_STOP:
> +        vfu_mig_state_stop(vfu_ctx);
> +        break;
> +    case VFU_MIGR_STATE_PRE_COPY:
> +        break;
> +    case VFU_MIGR_STATE_RUNNING:
> +        vfu_mig_state_running(vfu_ctx);
> +        break;
> +    default:
> +        warn_report("vfu: Unknown migration state %d", state);
> +    }
> +
> +    o->vfu_state = state;
> +
> +    return 0;
> +}
> +
> +static uint64_t vfu_mig_get_pending_bytes(vfu_ctx_t *vfu_ctx)
> +{
> +    VfuObject *o = vfu_get_private(vfu_ctx);
> +    static bool mig_ongoing;
> +
> +    if (!mig_ongoing && !o->vfu_mig_buf_pending) {
> +        o->vfu_mig_buf_pending = o->vfu_mig_buf_size;
> +        mig_ongoing = true;
> +    }
> +
> +    if (mig_ongoing && !o->vfu_mig_buf_pending) {
> +        mig_ongoing = false;
> +    }
> +
> +    return o->vfu_mig_buf_pending;
> +}
> +
> +static int vfu_mig_prepare_data(vfu_ctx_t *vfu_ctx, uint64_t *offset,
> +                                uint64_t *size)
> +{
> +    VfuObject *o = vfu_get_private(vfu_ctx);
> +    uint64_t data_size = o->vfu_mig_buf_pending;
> +
> +    if (data_size > VFU_OBJECT_MIG_WINDOW) {
> +        data_size = VFU_OBJECT_MIG_WINDOW;
> +    }
> +
> +    o->vfu_mig_section_offset = o->vfu_mig_buf_size - o->vfu_mig_buf_pending;
> +
> +    o->vfu_mig_buf_pending -= data_size;
> +
> +    if (offset) {
> +        *offset = 0;
> +    }
> +
> +    if (size) {
> +        *size = data_size;
> +    }
> +
> +    return 0;
> +}
> +
> +static ssize_t vfu_mig_read_data(vfu_ctx_t *vfu_ctx, void *buf,
> +                                 uint64_t size, uint64_t offset)
> +{
> +    VfuObject *o = vfu_get_private(vfu_ctx);
> +    uint64_t read_offset = o->vfu_mig_section_offset + offset;
> +
> +    if (read_offset > o->vfu_mig_buf_size) {
> +        warn_report("vfu: buffer overflow - offset outside range");
> +        return -1;
> +    }
> +
> +    if ((read_offset + size) > o->vfu_mig_buf_size) {
> +        warn_report("vfu: buffer overflow - size outside range");
> +        size = o->vfu_mig_buf_size - read_offset;
> +    }
> +
> +    memcpy(buf, (o->vfu_mig_buf + read_offset), size);
> +
> +    return size;
> +}
> +
> +static ssize_t vfu_mig_write_data(vfu_ctx_t *vfu_ctx, void *data,
> +                                  uint64_t size, uint64_t offset)
> +{
> +    VfuObject *o = vfu_get_private(vfu_ctx);
> +    uint64_t end = o->vfu_mig_data_written + offset + size;
> +
> +    if (end > o->vfu_mig_buf_size) {
> +        o->vfu_mig_buf = g_realloc(o->vfu_mig_buf, end);
> +        o->vfu_mig_buf_size = end;
> +    }
> +
> +    memcpy((o->vfu_mig_buf + o->vfu_mig_data_written + offset), data, size);
> +
> +    return size;
> +}
> +
> +static int vfu_mig_data_written(vfu_ctx_t *vfu_ctx, uint64_t count)
> +{
> +    VfuObject *o = vfu_get_private(vfu_ctx);
> +
> +    o->vfu_mig_data_written += count;
> +
> +    return 0;
> +}
> +
> +static const vfu_migration_callbacks_t vfu_mig_cbs = {
> +    .version = VFU_MIGR_CALLBACKS_VERS,
> +    .transition = &vfu_mig_transition,
> +    .get_pending_bytes = &vfu_mig_get_pending_bytes,
> +    .prepare_data = &vfu_mig_prepare_data,
> +    .read_data = &vfu_mig_read_data,
> +    .data_written = &vfu_mig_data_written,
> +    .write_data = &vfu_mig_write_data,
> +};
> +
>   static void vfu_object_ctx_run(void *opaque)
>   {
>       VfuObject *o = opaque;
> @@ -550,6 +982,13 @@ void vfu_object_set_bus_irq(PCIBus *pci_bus)
>       pci_bus_irqs(pci_bus, vfu_object_set_irq, vfu_object_map_irq, NULL, 1);
>   }
>   
> +static bool vfu_object_migratable(VfuObject *o)
> +{
> +    DeviceClass *dc = DEVICE_GET_CLASS(o->pci_dev);
> +
> +    return dc->vmsd && !dc->vmsd->unmigratable;
> +}
> +
>   /*
>    * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
>    * properties. It also depends on devices instantiated in QEMU. These
> @@ -575,6 +1014,7 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
>       ERRP_GUARD();
>       DeviceState *dev = NULL;
>       vfu_pci_type_t pci_type = VFU_PCI_TYPE_CONVENTIONAL;
> +    uint64_t migr_regs_size, migr_size;
>       int ret;
>   
>       if (o->vfu_ctx || !o->socket || !o->device ||
> @@ -653,6 +1093,31 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
>           goto fail;
>       }
>   
> +    migr_regs_size = vfu_get_migr_register_area_size();
> +    migr_size = migr_regs_size + VFU_OBJECT_MIG_WINDOW;
> +
> +    ret = vfu_setup_region(o->vfu_ctx, VFU_PCI_DEV_MIGR_REGION_IDX,
> +                           migr_size, NULL,
> +                           VFU_REGION_FLAG_RW, NULL, 0, -1, 0);
> +    if (ret < 0) {
> +        error_setg(errp, "vfu: Failed to register migration BAR %s- %s",
> +                   o->device, strerror(errno));
> +        goto fail;
> +    }
> +
> +    if (!vfu_object_migratable(o)) {
> +        goto realize_ctx;
> +    }
> +
> +    ret = vfu_setup_device_migration_callbacks(o->vfu_ctx, &vfu_mig_cbs,
> +                                               migr_regs_size);
> +    if (ret < 0) {
> +        error_setg(errp, "vfu: Failed to setup migration %s- %s",
> +                   o->device, strerror(errno));
> +        goto fail;
> +    }
> +
> +realize_ctx:
>       ret = vfu_realize_ctx(o->vfu_ctx);
>       if (ret < 0) {
>           error_setg(errp, "vfu: Failed to realize device %s- %s",
> @@ -700,6 +1165,8 @@ static void vfu_object_init(Object *obj)
>       }
>   
>       o->vfu_poll_fd = -1;
> +
> +    o->vfu_state = VFU_MIGR_STATE_STOP;
>   }
>   
>   static void vfu_object_finalize(Object *obj)
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 1599b02fbc..2cc3b74287 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -66,6 +66,7 @@
>   #include "net/announce.h"
>   #include "qemu/yank.h"
>   #include "yank_functions.h"
> +#include "hw/qdev-core.h"
>   
>   const unsigned int postcopy_ram_discard_version;
>   
> @@ -1606,6 +1607,64 @@ static int qemu_savevm_state(QEMUFile *f, Error **errp)
>       return ret;
>   }
>   
> +static SaveStateEntry *find_se_from_dev(DeviceState *dev)
> +{
> +    SaveStateEntry *se;
> +
> +    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +        if (se->opaque == dev) {
> +            return se;
> +        }
> +    }
> +
> +    return NULL;
> +}
> +
> +static int qemu_remote_savevm_section_full(DeviceState *dev, void *opaque)
> +{
> +    QEMUFile *f = opaque;
> +    SaveStateEntry *se;
> +    int ret;
> +
> +    se = find_se_from_dev(dev);
> +    if (!se) {
> +        return 0;
> +    }
> +
> +    if (!se->vmsd || !vmstate_save_needed(se->vmsd, se->opaque) ||
> +        se->vmsd->unmigratable) {
> +        return 0;
> +    }
> +
> +    save_section_header(f, se, QEMU_VM_SECTION_FULL);
> +
> +    ret = vmstate_save(f, se, NULL);
> +    if (ret) {
> +        qemu_file_set_error(f, ret);
> +        return ret;
> +    }
> +
> +    save_section_footer(f, se);
> +
> +    return 0;
> +}
> +
> +int qemu_remote_savevm(QEMUFile *f, DeviceState *dev)
> +{
> +    int ret = qdev_walk_children(dev, NULL, NULL,
> +                                 qemu_remote_savevm_section_full,
> +                                 NULL, f);
> +
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    qemu_put_byte(f, QEMU_VM_EOF);
> +    qemu_fflush(f);
> +
> +    return 0;
> +}
> +
>   void qemu_savevm_live_state(QEMUFile *f)
>   {
>       /* save QEMU_VM_SECTION_END section */
> @@ -2447,6 +2506,36 @@ qemu_loadvm_section_start_full(QEMUFile *f, MigrationIncomingState *mis)
>       return 0;
>   }
>   
> +int qemu_remote_loadvm(QEMUFile *f)
> +{
> +    uint8_t section_type;
> +    int ret = 0;
> +
> +    while (true) {
> +        section_type = qemu_get_byte(f);
> +
> +        ret = qemu_file_get_error(f);
> +        if (ret) {
> +            break;
> +        }
> +
> +        switch (section_type) {
> +        case QEMU_VM_SECTION_FULL:
> +            ret = qemu_loadvm_section_start_full(f, NULL);
> +            if (ret < 0) {
> +                break;
> +            }
> +            break;
> +        case QEMU_VM_EOF:
> +            return ret;
> +        default:
> +            return -EINVAL;
> +        }
> +    }
> +
> +    return ret;
> +}
> +
>   static int
>   qemu_loadvm_section_part_end(QEMUFile *f, MigrationIncomingState *mis)
>   {
> diff --git a/migration/vmstate.c b/migration/vmstate.c
> index 05f87cdddc..83f8562792 100644
> --- a/migration/vmstate.c
> +++ b/migration/vmstate.c
> @@ -63,6 +63,25 @@ static int vmstate_size(void *opaque, const VMStateField *field)
>       return size;
>   }
>   
> +uint64_t vmstate_vmsd_size(PCIDevice *pci_dev)
> +{
> +    DeviceClass *dc = DEVICE_GET_CLASS(DEVICE(pci_dev));
> +    const VMStateField *field = NULL;
> +    uint64_t size = 0;
> +
> +    if (!dc->vmsd) {
> +        return 0;
> +    }
> +
> +    field = dc->vmsd->fields;
> +    while (field && field->name) {
> +        size += vmstate_size(pci_dev, field);
> +        field++;
> +    }
> +
> +    return size;
> +}
> +
>   static void vmstate_handle_alloc(void *ptr, const VMStateField *field,
>                                    void *opaque)
>   {


