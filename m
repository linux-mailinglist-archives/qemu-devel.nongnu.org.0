Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9E54D4306
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 10:03:35 +0100 (CET)
Received: from localhost ([::1]:54720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSEhq-0002Zy-Jy
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 04:03:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1nSEdh-0000rG-VF
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 03:59:18 -0500
Received: from mga09.intel.com ([134.134.136.24]:26958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1nSEdf-00007F-9N
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 03:59:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646902755; x=1678438755;
 h=from:to:cc:subject:date:message-id;
 bh=cEQvWn6cKH//ZmRKF+kqgy60d5rxkvhGVp21E2JHYXc=;
 b=A2IOOyRzNkLjxtRvXvIFOuchCFGXuGiUONvWRAxUzDfB+S0dG3Hu3Dbi
 3Y91NwjCcGsZsHZZlAE+5w3rksUq6yKeo2iGS2dvCcKPvloP3qSc/rWU4
 91DA8gnMe5coUCHyZMtwOM7Z96vakJMN3J95ZtQvVgbC4faAjI73FQ1jQ
 shNWchlHqn+KBTYhsX9slVzdjeYbKBcrEjNDTXqd1BNsAu9SO9pze4VPB
 H4ewPRJGMUBhM/Y7bY8u1eGgUwMWLzajrALsmAzNDKQxfiUwIS99rdRX0
 WrLZ7JW4G214JDylg6qf3FbbBAiso6xM/qNdEFr+d788c3K/drYukp2o9 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="254932783"
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="254932783"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 00:59:08 -0800
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="644367169"
Received: from chenyi-pc.sh.intel.com ([10.239.159.73])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 00:59:06 -0800
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [PATCH 0/2] Enable notify VM exit
Date: Thu, 10 Mar 2022 17:02:03 +0800
Message-Id: <20220310090205.10645-1-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=chenyi.qiang@intel.com; helo=mga09.intel.com
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
Cc: Chenyi Qiang <chenyi.qiang@intel.com>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Notify VM exit is introduced to mitigate the potential DOS attach from
malicious VM. This series is the userspace part to enable this feature
through a new KVM capability KVM_CAP_X86_NOTIFY_VMEXIT. The
corresponding KVM patch series is available at

https://lore.kernel.org/lkml/20220310084001.10235-1-chenyi.qiang@intel.com/

Chenyi Qiang (2):
  linux-headers: Sync the linux headers
  i386: Add notify VM exit support

 hw/i386/x86.c               | 24 +++++++++++++++
 include/hw/i386/x86.h       |  3 ++
 linux-headers/asm-x86/kvm.h |  4 +++
 linux-headers/linux/kvm.h   | 29 +++++++++++++++----
 target/i386/kvm/kvm.c       | 58 ++++++++++++++++++++++++-------------
 5 files changed, 93 insertions(+), 25 deletions(-)

-- 
2.17.1


