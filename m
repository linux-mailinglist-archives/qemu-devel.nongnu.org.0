Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4711C6776E0
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 09:58:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJse5-00052z-NK; Mon, 23 Jan 2023 03:57:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1pJse1-00052i-IQ
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:57:37 -0500
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1pJsdx-0002Sq-NJ
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:57:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674464253; x=1706000253;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CrqdKlNYFoE81HgcDk5ebw5xqo9N1X3MEOLRDRsme+s=;
 b=ErG9Rn5IO2M9/3C39xmw5seQjGioc5bJYc+oio8BmWyaJjp95N8yri4b
 wJ8KoCChlFTvFEa3pgvpJ5nrtyM+UiJCTI0Oy4QySkwMrccp5iSTgVkru
 DurHb39xBSRaQzfhmfeJNo1CpMIB8hoCqdgmKdSSr1Z5apSZ/30/cLCKM
 hLhRtUTjFjzdhzNp0JwRFtZPd3Pn9ttV7xfYjqFpg0/cPZmGAbjF3dbfD
 HTiW+KQh62wqXowSI83gLMw3a4Ri/QDtzt9mMd6m3IvPfAbg+gldB+RrG
 dRPcDTalzb5Y/FigX1tCtHzBIq1d5HTZ7puGBhCmDQNCOBVXDxI+6/n/V A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="412227797"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="412227797"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 00:57:28 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="639057568"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="639057568"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 00:57:27 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Dongwon Kim <dongwon.kim@intel.com>
Subject: [RFC v2 0/2] spice: Add an option to forward the dmabuf directly to
 the encoder (v2)
Date: Mon, 23 Jan 2023 00:37:53 -0800
Message-Id: <20230123083755.1038286-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43;
 envelope-from=vivek.kasireddy@intel.com; helo=mga05.intel.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch series adds options to select a preferred codec and also
to forward a dmabuf directly to the encoder module that is part of
the Spice server. Currently, gstreamer:h264 is the only combination
tested but additional work is ongoing to test other combinations. 

Tested with: -device virtio-gpu-pci,max_outputs=1,blob=true,xres=1920,yres=1080
             -spice port=3001,gl=on,disable-ticketing=on,dmabuf-encode=on,
              preferred-codec=gstreamer:h264

and remote-viewer --spice-debug spice://x.x.x.x:3001 on the client side.

Associated Spice server patches (v1) can be found here:
https://lists.freedesktop.org/archives/spice-devel/2023-January/052927.html

v2:
- Used the already available gl_scanout and gl_draw_async APIs instead
  of adding new ones to Spice.
- Improved the commit message of the second patch

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>

Vivek Kasireddy (2):
  spice: Add an option for users to provide a preferred codec
  spice: Add an option to forward the dmabuf directly to the encoder
    (v2)

 include/ui/spice-display.h |  1 +
 qemu-options.hx            | 11 +++++-
 ui/spice-core.c            | 36 ++++++++++++++++--
 ui/spice-display.c         | 75 ++++++++++++++++++++++++++++----------
 4 files changed, 100 insertions(+), 23 deletions(-)

-- 
2.37.2


