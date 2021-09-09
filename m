Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38213404FCF
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 14:22:25 +0200 (CEST)
Received: from localhost ([::1]:44236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOJ4R-0004hl-SV
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 08:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mOJ2v-0003GE-SN
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 08:20:49 -0400
Received: from mga05.intel.com ([192.55.52.43]:19541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mOJ2t-0003R3-EA
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 08:20:49 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="306340964"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="306340964"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 05:20:41 -0700
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="539594630"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 09 Sep 2021 05:20:39 -0700
Date: Thu, 9 Sep 2021 20:06:46 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 5/7] qmp: Add the qmp_query_sgx_capabilities()
Message-ID: <20210909120646.GG21362@yangzhon-Virtual>
References: <20210908081937.77254-1-yang.zhong@intel.com>
 <20210908081937.77254-6-yang.zhong@intel.com>
 <fe8b02c8-d7f8-c733-9577-311251a5f66d@redhat.com>
 <20210909025105.GC21362@yangzhon-Virtual>
 <a36ebd16-3cef-7287-9bd3-9a08b99ba1e9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a36ebd16-3cef-7287-9bd3-9a08b99ba1e9@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.43; envelope-from=yang.zhong@intel.com;
 helo=mga05.intel.com
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 09, 2021 at 11:36:58AM +0200, Philippe Mathieu-Daudé wrote:
> On 9/9/21 4:51 AM, Yang Zhong wrote:
> > On Wed, Sep 08, 2021 at 10:38:59AM +0200, Philippe Mathieu-Daudé wrote:
> >> On 9/8/21 10:19 AM, Yang Zhong wrote:
> >>> Libvirt can use qmp_query_sgx_capabilities() to get the host
> >>> sgx capabilities.
> >>>
> >>> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> >>> ---
> >>>  hw/i386/sgx.c              | 66 ++++++++++++++++++++++++++++++++++++++
> >>>  include/hw/i386/sgx.h      |  1 +
> >>>  qapi/misc-target.json      | 18 +++++++++++
> >>>  target/i386/monitor.c      |  5 +++
> >>>  tests/qtest/qmp-cmd-test.c |  1 +
> >>>  5 files changed, 91 insertions(+)
> >>
> >>> +SGXInfo *sgx_get_capabilities(Error **errp)
> >>> +{
> >>> +    SGXInfo *info = NULL;
> >>> +    uint32_t eax, ebx, ecx, edx;
> >>> +
> >>> +    int fd = qemu_open_old("/dev/sgx_vepc", O_RDWR);
> >>> +    if (fd < 0) {
> >>> +        error_setg(errp, "SGX is not enabled in KVM");
> >>> +        return NULL;
> >>> +    }
> >>
> >> Is this Linux specific?
> > 
> >   Philippe, The /dev/sgx_vepc node is used for KVM side to expose the SGX
> >   EPC section to guest. Libvirt then use the '-machine none' qemu command 
> >   to query host SGX capabilities(especially for host SGX EPC section size)
> >   to decide how many SGX VMs will be started in server. If this node doesn't
> >   exist, the reason is host can't support SGX or SGX KVM module is not compiled
> >   in the kernel. thanks!
> 
> Sorry but you didn't answer my question in an obvious way... Yes or no?

  Yes, this is Linux specific. thanks!
  
  Yang

