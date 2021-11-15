Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 273F044FDFD
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 05:54:30 +0100 (CET)
Received: from localhost ([::1]:56412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmU0i-00041R-Mo
	for lists+qemu-devel@lfdr.de; Sun, 14 Nov 2021 23:54:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mmTzX-0003FI-ST
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 23:53:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mmTzU-0008Ct-HS
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 23:53:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636951991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yi/7Ef8b3kVw6IbOU7UosCbz6nF+wlFzP6kNlN1jGMA=;
 b=BQznIxtAhn66Kw/KWEHq7MSX1OvUn3/nSASVvgTFesWnONrG7uYIt5SwzPPrCbbum/xxwv
 I6vhe+VZhFCnkKaMi1KOblCfrt87o87nmxR/qNblCx1dWkOvbONOo7XyLkKmgteirdtW8v
 jLi8PrXCYaSHHOrJ7TyqJ9YHzlL4/Pg=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-TqSazgzBMryHIgVKQScOlA-1; Sun, 14 Nov 2021 23:53:07 -0500
X-MC-Unique: TqSazgzBMryHIgVKQScOlA-1
Received: by mail-lf1-f72.google.com with SMTP id
 f15-20020a056512228f00b004037c0ab223so6236764lfu.16
 for <qemu-devel@nongnu.org>; Sun, 14 Nov 2021 20:53:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yi/7Ef8b3kVw6IbOU7UosCbz6nF+wlFzP6kNlN1jGMA=;
 b=wu07l7G62pm2CUeOpb6+i/aPZBU/dJbt3NpyGTW2eKpiCiHsBuNcyAt41dXPdUpz0L
 uVTT6bETwwbe3PnD5Bwimd9RmWhby837d+kOYKCXXTgkh/gdBJ6eM+nov6WsryQnt5ay
 akvZojc5G9TUK1jkWaQ2J4cYSZcFo2Rqv1wdCD2w4cXkS1fGeJJuQrdIaCVYBisT3vgx
 X9tXqlGqnStLTucFlhg0TOEjljwYbnAPCP0pN/qhGvihYkjf/RmzjbhPkIGaZJDNYEUA
 pEJD6F4GkuWw093MVSjbjQABbBo7mS582Zx4JFkraN8OKa5GfaZwqfz0nHymvYACM9/c
 Lccg==
X-Gm-Message-State: AOAM532JZxfr0sBT2BidKkTCrRKHyocOHK1nPGn8ipHfchwwczJGFnYp
 itpxbnI+GCqjMcKtXrOrY30lh2GVkAlp45xydiWrqrgChYEuGWMWFH7hM9v07/AEe6E0Wu7hhOx
 XCw1O28INKeKixM6tXdLUaZKCNh/Tpws=
X-Received: by 2002:a2e:b88d:: with SMTP id r13mr35195818ljp.362.1636951985765; 
 Sun, 14 Nov 2021 20:53:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzb2Poo7E0mn6F2jPRoLHaIJ87IKDcjla5/lS9qCqGR7DFXfQ/A2bSXrMmIs1jZiACs3RofgITquEyDmCeSHyA=
X-Received: by 2002:a2e:b88d:: with SMTP id r13mr35195785ljp.362.1636951985500; 
 Sun, 14 Nov 2021 20:53:05 -0800 (PST)
MIME-Version: 1.0
References: <20211112091414.34223-1-yaroshchuk2000@gmail.com>
In-Reply-To: <20211112091414.34223-1-yaroshchuk2000@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 15 Nov 2021 12:52:54 +0800
Message-ID: <CACGkMEuiXy+OhGxq0aR=f0HuvFAbN427m=HL035WuJLsOsGpSg@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add vmnet.framework based network backend
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.695,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: phillip.ennen@gmail.com, qemu-devel <qemu-devel@nongnu.org>, "Armbruster,
 Markus" <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Phillip Tennen <phillip@axleos.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 hsp.cat7@gmail.com, hello@adns.io, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 12, 2021 at 5:14 PM Vladislav Yaroshchuk
<yaroshchuk2000@gmail.com> wrote:
>
> macOS provides networking API for VMs called 'vmnet.framework':
> https://developer.apple.com/documentation/vmnet
>
> We can provide its support as the new QEMU network backends which
> represent three different vmnet.framework interface usage modes:
>
>   * `vmnet-shared`:
>     allows the guest to communicate with other guests in shared mode and
>     also with external network (Internet) via NAT. Has (macOS-provided)
>     DHCP server; subnet mask and IP range can be configured;
>
>   * `vmnet-host`:
>     allows the guest to communicate with other guests in host mode.
>     By default has enabled DHCP as `vmnet-shared`, but providing
>     network unique id (uuid) can make `vmnet-host` interfaces isolated
>     from each other and also disables DHCP.
>
>   * `vmnet-bridged`:
>     bridges the guest with a physical network interface.
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

Do you know how multipass work? Looks like it uses vmnet without privileges.

Thanks

>
> One more note: we still have quite useful but not supported
> 'vmnet.framework' features as creating port forwarding rules, IPv6
> NAT prefix specifying and so on.
>
> Nevertheless, new backends work fine and tested within `qemu-system-x86-64`
> on macOS Bir Sur 11.5.2 host with such nic models:
>   * e1000-82545em
>   * virtio-net-pci
>   * vmxnet3
>
> The guests were:
>   * macOS 10.15.7
>   * Ubuntu Bionic (server cloudimg)
>
>
> This series partially reuses patches by Phillip Tennen:
> https://patchew.org/QEMU/20210218134947.1860-1-phillip.ennen@gmail.com/
> So I included his signed-off line into one of the commit messages and
> also here.
>
> v1 -> v2:
>  Since v1 minor typos were fixed, patches rebased onto latest master,
>  redundant changes removed (small commits squashed)
>
> v2 -> v3:
>  - QAPI style fixes
>  - Typos fixes in comments
>  - `#include`'s updated to be in sync with recent master
> v3 -> v4:
>  - Support vmnet interfaces isolation feature
>  - Support vmnet-host network uuid setting feature
>  - Refactored sources a bit
> v4 -> v5:
>  - Missed 6.2 boat, now 7.0 candidate
>  - Fix qapi netdev descriptions and styles
>    (@subnetmask -> @subnet-mask)
>  - Support vmnet-shared IPv6 prefix setting feature
>
> Signed-off-by: Phillip Tennen <phillip@axleos.com>
> Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
>
> Vladislav Yaroshchuk (6):
>   net/vmnet: add vmnet dependency and customizable option
>   net/vmnet: add vmnet backends to qapi/net
>   net/vmnet: implement shared mode (vmnet-shared)
>   net/vmnet: implement host mode (vmnet-host)
>   net/vmnet: implement bridged mode (vmnet-bridged)
>   net/vmnet: update qemu-options.hx
>
>  meson.build                   |   4 +
>  meson_options.txt             |   2 +
>  net/clients.h                 |  11 ++
>  net/meson.build               |   7 +
>  net/net.c                     |  10 ++
>  net/vmnet-bridged.m           | 111 ++++++++++++
>  net/vmnet-common.m            | 325 ++++++++++++++++++++++++++++++++++
>  net/vmnet-host.c              | 111 ++++++++++++
>  net/vmnet-shared.c            |  92 ++++++++++
>  net/vmnet_int.h               |  48 +++++
>  qapi/net.json                 | 127 ++++++++++++-
>  qemu-options.hx               |  25 +++
>  scripts/meson-buildoptions.sh |   3 +
>  13 files changed, 874 insertions(+), 2 deletions(-)
>  create mode 100644 net/vmnet-bridged.m
>  create mode 100644 net/vmnet-common.m
>  create mode 100644 net/vmnet-host.c
>  create mode 100644 net/vmnet-shared.c
>  create mode 100644 net/vmnet_int.h
>
> --
> 2.23.0
>


