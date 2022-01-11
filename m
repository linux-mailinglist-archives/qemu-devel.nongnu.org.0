Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B2048A8CA
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 08:49:25 +0100 (CET)
Received: from localhost ([::1]:56264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7BuG-0008Pn-3U
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 02:49:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1n7Bgy-0000bt-2n
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 02:35:40 -0500
Received: from mga02.intel.com ([134.134.136.20]:47007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1n7Bgr-0002tP-O0
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 02:35:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641886533; x=1673422533;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OeysuA2hYPYn3L2Qb5Zrl7pSK5DjDyBWVoUPViP14Ww=;
 b=QeHbwwQehCEJotYDqGlpU79cJBbmRfaT7T8m53ne5Nxnv6wVJ7KiCkv+
 o/egSheihdkMFkZTYqRazBsKg5/5ugEHEbJRVOFYPfxOxnWH0b86uAR6D
 elvT+aAvPTcopwmdl+3uMtb2lAwTYUwoKheCWw0LUh2RlKP8SqIBuOUND
 50SgrDqYIAiDGL9r/PN5CEXSM475K2Dj7iYQ3th+EE0uNdN2aIuZZwGRx
 KUJlp2VbOjVG97sbcSUcoCJ1f6ospjt8pmJqIr+b2AvYLeZIzkZTZwzdl
 gwWVtLrcuhfB2U7ABGraYoOXZkdfWuam68blQ3HhBjQcrZ28juSGLXD7T w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="230764619"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="230764619"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 23:35:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="622977575"
Received: from lxy-dell.sh.intel.com ([10.239.159.55])
 by orsmga004.jf.intel.com with ESMTP; 10 Jan 2022 23:35:29 -0800
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v1 0/2] i386: Make PIT and PIC the property of common x86 base
 machine type 
Date: Tue, 11 Jan 2022 15:35:26 +0800
Message-Id: <20220111073528.1771552-1-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=xiaoyao.li@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For PIT, it's straightforward to merge microvm::pit and
pc_machine::pit_enabled into x86ms::pit

For PIC, move microvm::pic to x86ms:pic, which gives PC machine the
ability to dis-/en-able PIC and it's the preparation for future TDX
support.

Xiaoyao Li (2):
  hw/i386: Make pit a property of common x86 base machine type
  hw/i386: Make pic a property of common x86 base machine type

 hw/i386/microvm.c         | 54 ++-------------------------------------
 hw/i386/pc.c              | 24 +++--------------
 hw/i386/pc_piix.c         |  4 ++-
 hw/i386/pc_q35.c          |  4 ++-
 hw/i386/x86.c             | 50 ++++++++++++++++++++++++++++++++++++
 include/hw/i386/microvm.h |  4 ---
 include/hw/i386/pc.h      |  2 --
 include/hw/i386/x86.h     |  4 +++
 8 files changed, 65 insertions(+), 81 deletions(-)

-- 
2.27.0


