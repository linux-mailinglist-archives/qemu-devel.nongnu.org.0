Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700C06C0D55
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 10:31:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peBrp-0007UR-8w; Mon, 20 Mar 2023 05:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@linux.intel.com>)
 id 1peBrn-0007UF-8n
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 05:31:47 -0400
Received: from mga07.intel.com ([134.134.136.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@linux.intel.com>)
 id 1peBrk-0000jQ-UY
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 05:31:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679304704; x=1710840704;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=gNOpwNFi1X39yWOyUdrFolqahoE+ibn22xIo2DWGKkk=;
 b=A1ElARXkbH0nW2k5vgwnzCzOWqRHYEBWGI0bnfVeGASiZpInTCEE5n5F
 Sw09M65lNl2Sh6LU/w0dcKbY0EOFX6IAvDnHBtT8EKb00nHeSveehgqbg
 V0/Q+VM75U6qI8jhBCCCgIm9gGqBOMSSxM8BfX9btCkWwO27uoHTiczR4
 +++Em5OBKtzshzt918asczyEHvovKF6SikcBuVl6W1Vf0RgQXghC6nVFA
 5+MLfny79TAEdSWrZid2wAF3+t/imFhgDbuG01KVo4c3PXRY9l4p0Ujkh
 ZTczArR2Wkuymhna57SdrkiD/wTLH39NmWLKlFrWCnlXfX6d5OevjNBCe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="403485376"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="403485376"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 02:31:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="770130595"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="770130595"
Received: from yangzhon.bj.intel.com (HELO yangzhon) ([10.238.157.60])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 02:31:39 -0700
Date: Mon, 20 Mar 2023 05:31:35 -0400
From: Yang Zhong <yang.zhong@linux.intel.com>
To: Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, yang.zhong@linux.intel.com
Subject: About the instance_finalize callback in VFIO PCI
Message-ID: <ZBgn90bjw9iRaTrw@yangzhon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: none client-ip=134.134.136.100;
 envelope-from=yang.zhong@linux.intel.com; helo=mga07.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Hello Alex and Paolo,

There is one instance_finalize callback definition in hw/vfio/pci.c, but
i find this callback(vfio_instance_finalize()) never be called during the
VM shutdown with close VM or "init 0" command in guest.

The Qemu related command:
   ......
   -device vfio-pci,host=d9:00.0
   ......

static const TypeInfo vfio_pci_dev_info = {
    .name = TYPE_VFIO_PCI,
    .parent = TYPE_PCI_DEVICE,
    .instance_size = sizeof(VFIOPCIDevice),
    .class_init = vfio_pci_dev_class_init,
    .instance_init = vfio_instance_init,
    .instance_finalize = vfio_instance_finalize,
    .interfaces = (InterfaceInfo[]) {
        { INTERFACE_PCIE_DEVICE },
        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
        { }
    },
};

If my test method is wrong, would you please tell me how to trigger to
this callback when VM shutdown? thanks.

By the way, i also debugged other instance_finalize callback functions,
if my understanding is right, all instance_finalize callback should be
called from object_unref(object) from qemu_cleanup(void) in
./softmmu/runstate.c. But there is no VFIO related object_unref() call in
this cleanup function, So the instance_finalize callback in vfio pci
should be useless? thanks!

Regards,
Yang


