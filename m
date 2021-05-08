Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDB8377053
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 09:22:03 +0200 (CEST)
Received: from localhost ([::1]:42508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfHHm-00051m-J2
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 03:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lfHEv-0007Tn-EG
 for qemu-devel@nongnu.org; Sat, 08 May 2021 03:19:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lfHEp-0003PF-Mu
 for qemu-devel@nongnu.org; Sat, 08 May 2021 03:19:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620458339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=KEue/w6pzltPYABgt5GOhAIYgli4YZtaXt7z+GL8fZY=;
 b=V59Yb0rWbTht8gBQDDTnW4fODalsnUp/q0K1gAGYv1jTbRFIRfhheSIEjqjJ6u/mFIAGdo
 JDlxh+hUwV8i8JC4rwziIShrOxuMJBmhqqh/bTsyNfO8xp7V6qbfIhFBKs4Eaf7T6oDBvr
 eqRnwkrEl7Mvqe6qyQ2tTjycajA/3Kw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-kJP8cL43Pj2PNaBEycjylw-1; Sat, 08 May 2021 03:18:55 -0400
X-MC-Unique: kJP8cL43Pj2PNaBEycjylw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C6E11883521;
 Sat,  8 May 2021 07:18:54 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-172.pek2.redhat.com
 [10.72.13.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E49C25C5FD;
 Sat,  8 May 2021 07:18:50 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 03/10] ebpf: Added eBPF RSS program.
Date: Sat,  8 May 2021 15:18:32 +0800
Message-Id: <1620458319-5670-4-git-send-email-jasowang@redhat.com>
In-Reply-To: <1620458319-5670-1-git-send-email-jasowang@redhat.com>
References: <1620458319-5670-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Jason Wang <jasowang@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Melnychenko <andrew@daynix.com>

RSS program and Makefile to build it.
The bpftool used to generate '.h' file.
The data in that file may be loaded by libbpf.
EBPF compilation is not required for building qemu.
You can use Makefile if you need to regenerate rss.bpf.skeleton.h.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 tools/ebpf/Makefile.ebpf |  21 ++
 tools/ebpf/rss.bpf.c     | 569 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 590 insertions(+)
 create mode 100755 tools/ebpf/Makefile.ebpf
 create mode 100644 tools/ebpf/rss.bpf.c

diff --git a/tools/ebpf/Makefile.ebpf b/tools/ebpf/Makefile.ebpf
new file mode 100755
index 0000000..8f327ae
--- /dev/null
+++ b/tools/ebpf/Makefile.ebpf
@@ -0,0 +1,21 @@
+OBJS = rss.bpf.o
+
+LLC ?= llc
+CLANG ?= clang
+INC_FLAGS = `$(CLANG) -print-file-name=include`
+EXTRA_CFLAGS ?= -O2 -emit-llvm -fno-stack-protector
+
+all: $(OBJS)
+
+.PHONY: clean
+
+clean:
+	rm -f $(OBJS)
+
+$(OBJS):  %.o:%.c
+	$(CLANG) $(INC_FLAGS) \
+                -D__KERNEL__ -D__ASM_SYSREG_H \
+                -I../include $(LINUXINCLUDE) \
+                $(EXTRA_CFLAGS) -c $< -o -| $(LLC) -march=bpf -filetype=obj -o $@
+	bpftool gen skeleton rss.bpf.o > rss.bpf.skeleton.h
+	cp rss.bpf.skeleton.h ../../ebpf/
diff --git a/tools/ebpf/rss.bpf.c b/tools/ebpf/rss.bpf.c
new file mode 100644
index 0000000..9d57ab4
--- /dev/null
+++ b/tools/ebpf/rss.bpf.c
@@ -0,0 +1,569 @@
+/*
+ * eBPF RSS program
+ *
+ * Developed by Daynix Computing LTD (http://www.daynix.com)
+ *
+ * Authors:
+ *  Andrew Melnychenko <andrew@daynix.com>
+ *  Yuri Benditovich <yuri.benditovich@daynix.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Prepare:
+ * Requires llvm, clang, bpftool, linux kernel tree
+ *
+ * Build rss.bpf.skeleton.h:
+ * make -f Makefile.ebpf clean all
+ */
+
+#include <stddef.h>
+#include <stdbool.h>
+#include <linux/bpf.h>
+
+#include <linux/in.h>
+#include <linux/if_ether.h>
+#include <linux/ip.h>
+#include <linux/ipv6.h>
+
+#include <linux/udp.h>
+#include <linux/tcp.h>
+
+#include <bpf/bpf_helpers.h>
+#include <bpf/bpf_endian.h>
+#include <linux/virtio_net.h>
+
+#define INDIRECTION_TABLE_SIZE 128
+#define HASH_CALCULATION_BUFFER_SIZE 36
+
+struct rss_config_t {
+    __u8 redirect;
+    __u8 populate_hash;
+    __u32 hash_types;
+    __u16 indirections_len;
+    __u16 default_queue;
+} __attribute__((packed));
+
+struct toeplitz_key_data_t {
+    __u32 leftmost_32_bits;
+    __u8 next_byte[HASH_CALCULATION_BUFFER_SIZE];
+};
+
+struct packet_hash_info_t {
+    __u8 is_ipv4;
+    __u8 is_ipv6;
+    __u8 is_udp;
+    __u8 is_tcp;
+    __u8 is_ipv6_ext_src;
+    __u8 is_ipv6_ext_dst;
+    __u8 is_fragmented;
+
+    __u16 src_port;
+    __u16 dst_port;
+
+    union {
+        struct {
+            __be32 in_src;
+            __be32 in_dst;
+        };
+
+        struct {
+            struct in6_addr in6_src;
+            struct in6_addr in6_dst;
+            struct in6_addr in6_ext_src;
+            struct in6_addr in6_ext_dst;
+        };
+    };
+};
+
+struct bpf_map_def SEC("maps")
+tap_rss_map_configurations = {
+        .type        = BPF_MAP_TYPE_ARRAY,
+        .key_size    = sizeof(__u32),
+        .value_size  = sizeof(struct rss_config_t),
+        .max_entries = 1,
+};
+
+struct bpf_map_def SEC("maps")
+tap_rss_map_toeplitz_key = {
+        .type        = BPF_MAP_TYPE_ARRAY,
+        .key_size    = sizeof(__u32),
+        .value_size  = sizeof(struct toeplitz_key_data_t),
+        .max_entries = 1,
+};
+
+struct bpf_map_def SEC("maps")
+tap_rss_map_indirection_table = {
+        .type        = BPF_MAP_TYPE_ARRAY,
+        .key_size    = sizeof(__u32),
+        .value_size  = sizeof(__u16),
+        .max_entries = INDIRECTION_TABLE_SIZE,
+};
+
+static inline void net_rx_rss_add_chunk(__u8 *rss_input, size_t *bytes_written,
+                                        const void *ptr, size_t size) {
+    __builtin_memcpy(&rss_input[*bytes_written], ptr, size);
+    *bytes_written += size;
+}
+
+static inline
+void net_toeplitz_add(__u32 *result,
+                      __u8 *input,
+                      __u32 len
+        , struct toeplitz_key_data_t *key) {
+
+    __u32 accumulator = *result;
+    __u32 leftmost_32_bits = key->leftmost_32_bits;
+    __u32 byte;
+
+    for (byte = 0; byte < HASH_CALCULATION_BUFFER_SIZE; byte++) {
+        __u8 input_byte = input[byte];
+        __u8 key_byte = key->next_byte[byte];
+        __u8 bit;
+
+        for (bit = 0; bit < 8; bit++) {
+            if (input_byte & (1 << 7)) {
+                accumulator ^= leftmost_32_bits;
+            }
+
+            leftmost_32_bits =
+                    (leftmost_32_bits << 1) | ((key_byte & (1 << 7)) >> 7);
+
+            input_byte <<= 1;
+            key_byte <<= 1;
+        }
+    }
+
+    *result = accumulator;
+}
+
+
+static inline int ip6_extension_header_type(__u8 hdr_type)
+{
+    switch (hdr_type) {
+    case IPPROTO_HOPOPTS:
+    case IPPROTO_ROUTING:
+    case IPPROTO_FRAGMENT:
+    case IPPROTO_ICMPV6:
+    case IPPROTO_NONE:
+    case IPPROTO_DSTOPTS:
+    case IPPROTO_MH:
+        return 1;
+    default:
+        return 0;
+    }
+}
+/*
+ * According to https://www.iana.org/assignments/ipv6-parameters/ipv6-parameters.xhtml
+ * we suspect that there are would be no more than 11 extensions in IPv6 header,
+ * also there is 27 TLV options for Destination and Hop-by-hop extensions.
+ * Need to choose reasonable amount of maximum extensions/options we may check to find
+ * ext src/dst.
+ */
+#define IP6_EXTENSIONS_COUNT 11
+#define IP6_OPTIONS_COUNT 30
+
+static inline int parse_ipv6_ext(struct __sk_buff *skb,
+        struct packet_hash_info_t *info,
+        __u8 *l4_protocol, size_t *l4_offset)
+{
+    int err = 0;
+
+    if (!ip6_extension_header_type(*l4_protocol)) {
+        return 0;
+    }
+
+    struct ipv6_opt_hdr ext_hdr = {};
+
+    for (unsigned int i = 0; i < IP6_EXTENSIONS_COUNT; ++i) {
+
+        err = bpf_skb_load_bytes_relative(skb, *l4_offset, &ext_hdr,
+                                    sizeof(ext_hdr), BPF_HDR_START_NET);
+        if (err) {
+            goto error;
+        }
+
+        if (*l4_protocol == IPPROTO_ROUTING) {
+            struct ipv6_rt_hdr ext_rt = {};
+
+            err = bpf_skb_load_bytes_relative(skb, *l4_offset, &ext_rt,
+                                        sizeof(ext_rt), BPF_HDR_START_NET);
+            if (err) {
+                goto error;
+            }
+
+            if ((ext_rt.type == IPV6_SRCRT_TYPE_2) &&
+                    (ext_rt.hdrlen == sizeof(struct in6_addr) / 8) &&
+                    (ext_rt.segments_left == 1)) {
+
+                err = bpf_skb_load_bytes_relative(skb,
+                    *l4_offset + offsetof(struct rt2_hdr, addr),
+                    &info->in6_ext_dst, sizeof(info->in6_ext_dst),
+                    BPF_HDR_START_NET);
+                if (err) {
+                    goto error;
+                }
+
+                info->is_ipv6_ext_dst = 1;
+            }
+
+        } else if (*l4_protocol == IPPROTO_DSTOPTS) {
+            struct ipv6_opt_t {
+                __u8 type;
+                __u8 length;
+            } __attribute__((packed)) opt = {};
+
+            size_t opt_offset = sizeof(ext_hdr);
+
+            for (unsigned int j = 0; j < IP6_OPTIONS_COUNT; ++j) {
+                err = bpf_skb_load_bytes_relative(skb, *l4_offset + opt_offset,
+                                        &opt, sizeof(opt), BPF_HDR_START_NET);
+                if (err) {
+                    goto error;
+                }
+
+                if (opt.type == IPV6_TLV_HAO) {
+                    err = bpf_skb_load_bytes_relative(skb,
+                        *l4_offset + opt_offset + offsetof(struct ipv6_destopt_hao, addr),
+                        &info->in6_ext_src, sizeof(info->in6_ext_src),
+                        BPF_HDR_START_NET);
+                    if (err) {
+                        goto error;
+                    }
+
+                    info->is_ipv6_ext_src = 1;
+                    break;
+                }
+
+                opt_offset += (opt.type == IPV6_TLV_PAD1) ?
+                              1 : opt.length + sizeof(opt);
+
+                if (opt_offset + 1 >= ext_hdr.hdrlen * 8) {
+                    break;
+                }
+            }
+        } else if (*l4_protocol == IPPROTO_FRAGMENT) {
+            info->is_fragmented = true;
+        }
+
+        *l4_protocol = ext_hdr.nexthdr;
+        *l4_offset += (ext_hdr.hdrlen + 1) * 8;
+
+        if (!ip6_extension_header_type(ext_hdr.nexthdr)) {
+            return 0;
+        }
+    }
+
+    return 0;
+error:
+    return err;
+}
+
+static __be16 parse_eth_type(struct __sk_buff *skb)
+{
+    unsigned int offset = 12;
+    __be16 ret = 0;
+    int err = 0;
+
+    err = bpf_skb_load_bytes_relative(skb, offset, &ret, sizeof(ret),
+                                BPF_HDR_START_MAC);
+    if (err) {
+        return 0;
+    }
+
+    switch (bpf_ntohs(ret)) {
+    case ETH_P_8021AD:
+        offset += 4;
+    case ETH_P_8021Q:
+        offset += 4;
+        err = bpf_skb_load_bytes_relative(skb, offset, &ret, sizeof(ret),
+                                    BPF_HDR_START_MAC);
+    default:
+        break;
+    }
+
+    if (err) {
+        return 0;
+    }
+
+    return ret;
+}
+
+static inline int parse_packet(struct __sk_buff *skb,
+        struct packet_hash_info_t *info)
+{
+    int err = 0;
+
+    if (!info || !skb) {
+        return -1;
+    }
+
+    size_t l4_offset = 0;
+    __u8 l4_protocol = 0;
+    __u16 l3_protocol = bpf_ntohs(parse_eth_type(skb));
+    if (l3_protocol == 0) {
+        err = -1;
+        goto error;
+    }
+
+    if (l3_protocol == ETH_P_IP) {
+        info->is_ipv4 = 1;
+
+        struct iphdr ip = {};
+        err = bpf_skb_load_bytes_relative(skb, 0, &ip, sizeof(ip),
+                                    BPF_HDR_START_NET);
+        if (err) {
+            goto error;
+        }
+
+        info->in_src = ip.saddr;
+        info->in_dst = ip.daddr;
+        info->is_fragmented = !!ip.frag_off;
+
+        l4_protocol = ip.protocol;
+        l4_offset = ip.ihl * 4;
+    } else if (l3_protocol == ETH_P_IPV6) {
+        info->is_ipv6 = 1;
+
+        struct ipv6hdr ip6 = {};
+        err = bpf_skb_load_bytes_relative(skb, 0, &ip6, sizeof(ip6),
+                                    BPF_HDR_START_NET);
+        if (err) {
+            goto error;
+        }
+
+        info->in6_src = ip6.saddr;
+        info->in6_dst = ip6.daddr;
+
+        l4_protocol = ip6.nexthdr;
+        l4_offset = sizeof(ip6);
+
+        err = parse_ipv6_ext(skb, info, &l4_protocol, &l4_offset);
+        if (err) {
+            goto error;
+        }
+    }
+
+    if (l4_protocol != 0 && !info->is_fragmented) {
+        if (l4_protocol == IPPROTO_TCP) {
+            info->is_tcp = 1;
+
+            struct tcphdr tcp = {};
+            err = bpf_skb_load_bytes_relative(skb, l4_offset, &tcp, sizeof(tcp),
+                                        BPF_HDR_START_NET);
+            if (err) {
+                goto error;
+            }
+
+            info->src_port = tcp.source;
+            info->dst_port = tcp.dest;
+        } else if (l4_protocol == IPPROTO_UDP) { /* TODO: add udplite? */
+            info->is_udp = 1;
+
+            struct udphdr udp = {};
+            err = bpf_skb_load_bytes_relative(skb, l4_offset, &udp, sizeof(udp),
+                                        BPF_HDR_START_NET);
+            if (err) {
+                goto error;
+            }
+
+            info->src_port = udp.source;
+            info->dst_port = udp.dest;
+        }
+    }
+
+    return 0;
+
+error:
+    return err;
+}
+
+static inline __u32 calculate_rss_hash(struct __sk_buff *skb,
+        struct rss_config_t *config, struct toeplitz_key_data_t *toe)
+{
+    __u8 rss_input[HASH_CALCULATION_BUFFER_SIZE] = {};
+    size_t bytes_written = 0;
+    __u32 result = 0;
+    int err = 0;
+    struct packet_hash_info_t packet_info = {};
+
+    err = parse_packet(skb, &packet_info);
+    if (err) {
+        return 0;
+    }
+
+    if (packet_info.is_ipv4) {
+        if (packet_info.is_tcp &&
+            config->hash_types & VIRTIO_NET_RSS_HASH_TYPE_TCPv4) {
+
+            net_rx_rss_add_chunk(rss_input, &bytes_written,
+                                 &packet_info.in_src,
+                                 sizeof(packet_info.in_src));
+            net_rx_rss_add_chunk(rss_input, &bytes_written,
+                                 &packet_info.in_dst,
+                                 sizeof(packet_info.in_dst));
+            net_rx_rss_add_chunk(rss_input, &bytes_written,
+                                 &packet_info.src_port,
+                                 sizeof(packet_info.src_port));
+            net_rx_rss_add_chunk(rss_input, &bytes_written,
+                                 &packet_info.dst_port,
+                                 sizeof(packet_info.dst_port));
+        } else if (packet_info.is_udp &&
+                   config->hash_types & VIRTIO_NET_RSS_HASH_TYPE_UDPv4) {
+
+            net_rx_rss_add_chunk(rss_input, &bytes_written,
+                                 &packet_info.in_src,
+                                 sizeof(packet_info.in_src));
+            net_rx_rss_add_chunk(rss_input, &bytes_written,
+                                 &packet_info.in_dst,
+                                 sizeof(packet_info.in_dst));
+            net_rx_rss_add_chunk(rss_input, &bytes_written,
+                                 &packet_info.src_port,
+                                 sizeof(packet_info.src_port));
+            net_rx_rss_add_chunk(rss_input, &bytes_written,
+                                 &packet_info.dst_port,
+                                 sizeof(packet_info.dst_port));
+        } else if (config->hash_types & VIRTIO_NET_RSS_HASH_TYPE_IPv4) {
+            net_rx_rss_add_chunk(rss_input, &bytes_written,
+                                 &packet_info.in_src,
+                                 sizeof(packet_info.in_src));
+            net_rx_rss_add_chunk(rss_input, &bytes_written,
+                                 &packet_info.in_dst,
+                                 sizeof(packet_info.in_dst));
+        }
+    } else if (packet_info.is_ipv6) {
+        if (packet_info.is_tcp &&
+            config->hash_types & VIRTIO_NET_RSS_HASH_TYPE_TCPv6) {
+
+            if (packet_info.is_ipv6_ext_src &&
+                config->hash_types & VIRTIO_NET_RSS_HASH_TYPE_TCP_EX) {
+
+                net_rx_rss_add_chunk(rss_input, &bytes_written,
+                                     &packet_info.in6_ext_src,
+                                     sizeof(packet_info.in6_ext_src));
+            } else {
+                net_rx_rss_add_chunk(rss_input, &bytes_written,
+                                     &packet_info.in6_src,
+                                     sizeof(packet_info.in6_src));
+            }
+            if (packet_info.is_ipv6_ext_dst &&
+                config->hash_types & VIRTIO_NET_RSS_HASH_TYPE_TCP_EX) {
+
+                net_rx_rss_add_chunk(rss_input, &bytes_written,
+                                     &packet_info.in6_ext_dst,
+                                     sizeof(packet_info.in6_ext_dst));
+            } else {
+                net_rx_rss_add_chunk(rss_input, &bytes_written,
+                                     &packet_info.in6_dst,
+                                     sizeof(packet_info.in6_dst));
+            }
+            net_rx_rss_add_chunk(rss_input, &bytes_written,
+                                 &packet_info.src_port,
+                                 sizeof(packet_info.src_port));
+            net_rx_rss_add_chunk(rss_input, &bytes_written,
+                                 &packet_info.dst_port,
+                                 sizeof(packet_info.dst_port));
+        } else if (packet_info.is_udp &&
+                   config->hash_types & VIRTIO_NET_RSS_HASH_TYPE_UDPv6) {
+
+            if (packet_info.is_ipv6_ext_src &&
+               config->hash_types & VIRTIO_NET_RSS_HASH_TYPE_UDP_EX) {
+
+                net_rx_rss_add_chunk(rss_input, &bytes_written,
+                                     &packet_info.in6_ext_src,
+                                     sizeof(packet_info.in6_ext_src));
+            } else {
+                net_rx_rss_add_chunk(rss_input, &bytes_written,
+                                     &packet_info.in6_src,
+                                     sizeof(packet_info.in6_src));
+            }
+            if (packet_info.is_ipv6_ext_dst &&
+               config->hash_types & VIRTIO_NET_RSS_HASH_TYPE_UDP_EX) {
+
+                net_rx_rss_add_chunk(rss_input, &bytes_written,
+                                     &packet_info.in6_ext_dst,
+                                     sizeof(packet_info.in6_ext_dst));
+            } else {
+                net_rx_rss_add_chunk(rss_input, &bytes_written,
+                                     &packet_info.in6_dst,
+                                     sizeof(packet_info.in6_dst));
+            }
+
+            net_rx_rss_add_chunk(rss_input, &bytes_written,
+                                 &packet_info.src_port,
+                                 sizeof(packet_info.src_port));
+            net_rx_rss_add_chunk(rss_input, &bytes_written,
+                                 &packet_info.dst_port,
+                                 sizeof(packet_info.dst_port));
+
+        } else if (config->hash_types & VIRTIO_NET_RSS_HASH_TYPE_IPv6) {
+            if (packet_info.is_ipv6_ext_src &&
+               config->hash_types & VIRTIO_NET_RSS_HASH_TYPE_IP_EX) {
+
+                net_rx_rss_add_chunk(rss_input, &bytes_written,
+                                     &packet_info.in6_ext_src,
+                                     sizeof(packet_info.in6_ext_src));
+            } else {
+                net_rx_rss_add_chunk(rss_input, &bytes_written,
+                                     &packet_info.in6_src,
+                                     sizeof(packet_info.in6_src));
+            }
+            if (packet_info.is_ipv6_ext_dst &&
+                config->hash_types & VIRTIO_NET_RSS_HASH_TYPE_IP_EX) {
+
+                net_rx_rss_add_chunk(rss_input, &bytes_written,
+                                     &packet_info.in6_ext_dst,
+                                     sizeof(packet_info.in6_ext_dst));
+            } else {
+                net_rx_rss_add_chunk(rss_input, &bytes_written,
+                                     &packet_info.in6_dst,
+                                     sizeof(packet_info.in6_dst));
+            }
+        }
+    }
+
+    if (bytes_written) {
+        net_toeplitz_add(&result, rss_input, bytes_written, toe);
+    }
+
+    return result;
+}
+
+SEC("tun_rss_steering")
+int tun_rss_steering_prog(struct __sk_buff *skb)
+{
+
+    struct rss_config_t *config;
+    struct toeplitz_key_data_t *toe;
+
+    __u32 key = 0;
+    __u32 hash = 0;
+
+    config = bpf_map_lookup_elem(&tap_rss_map_configurations, &key);
+    toe = bpf_map_lookup_elem(&tap_rss_map_toeplitz_key, &key);
+
+    if (config && toe) {
+        if (!config->redirect) {
+            return config->default_queue;
+        }
+
+        hash = calculate_rss_hash(skb, config, toe);
+        if (hash) {
+            __u32 table_idx = hash % config->indirections_len;
+            __u16 *queue = 0;
+
+            queue = bpf_map_lookup_elem(&tap_rss_map_indirection_table,
+                                        &table_idx);
+
+            if (queue) {
+                return *queue;
+            }
+        }
+
+        return config->default_queue;
+    }
+
+    return -1;
+}
+
+char _license[] SEC("license") = "GPL v2";
-- 
2.7.4


