Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D19F570E6C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 01:49:13 +0200 (CEST)
Received: from localhost ([::1]:51538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB39M-000500-AL
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 19:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1oB37V-0002Iq-OX
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 19:47:17 -0400
Received: from mga01.intel.com ([192.55.52.88]:11795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1oB37T-0003vv-8d
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 19:47:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657583235; x=1689119235;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ux6Jgbqup1Tu+2CtZzyPftAlx9sl3wwHyT11UtStDIY=;
 b=QlFfGSyM7DajGpG0V95wm917rVHTTTzbq8FPKjp+nJCwZz43VYLBRrf+
 Sq0yd458CzMA7jsKGHZyi/FQ5SfX5pjXitJIUkVZQVMXQqDOu3UZTyTw1
 GNeVw3h0Ckm+W1MbJv4ZapD0DvX4+Ilr/0izk1IylpOY/X9yFh2vvPUaO
 oBn3jDFkCuCi1RVnAWUpb4MCHZUSc7lRHXH99SDDfK0TJXEwfdU6fdMZK
 TBdIUsKLl4ZYwjmXP2w90MnxnSBkHrsdgsHdcXTaaGfyq3NZcYEyAh4XS
 rPNHA+OxqoAib111F/mpbafx8e9Slq1OhxunBukMeSWFqr6YZ1XEqMT/a w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="310408722"
X-IronPort-AV: E=Sophos;i="5.92,264,1650956400"; d="scan'208";a="310408722"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2022 16:47:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,264,1650956400"; d="scan'208";a="569972984"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by orsmga006.jf.intel.com with ESMTP; 11 Jul 2022 16:47:07 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, berrange@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com, f4bug@amsat.org, vivek.kasireddy@intel.com,
 Dongwon Kim <dongwon.kim@intel.com>
Subject: [PATCH v4 0/2] handling guest multiple displays
Date: Mon, 11 Jul 2022 16:39:57 -0700
Message-Id: <20220711233959.32219-1-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.88; envelope-from=dongwon.kim@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Changes in v4:

* ui/gtk: a new array param monitor to specify the target

  - changed "virtual-console" to an official term, "virtual console"
  - made if condition to check only 'full_screen' since 'has_full_screen' won't
    affect the result as 'full_screen' is always false if 'has_full_screen' is false.

Changes in v3:

* ui/gtk: a new array param monitor to specify the target

  - Revised commit message
  - Rewrote desription of the new parameter for clarification
  - 'for' loop that iterates through virtual consoles is actually executed only once
    only if the condition is met so replaced it with 'if' statement

Changes in v2:

* ui/gtk: detach VCS for additional guest displays

  - must check if the type of VC is GD_VC_GFX before qemu_console_is_graphic
  - It is not needed to pre-calculate n_gfx_vcs to determine how many times "detach"
    should be executed (n_gfx_vcs - 1) because the first virtual console (vc[0])
    is always in graphic mode so we can simply detach all other graphic mode
    virtual consoles.
  - making sure detached window's size same as original surface size

Dongwon Kim (2):
  ui/gtk: detach VCS for additional guest displays (v4)
  ui/gtk: a new array param monitor to specify the target displays (v4)

 qapi/ui.json    |  9 ++++++++-
 qemu-options.hx |  3 ++-
 ui/gtk.c        | 41 +++++++++++++++++++++++++++++++++++++++--
 3 files changed, 49 insertions(+), 4 deletions(-)

-- 
2.30.2


