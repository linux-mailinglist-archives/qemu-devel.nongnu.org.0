Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15612640413
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 11:07:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p12vB-0003WN-KK; Fri, 02 Dec 2022 05:05:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p12v5-0003UJ-5d
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:05:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p12v1-0002F7-7x
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:05:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669975518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z7D+c+wAiaffevN51B9+mmyZaohu/d/DzM90L9HCU5s=;
 b=d+uZZykwinInTVEGE/dnQPYiswbzEyNAro8o68K666Iu7+kA+/VOOMo6TlX5Eb2iGt2xVL
 F1fh/vatPNebOeVv2smFcjeDnSL4iple+FeYnK0Py0ckPy63T2TKHIVXtNmH/qIcq5jeg8
 MSC+Ez6M/LnnDgywmnqNEr5NYLTlKvY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-KFFVYi4jPu-ZQrce-8vFmg-1; Fri, 02 Dec 2022 05:05:16 -0500
X-MC-Unique: KFFVYi4jPu-ZQrce-8vFmg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C67538041C5;
 Fri,  2 Dec 2022 10:05:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A855414A809;
 Fri,  2 Dec 2022 10:05:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E203721E6921; Fri,  2 Dec 2022 11:05:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com,
 philmd@linaro.org
Subject: [PATCH v2 00/14] ui: Move and clean up monitor command code
Date: Fri,  2 Dec 2022 11:04:58 +0100
Message-Id: <20221202100512.4161901-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

This is mainly about splitting off monitor-related code.  There's also
a minimum Spice version bump, and a few UI improvements to HMP
commands sendkey, change vnc, and info spice.

v2:
* PATCH 03,05-06: New [Daniel]
* PATCH 04: Enable instead of drop channel type "webdav" [Daniel]
* PATCH 07: New [Philippe]
* PATCH 09: Don't move add_client() to ui/
* PATCH 10: New, move ui parts of add_client() to ui/
* PATCH 12+13: Fix incorrect patch split [Daniel]

Markus Armbruster (14):
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

 meson.build                   |   4 +-
 hw/display/qxl.h              |   2 -
 include/monitor/hmp.h         |   5 +
 include/monitor/qmp-helpers.h |  26 +++
 include/ui/qemu-spice.h       |   8 +-
 include/ui/spice-display.h    |   2 -
 chardev/spice.c               |   2 -
 hw/display/qxl.c              |  26 +--
 monitor/hmp-cmds.c            | 370 +-------------------------------
 monitor/qmp-cmds.c            | 176 +++------------
 ui/spice-display.c            |  10 -
 ui/ui-hmp-cmds.c              | 391 ++++++++++++++++++++++++++++++++++
 ui/ui-qmp-cmds.c              | 177 +++++++++++++++
 ui/vdagent.c                  |   4 -
 hw/display/trace-events       |   1 -
 ui/meson.build                |   2 +
 16 files changed, 638 insertions(+), 568 deletions(-)
 create mode 100644 include/monitor/qmp-helpers.h
 create mode 100644 ui/ui-hmp-cmds.c
 create mode 100644 ui/ui-qmp-cmds.c

-- 
2.37.3


