Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED40754D535
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 01:28:29 +0200 (CEST)
Received: from localhost ([::1]:49592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1cR2-0006WJ-HP
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 19:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1o1cNl-0004zX-Jm
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 19:25:06 -0400
Received: from mga06b.intel.com ([134.134.136.31]:58836 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1o1cNi-000102-Rl
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 19:25:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655335502; x=1686871502;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5dES5c7/2VUHIuH2Sf6KMptkMA63c/URqGXBMYcnKHc=;
 b=hbvw3DiBQ1qA7otNVal2nVHi4tmQWzMPy/NqTbpMGRKQ9l4vcJhR+GMo
 ZSA2guhrTx7R0yzECkTO4Pi1Fs088WtigXiPsuXvqhdbn5MExPDpM/qMm
 FQ3HsSicXj2RzQKk/QdvKKdkiBcBMd92AEON82uTv3br35oYKLOl/8ld1
 YzCx12GFgY6vt4kEBwXOSlh3eVy7wg53pZn1pCnJLxbAbbdvyL7ReD+iB
 K8JA+MEtyLPXCRHzK52A53dSaiqc0pHf3kN5wEIUntiTlw176pTkhvU/e
 roMg6Dgzulwf4THANweOdiaWhetMi15CbAPZwgYLZExauYvGDPUeuMIcg Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="340778245"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="340778245"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 16:24:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="589378008"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by fmsmga007.fm.intel.com with ESMTP; 15 Jun 2022 16:24:59 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Cc: Dongwon Kim <dongwon.kim@intel.com>
Subject: [PATCH v2 0/2] handling guest multiple displays
Date: Wed, 15 Jun 2022 16:19:40 -0700
Message-Id: <20220615231942.29981-1-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=dongwon.kim@intel.com; helo=mga06.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This patch seires is for adding some useful features for the guest os with
multi-displays. First patch is to make all of guest displays visible
when guest os is launched using "detach". Second patch is for providing
a method to assign each guest display to specific physical monitor,
which would be useful if someone wants to directly full-screen individual
guest scanouts to host's physical displays.

Changes in v2:

* ui/gtk: detach VCS for additional guest displays

  - check if the type of VC is GD_VC_GFX before qemu_console_is_graphic
    (Gerd Hoffman)
  - vc[0] is always primary guest display so we won't need n_gfx_vcs
    (Gerd Hoffmann)
  - making sure detached window's size same as original surface size
    (Daniel P. Berrangé)

Dongwon Kim (2):
  ui/gtk: detach VCS for additional guest displays (v2)
  ui/gtk: a new array param monitor to specify the target displays (v2)

 qapi/ui.json    |  7 ++++++-
 qemu-options.hx |  2 +-
 ui/gtk.c        | 43 +++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 48 insertions(+), 4 deletions(-)

-- 
2.30.2


