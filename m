Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 035C562EBA1
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 03:06:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovqki-0007pv-Cs; Thu, 17 Nov 2022 21:05:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ovqkh-0007pn-DQ
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 21:05:11 -0500
Received: from mga18.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ovqkf-0008SK-4p
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 21:05:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668737109; x=1700273109;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tRe0DoYnh7loTfEZNnEHp2KNVI9BcxdeDNzLkJLzVsM=;
 b=L7HaCq+DUKqrdMsaiGLDGBXIJ5sfM8a9ugzjxsJCwlLUH/3yLlxPVVN9
 Yu/wXqEIXx/PRxuXSeB6IVTggccHZ5Vhmpmdk48M+OFQl31l0sQ3kvSG6
 XDkIDL2zqxCQf2qCFArwgmgz0uEdCpyxcbpApbpKDUrxuq2CrOeXa1GbI
 z9KpeT3S53OtY3rpv8Qi1cU7nBzeFzN0hvl64gZg2m8cWuO2sE7uk4NdP
 waDuHwGeXNix/XalGBY+xh3GlIIrU7ESRhlb3dfUcV50Ep73SrUrLG4ef
 b6YFhHj7ZmSSPucBL5iHxuHmpLN45ItinobnWp9OVs/CydiI7AvZ9CRST g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="296393524"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="296393524"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 18:05:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="634270851"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="634270851"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 18:05:04 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Dongwon Kim <dongwon.kim@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 0/6] ui/gtk: Add a new parameter to assign
 connectors/monitors (v2)
Date: Thu, 17 Nov 2022 17:44:20 -0800
Message-Id: <20221118014426.182599-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=vivek.kasireddy@intel.com; helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

There is a need (expressed by several customers/users) to assign
ownership of one or more physical monitors/connectors to individual
Guests such that there is a clear notion of which Guest's contents
are being displayed on any given monitor. Given that there is always
a Display Server/Compositor running on the Host, monitor ownership
can never truly be transferred to Guests. However, the closest we
can come to realizing this concept is to request the Host compositor
to fullscreen the Guest's windows on individual monitors. This way,
it would become possible to have 4 different Guests' windows be
displayed on 4 different monitors or a single Guest's windows (or
virtual consoles/outputs) be displayed on 4 monitors or any such
combination.

This patch series attempts to accomplish this by introducing a new
parameter named "connector" to assign the monitors to the GFX VCs
associated with a Guest. If the assigned monitor is not connected,
then the Guest's window would not be displayed anywhere similar to
how a Host compositor would behave when the connectors are not
connected. Once the monitor is hotplugged, the Guest's window(s)
would be positioned on the assigned monitor.

The first 3 patches are bug fixes associated with pointer positioning
in relative mode. The 4th patch is also a bug fix to ensure that 
context related objects are destroyed when an associated window is
destroyed. The 5th patch is a minor refactor and the last patch
introduces the new parameter. This patch series is expected to
supersede a similar series from Dongwon Kim here:
https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg03214.html

Example Usage: -device virtio-gpu-pci,max_outputs=2,blob=true......
               -display gtk,gl=on,connector.0=eDP-1,connector.1=DP-1.....

Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>

Vivek Kasireddy (6):
  ui/gtk: Consider the scaling factor when getting the root coordinates
  ui/gtk-gl-area: Don't forget to calculate the scaling factors in draw
  ui/gtk: Handle relative mode events correctly with Wayland compositors
  ui/gtk: Disable the scanout when a detached tab is closed
  ui/gtk: Factor out tab window creation into a separate function
  ui/gtk: Add a new parameter to assign connectors/monitors to GFX VCs
    (v2)

 include/ui/gtk.h |   3 +
 qapi/ui.json     |  10 +-
 qemu-options.hx  |   5 +-
 ui/gtk-egl.c     |   2 +
 ui/gtk-gl-area.c |   7 +
 ui/gtk.c         | 383 +++++++++++++++++++++++++++++++++++++++++++----
 6 files changed, 375 insertions(+), 35 deletions(-)

-- 
2.37.2


