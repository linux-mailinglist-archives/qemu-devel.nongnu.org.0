Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A3D2CBEDC
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 14:58:05 +0100 (CET)
Received: from localhost ([::1]:37800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkSdw-0001kq-On
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 08:58:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kkSbo-0000Wu-Fe
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 08:55:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kkSbm-0008Pr-JC
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 08:55:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606917349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XcNC+Eo7XYNRRLRWgDoy6KTX+7Chk9ZmydNjBPfvHu0=;
 b=cD0UG3j1/G8/pgVJmDXovcxWXKqDyC4XkdeaR27LXqpvj0qvZP+2h117CEmfkg0nkjuPDG
 kNXe2nIEQDfLlo/UF8w5+bUic1mwixwTxYtHIWQMpN5oICikhFILEVEQN7L4xP0BpsgaV4
 7Ox+vqvIlEeYnY6xMpVMmn+pnvkiuoQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-_e2U-hRfPCusaiDa2F5fhg-1; Wed, 02 Dec 2020 08:55:46 -0500
X-MC-Unique: _e2U-hRfPCusaiDa2F5fhg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05A89190B2A0;
 Wed,  2 Dec 2020 13:55:45 +0000 (UTC)
Received: from [10.72.12.105] (ovpn-12-105.pek2.redhat.com [10.72.12.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E59D60855;
 Wed,  2 Dec 2020 13:55:34 +0000 (UTC)
Subject: Re: [RFC PATCH v2 0/5] eBPF RSS support for virtio-net
To: Andrew Melnychenko <andrew@daynix.com>, mst@redhat.com
References: <20201119111305.485202-1-andrew@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <00e5b0a8-dfaa-2899-2501-cfe8249302ff@redhat.com>
Date: Wed, 2 Dec 2020 21:55:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119111305.485202-1-andrew@daynix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
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
Cc: yan@daynix.com, yuri.benditovich@daynix.com,
 =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/11/19 下午7:13, Andrew Melnychenko wrote:
> This set of patches introduces the usage of eBPF for packet steering
> and RSS hash calculation:
> * RSS(Receive Side Scaling) is used to distribute network packets to
> guest virtqueues by calculating packet hash
> * Additionally adding support for the usage of RSS with vhost
>
> The eBPF works on kernels 5.8+
> On earlier kerneld it fails to load and the RSS feature is reported
> only without vhost and implemented in 'in-qemu' software.
>
> Implementation notes:
> Linux TAP TUNSETSTEERINGEBPF ioctl was used to set the eBPF program.
> Added libbpf dependency and eBPF support.
> The eBPF program is part of the qemu and presented as an array
> of BPF ELF file data.
> The compilation of eBPF is not part of QEMU build and can be done
> using provided Makefile.ebpf(need to adjust 'linuxhdrs').
> Added changes to virtio-net and vhost, primary eBPF RSS is used.
> 'in-qemu' RSS used in the case of hash population and as a fallback option.
> For vhost, the hash population feature is not reported to the guest.
>
> Please also see the documentation in PATCH 5/5.
>
> I am sending those patches as RFC to initiate the discussions and get
> feedback on the following points:
> * Fallback when eBPF is not supported by the kernel
> * Live migration to the kernel that doesn't have eBPF support
> * Integration with current QEMU build
> * Additional usage for eBPF for packet filtering
>
> Known issues:
> * hash population not supported by eBPF RSS: 'in-qemu' RSS used
> as a fallback, also, hash population feature is not reported to guests
> with vhost.
> * big-endian BPF support: for now, eBPF isn't supported on
> big-endian systems. Can be added in future if required.
> * huge .h file with eBPF binary. The size of .h file containing
> eBPF binary is currently ~5K lines, because the binary is built with debug information.
> The binary without debug/BTF info can't be loaded by libbpf.
> We're looking for possibilities to reduce the size of the .h files.


Adding Toke for sharing more idea from eBPF side.

We had some discussion on the eBPF issues:

1) Whether or not to use libbpf. Toke strongly suggest to use libbpf
2) Whether or not to use BTF. Toke confirmed that if we don't access any 
skb metadata, BTF is not strictly required for CO-RE. But it might still 
useful for e.g debugging.
3) About the huge (5K lines, see patch #2 Toke). Toke confirmed that we 
can strip debug symbols, but Yuri found some sections can't be stripped, 
we can keep discussing here.

Toke, feel free to correct me if I was wrong.

Thanks


>
> Changes since v1:
> * using libbpf instead of direct 'bpf' system call.
> * added libbpf dependency to the configure/meson scripts.
> * changed python script for eBPF .h file generation.
> * changed eBPF program - reading L3 proto from ethernet frame.
> * added TUNSETSTEERINGEBPF define for TUN.
> * changed the maintainer's info.
> * added license headers.
> * refactored code.
>
> Andrew (5):
>    net: Added SetSteeringEBPF method for NetClientState.
>    ebpf: Added eBPF RSS program.
>    ebpf: Added eBPF RSS loader.
>    virtio-net: Added eBPF RSS to virtio-net.
>    docs: Added eBPF RSS documentation.
>
>   MAINTAINERS                    |    7 +
>   configure                      |   33 +
>   docs/ebpf_rss.rst              |  133 +
>   ebpf/EbpfElf_to_C.py           |   36 +
>   ebpf/Makefile.ebpf             |   33 +
>   ebpf/ebpf_rss-stub.c           |   40 +
>   ebpf/ebpf_rss.c                |  186 ++
>   ebpf/ebpf_rss.h                |   44 +
>   ebpf/meson.build               |    1 +
>   ebpf/rss.bpf.c                 |  505 +++
>   ebpf/tun_rss_steering.h        | 5439 ++++++++++++++++++++++++++++++++
>   hw/net/vhost_net.c             |    2 +
>   hw/net/virtio-net.c            |  120 +-
>   include/hw/virtio/virtio-net.h |    4 +
>   include/net/net.h              |    2 +
>   meson.build                    |   11 +
>   net/tap-bsd.c                  |    5 +
>   net/tap-linux.c                |   13 +
>   net/tap-linux.h                |    1 +
>   net/tap-solaris.c              |    5 +
>   net/tap-stub.c                 |    5 +
>   net/tap.c                      |    9 +
>   net/tap_int.h                  |    1 +
>   net/vhost-vdpa.c               |    2 +
>   24 files changed, 6633 insertions(+), 4 deletions(-)
>   create mode 100644 docs/ebpf_rss.rst
>   create mode 100644 ebpf/EbpfElf_to_C.py
>   create mode 100755 ebpf/Makefile.ebpf
>   create mode 100644 ebpf/ebpf_rss-stub.c
>   create mode 100644 ebpf/ebpf_rss.c
>   create mode 100644 ebpf/ebpf_rss.h
>   create mode 100644 ebpf/meson.build
>   create mode 100644 ebpf/rss.bpf.c
>   create mode 100644 ebpf/tun_rss_steering.h
>


