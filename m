Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A56325B7A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 03:11:13 +0100 (CET)
Received: from localhost ([::1]:46048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFSb2-0007RO-3b
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 21:11:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1lFSZU-0005s6-Nz
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 21:09:36 -0500
Received: from mga14.intel.com ([192.55.52.115]:7370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1lFSZR-0002bP-JX
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 21:09:36 -0500
IronPort-SDR: v2IO3j3L3Y7UeOiz8rWlNf/aWzfdV07BJOQbv2XIsff4TDorx5jpgADpMCphs/J03iqRN7Zruo
 4TyW82e8CoTA==
X-IronPort-AV: E=McAfee;i="6000,8403,9906"; a="185057273"
X-IronPort-AV: E=Sophos;i="5.81,207,1610438400"; d="scan'208";a="185057273"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2021 18:09:26 -0800
IronPort-SDR: xOwwmjowfjV7aycmDHUcC2m3gRoi3SONIf7RDFAKjUpQRXe4oqDnD/qwg3zVOScMfnsfEnGbNy
 VtdFHPSr8NaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,207,1610438400"; d="scan'208";a="404679897"
Received: from unknown (HELO local-michael-cet-test.sh.intel.com)
 ([10.239.159.166])
 by orsmga008.jf.intel.com with ESMTP; 25 Feb 2021 18:09:24 -0800
From: Yang Weijiang <weijiang.yang@intel.com>
To: pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com,
 mtosatti@redhat.com, sean.j.christopherson@intel.com,
 qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v7 0/6] Enable CET support for guest 
Date: Fri, 26 Feb 2021 10:20:52 +0800
Message-Id: <20210226022058.24562-1-weijiang.yang@intel.com>
X-Mailer: git-send-email 2.17.2
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=weijiang.yang@intel.com; helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Yang Weijiang <weijiang.yang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Control-flow Enforcement Technology (CET) provides protection against
Return/Jump-Oriented Programming (ROP/JOP). It includes two features:
Shadow Stack(SHSTK) and Indirect Branch Tracking(IBT).
This patch series is to enable CET related CPUID report, XSAVES/XRSTORS
support and MSR access etc. for guest.

Change in v7:
- Reverted part of XSAVE feature-word naming change per review feedback.
- Fixed an issue blocking SHSTK and IBT used as two independent features
  if OS just enables either of them.
- Other minor changes during testing and review.
- Rebased to 5.2.0 base.

CET KVM patches:
https://lkml.kernel.org/r/20210203113421.5759-1-weijiang.yang@intel.com

CET kernel patches:
https://lkml.kernel.org/r/20210217222730.15819-1-yu-cheng.yu@intel.com


Yang Weijiang (6):
  target/i386: Change XSAVE related feature-word names
  target/i386: Enable XSS feature enumeration for CPUID
  target/i386: Enable CET components support for XSAVES
  target/i386: Add user-space MSR access interface for CET
  target/i386: Add CET state support for guest migration
  target/i386: Advise CET bits in CPU/MSR feature words

 target/i386/cpu.c     | 113 +++++++++++++++++++++++------
 target/i386/cpu.h     |  55 ++++++++++++++-
 target/i386/kvm.c     |  72 +++++++++++++++++++
 target/i386/machine.c | 161 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 379 insertions(+), 22 deletions(-)

-- 
2.26.2


