Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 646DE48DCF1
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 18:30:04 +0100 (CET)
Received: from localhost ([::1]:52322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n83vH-0007Ok-DI
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 12:30:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n83oE-0007fR-4J
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:22:46 -0500
Received: from [2a00:1450:4864:20::12d] (port=35465
 helo=mail-lf1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n83oB-0000oI-Va
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:22:45 -0500
Received: by mail-lf1-x12d.google.com with SMTP id g11so22051301lfu.2
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 09:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mv5Yr7pw9C3x9p4dsBWmcRdBMReleXO/SS/7X+bDpL8=;
 b=dxgWfYzXHJnVxtkRSguxCQ2Bwg8HoCspCqdBL1t7SRLRoThaSpHNcP0/hKq1jUPC09
 7vtwDh7m/w0XYfqb7sf1KKA4V+0Y5nM6eOJe+3yfOWkVWH1SN+da1z45/z3wN+YkwceW
 ttm0tK/VqRufMDAskhCQL1gZ5Rdz9CPx9ZGxfrzWCR9tvTUmsOL3uldifa4Tie8Il7U4
 5zVVzqRa8q84u/JK++4YvuB9Xtr3pwIXwODXDA1ZxSxajlkNNKsYojr1PfhqJvtA06fH
 HL7CW+NmhEQ/QYVFemiMLjgM5J0hbZJPmosYU4BDKm1eiHx2hlYg+I//sRgcntpVkW5V
 SvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mv5Yr7pw9C3x9p4dsBWmcRdBMReleXO/SS/7X+bDpL8=;
 b=7Pj9ZLUnWyOckt3gXCT+x5le0SymGlvBllGeD4kH9DjaTM5AmabeyUfwZdSsqeihzt
 Klf8lmvmT7lRcE22HGoynoqBCzSeoI11ZFkVNs9HMhWduQXMpGnyJAYJbjOV2CrXmNp1
 XJNS0Kr6iHjOOIzPTK1TD/L6udo52cJTn8DRzPjWVyx3QIOZU0A3GLMIOgnNR354rTb+
 6owU99jldxTpUfADt4vmc7NJkZFTOnO/8H+XGefgm77/ePqaclhJd3lvY6D+HK6kUYUy
 JqoCth9SH0OGc1e3u/J/PxIlzPogh/YiURnWrSwsLHtILlptUlfTXNRYT7Nnta6uPZ3F
 ZZng==
X-Gm-Message-State: AOAM531ynpznavlnlKDQC4MMuoTNSV26P1tutjHcF+VnwoY9+FtaQOn+
 w25uDXHW2a9yBlaV9WhB9+pGqVQOvKCMWKRo
X-Google-Smtp-Source: ABdhPJzA1ujTA9e1Hq0AUoZWFrq07aldLdGjNM04TClLBxBO+Si1JlBLzfwAsUCNl3QgR4GQzadStA==
X-Received: by 2002:a05:6512:168b:: with SMTP id
 bu11mr4266275lfb.664.1642094561937; 
 Thu, 13 Jan 2022 09:22:41 -0800 (PST)
Received: from UNIT-808.labs.intellij.net ([91.132.204.19])
 by smtp.gmail.com with ESMTPSA id h17sm323410ljk.41.2022.01.13.09.22.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jan 2022 09:22:41 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 0/7] Add vmnet.framework based network backend
Date: Thu, 13 Jan 2022 20:22:12 +0300
Message-Id: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
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
Cc: peter.maydell@linaro.org, Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>,
 alex.bennee@linaro.org, jasowang@redhat.com, phillip.ennen@gmail.com,
 armbru@redhat.com, dirty@apple.com, f4bug@amsat.org, roman@roolebo.dev,
 r.bolshakov@yadro.com, agraf@csgraf.de, phillip@axleos.com,
 akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io,
 qemu_oss@crudebyte.com, eblake@redhat.com, kraxel@redhat.com
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


