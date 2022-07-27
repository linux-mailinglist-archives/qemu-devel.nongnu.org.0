Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A01581F74
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 07:24:56 +0200 (CEST)
Received: from localhost ([::1]:36258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGZXT-00073G-CZ
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 01:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1oGZVM-0005Y9-Rj
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 01:22:44 -0400
Received: from mga02.intel.com ([134.134.136.20]:32859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1oGZVJ-00058B-W1
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 01:22:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658899361; x=1690435361;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0vRuKcxQRrX999qaq9wY6flCKlmA5EAg1r+bpsZOlNk=;
 b=IWJjYO5ROFngr/bgALGXZ1tHqQz/z1hQpuCxHn7138mSYkQyoL68Li7Y
 N/eMheu6L3pcZaT+CDPO8dZh/wvIiQ9msvLT+Br8jPTLOd0ELRuWy/d/+
 +anCSdojq++7LR393j1a2fi9R3bBATzzMtS+NZ0EZkr4s4zcjWbprBDRy
 rY/bfK87YM8IZ1QXJme1egXMnEbyj0Q3etB8XFCM1qcZEYxd7JJ97N7Ut
 qb8ZSluvZNin1Z3oB4VwrcsOqBN3tyG1oT/d2P7EyXDA/qZlwg5p+6ypR
 uBHjpOH8uRrxXx91sxLAOSJ7WOoMlJkn1LyCWC6wAoZytQt62KigRkNDc Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10420"; a="275021473"
X-IronPort-AV: E=Sophos;i="5.93,195,1654585200"; d="scan'208";a="275021473"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2022 22:22:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,195,1654585200"; d="scan'208";a="668196354"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by fmsmga004.fm.intel.com with ESMTP; 26 Jul 2022 22:22:35 -0700
Message-ID: <052025be29db7fe017214b0959e07913ebf9cb40.camel@linux.intel.com>
Subject: Re: [QEMU PATCH v2 4/6] nvdimm: Implement ACPI NVDIMM Label Methods
From: Robert Hoo <robert.hu@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: mst@redhat.com, xiaoguangrong.eric@gmail.com, ani@anisinha.ca, 
 dan.j.williams@intel.com, jingqi.liu@intel.com, qemu-devel@nongnu.org, 
 robert.hu@intel.com
Date: Wed, 27 Jul 2022 13:22:34 +0800
In-Reply-To: <20220721105837.2344a47a@redhat.com>
References: <20220530034047.730356-1-robert.hu@linux.intel.com>
 <20220530034047.730356-5-robert.hu@linux.intel.com>
 <20220616143210.21605b6a@redhat.com>
 <8a6a574aa3708f8f07c2dcc3fd84f6028ff1219f.camel@linux.intel.com>
 <20220721105837.2344a47a@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=robert.hu@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2022-07-21 at 10:58 +0200, Igor Mammedov wrote:
[...]
Thanks Igor for review.
> > > The patch it is too intrusive and my hunch is that it breaks
> > > ABI and needs a bunch of compat knobs to work properly and
> > > that I'd like to avoid unless there is not other way around
> > > the problem.  
> > 
> > Is the ABI here you mentioned the "struct NvdimmMthdIn{}" stuff?
> > and the compat knobs refers to related functions' input/output
> > params?
> 
> ABI are structures that guest and QEMU pass through information
> between each other. And knobs in this case would be compat
> variable[s]
> to keep old behavior in place for old machine types.

My humble opinion:
The changes of the compat variable(s) here don't break the ABI, the ABI
between guest and host/qemu is the ACPI spec which we don't change and
fully conform to it; actually we're implementing it.
e.g. with these patches, old guest can boot up with no difference nor
changes.
> 
> > My thoughts is that eventually, sooner or later, more ACPI methods
> > will
> > be implemented per request, although now we can play the trick of
> > wrapper new methods over the pipe of old _DSM implementation.
> > Though this changes a little on existing struct NvdimmDsmIn {}, it
> > paves the way for the future; and actually the change is more an
> > extension or generalization, not fundamentally changes the
> > framework.
> > 
> > In short, my point is the change/generalization/extension will be
> > inevitable, even if not present.
> 
> Expanding ABI (interface between host&guest) has 2 drawbacks
>  * it exposes more attack surface of VMM to hostile guest
>    and rises chances that vulnerability would slip through
>    review/testing

This patch doesn't increase attach surface, I think.

>  * migration wise, QEMU has to support any ABI for years
>    and not only latest an greatest interface but also old
>    ones to keep guest started on older QEMU working across
>    migration, so any ABI change should be considered very
>    carefully before being implemented otherwise it all
>    quickly snowballs in unsupportable mess of compat
>    variables smeared across host/guest.
>    Reducing exposed ABI and constant need to expand it
>    was a reason why we have moved ACPI code from firmware
>    into QEMU, so we could describe hardware without costs
>    associated with of maintaining ABI.

Yeah, migration is the only broken thing. With this patch, guest ACPI
table changes, live guest migrate between new and old qemus will have
problem. But I think this is not the only example of such kind of
problem. How about other similar cases?

In fact, the point of our contention is around this 
https://www.qemu.org/docs/master/specs/acpi_nvdimm.html, whether or not
change the implementation protocol by this patch. The protocol was for
_DSM only. Unless we're not going to support any ACPI methods, it
should be updated, and the _LS{I,R,W} are ACPI methods, we can play the
trick in this special case, but definitely not next time.

I suggest to do it now, nevertheless, you maintainers make the final
decision.

> 
> There might be need to extend ABI eventually, but not in this case.
> 
> > > I was skeptical about this approach during v1 review and
> > > now I'm pretty much sure it's over-engineered and we can
> > > just repack data we receive from existing label _DSM functions
> > > to provide _LS{I,R,W} like it was suggested in v1.
> > > It will be much simpler and affect only AML side without
> > > complicating ABI and without any compat cruft and will work
> > > with ping-pong migration without any issues.  
> > 
> > Ostensibly it may looks simpler, actually not, I think. The AML
> > "common
> > pipe" NCAL() is already complex, it packs all _DSMs and NFIT()
> > function
> > logics there, packing new stuff in/through it will be bug-prone.
> > Though this time we can avert touching it, as the new ACPI methods
> > deprecating old _DSM functionally is almost the same.
> > How about next time? are we going to always packing new methods
> > logic
> > in NCAL()?
> > My point is that we should implement new methods as itself, of
> > course,
> > as a general programming rule, we can/should abstract common
> > routines,
> > but not packing them in one large function.
> > > 
> > >   
[...]


