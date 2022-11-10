Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EA3624A7F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 20:19:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otD54-0001R6-Fw; Thu, 10 Nov 2022 14:19:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1otD4k-0001Od-Bx
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 14:18:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1otD4g-0006t1-ST
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 14:18:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668107934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PxiaKQ5NQWFDlvoa7YDCSpOuzuef3mGmBJCZ20SYVms=;
 b=U0jlC2lUI1LKGppvk0WdfTh+bR8ay7TQIFBObrrsFYdrurFG8TVWjyH9f6iQwbuZCTGIsG
 ON0858OaCB9RciUQhi0se5iRom+RMQnQHY3KXrdELL+RULfPjfcIzsIBOY47zuO5TUw5Tf
 8xrLP5ju9QuUtrZn/+5vtbz87m5TWM0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-460-nR36UUiQOh2m1qhjHrvsSQ-1; Thu, 10 Nov 2022 14:18:53 -0500
X-MC-Unique: nR36UUiQOh2m1qhjHrvsSQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 u20-20020adfc654000000b0022cc05e9119so614617wrg.16
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 11:18:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PxiaKQ5NQWFDlvoa7YDCSpOuzuef3mGmBJCZ20SYVms=;
 b=JcN4ob+EhreNzMhqwlX/agtvPbcT7657ZvRx79x1txiznJS8ZirXDekoZKAPsj7waZ
 fXINiMy225f14jU9s1OlKVD4V1vn8/EThyDv/a4fETFrqr5Uy62gAfSp0a8NyrZaYE3u
 t5lp7LOxn0DHz4waGKsMFdtngf2gOd3oKJw0EsYJ7bnO+gPhyzK/lYmkkeMEqv+oqNmX
 am3xYA4g4mFchcFm/rlpR852yd87JQghsPYafmwtFQfYXNrhlYu6LBztJ8XQGJvkOiea
 YdE03FxdCtJeFjq2gbuRR7nNV8kumdZACSWRH6k00LRTb9DyQNAPfKII6ueMq6YL296q
 FCbQ==
X-Gm-Message-State: ACrzQf3RWZxfW22NCginBl2iAOCBZDGrkH5EV82lUTtBrBCHaCR3qWTP
 IJPzDMWZI5k7KYuQEGaHWlE8kq4/Rz89TBHIFFtz9F+4Sbi7OPJHSPGKro7+QHF5ZzuBnkLTPQN
 dVFzs4ejaNoGj9X8=
X-Received: by 2002:a05:600c:3506:b0:3cf:70ac:7039 with SMTP id
 h6-20020a05600c350600b003cf70ac7039mr40356609wmq.145.1668107931893; 
 Thu, 10 Nov 2022 11:18:51 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5EwtPLip9K1d5j4cwAW2DGFhfG+MmUw1HNVo1pbwXx7kl8JvlS1bYWGCgj0s946HIQgyn7rg==
X-Received: by 2002:a05:600c:3506:b0:3cf:70ac:7039 with SMTP id
 h6-20020a05600c350600b003cf70ac7039mr40356579wmq.145.1668107931425; 
 Thu, 10 Nov 2022 11:18:51 -0800 (PST)
Received: from redhat.com ([2.52.3.250]) by smtp.gmail.com with ESMTPSA id
 z3-20020adfe543000000b0023538fb27c1sm16347891wrm.85.2022.11.10.11.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 11:18:50 -0800 (PST)
Date: Thu, 10 Nov 2022 14:18:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH for-7.2] Fix several typos in documentation (found by
 codespell)
Message-ID: <20221110141838-mutt-send-email-mst@kernel.org>
References: <20221110190825.879620-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221110190825.879620-1-sw@weilnetz.de>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Thu, Nov 10, 2022 at 08:08:25PM +0100, Stefan Weil wrote:
> Those typos are in files which are used to generate the QEMU manual.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Acked-by: Michael S. Tsirkin <mst@redhat.com>


> ---
> 
> I did not fix memory_region_init_resizeable_ram. That might be done after 7.2.
> 
> Stefan
> 
>  docs/devel/acpi-bits.rst       | 2 +-
>  docs/system/devices/can.rst    | 2 +-
>  hw/scsi/esp.c                  | 6 +++---
>  include/exec/memory.h          | 6 +++---
>  qapi/virtio.json               | 4 ++--
>  qemu-options.hx                | 6 +++---
>  tests/qtest/libqos/qgraph.h    | 2 +-
>  tests/qtest/libqos/virtio-9p.c | 2 +-
>  8 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
> index c9564d871a..5e22be8ef6 100644
> --- a/docs/devel/acpi-bits.rst
> +++ b/docs/devel/acpi-bits.rst
> @@ -132,7 +132,7 @@ Under ``tests/avocado/`` as the root we have:
>  
>     (a) They are python2.7 based scripts and not python 3 scripts.
>     (b) They are run from within the bios bits VM and is not subjected to QEMU
> -       build/test python script maintainance and dependency resolutions.
> +       build/test python script maintenance and dependency resolutions.
>     (c) They need not be loaded by avocado framework when running tests.
>  
>  
> diff --git a/docs/system/devices/can.rst b/docs/system/devices/can.rst
> index fe37af8223..24b0d4cf41 100644
> --- a/docs/system/devices/can.rst
> +++ b/docs/system/devices/can.rst
> @@ -169,7 +169,7 @@ and with bitrate switch::
>  
>    cangen can0 -b
>  
> -The test can be run viceversa, generate messages in the guest system and capture them
> +The test can be run vice-versa, generate messages in the guest system and capture them
>  in the host one and much more combinations.
>  
>  Links to other resources
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index e5b281e836..e52188d022 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -515,7 +515,7 @@ static void do_dma_pdma_cb(ESPState *s)
>          } else {
>              /*
>               * Extra message out bytes received: update cmdfifo_cdb_offset
> -             * and then switch to commmand phase
> +             * and then switch to command phase
>               */
>              s->cmdfifo_cdb_offset = fifo8_num_used(&s->cmdfifo);
>              s->rregs[ESP_RSTAT] = STAT_TC | STAT_CD;
> @@ -627,7 +627,7 @@ static void esp_do_dma(ESPState *s)
>          } else {
>              /*
>               * Extra message out bytes received: update cmdfifo_cdb_offset
> -             * and then switch to commmand phase
> +             * and then switch to command phase
>               */
>              s->cmdfifo_cdb_offset = fifo8_num_used(&s->cmdfifo);
>              s->rregs[ESP_RSTAT] = STAT_TC | STAT_CD;
> @@ -738,7 +738,7 @@ static void esp_do_nodma(ESPState *s)
>          } else {
>              /*
>               * Extra message out bytes received: update cmdfifo_cdb_offset
> -             * and then switch to commmand phase
> +             * and then switch to command phase
>               */
>              s->cmdfifo_cdb_offset = fifo8_num_used(&s->cmdfifo);
>              s->rregs[ESP_RSTAT] = STAT_TC | STAT_CD;
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 80fa75baa1..91f8a2395a 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -561,7 +561,7 @@ typedef void (*ReplayRamDiscard)(MemoryRegionSection *section, void *opaque);
>   * A #RamDiscardManager coordinates which parts of specific RAM #MemoryRegion
>   * regions are currently populated to be used/accessed by the VM, notifying
>   * after parts were discarded (freeing up memory) and before parts will be
> - * populated (consuming memory), to be used/acessed by the VM.
> + * populated (consuming memory), to be used/accessed by the VM.
>   *
>   * A #RamDiscardManager can only be set for a RAM #MemoryRegion while the
>   * #MemoryRegion isn't mapped yet; it cannot change while the #MemoryRegion is
> @@ -585,7 +585,7 @@ typedef void (*ReplayRamDiscard)(MemoryRegionSection *section, void *opaque);
>   * Listeners are called in multiples of the minimum granularity (unless it
>   * would exceed the registered range) and changes are aligned to the minimum
>   * granularity within the #MemoryRegion. Listeners have to prepare for memory
> - * becomming discarded in a different granularity than it was populated and the
> + * becoming discarded in a different granularity than it was populated and the
>   * other way around.
>   */
>  struct RamDiscardManagerClass {
> @@ -1247,7 +1247,7 @@ void memory_region_init_ram_flags_nomigrate(MemoryRegion *mr,
>                                              Error **errp);
>  
>  /**
> - * memory_region_init_resizeable_ram:  Initialize memory region with resizeable
> + * memory_region_init_resizeable_ram:  Initialize memory region with resizable
>   *                                     RAM.  Accesses into the region will
>   *                                     modify memory directly.  Only an initial
>   *                                     portion of this RAM is actually used.
> diff --git a/qapi/virtio.json b/qapi/virtio.json
> index 872c7e3623..019d2d1987 100644
> --- a/qapi/virtio.json
> +++ b/qapi/virtio.json
> @@ -321,7 +321,7 @@
>  #          },
>  #          "backend-features": {
>  #              "dev-features": [
> -#                  "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features negotation supported",
> +#                  "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features negotiation supported",
>  #                  "VIRTIO_NET_F_GSO: Handling GSO-type packets supported",
>  #                  "VIRTIO_NET_F_CTRL_MAC_ADDR: MAC address set through control channel",
>  #                  "VIRTIO_NET_F_GUEST_ANNOUNCE: Driver sending gratuitous packets supported",
> @@ -394,7 +394,7 @@
>  #          },
>  #          "host-features": {
>  #              "dev-features": [
> -#                  "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features negotation supported",
> +#                  "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features negotiation supported",
>  #                  "VIRTIO_NET_F_GSO: Handling GSO-type packets supported",
>  #                  "VIRTIO_NET_F_CTRL_MAC_ADDR: MAC address set through control channel",
>  #                  "VIRTIO_NET_F_GUEST_ANNOUNCE: Driver sending gratuitous packets supported",
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 8b8a4a5d01..7f99d15b23 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -139,7 +139,7 @@ SRST
>          interleave requirements before enabling the memory devices.
>  
>          ``targets.X=target`` provides the mapping to CXL host bridges
> -        which may be identified by the id provied in the -device entry.
> +        which may be identified by the id provided in the -device entry.
>          Multiple entries are needed to specify all the targets when
>          the fixed memory window represents interleaved memory. X is the
>          target index from 0.
> @@ -362,7 +362,7 @@ SRST
>    \ 
>  ``-numa cpu,node-id=node[,socket-id=x][,core-id=y][,thread-id=z]``
>    \ 
> -``-numa hmat-lb,initiator=node,target=node,hierarchy=hierarchy,data-type=tpye[,latency=lat][,bandwidth=bw]``
> +``-numa hmat-lb,initiator=node,target=node,hierarchy=hierarchy,data-type=type[,latency=lat][,bandwidth=bw]``
>    \ 
>  ``-numa hmat-cache,node-id=node,size=size,level=level[,associativity=str][,policy=str][,line=size]``
>      Define a NUMA node and assign RAM and VCPUs to it. Set the NUMA
> @@ -1785,7 +1785,7 @@ SRST
>      directory on host is made directly accessible by guest as a pass-through
>      file system by using the 9P network protocol for communication between
>      host and guests, if desired even accessible, shared by several guests
> -    simultaniously.
> +    simultaneously.
>  
>      Note that ``-virtfs`` is actually just a convenience shortcut for its
>      generalized form ``-fsdev -device virtio-9p-pci``.
> diff --git a/tests/qtest/libqos/qgraph.h b/tests/qtest/libqos/qgraph.h
> index 5c0046e989..287022a67c 100644
> --- a/tests/qtest/libqos/qgraph.h
> +++ b/tests/qtest/libqos/qgraph.h
> @@ -381,7 +381,7 @@ QOSGraphObject *qos_driver_new(QOSGraphNode *node, QOSGraphObject *parent,
>   * mind: only tests with a path down from the actual test case node (leaf) up
>   * to the graph's root node are actually executed by the qtest framework. And
>   * the qtest framework uses QMP to automatically check which QEMU drivers are
> - * actually currently available, and accordingly qos marks certain pathes as
> + * actually currently available, and accordingly qos marks certain paths as
>   * 'unavailable' in such cases (e.g. when QEMU was compiled without support for
>   * a certain feature).
>   */
> diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio-9p.c
> index ae9b0a20e2..7f21028256 100644
> --- a/tests/qtest/libqos/virtio-9p.c
> +++ b/tests/qtest/libqos/virtio-9p.c
> @@ -31,7 +31,7 @@
>  static QGuestAllocator *alloc;
>  static char *local_test_path;
>  
> -/* Concatenates the passed 2 pathes. Returned result must be freed. */
> +/* Concatenates the passed 2 paths. Returned result must be freed. */
>  static char *concat_path(const char* a, const char* b)
>  {
>      return g_build_filename(a, b, NULL);
> -- 
> 2.30.2


