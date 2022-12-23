Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70764654BB3
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 04:24:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8YfD-0008EB-1q; Thu, 22 Dec 2022 22:24:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p8YfB-0008Dz-5i
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 22:24:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p8Yf8-0004Hj-UB
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 22:24:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671765837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/TTVruRnP3jJrBCvZHN/gB6LT4JG2AtpLyp/o8Q0ofY=;
 b=XWtOJugRSF/AxmZ/0KZZXU2+zLP2/1c1BFnIaHgoyEyB7TEYV21ZeSxDNEeXzPzc7ifvYT
 ix2SOXT6aA7ac38zgPBmX7kA2bKdZXtqmZ1msrI/yqjW55U9mwI/oMgFPyLmxEDSj9nXHr
 f+h/p7k5HueJ5miQ4pxrdzaBrl7/e5M=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-433-nZdNucp1PPGoi4ORhUkNXw-1; Thu, 22 Dec 2022 22:23:55 -0500
X-MC-Unique: nZdNucp1PPGoi4ORhUkNXw-1
Received: by mail-oi1-f197.google.com with SMTP id
 s8-20020a056808008800b00360b62b697bso762920oic.3
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 19:23:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/TTVruRnP3jJrBCvZHN/gB6LT4JG2AtpLyp/o8Q0ofY=;
 b=PhNqaw3XxRBKMgtM+5B3l8kflkXltGpyN4HVgrLrcoT26/478d1h22aovpsVU59vCp
 JFw8gq0GlaepDNbpYirc2k5LN89A7kSReJ7R74SM3+5RYtbTzn/KasEI0ncDoUxByo57
 A8kR0p45sf3YKh+GJQSRVxUqwWpaEVji1c+w/3O7j3UMVdICSwid5dn9QlUTVBERzllx
 1QoDFMocCD1EtgsCA93xUa5IivnrHhWF6J9j5rRDzN/kaTFUI03cw8ofSpKL7BOiwWqO
 B7C5KDpm9QKQ/hGzC0NT9Rk6TjWJBz3ySIaqq60OJkNj+eomU1drUNqnnF3T2oPHL+2U
 j/cQ==
X-Gm-Message-State: AFqh2krbr5PxrtboRDjjil6aw1bj4Cey334JzKMVaXQV84ZazA+kEXyW
 4/mpx1XkZhuh7K3ix7PILUWPNKRmPxI1rJcixLcqVXWCexiLz2O40YApq64Qezsgu2UcAYU1xNJ
 klJP0pupAIUYpfwVhVVTF5QboYhNIox8=
X-Received: by 2002:a9d:7843:0:b0:678:1eb4:3406 with SMTP id
 c3-20020a9d7843000000b006781eb43406mr494303otm.237.1671765834666; 
 Thu, 22 Dec 2022 19:23:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs+z30RH+aOjWmu62gtZCbkXwfwc8gcC1D0n0JlmoMzZKBC1SS2QAG1+Ac0S9v4Kbu0WnhkUw/26RUwDHZ1fAQ=
X-Received: by 2002:a9d:7843:0:b0:678:1eb4:3406 with SMTP id
 c3-20020a9d7843000000b006781eb43406mr494300otm.237.1671765834476; Thu, 22 Dec
 2022 19:23:54 -0800 (PST)
MIME-Version: 1.0
References: <20221222114120.8790-1-sriram.yagnaraman@est.tech>
In-Reply-To: <20221222114120.8790-1-sriram.yagnaraman@est.tech>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 23 Dec 2022 11:23:43 +0800
Message-ID: <CACGkMEtFvmQ3th8TxApOuOtRVQz-7S7NZ-dFyOX73L1YS7Fh4g@mail.gmail.com>
Subject: Re: [PATCH 0/5] hw/net/igb: emulated network device with SR-IOV
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Thu, Dec 22, 2022 at 7:43 PM Sriram Yagnaraman
<sriram.yagnaraman@est.tech> wrote:
>
> A new attempt at adding support for Intel 82576 Gigabit Ethernet adapter
> with SR-IOV support.
>
> Start qemu with the following parameters.
>    qemu-system-x86_64 -enable-kvm -M q35 \
>    ...
>    -device pcie-root-port,slot=3,id=pcie_port.3 \
>    -netdev tap,id=net3,script=no,downscript=/tmp/rmtap,ifname=xcbr3_t2,queues=1 \
>    -device igb,bus=pcie_port.3,netdev=net3,mac=00:00:00:01:03:02
>
> Load IGB/IGBVF modules if needed.
> modprobe igb
> modprobe igbvf
>
> Create VFs via /sys
> ls /sys/bus/pci/devices/0000:01:00.0/
> echo 2 > /sys/bus/pci/devices/0000:01:00.0/sriov_numvfs
>
> Sriram Yagnaraman (5):
>   pcie: add helper function to get number of VFs
>   hw/net/net_tx_pkt: helper function to get l2 hdr
>   hw/net/igb: register definitions
>   hw/net/igb: emulated intel IGB (82576EB) network device
>   hw/net/igb: build support for igb/igbvf devices

Haven't reviewed this series but I think we'd have two more things:

1) update the MAINTAINERS
2) a qtest for igb (having a qtest for sr-iov would be even better)

Thanks

>
>  hw/i386/Kconfig             |    1 +
>  hw/net/Kconfig              |    5 +
>  hw/net/e1000_regs.h         |  357 +++-
>  hw/net/e1000x_common.c      |   13 +
>  hw/net/e1000x_common.h      |   28 +
>  hw/net/igb.c                |  627 ++++++
>  hw/net/igb.h                |  184 ++
>  hw/net/igb_core.c           | 3782 +++++++++++++++++++++++++++++++++++
>  hw/net/igb_core.h           |  216 ++
>  hw/net/igbvf.c              |  262 +++
>  hw/net/meson.build          |    2 +
>  hw/net/net_tx_pkt.c         |   17 +-
>  hw/net/net_tx_pkt.h         |    8 +
>  hw/net/trace-events         |  190 ++
>  hw/pci/pcie_sriov.c         |    6 +
>  include/hw/pci/pcie_sriov.h |    5 +
>  16 files changed, 5671 insertions(+), 32 deletions(-)
>  create mode 100644 hw/net/igb.c
>  create mode 100644 hw/net/igb.h
>  create mode 100644 hw/net/igb_core.c
>  create mode 100644 hw/net/igb_core.h
>  create mode 100644 hw/net/igbvf.c
>
> --
> 2.34.1
>


