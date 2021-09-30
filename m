Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E638B41E297
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 22:19:48 +0200 (CEST)
Received: from localhost ([::1]:48316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mW2Wy-0005Ra-0t
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 16:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laine@redhat.com>) id 1mW2VB-0004SW-0f
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 16:17:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laine@redhat.com>) id 1mW2V5-0008Qz-MA
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 16:17:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633033067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k1fZaAwDIFXi8yK006o5SdqmzyCWk0szZlz/9guku5U=;
 b=KTOdTu0yMJhaAUxnuM7Yy4TyQmYDxTUZ0GLBlrS89dFInX5ud0WD5froU7TUiXOFsDhdnl
 Lr/uCCkD5fhWDgyJ/f+mcooBokv7Y3pWlO7j+MSlhJDM7EPBYU4lkvkbVYBc9rX7aQYfz2
 XNTvRYBAuzwftSLkbwsiFuQu3h6YQwk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-fRgPY6fBP6yJmQt9KkhcpA-1; Thu, 30 Sep 2021 16:17:47 -0400
X-MC-Unique: fRgPY6fBP6yJmQt9KkhcpA-1
Received: by mail-qv1-f69.google.com with SMTP id
 k20-20020a05621414f400b003824ecf0127so11873335qvw.0
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 13:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=k1fZaAwDIFXi8yK006o5SdqmzyCWk0szZlz/9guku5U=;
 b=klNpbaz3Wa6pMo6TGqMmL6dx4uezuAcVsJTxTNfYu19EuemTfFRAgAZVI1r+mykGDY
 I/htX5NSNjx3SU3hW41qK4DI1fUjH66h7P3MLfYaS61+7V/qlnDirW3Q3XSW9MnalJN3
 563XB6I/qIIuPICvTkxQQ9DfyOSx/ic6rW1SbpPrL5WWSj3cYrS2t/FIGjAnJYnsDGTA
 gqBoi+UymWa4Yel4TwnBESBZ/K5DmqzWMaj2OSdA8uMELPWfU7Bi3E5WTzPn9+3NVb7j
 wOeX6KIX2HnbmzpmfjpdPzq+722Go+I/mxQmE5fYTZXlQ2BZF2kgMsWWO9yK8ef/tnaZ
 FJ/A==
X-Gm-Message-State: AOAM530X5pVTu2DKFdt+0J+BnaKr2BuqGQuaPaAn4lPZqHBVoSdjI8tt
 aG3dSmWOPp2b7ojXipgvW0KqbiMoEmX4NuBC8IVAVxG4rEQ5bk8cFBNC0LR9ytKzYw72YSR2Lgw
 PgAqsm1If1X7Kt5RYc9w4DGdS3BQTgg/ipljOYrJZnWbKM5Yf1iR2eqtH3oZGmY4=
X-Received: by 2002:ac8:4e92:: with SMTP id 18mr8725957qtp.323.1633033065959; 
 Thu, 30 Sep 2021 13:17:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy4UNLXkFDxi+jz2PeWdQUvASsnGdQXLjbsXUW+0WIjDXsZCzhzNsCmtNsiCSC1a+1GGDDlA==
X-Received: by 2002:ac8:4e92:: with SMTP id 18mr8725902qtp.323.1633033065531; 
 Thu, 30 Sep 2021 13:17:45 -0700 (PDT)
Received: from ?IPV6:2600:8805:3a00:c:c074:dcdd:fd74:91d2?
 ([2600:8805:3a00:c:c074:dcdd:fd74:91d2])
 by smtp.gmail.com with ESMTPSA id p12sm1943079qkj.54.2021.09.30.13.17.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Sep 2021 13:17:45 -0700 (PDT)
Message-ID: <f1898bf0-dadb-4e2e-a45a-9087d2c63678@redhat.com>
Date: Thu, 30 Sep 2021 16:17:44 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] failover: allow to pause the VM during the migration
To: qemu-devel@nongnu.org
References: <20210930170926.1298118-1-lvivier@redhat.com>
From: Laine Stump <laine@redhat.com>
Organization: Red Hat
In-Reply-To: <20210930170926.1298118-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=laine@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=laine@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.127, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Libvirt <libvir-list@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jiri Denemark <jdenemar@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/30/21 1:09 PM, Laurent Vivier wrote:
> If we want to save a snapshot of a VM to a file, we used to follow the
> following steps:
> 
> 1- stop the VM:
>     (qemu) stop
> 
> 2- migrate the VM to a file:
>     (qemu) migrate "exec:cat > snapshot"
> 
> 3- resume the VM:
>     (qemu) cont
> 
> After that we can restore the snapshot with:
>    qemu-system-x86_64 ... -incoming "exec:cat snapshot"
>    (qemu) cont

This is the basics of what libvirt does for a snapshot, and steps 1+2 
are what it does for a "managedsave" (where it saves the snapshot to 
disk and then terminates the qemu process, for later re-animation).

In those cases, it seems like this new parameter could work for us - 
instead of explicitly pausing the guest prior to migrating it to disk, 
we would set this new parameter to on, then directly migrate-to-disk 
(relying on qemu to do the pause). Care will need to be taken to assure 
that error recovery behaves the same though.

There are a couple of cases when libvirt apparently *doesn't* pause the 
guest during the migrate-to-disk, both having to do with saving a 
coredump of the guest. Since I really have no idea of how 
common/important that is (or even if my assessment of the code is 
correct), I'm Cc'ing this patch to libvir-list to make sure it catches 
the attention of someone who knows the answers and implications.


> But when failover is configured, it doesn't work anymore.
> 
> As the failover needs to ask the guest OS to unplug the card
> the machine cannot be paused.
> 
> This patch introduces a new migration parameter, "pause-vm", that
> asks the migration to pause the VM during the migration startup
> phase after the the card is unplugged.
> 
> Once the migration is done, we only need to resume the VM with
> "cont" and the card is plugged back:
> 
> 1- set the parameter:
>     (qemu) migrate_set_parameter pause-vm on
> 
> 2- migrate the VM to a file:
>     (qemu) migrate "exec:cat > snapshot"
> 
>     The primary failover card (VFIO) is unplugged and the VM is paused.
> 
> 3- resume the VM:
>     (qemu) cont
> 
>     The VM restarts and the primary failover card is plugged back
> 
> The VM state sent in the migration stream is "paused", it means
> when the snapshot is loaded or if the stream is sent to a destination
> QEMU, the VM needs to be resumed manually.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>   qapi/migration.json            | 20 +++++++++++++++---
>   include/hw/virtio/virtio-net.h |  1 +
>   hw/net/virtio-net.c            | 33 ++++++++++++++++++++++++++++++
>   migration/migration.c          | 37 +++++++++++++++++++++++++++++++++-
>   monitor/hmp-cmds.c             |  8 ++++++++
>   5 files changed, 95 insertions(+), 4 deletions(-)
> 
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 88f07baedd06..86284d96ad2a 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -743,6 +743,10 @@
>   #                        block device name if there is one, and to their node name
>   #                        otherwise. (Since 5.2)
>   #
> +# @pause-vm:           Pause the virtual machine before doing the migration.
> +#                      This allows QEMU to unplug a card before doing the
> +#                      migration as it depends on the guest kernel. (since 6.2)
> +#
>   # Since: 2.4
>   ##
>   { 'enum': 'MigrationParameter',
> @@ -758,7 +762,7 @@
>              'xbzrle-cache-size', 'max-postcopy-bandwidth',
>              'max-cpu-throttle', 'multifd-compression',
>              'multifd-zlib-level' ,'multifd-zstd-level',
> -           'block-bitmap-mapping' ] }
> +           'block-bitmap-mapping', 'pause-vm' ] }
>   
>   ##
>   # @MigrateSetParameters:
> @@ -903,6 +907,10 @@
>   #                        block device name if there is one, and to their node name
>   #                        otherwise. (Since 5.2)
>   #
> +# @pause-vm:           Pause the virtual machine before doing the migration.
> +#                      This allows QEMU to unplug a card before doing the
> +#                      migration as it depends on the guest kernel. (since 6.2)
> +#
>   # Since: 2.4
>   ##
>   # TODO either fuse back into MigrationParameters, or make
> @@ -934,7 +942,8 @@
>               '*multifd-compression': 'MultiFDCompression',
>               '*multifd-zlib-level': 'uint8',
>               '*multifd-zstd-level': 'uint8',
> -            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
> +            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
> +            '*pause-vm': 'bool' } }
>   
>   ##
>   # @migrate-set-parameters:
> @@ -1099,6 +1108,10 @@
>   #                        block device name if there is one, and to their node name
>   #                        otherwise. (Since 5.2)
>   #
> +# @pause-vm:           Pause the virtual machine before doing the migration.
> +#                      This allows QEMU to unplug a card before doing the
> +#                      migration as it depends on the guest kernel. (since 6.2)
> +#
>   # Since: 2.4
>   ##
>   { 'struct': 'MigrationParameters',
> @@ -1128,7 +1141,8 @@
>               '*multifd-compression': 'MultiFDCompression',
>               '*multifd-zlib-level': 'uint8',
>               '*multifd-zstd-level': 'uint8',
> -            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
> +            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
> +            '*pause-vm': 'bool' } }
>   
>   ##
>   # @query-migrate-parameters:
> diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
> index 824a69c23f06..a6c186e28b45 100644
> --- a/include/hw/virtio/virtio-net.h
> +++ b/include/hw/virtio/virtio-net.h
> @@ -210,6 +210,7 @@ struct VirtIONet {
>       bool failover;
>       DeviceListener primary_listener;
>       Notifier migration_state;
> +    VMChangeStateEntry *vm_state;
>       VirtioNetRssData rss_data;
>       struct NetRxPkt *rx_pkt;
>       struct EBPFRSSContext ebpf_rss;
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index f205331dcf8c..c83364eac47b 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -39,6 +39,7 @@
>   #include "migration/misc.h"
>   #include "standard-headers/linux/ethtool.h"
>   #include "sysemu/sysemu.h"
> +#include "sysemu/runstate.h"
>   #include "trace.h"
>   #include "monitor/qdev.h"
>   #include "hw/pci/pci.h"
> @@ -3303,6 +3304,35 @@ static void virtio_net_migration_state_notifier(Notifier *notifier, void *data)
>       virtio_net_handle_migration_primary(n, s);
>   }
>   
> +static void virtio_net_failover_restart_cb(void *opaque, bool running,
> +                                           RunState state)
> +{
> +    DeviceState *dev;
> +    VirtIONet *n = opaque;
> +    Error *err = NULL;
> +    PCIDevice *pdev;
> +
> +    if (!running) {
> +        return;
> +    }
> +
> +    dev = failover_find_primary_device(n);
> +    if (!dev) {
> +        return;
> +    }
> +
> +    pdev = PCI_DEVICE(dev);
> +    if (!pdev->partially_hotplugged) {
> +        return;
> +    }
> +
> +    if (!failover_replug_primary(n, dev, &err)) {
> +        if (err) {
> +            error_report_err(err);
> +        }
> +    }
> +}
> +
>   static bool failover_hide_primary_device(DeviceListener *listener,
>                                            QemuOpts *device_opts)
>   {
> @@ -3360,6 +3390,8 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
>           device_listener_register(&n->primary_listener);
>           n->migration_state.notify = virtio_net_migration_state_notifier;
>           add_migration_state_change_notifier(&n->migration_state);
> +        n->vm_state = qemu_add_vm_change_state_handler(
> +                                             virtio_net_failover_restart_cb, n);
>           n->host_features |= (1ULL << VIRTIO_NET_F_STANDBY);
>       }
>   
> @@ -3508,6 +3540,7 @@ static void virtio_net_device_unrealize(DeviceState *dev)
>       if (n->failover) {
>           device_listener_unregister(&n->primary_listener);
>           remove_migration_state_change_notifier(&n->migration_state);
> +        qemu_del_vm_change_state_handler(n->vm_state);
>       }
>   
>       max_queues = n->multiqueue ? n->max_queues : 1;
> diff --git a/migration/migration.c b/migration/migration.c
> index bb909781b7f5..9c96986d4abf 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -901,6 +901,9 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
>                          s->parameters.block_bitmap_mapping);
>       }
>   
> +    params->has_pause_vm = true;
> +    params->pause_vm = s->parameters.pause_vm;
> +
>       return params;
>   }
>   
> @@ -1549,6 +1552,11 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
>           dest->has_block_bitmap_mapping = true;
>           dest->block_bitmap_mapping = params->block_bitmap_mapping;
>       }
> +
> +    if (params->has_pause_vm) {
> +        dest->has_pause_vm = true;
> +        dest->pause_vm = params->pause_vm;
> +    }
>   }
>   
>   static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
> @@ -1671,6 +1679,10 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
>               QAPI_CLONE(BitmapMigrationNodeAliasList,
>                          params->block_bitmap_mapping);
>       }
> +
> +    if (params->has_pause_vm) {
> +        s->parameters.pause_vm = params->pause_vm;
> +    }
>   }
>   
>   void qmp_migrate_set_parameters(MigrateSetParameters *params, Error **errp)
> @@ -1718,6 +1730,12 @@ void qmp_migrate_start_postcopy(Error **errp)
>                            " started");
>           return;
>       }
> +
> +    if (s->parameters.pause_vm) {
> +        error_setg(errp, "Postcopy cannot be started if pause-vm is on");
> +        return;
> +    }
> +
>       /*
>        * we don't error if migration has finished since that would be racy
>        * with issuing this command.
> @@ -3734,13 +3752,27 @@ static void qemu_savevm_wait_unplug(MigrationState *s, int old_state,
>                               "failure");
>               }
>           }
> -
>           migrate_set_state(&s->state, MIGRATION_STATUS_WAIT_UNPLUG, new_state);
>       } else {
>           migrate_set_state(&s->state, old_state, new_state);
>       }
>   }
>   
> +/* stop the VM before starting the migration but after device unplug */
> +static void pause_vm_after_unplug(MigrationState *s)
> +{
> +    if (s->parameters.pause_vm) {
> +        qemu_mutex_lock_iothread();
> +        qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, NULL);
> +        s->vm_was_running = runstate_is_running();
> +        if (vm_stop_force_state(RUN_STATE_PAUSED)) {
> +            migrate_set_state(&s->state, MIGRATION_STATUS_ACTIVE,
> +                                         MIGRATION_STATUS_FAILED);
> +        }
> +        qemu_mutex_unlock_iothread();
> +    }
> +}
> +
>   /*
>    * Master migration thread on the source VM.
>    * It drives the migration and pumps the data down the outgoing channel.
> @@ -3790,6 +3822,8 @@ static void *migration_thread(void *opaque)
>       qemu_savevm_wait_unplug(s, MIGRATION_STATUS_SETUP,
>                                  MIGRATION_STATUS_ACTIVE);
>   
> +    pause_vm_after_unplug(s);
> +
>       s->setup_time = qemu_clock_get_ms(QEMU_CLOCK_HOST) - setup_start;
>   
>       trace_migration_thread_setup_complete();
> @@ -4265,6 +4299,7 @@ static void migration_instance_init(Object *obj)
>       params->has_announce_max = true;
>       params->has_announce_rounds = true;
>       params->has_announce_step = true;
> +    params->has_pause_vm = true;
>   
>       qemu_sem_init(&ms->postcopy_pause_sem, 0);
>       qemu_sem_init(&ms->postcopy_pause_rp_sem, 0);
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index b5e71d9e6f52..71bc8c15335b 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -513,6 +513,10 @@ void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict)
>                   }
>               }
>           }
> +
> +        monitor_printf(mon, "%s: %s\n",
> +            MigrationParameter_str(MIGRATION_PARAMETER_PAUSE_VM),
> +            params->pause_vm ? "on" : "off");
>       }
>   
>       qapi_free_MigrationParameters(params);
> @@ -1399,6 +1403,10 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
>           error_setg(&err, "The block-bitmap-mapping parameter can only be set "
>                      "through QMP");
>           break;
> +    case MIGRATION_PARAMETER_PAUSE_VM:
> +        p->has_pause_vm = true;
> +        visit_type_bool(v, param, &p->pause_vm, &err);
> +        break;
>       default:
>           assert(0);
>       }
> 


