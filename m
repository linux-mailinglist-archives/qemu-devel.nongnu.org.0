Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A15504045ED
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 09:05:04 +0200 (CEST)
Received: from localhost ([::1]:46582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOE7L-0002i0-2H
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 03:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mOE5T-0000hH-Ix
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 03:03:07 -0400
Received: from mga17.intel.com ([192.55.52.151]:56381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mOE5M-0002qP-FU
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 03:03:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="200906246"
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; d="scan'208";a="200906246"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 00:02:49 -0700
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; d="scan'208";a="466280183"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 09 Sep 2021 00:02:46 -0700
Date: Thu, 9 Sep 2021 14:48:52 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 6/7] monitor: Fix coredump issue in non-x86 platform
Message-ID: <20210909064852.GE21362@yangzhon-Virtual>
References: <20210908081937.77254-1-yang.zhong@intel.com>
 <20210908081937.77254-7-yang.zhong@intel.com>
 <17d61d04-4276-dd5b-b23f-9597c1fad1f1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17d61d04-4276-dd5b-b23f-9597c1fad1f1@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.151; envelope-from=yang.zhong@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: yang.zhong@intel.com, eblake@redhat.com, qemu-devel@nongnu.org,
 seanjc@google.com, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 10:54:06AM +0200, Paolo Bonzini wrote:
> On 08/09/21 10:19, Yang Zhong wrote:
> >+    if (sgx_enabled) {
> >+        MachineState *ms = MACHINE(qdev_get_machine());
> >+        X86MachineState *x86ms = X86_MACHINE(qdev_get_machine());
> >+
> 
> You can use object_dynamic_cast(ms, TYPE_PC_MACHINE), something like:
> 
> 
> PCMachineState *pcms =
>     object_dynamic_cast(qdev_get_machine(), TYPE_PC_MACHINE);
> X86MachineState *x86ms;
> 
> if (!pcms) {
>     return NULL;
> }
> x86ms = X86_MACHINE(pcms);
> if (!x86ms->sgx_epc_list) {
>     return NULL;
> }
> info = g_new0(SGXInfo, 1);
> ...
> return info;
> 
> Also please squash this patch directly into patch 3 that introduces
> sgx_get_info.
>

  Paolo, Good suggestion! This solution can avoid coredump. thanks!

  Yang 

   
> Paolo

