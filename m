Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E689437512E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 11:00:06 +0200 (CEST)
Received: from localhost ([::1]:43120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leZra-0006tt-0f
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 05:00:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1leZqq-0006Rz-2t
 for qemu-devel@nongnu.org; Thu, 06 May 2021 04:59:20 -0400
Received: from mga07.intel.com ([134.134.136.100]:14813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1leZqm-0006O5-OI
 for qemu-devel@nongnu.org; Thu, 06 May 2021 04:59:19 -0400
IronPort-SDR: +//FnFSGjcBsMpTa9bMqQpFKMXE2QlYpsgTvqcceus8kMEPuabFtenCWsaU9QPn2QuZvoICw5X
 GZCqc23PiGxg==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="262365625"
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; d="scan'208";a="262365625"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 01:59:07 -0700
IronPort-SDR: pqo4mS8ASheQ1c65g+OZoRggXeWPuSl+VV3h1EqALhC3T2VLV/jOOezzJzSAd04EAycYE/172U
 zOlW9bTL+E/g==
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; d="scan'208";a="430438716"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 06 May 2021 01:59:05 -0700
Date: Thu, 6 May 2021 16:46:36 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [RESEND PATCH 31/32] sgx-epc: Add the fill_device_info()
 callback support
Message-ID: <20210506084636.GB21621@yangzhon-Virtual>
References: <20210430062455.8117-1-yang.zhong@intel.com>
 <20210430062455.8117-32-yang.zhong@intel.com>
 <9c62797b-a96b-8777-dd4e-676a3e107964@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c62797b-a96b-8777-dd4e-676a3e107964@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=yang.zhong@intel.com; helo=mga07.intel.com
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, kai.huang@intel.com,
 qemu-devel@nongnu.org, seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 03, 2021 at 01:01:22PM -0500, Eric Blake wrote:
> On 4/30/21 1:24 AM, Yang Zhong wrote:
> > Since there is no fill_device_info() callback support, and when we
> > execute "info memory-devices" command in the monitor, the segfault
> > will be found.
> > 
> > This patch will add this callback support and "info memory-devices"
> > will show sgx epc memory exposed to guest. The result as below:
> > 
> > qemu) info memory-devices
> > Memory device [sgx-epc]: "epc1"
> >   memaddr: 0x180000000
> >   size: 29360128
> >   memdev: /objects/mem1
> > Memory device [sgx-epc]: "epc2"
> >   memaddr: 0x181c00000
> >   size: 10485760
> >   memdev: /objects/mem2
> > 
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > ---
> 
> > +++ b/qapi/machine.json
> > @@ -1184,6 +1184,29 @@
> >            }
> >  }
> >  
> > +##
> > +# @SgxEPCDeviceInfo:
> > +#
> > +# Sgx EPC state information
> > +#
> > +# @id: device's ID
> > +#
> > +# @memaddr: physical address in memory, where device is mapped
> > +#
> > +# @size: size of memory that the device provides
> > +#
> > +# @memdev: memory backend linked with device
> > +#
> > +# Since: 5.1
> 
> 6.1

  Eric, thanks for your comments, i will change this in the next version, thanks!

  Yang

> 
> > +##
> > +{ 'struct': 'SgxEPCDeviceInfo',
> > +  'data': { '*id': 'str',
> > +            'memaddr': 'size',
> > +            'size': 'size',
> > +            'memdev': 'str'
> > +          }
> > +}
> > +
> >  ##
> >  # @MemoryDeviceInfo:
> >  #
> > @@ -1198,7 +1221,8 @@
> >    'data': { 'dimm': 'PCDIMMDeviceInfo',
> >              'nvdimm': 'PCDIMMDeviceInfo',
> >              'virtio-pmem': 'VirtioPMEMDeviceInfo',
> > -            'virtio-mem': 'VirtioMEMDeviceInfo'
> > +            'virtio-mem': 'VirtioMEMDeviceInfo',
> > +            'sgx-epc': 'SgxEPCDeviceInfo'
> >            }
> >  }
> >  
> > 
> 
> -- 
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3226
> Virtualization:  qemu.org | libvirt.org

