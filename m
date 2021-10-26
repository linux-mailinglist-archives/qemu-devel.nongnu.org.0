Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3070043AE32
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 10:37:32 +0200 (CEST)
Received: from localhost ([::1]:38348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfHxb-0002HW-B0
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 04:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mfHq0-0003lZ-UH
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 04:29:41 -0400
Received: from mga12.intel.com ([192.55.52.136]:38418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mfHpx-0001ls-20
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 04:29:40 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="209938090"
X-IronPort-AV: E=Sophos;i="5.87,182,1631602800"; d="scan'208";a="209938090"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 01:29:32 -0700
X-IronPort-AV: E=Sophos;i="5.87,182,1631602800"; d="scan'208";a="497209084"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 26 Oct 2021 01:29:30 -0700
Date: Tue, 26 Oct 2021 16:15:06 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 5/5] sgx: Reset the vEPC regions during VM reboot
Message-ID: <20211026081506.GA11341@yangzhon-Virtual>
References: <20211022192754.58196-1-yang.zhong@intel.com>
 <20211022192754.58196-6-yang.zhong@intel.com>
 <6e04392e-e52b-2011-0d62-4a6c24628e7b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e04392e-e52b-2011-0d62-4a6c24628e7b@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.136; envelope-from=yang.zhong@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yang.zhong@intel.com, philmd@redhat.com, jarkko@kernel.org,
 eblake@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 22, 2021 at 11:46:30PM +0200, Paolo Bonzini wrote:
> On 22/10/21 21:27, Yang Zhong wrote:
> >+
> >+    for (j = 0; j < num; j++) {
> >+        epc = pcms->sgx_epc.sections[j];
> >+        hostmem = MEMORY_BACKEND(epc->hostmem);
> >+        fd = memory_region_get_fd(host_memory_backend_get_memory(hostmem));
> >+
> >+        failures = ioctl(fd, SGX_IOC_VEPC_REMOVE_ALL);
> >+        if (failures < 0) {
> >+            return failures;
> >+        } else if (failures > 0) {
> >+            /* Remove SECS pages */
> >+            sleep(1);
> >+            failures_1 = ioctl(fd, SGX_IOC_VEPC_REMOVE_ALL);
> >+        }
> >+
> >+        /*
> >+         * The host or guest can support 8 EPC sections, use the
> >+         * corresponding bit to show each section removal status.
> >+         */
> >+        if (failures_1) {
> >+            set_bit(j, &ret);
> >+        }
> >+    }
> 
> This sleep is not necessary, just do two tries on all the regions.
> So something like
> 
>     int failures;
> 
>     /*
>      * The second pass is needed to remove SECS pages that could not
>      * be removed during the first.
>      */
>     for (i = 0; i < 2; i++) {
>         failures = 0;
>         for (j = 0; j < pcms->sgx_epc.nr_sections; j++) {
>             epc = pcms->sgx_epc.sections[j];
>             hostmem = MEMORY_BACKEND(epc->hostmem);
>             fd =
> memory_region_get_fd(host_memory_backend_get_memory(hostmem));
> 
>             r = ioctl(fd, SGX_IOC_VEPC_REMOVE_ALL);
>             if (r < 0) {
>                 return r;
>             }
>             if (r > 0) {
>                 /* SECS pages remain */
>                 failures++;
>                 if (pass == 1) {
>                     error_report("cannot reset vEPC section %d\n", j);
>                 }
>             }
>         }
>         if (!failures) {
>             return 0;
>         }
>     }
>     return failures;
> 
> is enough, without any need to do further retries.
>

  Thanks Paolo, i will update it in the next version. Please also
  help review other patches, thanks! 

  Yang

> Paolo

