Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D855397F6
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 22:32:06 +0200 (CEST)
Received: from localhost ([::1]:48430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw8X6-0005Hx-Rz
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 16:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nw8Tr-0002tD-5v
 for qemu-devel@nongnu.org; Tue, 31 May 2022 16:28:43 -0400
Received: from mga02.intel.com ([134.134.136.20]:3288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nw8Tp-0000Ac-5v
 for qemu-devel@nongnu.org; Tue, 31 May 2022 16:28:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654028921; x=1685564921;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=llXR2P/u+0JhVmW4+gx2wQa0GvUyimEVDW9QIfirz+M=;
 b=AJJyaYFNq+pkkphRgSQ68Yo4gygyhHQUJl1nYRkb8vry5yGDH2ost54e
 N8FUsVMmciu8LxVfHDdEKLVGcC6ceHl1ly/IHL1jUbVhtmOqM3NxsY163
 1qZT4rwUJVSIfIIB+Pk+P1WvcJo0amlcjibXBUW4684uVjqeprPvI3O5G
 7LLgtyK3xyLop4/cF04vrd05Nb+jzFCNU3vr5p2/o0/06BCejJWLV6vS6
 E00nfv3Zu0PqBP//gQ/1U4vgG10QerWjR0su0gHc3ChidoXwkaYAIIRcY
 i1WT3PfB2lG9TN0MVUKyBzBIpW1tt+vWfBAnL/PWGkcTeS02ka9AXYbDd A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="263010882"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="263010882"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 13:28:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="611998592"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by orsmga001.jf.intel.com with ESMTP; 31 May 2022 13:28:34 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Cc: Dongwon Kim <dongwon.kim@intel.com>
Subject: [PATCH 0/2] handling guest multiple displays
Date: Tue, 31 May 2022 13:23:25 -0700
Message-Id: <20220531202327.14636-1-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=dongwon.kim@intel.com; helo=mga02.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Dongwon Kim (2):
  ui/gtk: detach VCS for additional guest displays
  ui/gtk: a new array param monitor to specify the target displays

 qapi/ui.json    |  7 ++++++-
 qemu-options.hx |  2 +-
 ui/gtk.c        | 43 +++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 48 insertions(+), 4 deletions(-)

-- 
2.30.2


