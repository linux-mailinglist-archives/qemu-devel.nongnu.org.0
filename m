Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF1D4346C4
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 10:22:49 +0200 (CEST)
Received: from localhost ([::1]:54950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md6s4-0005Kn-5L
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 04:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1md6qg-0003tM-Sd
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 04:21:22 -0400
Received: from mga18.intel.com ([134.134.136.126]:44791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1md6qe-0004C9-Kv
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 04:21:22 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="215645092"
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; d="scan'208";a="215645092"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 01:21:07 -0700
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; d="scan'208";a="494516348"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 20 Oct 2021 01:21:05 -0700
Date: Wed, 20 Oct 2021 16:06:45 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 3/6] numa: Add SGXEPCSection list for multiple sections
Message-ID: <20211020080645.GC31332@yangzhon-Virtual>
References: <20211011111554.12403-1-yang.zhong@intel.com>
 <20211011111554.12403-4-yang.zhong@intel.com>
 <20211011170324.2f5oacnghualbu45@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211011170324.2f5oacnghualbu45@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=yang.zhong@intel.com; helo=mga18.intel.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, philmd@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 11, 2021 at 12:03:24PM -0500, Eric Blake wrote:
> On Mon, Oct 11, 2021 at 07:15:51PM +0800, Yang Zhong wrote:
> > The SGXEPCSection list added into SGXInfo to show the multiple
> > SGX EPC sections detailed info, not the total size like before.
> > 
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > ---
> >  qapi/misc-target.json | 19 +++++++++++++++++--
> >  1 file changed, 17 insertions(+), 2 deletions(-)
> > 
> > diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> > index 594fbd1577..89a5a4250a 100644
> > --- a/qapi/misc-target.json
> > +++ b/qapi/misc-target.json
> > @@ -334,6 +334,21 @@
> >    'returns': 'SevAttestationReport',
> >    'if': 'TARGET_I386' }
> >  
> > +##
> > +# @SGXEPCSection:
> > +#
> > +# Information about intel SGX EPC section info
> > +#
> > +# @index: the SGX epc section index
> > +#
> > +# @size: the size of epc section
> > +#
> > +# Since: 6.2
> > +##
> > +{ 'struct': 'SGXEPCSection',
> > +  'data': { 'index': 'uint64',
> > +            'size': 'uint64'}}
> > +
> >  ##
> >  # @SGXInfo:
> >  #
> > @@ -347,7 +362,7 @@
> >  #
> >  # @flc: true if FLC is supported
> >  #
> > -# @section-size: The EPC section size for guest
> > +# @sections: The EPC sections info for guest
> >  #
> >  # Since: 6.2
> 
> Given this has not yet been in a stable release, we can make this change...
> 

  The basic SGX is only suitable for one vepc section to guest. This new patchset
  need support NUMA function with multiple vepc to guest. So we need detailed epc
  or vepc section info. Thanks!

  Yang


> >  ##
> > @@ -356,7 +371,7 @@
> >              'sgx1': 'bool',
> >              'sgx2': 'bool',
> >              'flc': 'bool',
> > -            'section-size': 'uint64'},
> > +            'sections': ['SGXEPCSection']},
> >     'if': 'TARGET_I386' }
> 
> ...but are we sure we have the best interface possible if we are still
> expressing uncertainty about the QAPI used to represent it?
> 
  
  Yes, we need more accurate definition to handle this. Paolo suggested
  to use the numa node to replace this index, which is much better. Let
  me change this in next version, thanks! 

  Yang

> -- 
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org

