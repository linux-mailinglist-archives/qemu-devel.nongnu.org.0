Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F894405966
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 16:44:28 +0200 (CEST)
Received: from localhost ([::1]:47166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOLHv-0006wd-HP
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 10:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1mOLFb-0003yK-Vk
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 10:42:03 -0400
Received: from mga07.intel.com ([134.134.136.100]:11385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1mOLFZ-0001Nx-FE
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 10:42:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="284510171"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="284510171"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 07:41:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="696346318"
Received: from lxy-dell.sh.intel.com ([10.239.159.31])
 by fmsmga005.fm.intel.com with ESMTP; 09 Sep 2021 07:41:51 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [RFC PATCH 0/5] Make Intel PT configurable
Date: Thu,  9 Sep 2021 22:41:45 +0800
Message-Id: <20210909144150.1728418-1-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=xiaoyao.li@intel.com; helo=mga07.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=1,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: xiaoyao.li@intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Initial Intel PT support was added by making it as fixed feature set as
ICX's capabilities, which allowed different CPU model with PT enabled
live migration on ICX host. However, it breaks the PT exposure/working
on SPR machine. Because SPR has less PT capabilities regrading
CPUID(0x14,1):EBX[15:0].

This series aims to make Intel PT configurable that named CPU model can
define its own PT feature set and "-cpu host/max" can use the host pass
through feature set of PT.

At the same time, it also ensure existing named CPU model to generate
the same PT CPUID set as before to not break live migration. 

Xiaoyao Li (5):
  target/i386: Print CPUID subleaf info for unsupported feature
  target/i386: Introduce FeatureWordInfo for Intel PT CPUID leaf 0xD
  target/i386: Enable host pass through of Intel PT
  target/i386: Define specific PT feature set for IceLake-server and
    Snowridge
  target/i386: Access MSR_IA32_RTIT_ADDRn based on guest CPUID
    configuration

 target/i386/cpu.c     | 215 ++++++++++++++++++++++++++++--------------
 target/i386/cpu.h     |  40 +++++++-
 target/i386/kvm/kvm.c |   8 +-
 3 files changed, 186 insertions(+), 77 deletions(-)

-- 
2.27.0


