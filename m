Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D58C45DAB1
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 14:04:04 +0100 (CET)
Received: from localhost ([::1]:55634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqEPy-0001RX-P9
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 08:04:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mqEOE-0008B3-A3
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 08:02:14 -0500
Received: from mga03.intel.com ([134.134.136.65]:14765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mqEOB-0001Rq-7Q
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 08:02:13 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="235451922"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="235451922"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 05:02:07 -0800
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="510300608"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 25 Nov 2021 05:02:06 -0800
Date: Thu, 25 Nov 2021 20:47:22 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: pbonzini@redhat.com
Subject: unable to execute QEMU command 'qom-get': Property
 'sgx-epc.unavailable-features' not found
Message-ID: <20211125124722.GA25401@yangzhon-Virtual>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.65; envelope-from=yang.zhong@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yang.zhong@intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Paolo,

Our customer used the Libvirt XML to start a SGX VM, but failed.

libvirt.libvirtError: internal error: unable to execute QEMU command 'qom-get': Property 'sgx-epc.unavailable-features' not found

The XML file,
<qemu:commandline>
    <qemu:arg value="-cpu"/>
    <qemu:arg value="host,+sgx,+sgx-debug,+sgx-exinfo,+sgx-kss,+sgx-mode64,+sgx-provisionkey,+sgx-tokenkey,+sgx1,+sgx2,+sgxlc"/>
    <qemu:arg value="-object"/>
    <qemu:arg value="memory-backend-epc,id=mem1,size=16M,prealloc=on"/>
    <qemu:arg value="-M"/>
    <qemu:arg value="sgx-epc.0.memdev=mem1"/>
  </qemu:commandline>

The new compound property command should be located in /machine path,
which are different with old command '-sgx-epc id=epc1,memdev=mem1'.

I also tried this from Qemu monitor tool, 
(qemu) qom-list /machine
type (string)
kernel (string)
......
sgx-epc (SgxEPC)
......
sgx-epc[0] (child<memory-region>)
......

We can find sgx-epc from /machine list.

I am not familiar with Libvirt side, would you please suggest how to implement
this compound command in the XML file?  thanks a lot!

Regards,

Yang  



