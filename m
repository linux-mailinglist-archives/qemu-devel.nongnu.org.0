Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B37A3375172
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 11:23:37 +0200 (CEST)
Received: from localhost ([::1]:55186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leaEJ-0008Qs-Ir
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 05:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1leaBi-0006XV-1b
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:20:54 -0400
Received: from mga17.intel.com ([192.55.52.151]:1618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1leaBb-0001eq-KL
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:20:53 -0400
IronPort-SDR: Ym7+EHahqXdwVaaCHbTJfrhPTWBEwF7WaHSAxN0kN6lI2iLyQtqMb6AnMxP/BFbRlpE9sElb1m
 MzXQ52KXifbQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="178663573"
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; d="scan'208";a="178663573"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 02:20:34 -0700
IronPort-SDR: R3uGAJ8oHSw3YHBfsuZElBP3JEwdwyF+w0RxOWUY4juitSiu2jKlTb3mr7/eaaeZ8paDMdzqzC
 81mLJRFg/jmQ==
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; d="scan'208";a="434259977"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 06 May 2021 02:20:31 -0700
Date: Thu, 6 May 2021 17:08:02 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [RESEND PATCH 25/32] qmp: Add query-sgx command
Message-ID: <20210506090802.GD21621@yangzhon-Virtual>
References: <20210430062455.8117-1-yang.zhong@intel.com>
 <20210430062455.8117-26-yang.zhong@intel.com>
 <4d094391-7855-286f-46fd-5a840543d178@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d094391-7855-286f-46fd-5a840543d178@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.151; envelope-from=yang.zhong@intel.com;
 helo=mga17.intel.com
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

On Mon, May 03, 2021 at 12:58:34PM -0500, Eric Blake wrote:
> On 4/30/21 1:24 AM, Yang Zhong wrote:
> > This QMP query command can be used by some userspaces to retrieve
> > the SGX information when SGX is enabled on Intel platform.
> > 
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > ---
> >  monitor/qmp-cmds.c         |  6 ++++++
> >  qapi/misc.json             | 42 ++++++++++++++++++++++++++++++++++++++
> >  tests/qtest/qmp-cmd-test.c |  1 +
> >  3 files changed, 49 insertions(+)
> > 
> 
> > +++ b/qapi/misc.json
> > @@ -519,3 +519,45 @@
> >   'data': { '*option': 'str' },
> >   'returns': ['CommandLineOptionInfo'],
> >   'allow-preconfig': true }
> > +
> > +##
> > +# @SGXInfo:
> > +#
> > +# Information about intel Safe Guard eXtension (SGX) support
> > +#
> > +# @sgx: true if SGX is support
> 
> is supported
> 
  Eric, thanks for your comments! I will change this mistake. thanks!

  Yang

> > +#
> > +# @sgx1: true if SGX1 is support
> > +#
> > +# @sgx2: true if SGX2 is support
> > +#
> > +# @flc: true if FLC is support
> 
> again, for each of these too.

  Ditto, thanks!

  Yang

> 
> > +#
> > +# @section-size: The EPC section size for guest
> > +#
> > +# Since: 5.1
> 
> 6.1 (5.1 was last year).
> 

  Yes, i will change this version, thanks!

  Yang  

> > +##
> > +{ 'struct': 'SGXInfo',
> > +  'data': { 'sgx': 'bool',
> > +            'sgx1': 'bool',
> > +            'sgx2': 'bool',
> > +            'flc': 'bool',
> > +            'section-size': 'uint64'}}
> > +
> > +##
> > +# @query-sgx:
> > +#
> > +# Returns information about SGX
> > +#
> > +# Returns: @SGXInfo
> > +#
> > +# Since: 5.1
> 
> 6.1

  Ditto, thanks!

  Yang

> 
> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "query-sgx" }
> > +# <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
> > +#                  "flc": true, "section-size" : 0 } }
> > +#
> > +##
> > +{ 'command': 'query-sgx', 'returns': 'SGXInfo' }
> > diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
> > index c98b78d033..b75f3364f3 100644
> > --- a/tests/qtest/qmp-cmd-test.c
> > +++ b/tests/qtest/qmp-cmd-test.c
> > @@ -100,6 +100,7 @@ static bool query_is_ignored(const char *cmd)
> >          /* Success depends on Host or Hypervisor SEV support */
> >          "query-sev",
> >          "query-sev-capabilities",
> > +        "query-sgx",
> >          NULL
> >      };
> >      int i;
> > 
> 
> -- 
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3226
> Virtualization:  qemu.org | libvirt.org

