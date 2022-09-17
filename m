Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C0E5BB507
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 02:31:09 +0200 (CEST)
Received: from localhost ([::1]:38440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZLjf-0001ce-JH
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 20:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1oZLgF-0005mg-BV
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 20:27:35 -0400
Received: from mga17.intel.com ([192.55.52.151]:23538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1oZLgC-0000kB-Fw
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 20:27:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663374452; x=1694910452;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YjTlBqKyeKQ6a1J8XTBVrW5A7/E2t8WV2eCMe+aFiiI=;
 b=ENsG7o3EGbFEPqtBOPGxO1fmRxG9ZmJMSLqmEjOOHvFvw2VHvFtkYSSB
 uvvGr6sCXk99SzjANgoJnZU6L18mtiga1GegNzapRptFJ8KS7P0kjHOeg
 FQK8odlKZ84O50H8BPrSTk663yPdu8LThnp1hNdMQaVJlJA4EgLGtMsQD
 v9Y+ZiwGuewB9JVJNXZDxUZ06G+vwGWexYN4nhc/YSjCceuW8wyPjrnT0
 AGVNadAjUmXJuuDsREeJ9zROYSNvzXsR9Z4eUk8aI1/BEpYvzSuTYS786
 wskQYD1O7C+k67Qo5bpUQR0W+g4a0326eOzA9PBoqVMT51/HuTqtzJhmi g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="279489393"
X-IronPort-AV: E=Sophos;i="5.93,321,1654585200"; d="scan'208";a="279489393"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 17:27:20 -0700
X-IronPort-AV: E=Sophos;i="5.93,321,1654585200"; d="scan'208";a="760235119"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 17:27:20 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Dongwon Kim <dongwon.kim@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v1 0/3] ui/gtk: Add a new parameter to assign
 connectors/monitors to Guests' windows
Date: Fri, 16 Sep 2022 17:07:28 -0700
Message-Id: <20220917000731.465003-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=vivek.kasireddy@intel.com; helo=mga17.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
would be fullscreened on the assigned monitor. The first patch is
just a bug fix to destroy context related objects when an associated
window is destroyed. The second patch is a minor refactor and the
third and last patch introduces the new parameter. This patch series
is expected to supersede a similar series from Dongwon Kim here:
https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg03214.html

Example Usage: -device virtio-gpu-pci,max_outputs=2,blob=true......
               -display gtk,gl=on,connector.0=eDP-1,connector.1=DP-1.....

Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>

Vivek Kasireddy (3):
  ui/gtk: Disable the scanout when a detached tab is closed
  ui/gtk: Factor out tab window creation into a separate function
  ui/gtk: Add a new parameter to assign connectors/monitors to GFX VCs

 qapi/ui.json     |   9 +-
 qemu-options.hx  |   1 +
 ui/gtk-egl.c     |   2 +
 ui/gtk-gl-area.c |   2 +
 ui/gtk.c         | 220 ++++++++++++++++++++++++++++++++++++++++++-----
 5 files changed, 211 insertions(+), 23 deletions(-)

-- 
2.37.2


