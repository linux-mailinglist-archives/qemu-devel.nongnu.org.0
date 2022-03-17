Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A714DCC87
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 18:33:29 +0100 (CET)
Received: from localhost ([::1]:39990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUu08-0007ci-9r
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 13:33:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUtvf-00050o-MZ
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 13:28:51 -0400
Received: from [2a00:1450:4864:20::42c] (port=44841
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUtvd-0005oM-B9
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 13:28:51 -0400
Received: by mail-wr1-x42c.google.com with SMTP id b19so8302674wrh.11
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 10:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4hYUT9bixu6ia4LkUmHjUzu5TikFN1a8CegvmSj6pcM=;
 b=RfTY7ozCQ7nw800w3Lc7LXla8oE64pjGBinVm1U5w0I3US7vRFgAeJsd2RdgTgth4f
 yphheFcK3EpqzP9Af9zE9P7fJjG/U3APTKaGV+ZQlnBSMm+92hO9a19FACCFjEWoWo6b
 4ea4gYqRtHq6OIFD/j9IOLOzCj0LggCXwBljo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4hYUT9bixu6ia4LkUmHjUzu5TikFN1a8CegvmSj6pcM=;
 b=WiFoSl+CBzD5CYXyqDUfP9QkFGxLVGFtNRllABdQvarVDGAgE9CllgommxWDsmbQTS
 VwdhaDhJyuiDmKuHfb99gG2ZQSmwIzjUIPiL4J3sY+V1uA6J2+4Jhh9/1GsDdOPyI+7E
 ynUfYsVu5LvCHygcn3lNDMq85VsZL3GJ+g0H0BIyRbl56xAC6KOSLEZAVZ1RiebdnORq
 ccxj8tx/xsCj5pYSdstyWtXGZJ/ghL564oDaxeMdKWwX+hjlDftPBQV8/38dB5OAvvy6
 SwGEZR1VYr1cgo6FBIXfpG98HqH8QkWfRpKVVnlobFGqibsnMi9JhobnAsCOAdN1cClU
 SrGw==
X-Gm-Message-State: AOAM532sngpBecgjYYlVFC4LCOA1NmawGXyajBWP75OIALSpAnfdVuwr
 nBYUxJ5ZVfGejAVp/wTvbPuYL1TNBnVoZwcCQzs=
X-Google-Smtp-Source: ABdhPJwzeweowxdeloF9GEDu4GwsqmQazpH6Mn0LBr2UYYdDlTxSRkqFsnGuisLJZMWpSBQnC7/5yA==
X-Received: by 2002:a05:6000:156f:b0:1f1:f99e:779e with SMTP id
 15-20020a056000156f00b001f1f99e779emr4955372wrz.99.1647538127169; 
 Thu, 17 Mar 2022 10:28:47 -0700 (PDT)
Received: from localhost.localdomain
 (ec2-3-121-162-165.eu-central-1.compute.amazonaws.com. [3.121.162.165])
 by smtp.gmail.com with ESMTPSA id
 2-20020a1c1902000000b00380d3873d6asm4890702wmz.43.2022.03.17.10.28.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Mar 2022 10:28:46 -0700 (PDT)
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
Subject: [PATCH v22 0/7] Add vmnet.framework based network backend
Date: Thu, 17 Mar 2022 20:28:32 +0300
Message-Id: <20220317172839.28984-1-Vladislav.Yaroshchuk@jetbrains.com>
X-Mailer: git-send-email 2.34.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
v15 -> v16
 - common: complete sending pending packets when
   QEMU is ready, refactor, fix memory leaks
 - QAPI: change version to 7.1 (cause 7.0 feature freeze
   happened). This is the only change in QAPI, Markus Armbruster,
   please confirm if you can (decided to drop your Acked-by due
   to this change)
 - vmnet-bridged: extend "supported ifnames" message buffer len
 - fix behaviour dependence on debug (add "return -1" after
   assert_not_reached)
 - use PRIu64 for proper printing
 - NOTE: This version of patch series may be one the last
   I submit - JetBrains has suspended operations in
   Russia indefinitely due to all the awful things happened
   the last weeks. I may leave this company and loose the
   ability to work on vmnet support :(
   It will be perfect if someone can handle my unfinished work,
   if something required to fix/improve is found.
   Because of this, MAINTAINERS list update is dropped
v16 -> v17
 - host: move network_uuid to local variable
 - common: refactor, add documentation
 - common/send (vmnet->qemu): read new packets after QEMU
   send_cb invoked
 - common/receive (qemu->vmnet): drop redundant vmnet
   status checks
 - restore dropped commit messaged from the previous series
v17 -> v18
 - use VmnetState struct for all three operation modes
 - drop send_enabled flag
 - do not unregister vmnet event callback on cleanup,
   let vmnet.framework do everything itself while interface
   destruction
v18 -> v19
 - use positive pointers values to describe unsent packets
   window of VmnetState buffer
v19 -> v20
 - vmnet-host: minor but required refactor
v20 -> v21
 - vmnet-bridged: dynamically allocate valid ifnames list
 - QAPI schema: add `Markus Armbruster <armbru@redhat.com>`'s acked-by
v21 -> v22
 - common: fix if_desc memory leak

Vladislav Yaroshchuk (7):
  net/vmnet: add vmnet dependency and customizable option
  net/vmnet: add vmnet backends to qapi/net
  net/vmnet: implement shared mode (vmnet-shared)
  net/vmnet: implement host mode (vmnet-host)
  net/vmnet: implement bridged mode (vmnet-bridged)
  net/vmnet: update qemu-options.hx
  net/vmnet: update hmp-commands.hx

 hmp-commands.hx               |   6 +-
 meson.build                   |  16 +-
 meson_options.txt             |   2 +
 net/clients.h                 |  11 +
 net/meson.build               |   7 +
 net/net.c                     |  10 +
 net/vmnet-bridged.m           | 152 ++++++++++++++
 net/vmnet-common.m            | 378 ++++++++++++++++++++++++++++++++++
 net/vmnet-host.c              | 128 ++++++++++++
 net/vmnet-shared.c            | 114 ++++++++++
 net/vmnet_int.h               |  63 ++++++
 qapi/net.json                 | 133 +++++++++++-
 qemu-options.hx               |  25 +++
 scripts/meson-buildoptions.sh |   1 +
 14 files changed, 1042 insertions(+), 4 deletions(-)
 create mode 100644 net/vmnet-bridged.m
 create mode 100644 net/vmnet-common.m
 create mode 100644 net/vmnet-host.c
 create mode 100644 net/vmnet-shared.c
 create mode 100644 net/vmnet_int.h

-- 
2.34.1.vfs.0.0


