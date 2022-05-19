Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85F852D7ED
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 17:38:46 +0200 (CEST)
Received: from localhost ([::1]:40148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nriEf-0004lP-NV
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 11:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nriAe-0001an-56
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:34:38 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:48978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nriAY-0007oU-9x
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:34:34 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.10])
 by beetle.greensocs.com (Postfix) with ESMTPS id 2427520782;
 Thu, 19 May 2022 15:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1652974465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NGOPmWPSlJURdp1+Etg66IbtKhn2QjvwI3wOOK0kCxI=;
 b=qo86juJh9emArtDQWQjeXmmUSZJPry7usQ29F1COOUPwf/gj1cn+0EerD/dZFqgczr+wcH
 os/rlrVkoaJN0NXhriqb9mRzG/Ydts2X9SG8JXUZGlWnzB+v3pityH0CNZd8n2dis2kMZU
 ZuBT99pFn/imNBi1OegZWN9K8kJczi0=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: mark.burton@greensocs.com, edgari@xilinx.com,
 Damien Hedde <damien.hedde@greensocs.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 0/6] QAPI support for device cold-plug
Date: Thu, 19 May 2022 17:33:56 +0200
Message-Id: <20220519153402.41540-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi all,

As of now dynamic cold plug of device is only possible using the CLI
"-device" option. This series add support for device cold-plug using QAPI.

Patches 2, 5 and 6 are not reviewed yet.

It relies on the use of the "preconfig" mode (only way to stop QEMU
early enough) and requires more control on the machine phase than we had
before.

This work is part of our work towards to build a machine from scratch
using QAPI (see v4 or [1]).
But this is an independent part which can already be used to add
devices on any machine using QAPI instead of having to use the CLI to
pass some options.

For example, in this command the network interface could be added using qapi:
> $ qemu-system-aarch64 -display none -M virt -cpu cortex-a53 \
>     -drive file=./images/rootfs.ext4,if=none,format=raw,id=hd0 \
>     -device virtio-blk-device,drive=hd0 \
>     -kernel ./images/Image -append "rootwait root=/dev/vda console=ttyAMA0" \
>     -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 \
>     -serial stdio

By using the following command line:
> $ qemu-system-aarch64 -display none -M virt -cpu cortex-a53 \
>    -drive file=./images/rootfs.ext4,if=none,format=raw,id=hd0 \
>    -device virtio-blk-device,drive=hd0 \
>    -kernel ./images/Image -append "rootwait root=/dev/vda console=ttyAMA0" \
>    -serial stdio -preconfig -qmp socket,path=./qmpsocket,server
and then qmp-shell (or any other qmp tool) to add the network interface and
device:
> $ qmp-shell ./qmpsocket
> (QEMU) netdev_add type=user id=eth0
> {"return": {}}
> (QEMU) device_add driver=virtio-net-device netdev=eth0
> {"return": {}}
> (QEMU) x-exit-preconfig
> {"return": {}}

Thanks,
--
Damien

v5:
 + refactor patch 2 to avoid indentation changes

v4: https://lore.kernel.org/qemu-devel/20220223090706.4888-1-damien.hedde@greensocs.com/

[1]: https://github.com/GreenSocs/qemu-qmp-machines

Damien Hedde (5):
  machine: add phase_get() and document phase_check()/advance()
  machine&vl: introduce phase_until() to handle phase transitions
  vl: support machine-initialized target in phase_until()
  qapi/device_add: compute is_hotplug flag
  RFC qapi/device_add: handle the rom_order_override when cold-plugging

Mirela Grujic (1):
  qapi/device_add: Allow execution in machine initialized phase

 qapi/qdev.json         |  3 +-
 include/hw/qdev-core.h | 33 +++++++++++++++++++
 hw/core/qdev.c         |  5 +++
 monitor/misc.c         |  2 +-
 softmmu/qdev-monitor.c | 20 ++++++++++--
 softmmu/vl.c           | 72 ++++++++++++++++++++++++++++++++++++++----
 hmp-commands.hx        |  1 +
 7 files changed, 126 insertions(+), 10 deletions(-)

-- 
2.36.1


