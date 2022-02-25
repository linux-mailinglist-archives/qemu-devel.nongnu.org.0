Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 082B54C4C40
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 18:35:04 +0100 (CET)
Received: from localhost ([::1]:53776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNeUh-0004SV-3D
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 12:35:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nNeAX-00078x-5t
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:14:14 -0500
Received: from [2a00:1450:4864:20::22a] (port=41775
 helo=mail-lj1-x22a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nNeAU-0000Rq-Qy
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:14:12 -0500
Received: by mail-lj1-x22a.google.com with SMTP id t14so8262623ljh.8
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=juyxo5QzTG00hA3hL2K7dL54b800nICXpCCd2zg0H98=;
 b=EUzyp8wgdj2K/ifLHcteCmWN2je1JAu95MTBhPauMXbJL4Jb6EAE9K4mExqITwX8Mq
 P4CABfWGJIzO+IgEcRcBe4etbDRlrQ5wmjA3HbzyI/0fb3DFyxyRuPQycYB86A2zkvmn
 qPsVonx12lvpKIl0oLx41nfD/IwPB0sLmzuH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=juyxo5QzTG00hA3hL2K7dL54b800nICXpCCd2zg0H98=;
 b=XtEqcgQQ6/RemoUYM077s3zjUKPGpI9z3sWELVvBoPkqogsiyVuMEsudImNwdL+FLU
 5RBUFyFsLifWI8tGIiH8WbEdAY+YqcwdxnF0ZaKyQaY8/KoCGfTeoEUwasvGcTmqdH7v
 2nG9O+LiVAqdC0QmP3zgiKow13VPCI7zoPKeY8xX9IPGdxcCYoEdd1R1/oPASRIDOOP2
 VrGNMCo82PVfRH1Zutv2OBtcz2mwhgKLKziiNpWpzPVPBRAmQevTYkrTmmIqNbhTPgJH
 BH0Boby403s55fD6LVewFGCmO6mchODChYPOnVt+mfYSDMLUSemRL7fY7uE2bxyrAaeM
 gY0A==
X-Gm-Message-State: AOAM532BF0BLiR8xS2leGxfPhjMkFehaZQl1BbTsmrfRKOT3j/ozrxJs
 0q5Pyu+XP2fUsPp9Qyuumb50UHuYl+mHxqTx
X-Google-Smtp-Source: ABdhPJytKEriDbhau3X7UzyLxZdp5A3iz/Q6WcJ7yFTPW9ezi3Bu2mDnW+3H1C7CaFrtStlq4USoNw==
X-Received: by 2002:a2e:a607:0:b0:245:f6e5:ad63 with SMTP id
 v7-20020a2ea607000000b00245f6e5ad63mr5983228ljp.89.1645809248291; 
 Fri, 25 Feb 2022 09:14:08 -0800 (PST)
Received: from UNIT-808.lan ([2a02:2698:6c2a:768f:813e:378d:5c94:9b97])
 by smtp.gmail.com with ESMTPSA id
 bq5-20020a056512150500b004433c791651sm252024lfb.69.2022.02.25.09.14.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 25 Feb 2022 09:14:07 -0800 (PST)
From: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
X-Google-Original-From: Vladislav Yaroshchuk
 <Vladislav.Yaroshchuk@jetbrains.com>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, r.bolshakov@yadro.com, eblake@redhat.com,
 phillip.ennen@gmail.com, phillip@axleos.com, akihiko.odaki@gmail.com,
 armbru@redhat.com, hsp.cat7@gmail.com, hello@adns.io, roman@roolebo.dev,
 peter.maydell@linaro.org, dirty@apple.com, f4bug@amsat.org,
 agraf@csgraf.de, kraxel@redhat.com, alex.bennee@linaro.org,
 qemu_oss@crudebyte.com,
 Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
Subject: [PATCH v15 0/8] Add vmnet.framework based network backend
Date: Fri, 25 Feb 2022 20:13:54 +0300
Message-Id: <20220225171402.64861-1-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-lj1-x22a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 25 Feb 2022 12:16:18 -0500
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
v12 -> v13
 - fix incorrect macOS version bound while
   'feature available since 11.0' check.
   Use MAC_OS_X_VERSION_MIN_REQUIRED instead of
   MAC_OS_X_VERSION_MAX_ALLOWED.
v13 -> v14
 - fix memory leaks
 - get rid of direct global mutex taking while resending
   packets from vmnet to QEMU, schedule a bottom half
   instead (it can be a thing to discuss, maybe exists a
   better way to perform the packets transfer)
 - update hmp commands
 - a bit refactor everything
 - change the email from which patches are being
   submitted, same to email in MAINTAINERS list
 - P.S. sorry for so late reply
v14 -> v15
 - restore --enable-vdi and --disable-vdi
   mistakenly dropped in previous series

Vladislav Yaroshchuk (8):
  net/vmnet: add vmnet dependency and customizable option
  net/vmnet: add vmnet backends to qapi/net
  net/vmnet: implement shared mode (vmnet-shared)
  net/vmnet: implement host mode (vmnet-host)
  net/vmnet: implement bridged mode (vmnet-bridged)
  net/vmnet: update qemu-options.hx
  net/vmnet: update hmp-commands.hx
  net/vmnet: update MAINTAINERS list

 MAINTAINERS                   |   5 +
 hmp-commands.hx               |   6 +-
 meson.build                   |  16 +-
 meson_options.txt             |   2 +
 net/clients.h                 |  11 ++
 net/meson.build               |   7 +
 net/net.c                     |  10 ++
 net/vmnet-bridged.m           | 144 +++++++++++++++
 net/vmnet-common.m            | 322 ++++++++++++++++++++++++++++++++++
 net/vmnet-host.c              | 127 ++++++++++++++
 net/vmnet-shared.c            | 111 ++++++++++++
 net/vmnet_int.h               |  62 +++++++
 qapi/net.json                 | 133 +++++++++++++-
 qemu-options.hx               |  25 +++
 scripts/meson-buildoptions.sh |   1 +
 15 files changed, 978 insertions(+), 4 deletions(-)
 create mode 100644 net/vmnet-bridged.m
 create mode 100644 net/vmnet-common.m
 create mode 100644 net/vmnet-host.c
 create mode 100644 net/vmnet-shared.c
 create mode 100644 net/vmnet_int.h

-- 
2.34.1.vfs.0.0


