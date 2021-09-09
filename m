Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C804F40460D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 09:20:39 +0200 (CEST)
Received: from localhost ([::1]:57110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOEMQ-000259-T3
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 03:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mOEKz-0000lo-F5
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 03:19:09 -0400
Received: from mga05.intel.com ([192.55.52.43]:61112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mOEKs-0008NZ-RA
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 03:19:09 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="306272982"
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; d="scan'208";a="306272982"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 00:18:59 -0700
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; d="scan'208";a="504101419"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 09 Sep 2021 00:18:57 -0700
Date: Thu, 9 Sep 2021 15:05:03 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 3/7] i386: Add sgx_get_info() interface
Message-ID: <20210909070503.GF21362@yangzhon-Virtual>
References: <20210908081937.77254-1-yang.zhong@intel.com>
 <20210908081937.77254-4-yang.zhong@intel.com>
 <b8008d89-1b18-de17-59b9-557e59f499b8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8008d89-1b18-de17-59b9-557e59f499b8@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.43; envelope-from=yang.zhong@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 10:55:13AM +0200, Paolo Bonzini wrote:
> On 08/09/21 10:19, Yang Zhong wrote:
> >+    if (x86ms->sgx_epc_list) {
> >+        PCMachineState *pcms = PC_MACHINE(ms);
> >+        SGXEPCState *sgx_epc = &pcms->sgx_epc;
> >+        info = g_new0(SGXInfo, 1);
> >+
> >+        info->sgx = true;
> >+        info->sgx1 = true;
> >+        info->sgx2 = true;
> >+        info->flc = true;
> 
> Since this is querying the actual machine, it should check the CPUID
> bits of the first CPU, instead of just returning true.
> 

  Paolo, this interface is only for checking SGX info from VM side by
  motinor or QMP tools, the SGXInfo *sgx_get_capabilities(Error **errp)
  in the patch5 check the host cpuid info to get the SGX related CPU bit
  info, like sgx,flc,sgx1,and sgx2 bit info. so here, if x86ms->sgx_epc_list
  is setting, those bits info in the VM side are all ture. thanks!

  Yang
 
> Paolo

