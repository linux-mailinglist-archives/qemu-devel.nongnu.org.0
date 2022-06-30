Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E08F1560E67
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 02:58:43 +0200 (CEST)
Received: from localhost ([::1]:42822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6iW2-0002mS-TC
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 20:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1o6iUd-0000ol-F7
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 20:57:15 -0400
Received: from mga14.intel.com ([192.55.52.115]:59228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1o6iUZ-0005eG-GZ
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 20:57:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656550631; x=1688086631;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6OuV45/vD1BD7HrfCIoVcP/atOmqEestKoa4AROmxAs=;
 b=hrtR52vBgiYXhEondpaR7v4r2Grw1KTx+Zx4Oqsflaz7COSdulLvrdUM
 k/APlHMgXHhoQaEwPGvArR9E5tlSKEbiE+ZeicWUmaS1FJFOUyC3LTgc0
 29ubZWXKLf/tjUJdMn2espyizZ1kH4/QVtOa5AfgaEaVhC0JgDl+UmjNs
 ac4zB4+UY3UJ4ostIa+4X3WbKkUvw5cLtmK9jVzMfdREBGBKIDmF7CJaU
 bJYtEmPYIv3sf5Jo216Q1swUcxHwzAo906uaU82SFH7YRTBp/uAojSka0
 q+ivu/77Ex/Pp5ku7XwLM1CtkC691hAZAsjy++J4WFiH+jEv1qGDJAMAF w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="282240602"
X-IronPort-AV: E=Sophos;i="5.92,232,1650956400"; d="scan'208";a="282240602"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 17:57:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,232,1650956400"; d="scan'208";a="693828071"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by fmsmga002.fm.intel.com with ESMTP; 29 Jun 2022 17:57:07 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Cc: Dongwon Kim <dongwon.kim@intel.com>
Subject: [PATCH v3 0/2] handling guest multiple displays
Date: Wed, 29 Jun 2022 17:51:39 -0700
Message-Id: <20220630005141.16680-1-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=dongwon.kim@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Changes in v3:

* ui/gtk: a new array param monitor to specify the target

  - Revised commit message
  - Rewrote desription of the new parameter (Markus Armbruster)
  - Replaced unnecessary 'for' loop with 'if' condition
    (Markus Armbruster)

Changes in v2:

* ui/gtk: detach VCS for additional guest displays

  - check if the type of VC is GD_VC_GFX before qemu_console_is_graphic
    (Gerd Hoffman)
  - vc[0] is always primary guest display so we won't need n_gfx_vcs
    (Gerd Hoffmann)
  - making sure detached window's size same as original surface size
    (Daniel P. Berrangé)

Dongwon Kim (2):
  ui/gtk: detach VCS for additional guest displays (v3)
  ui/gtk: a new array param monitor to specify the target displays (v3)

 qapi/ui.json    |  7 ++++++-
 qemu-options.hx |  2 +-
 ui/gtk.c        | 43 +++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 48 insertions(+), 4 deletions(-)

-- 
2.30.2


