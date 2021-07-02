Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDC33BA3B0
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 19:37:25 +0200 (CEST)
Received: from localhost ([::1]:34954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzN6S-0001B3-Gy
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 13:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lzN4q-0000Hg-RH
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 13:35:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lzN4l-00053D-VV
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 13:35:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625247338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z+wJqO0zC8hMT/26dqOeoifWK7fNLbxALy/liGWLN2g=;
 b=BT9yIDNB5sB+fMCJBV7q9+pgDl3fY4uIK0WD0n2PH5AOqxiahtK+ZM3BtQRqMKpT4ZG6a0
 ILHyYBZEtHcFgs9lB2a9eA2S0FtVSh2yPml/W0OT9mKek3RDf9EX1QCluJqPz4JX8nCys9
 2rNdXCZ8+U1PT2StxusLIdDa4+G+2QE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-zwI8rnaQNUGgWy7fF7Ar5g-1; Fri, 02 Jul 2021 13:35:36 -0400
X-MC-Unique: zwI8rnaQNUGgWy7fF7Ar5g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36F945074B;
 Fri,  2 Jul 2021 17:35:35 +0000 (UTC)
Received: from localhost (unknown [10.22.8.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC4AD17A63;
 Fri,  2 Jul 2021 17:35:34 +0000 (UTC)
Date: Fri, 2 Jul 2021 13:35:34 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Michael Roth <michael.roth@amd.com>
Subject: Re: [External] Re: [PATCH] target/i386: Fix cpuid level for AMD
Message-ID: <20210702173534.qy7yd4uievvhwave@habkost.net>
References: <20210628132018.394994-1-pizhenwei@bytedance.com>
 <YNsoyqFvzXL0FXC8@work-vm>
 <162508068941.526217.2563710865841096339@amd.com>
 <20210701104313.5b64a9b4@redhat.com>
 <162517174973.564224.1039189315728194554@amd.com>
 <2952f218-f391-36d5-6331-006d9312cc66@bytedance.com>
 <20210702154322.x2rwhcx7vwg226bx@amd.com>
MIME-Version: 1.0
In-Reply-To: <20210702154322.x2rwhcx7vwg226bx@amd.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: like.xu@linux.intel.com, armbru@redhat.com, wei.huang2@amd.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, babu.moger@amd.com,
 pbonzini@redhat.com, Igor Mammedov <imammedo@redhat.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 02, 2021 at 10:43:22AM -0500, Michael Roth wrote:
> On Fri, Jul 02, 2021 at 01:14:56PM +0800, zhenwei pi wrote:
> > On 7/2/21 4:35 AM, Michael Roth wrote:
> > > Quoting Igor Mammedov (2021-07-01 03:43:13)
> > > > On Wed, 30 Jun 2021 14:18:09 -0500
> > > > Michael Roth <michael.roth@amd.com> wrote:
> > > > 
> > > > > Quoting Dr. David Alan Gilbert (2021-06-29 09:06:02)
> > > > > > * zhenwei pi (pizhenwei@bytedance.com) wrote:
> > > > > > > A AMD server typically has cpuid level 0x10(test on Rome/Milan), it
> > > > > > > should not be changed to 0x1f in multi-dies case.
> > > > > > > 
> > > > > > > Fixes: a94e1428991 (target/i386: Add CPUID.1F generation support
> > > > > > > for multi-dies PCMachine)
> > > > > > > Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> > > > > > 
> > > > > > (Copying in Babu)
> > > > > > 
> > > > > > Hmm I think you're right.  I've cc'd in Babu and Wei.
> > > > > > 
> > > > > > Eduardo: What do we need to do about compatibility, do we need to wire
> > > > > > this to machine type or CPU version?
> > > > > 
> > > > > FWIW, there are some other CPUID entries like leaves 2 and 4 that are
> > > > > also Intel-specific. With SEV-SNP CPUID enforcement, advertising them to
> > > > > guests will result in failures when host SNP firmware checks the
> > > > > hypervisor-provided CPUID values against the host-supported ones.
> > > > > 
> > > > > To address this we've been planning to add an 'amd-cpuid-only' property
> > > > > to suppress them:
> > > > > 
> > > > >    https://github.com/mdroth/qemu/commit/28d0553fe748d30a8af09e5e58a7da3eff03e21b
> > > > > 
> > > > > My thinking is this property should be off by default, and only defined
> > > > > either via explicit command-line option, or via new CPU types. We're also
> > > > > planning to add new CPU versions for EPYC* CPU types that set this
> > > > > 'amd-cpuid-only' property by default:
> > > > > 
> > > > >    https://github.com/mdroth/qemu/commits/new-cpu-types-upstream
> > > > It look like having new cpu versions is enough to change behavior,
> > > > maybe keep 'amd-cpuid-only' as internal field and not expose it to users
> > > > as a property.
> > > 
> > > Hmm, I defined it as a property mainly to make use of
> > > X86CPUVersionDefinition.props to create new versions of the CPU types
> > > with those properties set.
> > > 
> > > There's a patch there that adds X86CPUVersionDefinition.cache_info so
> > > that new cache definitions can be provided for new CPU versions. So
> > > would you suggest a similar approach here, e.g. adding an
> > > X86CPUVersionDefinition.amd_cpuid_only field that could be used directly
> > > rather than going through X86CPUVersionDefinition.props?
> > > 
> > > There's also another new "amd-xsave" prop in that series that does something
> > > similar to "amd-cpuid-only", so a little worried about tacking to much extra
> > > into X86CPUVersionDefinition. But maybe that one could just be rolled into
> > > "amd-cpuid-only" since it is basically fixing up xsave-related cpuid
> > > entries for AMD...
> > > 
> > Hi, this patch wants to fix the issue:
> > AMD CPU (Rome/Milan) should get the cpuid level 0x10, not 0x1F in the guest.
> > If QEMU reports a 0x1F to guest, guest(Linux) would use leaf 0x1F instead of
> > leaf 0xB to get extended topology:
> > 
> > https://github.com/torvalds/linux/blob/master/arch/x86/kernel/cpu/topology.c#L49
> > 
> > static int detect_extended_topology_leaf(struct cpuinfo_x86 *c)
> > {
> > 	if (c->cpuid_level >= 0x1f) {
> > 		if (check_extended_topology_leaf(0x1f) == 0)
> > 			return 0x1f;
> > 	}
> > 
> > 	if (c->cpuid_level >= 0xb) {
> > 		if (check_extended_topology_leaf(0xb) == 0)
> > 			return 0xb;
> > 	}
> > 
> > 	return -1;
> > }
> > 
> > Because of the wrong cpuid level, the guest gets unexpected topology from
> > leaf 0x1F.
> > 
> > I tested https://github.com/mdroth/qemu/commits/new-cpu-types-upstream, and
> > it seems that these patches could not fix this issue.
> 
> Yes, I think your patch would still be needed. The question is whether it's
> okay to change it for existing CPU types, e.g. EPYC-Milan, or only for new ones
> when they set a certain flag/property, like the proposed "amd-cpuid-only" (which
> the proposed EPYC-Milan-v2 would set).

I tried to answer this in a separate reply in this thread, but
answering here for visibility:

You can safely do it on existing CPU types, because the new
behavior doesn't introduce host software or hardware requirements
when enabled.  You just need to disable the new behavior in
MachineClass.compat_props for older machine types.

-- 
Eduardo


