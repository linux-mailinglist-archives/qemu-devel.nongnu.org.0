Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3EE673A40
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 14:31:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIUxN-0005xN-71; Thu, 19 Jan 2023 08:27:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIUx7-0005r7-2y
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:27:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIUx1-0008CC-V5
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:27:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674134838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PFuljNj+yQ+nEusFyFppVKeKuMiUQaaObISQpsyjICY=;
 b=TbFHKFcGxSgjI72u/3ik0iPLvs+Ov+HVtfvizL649VVe2AvbBFsZ6rNs1uiCzA+UORD2v2
 Y2+NsPShfi57VN1r6QQTiB1N45Yi8flVEsCSfud8LdWi1tF3ATYAo1xH45JNcwUBbWpk6N
 Nd5mz+VNXiw/d097iCWvM08a3PVdHks=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-j-LwDnTKOd62QHl_M4eHBg-1; Thu, 19 Jan 2023 08:27:14 -0500
X-MC-Unique: j-LwDnTKOd62QHl_M4eHBg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B05E2807D6F;
 Thu, 19 Jan 2023 13:27:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 702E0C15BAE;
 Thu, 19 Jan 2023 13:27:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4CB5F21E6A28; Thu, 19 Jan 2023 14:27:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 00/17] Monitor patches for 2023-01-19
Date: Thu, 19 Jan 2023 14:26:56 +0100
Message-Id: <20230119132713.3493556-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 7ec8aeb6048018680c06fb9205c01ca6bda08846:

  Merge tag 'pull-tpm-2023-01-17-1' of https://github.com/stefanberger/qemu-tpm into staging (2023-01-17 15:47:53 +0000)

are available in the Git repository at:

  https://repo.or.cz/qemu/armbru.git tags/pull-monitor-2023-01-19

for you to fetch changes up to a0506b7c8fc72f7bca272647f359d76cc40a02c1:

  ui: Simplify control flow in qemu_mouse_set() (2023-01-19 13:30:01 +0100)

----------------------------------------------------------------
Monitor patches for 2023-01-19

----------------------------------------------------------------
Markus Armbruster (17):
      ui: Check numeric part of expire_password argument @time properly
      ui: Fix silent truncation of numeric keys in HMP sendkey
      ui/spice: Require spice-protocol >= 0.14.0
      Revert "hmp: info spice: take out webdav"
      ui/spice: Require spice-server >= 0.14.0
      ui/spice: QXLInterface method set_mm_time() is now dead, drop
      ui/spice: Give hmp_info_spice()'s channel_names[] static linkage
      ui: Clean up a few things checkpatch.pl would flag later on
      ui: Move QMP commands from monitor to new ui/ui-qmp-cmds.c
      ui: Factor out qmp_add_client() parts and move to ui/ui-qmp-cmds.c
      ui: Move HMP commands from monitor to new ui/ui-hmp-cmds.c
      ui: Improve "change vnc" error reporting
      ui: Factor out hmp_change_vnc(), and move to ui/ui-hmp-cmds.c
      ui: Reduce nesting in hmp_change_vnc() slightly
      ui: Don't check for mode change after mouse_set error
      ui: Split hmp_mouse_set() and move the HMP part to ui/
      ui: Simplify control flow in qemu_mouse_set()

 meson.build                   |   4 +-
 hw/display/qxl.h              |   2 -
 include/monitor/hmp.h         |   8 +
 include/monitor/qmp-helpers.h |  26 +++
 include/ui/console.h          |   2 +-
 include/ui/qemu-spice.h       |   8 +-
 include/ui/spice-display.h    |   2 -
 chardev/spice.c               |   2 -
 hw/display/qxl.c              |  26 +--
 monitor/hmp-cmds.c            | 368 +--------------------------------
 monitor/misc.c                |  67 ------
 monitor/qmp-cmds.c            | 176 +++-------------
 ui/input.c                    |  32 ++-
 ui/spice-display.c            |  10 -
 ui/ui-hmp-cmds.c              | 460 ++++++++++++++++++++++++++++++++++++++++++
 ui/ui-qmp-cmds.c              | 177 ++++++++++++++++
 ui/vdagent.c                  |   4 -
 hw/display/trace-events       |   1 -
 ui/meson.build                |   2 +
 19 files changed, 727 insertions(+), 650 deletions(-)
 create mode 100644 include/monitor/qmp-helpers.h
 create mode 100644 ui/ui-hmp-cmds.c
 create mode 100644 ui/ui-qmp-cmds.c

-- 
2.39.0


