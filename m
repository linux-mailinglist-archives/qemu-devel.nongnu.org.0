Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2350B44D31F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 09:24:12 +0100 (CET)
Received: from localhost ([::1]:35256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml5NT-0001f4-AS
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 03:24:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1ml5Lq-0000Wp-1S
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 03:22:33 -0500
Received: from mga18.intel.com ([134.134.136.126]:14578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1ml5Ln-0004NZ-Rp
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 03:22:29 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="219765518"
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="219765518"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 00:22:24 -0800
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="670169207"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 11 Nov 2021 00:22:21 -0800
Date: Thu, 11 Nov 2021 16:07:47 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 3/5] numa: Support SGX numa in the monitor and Libvirt
 interfaces
Message-ID: <20211111080747.GC4787@yangzhon-Virtual>
References: <20211101162009.62161-1-yang.zhong@intel.com>
 <20211101162009.62161-4-yang.zhong@intel.com>
 <20211110165540.souq5vgqtfn2hsft@redhat.com>
 <20211111061850.GA4787@yangzhon-Virtual>
 <4b440a94-8e9f-4153-591e-d56ffac529a0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b440a94-8e9f-4153-591e-d56ffac529a0@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=yang.zhong@intel.com; helo=mga18.intel.com
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
Cc: yang.zhong@intel.com, eblake@redhat.com, qemu-devel@nongnu.org,
 jarkko@kernel.org, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11, 2021 at 08:55:35AM +0100, Philippe Mathieu-Daudé wrote:
> On 11/11/21 07:18, Yang Zhong wrote:
> > On Wed, Nov 10, 2021 at 10:55:40AM -0600, Eric Blake wrote:
> >> On Mon, Nov 01, 2021 at 12:20:07PM -0400, Yang Zhong wrote:
> >>> Add the SGXEPCSection list into SGXInfo to show the multiple
> >>> SGX EPC sections detailed info, not the total size like before.
> >>> This patch can enable numa support for 'info sgx' command and
> >>> QMP interfaces. The new interfaces show each EPC section info
> >>> in one numa node. Libvirt can use QMP interface to get the
> >>> detailed host SGX EPC capabilities to decide how to allocate
> >>> host EPC sections to guest.
> >>>
> >>> (qemu) info sgx
> >>>  SGX support: enabled
> >>>  SGX1 support: enabled
> >>>  SGX2 support: enabled
> >>>  FLC support: enabled
> >>>  NUMA node #0: size=67108864
> >>>  NUMA node #1: size=29360128
> >>>
> >>> The QMP interface show:
> >>> (QEMU) query-sgx
> >>> {"return": {"sgx": true, "sgx2": true, "sgx1": true, "sections": \
> >>> [{"node": 0, "size": 67108864}, {"node": 1, "size": 29360128}], "flc": true}}
> >>>
> >>> (QEMU) query-sgx-capabilities
> >>> {"return": {"sgx": true, "sgx2": true, "sgx1": true, "sections": \
> >>> [{"node": 0, "size": 17070817280}, {"node": 1, "size": 17079205888}], "flc": true}}
> >>
> >> Other than the different "size" values, how do these commands differ?
> > 
> > 
> >   As for QMP interfaces,
> >   The 'query-sgx' to get VM sgx detailed info, and 'query-sgx-capabilities' to get
> >   the host sgx capabilities and Libvirt can use this info to decide how to allocate
> >   virtual EPC sections to VMs.
> 
> What about renaming/aliasing as 'query-host-sgx' / 'query-guest-sgx'?


  The current Libvirt and Qemu's QMP interface define all interfaces like those naming
  rule. If we change those names, there are lots of work in the Qemu and Libvirt sides.

  Thanks!

  Yang  


