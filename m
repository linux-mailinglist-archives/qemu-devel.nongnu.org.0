Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A47380A9E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 15:45:15 +0200 (CEST)
Received: from localhost ([::1]:58154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhY7u-0001JG-Ki
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 09:45:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhY6f-0000Uk-0y
 for qemu-devel@nongnu.org; Fri, 14 May 2021 09:43:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhY6c-0000BQ-H7
 for qemu-devel@nongnu.org; Fri, 14 May 2021 09:43:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620999833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hMD7Vla+JZpE2nRKKZu0fCXrN6L8KzZiY0+ffEGdkJg=;
 b=IrL4bu/1zohGAmoY87HI3UfFDstMUJRHZ1Bd5/KnJqa3akAxWwqcdujpeovNfpueHmcf6s
 0wo30ZbEAeapror+OLemU/aHg1tSjwZfVJSISiVqwmPTApQiI6aUAnRckhJPXqjJp38Dt+
 cejg4zOuOjbbALtQVDHqmVLU3nZI8Es=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-1zoF0F4xOPqBxlkMO478HQ-1; Fri, 14 May 2021 09:43:49 -0400
X-MC-Unique: 1zoF0F4xOPqBxlkMO478HQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 a5-20020a5d6ca50000b029011035a261adso2678517wra.17
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 06:43:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hMD7Vla+JZpE2nRKKZu0fCXrN6L8KzZiY0+ffEGdkJg=;
 b=KDvZoDr/xEjTO7tyPKbo1GmOlBnd7ck6r492qjzo/mcG/j3x0S6SIMsYo6WSHJqrLS
 Z95fi7kOkCgiofFh0vhEHnPJ2j1wAsudjWiY/wmmpqCI81Z4sBxx1IzGWyrrHS4gQCHl
 IbC5zAMhxu5pLoSxY5BSBQQtEfTFVxrEfZb2tsveA9mDRr/HtvCiS5+/bX+djN6Wbk51
 y/iZVR/uniKSx90yT3TzhLw+SIULTFW9sLjzGJ8SJATOOCyTrpFSeO61oYwxrfnYp4MC
 CtxFk9W4K7Je+ICQ2onaTidyYuKAN6JycSvrPVsFbgO7ZkVDDQOT8OcuuohkY/26uYHD
 oNoA==
X-Gm-Message-State: AOAM532uPSFdix0jW28QHxFR4p9ILj6e8LY9NJ4cbb09QEkfGflbzRZ1
 28h/U0mLulF4KW1XtpW3bLShHYPg2jlSBoDU1kv7NFptVegLIF4r/B3KNPsoAQC/g6VU0sXGDRh
 P64wguyw2Ovr2lqM=
X-Received: by 2002:a1c:35c6:: with SMTP id c189mr9452006wma.127.1620999828036; 
 Fri, 14 May 2021 06:43:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOD2vFBEag0hKc1Ui7gF2OocRC/jZIPhdC5jEp1yiMrl+QguydhFwjODDIvsNrTGzVIXSxUw==
X-Received: by 2002:a1c:35c6:: with SMTP id c189mr9451986wma.127.1620999827813; 
 Fri, 14 May 2021 06:43:47 -0700 (PDT)
Received: from redhat.com (bzq-79-181-160-222.red.bezeqint.net.
 [79.181.160.222])
 by smtp.gmail.com with ESMTPSA id a9sm5432495wmj.1.2021.05.14.06.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 06:43:47 -0700 (PDT)
Date: Fri, 14 May 2021 09:43:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrew Melnychenko <andrew@daynix.com>
Subject: Re: [PATCH v5 0/7] eBPF RSS support for virtio-net
Message-ID: <20210514094235-mutt-send-email-mst@kernel.org>
References: <20210325153529.75831-1-andrew@daynix.com>
MIME-Version: 1.0
In-Reply-To: <20210325153529.75831-1-andrew@daynix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
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
Cc: yan@daynix.com, yuri.benditovich@daynix.com, jasowang@redhat.com,
 berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 25, 2021 at 05:35:22PM +0200, Andrew Melnychenko wrote:
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
> using provided Makefile.ebpf.
> Added changes to virtio-net and vhost, primary eBPF RSS is used.
> 'in-qemu' RSS used in the case of hash population and as a fallback option.
> For vhost, the hash population feature is not reported to the guest.
> 
> Please also see the documentation in PATCH 6/7.

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> Known issues:
> * hash population not supported by eBPF RSS: 'in-qemu' RSS used
> as a fallback, also, hash population feature is not reported to guests
> with vhost.

Could we instead fail init when RSS is requested and vhost is
enabled? we can't do it for on by default features but we can
for off by default ones ...

> * IPv6 extensions still in progress.
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
> Changes since v2:
> * using bpftool for eBPF skeleton generation.
> * ebpf_rss is refactored to use skeleton generated by bpftool.
> * added/adjasted license in comment sections and in eBPF file.
> * rss.bpf.c and Makefile.ebpf moved to the tool/ebpf folder.
> * virtio-net eBPF rss refactored. Now eBPF initialized during realize().
> 
> Changes since v3:
> * rebased to last master.
> * fixed issue with failed build without libbpf.
> * fixed ebpf loading without rss option.
> * refactored labels in ebpf_rss.c
> 
> Changes since v4:
> * refactored configure/meson script.
> * added checks for load_bytes in ebpf.
> * documentation added to the index.
> * refactored Makefile and rss.bpf.c.
> * rebased to last master.
> 
> Andrew (7):
>   net/tap: Added TUNSETSTEERINGEBPF code.
>   net: Added SetSteeringEBPF method for NetClientState.
>   ebpf: Added eBPF RSS program.
>   ebpf: Added eBPF RSS loader.
>   virtio-net: Added eBPF RSS to virtio-net.
>   docs: Added eBPF documentation.
>   MAINTAINERS: Added eBPF maintainers information.
> 
>  MAINTAINERS                    |   8 +
>  configure                      |   8 +-
>  docs/devel/ebpf_rss.rst        | 125 ++++++++
>  docs/devel/index.rst           |   1 +
>  ebpf/ebpf_rss-stub.c           |  40 +++
>  ebpf/ebpf_rss.c                | 165 ++++++++++
>  ebpf/ebpf_rss.h                |  44 +++
>  ebpf/meson.build               |   1 +
>  ebpf/rss.bpf.skeleton.h        | 423 +++++++++++++++++++++++++
>  ebpf/trace-events              |   4 +
>  ebpf/trace.h                   |   2 +
>  hw/net/vhost_net.c             |   3 +
>  hw/net/virtio-net.c            | 115 ++++++-
>  include/hw/virtio/virtio-net.h |   4 +
>  include/net/net.h              |   2 +
>  meson.build                    |   9 +
>  meson_options.txt              |   2 +
>  net/tap-bsd.c                  |   5 +
>  net/tap-linux.c                |  13 +
>  net/tap-linux.h                |   1 +
>  net/tap-solaris.c              |   5 +
>  net/tap-stub.c                 |   5 +
>  net/tap.c                      |   9 +
>  net/tap_int.h                  |   1 +
>  net/vhost-vdpa.c               |   2 +
>  tools/ebpf/Makefile.ebpf       |  22 ++
>  tools/ebpf/rss.bpf.c           | 552 +++++++++++++++++++++++++++++++++
>  27 files changed, 1567 insertions(+), 4 deletions(-)
>  create mode 100644 docs/devel/ebpf_rss.rst
>  create mode 100644 ebpf/ebpf_rss-stub.c
>  create mode 100644 ebpf/ebpf_rss.c
>  create mode 100644 ebpf/ebpf_rss.h
>  create mode 100644 ebpf/meson.build
>  create mode 100644 ebpf/rss.bpf.skeleton.h
>  create mode 100644 ebpf/trace-events
>  create mode 100644 ebpf/trace.h
>  create mode 100755 tools/ebpf/Makefile.ebpf
>  create mode 100644 tools/ebpf/rss.bpf.c
> 
> -- 
> 2.31.0


