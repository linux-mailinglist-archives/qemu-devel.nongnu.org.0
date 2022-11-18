Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B7B62EB88
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 02:59:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovqdo-0004uP-Hr; Thu, 17 Nov 2022 20:58:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ovqdl-0004tl-Kk
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 20:58:01 -0500
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ovqdi-0007Pe-Ts
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 20:58:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668736678; x=1700272678;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XWd9nZUS3Lq+Iv9d6LNRHzC3pA1TJoxMmZQ26sjpUrE=;
 b=kHJpawNjl9dBfaJFTM5fv3ZHupeAdZ2gSsnjooh2AmC6dK8WBBPVqdOg
 ffqJ8vG3uqNQJhSze6+6/mfaOb2m5bUliwAz/tEMeqV/YE4ysgIRDgk+U
 xS1aTwEqZqtB+4RoCo0+FrKe9iJqNLzt3QmOn/51p7mnGymC5dzECrO5k
 YUvJCS5N0o+TERUc5aPupzAamNHAqzznTo1rjQbm8uH3w8XRoQNbdI2fv
 IDJpb2OtU2P1Z8W8p//HJjwYk0s+TBE6q8FqxLwy8jlAaHcr5I7TLsfNJ
 IbCq9jmkwpf8bwvrD5cGOlIkAcIu75TLzYTN2mA35eak7WTyBKZVIrlL9 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="311731509"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="311731509"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 17:57:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="708859340"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="708859340"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 17:57:53 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Dongwon Kim <dongwon.kim@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v1 0/2] virtio-gpu: Provide display position info (x,
 y) to the Guest
Date: Thu, 17 Nov 2022 17:37:21 -0800
Message-Id: <20221118013723.182424-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.120;
 envelope-from=vivek.kasireddy@intel.com; helo=mga04.intel.com
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

While filling out the display info such as width, height to
be provided to the Guest, make sure that the position information
(x, y) is also included. This position info corresponds with the
x and y fields mentioned in the spec:
https://github.com/oasis-tcs/virtio-spec/blob/master/virtio-gpu.tex#L343

Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>

Vivek Kasireddy (2):
  virtio-gpu: Provide position info (x, y) to the Guest
  ui/gtk: Include the position info while setting the ui info

 hw/display/virtio-gpu-base.c |  2 ++
 ui/gtk.c                     | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+)

-- 
2.37.2


