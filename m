Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7171A44D1F4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 07:35:31 +0100 (CET)
Received: from localhost ([::1]:36178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml3gH-0006P3-JR
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 01:35:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1ml3eP-0005Wf-Ph
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 01:33:34 -0500
Received: from mga12.intel.com ([192.55.52.136]:41313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1ml3eM-0007ex-Rb
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 01:33:33 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="212892137"
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="212892137"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 22:33:28 -0800
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="504300339"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 10 Nov 2021 22:33:25 -0800
Date: Thu, 11 Nov 2021 14:18:50 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 3/5] numa: Support SGX numa in the monitor and Libvirt
 interfaces
Message-ID: <20211111061850.GA4787@yangzhon-Virtual>
References: <20211101162009.62161-1-yang.zhong@intel.com>
 <20211101162009.62161-4-yang.zhong@intel.com>
 <20211110165540.souq5vgqtfn2hsft@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110165540.souq5vgqtfn2hsft@redhat.com>
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
Cc: yang.zhong@intel.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jarkko@kernel.org, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 10, 2021 at 10:55:40AM -0600, Eric Blake wrote:
> On Mon, Nov 01, 2021 at 12:20:07PM -0400, Yang Zhong wrote:
> > Add the SGXEPCSection list into SGXInfo to show the multiple
> > SGX EPC sections detailed info, not the total size like before.
> > This patch can enable numa support for 'info sgx' command and
> > QMP interfaces. The new interfaces show each EPC section info
> > in one numa node. Libvirt can use QMP interface to get the
> > detailed host SGX EPC capabilities to decide how to allocate
> > host EPC sections to guest.
> > 
> > (qemu) info sgx
> >  SGX support: enabled
> >  SGX1 support: enabled
> >  SGX2 support: enabled
> >  FLC support: enabled
> >  NUMA node #0: size=67108864
> >  NUMA node #1: size=29360128
> > 
> > The QMP interface show:
> > (QEMU) query-sgx
> > {"return": {"sgx": true, "sgx2": true, "sgx1": true, "sections": \
> > [{"node": 0, "size": 67108864}, {"node": 1, "size": 29360128}], "flc": true}}
> > 
> > (QEMU) query-sgx-capabilities
> > {"return": {"sgx": true, "sgx2": true, "sgx1": true, "sections": \
> > [{"node": 0, "size": 17070817280}, {"node": 1, "size": 17079205888}], "flc": true}}
> 
> Other than the different "size" values, how do these commands differ?


  As for QMP interfaces,
  The 'query-sgx' to get VM sgx detailed info, and 'query-sgx-capabilities' to get
  the host sgx capabilities and Libvirt can use this info to decide how to allocate
  virtual EPC sections to VMs.

  'info sgx' and 'query-sgx' are same functions, only different interfaces, HMP and QMP.

  Yang


> 
> > 
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > ---
> >  qapi/misc-target.json | 19 ++++++++++++++--
> >  hw/i386/sgx.c         | 51 +++++++++++++++++++++++++++++++++++--------
> >  2 files changed, 59 insertions(+), 11 deletions(-)
> > 
> > diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> > index 5aa2b95b7d..1022aa0184 100644
> > --- a/qapi/misc-target.json
> > +++ b/qapi/misc-target.json
> > @@ -337,6 +337,21 @@
> >    'if': 'TARGET_ARM' }
> >  
> >  
> > +##
> > +# @SGXEPCSection:
> > +#
> > +# Information about intel SGX EPC section info
> > +#
> > +# @node: the numa node
> > +#
> > +# @size: the size of epc section
> > +#
> > +# Since: 6.2
> 
> Are we still trying to cram this into 6.2, or is now slipping into 7.0?


  The numa patches will be merged into Qemu next version, once the new version is
  ready, i will change this and send V4. thanks!

  Yang 


> 
> > +##
> > +{ 'struct': 'SGXEPCSection',
> > +  'data': { 'node': 'int',
> > +            'size': 'uint64'}}
> > +
> >  ##
> >  # @SGXInfo:
> >  #
> > @@ -350,7 +365,7 @@
> >  #
> >  # @flc: true if FLC is supported
> >  #
> > -# @section-size: The EPC section size for guest
> > +# @sections: The EPC sections info for guest
> >  #
> >  # Since: 6.2
> >  ##
> > @@ -359,7 +374,7 @@
> >              'sgx1': 'bool',
> >              'sgx2': 'bool',
> >              'flc': 'bool',
> > -            'section-size': 'uint64'},
> > +            'sections': ['SGXEPCSection']},
> 
> This would be an incompatible change.  As long as 6.2 isn't released,
> we can do that; but once it is, we need to be more careful about
> changing the QMP spec.


  Thanks for reminder! I had to use SGXEPCSection lists to show those epc
  infos because the MAX SGX epc section number is 8, this number in each
  server maybe different, not one fixed number. Once the new QMP spec release,
  let me check how to adjust this. thanks!

  Regards,

  Yang





> 
> >     'if': 'TARGET_I386' }
> >  
> >  ##
> > diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
> > index 9a77519609..b5b710a556 100644
> > --- a/hw/i386/sgx.c
> > +++ b/hw/i386/sgx.c
> > @@ -76,11 +76,13 @@ static uint64_t sgx_calc_section_metric(uint64_t low, uint64_t high)
> >             ((high & MAKE_64BIT_MASK(0, 20)) << 32);
> >  }
> >  
> > -static uint64_t sgx_calc_host_epc_section_size(void)
> > +static SGXEPCSectionList *sgx_calc_host_epc_sections(void)
> ...
> 
> -- 
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org

