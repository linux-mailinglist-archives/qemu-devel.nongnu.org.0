Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D62A957100A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 04:16:35 +0200 (CEST)
Received: from localhost ([::1]:43820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB5Ry-0004nB-G2
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 22:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oB5Oi-000865-9U
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 22:13:13 -0400
Received: from mga01.intel.com ([192.55.52.88]:21780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oB5Ob-0007qv-Pi
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 22:13:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657591985; x=1689127985;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OFXH58sesrLxUrKslfFea8UCMlTvSXsK6c3zlqw9UhI=;
 b=UNv5oEF6wZYVb1GvnIsZoar2PR9GhyOBLFqP/Qs5K2UPIrsQzXomR65F
 hNGgi0OSEWEq/ylzLxXf8yeBnw/RHobeYAsKRIc04hELdQ2/VVEJ09Ngp
 IPC+D+o3nqcJx2P/to7XYv0/RUwOu2271KtApIO/QIw5VIqFvt9iU6623
 LLl2iigfwAxNUQkQNPNiiWWW4uZwurgHRexuuEN0pXphJiHIZdsYk69dY
 EI20E0kh3oAjvZGaQiII5p5R4DDdcbPnKHcgseVT6bNAhrptJR0x/aA/F
 boznZREmRgNvxwW6VGd4m1tjmBL9gSRe5HxopQO1Rr5v9RnptaBWEJ1i+ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="310429690"
X-IronPort-AV: E=Sophos;i="5.92,264,1650956400"; d="scan'208";a="310429690"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2022 19:12:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,264,1650956400"; d="scan'208";a="622320246"
Received: from lxy-dell.sh.intel.com ([10.239.159.55])
 by orsmga008.jf.intel.com with ESMTP; 11 Jul 2022 19:12:50 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
Cc: qemu-devel@nongnu.org,
	xiaoyao.li@intel.com
Subject: [PATCH 0/2] i386/cpuid: Minor fixes for CPUID leaf 1f setup
Date: Tue, 12 Jul 2022 10:12:47 +0800
Message-Id: <20220712021249.3227256-1-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.88; envelope-from=xiaoyao.li@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
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

The issue that fixed by Patch 1 looks fatal though it doesn't appear on
KVM because KVM always searches with assending order and hit with the
correct cpuid leaf 0.

Patch 2 removes the wrong constraint on CPUID leaf 1f

Xiaoyao Li (2):
  i386/cpuid: Decrease cpuid_i when skipping CPUID leaf 1F
  i386/cpuid: Remove subleaf constraint on CPUID leaf 1F

 target/i386/kvm/kvm.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

-- 
2.27.0


