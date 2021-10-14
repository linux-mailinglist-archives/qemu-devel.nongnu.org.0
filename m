Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 824F442DA32
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 15:21:55 +0200 (CEST)
Received: from localhost ([::1]:46874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb0gE-00027O-Kj
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 09:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mb0ed-0001LD-Kc
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 09:20:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mb0eb-0008S9-EQ
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 09:20:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634217612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7x1lUEZu9lFLNciqqOyAM+rJ84Il2CusAsXTyEd8K6U=;
 b=ILN3gZZxjLm4bm6nOP2SFt4UuCx4xQVJmRglqfCovJDRI6yw1Qw+tUtOl0kdQ6LuyAV9WP
 NDHjV8tulo5Z1/TyJeC3NHE0P2R73UfoM70RjiB6V9tYDBTeY0hMOkwIMcD8uhQEGPtRzC
 xyLC0EHCBQB52cgxU/e94/R93Zhl8bs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-NnXbYoJDNli7IzFrje-lWg-1; Thu, 14 Oct 2021 09:20:11 -0400
X-MC-Unique: NnXbYoJDNli7IzFrje-lWg-1
Received: by mail-wr1-f69.google.com with SMTP id
 d13-20020adfa34d000000b00160aa1cc5f1so4527908wrb.14
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 06:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7x1lUEZu9lFLNciqqOyAM+rJ84Il2CusAsXTyEd8K6U=;
 b=z3TpvxQjzZYvWF7J7waDxme379YXVuYYSys8yiFS4hvXJj/zfZ9nUzI4+jBixrXMOD
 hjrYN3vBHcVFz2d6hO864u1RcJhRUVokGZnxmPcQF0mieSDqPo3hcjagXZUT0ydtGA7r
 TLvL6wkjT2Gv1sGMCVMsyLRGltWNUyktObebb4kcoqOee3d+EWbd9SIUQV9rtOtZpn0X
 9hw1u0urfDgj/GKH1uW2yth23jRih3/ksK8wTpE8892Gj7uPz19UG0Fim3Df1L58miem
 Z5aLk9rWKsBKej2khmOf4u/CXJOunbSTFrgPviMSrNmmQ1rbQecaYeluQFIYvxqPIMoF
 697w==
X-Gm-Message-State: AOAM532s1yMOEyY7Vct+sKkd1Ab/mvdCqtnFpQvmUeuNDSZFkG0b/1x9
 WRtiqbbximOL5NmGpX547Zspo4AHWKjYyYYkeYLJwVfN+FukwPQJ0NhGsiN5DO24QaMOAaVlSmb
 SNUfcWZHk6EXnbbc=
X-Received: by 2002:a05:600c:3b99:: with SMTP id
 n25mr5970210wms.50.1634217610230; 
 Thu, 14 Oct 2021 06:20:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyH6lqWBkVbO3Uj4dXHu8vb2Guctaj0pLyF9JiQ9qFNidtCjSOewF05n3FLz3w9TOiik8tnXQ==
X-Received: by 2002:a05:600c:3b99:: with SMTP id
 n25mr5970167wms.50.1634217609846; 
 Thu, 14 Oct 2021 06:20:09 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id i13sm1526628wmq.41.2021.10.14.06.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 06:20:09 -0700 (PDT)
Date: Thu, 14 Oct 2021 14:20:07 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] failover: allow to pause the VM during the migration
Message-ID: <YWguh5+m84rldUzg@work-vm>
References: <20210930170926.1298118-1-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210930170926.1298118-1-lvivier@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Laurent Vivier (lvivier@redhat.com) wrote:
> If we want to save a snapshot of a VM to a file, we used to follow the
> following steps:
> 
> 1- stop the VM:
>    (qemu) stop
> 
> 2- migrate the VM to a file:
>    (qemu) migrate "exec:cat > snapshot"
> 
> 3- resume the VM:
>    (qemu) cont
> 
> After that we can restore the snapshot with:
>   qemu-system-x86_64 ... -incoming "exec:cat snapshot"
>   (qemu) cont
> 
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
>    (qemu) migrate_set_parameter pause-vm on
> 
> 2- migrate the VM to a file:
>    (qemu) migrate "exec:cat > snapshot"
> 
>    The primary failover card (VFIO) is unplugged and the VM is paused.
> 
> 3- resume the VM:
>    (qemu) cont
> 
>    The VM restarts and the primary failover card is plugged back
> 
> The VM state sent in the migration stream is "paused", it means
> when the snapshot is loaded or if the stream is sent to a destination
> QEMU, the VM needs to be resumed manually.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

A mix of comments:
  a) As a boolean, this should be a MigrationCapability rather than a
parameter
  b) We already have a pause-before-switchover capability for a pause
that happens later in the flow; so this would be something like
pause-after-unplug
  c) Is this really the right answer?  Could this be done a different
way by doing the unplugs using (a possibly new) qmp command - so
that you can explicitly trigger the unplug prior to the migration?

Dave

> ---
>  qapi/migration.json            | 20 +++++++++++++++---
>  include/hw/virtio/virtio-net.h |  1 +
>  hw/net/virtio-net.c            | 33 ++++++++++++++++++++++++++++++
>  migration/migration.c          | 37 +++++++++++++++++++++++++++++++++-
>  monitor/hmp-cmds.c             |  8 ++++++++
>  5 files changed, 95 insertions(+), 4 deletions(-)
> 
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 88f07baedd06..86284d96ad2a 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -743,6 +743,10 @@
>  #                        block device name if there is one, and to their node name
>  #                        otherwise. (Since 5.2)
>  #
> +# @pause-vm:           Pause the virtual machine before doing the migration.
> +#                      This allows QEMU to unplug a card before doing the
> +#                      migration as it depends on the guest kernel. (since 6.2)
> +#
>  # Since: 2.4
>  ##
>  { 'enum': 'MigrationParameter',
> @@ -758,7 +762,7 @@
>             'xbzrle-cache-size', 'max-postcopy-bandwidth',
>             'max-cpu-throttle', 'multifd-compression',
>             'multifd-zlib-level' ,'multifd-zstd-level',
> -           'block-bitmap-mapping' ] }
> +           'block-bitmap-mapping', 'pause-vm' ] }
>  
>  ##
>  # @MigrateSetParameters:
> @@ -903,6 +907,10 @@
>  #                        block device name if there is one, and to their node name
>  #                        otherwise. (Since 5.2)
>  #
> +# @pause-vm:           Pause the virtual machine before doing the migration.
> +#                      This allows QEMU to unplug a card before doing the
> +#                      migration as it depends on the guest kernel. (since 6.2)
> +#
>  # Since: 2.4
>  ##
>  # TODO either fuse back into MigrationParameters, or make
> @@ -934,7 +942,8 @@
>              '*multifd-compression': 'MultiFDCompression',
>              '*multifd-zlib-level': 'uint8',
>              '*multifd-zstd-level': 'uint8',
> -            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
> +            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
> +            '*pause-vm': 'bool' } }
>  
>  ##
>  # @migrate-set-parameters:
> @@ -1099,6 +1108,10 @@
>  #                        block device name if there is one, and to their node name
>  #                        otherwise. (Since 5.2)
>  #
> +# @pause-vm:           Pause the virtual machine before doing the migration.
> +#                      This allows QEMU to unplug a card before doing the
> +#                      migration as it depends on the guest kernel. (since 6.2)
> +#
>  # Since: 2.4
>  ##
>  { 'struct': 'MigrationParameters',
> @@ -1128,7 +1141,8 @@
>              '*multifd-compression': 'MultiFDCompression',
>              '*multifd-zlib-level': 'uint8',
>              '*multifd-zstd-level': 'uint8',
> -            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
> +            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
> +            '*pause-vm': 'bool' } }
>  
>  ##
>  # @query-migrate-parameters:
> diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
> index 824a69c23f06..a6c186e28b45 100644
> --- a/include/hw/virtio/virtio-net.h
> +++ b/include/hw/virtio/virtio-net.h
> @@ -210,6 +210,7 @@ struct VirtIONet {
>      bool failover;
>      DeviceListener primary_listener;
>      Notifier migration_state;
> +    VMChangeStateEntry *vm_state;
>      VirtioNetRssData rss_data;
>      struct NetRxPkt *rx_pkt;
>      struct EBPFRSSContext ebpf_rss;
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index f205331dcf8c..c83364eac47b 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -39,6 +39,7 @@
>  #include "migration/misc.h"
>  #include "standard-headers/linux/ethtool.h"
>  #include "sysemu/sysemu.h"
> +#include "sysemu/runstate.h"
>  #include "trace.h"
>  #include "monitor/qdev.h"
>  #include "hw/pci/pci.h"
> @@ -3303,6 +3304,35 @@ static void virtio_net_migration_state_notifier(Notifier *notifier, void *data)
>      virtio_net_handle_migration_primary(n, s);
>  }
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
>  static bool failover_hide_primary_device(DeviceListener *listener,
>                                           QemuOpts *device_opts)
>  {
> @@ -3360,6 +3390,8 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
>          device_listener_register(&n->primary_listener);
>          n->migration_state.notify = virtio_net_migration_state_notifier;
>          add_migration_state_change_notifier(&n->migration_state);
> +        n->vm_state = qemu_add_vm_change_state_handler(
> +                                             virtio_net_failover_restart_cb, n);
>          n->host_features |= (1ULL << VIRTIO_NET_F_STANDBY);
>      }
>  
> @@ -3508,6 +3540,7 @@ static void virtio_net_device_unrealize(DeviceState *dev)
>      if (n->failover) {
>          device_listener_unregister(&n->primary_listener);
>          remove_migration_state_change_notifier(&n->migration_state);
> +        qemu_del_vm_change_state_handler(n->vm_state);
>      }
>  
>      max_queues = n->multiqueue ? n->max_queues : 1;
> diff --git a/migration/migration.c b/migration/migration.c
> index bb909781b7f5..9c96986d4abf 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -901,6 +901,9 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
>                         s->parameters.block_bitmap_mapping);
>      }
>  
> +    params->has_pause_vm = true;
> +    params->pause_vm = s->parameters.pause_vm;
> +
>      return params;
>  }
>  
> @@ -1549,6 +1552,11 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
>          dest->has_block_bitmap_mapping = true;
>          dest->block_bitmap_mapping = params->block_bitmap_mapping;
>      }
> +
> +    if (params->has_pause_vm) {
> +        dest->has_pause_vm = true;
> +        dest->pause_vm = params->pause_vm;
> +    }
>  }
>  
>  static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
> @@ -1671,6 +1679,10 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
>              QAPI_CLONE(BitmapMigrationNodeAliasList,
>                         params->block_bitmap_mapping);
>      }
> +
> +    if (params->has_pause_vm) {
> +        s->parameters.pause_vm = params->pause_vm;
> +    }
>  }
>  
>  void qmp_migrate_set_parameters(MigrateSetParameters *params, Error **errp)
> @@ -1718,6 +1730,12 @@ void qmp_migrate_start_postcopy(Error **errp)
>                           " started");
>          return;
>      }
> +
> +    if (s->parameters.pause_vm) {
> +        error_setg(errp, "Postcopy cannot be started if pause-vm is on");
> +        return;
> +    }
> +
>      /*
>       * we don't error if migration has finished since that would be racy
>       * with issuing this command.
> @@ -3734,13 +3752,27 @@ static void qemu_savevm_wait_unplug(MigrationState *s, int old_state,
>                              "failure");
>              }
>          }
> -
>          migrate_set_state(&s->state, MIGRATION_STATUS_WAIT_UNPLUG, new_state);
>      } else {
>          migrate_set_state(&s->state, old_state, new_state);
>      }
>  }
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
>  /*
>   * Master migration thread on the source VM.
>   * It drives the migration and pumps the data down the outgoing channel.
> @@ -3790,6 +3822,8 @@ static void *migration_thread(void *opaque)
>      qemu_savevm_wait_unplug(s, MIGRATION_STATUS_SETUP,
>                                 MIGRATION_STATUS_ACTIVE);
>  
> +    pause_vm_after_unplug(s);
> +
>      s->setup_time = qemu_clock_get_ms(QEMU_CLOCK_HOST) - setup_start;
>  
>      trace_migration_thread_setup_complete();
> @@ -4265,6 +4299,7 @@ static void migration_instance_init(Object *obj)
>      params->has_announce_max = true;
>      params->has_announce_rounds = true;
>      params->has_announce_step = true;
> +    params->has_pause_vm = true;
>  
>      qemu_sem_init(&ms->postcopy_pause_sem, 0);
>      qemu_sem_init(&ms->postcopy_pause_rp_sem, 0);
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index b5e71d9e6f52..71bc8c15335b 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -513,6 +513,10 @@ void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict)
>                  }
>              }
>          }
> +
> +        monitor_printf(mon, "%s: %s\n",
> +            MigrationParameter_str(MIGRATION_PARAMETER_PAUSE_VM),
> +            params->pause_vm ? "on" : "off");
>      }
>  
>      qapi_free_MigrationParameters(params);
> @@ -1399,6 +1403,10 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
>          error_setg(&err, "The block-bitmap-mapping parameter can only be set "
>                     "through QMP");
>          break;
> +    case MIGRATION_PARAMETER_PAUSE_VM:
> +        p->has_pause_vm = true;
> +        visit_type_bool(v, param, &p->pause_vm, &err);
> +        break;
>      default:
>          assert(0);
>      }
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


