Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD1460E8F3
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:24:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onlt8-0005Ff-Fl; Wed, 26 Oct 2022 15:16:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1onlsu-000596-IW
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:16:17 -0400
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1onlss-0001o2-EG
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:16:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666811774; x=1698347774;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qAyPo8Kz/ljZIAMxapUdmiYiopDGfNwCOqMzSo3L69U=;
 b=YJKE8k2L60OxKXPPwqwB1GLS12I1lWn/5XZLFxFDcpYAPJZVftg5oXBi
 BJbGMp2gFuaw9c3BHGS2a7BzW4NKC4DeAJpuqYNfB1/s2Oe2pZMBp2zwp
 e/o5XSUbpP99HCUSoEMLKA8pSdJ04g8C+TlN4qIJaNVzstmSVTtGJb5Lb
 3c2HcZNMMPau7ER3foGw+epep6UNoh09s6vT5bHCMX8Z/cpFrIa/QzupN
 Sjei3nrBjXtp02mRvSxAFU4C7mk0EUgNYmn8DLCjj7v1ksaVaT3/Gzobv
 hxTxsLSgBQxQ1zc4Qql3fNfaE/pp3wXHWzvm4Bn38zegacKQZxLAS+6LX Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="306769440"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="306769440"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 12:16:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="610080556"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="610080556"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by orsmga006.jf.intel.com with ESMTP; 26 Oct 2022 12:16:09 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, berrange@redhat.com, armbru@redhat.com, f4bug@amsat.org,
 marcandre.lureau@redhat.com, thuth@redhat.com, vivek.kasireddy@intel.com,
 Dongwon Kim <dongwon.kim@intel.com>
Subject: [RFC PATCH 0/3] ui/gtk: no render event when vc is invisible
Date: Wed, 26 Oct 2022 12:04:18 -0700
Message-Id: <20221026190421.16922-1-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.120; envelope-from=dongwon.kim@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patchset adds a new mechanism in gtk/ui that makes it stop
scheduling a render event if VC is invisible and also change the status
of guest display to disconnected so that the guest stop further
submission of new frames.

This prevents the guest (using  blob scanout w/ egl fence sync) from being
locked up when the submitted frame is in pending state for too long when
the VC is hidden behind a inactivated tab or detached window for it is
minimized, where a render event is scheduled but doesn't get a chance to be
executed until the VC is visible again.

A flag "visible" under vc->gfx was added to indicate the visibilty
status of VC for the mechanism. And resizing VC to 0 was used to
inactivate the scanout , which eventually makes the guest display
shown as disconnected on the guest's side.

Dongwon Kim (3):
  ui/gtk: skip drawing guest scanout when associated VC is invisible
  ui/gtk: set the ui size to 0 when invisible
  ui/gtk: reset visible flag when window is minimized

 include/ui/gtk.h |  1 +
 ui/gtk-egl.c     |  8 ++++++++
 ui/gtk-gl-area.c |  8 ++++++++
 ui/gtk.c         | 51 +++++++++++++++++++++++++++++++++++++++++++++---
 4 files changed, 65 insertions(+), 3 deletions(-)

-- 
2.30.2


