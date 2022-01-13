Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C227D48DA6E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 16:06:18 +0100 (CET)
Received: from localhost ([::1]:40090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n81g9-0005ez-RD
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 10:06:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n81bT-00027I-Qi
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:01:30 -0500
Received: from [2a00:1450:4864:20::132] (port=47033
 helo=mail-lf1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n81bP-0003cN-VS
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:01:27 -0500
Received: by mail-lf1-x132.google.com with SMTP id d3so20336312lfv.13
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 07:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iEJA6wY6taUxf8Zgjs/nOzy/DyCxutBDoaKlU773se0=;
 b=KzBr6lX7cX68vDR6tGAXPR5ftOhTm6lx5uLwRSXuidpQTqWyOAI17smkNQhJcn1/0c
 cVqmwWBd4sRSXwP5IDM7UPXVRpTZ0FdcuAOS8s+qkC1zK94XZGpY4otiLj/FJMQO9N6/
 E+Ve/AulzAWdIvaAuGWW7XXtwlgQsap9Vu46z+PGG+bTkcQ4qZfmim0ssccl0NKTjnLs
 B5rBj9XLEr7RVtkPknP+jWBHddgg1G5zZXyl/yCl7qJiVrFBKSlHznTObtMG485O/NpC
 gZZeAlKi6dKsqIS5mqQ6nmjhCIBwm0g+Uem/A8Dl3Q2nKCs7qdKav9BCqDUSJHkxdfno
 nSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iEJA6wY6taUxf8Zgjs/nOzy/DyCxutBDoaKlU773se0=;
 b=jA68dkJ9OHNYlvd8VCZG21R9VZdDW5WDrTIr1ddG7tB3UFxz6EPpxVJeYCwbnUPVxQ
 uXcbTtTYFs7ZNuLgkn8B1Gfx0xwdEOGSZYHDWfAHDIo2BrVXDFIBjHvj9aSwL/OuuD7g
 QUHAvOi/g9oGR0AMJJWKS0wqeiZUPhX47zQFJkDNMVPzY1vs8GblVcntGR4pzY9OnRHx
 v2KRHl/Jz2fmYjEU1LziuP+zwgKmLUeLcO39m7B2erhWe+sHAMCK248puHtKA4gb2x53
 NFYAdCqDMtblWSOlkIOBqVUBKczn+tc0BYhOuVg+WDRqzJwQV7LnSsVhnFufibNYbDMS
 bonA==
X-Gm-Message-State: AOAM531ev9bxRSWiKQZofHw89HWK2YD4ljCHvFjv7gHbPh7P2vhjF854
 jeHmkR8T9ygJ64YETaBHeYdfLof9UkUu/eZ+
X-Google-Smtp-Source: ABdhPJyaDKrtuOyL0GP4sjEP93niEY3itcfFwM7bEc9aJrY+n9s5hljzI7N6ltCNwInGACn2n9YrQw==
X-Received: by 2002:a2e:a7c4:: with SMTP id x4mr3239805ljp.224.1642086080609; 
 Thu, 13 Jan 2022 07:01:20 -0800 (PST)
Received: from UNIT-808.labs.intellij.net ([91.132.204.20])
 by smtp.gmail.com with ESMTPSA id w25sm314278lfl.155.2022.01.13.07.01.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jan 2022 07:01:19 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 0/7] Add vmnet.framework based network backend
Date: Thu, 13 Jan 2022 18:01:06 +0300
Message-Id: <20220113150113.58437-1-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::132
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, jasowang@redhat.com,
 phillip.ennen@gmail.com, armbru@redhat.com, r.bolshakov@yadro.com,
 phillip@axleos.com, akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

macOS provides networking API for VMs called 'vmnet.framework':
https://developer.apple.com/documentation/vmnet

We can provide its support as the new QEMU network backends which
represent three different vmnet.framework interface usage modes:

  * `vmnet-shared`:
    allows the guest to communicate with other guests in shared mode and
    also with external network (Internet) via NAT. Has (macOS-provided)
    DHCP server; subnet mask and IP range can be configured;

  * `vmnet-host`:
    allows the guest to communicate with other guests in host mode.
    By default has enabled DHCP as `vmnet-shared`, but providing
    network unique id (uuid) can make `vmnet-host` interfaces isolated
    from each other and also disables DHCP.

  * `vmnet-bridged`:
    bridges the guest with a physical network interface.

This backends cannot work on macOS Catalina 10.15 cause we use
vmnet.framework API provided only with macOS 11 and newer. Seems
that it is not a problem, because QEMU guarantees to work on two most
recent versions of macOS which now are Big Sur (11) and Monterey (12).

Also, we have one inconvenient restriction: vmnet.framework interfaces
can create only privileged user:
`$ sudo qemu-system-x86_64 -nic vmnet-shared`

Attempt of `vmnet-*` netdev creation being unprivileged user fails with
vmnet's 'general failure'.

This happens because vmnet.framework requires `com.apple.vm.networking`
entitlement which is: "restricted to developers of virtualization software.
To request this entitlement, contact your Apple representative." as Apple
documentation says:
https://developer.apple.com/documentation/bundleresources/entitlements/com_apple_vm_networking

One more note: we still have quite useful but not supported
'vmnet.framework' features as creating port forwarding rules, IPv6
NAT prefix specifying and so on.

Nevertheless, new backends work fine and tested within `qemu-system-x86-64`
on macOS Bir Sur 11.5.2 host with such nic models:
  * e1000-82545em
  * virtio-net-pci
  * vmxnet3

The guests were:
  * macOS 10.15.7
  * Ubuntu Bionic (server cloudimg)


This series partially reuses patches by Phillip Tennen:
https://patchew.org/QEMU/20210218134947.1860-1-phillip.ennen@gmail.com/
So I included them signed-off line into one of the commit messages and
also here.

v1 -> v2:
 Since v1 minor typos were fixed, patches rebased onto latest master,
 redundant changes removed (small commits squashed)
v2 -> v3:
 - QAPI style fixes
 - Typos fixes in comments
 - `#include`'s updated to be in sync with recent master
v3 -> v4:
 - Support vmnet interfaces isolation feature
 - Support vmnet-host network uuid setting feature
 - Refactored sources a bit
v4 -> v5:
 - Missed 6.2 boat, now 7.0 candidate
 - Fix qapi netdev descriptions and styles
   (@subnetmask -> @subnet-mask)
 - Support vmnet-shared IPv6 prefix setting feature
v5 -> v6
 - provide detailed commit messages for commits of
   many changes
 - rename properties @dhcpstart and @dhcpend to
   @start-address and @end-address
 - improve qapi documentation about isolation
   features (@isolated, @net-uuid)
v6 -> v7:
 - update MAINTAINERS list
v7 -> v8
 - QAPI code style fixes
v8 -> v9
 - Fix building on Linux: add missing qapi
   `'if': 'CONFIG_VMNET'` statement to Netdev union
v9 -> v10
 - Disable vmnet feature for macOS < 11.0: add
   vmnet.framework API probe into meson.build.
   This fixes QEMU building on macOS < 11.0:
   https://patchew.org/QEMU/20220110034000.20221-1-jasowang@redhat.com/
v10 -> v11
 - Enable vmnet for macOS 10.15 with subset of available
   features. Disable vmnet for macOS < 10.15.
 - Fix typos
v11 -> v12
 - use more general macOS version check with
   MAC_OS_VERSION_11_0 instead of manual
   definition creating.

Vladislav Yaroshchuk (7):
  net/vmnet: add vmnet dependency and customizable option
  net/vmnet: add vmnet backends to qapi/net
  net/vmnet: implement shared mode (vmnet-shared)
  net/vmnet: implement host mode (vmnet-host)
  net/vmnet: implement bridged mode (vmnet-bridged)
  net/vmnet: update qemu-options.hx
  net/vmnet: update MAINTAINERS list

 MAINTAINERS                   |   5 +
 meson.build                   |  16 +-
 meson_options.txt             |   2 +
 net/clients.h                 |  11 ++
 net/meson.build               |   7 +
 net/net.c                     |  10 +
 net/vmnet-bridged.m           | 120 ++++++++++++
 net/vmnet-common.m            | 333 ++++++++++++++++++++++++++++++++++
 net/vmnet-host.c              | 122 +++++++++++++
 net/vmnet-shared.c            | 100 ++++++++++
 net/vmnet_int.h               |  48 +++++
 qapi/net.json                 | 133 +++++++++++++-
 qemu-options.hx               |  25 +++
 scripts/meson-buildoptions.sh |   3 +
 14 files changed, 932 insertions(+), 3 deletions(-)
 create mode 100644 net/vmnet-bridged.m
 create mode 100644 net/vmnet-common.m
 create mode 100644 net/vmnet-host.c
 create mode 100644 net/vmnet-shared.c
 create mode 100644 net/vmnet_int.h

-- 
2.23.0


