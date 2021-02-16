Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A96B31D173
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 21:18:29 +0100 (CET)
Received: from localhost ([::1]:51692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC6nj-0002uH-RS
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 15:18:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <toke@redhat.com>) id 1lC6mq-0002NW-E3
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 15:17:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <toke@redhat.com>) id 1lC6mm-0004TK-87
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 15:17:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613506645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=HDrwh59RkrdsVMleJaOKC8fyTERbpULXsSVbMBMD7HQ=;
 b=aesmAMnRi03KyxY6NkUSeFAOKLP96sWldc8v3oS8zB/Wx4dflfF7dE7Wk88yHI+G4HizHt
 au7qn61wPM86sVV05wLc6gNydagyqXoFjfVdI3uIm3a5lWL2T1DWSAe9A9rcLqhdeYGDyW
 YEaWkk08yGUcexc4vMbahpFRGuKMTEA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-DP9H1QNxNf6zY2TnZQfLnQ-1; Tue, 16 Feb 2021 15:17:22 -0500
X-MC-Unique: DP9H1QNxNf6zY2TnZQfLnQ-1
Received: by mail-ed1-f70.google.com with SMTP id dk21so1783191edb.10
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 12:17:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:date:message-id
 :mime-version;
 bh=HDrwh59RkrdsVMleJaOKC8fyTERbpULXsSVbMBMD7HQ=;
 b=JdYkFW9qME1mUs/XiNSOYT2X3U3QC7gDu8JKYHFTQxgwTeNhmm8vIc/ZqeD2ZwvU/r
 G0NIy/bqpAH/bd09IU2LG30Rs1/lO2V6Q/Su83ODSHI2O6I1YepRTV4lzUiFnRgoisi+
 xDxnTqer0t3p/dy9lnpqxwtYl6fKZYzAFaO4w4UwG85X5UxvaZCHjFNNwg68Xjszzobn
 8DS6nFbhSO2kW55rkv0rU4zbwFGV+RJzOecTHl2DohxNxa6uZWGsExKBhgJxOBVrL4NN
 MZUMR7TqHa3SPNeZ8qneaTN8/+ghAimW5dHMfWJ+Mj+p+duTaArugo4w6GWLpEi72EGp
 J+CA==
X-Gm-Message-State: AOAM531L/DAk4Fh7cEx1muhZxahv4pMuGPMPIzRhxbEMlEDBGM71SVBw
 NA9WhvN+DYlDLLaL6M2yuT0bwUXIf09iekhgefZXIGmlcbzGfmKTJDDiFTpvSbkRxqcSxLyKAgt
 0s1cgrbmp7/ZIVgs=
X-Received: by 2002:a17:906:70d4:: with SMTP id
 g20mr22657867ejk.361.1613506640855; 
 Tue, 16 Feb 2021 12:17:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCsd3NbHjOySVJzcXA0AWlBbQRo/2QXaETNg2l554JaL+YP7Yk+2xkwc6sjD4kD+Y1HN6gUw==
X-Received: by 2002:a17:906:70d4:: with SMTP id
 g20mr22657840ejk.361.1613506640533; 
 Tue, 16 Feb 2021 12:17:20 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
 by smtp.gmail.com with ESMTPSA id mb8sm5728637ejb.120.2021.02.16.12.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 12:17:19 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
 id 7FFDE180760; Tue, 16 Feb 2021 21:17:18 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: andrew@daynix.com
Subject: Re: [RFC PATCH v4 3/7] ebpf: Added eBPF RSS program.
In-Reply-To: 20210204170951.91805-4-andrew@daynix.com
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 16 Feb 2021 21:17:18 +0100
Message-ID: <87r1lfahtd.fsf@toke.dk>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=toke@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=toke@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, mst@redhat.com,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 yuri.benditovich@daynix.com, yan@daynix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Andrew <andrew@daynix.com>
> 
> RSS program and Makefile to build it.
> The bpftool used to generate '.h' file.
> The data in that file may be loaded by libbpf.
> EBPF compilation is not required for building qemu.
> You can use Makefile if you need to regenerate rss.bpf.skeleton.h.
> 
> Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>

A few comments on the BPF implementation:

> ---
>  tools/ebpf/Makefile.ebpf |  33 +++
>  tools/ebpf/rss.bpf.c     | 505 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 538 insertions(+)
>  create mode 100755 tools/ebpf/Makefile.ebpf
>  create mode 100644 tools/ebpf/rss.bpf.c
> 
> diff --git a/tools/ebpf/Makefile.ebpf b/tools/ebpf/Makefile.ebpf
> new file mode 100755
> index 0000000000..d32d1680b8
> --- /dev/null
> +++ b/tools/ebpf/Makefile.ebpf
> @@ -0,0 +1,33 @@
> +OBJS = rss.bpf.o
> +
> +LLC ?= llc
> +CLANG ?= clang
> +INC_FLAGS = `$(CLANG) -print-file-name=include`
> +EXTRA_CFLAGS ?= -O2 -emit-llvm -fno-stack-protector
> +
> +ifdef linuxhdrs
> +LINUXINCLUDE =  -I $(linuxhdrs)/arch/x86/include/uapi \
> +                -I $(linuxhdrs)/arch/x86/include/generated/uapi \
> +                -I $(linuxhdrs)/arch/x86/include/generated \
> +                -I $(linuxhdrs)/include/generated/uapi \
> +                -I $(linuxhdrs)/include/uapi \
> +                -I $(linuxhdrs)/include \
> +                -I $(linuxhdrs)/tools/lib
> +INC_FLAGS += -nostdinc -isystem
> +endif

It should be possible to set things up so you don't need a full set of
kernel headers to build stuff. What we usually do for BPF projects is to
just include the headers we need in a separate directory, clearly marked
as originating from the kernel tree. That way you don't incur a
dependency on the full kernel-headers, and users won't run into issues
where their kernel headers are too old. See an example here:

https://github.com/xdp-project/bpf-examples/tree/master/headers

> +
> +all: $(OBJS)
> +
> +.PHONY: clean
> +
> +clean:
> +       rm -f $(OBJS)
> +
> +$(OBJS):  %.o:%.c
> +       $(CLANG) $(INC_FLAGS) \
> +                -D__KERNEL__ -D__ASM_SYSREG_H \
> +                -I../include $(LINUXINCLUDE) \
> +                $(EXTRA_CFLAGS) -c $< -o -| $(LLC) -march=bpf -filetype=obj -o 
> $@
> +       bpftool gen skeleton rss.bpf.o > rss.bpf.skeleton.h
> +       cp rss.bpf.skeleton.h ../../ebpf/
> +
> diff --git a/tools/ebpf/rss.bpf.c b/tools/ebpf/rss.bpf.c
> new file mode 100644
> index 0000000000..eb377247fc
> --- /dev/null
> +++ b/tools/ebpf/rss.bpf.c
> @@ -0,0 +1,505 @@
> +/*
> + * eBPF RSS program
> + *
> + * Developed by Daynix Computing LTD (http://www.daynix.com)
> + *
> + * Authors:
> + *  Andrew Melnychenko <andrew@daynix.com>
> + *  Yuri Benditovich <yuri.benditovich@daynix.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + * Prepare:
> + * Requires llvm, clang, bpftool, linux kernel tree
> + *
> + * Build rss.bpf.skeleton.h:
> + * make -f Makefile.ebpf clean all
> + */
> +
> +#include <stddef.h>
> +#include <stdbool.h>
> +#include <linux/bpf.h>
> +
> +#include <linux/in.h>
> +#include <linux/if_ether.h>
> +#include <linux/ip.h>
> +#include <linux/ipv6.h>
> +
> +#include <linux/udp.h>
> +#include <linux/tcp.h>
> +
> +#include <bpf/bpf_helpers.h>
> +#include <linux/virtio_net.h>
> +
> +#define INDIRECTION_TABLE_SIZE 128
> +#define HASH_CALCULATION_BUFFER_SIZE 36
> +
> +struct rss_config_t {
> +    __u8 redirect;
> +    __u8 populate_hash;

two-byte hole here...

> +    __u32 hash_types;
> +    __u16 indirections_len;
> +    __u16 default_queue;
> +};
> +
> +struct toeplitz_key_data_t {
> +    __u32 leftmost_32_bits;
> +    __u8 next_byte[HASH_CALCULATION_BUFFER_SIZE];
> +};
> +
> +struct packet_hash_info_t {
> +    __u8 is_ipv4;
> +    __u8 is_ipv6;
> +    __u8 is_udp;
> +    __u8 is_tcp;
> +    __u8 is_ipv6_ext_src;
> +    __u8 is_ipv6_ext_dst;
> +
> +    __u16 src_port;
> +    __u16 dst_port;

...and there's going to be a hole here as well I think.

> +    union {
> +        struct {
> +            __be32 in_src;
> +            __be32 in_dst;
> +        };
> +
> +        struct {
> +            struct in6_addr in6_src;
> +            struct in6_addr in6_dst;
> +            struct in6_addr in6_ext_src;
> +            struct in6_addr in6_ext_dst;
> +        };
> +    };
> +};
> +
> +struct bpf_map_def SEC("maps")
> +tap_rss_map_configurations = {
> +        .type        = BPF_MAP_TYPE_ARRAY,
> +        .key_size    = sizeof(__u32),
> +        .value_size  = sizeof(struct rss_config_t),
> +        .max_entries = 1,
> +};
> +
> +struct bpf_map_def SEC("maps")
> +tap_rss_map_toeplitz_key = {
> +        .type        = BPF_MAP_TYPE_ARRAY,
> +        .key_size    = sizeof(__u32),
> +        .value_size  = sizeof(struct toeplitz_key_data_t),
> +        .max_entries = 1,
> +};

Which version of LLVM and libbpf are you targeting?

Libbpf 0.0.3 (which is almost two years old now) added support for
relocations of global data section, so instead of defining these
one-element maps you could just define the config structs as global
variables and use them like you would from regular C code:

https://github.com/libbpf/libbpf/commit/d99a28343f07b333ee8c520397f4e307d132bf05

The bpftool skeleton generation will include the rodata and memory-map
the backing map, so that when you're populating it from userspace you
don't need to do map updates either, you can just write the memory
(before you load the program).

If your config is not going to change after the program is loaded, you
can mark the global variable as 'const', which will put it into .rodata
and freeze the map. This in turn will be taken into account by the
verifier, which will do dead code elimination based on the constants; so
you can eliminate whole branches of BPF code entirely based on the
config, instead of having to do the runtime checks - and without having
to change much in the code! :)


> +struct bpf_map_def SEC("maps")
> +tap_rss_map_indirection_table = {
> +        .type        = BPF_MAP_TYPE_ARRAY,
> +        .key_size    = sizeof(__u32),
> +        .value_size  = sizeof(__u16),
> +        .max_entries = INDIRECTION_TABLE_SIZE,
> +};
> +
> +static inline void net_rx_rss_add_chunk(__u8 *rss_input, size_t *bytes_written,
> +                                        const void *ptr, size_t size) {
> +    __builtin_memcpy(&rss_input[*bytes_written], ptr, size);
> +    *bytes_written += size;
> +}
> +
> +static inline
> +void net_toeplitz_add(__u32 *result,
> +                      __u8 *input,
> +                      __u32 len
> +        , struct toeplitz_key_data_t *key) {
> +
> +    __u32 accumulator = *result;
> +    __u32 leftmost_32_bits = key->leftmost_32_bits;
> +    __u32 byte;
> +
> +    for (byte = 0; byte < HASH_CALCULATION_BUFFER_SIZE; byte++) {
> +        __u8 input_byte = input[byte];
> +        __u8 key_byte = key->next_byte[byte];
> +        __u8 bit;
> +
> +        for (bit = 0; bit < 8; bit++) {
> +            if (input_byte & (1 << 7)) {
> +                accumulator ^= leftmost_32_bits;
> +            }
> +
> +            leftmost_32_bits =
> +                    (leftmost_32_bits << 1) | ((key_byte & (1 << 7)) >> 7);
> +
> +            input_byte <<= 1;
> +            key_byte <<= 1;
> +        }
> +    }
> +
> +    *result = accumulator;
> +}
> +
> +
> +static inline int ip6_extension_header_type(__u8 hdr_type)
> +{
> +    switch (hdr_type) {
> +    case IPPROTO_HOPOPTS:
> +    case IPPROTO_ROUTING:
> +    case IPPROTO_FRAGMENT:
> +    case IPPROTO_ICMPV6:
> +    case IPPROTO_NONE:
> +    case IPPROTO_DSTOPTS:
> +    case IPPROTO_MH:
> +        return 1;
> +    default:
> +        return 0;
> +    }
> +}
> +/*
> + * According to 
> https://www.iana.org/assignments/ipv6-parameters/ipv6-parameters.xhtml
> + * we suspect that there are would be no more than 11 extensions in IPv6 
> header,
> + * also there is 27 TLV options for Destination and Hop-by-hop extensions.
> + * Need to choose reasonable amount of maximum extensions/options we may check 
> to find
> + * ext src/dst.
> + */
> +#define IP6_EXTENSIONS_COUNT 11
> +#define IP6_OPTIONS_COUNT 30

You're being very generous here; IMO it would be quite reasonable to
bail out way before this. With these, and this being a nested loop,
that's potentially 330 rounds in the loop for each packet; did you test
what the worst-case overhead of that is?

> +static inline void parse_ipv6_ext(struct __sk_buff *skb,
> +        struct packet_hash_info_t *info,
> +        __u8 *l4_protocol, size_t *l4_offset)
> +{
> +    if (!ip6_extension_header_type(*l4_protocol)) {
> +        return;
> +    }
> +
> +    struct ipv6_opt_hdr ext_hdr = {};
> +
> +    for (unsigned int i = 0; i < IP6_EXTENSIONS_COUNT; ++i) {
> +
> +        bpf_skb_load_bytes_relative(skb, *l4_offset, &ext_hdr,
> +                                    sizeof(ext_hdr), BPF_HDR_START_NET);

These can fail, but you're not checking the return values (here, and
below). So if they do fail you'll just happily carry on parsing garbage
(or zeroes, in this case)... Furthermore, your break condition below is
the check in ip6_extension_header_type(), which includes IPPROTO_HOPOPTS
as a valid header type. And since this is defined to 0, if the load
fails here (and ext_hdr is thus all-zeroes), the loop will continue even
though you've reached the end of the packet.

The right thing to do is to always check the return value of
bpf_skb_load_bytes_relative() and bail if it returns non-0.

> +
> +        if (*l4_protocol == IPPROTO_ROUTING) {
> +            struct ipv6_rt_hdr ext_rt = {};
> +
> +            bpf_skb_load_bytes_relative(skb, *l4_offset, &ext_rt,
> +                                        sizeof(ext_rt), BPF_HDR_START_NET);
> +
> +            if ((ext_rt.type == IPV6_SRCRT_TYPE_2) &&
> +                    (ext_rt.hdrlen == sizeof(struct in6_addr) / 8) &&
> +                    (ext_rt.segments_left == 1)) {
> +
> +                bpf_skb_load_bytes_relative(skb,
> +                    *l4_offset + offsetof(struct rt2_hdr, addr),
> +                    &info->in6_ext_dst, sizeof(info->in6_ext_dst),
> +                    BPF_HDR_START_NET);
> +
> +                info->is_ipv6_ext_dst = 1;
> +            }
> +
> +        } else if (*l4_protocol == IPPROTO_DSTOPTS) {
> +            struct ipv6_opt_t {
> +                __u8 type;
> +                __u8 length;
> +            } __attribute__((packed)) opt = {};
> +
> +            size_t opt_offset = sizeof(ext_hdr);
> +
> +            for (unsigned int j = 0; j < IP6_OPTIONS_COUNT; ++j) {
> +                bpf_skb_load_bytes_relative(skb, *l4_offset + opt_offset,
> +                                        &opt, sizeof(opt), BPF_HDR_START_NET);
> +
> +                opt_offset += (opt.type == IPV6_TLV_PAD1) ?
> +                        1 : opt.length + sizeof(opt);
> +
> +                if (opt_offset + 1 >= ext_hdr.hdrlen * 8) {
> +                    break;
> +                }
> +
> +                if (opt.type == IPV6_TLV_HAO) {
> +                    bpf_skb_load_bytes_relative(skb,
> +                        *l4_offset + opt_offset + offsetof(struct 
> ipv6_destopt_hao, addr),
> +                        &info->is_ipv6_ext_src, sizeof(info->is_ipv6_ext_src),
> +                        BPF_HDR_START_NET);
> +
> +                    info->is_ipv6_ext_src = 1;
> +                    break;
> +                }
> +            }
> +        }
> +
> +        *l4_protocol = ext_hdr.nexthdr;
> +        *l4_offset += (ext_hdr.hdrlen + 1) * 8;
> +
> +        if (!ip6_extension_header_type(ext_hdr.nexthdr)) {
> +            return;
> +        }
> +    }
> +}
> +
> +static __be16 parse_eth_type(struct __sk_buff *skb)
> +{
> +    unsigned int offset = 12;
> +    __be16 ret = 0;
> +
> +    bpf_skb_load_bytes_relative(skb, offset, &ret, sizeof(ret),
> +                                BPF_HDR_START_MAC);
> +
> +    switch (__be16_to_cpu(ret)) {
> +    case ETH_P_8021AD:
> +        offset += 4;
> +    case ETH_P_8021Q:
> +        offset += 4;
> +        bpf_skb_load_bytes_relative(skb, offset, &ret, sizeof(ret),
> +                                    BPF_HDR_START_MAC);
> +    default:
> +        break;
> +    }

When doing endian conversions, I'd recommend using the BPF-specific
macros (bpf_hton{s,l}() and bpf_nton{s,l}() from bpf_endian.h, shipped
with libbpf), and byte-converting the constants instead of the
variables. Those helpers will take into account the BPF endianness, and
the constants will be converted at compile-time, saving the runtime
conversion overhead on little-endian architectures. So instead of the
switch above, you could write:

    switch (ret) {
    case bpf_htons(ETH_P_8021AD):
        offset += 4;
    case bpf_htons(ETH_P_8021Q):
        offset += 4;
        bpf_skb_load_bytes_relative(skb, offset, &ret, sizeof(ret),
                                    BPF_HDR_START_MAC);
    default:
        break;
    }

> +
> +    return ret;
> +}
> +
> +static inline void parse_packet(struct __sk_buff *skb,
> +        struct packet_hash_info_t *info)
> +{
> +    if (!info || !skb) {
> +        return;
> +    }
> +
> +    size_t l4_offset = 0;
> +    __u8 l4_protocol = 0;
> +    __u16 l3_protocol = __be16_to_cpu(parse_eth_type(skb));

Same byte-conversion point as above.

> +
> +    if (l3_protocol == ETH_P_IP) {
> +        info->is_ipv4 = 1;
> +
> +        struct iphdr ip = {};
> +        bpf_skb_load_bytes_relative(skb, 0, &ip, sizeof(ip),
> +                                    BPF_HDR_START_NET);
> +
> +        info->in_src = ip.saddr;
> +        info->in_dst = ip.daddr;
> +
> +        l4_protocol = ip.protocol;
> +        l4_offset = ip.ihl * 4;
> +    } else if (l3_protocol == ETH_P_IPV6) {
> +        info->is_ipv6 = 1;
> +
> +        struct ipv6hdr ip6 = {};
> +        bpf_skb_load_bytes_relative(skb, 0, &ip6, sizeof(ip6),
> +                                    BPF_HDR_START_NET);
> +
> +        info->in6_src = ip6.saddr;
> +        info->in6_dst = ip6.daddr;
> +
> +        l4_protocol = ip6.nexthdr;
> +        l4_offset = sizeof(ip6);
> +
> +        parse_ipv6_ext(skb, info, &l4_protocol, &l4_offset);
> +    }
> +
> +    if (l4_protocol != 0) {
> +        if (l4_protocol == IPPROTO_TCP) {
> +            info->is_tcp = 1;
> +
> +            struct tcphdr tcp = {};
> +            bpf_skb_load_bytes_relative(skb, l4_offset, &tcp, sizeof(tcp),
> +                                        BPF_HDR_START_NET);
> +
> +            info->src_port = tcp.source;
> +            info->dst_port = tcp.dest;
> +        } else if (l4_protocol == IPPROTO_UDP) { /* TODO: add udplite? */
> +            info->is_udp = 1;
> +
> +            struct udphdr udp = {};
> +            bpf_skb_load_bytes_relative(skb, l4_offset, &udp, sizeof(udp),
> +                                        BPF_HDR_START_NET);
> +
> +            info->src_port = udp.source;
> +            info->dst_port = udp.dest;
> +        }
> +    }
> +}
> +
> +static inline __u32 calculate_rss_hash(struct __sk_buff *skb,
> +        struct rss_config_t *config, struct toeplitz_key_data_t *toe)
> +{
> +    __u8 rss_input[HASH_CALCULATION_BUFFER_SIZE] = {};
> +    size_t bytes_written = 0;
> +    __u32 result = 0;
> +    struct packet_hash_info_t packet_info = {};
> +
> +    parse_packet(skb, &packet_info);
> +
> +    if (packet_info.is_ipv4) {
> +        if (packet_info.is_tcp &&
> +            config->hash_types & VIRTIO_NET_RSS_HASH_TYPE_TCPv4) {

These branches would be the candidates for dead code elimination based
on the config (provided that is static). I'm not sure if the verifier is
smart enough to do it with bitmask tests like these, but if not it's
simple enough to swap those out for separate variables...

> +            net_rx_rss_add_chunk(rss_input, &bytes_written,
> +                                 &packet_info.in_src,
> +                                 sizeof(packet_info.in_src));
> +            net_rx_rss_add_chunk(rss_input, &bytes_written,
> +                                 &packet_info.in_dst,
> +                                 sizeof(packet_info.in_dst));
> +            net_rx_rss_add_chunk(rss_input, &bytes_written,
> +                                 &packet_info.src_port,
> +                                 sizeof(packet_info.src_port));
> +            net_rx_rss_add_chunk(rss_input, &bytes_written,
> +                                 &packet_info.dst_port,
> +                                 sizeof(packet_info.dst_port));
> +        } else if (packet_info.is_udp &&
> +                   config->hash_types & VIRTIO_NET_RSS_HASH_TYPE_UDPv4) {
> +
> +            net_rx_rss_add_chunk(rss_input, &bytes_written,
> +                                 &packet_info.in_src,
> +                                 sizeof(packet_info.in_src));
> +            net_rx_rss_add_chunk(rss_input, &bytes_written,
> +                                 &packet_info.in_dst,
> +                                 sizeof(packet_info.in_dst));
> +            net_rx_rss_add_chunk(rss_input, &bytes_written,
> +                                 &packet_info.src_port,
> +                                 sizeof(packet_info.src_port));
> +            net_rx_rss_add_chunk(rss_input, &bytes_written,
> +                                 &packet_info.dst_port,
> +                                 sizeof(packet_info.dst_port));
> +        } else if (config->hash_types & VIRTIO_NET_RSS_HASH_TYPE_IPv4) {
> +            net_rx_rss_add_chunk(rss_input, &bytes_written,
> +                                 &packet_info.in_src,
> +                                 sizeof(packet_info.in_src));
> +            net_rx_rss_add_chunk(rss_input, &bytes_written,
> +                                 &packet_info.in_dst,
> +                                 sizeof(packet_info.in_dst));
> +        }
> +    } else if (packet_info.is_ipv6) {
> +        if (packet_info.is_tcp &&
> +            config->hash_types & VIRTIO_NET_RSS_HASH_TYPE_TCPv6) {
> +
> +            if (packet_info.is_ipv6_ext_src &&
> +                config->hash_types & VIRTIO_NET_RSS_HASH_TYPE_TCP_EX) {
> +
> +                net_rx_rss_add_chunk(rss_input, &bytes_written,
> +                                     &packet_info.in6_ext_src,
> +                                     sizeof(packet_info.in6_ext_src));
> +            } else {
> +                net_rx_rss_add_chunk(rss_input, &bytes_written,
> +                                     &packet_info.in6_src,
> +                                     sizeof(packet_info.in6_src));
> +            }
> +            if (packet_info.is_ipv6_ext_dst &&
> +                config->hash_types & VIRTIO_NET_RSS_HASH_TYPE_TCP_EX) {
> +
> +                net_rx_rss_add_chunk(rss_input, &bytes_written,
> +                                     &packet_info.in6_ext_dst,
> +                                     sizeof(packet_info.in6_ext_dst));
> +            } else {
> +                net_rx_rss_add_chunk(rss_input, &bytes_written,
> +                                     &packet_info.in6_dst,
> +                                     sizeof(packet_info.in6_dst));
> +            }
> +            net_rx_rss_add_chunk(rss_input, &bytes_written,
> +                                 &packet_info.src_port,
> +                                 sizeof(packet_info.src_port));
> +            net_rx_rss_add_chunk(rss_input, &bytes_written,
> +                                 &packet_info.dst_port,
> +                                 sizeof(packet_info.dst_port));
> +        } else if (packet_info.is_udp &&
> +                   config->hash_types & VIRTIO_NET_RSS_HASH_TYPE_UDPv6) {
> +
> +            if (packet_info.is_ipv6_ext_src &&
> +               config->hash_types & VIRTIO_NET_RSS_HASH_TYPE_UDP_EX) {
> +
> +                net_rx_rss_add_chunk(rss_input, &bytes_written,
> +                                     &packet_info.in6_ext_src,
> +                                     sizeof(packet_info.in6_ext_src));
> +            } else {
> +                net_rx_rss_add_chunk(rss_input, &bytes_written,
> +                                     &packet_info.in6_src,
> +                                     sizeof(packet_info.in6_src));
> +            }
> +            if (packet_info.is_ipv6_ext_dst &&
> +               config->hash_types & VIRTIO_NET_RSS_HASH_TYPE_UDP_EX) {
> +
> +                net_rx_rss_add_chunk(rss_input, &bytes_written,
> +                                     &packet_info.in6_ext_dst,
> +                                     sizeof(packet_info.in6_ext_dst));
> +            } else {
> +                net_rx_rss_add_chunk(rss_input, &bytes_written,
> +                                     &packet_info.in6_dst,
> +                                     sizeof(packet_info.in6_dst));
> +            }
> +
> +            net_rx_rss_add_chunk(rss_input, &bytes_written,
> +                                 &packet_info.src_port,
> +                                 sizeof(packet_info.src_port));
> +            net_rx_rss_add_chunk(rss_input, &bytes_written,
> +                                 &packet_info.dst_port,
> +                                 sizeof(packet_info.dst_port));
> +
> +        } else if (config->hash_types & VIRTIO_NET_RSS_HASH_TYPE_IPv6) {
> +            if (packet_info.is_ipv6_ext_src &&
> +               config->hash_types & VIRTIO_NET_RSS_HASH_TYPE_IP_EX) {
> +
> +                net_rx_rss_add_chunk(rss_input, &bytes_written,
> +                                     &packet_info.in6_ext_src,
> +                                     sizeof(packet_info.in6_ext_src));
> +            } else {
> +                net_rx_rss_add_chunk(rss_input, &bytes_written,
> +                                     &packet_info.in6_src,
> +                                     sizeof(packet_info.in6_src));
> +            }
> +            if (packet_info.is_ipv6_ext_dst &&
> +                config->hash_types & VIRTIO_NET_RSS_HASH_TYPE_IP_EX) {
> +
> +                net_rx_rss_add_chunk(rss_input, &bytes_written,
> +                                     &packet_info.in6_ext_dst,
> +                                     sizeof(packet_info.in6_ext_dst));
> +            } else {
> +                net_rx_rss_add_chunk(rss_input, &bytes_written,
> +                                     &packet_info.in6_dst,
> +                                     sizeof(packet_info.in6_dst));
> +            }
> +        }
> +    }
> +
> +    if (bytes_written) {
> +        net_toeplitz_add(&result, rss_input, bytes_written, toe);
> +    }
> +
> +    return result;
> +}
> +
> +SEC("tun_rss_steering")
> +int tun_rss_steering_prog(struct __sk_buff *skb)
> +{
> +
> +    struct rss_config_t *config;
> +    struct toeplitz_key_data_t *toe;
> +
> +    __u32 key = 0;
> +    __u32 hash = 0;
> +
> +    config = bpf_map_lookup_elem(&tap_rss_map_configurations, &key);
> +    toe = bpf_map_lookup_elem(&tap_rss_map_toeplitz_key, &key);
> +
> +    if (config && toe) {
> +        if (!config->redirect) {
> +            return config->default_queue;
> +        }
> +
> +        hash = calculate_rss_hash(skb, config, toe);
> +        if (hash) {
> +            __u32 table_idx = hash % config->indirections_len;
> +            __u16 *queue = 0;
> +
> +            queue = bpf_map_lookup_elem(&tap_rss_map_indirection_table,
> +                                        &table_idx);
> +
> +            if (queue) {
> +                return *queue;
> +            }
> +        }
> +
> +        return config->default_queue;
> +    }
> +
> +    return -1;
> +}
> +
> +char _license[] SEC("license") = "GPL v2";


