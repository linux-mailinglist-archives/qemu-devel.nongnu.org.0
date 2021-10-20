Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E334345CE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 09:18:36 +0200 (CEST)
Received: from localhost ([::1]:48310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md5rv-0002Ec-Cg
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 03:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1md5qR-0001Pt-4e
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 03:17:03 -0400
Received: from mga14.intel.com ([192.55.52.115]:32595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1md5qO-0006TK-Eh
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 03:17:02 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="228982468"
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; d="scan'208";a="228982468"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 00:16:54 -0700
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; d="scan'208";a="444251167"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 20 Oct 2021 00:16:52 -0700
Date: Wed, 20 Oct 2021 15:02:32 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 1/6] numa: Enable numa for SGX EPC sections
Message-ID: <20211020070232.GA31332@yangzhon-Virtual>
References: <20211011111554.12403-1-yang.zhong@intel.com>
 <20211011111554.12403-2-yang.zhong@intel.com>
 <20211011163239.kcpgv3ixmuxbfqtv@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211011163239.kcpgv3ixmuxbfqtv@redhat.com>
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, philmd@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 11, 2021 at 11:32:39AM -0500, Eric Blake wrote:
> On Mon, Oct 11, 2021 at 07:15:49PM +0800, Yang Zhong wrote:
> > The basic SGX did not enable numa for SGX EPC sections, which
> > result in all EPC sections located in numa node 0. This patch
> > enable SGX numa function in the guest and the EPC section can
> > work with RAM as one numa node.
> > 
> > The Guest kernel related log:
> > [    0.009981] ACPI: SRAT: Node 0 PXM 0 [mem 0x180000000-0x183ffffff]
> > [    0.009982] ACPI: SRAT: Node 1 PXM 1 [mem 0x184000000-0x185bfffff]
> > The SRAT table can normally show SGX EPC sections menory info in different
> > numa nodes.
> > 
> > The SGX EPC numa related command:
> >  ......
> >  -m 4G,maxmem=20G \
> >  -smp sockets=2,cores=2 \
> >  -cpu host,+sgx-provisionkey \
> >  -object memory-backend-ram,size=2G,host-nodes=0,policy=bind,id=node0 \
> >  -object memory-backend-epc,id=mem0,size=64M,prealloc=on,host-nodes=0,policy=bind \
> >  -numa node,nodeid=0,cpus=0-1,memdev=node0 \
> >  -object memory-backend-ram,size=2G,host-nodes=1,policy=bind,id=node1 \
> >  -object memory-backend-epc,id=mem1,size=28M,prealloc=on,host-nodes=1,policy=bind \
> >  -numa node,nodeid=1,cpus=2-3,memdev=node1 \
> >  -M sgx-epc.0.memdev=mem0,sgx-epc.0.node=0,sgx-epc.1.memdev=mem1,sgx-epc.1.node=1 \
> >  ......
> > 
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > ---
> >  qapi/machine.json         |  6 +++++-
> >  include/hw/i386/sgx-epc.h |  3 +++
> >  hw/i386/acpi-build.c      |  4 ++++
> >  hw/i386/sgx-epc.c         |  3 +++
> >  hw/i386/sgx.c             | 44 +++++++++++++++++++++++++++++++++++++++
> >  monitor/hmp-cmds.c        |  1 +
> >  qemu-options.hx           |  4 ++--
> >  7 files changed, 62 insertions(+), 3 deletions(-)
> > 
> > diff --git a/qapi/machine.json b/qapi/machine.json
> > index 5db54df298..09b6188e6f 100644
> > --- a/qapi/machine.json
> > +++ b/qapi/machine.json
> > @@ -1213,6 +1213,7 @@
> >    'data': { '*id': 'str',
> >              'memaddr': 'size',
> >              'size': 'size',
> > +            'node': 'int',
> >              'memdev': 'str'
> >            }
> >  }
> > @@ -1288,7 +1289,10 @@
> >  # Since: 6.2
> >  ##
> >  { 'struct': 'SgxEPC',
> > -  'data': { 'memdev': 'str' } }
> > +  'data': { 'memdev': 'str',
> > +            'node': 'int'
> > +          }
> > +}
> 
> Missing documentation of the new member.
>


  Sorry for delay response, i will add this in next version, thanks!

  Yang


 
> -- 
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org

