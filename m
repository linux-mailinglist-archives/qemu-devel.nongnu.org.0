Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBD73F6FF4
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:00:42 +0200 (CEST)
Received: from localhost ([::1]:55808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mImtt-0001GX-AH
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:00:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1mImt2-0000Zu-4u
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 02:59:48 -0400
Received: from mga12.intel.com ([192.55.52.136]:13860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1mImsz-0006SG-P7
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 02:59:47 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="197035703"
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; d="scan'208";a="197035703"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 23:59:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; d="scan'208";a="527104844"
Received: from xiaoyaol-mobl.ccr.corp.intel.com (HELO [10.239.13.122])
 ([10.239.13.122])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 23:59:39 -0700
To: Eduardo Habkost <ehabkost@redhat.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Live migration regarding Intel PT
Message-ID: <e31344c9-e9e6-7d78-3a53-2c0e5e5f39d7@intel.com>
Date: Wed, 25 Aug 2021 14:59:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=xiaoyao.li@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.928,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Chao Peng <chao.p.peng@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eduardo,

I have some question regrading Intel PT live migration.

Commit "e37a5c7fa459 (i386: Add Intel Processor Trace feature support)" 
expose Intel PT with a fixed capabilities of CPUID 0x14 for live 
migration. And the fixed capabilities are the value reported on 
ICX(IceLake). However, the upcoming SPR(Sapphire Rapids) has less 
capabilities of INTEL_PT_CYCLE_BITMAP than ICX. It fails to enable PT in 
guest on SPR machine.

If change the check on INTEL_PT_CYCLE_BITMAP to allow different value to 
allow it work on SPR. I think it breaks live migration, right?

For me, not making each sub-function of PT as configurable in QEMU 
indeed makes it hard for live migration. Why not make PT as unmigratable 
in the first place when introducing the support in QEMU?

Thanks,
-Xiaoyao

