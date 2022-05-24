Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E12532BB6
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 15:53:59 +0200 (CEST)
Received: from localhost ([::1]:35108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntUz0-0005Ox-K5
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 09:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1ntUtV-0002gB-50
 for qemu-devel@nongnu.org; Tue, 24 May 2022 09:48:17 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:53540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1ntUtT-0001ck-2P
 for qemu-devel@nongnu.org; Tue, 24 May 2022 09:48:16 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.10])
 by beetle.greensocs.com (Postfix) with ESMTPS id CB28F2078C;
 Tue, 24 May 2022 13:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1653400090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/DbmTJ7SmKta5MOScm8maz8BCE8MVV87FxWDKOubGFU=;
 b=LAQrizlWjrDYtKySvkf7tNvxkkWJvMEPhjWgnPCVLrHa0iA0sfyiSZ3sXzHuyvD4xmnX5C
 0TYydwtjqNjkRASHzpL7UKHSr8wSotqbQSqsPYIkGT/yjeu2wNVAMSBo8huVCvehE7WVy+
 Ygj2Yrn2jI+hRjZng03pomeeX23Pduo=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH v5 0/3] Sysbus device generic QAPI plug support
Date: Tue, 24 May 2022 15:48:06 +0200
Message-Id: <20220524134809.40732-1-damien.hedde@greensocs.com>
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

This series is about enabling to plug sysbus devices with
device_add QAPI command. I've put RFC because, there are several
options and I would like to know if you think the current version
is ok to be added in qemu.

Right now only a few sysbus device can be plugged using "-device"
CLI option and a custom plugging mechanism. A machine defines a
list of allowed/supported sysbus devices and provides some code to
handle the plug. For example, it sets up the memory map and irq
connections.

In order to configure a machine from scratch with qapi, we want to
cold plug sysbus devices to the _none_ machine with qapi commands
without requiring the machine to provide some specific per-device
support.

There are mostly 2 options (option 1 is in these patches). Note that
in any case this only applies to "user-creatable" device.

+ Option 1: Use the current plug mechanism by allowing any sysbus
device, without adding handle code in the machine.

+ Option 2: Add a boolean flag in the machine to allow to plug any
sysbus device. We can additionally differentiate the sysbus devices
requiring the legacy plug mechanism (with a flag, for example) and
the others.

The setup of the memory map and irq connections is not related to
the option choice above. We planned to rely on qapi commands to do
these operations. A new _sysbus-mmio-map_ command is proposed in this
series to setup the mapping. Irqs can already be connected using the
_qom-set_ command.
Alternatively we could probably add parameters/properties to device_add
to handle the memory map, but it looks more complicated to achieve.

Based-on: <20220519153402.41540-1-damien.hedde@greensocs.com>
    ( QAPI support for device cold-plug )
Note that it does not stricly require this to be merged, but this series
does not make much sense without the ability to cold plug with device_add
first.

Thanks for your feedback,
--
Damien

Damien Hedde (3):
  none-machine: allow cold plugging sysbus devices
  softmmu/memory: add memory_region_try_add_subregion function
  add sysbus-mmio-map qapi command

 qapi/qdev.json         | 31 ++++++++++++++++++++++++++
 include/exec/memory.h  | 22 +++++++++++++++++++
 hw/core/null-machine.c |  4 ++++
 hw/core/sysbus.c       | 49 ++++++++++++++++++++++++++++++++++++++++++
 softmmu/memory.c       | 26 ++++++++++++++--------
 5 files changed, 123 insertions(+), 9 deletions(-)

-- 
2.36.1


