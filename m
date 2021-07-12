Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80283C464A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 11:37:57 +0200 (CEST)
Received: from localhost ([::1]:59768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2sNw-0000a2-PL
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 05:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m2sMx-0008KQ-2y
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 05:36:55 -0400
Received: from mga14.intel.com ([192.55.52.115]:57125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m2sMu-0006g4-9L
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 05:36:54 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10042"; a="209768872"
X-IronPort-AV: E=Sophos;i="5.84,232,1620716400"; d="scan'208";a="209768872"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 02:36:47 -0700
X-IronPort-AV: E=Sophos;i="5.84,232,1620716400"; d="scan'208";a="491957376"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 12 Jul 2021 02:36:45 -0700
Date: Mon, 12 Jul 2021 17:23:31 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 05/33] vl: Add sgx compound properties to expose SGX
 EPC sections to guest
Message-ID: <20210712092331.GB8378@yangzhon-Virtual>
References: <20210709110955.73256-1-yang.zhong@intel.com>
 <20210709110955.73256-6-yang.zhong@intel.com>
 <a14c4d43-f197-a25e-bf53-01489427c792@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a14c4d43-f197-a25e-bf53-01489427c792@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.115; envelope-from=yang.zhong@intel.com;
 helo=mga14.intel.com
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
Cc: yang.zhong@intel.com, seanjc@google.com, kai.huang@intel.com,
 qemu-devel@nongnu.org, jarkko@kernel.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 09, 2021 at 06:07:13PM +0200, Paolo Bonzini wrote:
> On 09/07/21 13:09, Yang Zhong wrote:
> >+    sgx_epc = g_malloc0(sizeof(*sgx_epc));
> >+    pcms->sgx_epc = sgx_epc;
> >+
> 
> No need to malloc this, it's small.
>

  Thanks Paolo, i will use g_new0() to replace this malloc, thanks!
 
  Yang
  
 
> >  }
> >+##
> >+# @SgxEPC:
> >+#
> >+# Sgx EPC cmdline information
> >+#
> >+# @id: device's ID
> >+#
> >+# @memdev: memory backend linked with device
> >+#
> >+# Since: 6.1
> >+##
> >+{ 'struct': 'SgxEPC',
> >+  'data': { 'id': [ 'str' ],
> >+            'memdev': [ 'str' ]
> >+          }
> >+}
> 
> Is the "id" needed at all?  If not, you can make the property just a
> string list.
> 

  The current "id" is only shown in 'info memory-devices" command in the
  monitor.

   qemu) info memory-devices
    Memory device [sgx-epc]: "epc1"
      memaddr: 0x180000000
      size: 29360128
      memdev: /objects/mem1
    Memory device [sgx-epc]: "epc2"
      memaddr: 0x181c00000
      size: 10485760
      memdev: /objects/mem2

 If this "id" is not MUST, i can remove this. thanks!


> If not, you should still make the property a list, and SgxEPC can be
> just the id/memdev pair.
> 

  The SGX EPC will support NUMA function, 

   -object memory-backend-ram,size=2G,host-nodes=0,policy=bind,id=node0 \ 
   -object memory-backend-epc,id=mem0,size=100M \
   -sgx-epc id=epc0,memdev=mem0,node=0 \
   -numa node,nodeid=0,cpus=0-1,memdev=node0 \

  Sorry this is older command style, i will change this to compound 
  property in the NUMA patchset.

  So, the SgxEPC struct still needed even i removed 'id'.


> Also please place the compound property in PCMachineState, not in
> MachineState.  You can call the field something else than sgx_epc to
> avoid conflicts with the SGXEPCState, for example sgx_epc_memdevs or
> sgx_epc_backends.  Later it can be moved to X86MachineState if
> needed, but in any case it should not be in common
> target-independent code.
> 
  
  Yes, i will directly move compound property get/set from MachineState 
  to X86MachineState and change the sgx_epc to sgx_epc_backends to avoid
  conflicts(In fact, i have done this and it works well). Thanks!

  Yang

> Paolo

