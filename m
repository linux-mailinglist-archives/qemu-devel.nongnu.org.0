Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6876E665414
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 06:57:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFU72-0004oB-HW; Wed, 11 Jan 2023 00:57:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1pFU70-0004iB-06
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 00:57:22 -0500
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1pFU6t-0005Bd-9g
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 00:57:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673416635; x=1704952635;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jSvJ+wgXlmeHoDoaH9CK30KYmnlWQXiT8nBk8i99vc4=;
 b=gOcVKCeFgqC6iYNte2j+HyZLs4mV0N+MQDAT9DUJEAEy723YS9w3ka3f
 gntnDjG78o5mEEmDhikT17205sROPgB1thr6Bz2A8e0ITr6Cjbhyd0vB1
 zKSdmpoYh1tu0ZQoexz1d2YPRxxDcvb7QnQTvyJbPJxPINQ/+DNDKF59E
 lbHY7d3pU4rfbmF0AjJHHv+YsapkXdbBEiAXn/ry1NLQr4D1WxsZRnYEP
 gEQascAeM2HgDqoYbDUwyIgxs623A+Eh3ljQoyvyEt5iQok9Zd+EtVOd4
 5WEjvLqYFne4XX/AwRMhm98UBb6c7lIMrSqPnzM29M6Xj/mny2Zk6B0Es g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="311147385"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="311147385"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 21:57:07 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="650621151"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="650621151"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 21:57:06 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Dongwon Kim <dongwon.kim@intel.com>
Subject: [RFC v1 0/2] spice: Add an option to forward the dmabuf directly to
 the encoder
Date: Tue, 10 Jan 2023 21:37:05 -0800
Message-Id: <20230111053707.781484-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=vivek.kasireddy@intel.com; helo=mga02.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

This patch series adds options to select a preferred codec and also
to forward a dmabuf directly to the encoder module that is part of
the Spice server. Currently, gstreamer:h264 is the only combination
tested but additional work is ongoing to test other combinations. 

Tested with: -device virtio-gpu-pci,max_outputs=1,blob=true,xres=1920,yres=1080
             -spice port=3001,gl=on,disable-ticketing=on,dmabuf-encode=on,
              preferred-codec=gstreamer:h264

and remote-viewer --spice-debug spice://x.x.x.x:3001 on the client side.

Associated Spice server patches can be found here:
https://lists.freedesktop.org/archives/spice-devel/2023-January/052927.html

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>

Vivek Kasireddy (2):
  spice: Add an option for users to provide a preferred codec
  spice: Add an option to forward the dmabuf directly to the encoder

 include/ui/spice-display.h |   2 +
 qemu-options.hx            |  11 +++-
 ui/spice-core.c            |  36 +++++++++++--
 ui/spice-display.c         | 106 ++++++++++++++++++++++++++-----------
 4 files changed, 120 insertions(+), 35 deletions(-)

-- 
2.37.2


