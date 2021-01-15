Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF3E2F73B4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 08:29:42 +0100 (CET)
Received: from localhost ([::1]:60290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0JYD-0004xg-D9
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 02:29:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l0JWI-0004Vu-CF
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 02:27:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l0JWF-0001T0-FL
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 02:27:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610695658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gKg03d7tMSeAyUA+TXDGPOxb0sL/Y33TNN8zwHg2RqY=;
 b=DgZzueeCt4pBAXpfSS8aguOWLJuDDKUaMs6ozKa89UURculNIn23+rZLv5SuNA1WZcAlYd
 HjLNxSb8ayTDT0p7vi3qJ0TY8tN5sSGND5QqHJLMXAhVE3OORknGnoonr009ZbhtmSoCzY
 NHZqhn4lOLR4y4aTLd/kidH9A0jbhB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-HDdIPB09MxyHolwcFELsKw-1; Fri, 15 Jan 2021 02:27:36 -0500
X-MC-Unique: HDdIPB09MxyHolwcFELsKw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEBBA1009465;
 Fri, 15 Jan 2021 07:27:35 +0000 (UTC)
Received: from [10.72.13.19] (ovpn-13-19.pek2.redhat.com [10.72.13.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CCB762951;
 Fri, 15 Jan 2021 07:27:30 +0000 (UTC)
Subject: Re: [RFC PATCH v3 0/6] eBPF RSS support for virtio-net
To: Andrew Melnychenko <andrew@daynix.com>, mst@redhat.com
References: <20210114211612.387052-1-andrew@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0ddf428c-db1d-1598-1f61-c7b381c87a4e@redhat.com>
Date: Fri, 15 Jan 2021 15:27:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210114211612.387052-1-andrew@daynix.com>
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
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: yan@daynix.com, yuri.benditovich@daynix.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/1/15 上午5:16, Andrew Melnychenko wrote:
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
> of BPF ELF file data. The eBPF array file initially generated by bpftool.
> The compilation of eBPF is not part of QEMU build and can be done
> using provided Makefile.ebpf(need to adjust 'linuxhdrs').
> Added changes to virtio-net and vhost, primary eBPF RSS is used.
> 'in-qemu' RSS used in the case of hash population and as a fallback option.
> For vhost, the hash population feature is not reported to the guest.
>
> Please also see the documentation in PATCH 6/6.
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


Looks good overall. I think a formal series could be posted for the next 
version.

Please see comments in the patch and I think we need to add a migration 
blocker if RSS is supported by virtio-net. (And implement migration in 
the future).

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
> * refactored code.Changes since v1:
> * using libbpf instead of direct 'bpf' system call.
> * added libbpf dependency to the configure/meson scripts.
> * changed python script for eBPF .h file generation.
> * changed eBPF program - reading L3 proto from ethernet frame.
> * added TUNSETSTEERINGEBPF define for TUN.
> * changed the maintainer's info.
> * added license headers.
> * refactored code.
>
> Changes since v2:
> * using bpftool for eBPF skeleton generation.
> * ebpf_rss is refactored to use skeleton generated by bpftool.
> * added/adjasted license in comment sections and in eBPF file.
> * rss.bpf.c and Makefile.ebpf moved to the tool/ebpf folder.
> * virtio-net eBPF rss refactored. Now eBPF initialized during realize().
>
> Andrew (6):
>    net/tap: Added TUNSETSTEERINGEBPF code.
>    net: Added SetSteeringEBPF method for NetClientState.
>    ebpf: Added eBPF RSS program.
>    ebpf: Added eBPF RSS loader.
>    virtio-net: Added eBPF RSS to virtio-net.
>    docs: Added eBPF documentation.
>
>   MAINTAINERS                    |   8 +
>   configure                      |  33 +++
>   docs/ebpf_rss.rst              | 125 ++++++++
>   ebpf/ebpf_rss-stub.c           |  40 +++
>   ebpf/ebpf_rss.c                | 165 +++++++++++
>   ebpf/ebpf_rss.h                |  44 +++
>   ebpf/meson.build               |   1 +
>   ebpf/rss.bpf.skeleton.h        | 397 ++++++++++++++++++++++++++
>   ebpf/trace-events              |   4 +
>   ebpf/trace.h                   |   2 +
>   hw/net/vhost_net.c             |   2 +
>   hw/net/virtio-net.c            | 125 +++++++-
>   include/hw/virtio/virtio-net.h |   4 +
>   include/net/net.h              |   2 +
>   meson.build                    |  13 +
>   net/tap-bsd.c                  |   5 +
>   net/tap-linux.c                |  13 +
>   net/tap-linux.h                |   1 +
>   net/tap-solaris.c              |   5 +
>   net/tap-stub.c                 |   5 +
>   net/tap.c                      |   9 +
>   net/tap_int.h                  |   1 +
>   net/vhost-vdpa.c               |   2 +
>   tools/ebpf/Makefile.ebpf       |  33 +++
>   tools/ebpf/rss.bpf.c           | 505 +++++++++++++++++++++++++++++++++
>   25 files changed, 1540 insertions(+), 4 deletions(-)
>   create mode 100644 docs/ebpf_rss.rst
>   create mode 100644 ebpf/ebpf_rss-stub.c
>   create mode 100644 ebpf/ebpf_rss.c
>   create mode 100644 ebpf/ebpf_rss.h
>   create mode 100644 ebpf/meson.build
>   create mode 100644 ebpf/rss.bpf.skeleton.h
>   create mode 100644 ebpf/trace-events
>   create mode 100644 ebpf/trace.h
>   create mode 100755 tools/ebpf/Makefile.ebpf
>   create mode 100644 tools/ebpf/rss.bpf.c
>


