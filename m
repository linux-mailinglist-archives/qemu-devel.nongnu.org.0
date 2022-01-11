Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 293F248B93A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 22:17:18 +0100 (CET)
Received: from localhost ([::1]:39042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7OW4-0000I3-OG
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 16:17:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n7OTf-0005yU-7B
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 16:14:47 -0500
Received: from [2a00:1450:4864:20::12d] (port=41544
 helo=mail-lf1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n7OTd-000315-81
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 16:14:46 -0500
Received: by mail-lf1-x12d.google.com with SMTP id x7so1090408lfu.8
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 13:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vw1PSKwGa3mvEOOChDFgC4lzo8KZEwZZFyc5N+ZiSFg=;
 b=j7mPbE53IqEUtp1oXIvjcp0jJwFyEzPwZCkmyqDiHgOsl4XFyi8sW7ITDgfvuFl38S
 TpL8zN9UPG7i8hHUIe+059ZbTkqT4zXsFEYMaqRzdNlBwdSVxTzz56mH09EQStyjaI+l
 KEZlTfqOxYK/2UNmux/O5vGXa5D0NXrVcDLMTjrqw1abIcIIFiT+K9o31EYxrkF0aB0E
 65m8VJZK6wdLpvkKSum/hkRvSYgVwqvu3wJqZqHeU4UyIgXvNMrYTPbuUDvCbY9FDpHW
 GZW67TCjCkg3BCP/rszvQt++x4oqpt2eCw+Hx4aiuHrYmuB3gf3mMrM+yzSrP09DjIH6
 zvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vw1PSKwGa3mvEOOChDFgC4lzo8KZEwZZFyc5N+ZiSFg=;
 b=fgH9DdOmhPCDEKTa3IE8tPCIuyxA1SV5eti0uR7sSWn5WjU6mFpqrizrdKv8Fv2qHx
 RFLJ3vJ9LM+6Yd2DP9tyCj+G4wxx/TulSxQWcwj6J1o8OX0kdr97XK7yFHuuqlgfkDov
 S8JSUA/FKs2lDn5zt5hqkjaCbFG94butykdkc5t/lClaK6981ldS0RTGuAMS6a0OVdtk
 CW80+mSAOVQHo50a3X0wknlbptoWIqryR/HgGNHSKf/OAOKWFy/Rq+8gYuxVPriTbUnE
 8Z5uU1foFe8bMDrbGdj1QAGUsll7M3K6LI8Hp5niecajK4RgCQt1WI1k+kx3PuJx7Nhb
 cRsg==
X-Gm-Message-State: AOAM533y2+oMKFGDMufp2RGpfI3ibmJlIWumgtsPQiZ19NO6zKHHft/x
 U0gluZlbTP5kHteaPrFPfIDEu7hHWQ1ICQ==
X-Google-Smtp-Source: ABdhPJye+tF1z9Us4IeW5a7tOuHmaBY6yuoEdwaMi4W/V8VawKLQkbYW19xhVlPvtEdrTWoKwe756A==
X-Received: by 2002:a2e:8715:: with SMTP id m21mr4078062lji.364.1641935682604; 
 Tue, 11 Jan 2022 13:14:42 -0800 (PST)
Received: from UNIT-808.lan ([2a02:2698:6c2a:6a8d:c51:3b28:285b:bcad])
 by smtp.gmail.com with ESMTPSA id u5sm1422045lja.36.2022.01.11.13.14.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jan 2022 13:14:41 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 0/7] Add vmnet.framework based network backend
Date: Wed, 12 Jan 2022 00:14:15 +0300
Message-Id: <20220111211422.21789-1-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x12d.google.com
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
 net/net.c                     |  10 ++
 net/vmnet-bridged.m           | 111 ++++++++++++
 net/vmnet-common.m            | 330 ++++++++++++++++++++++++++++++++++
 net/vmnet-host.c              | 105 +++++++++++
 net/vmnet-shared.c            |  92 ++++++++++
 net/vmnet_int.h               |  48 +++++
 qapi/net.json                 | 132 +++++++++++++-
 qemu-options.hx               |  25 +++
 scripts/meson-buildoptions.sh |   3 +
 14 files changed, 894 insertions(+), 3 deletions(-)
 create mode 100644 net/vmnet-bridged.m
 create mode 100644 net/vmnet-common.m
 create mode 100644 net/vmnet-host.c
 create mode 100644 net/vmnet-shared.c
 create mode 100644 net/vmnet_int.h

-- 
2.23.0


