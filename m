Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A8D39B427
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 09:41:11 +0200 (CEST)
Received: from localhost ([::1]:36524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp4S6-0005Db-Ik
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 03:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lp4Nl-0004nK-Bb
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 03:36:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lp4Ni-0001bt-EY
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 03:36:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622792197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xsgq0gK3Goz9Vn9RytOuDQBHVHCXduRGHRUJFlGFe4U=;
 b=b6ly3duM3STzFf0MlQJufDgQOnOqhA+HH9+6GQZzKYmBT1dgtFi+FUu8G/PdhegkJBCZDz
 6za/N/RstKRc/JEV1toGh3v6XDkKEYr+gBggXiBp0V7lUXbXXyoPaxQ+5bF2wim1571iCv
 bWELT3MO7PWKV5ZRpiPZYWY3FpEU2sc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-jfbmwsEqPgm98scZP0l5WA-1; Fri, 04 Jun 2021 03:36:36 -0400
X-MC-Unique: jfbmwsEqPgm98scZP0l5WA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03BE28049CC;
 Fri,  4 Jun 2021 07:36:35 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-212.pek2.redhat.com
 [10.72.12.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C9C260CC9;
 Fri,  4 Jun 2021 07:36:32 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 6/7] docs: Added eBPF documentation.
Date: Fri,  4 Jun 2021 15:36:16 +0800
Message-Id: <20210604073617.69622-7-jasowang@redhat.com>
In-Reply-To: <20210604073617.69622-1-jasowang@redhat.com>
References: <20210604073617.69622-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
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
Cc: Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Melnychenko <andrew@daynix.com>

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 docs/devel/ebpf_rss.rst | 125 ++++++++++++++++++++++++++++++++++++++++++++++++
 docs/devel/index.rst    |   1 +
 2 files changed, 126 insertions(+)
 create mode 100644 docs/devel/ebpf_rss.rst

diff --git a/docs/devel/ebpf_rss.rst b/docs/devel/ebpf_rss.rst
new file mode 100644
index 0000000..e009625
--- /dev/null
+++ b/docs/devel/ebpf_rss.rst
@@ -0,0 +1,125 @@
+===========================
+eBPF RSS virtio-net support
+===========================
+
+RSS(Receive Side Scaling) is used to distribute network packets to guest virtqueues
+by calculating packet hash. Usually every queue is processed then by a specific guest CPU core.
+
+For now there are 2 RSS implementations in qemu:
+- 'in-qemu' RSS (functions if qemu receives network packets, i.e. vhost=off)
+- eBPF RSS (can function with also with vhost=on)
+
+eBPF support (CONFIG_EBPF) is enabled by 'configure' script.
+To enable eBPF RSS support use './configure --enable-bpf'.
+
+If steering BPF is not set for kernel's TUN module, the TUN uses automatic selection
+of rx virtqueue based on lookup table built according to calculated symmetric hash
+of transmitted packets.
+If steering BPF is set for TUN the BPF code calculates the hash of packet header and
+returns the virtqueue number to place the packet to.
+
+Simplified decision formula:
+
+.. code:: C
+
+    queue_index = indirection_table[hash(<packet data>)%<indirection_table size>]
+
+
+Not for all packets, the hash can/should be calculated.
+
+Note: currently, eBPF RSS does not support hash reporting.
+
+eBPF RSS turned on by different combinations of vhost-net, vitrio-net and tap configurations:
+
+- eBPF is used:
+
+        tap,vhost=off & virtio-net-pci,rss=on,hash=off
+
+- eBPF is used:
+
+        tap,vhost=on & virtio-net-pci,rss=on,hash=off
+
+- 'in-qemu' RSS is used:
+
+        tap,vhost=off & virtio-net-pci,rss=on,hash=on
+
+- eBPF is used, hash population feature is not reported to the guest:
+
+        tap,vhost=on & virtio-net-pci,rss=on,hash=on
+
+If CONFIG_EBPF is not set then only 'in-qemu' RSS is supported.
+Also 'in-qemu' RSS, as a fallback, is used if the eBPF program failed to load or set to TUN.
+
+RSS eBPF program
+----------------
+
+RSS program located in ebpf/rss.bpf.skeleton.h generated by bpftool.
+So the program is part of the qemu binary.
+Initially, the eBPF program was compiled by clang and source code located at tools/ebpf/rss.bpf.c.
+Prerequisites to recompile the eBPF program (regenerate ebpf/rss.bpf.skeleton.h):
+
+        llvm, clang, kernel source tree, bpftool
+        Adjust Makefile.ebpf to reflect the location of the kernel source tree
+
+        $ cd tools/ebpf
+        $ make -f Makefile.ebpf
+
+Current eBPF RSS implementation uses 'bounded loops' with 'backward jump instructions' which present in the last kernels.
+Overall eBPF RSS works on kernels 5.8+.
+
+eBPF RSS implementation
+-----------------------
+
+eBPF RSS loading functionality located in ebpf/ebpf_rss.c and ebpf/ebpf_rss.h.
+
+The `struct EBPFRSSContext` structure that holds 4 file descriptors:
+
+- ctx - pointer of the libbpf context.
+- program_fd - file descriptor of the eBPF RSS program.
+- map_configuration - file descriptor of the 'configuration' map. This map contains one element of 'struct EBPFRSSConfig'. This configuration determines eBPF program behavior.
+- map_toeplitz_key - file descriptor of the 'Toeplitz key' map. One element of the 40byte key prepared for the hashing algorithm.
+- map_indirections_table - 128 elements of queue indexes.
+
+`struct EBPFRSSConfig` fields:
+
+- redirect - "boolean" value, should the hash be calculated, on false  - `default_queue` would be used as the final decision.
+- populate_hash - for now, not used. eBPF RSS doesn't support hash reporting.
+- hash_types - binary mask of different hash types. See `VIRTIO_NET_RSS_HASH_TYPE_*` defines. If for packet hash should not be calculated - `default_queue` would be used.
+- indirections_len - length of the indirections table, maximum 128.
+- default_queue - the queue index that used for packet that shouldn't be hashed. For some packets, the hash can't be calculated(g.e ARP).
+
+Functions:
+
+- `ebpf_rss_init()` - sets ctx to NULL, which indicates that EBPFRSSContext is not loaded.
+- `ebpf_rss_load()` - creates 3 maps and loads eBPF program from the rss.bpf.skeleton.h. Returns 'true' on success. After that, program_fd can be used to set steering for TAP.
+- `ebpf_rss_set_all()` - sets values for eBPF maps. `indirections_table` length is in EBPFRSSConfig. `toeplitz_key` is VIRTIO_NET_RSS_MAX_KEY_SIZE aka 40 bytes array.
+- `ebpf_rss_unload()` - close all file descriptors and set ctx to NULL.
+
+Simplified eBPF RSS workflow:
+
+.. code:: C
+
+    struct EBPFRSSConfig config;
+    config.redirect = 1;
+    config.hash_types = VIRTIO_NET_RSS_HASH_TYPE_UDPv4 | VIRTIO_NET_RSS_HASH_TYPE_TCPv4;
+    config.indirections_len = VIRTIO_NET_RSS_MAX_TABLE_LEN;
+    config.default_queue = 0;
+
+    uint16_t table[VIRTIO_NET_RSS_MAX_TABLE_LEN] = {...};
+    uint8_t key[VIRTIO_NET_RSS_MAX_KEY_SIZE] = {...};
+
+    struct EBPFRSSContext ctx;
+    ebpf_rss_init(&ctx);
+    ebpf_rss_load(&ctx);
+    ebpf_rss_set_all(&ctx, &config, table, key);
+    if (net_client->info->set_steering_ebpf != NULL) {
+        net_client->info->set_steering_ebpf(net_client, ctx->program_fd);
+    }
+    ...
+    ebpf_unload(&ctx);
+
+
+NetClientState SetSteeringEBPF()
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+For now, `set_steering_ebpf()` method supported by Linux TAP NetClientState. The method requires an eBPF program file descriptor as an argument.
diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index cbdbb90..791925d 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -43,3 +43,4 @@ Contents:
    qom
    block-coroutine-wrapper
    multi-process
+   ebpf_rss
-- 
2.7.4


