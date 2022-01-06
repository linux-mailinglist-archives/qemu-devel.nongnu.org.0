Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2935C485FA2
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 05:20:37 +0100 (CET)
Received: from localhost ([::1]:33802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5KGR-0006XR-Pb
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 23:20:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n5KFC-0005e2-8N
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 23:19:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n5KF9-0004xF-IL
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 23:19:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641442753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UAMUkUofT0fc8gXAbY0qVMKGn48Echdl75unR4xExRQ=;
 b=YCxfNm8UV3NrTF/C095bbhdMRTylisCOzQvg/ZkEMw57C+KVt7Uks3TMsKFgJe9WGpS7Pm
 hpymWkZJ24Sj0tu0+3aF/4BuU5gclmC5hHNlU5E5BaHPSppkRPSwMNZSn3XqDIyI8WRPV2
 o74YR3sCttLlpPTYmfFXncbDyPhfs54=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-Idyh7I20Nka53ZjD1myGCA-1; Wed, 05 Jan 2022 23:19:07 -0500
X-MC-Unique: Idyh7I20Nka53ZjD1myGCA-1
Received: by mail-pj1-f71.google.com with SMTP id
 r1-20020a17090a438100b001b1906bd90cso4005284pjg.2
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 20:19:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UAMUkUofT0fc8gXAbY0qVMKGn48Echdl75unR4xExRQ=;
 b=oel13tKpwqpvAju3daHv4kh0NQWYnlv53UXKeG/zKERuQb7t/J9oq88tpZurTEFE4X
 IVEVWqw879FZpdjs8QP1CZXPQnGLnVxBApB52CBIyTP3NEqiaMs0BuT81giHwk4cU8EY
 CbJGyyKtRAfR9wYJT4CMt93Oh6mWvaQWrEoyCj75gNAjvXXDboY3UDVs8Av+TWODAswK
 HBb6hRfGSYfRjNbvEM+2MrN2vLK6sNkA3fDVyjTqhiHSbB0/tYQtlClVupmjy6WCj2Nm
 1+n1H6YQwE7YGpidrhaSp1N2SiTOXUUFmx5GdC72TEJEpiLm1isJQ6kQXreWbIJQqq89
 p0aA==
X-Gm-Message-State: AOAM530+wNRlKWFDjX91otKbBKND1zs25ET4pWdkAYjTzVtSP0sLze1r
 kWNkYyxh6A4aygwSDtCKLbK0xzdgOY5fahGSo46QBAK5PtXW8oXwkqplIFybPAGNGZCzFaCDwwy
 LEqIkSIEONNAl96g=
X-Received: by 2002:a63:83c8:: with SMTP id
 h191mr52034721pge.319.1641442746473; 
 Wed, 05 Jan 2022 20:19:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpo097sCAZzXQqtE8m7kncoAUY8wiXYGNKZwvgnq0vdpiYkRDX4zETwWk26rDagFyZN+g8mw==
X-Received: by 2002:a63:83c8:: with SMTP id
 h191mr52034708pge.319.1641442746052; 
 Wed, 05 Jan 2022 20:19:06 -0800 (PST)
Received: from [10.72.13.242] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id br16sm3899760pjb.0.2022.01.05.20.19.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 20:19:05 -0800 (PST)
Message-ID: <89b1a68f-7eae-30a6-dba0-ed86e6638ce9@redhat.com>
Date: Thu, 6 Jan 2022 12:18:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH v8 0/7] Add vmnet.framework based network backend
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, qemu-devel@nongnu.org
References: <20211211104413.50524-1-yaroshchuk2000@gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20211211104413.50524-1-yaroshchuk2000@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.057, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: phillip.ennen@gmail.com, armbru@redhat.com, r.bolshakov@yadro.com,
 phillip@axleos.com, akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/12/11 下午6:44, Vladislav Yaroshchuk 写道:
> macOS provides networking API for VMs called 'vmnet.framework':
> https://developer.apple.com/documentation/vmnet
>
> We can provide its support as the new QEMU network backends which
> represent three different vmnet.framework interface usage modes:
>
>    * `vmnet-shared`:
>      allows the guest to communicate with other guests in shared mode and
>      also with external network (Internet) via NAT. Has (macOS-provided)
>      DHCP server; subnet mask and IP range can be configured;
>
>    * `vmnet-host`:
>      allows the guest to communicate with other guests in host mode.
>      By default has enabled DHCP as `vmnet-shared`, but providing
>      network unique id (uuid) can make `vmnet-host` interfaces isolated
>      from each other and also disables DHCP.
>
>    * `vmnet-bridged`:
>      bridges the guest with a physical network interface.
>
> This backends cannot work on macOS Catalina 10.15 cause we use
> vmnet.framework API provided only with macOS 11 and newer. Seems
> that it is not a problem, because QEMU guarantees to work on two most
> recent versions of macOS which now are Big Sur (11) and Monterey (12).
>
> Also, we have one inconvenient restriction: vmnet.framework interfaces
> can create only privileged user:
> `$ sudo qemu-system-x86_64 -nic vmnet-shared`
>
> Attempt of `vmnet-*` netdev creation being unprivileged user fails with
> vmnet's 'general failure'.
>
> This happens because vmnet.framework requires `com.apple.vm.networking`
> entitlement which is: "restricted to developers of virtualization software.
> To request this entitlement, contact your Apple representative." as Apple
> documentation says:
> https://developer.apple.com/documentation/bundleresources/entitlements/com_apple_vm_networking
>
> One more note: we still have quite useful but not supported
> 'vmnet.framework' features as creating port forwarding rules, IPv6
> NAT prefix specifying and so on.
>
> Nevertheless, new backends work fine and tested within `qemu-system-x86-64`
> on macOS Bir Sur 11.5.2 host with such nic models:
>    * e1000-82545em
>    * virtio-net-pci
>    * vmxnet3
>
> The guests were:
>    * macOS 10.15.7
>    * Ubuntu Bionic (server cloudimg)
>
>
> This series partially reuses patches by Phillip Tennen:
> https://patchew.org/QEMU/20210218134947.1860-1-phillip.ennen@gmail.com/
> So I included them signed-off line into one of the commit messages and
> also here.


Applied.

Thanks


>
> v1 -> v2:
>   Since v1 minor typos were fixed, patches rebased onto latest master,
>   redundant changes removed (small commits squashed)
> v2 -> v3:
>   - QAPI style fixes
>   - Typos fixes in comments
>   - `#include`'s updated to be in sync with recent master
> v3 -> v4:
>   - Support vmnet interfaces isolation feature
>   - Support vmnet-host network uuid setting feature
>   - Refactored sources a bit
> v4 -> v5:
>   - Missed 6.2 boat, now 7.0 candidate
>   - Fix qapi netdev descriptions and styles
>     (@subnetmask -> @subnet-mask)
>   - Support vmnet-shared IPv6 prefix setting feature
> v5 -> v6
>   - provide detailed commit messages for commits of
>     many changes
>   - rename properties @dhcpstart and @dhcpend to
>     @start-address and @end-address
>   - improve qapi documentation about isolation
>     features (@isolated, @net-uuid)
> v6 -> v7:
>   - update MAINTAINERS list
> v7 -> v8
>   - QAPI code style fixes
>
>
> Vladislav Yaroshchuk (7):
>    net/vmnet: add vmnet dependency and customizable option
>    net/vmnet: add vmnet backends to qapi/net
>    net/vmnet: implement shared mode (vmnet-shared)
>    net/vmnet: implement host mode (vmnet-host)
>    net/vmnet: implement bridged mode (vmnet-bridged)
>    net/vmnet: update qemu-options.hx
>    net/vmnet: update MAINTAINERS list
>
>   MAINTAINERS                   |   5 +
>   meson.build                   |   4 +
>   meson_options.txt             |   2 +
>   net/clients.h                 |  11 ++
>   net/meson.build               |   7 +
>   net/net.c                     |  10 ++
>   net/vmnet-bridged.m           | 111 ++++++++++++
>   net/vmnet-common.m            | 330 ++++++++++++++++++++++++++++++++++
>   net/vmnet-host.c              | 105 +++++++++++
>   net/vmnet-shared.c            |  92 ++++++++++
>   net/vmnet_int.h               |  48 +++++
>   qapi/net.json                 | 129 ++++++++++++-
>   qemu-options.hx               |  25 +++
>   scripts/meson-buildoptions.sh |   3 +
>   14 files changed, 880 insertions(+), 2 deletions(-)
>   create mode 100644 net/vmnet-bridged.m
>   create mode 100644 net/vmnet-common.m
>   create mode 100644 net/vmnet-host.c
>   create mode 100644 net/vmnet-shared.c
>   create mode 100644 net/vmnet_int.h
>


