Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F1A6A5CF6
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 17:20:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX2gm-0001GZ-C2; Tue, 28 Feb 2023 11:18:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pX2gk-0001GM-O8
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 11:18:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pX2gf-0002We-QL
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 11:18:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677601124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Buu/YMMHJhbJ4npt5EYYrVE6yXpdUJnkqyduBqmEpRQ=;
 b=YPyN+0FdoOspnOAJjxUOAc2fKeZ2U3rSTOdwPZXB60b6UBj1yS1F0ulJOODl4a75XX9Ab6
 2sTcL02T7NpVGv5O6Kkg2PYdMT/1sOEpO4DWG+hEEqyDY9Cu+sjR7FYKqOyD/QapgbT3VX
 rRNCLasAh9m50B0IwyjOkwxwA0rlG1E=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-211-tYhfn-FEMveVyoG64y0hFw-1; Tue, 28 Feb 2023 11:18:41 -0500
X-MC-Unique: tYhfn-FEMveVyoG64y0hFw-1
Received: by mail-qk1-f197.google.com with SMTP id
 s21-20020a05620a0bd500b0074234f33f24so6217388qki.3
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 08:18:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Buu/YMMHJhbJ4npt5EYYrVE6yXpdUJnkqyduBqmEpRQ=;
 b=Sca5xW8p6fzwTqlIIl9zZMbJWaMASgFAQTs/aZ4qMijI4fHkiLmjCAZKRhR3ATTOYI
 ojsTAlZ85Wzbt+6ZWk7eYqDC9XEqTz4vDtkY0Kmvh7xmwp0mIIuEbc+ZrBamuck++bE0
 CL2a9GaZYq26aGUlgf8SKz1rrsmRQhW43jduoY0wHVJS2U1Q+NTNYOTQE5xK9SuxXosx
 akRhY2EdLbsnuLgNaQdtj5pU63tH66AK1ZIycvFzFXftK2t4bY/bZQFLTkx7f9fsHeZJ
 1WXS9G/OalEV9/69CPyBSdQlV+mBxWaetNOv2iQCt5EV/WS2Ewi5f5L1MGebq6k8kLwf
 +Rfg==
X-Gm-Message-State: AO0yUKVN3HHSnK7Ce+CmOQMneBEnARX4K8wtysrkcwhoFryIe9jj56rB
 pdnWAsrzChKHP9rN8JIi1IpcGcmBrEW/HUGW4pFnxXWeDvqcAxQaMikZzKNrgMh31MKISna+DnN
 LQZsa4jXA4ZN1LlA=
X-Received: by 2002:a05:6214:20c1:b0:56e:b1c8:381b with SMTP id
 1-20020a05621420c100b0056eb1c8381bmr7031625qve.31.1677601114379; 
 Tue, 28 Feb 2023 08:18:34 -0800 (PST)
X-Google-Smtp-Source: AK7set8EbX1euUqPxLKShL3e3fDIleDpEqraQHYmbSTL94SGe/tupf3mtUWoV5IuPURwzlzyccob8g==
X-Received: by 2002:a05:6214:20c1:b0:56e:b1c8:381b with SMTP id
 1-20020a05621420c100b0056eb1c8381bmr7031504qve.31.1677601113559; 
 Tue, 28 Feb 2023 08:18:33 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 f67-20020a37d246000000b006f9ddaaf01esm364768qkj.102.2023.02.28.08.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 08:18:32 -0800 (PST)
Date: Tue, 28 Feb 2023 17:18:28 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S . Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>, =?UTF-8?B?TWFy?=
 =?UTF-8?B?Yy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>, "Daniel P.
 =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, Philippe =?UTF-8?B?TWF0?=
 =?UTF-8?B?aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Eric Blake
 <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, David
 Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH][RESEND v3 3/3] Add a Hyper-V Dynamic Memory Protocol
 driver (hv-balloon)
Message-ID: <20230228171828.5f610ea4@imammedo.users.ipa.redhat.com>
In-Reply-To: <4c4fe768b5457f8e6c17dcea7656cbe017c9a4df.1677274611.git.maciej.szmigiero@oracle.com>
References: <cover.1677274611.git.maciej.szmigiero@oracle.com>
 <4c4fe768b5457f8e6c17dcea7656cbe017c9a4df.1677274611.git.maciej.szmigiero@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Fri, 24 Feb 2023 22:41:16 +0100
"Maciej S. Szmigiero" <mail@maciej.szmigiero.name> wrote:

> From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
> 
> This driver is like virtio-balloon on steroids: it allows both changing the
> guest memory allocation via ballooning and inserting extra RAM into it by
> adding required memory backends and providing them to the driver.


this sounds pretty much like what virtio-mem does, modulo used protocol.
Would it be too crazy ask to reuse virtio-mem by teaching it new protocol
and avoid adding new device with all mgmt hurdles that virtio-mem has
already solved?


> One of advantages of these over ACPI-based PC DIMM hotplug is that such
> memory can be hotplugged in much smaller granularity because the ACPI DIMM
> slot limit does not apply.
> 
> Hot-adding additional memory is done by creating a new memory backend (for
> example by executing HMP command
> "object_add memory-backend-ram,id=mem1,size=4G"), then executing a new
> "hv-balloon-add-memory" QMP command, providing the id of that memory
> backend as the "id" parameter.
> 
> In contrast with ACPI DIMM hotplug where one can only request to unplug a
> whole DIMM stick this driver allows removing memory from guest in single
> page (4k) units via ballooning.
> 
> After a VM reboot each previously hot-added memory backend gets released.
> A "HV_BALLOON_MEMORY_BACKEND_UNUSED" QMP event is emitted in this case so
> the software controlling QEMU knows that it either needs to delete that
> memory backend (if no longer needed) or re-insert it.
> 
> In the future, the guest boot memory size might be changed on reboot
> instead, taking into account the effective size that VM had before that
> reboot (much like Hyper-V does).
> 
> For performance reasons, the guest-released memory is tracked in a few
> range trees, as a series of (start, count) ranges.
> Each time a new page range is inserted into such tree its neighbors are
> checked as candidates for possible merging with it.
> 
> Besides performance reasons, the Dynamic Memory protocol itself uses page
> ranges as the data structure in its messages, so relevant pages need to be
> merged into such ranges anyway.
> 
> One has to be careful when tracking the guest-released pages, since the
> guest can maliciously report returning pages outside its current address
> space, which later clash with the address range of newly added memory.
> Similarly, the guest can report freeing the same page twice.
> 
> The above design results in much better ballooning performance than when
> using virtio-balloon with the same guest: 230 GB / minute with this driver
> versus 70 GB / minute with virtio-balloon.
> 
> During a ballooning operation most of time is spent waiting for the guest
> to come up with newly freed page ranges, processing the received ranges on
> the host side (in QEMU and KVM) is nearly instantaneous.
> 
> The unballoon operation is also pretty much instantaneous:
> thanks to the merging of the ballooned out page ranges 200 GB of memory can
> be returned to the guest in about 1 second.
> With virtio-balloon this operation takes about 2.5 minutes.
> 
> These tests were done against a Windows Server 2019 guest running on a
> Xeon E5-2699, after dirtying the whole memory inside guest before each
> balloon operation.
> 
> Using a range tree instead of a bitmap to track the removed memory also
> means that the solution scales well with the guest size: even a 1 TB range
> takes just few bytes of memory.
> 
> Since the required GTree operations aren't present in every Glib version
> a check for them was added to "configure" script, together with new
> "--enable-hv-balloon" and "--disable-hv-balloon" arguments.
> If these GTree operations are missing in the system's Glib version this
> driver will be skipped during QEMU build.
> 
> An optional "status-report=on" device parameter requests memory status
> events from the guest (typically sent every second), which allow the host
> to learn both the guest memory available and the guest memory in use
> counts.
> They are emitted externally as "HV_BALLOON_STATUS_REPORT" QMP events.
> 
> The driver is named hv-balloon since the Linux kernel client driver for
> the Dynamic Memory Protocol is named as such and to follow the naming
> pattern established by the virtio-balloon driver.
> The whole protocol runs over Hyper-V VMBus.
> 
> The driver was tested against Windows Server 2012 R2, Windows Server 2016
> and Windows Server 2016 guests and obeys the guest alignment requirements
> reported to the host via DM_CAPABILITIES_REPORT message.
> 
> Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> ---
>  Kconfig.host           |    3 +
>  configure              |   36 +
>  hw/hyperv/Kconfig      |    5 +
>  hw/hyperv/hv-balloon.c | 2185 ++++++++++++++++++++++++++++++++++++++++
>  hw/hyperv/meson.build  |    1 +
>  hw/hyperv/trace-events |   16 +
>  meson.build            |    4 +-
>  qapi/machine.json      |   68 ++
>  8 files changed, 2317 insertions(+), 1 deletion(-)
>  create mode 100644 hw/hyperv/hv-balloon.c
> 
> diff --git a/Kconfig.host b/Kconfig.host
> index d763d89269..2ee71578f3 100644
> --- a/Kconfig.host
> +++ b/Kconfig.host
> @@ -46,3 +46,6 @@ config FUZZ
>  config VFIO_USER_SERVER_ALLOWED
>      bool
>      imply VFIO_USER_SERVER
> +
> +config HV_BALLOON_POSSIBLE
> +    bool
> diff --git a/configure b/configure
> index cf6db3d551..b534955f58 100755
> --- a/configure
> +++ b/configure
> @@ -283,6 +283,7 @@ bsd_user=""
>  pie=""
>  coroutine=""
>  plugins="$default_feature"
> +hv_balloon="$default_feature"
>  meson=""
>  ninja=""
>  bindir="bin"
> @@ -866,6 +867,10 @@ for opt do
>    ;;
>    --disable-vfio-user-server) vfio_user_server="disabled"
>    ;;
> +  --enable-hv-balloon) hv_balloon=yes
> +  ;;
> +  --disable-hv-balloon) hv_balloon=no
> +  ;;
>    # everything else has the same name in configure and meson
>    --*) meson_option_parse "$opt" "$optarg"
>    ;;
> @@ -1019,6 +1024,7 @@ cat << EOF
>    debug-info      debugging information
>    safe-stack      SafeStack Stack Smash Protection. Depends on
>                    clang/llvm and requires coroutine backend ucontext.
> +  hv-balloon      hv-balloon driver where supported (requires Glib 2.68+ GTree API)
>  
>  NOTE: The object files are built at the place where configure is launched
>  EOF
> @@ -1740,6 +1746,32 @@ EOF
>    fi
>  fi
>  
> +##########################################
> +# check for hv-balloon
> +
> +if test "$hv_balloon" != "no"; then
> +	cat > $TMPC << EOF
> +#include <string.h>
> +#include <gmodule.h>
> +int main(void) {
> +    GTree *tree;
> +
> +    tree = g_tree_new((GCompareFunc)strcmp);
> +    (void)g_tree_node_first(tree);
> +    g_tree_destroy(tree);
> +    return 0;
> +}
> +EOF
> +	if compile_prog "$glib_cflags" "$glib_libs" ; then
> +		hv_balloon=yes
> +	else
> +		if test "$hv_balloon" = "yes" ; then
> +			feature_not_found "hv-balloon" "Update Glib"
> +		fi
> +		hv_balloon="no"
> +	fi
> +fi
> +
>  ##########################################
>  # functions to probe cross compilers
>  
> @@ -2336,6 +2368,10 @@ if test "$have_tsan" = "yes" && test "$have_tsan_iface_fiber" = "yes" ; then
>      echo "CONFIG_TSAN=y" >> $config_host_mak
>  fi
>  
> +if test "$hv_balloon" = "yes" ; then
> +  echo "CONFIG_HV_BALLOON_POSSIBLE=y" >> $config_host_mak
> +fi
> +
>  if test "$plugins" = "yes" ; then
>      echo "CONFIG_PLUGIN=y" >> $config_host_mak
>  fi
> diff --git a/hw/hyperv/Kconfig b/hw/hyperv/Kconfig
> index fcf65903bd..8f8be1bcce 100644
> --- a/hw/hyperv/Kconfig
> +++ b/hw/hyperv/Kconfig
> @@ -16,3 +16,8 @@ config SYNDBG
>      bool
>      default y
>      depends on VMBUS
> +
> +config HV_BALLOON
> +    bool
> +    default y
> +    depends on HV_BALLOON_POSSIBLE && VMBUS && HAPVDIMM
> diff --git a/hw/hyperv/hv-balloon.c b/hw/hyperv/hv-balloon.c
> new file mode 100644
> index 0000000000..b11f005189
> --- /dev/null
> +++ b/hw/hyperv/hv-balloon.c
> @@ -0,0 +1,2185 @@
> +/*
> + * QEMU Hyper-V Dynamic Memory Protocol driver
> + *
> + * Copyright (C) 2020-2023 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "exec/address-spaces.h"
> +#include "exec/cpu-common.h"
> +#include "exec/memory.h"
> +#include "exec/ramblock.h"
> +#include "hw/boards.h"
> +#include "hw/hyperv/dynmem-proto.h"
> +#include "hw/hyperv/vmbus.h"
> +#include "hw/mem/hapvdimm.h"
> +#include "hw/mem/pc-dimm.h"
> +#include "hw/qdev-core.h"
> +#include "hw/qdev-properties.h"
> +#include "monitor/qdev.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-commands-machine.h"
> +#include "qapi/qapi-events-machine.h"
> +#include "qapi/qmp/qdict.h"
> +#include "qemu/error-report.h"
> +#include "qemu/module.h"
> +#include "qemu/units.h"
> +#include "qemu/timer.h"
> +#include "sysemu/balloon.h"
> +#include "sysemu/reset.h"
> +#include "trace.h"
> +
> +/*
> + * temporarily avoid warnings about enhanced GTree API usage requiring a
> + * too recent Glib version until GLIB_VERSION_MAX_ALLOWED finally reaches
> + * the Glib version with this API
> + */
> +#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
> +
> +#define TYPE_HV_BALLOON "hv-balloon"
> +#define HV_BALLOON_GUID "525074DC-8985-46e2-8057-A307DC18A502"
> +#define HV_BALLOON_PFN_SHIFT 12
> +#define HV_BALLOON_PAGE_SIZE (1 << HV_BALLOON_PFN_SHIFT)
> +
> +/*
> + * Some Windows versions (at least Server 2019) will crash with various
> + * error codes when receiving DM protocol requests (at least
> + * DM_MEM_HOT_ADD_REQUEST) immediately after boot.
> + *
> + * It looks like Hyper-V from Server 2016 uses a 50-second after-boot
> + * delay, probably to workaround this issue, so we'll use this value, too.
> + */
> +#define HV_BALLOON_POST_INIT_WAIT (50 * 1000)
> +
> +#define HV_BALLOON_HA_CHUNK_SIZE (2 * GiB)
> +#define HV_BALLOON_HA_CHUNK_PAGES (HV_BALLOON_HA_CHUNK_SIZE / HV_BALLOON_PAGE_SIZE)
> +
> +#define HV_BALLOON_HR_CHUNK_PAGES 585728
> +/*
> + *                                ^ that's the maximum number of pages
> + * that Windows returns in one hot remove response
> + *
> + * If the number requested is too high Windows will no longer honor
> + * these requests
> + */
> +
> +typedef enum State {
> +    /* not a real state */
> +    S_NO_CHANGE = 0,
> +
> +    S_WAIT_RESET,
> +    S_CLOSED,
> +    S_VERSION,
> +    S_CAPS,
> +    S_POST_INIT_WAIT,
> +    S_IDLE,
> +    S_HOT_ADD_RB_WAIT,
> +    S_HOT_ADD_POSTING,
> +    S_HOT_ADD_REPLY_WAIT,
> +    S_HOT_ADD_SKIP_CURRENT,
> +    S_HOT_ADD_PROCESSED_CLEAR_PENDING,
> +    S_HOT_ADD_PROCESSED_NEXT,
> +    S_HOT_REMOVE,
> +    S_BALLOON_POSTING,
> +    S_BALLOON_RB_WAIT,
> +    S_BALLOON_REPLY_WAIT,
> +    S_UNBALLOON_POSTING,
> +    S_UNBALLOON_RB_WAIT,
> +    S_UNBALLOON_REPLY_WAIT,
> +} State;
> +
> +typedef struct StateDesc {
> +    State state;
> +    const char *desc;
> +} StateDesc;
> +
> +typedef struct PageRange {
> +    uint64_t start;
> +    uint64_t count;
> +} PageRange;
> +
> +/* type safety */
> +typedef struct PageRangeTree {
> +    GTree *t;
> +} PageRangeTree;
> +
> +typedef struct HAPVDIMMRange {
> +    HAPVDIMMDevice *hapvdimm;
> +
> +    PageRange range;
> +    uint64_t used;
> +
> +    /*
> +     * Pages not currently usable due to guest alignment reqs or
> +     * not hot added in the first place
> +     */
> +    uint64_t unused_head, unused_tail;
> +
> +    /* Memory removed from the guest backed by this HAPVDIMM */
> +    PageRangeTree removed_guest, removed_both;
> +} HAPVDIMMRange;
> +
> +/* type safety */
> +typedef struct HAPVDIMMRangeTree {
> +    GTree *t;
> +} HAPVDIMMRangeTree;
> +
> +typedef struct HvBalloon {
> +    VMBusDevice parent;
> +    State state;
> +    bool status_reports;
> +
> +    union dm_version version;
> +    union dm_caps caps;
> +
> +    QEMUTimer post_init_timer;
> +    guint del_todo_process_timer;
> +
> +    unsigned int trans_id;
> +
> +    /* Guest target size */
> +    uint64_t target;
> +    bool target_changed;
> +    uint64_t target_diff;
> +
> +    /*
> +     * All HAPVDIMMs under control of this driver
> +     * (but excluding the ones in hapvdimms_del_todo)
> +     */
> +    HAPVDIMMRangeTree hapvdimms;
> +
> +    /* Non-HAPVDIMM removed memory */
> +    PageRangeTree removed_guest, removed_both;
> +
> +    /* Grand totals of removed memory (both HAPVDIMM and non-HAPVDIMM) */
> +    uint64_t removed_guest_ctr, removed_both_ctr;
> +
> +    /* HAPVDIMMs waiting to be added during current connection */
> +    GSList *ha_todo;
> +    uint64_t ha_current_count;
> +
> +    /* HAPVDIMMs waiting to be deleted, not in any of the above structures */
> +    GSList *hapvdimms_del_todo;
> +} HvBalloon;
> +
> +#define HV_BALLOON(obj) OBJECT_CHECK(HvBalloon, (obj), TYPE_HV_BALLOON)
> +
> +#define HV_BALLOON_SET_STATE(hvb, news)             \
> +    do {                                            \
> +        assert(news != S_NO_CHANGE);                \
> +        hv_balloon_state_set(hvb, news, # news);    \
> +    } while (0)
> +
> +#define HV_BALLOON_STATE_DESC_SET(stdesc, news)         \
> +    _hv_balloon_state_desc_set(stdesc, news, # news)
> +
> +#define HV_BALLOON_STATE_DESC_INIT \
> +    {                              \
> +        .state = S_NO_CHANGE,      \
> +    }
> +
> +#define SUM_OVERFLOW_U64(in1, in2) ((in1) > UINT64_MAX - (in2))
> +#define SUM_SATURATE_U64(in1, in2)              \
> +    ({                                          \
> +        uint64_t _in1 = (in1), _in2 = (in2);    \
> +        uint64_t _result;                       \
> +                                                \
> +        if (!SUM_OVERFLOW_U64(_in1, _in2)) {    \
> +            _result = _in1 + _in2;              \
> +        } else {                                \
> +            _result = UINT64_MAX;               \
> +        }                                       \
> +                                                \
> +        _result;                                \
> +    })
> +
> +typedef struct HvBalloonReq {
> +    VMBusChanReq vmreq;
> +} HvBalloonReq;
> +
> +/* PageRange */
> +static void page_range_intersect(const PageRange *range,
> +                                 uint64_t start, uint64_t count,
> +                                 PageRange *out)
> +{
> +    uint64_t end1 = range->start + range->count;
> +    uint64_t end2 = start + count;
> +    uint64_t end = MIN(end1, end2);
> +
> +    out->start = MAX(range->start, start);
> +    out->count = out->start < end ? end - out->start : 0;
> +}
> +
> +static uint64_t page_range_intersection_size(const PageRange *range,
> +                                             uint64_t start, uint64_t count)
> +{
> +    PageRange trange;
> +
> +    page_range_intersect(range, start, count, &trange);
> +    return trange.count;
> +}
> +
> +/* return just the part of range before (start) */
> +static void page_range_part_before(const PageRange *range,
> +                                   uint64_t start, PageRange *out)
> +{
> +    uint64_t endr = range->start + range->count;
> +    uint64_t end = MIN(endr, start);
> +
> +    out->start = range->start;
> +    if (end > out->start) {
> +        out->count = end - out->start;
> +    } else {
> +        out->count = 0;
> +    }
> +}
> +
> +/* return just the part of range after (start, count) */
> +static void page_range_part_after(const PageRange *range,
> +                                  uint64_t start, uint64_t count,
> +                                  PageRange *out)
> +{
> +    uint64_t end = range->start + range->count;
> +    uint64_t ends = start + count;
> +
> +    out->start = MAX(range->start, ends);
> +    if (end > out->start) {
> +        out->count = end - out->start;
> +    } else {
> +        out->count = 0;
> +    }
> +}
> +
> +static bool page_range_joinable_left(const PageRange *range,
> +                                     uint64_t start, uint64_t count)
> +{
> +    return start + count == range->start;
> +}
> +
> +static bool page_range_joinable_right(const PageRange *range,
> +                                      uint64_t start, uint64_t count)
> +{
> +    return range->start + range->count == start;
> +}
> +
> +static bool page_range_joinable(const PageRange *range,
> +                                uint64_t start, uint64_t count)
> +{
> +    return page_range_joinable_left(range, start, count) ||
> +        page_range_joinable_right(range, start, count);
> +}
> +
> +/* PageRangeTree */
> +static gint page_range_tree_key_compare(gconstpointer leftp,
> +                                        gconstpointer rightp,
> +                                        gpointer user_data)
> +{
> +    const uint64_t *left = leftp, *right = rightp;
> +
> +    if (*left < *right) {
> +        return -1;
> +    } else if (*left > *right) {
> +        return 1;
> +    } else { /* *left == *right */
> +        return 0;
> +    }
> +}
> +
> +static GTreeNode *page_range_tree_insert_new(PageRangeTree tree,
> +                                             uint64_t start, uint64_t count)
> +{
> +    uint64_t *key = g_malloc(sizeof(*key));
> +    PageRange *range = g_malloc(sizeof(*range));
> +
> +    assert(count > 0);
> +
> +    *key = range->start = start;
> +    range->count = count;
> +
> +    return g_tree_insert_node(tree.t, key, range);
> +}
> +
> +static void page_range_tree_insert(PageRangeTree tree,
> +                                   uint64_t start, uint64_t count,
> +                                   uint64_t *dupcount)
> +{
> +    GTreeNode *node;
> +    bool joinable;
> +    uint64_t intersection;
> +    PageRange *range;
> +
> +    assert(!SUM_OVERFLOW_U64(start, count));
> +    if (count == 0) {
> +        return;
> +    }
> +
> +    node = g_tree_upper_bound(tree.t, &start);
> +    if (node) {
> +        node = g_tree_node_previous(node);
> +    } else {
> +        node = g_tree_node_last(tree.t);
> +    }
> +
> +    if (node) {
> +        range = g_tree_node_value(node);
> +        assert(range);
> +        intersection = page_range_intersection_size(range, start, count);
> +        joinable = page_range_joinable_right(range, start, count);
> +    }
> +
> +    if (!node ||
> +        (!intersection && !joinable)) {
> +        /*
> +         * !node case: the tree is empty or the very first node in the tree
> +         * already has a higher key (the start of its range).
> +         * the other case: there is a gap in the tree between the new range
> +         * and the previous one.
> +         * anyway, let's just insert the new range into the tree.
> +         */
> +        node = page_range_tree_insert_new(tree, start, count);
> +        assert(node);
> +        range = g_tree_node_value(node);
> +        assert(range);
> +    } else {
> +        /*
> +         * the previous range in the tree either partially covers the new
> +         * range or ends just at its beginning - extend it
> +         */
> +        if (dupcount) {
> +            *dupcount += intersection;
> +        }
> +
> +        count += start - range->start;
> +        range->count = MAX(range->count, count);
> +    }
> +
> +    /* check next nodes for possible merging */
> +    for (node = g_tree_node_next(node); node; ) {
> +        PageRange *rangecur;
> +
> +        rangecur = g_tree_node_value(node);
> +        assert(rangecur);
> +
> +        intersection = page_range_intersection_size(rangecur,
> +                                                    range->start, range->count);
> +        joinable = page_range_joinable_left(rangecur,
> +                                            range->start, range->count);
> +        if (!intersection && !joinable) {
> +            /* the current node is disjoint */
> +            break;
> +        }
> +
> +        if (dupcount) {
> +            *dupcount += intersection;
> +        }
> +
> +        count = rangecur->count + (rangecur->start - range->start);
> +        range->count = MAX(range->count, count);
> +
> +        /* the current node was merged in, remove it */
> +        start = rangecur->start;
> +        node = g_tree_node_next(node);
> +        /* no hinted removal in GTree... */
> +        g_tree_remove(tree.t, &start);
> +    }
> +}
> +
> +static bool page_range_tree_pop(PageRangeTree tree, PageRange *out,
> +                                uint64_t maxcount)
> +{
> +    GTreeNode *node;
> +    PageRange *range;
> +
> +    node = g_tree_node_last(tree.t);
> +    if (!node) {
> +        return false;
> +    }
> +
> +    range = g_tree_node_value(node);
> +    assert(range);
> +
> +    out->start = range->start;
> +
> +    /* can't modify range->start as it is the node key */
> +    if (range->count > maxcount) {
> +        out->start += range->count - maxcount;
> +        out->count = maxcount;
> +        range->count -= maxcount;
> +    } else {
> +        out->count = range->count;
> +        /* no hinted removal in GTree... */
> +        g_tree_remove(tree.t, &out->start);
> +    }
> +
> +    return true;
> +}
> +
> +static bool page_range_tree_intree_any(PageRangeTree tree,
> +                                       uint64_t start, uint64_t count)
> +{
> +    GTreeNode *node;
> +
> +    if (count == 0) {
> +        return false;
> +    }
> +
> +    /* find the first node that can possibly intersect our range */
> +    node = g_tree_upper_bound(tree.t, &start);
> +    if (node) {
> +        /*
> +         * a NULL node below means that the very first node in the tree
> +         * already has a higher key (the start of its range).
> +         */
> +        node = g_tree_node_previous(node);
> +    } else {
> +        /* a NULL node below means that the tree is empty */
> +        node = g_tree_node_last(tree.t);
> +    }
> +    /* node range start <= range start */
> +
> +    if (!node) {
> +        /* node range start > range start */
> +        node = g_tree_node_first(tree.t);
> +    }
> +
> +    for ( ; node; node = g_tree_node_next(node)) {
> +        PageRange *range = g_tree_node_value(node);
> +
> +        assert(range);
> +        /*
> +         * if this node starts beyond or at the end of our range so does
> +         * every next one
> +         */
> +        if (range->start >= start + count) {
> +            break;
> +        }
> +
> +        if (page_range_intersection_size(range, start, count) > 0) {
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> +
> +static PageRangeTree page_range_tree_new(void)
> +{
> +    PageRangeTree tree;
> +
> +    tree.t = g_tree_new_full(page_range_tree_key_compare, NULL,
> +                             g_free, g_free);
> +    return tree;
> +}
> +
> +static void page_range_tree_destroy(PageRangeTree *tree)
> +{
> +    /* g_tree_destroy() is not NULL-safe */
> +    if (!tree->t) {
> +        return;
> +    }
> +
> +    g_tree_destroy(tree->t);
> +    tree->t = NULL;
> +}
> +
> +/* HAPVDIMMDevice */
> +static uint64_t hapvdimm_get_addr(HAPVDIMMDevice *hapvdimm)
> +{
> +    return object_property_get_uint(OBJECT(hapvdimm), HAPVDIMM_ADDR_PROP,
> +                                    &error_abort) / HV_BALLOON_PAGE_SIZE;
> +}
> +
> +static uint64_t hapvdimm_get_size(HAPVDIMMDevice *hapvdimm)
> +{
> +    return object_property_get_uint(OBJECT(hapvdimm), HAPVDIMM_SIZE_PROP,
> +                                    &error_abort) / HV_BALLOON_PAGE_SIZE;
> +}
> +
> +static void hapvdimm_get_range(HAPVDIMMDevice *hapvdimm, PageRange *out)
> +{
> +    out->start = hapvdimm_get_addr(hapvdimm);
> +    assert(out->start > 0);
> +
> +    out->count = hapvdimm_get_size(hapvdimm);
> +    assert(out->count > 0);
> +}
> +
> +static HostMemoryBackend *hapvdimm_get_memdev(HAPVDIMMDevice *hapvdimm)
> +{
> +    Object *memdev_obj;
> +
> +    memdev_obj = object_property_get_link(OBJECT(hapvdimm),
> +                                          HAPVDIMM_MEMDEV_PROP,
> +                                          &error_abort);
> +    return MEMORY_BACKEND(memdev_obj);
> +}
> +
> +/* HAPVDIMMRange */
> +static HAPVDIMMRange *hapvdimm_range_new(HAPVDIMMDevice *hapvdimm)
> +{
> +    HAPVDIMMRange *hpr = g_malloc(sizeof(*hpr));
> +
> +    hpr->hapvdimm = HAPVDIMM(object_ref(hapvdimm));
> +    hapvdimm_get_range(hapvdimm, &hpr->range);
> +
> +    hpr->removed_guest = page_range_tree_new();
> +    hpr->removed_both = page_range_tree_new();
> +
> +    /* mark the whole range as unused */
> +    hpr->used = 0;
> +    hpr->unused_head = hpr->range.count;
> +    hpr->unused_tail = 0;
> +
> +    return hpr;
> +}
> +
> +static void hapvdimm_range_free(HAPVDIMMRange *hpr)
> +{
> +    g_autoptr(HAPVDIMMDevice) hapvdimm = g_steal_pointer(&hpr->hapvdimm);
> +
> +    page_range_tree_destroy(&hpr->removed_guest);
> +    page_range_tree_destroy(&hpr->removed_both);
> +
> +    g_free(hpr);
> +}
> +
> +/* the hapvdimm range reduced by unused head and tail */
> +static void hapvdimm_range_get_effective_range(HAPVDIMMRange *hpr,
> +                                               PageRange *out)
> +{
> +    out->start = hpr->range.start + hpr->unused_head;
> +    out->count = hpr->range.count - hpr->unused_head - hpr->unused_tail;
> +}
> +
> +/* HAPVDIMMRangeTree */
> +static gint hapvdimm_tree_key_compare(gconstpointer leftp, gconstpointer rightp,
> +                                      gpointer user_data)
> +{
> +    /*
> +     * hapvdimm tree is also keyed on page range start, so we can simply reuse
> +     * the comparison function from the page range tree
> +     */
> +    return page_range_tree_key_compare(leftp, rightp, user_data);
> +}
> +
> +static HAPVDIMMRange *hapvdimm_tree_insert_new(HvBalloon *balloon,
> +                                               HAPVDIMMDevice *hapvdimm)
> +{
> +    HAPVDIMMRange *hpr;
> +    uint64_t *key;
> +
> +    hpr = hapvdimm_range_new(hapvdimm);
> +
> +    key = g_malloc(sizeof(*key));
> +    *key = hpr->range.start;
> +
> +    g_tree_insert(balloon->hapvdimms.t, key, hpr);
> +
> +    return hpr;
> +}
> +
> +/* The HAPVDIMM must not be on the ha_todo list since it's going to get unref'ed. */
> +static void hapvdimm_tree_remove(HvBalloon *balloon, HAPVDIMMDevice *hapvdimm)
> +{
> +    uint64_t addr;
> +
> +    addr = hapvdimm_get_addr(hapvdimm);
> +    assert(addr > 0);
> +
> +    g_tree_remove(balloon->hapvdimms.t, &addr);
> +}
> +
> +/* total RAM includes memory currently removed from the guest */
> +static gboolean hapvdimm_tree_total_ram_node(gpointer key,
> +                                             gpointer value,
> +                                             gpointer data)
> +{
> +    HAPVDIMMRange *hpr = value;
> +    uint64_t *size = data;
> +    PageRange rangeeff;
> +
> +    hapvdimm_range_get_effective_range(hpr, &rangeeff);
> +    *size += rangeeff.count;
> +
> +    return false;
> +}
> +
> +static uint64_t hapvdimm_tree_total_ram(HvBalloon *balloon)
> +{
> +    uint64_t size = 0;
> +
> +    g_tree_foreach(balloon->hapvdimms.t, hapvdimm_tree_total_ram_node, &size);
> +    return size;
> +}
> +
> +static void hapvdimm_tree_value_free(gpointer data)
> +{
> +    HAPVDIMMRange *hpr = data;
> +
> +    hapvdimm_range_free(hpr);
> +}
> +
> +static HAPVDIMMRangeTree hapvdimm_tree_new(void)
> +{
> +    HAPVDIMMRangeTree tree;
> +
> +    tree.t = g_tree_new_full(hapvdimm_tree_key_compare, NULL, g_free,
> +                             hapvdimm_tree_value_free);
> +    return tree;
> +}
> +
> +static void hapvdimm_tree_destroy(HAPVDIMMRangeTree *tree)
> +{
> +    /* g_tree_destroy() is not NULL-safe */
> +    if (!tree->t) {
> +        return;
> +    }
> +
> +    g_tree_destroy(tree->t);
> +    tree->t = NULL;
> +}
> +
> +static gboolean ha_todo_add_all_node(gpointer key,
> +                                     gpointer value,
> +                                     gpointer data)
> +{
> +    HAPVDIMMRange *hpr = value;
> +    HvBalloon *balloon = data;
> +
> +    /* assume the hpr is fresh */
> +    assert(hpr->used == 0);
> +    assert(hpr->unused_head == hpr->range.count);
> +    assert(hpr->unused_tail == 0);
> +
> +    balloon->ha_todo = g_slist_append(balloon->ha_todo, hpr);
> +
> +    return false;
> +}
> +
> +static void ha_todo_add_all(HvBalloon *balloon)
> +{
> +    assert(balloon->ha_todo == NULL);
> +    g_tree_foreach(balloon->hapvdimms.t, ha_todo_add_all_node, balloon);
> +}
> +
> +static void ha_todo_clear(HvBalloon *balloon)
> +{
> +    g_slist_free(g_steal_pointer(&balloon->ha_todo));
> +}
> +
> +/* TODO: unify the code below with virtio-balloon and cache the value */
> +static int build_dimm_list(Object *obj, void *opaque)
> +{
> +    GSList **list = opaque;
> +
> +    if (object_dynamic_cast(obj, TYPE_PC_DIMM)) {
> +        DeviceState *dev = DEVICE(obj);
> +        if (dev->realized) { /* only realized DIMMs matter */
> +            *list = g_slist_prepend(*list, dev);
> +        }
> +    }
> +
> +    object_child_foreach(obj, build_dimm_list, opaque);
> +    return 0;
> +}
> +
> +static ram_addr_t get_current_ram_size(void)
> +{
> +    GSList *list = NULL, *item;
> +    ram_addr_t size = current_machine->ram_size;
> +
> +    build_dimm_list(qdev_get_machine(), &list);
> +    for (item = list; item; item = g_slist_next(item)) {
> +        Object *obj = OBJECT(item->data);
> +        if (!strcmp(object_get_typename(obj), TYPE_PC_DIMM))
> +            size += object_property_get_int(obj, PC_DIMM_SIZE_PROP,
> +                                            &error_abort);
> +    }
> +    g_slist_free(list);
> +
> +    return size;
> +}
> +
> +/* total RAM includes memory currently removed from the guest */
> +static uint64_t hv_balloon_total_ram(HvBalloon *balloon)
> +{
> +    ram_addr_t ram_size = get_current_ram_size();
> +    uint64_t ram_size_pages = ram_size >> HV_BALLOON_PFN_SHIFT;
> +    uint64_t hapvdimm_size_pages = hapvdimm_tree_total_ram(balloon);
> +
> +    assert(ram_size_pages > 0);
> +
> +    return SUM_SATURATE_U64(ram_size_pages, hapvdimm_size_pages);
> +}
> +
> +/*
> + * calculating the total RAM size is a slow operation,
> + * avoid it as much as possible
> + */
> +static uint64_t hv_balloon_total_removed_rs(HvBalloon *balloon,
> +                                            uint64_t ram_size_pages)
> +{
> +    uint64_t total_removed;
> +
> +    total_removed = SUM_SATURATE_U64(balloon->removed_guest_ctr,
> +                                     balloon->removed_both_ctr);
> +
> +    /* possible if guest returns pages outside actual RAM */
> +    if (total_removed > ram_size_pages) {
> +        total_removed = ram_size_pages;
> +    }
> +
> +    return total_removed;
> +}
> +
> +static bool hv_balloon_state_is_init(HvBalloon *balloon)
> +{
> +    return balloon->state == S_WAIT_RESET ||
> +        balloon->state == S_CLOSED ||
> +        balloon->state == S_VERSION ||
> +        balloon->state == S_CAPS;
> +}
> +
> +/* Returns whether the state has actually changed */
> +static bool hv_balloon_state_set(HvBalloon *balloon,
> +                                 State newst, const char *newststr)
> +{
> +    if (newst == S_NO_CHANGE || balloon->state == newst) {
> +        return false;
> +    }
> +
> +    balloon->state = newst;
> +    trace_hv_balloon_state_change(newststr);
> +    return true;
> +}
> +
> +static void _hv_balloon_state_desc_set(StateDesc *stdesc,
> +                                       State newst, const char *newststr)
> +{
> +    /* state setting is only permitted on a freshly init desc */
> +    assert(stdesc->state == S_NO_CHANGE);
> +
> +    assert(newst != S_NO_CHANGE);
> +
> +    stdesc->state = newst;
> +    stdesc->desc = newststr;
> +}
> +
> +static void del_todo_process(HvBalloon *balloon)
> +{
> +    while (balloon->hapvdimms_del_todo) {
> +        HAPVDIMMDevice *hapvdimm = balloon->hapvdimms_del_todo->data;
> +        HostMemoryBackend *backend;
> +        const char *backend_id;
> +
> +        backend = hapvdimm_get_memdev(hapvdimm);
> +        backend_id = object_get_canonical_path_component(OBJECT(backend));
> +
> +        object_unparent(OBJECT(hapvdimm));
> +        object_unref(OBJECT(hapvdimm));
> +        qapi_event_send_hv_balloon_memory_backend_unused(backend_id);
> +
> +        balloon->hapvdimms_del_todo =
> +            g_slist_remove(balloon->hapvdimms_del_todo, hapvdimm);
> +    }
> +
> +    if (balloon->del_todo_process_timer) {
> +        g_source_remove(balloon->del_todo_process_timer);
> +        balloon->del_todo_process_timer = 0;
> +    }
> +}
> +
> +static gboolean del_todo_process_timer(gpointer user_data)
> +{
> +    HvBalloon *balloon = user_data;
> +
> +    balloon->del_todo_process_timer = 0;
> +
> +    del_todo_process(balloon);
> +
> +    return G_SOURCE_REMOVE;
> +}
> +
> +static void del_todo_append(HvBalloon *balloon,
> +                            HAPVDIMMDevice *hapvdimm)
> +{
> +    balloon->hapvdimms_del_todo = g_slist_append(balloon->hapvdimms_del_todo,
> +                                                 object_ref(hapvdimm));
> +}
> +
> +static void del_todo_add(HvBalloon *balloon,
> +                         HAPVDIMMDevice *hapvdimm)
> +{
> +    hapvdimm_tree_remove(balloon, hapvdimm);
> +    del_todo_append(balloon, hapvdimm);
> +}
> +
> +static gboolean del_todo_add_all_node(gpointer key,
> +                                      gpointer value,
> +                                      gpointer data)
> +{
> +    HAPVDIMMRange *hpr = value;
> +    HvBalloon *balloon = data;
> +
> +    del_todo_append(balloon, hpr->hapvdimm);
> +
> +    return false;
> +}
> +
> +static void del_todo_add_all(HvBalloon *balloon)
> +{
> +    g_tree_foreach(balloon->hapvdimms.t, del_todo_add_all_node, balloon);
> +    hapvdimm_tree_destroy(&balloon->hapvdimms);
> +
> +    balloon->hapvdimms = hapvdimm_tree_new();
> +}
> +
> +static void del_todo_add_all_from_ha_todo(HvBalloon *balloon)
> +{
> +    while (balloon->ha_todo) {
> +        HAPVDIMMRange *hpr = balloon->ha_todo->data;
> +
> +        del_todo_add(balloon, hpr->hapvdimm);
> +        balloon->ha_todo = g_slist_remove(balloon->ha_todo, hpr);
> +    }
> +}
> +
> +static VMBusChannel *hv_balloon_get_channel_maybe(HvBalloon *balloon)
> +{
> +    return vmbus_device_channel(&balloon->parent, 0);
> +}
> +
> +static VMBusChannel *hv_balloon_get_channel(HvBalloon *balloon)
> +{
> +    VMBusChannel *chan;
> +
> +    chan = hv_balloon_get_channel_maybe(balloon);
> +    assert(chan != NULL);
> +    return chan;
> +}
> +
> +static ssize_t hv_balloon_send_packet(VMBusChannel *chan,
> +                                      struct dm_message *msg)
> +{
> +    int ret;
> +
> +    ret = vmbus_channel_reserve(chan, 0, msg->hdr.size);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    return vmbus_channel_send(chan, VMBUS_PACKET_DATA_INBAND,
> +                              NULL, 0, msg, msg->hdr.size, false,
> +                              msg->hdr.trans_id);
> +}
> +
> +static bool hv_balloon_unballoon_get_source(HvBalloon *balloon,
> +                                            PageRangeTree *dtree,
> +                                            uint64_t **dctr,
> +                                            HAPVDIMMRange **hpr)
> +{
> +    /* Try the boot memory first */
> +    if (g_tree_nnodes(balloon->removed_guest.t) > 0) {
> +        *dtree = balloon->removed_guest;
> +        *dctr = &balloon->removed_guest_ctr;
> +        *hpr = NULL;
> +    } else if (g_tree_nnodes(balloon->removed_both.t) > 0) {
> +        *dtree = balloon->removed_both;
> +        *dctr = &balloon->removed_both_ctr;
> +        *hpr = NULL;
> +    } else {
> +        GTreeNode *node;
> +
> +        for (node = g_tree_node_first(balloon->hapvdimms.t); node;
> +             node = g_tree_node_next(node)) {
> +            HAPVDIMMRange *hprnode = g_tree_node_value(node);
> +
> +            assert(hprnode);
> +            if (g_tree_nnodes(hprnode->removed_guest.t) > 0) {
> +                *dtree = hprnode->removed_guest;
> +                *dctr = &balloon->removed_guest_ctr;
> +                *hpr = hprnode;
> +                break;
> +            } else if (g_tree_nnodes(hprnode->removed_both.t) > 0) {
> +                *dtree = hprnode->removed_both;
> +                *dctr = &balloon->removed_both_ctr;
> +                *hpr = hprnode;
> +                break;
> +            }
> +        }
> +
> +        if (!node) {
> +            return false;
> +        }
> +    }
> +
> +    return true;
> +}
> +
> +static void hv_balloon_balloon_unballoon_start(HvBalloon *balloon,
> +                                               uint64_t ram_size_pages,
> +                                               StateDesc *stdesc)
> +{
> +    uint64_t total_removed = hv_balloon_total_removed_rs(balloon,
> +                                                         ram_size_pages);
> +
> +    assert(balloon->state == S_IDLE);
> +    assert(ram_size_pages > 0);
> +
> +    /*
> +     * we need to cache the value when starting the (un)balloon procedure
> +     * in case somebody changes the balloon target when the procedure is
> +     * in progress
> +     */
> +    if (balloon->target < ram_size_pages - total_removed) {
> +        balloon->target_diff = ram_size_pages - total_removed - balloon->target;
> +        HV_BALLOON_STATE_DESC_SET(stdesc, S_BALLOON_RB_WAIT);
> +    } else {
> +        balloon->target_diff = balloon->target -
> +            (ram_size_pages - total_removed);
> +
> +        /*
> +         * careful here, the user might have set the balloon target
> +         * above the RAM size, so above the total removed count
> +         */
> +        balloon->target_diff = MIN(balloon->target_diff, total_removed);
> +        HV_BALLOON_STATE_DESC_SET(stdesc, S_UNBALLOON_RB_WAIT);
> +    }
> +
> +    balloon->target_changed = false;
> +}
> +
> +static void hv_balloon_unballoon_rb_wait(HvBalloon *balloon, StateDesc *stdesc)
> +{
> +    VMBusChannel *chan = hv_balloon_get_channel(balloon);
> +    struct dm_unballoon_request *ur;
> +    size_t ur_size = sizeof(*ur) + sizeof(ur->range_array[0]);
> +
> +    assert(balloon->state == S_UNBALLOON_RB_WAIT);
> +
> +    if (vmbus_channel_reserve(chan, 0, ur_size) < 0) {
> +        return;
> +    }
> +
> +    HV_BALLOON_STATE_DESC_SET(stdesc, S_UNBALLOON_POSTING);
> +}
> +
> +static void hv_balloon_unballoon_posting(HvBalloon *balloon, StateDesc *stdesc)
> +{
> +    VMBusChannel *chan = hv_balloon_get_channel(balloon);
> +    PageRangeTree dtree;
> +    uint64_t *dctr;
> +    HAPVDIMMRange *hpr;
> +    struct dm_unballoon_request *ur;
> +    size_t ur_size = sizeof(*ur) + sizeof(ur->range_array[0]);
> +    PageRange range;
> +    bool bret;
> +    ssize_t ret;
> +
> +    assert(balloon->state == S_UNBALLOON_POSTING);
> +    assert(balloon->target_diff > 0);
> +
> +    if (!hv_balloon_unballoon_get_source(balloon, &dtree, &dctr, &hpr)) {
> +        error_report("trying to unballoon but nothing ballooned");
> +        /*
> +         * there is little we can do as we might have already
> +         * sent the guest a partial request we can't cancel
> +         */
> +        return;
> +    }
> +
> +    assert(dtree.t);
> +    assert(dctr);
> +
> +    ur = alloca(ur_size);
> +    memset(ur, 0, ur_size);
> +    ur->hdr.type = DM_UNBALLOON_REQUEST;
> +    ur->hdr.size = ur_size;
> +    ur->hdr.trans_id = balloon->trans_id;
> +
> +    bret = page_range_tree_pop(dtree, &range, MIN(balloon->target_diff,
> +                                                  HV_BALLOON_HA_CHUNK_PAGES));
> +    assert(bret);
> +    /* TODO: madvise? */
> +
> +    *dctr -= range.count;
> +    balloon->target_diff -= range.count;
> +    if (hpr) {
> +        hpr->used += range.count;
> +    }
> +
> +    ur->range_count = 1;
> +    ur->range_array[0].finfo.start_page = range.start;
> +    ur->range_array[0].finfo.page_cnt = range.count;
> +    ur->more_pages = balloon->target_diff > 0;
> +
> +    trace_hv_balloon_outgoing_unballoon(ur->hdr.trans_id,
> +                                        range.count, range.start,
> +                                        balloon->target_diff);
> +
> +    if (ur->more_pages) {
> +        HV_BALLOON_STATE_DESC_SET(stdesc, S_UNBALLOON_RB_WAIT);
> +    } else {
> +        HV_BALLOON_STATE_DESC_SET(stdesc, S_UNBALLOON_REPLY_WAIT);
> +    }
> +
> +    ret = vmbus_channel_send(chan, VMBUS_PACKET_DATA_INBAND,
> +                             NULL, 0, ur, ur_size, false,
> +                             ur->hdr.trans_id);
> +    if (ret <= 0) {
> +        error_report("error %zd when posting unballoon msg, expect problems",
> +                     ret);
> +    }
> +}
> +
> +static void hv_balloon_hot_add_start(HvBalloon *balloon, StateDesc *stdesc)
> +{
> +    HAPVDIMMRange *hpr;
> +    PageRange range;
> +
> +    assert(balloon->state == S_IDLE);
> +    assert(balloon->ha_todo);
> +
> +    hpr = balloon->ha_todo->data;
> +
> +    range.start = QEMU_ALIGN_UP(hpr->range.start,
> +                                (1 << balloon->caps.cap_bits.hot_add_alignment)
> +                                * (MiB / HV_BALLOON_PAGE_SIZE));
> +    hpr->unused_head = range.start - hpr->range.start;
> +    if (hpr->unused_head >= hpr->range.count) {
> +        HV_BALLOON_STATE_DESC_SET(stdesc, S_HOT_ADD_SKIP_CURRENT);
> +        return;
> +    }
> +
> +    range.count = hpr->range.count - hpr->unused_head;
> +    range.count = QEMU_ALIGN_DOWN(range.count,
> +                                  (1 << balloon->caps.cap_bits.hot_add_alignment)
> +                                  * (MiB / HV_BALLOON_PAGE_SIZE));
> +    if (range.count == 0) {
> +        HV_BALLOON_STATE_DESC_SET(stdesc, S_HOT_ADD_SKIP_CURRENT);
> +        return;
> +    }
> +    hpr->unused_tail = hpr->range.count - hpr->unused_head - range.count;
> +    hpr->used = 0;
> +
> +    HV_BALLOON_STATE_DESC_SET(stdesc, S_HOT_ADD_RB_WAIT);
> +}
> +
> +static void hv_balloon_hot_add_rb_wait(HvBalloon *balloon, StateDesc *stdesc)
> +{
> +    VMBusChannel *chan = hv_balloon_get_channel(balloon);
> +    struct dm_hot_add *ha;
> +    size_t ha_size = sizeof(*ha) + sizeof(ha->range);
> +
> +    assert(balloon->state == S_HOT_ADD_RB_WAIT);
> +
> +    if (vmbus_channel_reserve(chan, 0, ha_size) < 0) {
> +        return;
> +    }
> +
> +    HV_BALLOON_STATE_DESC_SET(stdesc, S_HOT_ADD_POSTING);
> +}
> +
> +static void hv_balloon_hot_add_posting(HvBalloon *balloon, StateDesc *stdesc)
> +{
> +    VMBusChannel *chan = hv_balloon_get_channel(balloon);
> +    HAPVDIMMRange *hpr;
> +    struct dm_hot_add *ha;
> +    size_t ha_size = sizeof(*ha) + sizeof(ha->range);
> +    union dm_mem_page_range *ha_region;
> +    PageRange range;
> +    uint64_t chunk_max_size;
> +    ssize_t ret;
> +
> +    assert(balloon->state == S_HOT_ADD_POSTING);
> +    assert(balloon->ha_todo);
> +
> +    hpr = balloon->ha_todo->data;
> +
> +    range.start = hpr->range.start + hpr->unused_head + hpr->used;
> +    range.count = hpr->range.count;
> +    range.count -= hpr->unused_head;
> +    range.count -= hpr->used;
> +    range.count -= hpr->unused_tail;
> +
> +    chunk_max_size = MAX((1 << balloon->caps.cap_bits.hot_add_alignment) *
> +                         (MiB / HV_BALLOON_PAGE_SIZE),
> +                         HV_BALLOON_HA_CHUNK_PAGES);
> +    range.count = MIN(range.count, chunk_max_size);
> +    balloon->ha_current_count = range.count;
> +
> +    ha = alloca(ha_size);
> +    ha_region = &(&ha->range)[1];
> +    memset(ha, 0, ha_size);
> +    ha->hdr.type = DM_MEM_HOT_ADD_REQUEST;
> +    ha->hdr.size = ha_size;
> +    ha->hdr.trans_id = balloon->trans_id;
> +
> +    ha->range.finfo.start_page = range.start;
> +    ha->range.finfo.page_cnt = range.count;
> +    ha_region->finfo.start_page = range.start;
> +    ha_region->finfo.page_cnt = ha->range.finfo.page_cnt;
> +
> +    trace_hv_balloon_outgoing_hot_add(ha->hdr.trans_id,
> +                                      range.count, range.start);
> +
> +    ret = vmbus_channel_send(chan, VMBUS_PACKET_DATA_INBAND,
> +                             NULL, 0, ha, ha_size, false,
> +                             ha->hdr.trans_id);
> +    if (ret <= 0) {
> +        error_report("error %zd when posting hot add msg, expect problems",
> +                     ret);
> +    }
> +
> +    HV_BALLOON_STATE_DESC_SET(stdesc, S_HOT_ADD_REPLY_WAIT);
> +}
> +
> +static void hv_balloon_hot_add_finish(HvBalloon *balloon, StateDesc *stdesc)
> +{
> +    HAPVDIMMRange *hpr;
> +
> +    assert(balloon->state == S_HOT_ADD_SKIP_CURRENT ||
> +           balloon->state == S_HOT_ADD_PROCESSED_CLEAR_PENDING ||
> +           balloon->state == S_HOT_ADD_PROCESSED_NEXT);
> +    assert(balloon->ha_todo);
> +
> +    hpr = balloon->ha_todo->data;
> +
> +    balloon->ha_todo = g_slist_remove(balloon->ha_todo, hpr);
> +    if (balloon->state == S_HOT_ADD_SKIP_CURRENT) {
> +        del_todo_add(balloon, hpr->hapvdimm);
> +    } else if (balloon->state == S_HOT_ADD_PROCESSED_CLEAR_PENDING) {
> +        del_todo_add_all_from_ha_todo(balloon);
> +    }
> +
> +    /* let other things happen, too, between hot adds to be done */
> +    HV_BALLOON_STATE_DESC_SET(stdesc, S_IDLE);
> +}
> +
> +static void hv_balloon_balloon_rb_wait(HvBalloon *balloon, StateDesc *stdesc)
> +{
> +    VMBusChannel *chan = hv_balloon_get_channel(balloon);
> +    size_t bl_size = sizeof(struct dm_balloon);
> +
> +    assert(balloon->state == S_BALLOON_RB_WAIT);
> +
> +    if (vmbus_channel_reserve(chan, 0, bl_size) < 0) {
> +        return;
> +    }
> +
> +    HV_BALLOON_STATE_DESC_SET(stdesc, S_BALLOON_POSTING);
> +}
> +
> +static void hv_balloon_balloon_posting(HvBalloon *balloon, StateDesc *stdesc)
> +{
> +    VMBusChannel *chan = hv_balloon_get_channel(balloon);
> +    struct dm_balloon bl;
> +    size_t bl_size = sizeof(bl);
> +    ssize_t ret;
> +
> +    assert(balloon->state == S_BALLOON_POSTING);
> +    assert(balloon->target_diff > 0);
> +
> +    memset(&bl, 0, sizeof(bl));
> +    bl.hdr.type = DM_BALLOON_REQUEST;
> +    bl.hdr.size = bl_size;
> +    bl.hdr.trans_id = balloon->trans_id;
> +    bl.num_pages = MIN(balloon->target_diff, HV_BALLOON_HR_CHUNK_PAGES);
> +
> +    trace_hv_balloon_outgoing_balloon(bl.hdr.trans_id, bl.num_pages,
> +                                      balloon->target_diff);
> +
> +    ret = vmbus_channel_send(chan, VMBUS_PACKET_DATA_INBAND,
> +                             NULL, 0, &bl, bl_size, false,
> +                             bl.hdr.trans_id);
> +    if (ret <= 0) {
> +        error_report("error %zd when posting balloon msg, expect problems",
> +                     ret);
> +    }
> +
> +    HV_BALLOON_STATE_DESC_SET(stdesc, S_BALLOON_REPLY_WAIT);
> +}
> +
> +static void hv_balloon_idle_state(HvBalloon *balloon,
> +                                  StateDesc *stdesc)
> +{
> +    bool can_balloon = balloon->caps.cap_bits.balloon;
> +    bool want_unballoon = false;
> +    bool want_hot_add = balloon->ha_todo != NULL;
> +    bool want_balloon = false;
> +    uint64_t ram_size_pages;
> +
> +    assert(balloon->state == S_IDLE);
> +
> +    if (can_balloon && balloon->target_changed) {
> +        uint64_t total_removed;
> +
> +        ram_size_pages = hv_balloon_total_ram(balloon);
> +        total_removed = hv_balloon_total_removed_rs(balloon,
> +                                                    ram_size_pages);
> +
> +        want_unballoon = total_removed > 0 &&
> +            balloon->target > ram_size_pages - total_removed;
> +        want_balloon = balloon->target < ram_size_pages - total_removed;
> +    }
> +
> +    /*
> +     * the order here is important, first we unballoon, then hot add,
> +     * then balloon (or hot remove)
> +     */
> +    if (want_unballoon) {
> +        hv_balloon_balloon_unballoon_start(balloon, ram_size_pages, stdesc);
> +    } else if (want_hot_add) {
> +        hv_balloon_hot_add_start(balloon, stdesc);
> +    } else if (want_balloon) {
> +        hv_balloon_balloon_unballoon_start(balloon, ram_size_pages, stdesc);
> +    }
> +}
> +
> +static const struct {
> +    void (*handler)(HvBalloon *balloon, StateDesc *stdesc);
> +} state_handlers[] = {
> +    [S_IDLE].handler = hv_balloon_idle_state,
> +    [S_UNBALLOON_RB_WAIT].handler = hv_balloon_unballoon_rb_wait,
> +    [S_UNBALLOON_POSTING].handler = hv_balloon_unballoon_posting,
> +    [S_HOT_ADD_RB_WAIT].handler = hv_balloon_hot_add_rb_wait,
> +    [S_HOT_ADD_POSTING].handler = hv_balloon_hot_add_posting,
> +    [S_HOT_ADD_SKIP_CURRENT].handler = hv_balloon_hot_add_finish,
> +    [S_HOT_ADD_PROCESSED_CLEAR_PENDING].handler = hv_balloon_hot_add_finish,
> +    [S_HOT_ADD_PROCESSED_NEXT].handler = hv_balloon_hot_add_finish,
> +    [S_BALLOON_RB_WAIT].handler = hv_balloon_balloon_rb_wait,
> +    [S_BALLOON_POSTING].handler = hv_balloon_balloon_posting,
> +};
> +
> +static void hv_balloon_handle_state(HvBalloon *balloon, StateDesc *stdesc)
> +{
> +    if (!state_handlers[balloon->state].handler) {
> +        return;
> +    }
> +
> +    state_handlers[balloon->state].handler(balloon, stdesc);
> +}
> +
> +static void hv_balloon_remove_response_insert_range(PageRangeTree tree,
> +                                                    const PageRange *range,
> +                                                    uint64_t *ctr1,
> +                                                    uint64_t *ctr2,
> +                                                    uint64_t *ctr3)
> +{
> +    uint64_t dupcount, effcount;
> +
> +    if (range->count == 0) {
> +        return;
> +    }
> +
> +    dupcount = 0;
> +    page_range_tree_insert(tree, range->start, range->count, &dupcount);
> +
> +    assert(dupcount <= range->count);
> +    effcount = range->count - dupcount;
> +
> +    *ctr1 += effcount;
> +    *ctr2 += effcount;
> +    if (ctr3) {
> +        *ctr3 += effcount;
> +    }
> +}
> +
> +static void hv_balloon_remove_response_handle_range(HvBalloon *balloon,
> +                                                    PageRange *range,
> +                                                    bool both,
> +                                                    uint64_t *removedctr)
> +{
> +    GTreeNode *node;
> +    PageRangeTree globaltree = both ? balloon->removed_both :
> +        balloon->removed_guest;
> +    uint64_t *globalctr = both ? &balloon->removed_both_ctr :
> +        &balloon->removed_guest_ctr;
> +
> +    if (range->count == 0) {
> +        return;
> +    }
> +
> +    trace_hv_balloon_remove_response(range->count, range->start, both);
> +
> +    /* find the first node that can possibly intersect our range */
> +    node = g_tree_upper_bound(balloon->hapvdimms.t, &range->start);
> +    if (node) {
> +        /*
> +         * a NULL node below means that the very first node in the tree
> +         * already has a higher key (the start of its range).
> +         */
> +        node = g_tree_node_previous(node);
> +    } else {
> +        /* a NULL node below means that the tree is empty */
> +        node = g_tree_node_last(balloon->hapvdimms.t);
> +    }
> +    /* node range start <= range start */
> +
> +    if (!node) {
> +        /* node range start > range start */
> +        node = g_tree_node_first(balloon->hapvdimms.t);
> +    }
> +
> +    for ( ; node && range->count > 0; node = g_tree_node_next(node)) {
> +        HAPVDIMMRange *hpr = g_tree_node_value(node);
> +        PageRangeTree hprtree;
> +        PageRange rangeeff, rangehole, rangecommon;
> +        uint64_t hprremoved = 0;
> +
> +        assert(hpr);
> +        hprtree = both ? hpr->removed_both : hpr->removed_guest;
> +        hapvdimm_range_get_effective_range(hpr, &rangeeff);
> +
> +        /*
> +         * if this node starts beyond or at the end of the range so does
> +         * every next one
> +         */
> +        if (rangeeff.start >= range->start + range->count) {
> +            break;
> +        }
> +
> +        /* process the hole before the current hpr, if it exists */
> +        page_range_part_before(range, rangeeff.start, &rangehole);
> +        hv_balloon_remove_response_insert_range(globaltree, &rangehole,
> +                                                globalctr, removedctr, NULL);
> +        if (rangehole.count > 0) {
> +            trace_hv_balloon_remove_response_hole(rangehole.count,
> +                                                  rangehole.start,
> +                                                  range->count, range->start,
> +                                                  rangeeff.start, both);
> +        }
> +
> +        /*
> +         * process the hpr part, can be empty for the very first node processed
> +         * or due to difference between the nominal and effective hpr start
> +         */
> +        page_range_intersect(range, rangeeff.start, rangeeff.count,
> +                             &rangecommon);
> +        hv_balloon_remove_response_insert_range(hprtree, &rangecommon,
> +                                                globalctr, removedctr,
> +                                                &hprremoved);
> +        hpr->used -= hprremoved;
> +        if (rangecommon.count > 0) {
> +            trace_hv_balloon_remove_response_common(rangecommon.count,
> +                                                    rangecommon.start,
> +                                                    range->count, range->start,
> +                                                    rangeeff.count,
> +                                                    rangeeff.start, hprremoved,
> +                                                    both);
> +        }
> +
> +        /* calculate what's left after the current hpr */
> +        rangecommon = *range;
> +        page_range_part_after(&rangecommon, rangeeff.start, rangeeff.count,
> +                              range);
> +    }
> +
> +    /* process the remainder of the range that lies outside of the hpr tree */
> +    if (range->count > 0) {
> +        hv_balloon_remove_response_insert_range(globaltree, range,
> +                                                globalctr, removedctr, NULL);
> +        trace_hv_balloon_remove_response_remainder(range->count, range->start,
> +                                                   both);
> +        range->count = 0;
> +    }
> +}
> +
> +static void hv_balloon_remove_response_handle_pages(HvBalloon *balloon,
> +                                                    PageRange *range,
> +                                                    uint64_t start,
> +                                                    uint64_t count,
> +                                                    bool both,
> +                                                    uint64_t *removedctr)
> +{
> +    assert(count > 0);
> +
> +    /*
> +     * if there is an existing range that the new range can't be joined to
> +     * dump it into tree(s)
> +     */
> +    if (range->count > 0 && !page_range_joinable(range, start, count)) {
> +        hv_balloon_remove_response_handle_range(balloon, range, both,
> +                                                removedctr);
> +    }
> +
> +    if (range->count == 0) {
> +        range->start = start;
> +        range->count = count;
> +    } else if (page_range_joinable_left(range, start, count)) {
> +        range->start = start;
> +        range->count += count;
> +    } else { /* page_range_joinable_right() */
> +        range->count += count;
> +    }
> +}
> +
> +static gboolean hv_balloon_handle_remove_host_addr_node(gpointer key,
> +                                                        gpointer value,
> +                                                        gpointer data)
> +{
> +    PageRange *range = value;
> +    uint64_t pageoff;
> +
> +    for (pageoff = 0; pageoff < range->count; ) {
> +        void *addr = (void *)((range->start + pageoff) * HV_BALLOON_PAGE_SIZE);
> +        RAMBlock *rb;
> +        ram_addr_t rb_offset;
> +        size_t rb_page_size;
> +        size_t discard_size;
> +
> +        rb = qemu_ram_block_from_host(addr, false, &rb_offset);
> +        rb_page_size = qemu_ram_pagesize(rb);
> +
> +        if (rb_page_size != HV_BALLOON_PAGE_SIZE) {
> +            /* TODO: these should end in "removed_guest" */
> +            warn_report("guest reported removed page backed by unsupported page size %zu",
> +                        rb_page_size);
> +            pageoff++;
> +            continue;
> +        }
> +
> +        discard_size = MIN(range->count - pageoff,
> +                           (rb->max_length - rb_offset) /
> +                           HV_BALLOON_PAGE_SIZE);
> +        discard_size = MAX(discard_size, 1);
> +
> +        if (ram_block_discard_range(rb, rb_offset, discard_size *
> +                                    HV_BALLOON_PAGE_SIZE) != 0) {
> +            warn_report("guest reported removed page failed discard");
> +        }
> +
> +        pageoff += discard_size;
> +    }
> +
> +    return false;
> +}
> +
> +static void hv_balloon_handle_remove_host_addr_tree(PageRangeTree tree)
> +{
> +    g_tree_foreach(tree.t, hv_balloon_handle_remove_host_addr_node, NULL);
> +}
> +
> +static int hv_balloon_handle_remove_section(PageRangeTree tree,
> +                                            const MemoryRegionSection *section,
> +                                            uint64_t count)
> +{
> +    void *addr = memory_region_get_ram_ptr(section->mr) +
> +        section->offset_within_region;
> +    uint64_t addr_page;
> +
> +    assert(count > 0);
> +
> +    if ((uintptr_t)addr % HV_BALLOON_PAGE_SIZE) {
> +        warn_report("guest reported removed pages at an unaligned host addr %p",
> +                    addr);
> +        return -EINVAL;
> +    }
> +
> +    addr_page = (uintptr_t)addr / HV_BALLOON_PAGE_SIZE;
> +    page_range_tree_insert(tree, addr_page, count, NULL);
> +
> +    return 0;
> +}
> +
> +static void hv_balloon_handle_remove_ranges(HvBalloon *balloon,
> +                                            union dm_mem_page_range ranges[],
> +                                            uint32_t count)
> +{
> +    uint64_t removedcnt;
> +    PageRangeTree removed_host_addr;
> +    PageRange range_guest, range_both;
> +
> +    removed_host_addr = page_range_tree_new();
> +    range_guest.count = range_both.count = removedcnt = 0;
> +    for (unsigned int ctr = 0; ctr < count; ctr++) {
> +        union dm_mem_page_range *mr = &ranges[ctr];
> +        hwaddr pa;
> +        MemoryRegionSection section;
> +
> +        for (unsigned int offset = 0; offset < mr->finfo.page_cnt; ) {
> +            int ret;
> +            uint64_t pageno = mr->finfo.start_page + offset;
> +            uint64_t pagecnt = 1;
> +
> +            pa = (hwaddr)pageno << HV_BALLOON_PFN_SHIFT;
> +            section = memory_region_find(get_system_memory(), pa,
> +                                         (mr->finfo.page_cnt - offset) *
> +                                         HV_BALLOON_PAGE_SIZE);
> +            if (!section.mr) {
> +                warn_report("guest reported removed page %"PRIu64" not found in RAM",
> +                            pageno);
> +                ret = -EINVAL;
> +                goto finish_page;
> +            }
> +
> +            pagecnt = section.size / HV_BALLOON_PAGE_SIZE;
> +            if (pagecnt <= 0) {
> +                warn_report("guest reported removed page %"PRIu64" in a section smaller than page size",
> +                            pageno);
> +                pagecnt = 1; /* skip the whole page */
> +                ret = -EINVAL;
> +                goto finish_page;
> +            }
> +
> +            if (!memory_region_is_ram(section.mr) ||
> +                memory_region_is_rom(section.mr) ||
> +                memory_region_is_romd(section.mr)) {
> +                warn_report("guest reported removed page %"PRIu64" in a section that is not an ordinary RAM",
> +                            pageno);
> +                ret = -EINVAL;
> +                goto finish_page;
> +            }
> +
> +            ret = hv_balloon_handle_remove_section(removed_host_addr, &section,
> +                                                   pagecnt);
> +
> +        finish_page:
> +            if (ret == 0) {
> +                hv_balloon_remove_response_handle_pages(balloon,
> +                                                        &range_both,
> +                                                        pageno, pagecnt,
> +                                                        true, &removedcnt);
> +            } else {
> +                hv_balloon_remove_response_handle_pages(balloon,
> +                                                        &range_guest,
> +                                                        pageno, pagecnt,
> +                                                        false, &removedcnt);
> +            }
> +
> +            if (section.mr) {
> +                memory_region_unref(section.mr);
> +            }
> +
> +            offset += pagecnt;
> +        }
> +    }
> +
> +    hv_balloon_remove_response_handle_range(balloon, &range_both, true,
> +                                            &removedcnt);
> +    hv_balloon_remove_response_handle_range(balloon, &range_guest, false,
> +                                            &removedcnt);
> +
> +    hv_balloon_handle_remove_host_addr_tree(removed_host_addr);
> +    page_range_tree_destroy(&removed_host_addr);
> +
> +    if (removedcnt > balloon->target_diff) {
> +        warn_report("guest reported more pages removed than currently pending (%"PRIu64" vs %"PRIu64")",
> +                    removedcnt, balloon->target_diff);
> +        balloon->target_diff = 0;
> +    } else {
> +        balloon->target_diff -= removedcnt;
> +    }
> +}
> +
> +static bool hv_balloon_handle_msg_size(HvBalloonReq *req, size_t minsize,
> +                                       const char *msgname)
> +{
> +    VMBusChanReq *vmreq = &req->vmreq;
> +    uint32_t msglen = vmreq->msglen;
> +
> +    if (msglen >= minsize) {
> +        return true;
> +    }
> +
> +    warn_report("%s message too short (%u vs %zu), ignoring", msgname,
> +                (unsigned int)msglen, minsize);
> +    return false;
> +}
> +
> +static void hv_balloon_handle_version_request(HvBalloon *balloon,
> +                                              HvBalloonReq *req,
> +                                              StateDesc *stdesc)
> +{
> +    VMBusChanReq *vmreq = &req->vmreq;
> +    struct dm_version_request *msgVr = vmreq->msg;
> +    struct dm_version_response respVr;
> +
> +    if (balloon->state != S_VERSION) {
> +        warn_report("unexpected DM_VERSION_REQUEST in %d state",
> +                    balloon->state);
> +        return;
> +    }
> +
> +    if (!hv_balloon_handle_msg_size(req, sizeof(*msgVr),
> +                                    "DM_VERSION_REQUEST")) {
> +        return;
> +    }
> +
> +    trace_hv_balloon_incoming_version(msgVr->version.major_version,
> +                                      msgVr->version.minor_version);
> +
> +    memset(&respVr, 0, sizeof(respVr));
> +    respVr.hdr.type = DM_VERSION_RESPONSE;
> +    respVr.hdr.size = sizeof(respVr);
> +    respVr.hdr.trans_id = msgVr->hdr.trans_id;
> +    respVr.is_accepted = msgVr->version.version >= DYNMEM_PROTOCOL_VERSION_1 &&
> +        msgVr->version.version <= DYNMEM_PROTOCOL_VERSION_3;
> +
> +    hv_balloon_send_packet(vmreq->chan, (struct dm_message *)&respVr);
> +
> +    if (respVr.is_accepted) {
> +        HV_BALLOON_STATE_DESC_SET(stdesc, S_CAPS);
> +    }
> +}
> +
> +static void hv_balloon_handle_caps_report(HvBalloon *balloon,
> +                                          HvBalloonReq *req,
> +                                          StateDesc *stdesc)
> +{
> +    VMBusChanReq *vmreq = &req->vmreq;
> +    struct dm_capabilities *msgCap = vmreq->msg;
> +    struct dm_capabilities_resp_msg respCap;
> +
> +    if (balloon->state != S_CAPS) {
> +        warn_report("unexpected DM_CAPABILITIES_REPORT in %d state",
> +                    balloon->state);
> +        return;
> +    }
> +
> +    if (!hv_balloon_handle_msg_size(req, sizeof(*msgCap),
> +                                    "DM_CAPABILITIES_REPORT")) {
> +        return;
> +    }
> +
> +    trace_hv_balloon_incoming_caps(msgCap->caps.caps);
> +    balloon->caps = msgCap->caps;
> +
> +    memset(&respCap, 0, sizeof(respCap));
> +    respCap.hdr.type = DM_CAPABILITIES_RESPONSE;
> +    respCap.hdr.size = sizeof(respCap);
> +    respCap.hdr.trans_id = msgCap->hdr.trans_id;
> +    respCap.is_accepted = 1;
> +    respCap.hot_remove = 1;
> +    respCap.suppress_pressure_reports = !balloon->status_reports;
> +    hv_balloon_send_packet(vmreq->chan, (struct dm_message *)&respCap);
> +
> +    if (balloon->caps.cap_bits.hot_add) {
> +        ha_todo_add_all(balloon);
> +    }
> +
> +    timer_mod(&balloon->post_init_timer,
> +              qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
> +              HV_BALLOON_POST_INIT_WAIT);
> +
> +    HV_BALLOON_STATE_DESC_SET(stdesc, S_POST_INIT_WAIT);
> +}
> +
> +static void hv_balloon_handle_status_report(HvBalloon *balloon,
> +                                            HvBalloonReq *req)
> +{
> +    VMBusChanReq *vmreq = &req->vmreq;
> +    struct dm_status *msgStatus = vmreq->msg;
> +
> +    if (!hv_balloon_handle_msg_size(req, sizeof(*msgStatus),
> +                                    "DM_STATUS_REPORT")) {
> +        return;
> +    }
> +
> +    if (!balloon->status_reports) {
> +        return;
> +    }
> +
> +    qapi_event_send_hv_balloon_status_report((uint64_t)msgStatus->num_committed *
> +                                             HV_BALLOON_PAGE_SIZE,
> +                                             (uint64_t)msgStatus->num_avail *
> +                                             HV_BALLOON_PAGE_SIZE);
> +}
> +
> +static void hv_balloon_handle_unballoon_response(HvBalloon *balloon,
> +                                                 HvBalloonReq *req,
> +                                                 StateDesc *stdesc)
> +{
> +    VMBusChanReq *vmreq = &req->vmreq;
> +    struct dm_unballoon_response *msgUrR = vmreq->msg;
> +
> +    if (balloon->state != S_UNBALLOON_REPLY_WAIT) {
> +        warn_report("unexpected DM_UNBALLOON_RESPONSE in %d state",
> +                    balloon->state);
> +        return;
> +    }
> +
> +    if (!hv_balloon_handle_msg_size(req, sizeof(*msgUrR),
> +                                    "DM_UNBALLOON_RESPONSE"))
> +        return;
> +
> +    trace_hv_balloon_incoming_unballoon(msgUrR->hdr.trans_id);
> +
> +    balloon->trans_id++;
> +    HV_BALLOON_STATE_DESC_SET(stdesc, S_IDLE);
> +}
> +
> +static void hv_balloon_handle_hot_add_response(HvBalloon *balloon,
> +                                               HvBalloonReq *req,
> +                                               StateDesc *stdesc)
> +{
> +    VMBusChanReq *vmreq = &req->vmreq;
> +    struct dm_hot_add_response *msgHaR = vmreq->msg;
> +    HAPVDIMMRange *hpr;
> +
> +    if (balloon->state != S_HOT_ADD_REPLY_WAIT) {
> +        warn_report("unexpected DM_HOT_ADD_RESPONSE in %d state",
> +                    balloon->state);
> +        return;
> +    }
> +
> +    if (!hv_balloon_handle_msg_size(req, sizeof(*msgHaR),
> +                                    "DM_HOT_ADD_RESPONSE"))
> +        return;
> +
> +    trace_hv_balloon_incoming_hot_add(msgHaR->hdr.trans_id, msgHaR->result,
> +                                      msgHaR->page_count);
> +
> +    balloon->trans_id++;
> +
> +    assert(balloon->ha_todo);
> +    hpr = balloon->ha_todo->data;
> +
> +    if (msgHaR->result) {
> +        if (msgHaR->page_count > balloon->ha_current_count) {
> +            warn_report("DM_HOT_ADD_RESPONSE page count higher than requested (%"PRIu32" vs %"PRIu64")",
> +                        msgHaR->page_count, balloon->ha_current_count);
> +            msgHaR->page_count = balloon->ha_current_count;
> +        }
> +
> +        hpr->used += msgHaR->page_count;
> +    }
> +
> +    if (!msgHaR->result || msgHaR->page_count < balloon->ha_current_count) {
> +        if (hpr->used == 0) {
> +            /*
> +             * apparently the guest didn't like the current range at all,
> +             * let's try the next one
> +             */
> +            HV_BALLOON_STATE_DESC_SET(stdesc, S_HOT_ADD_SKIP_CURRENT);
> +            return;
> +        }
> +
> +        /*
> +         * the current planned range was only partially hot-added, take note
> +         * how much of it remains and don't attempt any further hot adds
> +         */
> +        hpr->unused_tail = hpr->range.count - hpr->unused_head - hpr->used;
> +
> +        HV_BALLOON_STATE_DESC_SET(stdesc, S_HOT_ADD_PROCESSED_CLEAR_PENDING);
> +        return;
> +    }
> +
> +    /* any pages remaining in this hpr? */
> +    if (hpr->range.count - hpr->unused_head - hpr->used -
> +        hpr->unused_tail > 0) {
> +        HV_BALLOON_STATE_DESC_SET(stdesc, S_HOT_ADD_RB_WAIT);
> +    } else {
> +        HV_BALLOON_STATE_DESC_SET(stdesc, S_HOT_ADD_PROCESSED_NEXT);
> +    }
> +}
> +
> +static void hv_balloon_handle_balloon_response(HvBalloon *balloon,
> +                                               HvBalloonReq *req,
> +                                               StateDesc *stdesc)
> +{
> +    VMBusChanReq *vmreq = &req->vmreq;
> +    struct dm_balloon_response *msgBR = vmreq->msg;
> +
> +    if (balloon->state != S_BALLOON_REPLY_WAIT) {
> +        warn_report("unexpected DM_BALLOON_RESPONSE in %d state",
> +                    balloon->state);
> +        return;
> +    }
> +
> +    if (!hv_balloon_handle_msg_size(req, sizeof(*msgBR),
> +                                    "DM_BALLOON_RESPONSE"))
> +        return;
> +
> +    trace_hv_balloon_incoming_balloon(msgBR->hdr.trans_id, msgBR->range_count,
> +                                      msgBR->more_pages);
> +
> +    if (vmreq->msglen < sizeof(*msgBR) +
> +        (uint64_t)sizeof(msgBR->range_array[0]) * msgBR->range_count) {
> +        warn_report("DM_BALLOON_RESPONSE too short for the range count");
> +        return;
> +    }
> +
> +    if (msgBR->range_count == 0) {
> +        /* The guest is already at its minimum size */
> +        msgBR->more_pages = 0;
> +        balloon->target_diff = 0;
> +    } else {
> +        hv_balloon_handle_remove_ranges(balloon,
> +                                        msgBR->range_array,
> +                                        msgBR->range_count);
> +    }
> +
> +    if (!msgBR->more_pages) {
> +        balloon->trans_id++;
> +
> +        if (balloon->target_diff > 0) {
> +            HV_BALLOON_STATE_DESC_SET(stdesc, S_BALLOON_RB_WAIT);
> +        } else {
> +            HV_BALLOON_STATE_DESC_SET(stdesc, S_IDLE);
> +        }
> +    }
> +}
> +
> +static void hv_balloon_handle_packet(HvBalloon *balloon, HvBalloonReq *req,
> +                                     StateDesc *stdesc)
> +{
> +    VMBusChanReq *vmreq = &req->vmreq;
> +    struct dm_message *msg = vmreq->msg;
> +
> +    if (vmreq->msglen < sizeof(msg->hdr)) {
> +        return;
> +    }
> +
> +    switch (msg->hdr.type) {
> +    case DM_VERSION_REQUEST:
> +        hv_balloon_handle_version_request(balloon, req, stdesc);
> +        break;
> +
> +    case DM_CAPABILITIES_REPORT:
> +        hv_balloon_handle_caps_report(balloon, req, stdesc);
> +        break;
> +
> +    case DM_STATUS_REPORT:
> +        hv_balloon_handle_status_report(balloon, req);
> +        break;
> +
> +    case DM_MEM_HOT_ADD_RESPONSE:
> +        hv_balloon_handle_hot_add_response(balloon, req, stdesc);
> +        break;
> +
> +    case DM_UNBALLOON_RESPONSE:
> +        hv_balloon_handle_unballoon_response(balloon, req, stdesc);
> +        break;
> +
> +    case DM_BALLOON_RESPONSE:
> +        hv_balloon_handle_balloon_response(balloon, req, stdesc);
> +        break;
> +
> +    default:
> +        warn_report("unknown DM message %u", msg->hdr.type);
> +        break;
> +    }
> +}
> +
> +static bool hv_balloon_recv_channel(HvBalloon *balloon, StateDesc *stdesc)
> +{
> +    VMBusChannel *chan;
> +    HvBalloonReq *req;
> +
> +    if (balloon->state == S_WAIT_RESET ||
> +        balloon->state == S_CLOSED) {
> +        return false;
> +    }
> +
> +    chan = hv_balloon_get_channel(balloon);
> +    if (vmbus_channel_recv_start(chan)) {
> +        return false;
> +    }
> +
> +    while ((req = vmbus_channel_recv_peek(chan, sizeof(*req)))) {
> +        hv_balloon_handle_packet(balloon, req, stdesc);
> +        vmbus_free_req(req);
> +        vmbus_channel_recv_pop(chan);
> +
> +        if (stdesc->state != S_NO_CHANGE) {
> +            break;
> +        }
> +    }
> +
> +    return vmbus_channel_recv_done(chan) > 0;
> +}
> +
> +static bool hv_balloon_event_loop_state(HvBalloon *balloon)
> +{
> +    StateDesc state_new = HV_BALLOON_STATE_DESC_INIT;
> +
> +    hv_balloon_handle_state(balloon, &state_new);
> +    return hv_balloon_state_set(balloon, state_new.state, state_new.desc);
> +}
> +
> +static bool hv_balloon_event_loop_recv(HvBalloon *balloon)
> +{
> +    StateDesc state_new = HV_BALLOON_STATE_DESC_INIT;
> +    bool any_recv, state_changed;
> +
> +    any_recv = hv_balloon_recv_channel(balloon, &state_new);
> +    state_changed = hv_balloon_state_set(balloon,
> +                                         state_new.state, state_new.desc);
> +
> +    return state_changed || any_recv;
> +}
> +
> +static void hv_balloon_event_loop(HvBalloon *balloon)
> +{
> +    bool state_repeat, recv_repeat;
> +
> +    do {
> +        state_repeat = hv_balloon_event_loop_state(balloon);
> +        recv_repeat = hv_balloon_event_loop_recv(balloon);
> +    } while (state_repeat || recv_repeat);
> +}
> +
> +void qmp_hv_balloon_add_memory(const char *id, Error **errp)
> +{
> +    HvBalloon *balloon;
> +    uint64_t align;
> +    g_autofree gchar *align_str = NULL;
> +    g_autoptr(QDict) qdict = NULL;
> +    g_autoptr(DeviceState) dev = NULL;
> +    HAPVDIMMDevice *hapvdimm;
> +    PageRange range;
> +    HAPVDIMMRange *hpr;
> +
> +    balloon = HV_BALLOON(object_resolve_path_type("", TYPE_HV_BALLOON, NULL));
> +    if (!balloon) {
> +        error_setg(errp, "no %s device present", TYPE_HV_BALLOON);
> +        return;
> +    }
> +
> +    if (hv_balloon_state_is_init(balloon)) {
> +        error_setg(errp, "no guest attached to the DM protocol yet");
> +        return;
> +    }
> +
> +    if (!balloon->caps.cap_bits.hot_add) {
> +        error_setg(errp,
> +                   "the current DM protocol guest has no support for memory hot add");
> +        return;
> +    }
> +
> +    /* add device */
> +    qdict = qdict_new();
> +    qdict_put_str(qdict, "driver", TYPE_HAPVDIMM);
> +    qdict_put_str(qdict, HAPVDIMM_MEMDEV_PROP, id);
> +
> +    align = (1 << balloon->caps.cap_bits.hot_add_alignment) * MiB;
> +    align_str = g_strdup_printf("%" PRIu64, align);
> +    qdict_put_str(qdict, HAPVDIMM_ALIGN_PROP, align_str);
> +
> +    hapvdimm_allow_adding();
> +    dev = qdev_device_add_from_qdict(qdict, false, errp);
> +    hapvdimm_disallow_adding();
> +    if (!dev) {
> +        return;
> +    }
> +
> +    hapvdimm = HAPVDIMM(dev);
> +
> +    hapvdimm_get_range(hapvdimm, &range);
> +    if (page_range_tree_intree_any(balloon->removed_guest,
> +                                   range.start, range.count) ||
> +        page_range_tree_intree_any(balloon->removed_both,
> +                                   range.start, range.count)) {
> +        error_setg(errp,
> +                   "some of the device new pages were already returned by the guest. this should not happen, please reboot the guest and try again");
> +        return;
> +    }
> +
> +    trace_hv_balloon_hapvdimm_range_add(range.count, range.start);
> +
> +    hpr = hapvdimm_tree_insert_new(balloon, hapvdimm);
> +
> +    balloon->ha_todo = g_slist_append(balloon->ha_todo, hpr);
> +
> +    hv_balloon_event_loop(balloon);
> +}
> +
> +static void hv_balloon_notify_cb(VMBusChannel *chan)
> +{
> +    HvBalloon *balloon = HV_BALLOON(vmbus_channel_device(chan));
> +
> +    hv_balloon_event_loop(balloon);
> +}
> +
> +static void hv_balloon_stat(void *opaque, BalloonInfo *info)
> +{
> +    HvBalloon *balloon = opaque;
> +    info->actual = (hv_balloon_total_ram(balloon) - balloon->removed_both_ctr)
> +        << HV_BALLOON_PFN_SHIFT;
> +}
> +
> +static void hv_balloon_to_target(void *opaque, ram_addr_t target)
> +{
> +    HvBalloon *balloon = opaque;
> +    uint64_t target_pages = target >> HV_BALLOON_PFN_SHIFT;
> +
> +    if (!target_pages) {
> +        return;
> +    }
> +
> +    /*
> +     * always set target_changed, even with unchanged target, as the user
> +     * might be asking us to try again reaching it
> +     */
> +    balloon->target = target_pages;
> +    balloon->target_changed = true;
> +
> +    hv_balloon_event_loop(balloon);
> +}
> +
> +static int hv_balloon_open_channel(VMBusChannel *chan)
> +{
> +    HvBalloon *balloon = HV_BALLOON(vmbus_channel_device(chan));
> +
> +    if (balloon->state != S_CLOSED) {
> +        warn_report("guest trying to open a DM channel in invalid %d state",
> +                    balloon->state);
> +        return -EINVAL;
> +    }
> +
> +    HV_BALLOON_SET_STATE(balloon, S_VERSION);
> +    hv_balloon_event_loop(balloon);
> +
> +    return 0;
> +}
> +
> +static void hv_balloon_close_channel(VMBusChannel *chan)
> +{
> +    HvBalloon *balloon = HV_BALLOON(vmbus_channel_device(chan));
> +
> +    timer_del(&balloon->post_init_timer);
> +
> +    HV_BALLOON_SET_STATE(balloon, S_WAIT_RESET);
> +    hv_balloon_event_loop(balloon);
> +}
> +
> +static void hv_balloon_post_init_timer(void *opaque)
> +{
> +    HvBalloon *balloon = opaque;
> +
> +    if (balloon->state != S_POST_INIT_WAIT) {
> +        return;
> +    }
> +
> +    HV_BALLOON_SET_STATE(balloon, S_IDLE);
> +    hv_balloon_event_loop(balloon);
> +}
> +
> +static void hv_balloon_system_reset(void *opaque)
> +{
> +    HvBalloon *balloon = HV_BALLOON(opaque);
> +
> +    if (!balloon->hapvdimms_del_todo) {
> +        return;
> +    }
> +
> +    if (balloon->del_todo_process_timer) {
> +        return;
> +    }
> +
> +    balloon->del_todo_process_timer = g_idle_add(del_todo_process_timer,
> +                                                 balloon);
> +}
> +
> +static void hv_balloon_dev_realize(VMBusDevice *vdev, Error **errp)
> +{
> +    ERRP_GUARD();
> +    HvBalloon *balloon = HV_BALLOON(vdev);
> +    int ret;
> +
> +    /* used by hv_balloon_stat() */
> +    balloon->hapvdimms = hapvdimm_tree_new();
> +    balloon->state = S_WAIT_RESET;
> +
> +    ret = qemu_add_balloon_handler(hv_balloon_to_target, hv_balloon_stat,
> +                                   balloon);
> +    if (ret < 0) {
> +        /* This also protects against having multiple hv-balloon instances */
> +        error_setg(errp, "Only one balloon device is supported");
> +        goto ret_tree;
> +    }
> +
> +    timer_init_ms(&balloon->post_init_timer, QEMU_CLOCK_VIRTUAL,
> +                  hv_balloon_post_init_timer, balloon);
> +
> +    qemu_register_reset(hv_balloon_system_reset, balloon);
> +
> +    return;
> +
> +ret_tree:
> +    hapvdimm_tree_destroy(&balloon->hapvdimms);
> +}
> +
> +static void hv_balloon_reset_destroy_common(HvBalloon *balloon)
> +{
> +    ha_todo_clear(balloon);
> +    del_todo_add_all(balloon);
> +}
> +
> +static void hv_balloon_dev_reset(VMBusDevice *vdev)
> +{
> +    HvBalloon *balloon = HV_BALLOON(vdev);
> +
> +    page_range_tree_destroy(&balloon->removed_guest);
> +    page_range_tree_destroy(&balloon->removed_both);
> +    balloon->removed_guest = page_range_tree_new();
> +    balloon->removed_both = page_range_tree_new();
> +
> +    hv_balloon_reset_destroy_common(balloon);
> +
> +    balloon->trans_id = 0;
> +    balloon->removed_guest_ctr = 0;
> +    balloon->removed_both_ctr = 0;
> +
> +    HV_BALLOON_SET_STATE(balloon, S_CLOSED);
> +    hv_balloon_event_loop(balloon);
> +}
> +
> +static void hv_balloon_dev_unrealize(VMBusDevice *vdev)
> +{
> +    HvBalloon *balloon = HV_BALLOON(vdev);
> +
> +    qemu_unregister_reset(hv_balloon_system_reset, balloon);
> +
> +    hv_balloon_reset_destroy_common(balloon);
> +
> +    del_todo_process(balloon);
> +    assert(!balloon->del_todo_process_timer);
> +
> +    qemu_remove_balloon_handler(balloon);
> +
> +    page_range_tree_destroy(&balloon->removed_guest);
> +    page_range_tree_destroy(&balloon->removed_both);
> +    hapvdimm_tree_destroy(&balloon->hapvdimms);
> +}
> +
> +static Property hv_balloon_properties[] = {
> +    DEFINE_PROP_BOOL("status-report", HvBalloon,
> +                     status_reports, false),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void hv_balloon_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    VMBusDeviceClass *vdc = VMBUS_DEVICE_CLASS(klass);
> +
> +    device_class_set_props(dc, hv_balloon_properties);
> +    qemu_uuid_parse(HV_BALLOON_GUID, &vdc->classid);
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +    vdc->vmdev_realize = hv_balloon_dev_realize;
> +    vdc->vmdev_unrealize = hv_balloon_dev_unrealize;
> +    vdc->vmdev_reset = hv_balloon_dev_reset;
> +    vdc->open_channel = hv_balloon_open_channel;
> +    vdc->close_channel = hv_balloon_close_channel;
> +    vdc->chan_notify_cb = hv_balloon_notify_cb;
> +}
> +
> +static const TypeInfo hv_balloon_type_info = {
> +    .name = TYPE_HV_BALLOON,
> +    .parent = TYPE_VMBUS_DEVICE,
> +    .instance_size = sizeof(HvBalloon),
> +    .class_init = hv_balloon_class_init,
> +};
> +
> +static void hv_balloon_register_types(void)
> +{
> +    type_register_static(&hv_balloon_type_info);
> +}
> +
> +type_init(hv_balloon_register_types)
> diff --git a/hw/hyperv/meson.build b/hw/hyperv/meson.build
> index b43f119ea5..212e0ce51e 100644
> --- a/hw/hyperv/meson.build
> +++ b/hw/hyperv/meson.build
> @@ -2,3 +2,4 @@ specific_ss.add(when: 'CONFIG_HYPERV', if_true: files('hyperv.c'))
>  specific_ss.add(when: 'CONFIG_HYPERV_TESTDEV', if_true: files('hyperv_testdev.c'))
>  specific_ss.add(when: 'CONFIG_VMBUS', if_true: files('vmbus.c'))
>  specific_ss.add(when: 'CONFIG_SYNDBG', if_true: files('syndbg.c'))
> +specific_ss.add(when: 'CONFIG_HV_BALLOON', if_true: files('hv-balloon.c'))
> diff --git a/hw/hyperv/trace-events b/hw/hyperv/trace-events
> index b4c35ca8e3..3b98ac3689 100644
> --- a/hw/hyperv/trace-events
> +++ b/hw/hyperv/trace-events
> @@ -16,3 +16,19 @@ vmbus_gpadl_torndown(uint32_t gpadl_id) "gpadl #%d"
>  vmbus_open_channel(uint32_t chan_id, uint32_t gpadl_id, uint32_t target_vp) "channel #%d gpadl #%d target vp %d"
>  vmbus_channel_open(uint32_t chan_id, uint32_t status) "channel #%d status %d"
>  vmbus_close_channel(uint32_t chan_id) "channel #%d"
> +
> +# hv-balloon
> +hv_balloon_state_change(const char *tostr) "-> %s"
> +hv_balloon_incoming_version(uint16_t major, uint16_t minor) "incoming proto version %u.%u"
> +hv_balloon_incoming_caps(uint32_t caps) "incoming caps 0x%x"
> +hv_balloon_outgoing_unballoon(uint32_t trans_id, uint64_t count, uint64_t start, uint64_t rempages) "posting unballoon %"PRIu32" for %"PRIu64" @ 0x%"PRIx64", remaining %"PRIu64
> +hv_balloon_incoming_unballoon(uint32_t trans_id) "incoming unballoon response %"PRIu32
> +hv_balloon_outgoing_hot_add(uint32_t trans_id, uint64_t count, uint64_t start) "posting hot add %"PRIu32" for %"PRIu64" @ 0x%"PRIx64
> +hv_balloon_incoming_hot_add(uint32_t trans_id, uint32_t result, uint32_t count) "incoming hot add response %"PRIu32", result %"PRIu32", count %"PRIu32
> +hv_balloon_outgoing_balloon(uint32_t trans_id, uint64_t count, uint64_t rempages) "posting balloon %"PRIu32" for %"PRIu64", remaining %"PRIu64
> +hv_balloon_incoming_balloon(uint32_t trans_id, uint32_t range_count, uint32_t more_pages) "incoming balloon response %"PRIu32", ranges %"PRIu32", more %"PRIu32
> +hv_balloon_hapvdimm_range_add(uint64_t count, uint64_t start) "adding hapvdimm range %"PRIu64" @ 0x%"PRIx64
> +hv_balloon_remove_response(uint64_t count, uint64_t start, unsigned int both) "processing remove response range %"PRIu64" @ 0x%"PRIx64", both %u"
> +hv_balloon_remove_response_hole(uint64_t counthole, uint64_t starthole, uint64_t countrange, uint64_t startrange, uint64_t starthpr, unsigned int both) "response range hole %"PRIu64" @ 0x%"PRIx64" from range %"PRIu64" @ 0x%"PRIx64", before hpr start 0x%"PRIx64", both %u"
> +hv_balloon_remove_response_common(uint64_t countcommon, uint64_t startcommon, uint64_t countrange, uint64_t startrange, uint64_t counthpr, uint64_t starthpr, uint64_t removed, unsigned int both) "response common range %"PRIu64" @ 0x%"PRIx64" from range %"PRIu64" @ 0x%"PRIx64" with hpr %"PRIu64" @ 0x%"PRIx64", removed %"PRIu64", both %u"
> +hv_balloon_remove_response_remainder(uint64_t count, uint64_t start, unsigned int both) "remove response remaining range %"PRIu64" @ 0x%"PRIx64", both %u"
> diff --git a/meson.build b/meson.build
> index 6cb2b1a42f..2d9c01b6ec 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2550,7 +2550,8 @@ host_kconfig = \
>    ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=y'] : []) + \
>    (have_pvrdma ? ['CONFIG_PVRDMA=y'] : []) + \
>    (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : []) + \
> -  (vfio_user_server_allowed ? ['CONFIG_VFIO_USER_SERVER_ALLOWED=y'] : [])
> +  (vfio_user_server_allowed ? ['CONFIG_VFIO_USER_SERVER_ALLOWED=y'] : []) + \
> +  ('CONFIG_HV_BALLOON_POSSIBLE' in config_host ? ['CONFIG_HV_BALLOON_POSSIBLE=y'] : [])
>  
>  ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_ARCH' ]
>  
> @@ -4027,6 +4028,7 @@ summary_info += {'libudev':           libudev}
>  summary_info += {'FUSE lseek':        fuse_lseek.found()}
>  summary_info += {'selinux':           selinux}
>  summary_info += {'libdw':             libdw}
> +summary_info += {'hv-balloon support': config_host.has_key('CONFIG_HV_BALLOON_POSSIBLE')}
>  summary(summary_info, bool_yn: true, section: 'Dependencies')
>  
>  if not supported_cpus.contains(cpu)
> diff --git a/qapi/machine.json b/qapi/machine.json
> index b9228a5e46..04ff95337a 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1104,6 +1104,74 @@
>  { 'event': 'BALLOON_CHANGE',
>    'data': { 'actual': 'int' } }
>  
> +##
> +# @hv-balloon-add-memory:
> +#
> +# Hot-add memory backend via Hyper-V Dynamic Memory Protocol.
> +#
> +# @id: the name of the memory backend object to hot-add
> +#
> +# Returns: Nothing on success
> +#          Error if there's no guest connected with hot-add capability,
> +#          @id is not a valid memory backend or it's already in use.
> +#
> +# Since: TBD
> +#
> +# Example:
> +#
> +# -> { "execute": "hv-balloon-add-memory", "arguments": { "id": "mb1" } }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'hv-balloon-add-memory', 'data': {'id': 'str'} }
> +
> +##
> +# @HV_BALLOON_STATUS_REPORT:
> +#
> +# Emitted when the hv-balloon driver receives a "STATUS" message from
> +# the guest.
> +#
> +# @commited: the amount of memory in use inside the guest plus the amount
> +#            of the memory unusable inside the guest (ballooned out,
> +#            offline, etc.)
> +#
> +# @available: the amount of the memory inside the guest available for new
> +#             allocations ("free")
> +#
> +# Since: TBD
> +#
> +# Example:
> +#
> +# <- { "event": "HV_BALLOON_STATUS_REPORT",
> +#      "data": { "commited": 816640000, "available": 3333054464 },
> +#      "timestamp": { "seconds": 1600295492, "microseconds": 661044 } }
> +#
> +##
> +{ 'event': 'HV_BALLOON_STATUS_REPORT',
> +  'data': { 'commited': 'size', 'available': 'size' } }
> +
> +##
> +# @HV_BALLOON_MEMORY_BACKEND_UNUSED:
> +#
> +# Emitted when the hv-balloon driver marks a memory backend object
> +# unused so it can now be removed, if required.
> +#
> +# This can happen because the VM was restarted.
> +#
> +# @id: the memory backend object id
> +#
> +# Since: TBD
> +#
> +# Example:
> +#
> +# <- { "event": "HV_BALLOON_MEMORY_BACKEND_UNUSED",
> +#      "data": { "id": "mb1" },
> +#      "timestamp": { "seconds": 1600295492, "microseconds": 661044 } }
> +#
> +##
> +{ 'event': 'HV_BALLOON_MEMORY_BACKEND_UNUSED',
> +  'data': { 'id': 'str' } }
> +
>  ##
>  # @MemoryInfo:
>  #
> 


