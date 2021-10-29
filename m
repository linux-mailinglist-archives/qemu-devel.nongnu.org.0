Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B73A43FE73
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 16:30:59 +0200 (CEST)
Received: from localhost ([::1]:47092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgSuH-00008T-6W
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 10:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mgSpW-0006Nq-Tj
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 10:26:02 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:39168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mgSpU-0003g4-F4
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 10:26:02 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.10])
 by beetle.greensocs.com (Postfix) with ESMTPS id EC6FC2078C;
 Fri, 29 Oct 2021 14:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1635517556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=c6mMLDYoDrT+FIufPLuodKHId54Bk82k+yVNg50Fg8I=;
 b=ZgQJ+oJPtGVlblS5UFa6L/YtO77QdhNhd+6KIQVBKDrUeAilY/iCAeS8OMiXlkxh/KiZon
 ezXpjE6Kg2h9KZ/q/KeK66TP/F8u3BTsEYjAjdXlvpFZ+A5AZTdl81QMo8RxWRUti96K7G
 TzlAebvy5LjC3tX7s8+93E/h77cOBZw=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] Dynamic sysbus device check error report
Date: Fri, 29 Oct 2021 16:22:55 +0200
Message-Id: <20211029142258.484907-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, mark.burton@greensocs.com,
 edgari@xilinx.com, mirela.grujic@greensocs.com,
 Alistair Francis <alistair.francis@wdc.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Dynamic sysbus devices are allowed by a per-machine basis.
Right now, the allowance check is done during an machine_init_done
notifier, well after such devices are created.

This series move the check at the right place (during the handling
of a QMP device_add command or -device CLI option) so that we can
report the error right away.

This was initially part of my RFC (hence the v3) about allowing to
create devices during the machine initialized phase (link is below).
But it seems to me these patches make sense already as a standalone
cleanup.

Only patch 1 miss a review.

Thanks,
Damien

v3:
 + standalone series
 + minor tweaks

v2 was part of:
https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg05683.html

Damien Hedde (3):
  machine: add device_type_is_dynamic_sysbus function
  qdev-monitor: Check sysbus device type before creating it
  machine: remove the done notifier for dynamic sysbus device type check

 include/hw/boards.h    | 16 +++++++++++++++-
 hw/core/machine.c      | 40 ++++++++++------------------------------
 softmmu/qdev-monitor.c | 11 +++++++++++
 3 files changed, 36 insertions(+), 31 deletions(-)

-- 
2.33.0


