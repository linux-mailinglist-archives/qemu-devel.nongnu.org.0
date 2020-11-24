Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 803EA2C1FB5
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 09:17:35 +0100 (CET)
Received: from localhost ([::1]:57768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khTW2-0004Hj-4Q
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 03:17:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1khTTk-0003H1-O2
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 03:15:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1khTTg-0005ov-5R
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 03:15:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606205706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pbw8+c3vWYCy8BP5WEHJX+lRMTZpJ7vXDex55/dcHzM=;
 b=MF7yRAiC9tQI04UC+Ouw3YTZVfU/XAUN88ijVonAPRdC+s+VeQcFWJ/ZAbuSagEgFRSq+X
 X3s2OFgnW+QGDObByuYID2SnyqrnFATNNOxoyXLBCAWHeZ7ZP3vQKhudxtW6b5sRmk5Vbl
 n4BzSAcvd2l0L7dqPhezPc2jywjojhM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-NX4sPM_JM1-6w4U3PVdnhw-1; Tue, 24 Nov 2020 03:15:02 -0500
X-MC-Unique: NX4sPM_JM1-6w4U3PVdnhw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AB38521B;
 Tue, 24 Nov 2020 08:15:01 +0000 (UTC)
Received: from [10.72.13.120] (ovpn-13-120.pek2.redhat.com [10.72.13.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39A4B5D719;
 Tue, 24 Nov 2020 08:14:55 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC PATCH v2 2/5] ebpf: Added eBPF RSS program.
To: Andrew Melnychenko <andrew@daynix.com>, mst@redhat.com
References: <20201119111305.485202-1-andrew@daynix.com>
 <20201119111305.485202-3-andrew@daynix.com>
Message-ID: <3b1129d9-4e78-bdce-de9d-b2106827d75f@redhat.com>
Date: Tue, 24 Nov 2020 16:14:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119111305.485202-3-andrew@daynix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: yan@daynix.com, yuri.benditovich@daynix.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/11/19 下午7:13, Andrew Melnychenko wrote:
> From: Andrew<andrew@daynix.com>
>
> RSS program and Makefile to build it.
> Also, added a python script that would generate '.h' file.
> The data in that file may be loaded by libbpf.
> EBPF compilation is not required for building qemu.
> You can use Makefile if you need to regenerate tun_rss_steering.h.
>
> NOTE: BPF program can't be loaded without debug/btf info.
> Which brings to huge tun_rss_steering.h file.
> In future, need to find proper way to shrink the file
> and leave only the program data and btf info.
>
> Signed-off-by: Yuri Benditovich<yuri.benditovich@daynix.com>
> Signed-off-by: Andrew Melnychenko<andrew@daynix.com>
> ---
>   ebpf/EbpfElf_to_C.py    |   36 +
>   ebpf/Makefile.ebpf      |   33 +
>   ebpf/rss.bpf.c          |  505 ++++


I think it's better to place them under tools/


>   ebpf/tun_rss_steering.h | 5439 +++++++++++++++++++++++++++++++++++++++


And move this to net/


>   4 files changed, 6013 insertions(+)
>   create mode 100644 ebpf/EbpfElf_to_C.py
>   create mode 100755 ebpf/Makefile.ebpf
>   create mode 100644 ebpf/rss.bpf.c
>   create mode 100644 ebpf/tun_rss_steering.h
>
> diff --git a/ebpf/EbpfElf_to_C.py b/ebpf/EbpfElf_to_C.py
> new file mode 100644
> index 0000000000..3a1b01aedc
> --- /dev/null
> +++ b/ebpf/EbpfElf_to_C.py
> @@ -0,0 +1,36 @@
> +#!/usr/bin/python3


Missing license.


> +
> +import sys
> +import argparse
> +
> +def process_file(filename, prog_name):
> +    print('Processing file:', filename)
> +    with open(filename, 'rb') as f:
> +        with open("%s.h" % prog_name, 'w') as w:
> +
> +            w.write('#ifndef %s\n' % prog_name.upper())
> +            w.write('#define %s\n\n' % prog_name.upper())
> +
> +            w.write("uint8_t data_%s[] = {\n" % prog_name)
> +
> +            data = f.read(8)
> +            while data:
> +                w.write("    " + ", ".join("0x%02x" % x for x in data) + ",\n")
> +                data = f.read(8)
> +
> +            w.write('};\n\n')
> +
> +            w.write('#endif /* %s */\n' % prog_name.upper())
> +
> +    return 0
> +
> +if __name__ == '__main__':
> +    parser = argparse.ArgumentParser(
> +        description='Convert eBPF ELF to C header. '
> +                    'Section name will be used in C namings.')
> +    parser.add_argument('--file', '-f', nargs=1, required=True,
> +                        help='eBPF ELF file')
> +    parser.add_argument('--section', '-s', nargs=1, required=True,
> +                        help='section in ELF with eBPF program.')
> +    args = parser.parse_args()
> +    sys.exit(process_file(args.file[0], args.section[0]))
> diff --git a/ebpf/Makefile.ebpf b/ebpf/Makefile.ebpf
> new file mode 100755
> index 0000000000..c09a8ac543
> --- /dev/null
> +++ b/ebpf/Makefile.ebpf
> @@ -0,0 +1,33 @@
> +OBJS = rss.bpf.o
> +
> +LLC ?= llc
> +CLANG ?= clang
> +INC_FLAGS = -nostdinc -isystem `$(CLANG) -print-file-name=include`
> +EXTRA_CFLAGS ?= -O2 -g -emit-llvm


Do we need a check of clang version to make sure BTF can be generated 
with "-g"?


> +
> +linuxhdrs = ~/src/kernel/master
> +
> +LINUXINCLUDE =  -I $(linuxhdrs)/arch/x86/include/uapi \
> +                -I $(linuxhdrs)/arch/x86/include/generated/uapi \
> +                -I $(linuxhdrs)/arch/x86/include/generated \
> +                -I $(linuxhdrs)/include/generated/uapi \
> +                -I $(linuxhdrs)/include/uapi \
> +                -I $(linuxhdrs)/include \
> +                -I $(linuxhdrs)/tools/lib
> +
> +all: $(OBJS)
> +
> +.PHONY: clean
> +
> +clean:
> +	rm -f $(OBJS)
> +
> +INC_FLAGS = -nostdinc -isystem `$(CLANG) -print-file-name=include`
> +
> +$(OBJS):  %.o:%.c
> +	$(CLANG) $(INC_FLAGS) \
> +                -D__KERNEL__ -D__ASM_SYSREG_H \
> +                -I../include $(LINUXINCLUDE) \
> +                $(EXTRA_CFLAGS) -c $< -o -| $(LLC) -march=bpf -filetype=obj -o $@
> +	python3 EbpfElf_to_C.py -f rss.bpf.o -s tun_rss_steering
> +
> diff --git a/ebpf/rss.bpf.c b/ebpf/rss.bpf.c
> new file mode 100644
> index 0000000000..3416bc72d0
> --- /dev/null
> +++ b/ebpf/rss.bpf.c
> @@ -0,0 +1,505 @@
> +/*
> + * eBPF RSS program
> + *
> + * Developed by Daynix Computing LTD (http://www.daynix.com)
> + *
> + * Authors:
> + *  Andrew Melnychenko<andrew@daynix.com>
> + *  Yuri Benditovich<yuri.benditovich@daynix.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
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
> +/*
> + * Prepare:
> + * Requires llvm, clang, python3, linux kernel tree
> + *
> + * Build tun_rss_steering.h:
> + * make -f Mefile.ebpf clean all
> + */


It's better to merge those instructions with the comments at the beginning.


> +
> +#define INDIRECTION_TABLE_SIZE 128
> +#define HASH_CALCULATION_BUFFER_SIZE 36
> +
> +struct rss_config_t {
> +    __u8 redirect;
> +    __u8 populate_hash;
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


[...]


> +
> +SEC("tun_rss_steering")
> +int tun_rss_steering_prog(struct __sk_buff *skb)
> +{
> +
> +    struct rss_config_t *config = 0;
> +    struct toeplitz_key_data_t *toe = 0;


There's no need to initialize the above two.

Thanks


