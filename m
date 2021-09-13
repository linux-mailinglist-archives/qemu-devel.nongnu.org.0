Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 381CD408966
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 12:51:58 +0200 (CEST)
Received: from localhost ([::1]:46466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPjZ7-0006J0-7m
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 06:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mPjVz-00055v-CQ
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 06:48:43 -0400
Received: from mga01.intel.com ([192.55.52.88]:38418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mPjVs-00058e-T8
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 06:48:41 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10105"; a="243955773"
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="243955773"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 03:48:18 -0700
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="543116694"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 13 Sep 2021 03:48:16 -0700
Date: Mon, 13 Sep 2021 18:34:20 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 2/3] qmp: Add the qmp_query_sgx_capabilities()
Message-ID: <20210913103420.GA27331@yangzhon-Virtual>
References: <20210910102258.46648-1-yang.zhong@intel.com>
 <20210910102258.46648-3-yang.zhong@intel.com>
 <fc329a6b-117c-2f83-986b-e94312af7dce@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc329a6b-117c-2f83-986b-e94312af7dce@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.88; envelope-from=yang.zhong@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 10, 2021 at 02:41:08PM +0200, Philippe Mathieu-Daudé wrote:
> On 9/10/21 12:22 PM, Yang Zhong wrote:
> > Libvirt can use qmp_query_sgx_capabilities() to get the host
> > sgx capabilities to decide how to allocate SGX EPC size to VM.
> > 
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > ---
> >  hw/i386/sgx.c              | 66 ++++++++++++++++++++++++++++++++++++++
> >  include/hw/i386/sgx.h      |  1 +
> >  qapi/misc-target.json      | 18 +++++++++++
> >  target/i386/monitor.c      |  5 +++
> >  tests/qtest/qmp-cmd-test.c |  1 +
> >  5 files changed, 91 insertions(+)
> > 
> > diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
> > index 8a32d62d7e..1be2670c84 100644
> > --- a/hw/i386/sgx.c
> > +++ b/hw/i386/sgx.c
> > @@ -18,6 +18,72 @@
> >  #include "qapi/error.h"
> >  #include "exec/address-spaces.h"
> >  #include "hw/i386/sgx.h"
> > +#include "sysemu/hw_accel.h"
> > +
> > +#define SGX_MAX_EPC_SECTIONS            8
> > +#define SGX_CPUID_EPC_INVALID           0x0
> > +
> > +/* A valid EPC section. */
> > +#define SGX_CPUID_EPC_SECTION           0x1
> > +#define SGX_CPUID_EPC_MASK              0xF
> > +
> > +static uint64_t sgx_calc_section_metric(uint64_t low, uint64_t high)
> > +{
> > +    return (low & MAKE_64BIT_MASK(12, 31 - 12 + 1)) +
> > +           ((high & MAKE_64BIT_MASK(0, 19 - 0 + 1)) << 32);
> 
> Thanks for using MAKE_64BIT_MASK.
> 
> Can we have #definitions instead of these magic values please?
>

  Thanks, i will do the below definitions:

  /* The start bit of the EPC section */
  #define ECX_START                       12
  #define EDX_START                       0
  
  static uint64_t sgx_calc_section_metric(uint64_t low, uint64_t high)
  {
      return (low & MAKE_64BIT_MASK(ECX_START, 20)) +
             ((high & MAKE_64BIT_MASK(EDX_START, 20)) << 32);
  } 


  Yang

 
> > +}
> > +
> > +static uint64_t sgx_calc_host_epc_section_size(void)
> > +{
> > +    uint32_t i, type;
> > +    uint32_t eax, ebx, ecx, edx;
> > +    uint64_t size = 0;
> > +
> > +    for (i = 0; i < SGX_MAX_EPC_SECTIONS; i++) {
> > +        host_cpuid(0x12, i + 2, &eax, &ebx, &ecx, &edx);
> > +
> > +        type = eax & SGX_CPUID_EPC_MASK;
> > +        if (type == SGX_CPUID_EPC_INVALID) {
> > +            break;
> > +        }
> > +
> > +        if (type != SGX_CPUID_EPC_SECTION) {
> > +            break;
> > +        }
> > +
> > +        size += sgx_calc_section_metric(ecx, edx);
> > +    }
> > +
> > +    return size;
> > +}
> > +
> > +SGXInfo *sgx_get_capabilities(Error **errp)
> > +{
> > +    SGXInfo *info = NULL;
> > +    uint32_t eax, ebx, ecx, edx;
> > +
> > +    int fd = qemu_open_old("/dev/sgx_vepc", O_RDWR);
> > +    if (fd < 0) {
> > +        error_setg(errp, "SGX is not enabled in KVM");
> > +        return NULL;
> > +    }
> > +
> > +    info = g_new0(SGXInfo, 1);
> > +    host_cpuid(0x7, 0, &eax, &ebx, &ecx, &edx);
> > +
> > +    info->sgx = ebx & (1U << 2) ? true : false;
> > +    info->flc = ecx & (1U << 30) ? true : false;
> > +
> > +    host_cpuid(0x12, 0, &eax, &ebx, &ecx, &edx);
> > +    info->sgx1 = eax & (1U << 0) ? true : false;
> > +    info->sgx2 = eax & (1U << 1) ? true : false;
> > +
> > +    info->section_size = sgx_calc_host_epc_section_size();
> > +
> > +    close(fd);
> > +
> > +    return info;
> > +}

