Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD62540896A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 12:52:51 +0200 (CEST)
Received: from localhost ([::1]:48942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPjZz-0007xl-0y
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 06:52:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mPjYS-0006T7-Hc
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 06:51:16 -0400
Received: from mga04.intel.com ([192.55.52.120]:49829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mPjYP-0007DE-K0
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 06:51:16 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10105"; a="219763309"
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="219763309"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 03:51:11 -0700
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="543117521"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 13 Sep 2021 03:51:09 -0700
Date: Mon, 13 Sep 2021 18:37:13 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 1/3] monitor: Add HMP and QMP interfaces
Message-ID: <20210913103713.GB27331@yangzhon-Virtual>
References: <20210910102258.46648-1-yang.zhong@intel.com>
 <20210910102258.46648-2-yang.zhong@intel.com>
 <fb7d360d-80b5-9bc2-0f6f-f48e04dc08f9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb7d360d-80b5-9bc2-0f6f-f48e04dc08f9@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.120; envelope-from=yang.zhong@intel.com;
 helo=mga04.intel.com
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
Cc: pbonzini@redhat.com, berrange@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 10, 2021 at 02:39:04PM +0200, Philippe Mathieu-Daudé wrote:
> On 9/10/21 12:22 PM, Yang Zhong wrote:
> > The QMP and HMP interfaces can be used by monitor or QMP tools to retrieve
> > the SGX information from VM side when SGX is enabled on Intel platform.
> > 
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > ---
> >  hmp-commands-info.hx         | 15 +++++++++++++
> >  hw/i386/sgx.c                | 29 ++++++++++++++++++++++++
> >  include/hw/i386/sgx.h        | 11 +++++++++
> >  include/monitor/hmp-target.h |  1 +
> >  qapi/misc-target.json        | 43 ++++++++++++++++++++++++++++++++++++
> >  target/i386/monitor.c        | 36 ++++++++++++++++++++++++++++++
> >  tests/qtest/qmp-cmd-test.c   |  1 +
> >  7 files changed, 136 insertions(+)
> >  create mode 100644 include/hw/i386/sgx.h
> 
> > diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> > index 3b05ad3dbf..e2a347cc23 100644
> > --- a/qapi/misc-target.json
> > +++ b/qapi/misc-target.json
> > @@ -333,3 +333,46 @@
> >  { 'command': 'query-sev-attestation-report', 'data': { 'mnonce': 'str' },
> >    'returns': 'SevAttestationReport',
> >    'if': 'TARGET_I386' }
> > +
> > +##
> > +# @SGXInfo:
> > +#
> > +# Information about intel Safe Guard eXtension (SGX) support
> > +#
> > +# @sgx: true if SGX is supported
> > +#
> > +# @sgx1: true if SGX1 is supported
> > +#
> > +# @sgx2: true if SGX2 is supported
> > +#
> > +# @flc: true if FLC is supported
> > +#
> > +# @section-size: The EPC section size for guest
> > +#
> > +# Since: 6.2
> > +##
> > +{ 'struct': 'SGXInfo',
> > +  'data': { 'sgx': 'bool',
> > +            'sgx1': 'bool',
> > +            'sgx2': 'bool',
> > +            'flc': 'bool',
> > +            'section-size': 'uint64'},
> > +   'if': 'TARGET_I386' }
> 
> Is it possible to restrict it to KVM? Maybe:
> 
>      'if': { 'all': ['TARGET_I386', 'CONFIG_KVM'] } },
> 
> ? (I'm not sure).

  Philippe, i tried this definition, which is feasible.
  This seems more accurate for sgx in the kvm of i386 platform. thanks!

  Yang
  

