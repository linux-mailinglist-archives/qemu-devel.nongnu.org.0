Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3169418EDD
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 08:04:08 +0200 (CEST)
Received: from localhost ([::1]:33446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUjkG-0006QE-1d
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 02:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mUjI0-0001Rc-FO
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 01:34:56 -0400
Received: from mga07.intel.com ([134.134.136.100]:13820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mUjHy-0005CR-06
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 01:34:55 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10119"; a="288072090"
X-IronPort-AV: E=Sophos;i="5.85,325,1624345200"; d="scan'208";a="288072090"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2021 22:34:48 -0700
X-IronPort-AV: E=Sophos;i="5.85,325,1624345200"; d="scan'208";a="552995654"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 26 Sep 2021 22:34:42 -0700
Date: Mon, 27 Sep 2021 13:20:34 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v5 04/26] qom: Add memory-backend-epc ObjectOptions support
Message-ID: <20210927052034.GA15096@yangzhon-Virtual>
References: <20210924112509.25061-1-pbonzini@redhat.com>
 <20210924112509.25061-5-pbonzini@redhat.com>
 <20210924135640.svjs3avfaguq5kxf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210924135640.svjs3avfaguq5kxf@redhat.com>
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, philmd@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 24, 2021 at 08:56:40AM -0500, Eric Blake wrote:
> On Fri, Sep 24, 2021 at 01:24:47PM +0200, Paolo Bonzini wrote:
> > From: Yang Zhong <yang.zhong@intel.com>
> > 
> > Add the new 'memory-backend-epc' user creatable QOM object in
> > the ObjectOptions to support SGX since v6.1, or the sgx backend
> > object cannot bootup.
> > 
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > Message-Id: <20210719112136.57018-4-yang.zhong@intel.com>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >  qapi/qom.json | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> > 
> > diff --git a/qapi/qom.json b/qapi/qom.json
> > index a25616bc7a..0222bb4506 100644
> > --- a/qapi/qom.json
> > +++ b/qapi/qom.json
> > @@ -647,6 +647,23 @@
> >              '*hugetlbsize': 'size',
> >              '*seal': 'bool' } }
> >  
> > +##
> > +# @MemoryBackendEpcProperties:
> > +#
> > +# Properties for memory-backend-epc objects.
> > +#
> > +# The @share boolean option is true by default with epc
> > +#
> > +# The @merge boolean option is false by default with epc
> > +#
> > +# The @dump boolean option is false by default with epc
> > +#
> > +# Since: 6.2
> > +##
> > +{ 'struct': 'MemoryBackendEpcProperties',
> > +  'base': 'MemoryBackendProperties',
> > +  'data': {} }
> 
> Is the intent to add more members to data in later patches?  Otherwise,...

  No new members will be added. thanks! MemoryBackendProperties will replace this.

  Yang


> 
> > +
> >  ##
> >  # @PrManagerHelperProperties:
> >  #
> > @@ -797,6 +814,7 @@
> >      { 'name': 'memory-backend-memfd',
> >        'if': 'CONFIG_LINUX' },
> >      'memory-backend-ram',
> > +    'memory-backend-epc',
> >      'pef-guest',
> >      'pr-manager-helper',
> >      'qtest',
> > @@ -855,6 +873,7 @@
> >        'memory-backend-memfd':       { 'type': 'MemoryBackendMemfdProperties',
> >                                        'if': 'CONFIG_LINUX' },
> >        'memory-backend-ram':         'MemoryBackendProperties',
> > +      'memory-backend-epc':         'MemoryBackendEpcProperties',
> 
> ...this could have just been MemoryBackendProperties.

  Ditto, thanks!

  Yang

> 
> >        'pr-manager-helper':          'PrManagerHelperProperties',
> >        'qtest':                      'QtestProperties',
> >        'rng-builtin':                'RngProperties',
> > -- 
> > 2.31.1
> > 
> > 
> 
> -- 
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org

