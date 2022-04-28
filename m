Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DBA513EF6
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 01:18:10 +0200 (CEST)
Received: from localhost ([::1]:47808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkDOj-00067K-2n
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 19:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nkDNU-0004TU-JI
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 19:16:52 -0400
Received: from mga05.intel.com ([192.55.52.43]:57365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nkDNR-0007gu-AV
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 19:16:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651187809; x=1682723809;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QeLpOHunzWfXlY4nYDNH+xx8YIND68FD2I4ErfvBBJw=;
 b=kB58Zfek7Y/NAkfllD1y53maZ9qIiYGR5cDxxFpxTBbw6Lb/Qv9TbatX
 mlFBXEFviM3NjfXHy/CH5Fq0Mb+qOE/QgZHWarhSxMUCXFpIsLm21uyqC
 v0c7xE/pqtx8j/rxmQaVCiwK8+aN/1AkkwFvl33v4dCKRCW2Y+/sehFWu
 saAKySmw7Jk98dGEU+RwKvga69WXLIFnnVuZh14xVmz/1RgutBBbUnphP
 +U/5zLjGBKONR3jYZvMolD56D2xHEAbi3i9Lf9PwiyPfaSHR4APlfoeps
 E5D7KEmD5DeC9vz23Y123KWqV7KALqLlB+b0KOBEAK3KeOBrMtXcjHpWs Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="352887473"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="352887473"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 16:16:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="731758630"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by orsmga005.jf.intel.com with ESMTP; 28 Apr 2022 16:16:41 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org, dongwon.kim@intel.com, philmd@redhat.com,
 kraxel@redhat.com, pbonzini@redhat.com
Subject: [PATCH 0/3] ui/gtk: new options, monitor and detach-all
Date: Thu, 28 Apr 2022 16:13:01 -0700
Message-Id: <20220428231304.19472-1-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=dongwon.kim@intel.com;
 helo=mga05.intel.com
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

This patch series introduces two new gtk optional parameters, monitor
and detach-all. "monitor" is for specifying a display where QEMU window
will be launched from. "detach-all" is making all VCs detached upon
QEMU's launch. The use-case we originally wanted to deal with is when
multiple displays (max_output = n) are assigned to the guest os and
each guest display needs to be full-screened to certain physical monitor.
This can be achieved when these new parameters are properly configured
together with existing full-screen option set to true.

Dongwon Kim (3):
  ui/gtk: new param monitor to specify target monitor for launching QEMU
  ui/gtk: detach_all option for making all VCs detached upon starting
  ui/gtk: specify detached window's size and location

 qapi/ui.json    | 11 +++++++--
 qemu-options.hx |  2 +-
 ui/gtk.c        | 66 +++++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 74 insertions(+), 5 deletions(-)

-- 
2.30.2


