Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA832556DC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 10:49:28 +0200 (CEST)
Received: from localhost ([::1]:50714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBa4d-0007Kq-5t
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 04:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kBa3x-0006vV-Jo
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 04:48:45 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59568
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kBa3v-0008DG-Ji
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 04:48:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598604522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=slaZ275NxhsqqBmiTnOz1Ccj5WWDVsQ/fsuyqGOthec=;
 b=ALbSTGkee6AH8ZlBMT8a71HCBERz2kzPi2Aid2RjEup7am8TsMndU1oczw4xVFQ5yCHl7H
 rFSicWLvkmTL+t4SSlGy/fLuyf04Svvvlh8VkT1vjoTrQc+kHXw6qbkuQh8Sp1AcmDDDp4
 y0l7Rr3txtlrQj/P43BrpVjf/dN1riY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-T5X54vyLO3O1l8J2JarJEA-1; Fri, 28 Aug 2020 04:48:39 -0400
X-MC-Unique: T5X54vyLO3O1l8J2JarJEA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF0131074650;
 Fri, 28 Aug 2020 08:48:37 +0000 (UTC)
Received: from work-vm (ovpn-114-100.ams2.redhat.com [10.36.114.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 20C2D5D9F1;
 Fri, 28 Aug 2020 08:48:32 +0000 (UTC)
Date: Fri, 28 Aug 2020 09:48:30 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v5 0/8] Remove EPYC mode apicid decode and use generic
 decode
Message-ID: <20200828084830.GA3249@work-vm>
References: <159804762216.39954.15502128500494116468.stgit@naples-babu.amd.com>
 <20200824184112.GB2688@work-vm>
 <f602852c-b6af-694e-3e32-47974722e144@amd.com>
 <20200825081504.GA2646@work-vm>
 <20200825163846.10185087@redhat.com>
 <20200825152521.GA3574@work-vm>
 <20200826144324.56335302@redhat.com>
 <20200826141046.GB2727@work-vm>
 <20200827231907.10cfe4b7@imammedo-mac>
MIME-Version: 1.0
In-Reply-To: <20200827231907.10cfe4b7@imammedo-mac>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/28 03:48:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: ehabkost@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 Babu Moger <babu.moger@amd.com>, pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Igor Mammedov (imammedo@redhat.com) wrote:
> On Wed, 26 Aug 2020 15:10:46 +0100
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> 
> > * Igor Mammedov (imammedo@redhat.com) wrote:
> > > On Tue, 25 Aug 2020 16:25:21 +0100
> > > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > > 
> > > > * Igor Mammedov (imammedo@redhat.com) wrote:
> > > > > On Tue, 25 Aug 2020 09:15:04 +0100
> > > > > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > > > >   
> > > > > > * Babu Moger (babu.moger@amd.com) wrote:  
> > > > > > > Hi Dave,
> > > > > > > 
> > > > > > > On 8/24/20 1:41 PM, Dr. David Alan Gilbert wrote:    
> > > > > > > > * Babu Moger (babu.moger@amd.com) wrote:    
> > > > > > > >> To support some of the complex topology, we introduced EPYC mode apicid decode.
> > > > > > > >> But, EPYC mode decode is running into problems. Also it can become quite a
> > > > > > > >> maintenance problem in the future. So, it was decided to remove that code and
> > > > > > > >> use the generic decode which works for majority of the topology. Most of the
> > > > > > > >> SPECed configuration would work just fine. With some non-SPECed user inputs,
> > > > > > > >> it will create some sub-optimal configuration.
> > > > > > > >> Here is the discussion thread.
> > > > > > > >> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fqemu-devel%2Fc0bcc1a6-1d84-a6e7-e468-d5b437c1b254%40amd.com%2F&amp;data=02%7C01%7Cbabu.moger%40amd.com%7C74d90724af9c4adcc75008d8485d4d16%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637338912853492167&amp;sdata=GTsMKcpeYXAA0CvpLTirPHKdNSdlJE3RuPjCtSyWtGQ%3D&amp;reserved=0
> > > > > > > >>
> > > > > > > >> This series removes all the EPYC mode specific apicid changes and use the generic
> > > > > > > >> apicid decode.    
> > > > > > > > 
> > > > > > > > Hi Babu,
> > > > > > > >   This does simplify things a lot!
> > > > > > > > One worry, what happens about a live migration of a VM from an old qemu
> > > > > > > > that was using the node-id to a qemu with this new scheme?    
> > > > > > > 
> > > > > > > The node_id which we introduced was only used internally. This wasn't
> > > > > > > exposed outside. I don't think live migration will be an issue.    
> > > > > > 
> > > > > > Didn't it become part of the APIC ID visible to the guest?  
> > > > > 
> > > > > Daniel asked similar question wrt hard error on start up,
> > > > > when CLI is not sufficient to create EPYC cpu.
> > > > > 
> > > > > https://www.mail-archive.com/qemu-devel@nongnu.org/msg728536.html
> > > > > 
> > > > > Migration might fall into the same category.
> > > > > Also looking at the history, 5.0 commit 
> > > > >   247b18c593ec29 target/i386: Enable new apic id encoding for EPYC based cpus models
> > > > > silently broke APIC ID (without versioning), for all EPYC models (that's were 1 new and 1 old one).
> > > > > 
> > > > > (I'm not aware of somebody complaining about it)
> > > > > 
> > > > > Another commit ed78467a21459, changed CPUID_8000_001E without versioning as well.
> > > > > 
> > > > > 
> > > > > With current EPYC apicid code, if all starts align (no numa or 1 numa node only on
> > > > > CLI and no -smp dies=) it might produce a valid CPU (apicid+CPUID_8000_001E).
> > > > > No numa is gray area, since EPYC spec implies that it has to be numa machine in case of real EPYC cpus.
> > > > > Multi-node configs would be correct only if user assigns cpus to numa nodes
> > > > > by duplicating internal node_id algorithm that this series removes.
> > > > > 
> > > > > There might be other broken cases that I don't recall anymore
> > > > > (should be mentioned in previous versions of this series)
> > > > > 
> > > > > 
> > > > > To summarize from migration pov (ignoring ed78467a21459 change):
> > > > > 
> > > > >  1) old qemu pre-5.0 ==>  qemu 5.0, 5.1 - broken migration  
> > > > 
> > > > Oh ....
> > > > 
> > > > >  2) with this series (lets call it qemu 5.2)
> > > > >      pre-5.0 ==> qemu 5.2 - should work as series basically rollbacks current code to pre-5.0
> > > > >      qemu 5.0, 5.1 ==> qemu 5.2 - broken
> > > > > 
> > > > > It's all about picking which poison to choose,
> > > > > I'd preffer 2nd case as it lets drop a lot of complicated code that
> > > > > doesn't work as expected.  
> > > > 
> > > > I think that would make our lives easier for other reasons; so I'm happy
> > > > to go with that.
> > > 
> > > to make things less painful for users, me wonders if there is a way
> > > to block migration if epyc and specific QEMU versions are used?
> > 
> > We have no way to block based on version - and that's a pretty painful
> > thing to do; we can block based on machine type.
> > 
> > But before we get there; can we understand in which combinations that
> > things break and why exactly - would it break on a 1 or 2 vCPU guest -
> > or would it only break when we get to the point the upper bits start
> > being used for example?  Why exaclty would it break - i.e. is it going
> > to change the name of sections in the migration stream - or are the
> > values we need actually going to migrate OK?
> 
> it's values of APIC ID, where 4.2 and 5.0 QEMU use different values
> if numa is enabled.
> I'd expect guest to be very confused in when this happens.
> 
> here is an example:
> qemu-4.2 -cpu EPYC -smp 8,sockets=1,cores=8 -numa node,cpus=0-3 -numa node,cpus=4-7

OK, but it'll probably be OK on small VMs with a single NUMA node?

Dave

> (QEMU) qom-get path=/machine/unattached/device[8] property=apic-id
> {
>     "return": 7
> }
> 
> vs
> 
> qemu-5.1 -cpu EPYC -smp 8,sockets=1,cores=8 -numa node,cpus=0-3 -numa node,cpus=4-7
> (QEMU) qom-get path=/machine/unattached/device[8] property=apic-id
> {
>     "return": 15
> }
> 
> we probably can't do anything based on machine type versions, as
> 4.2 and older versions on qemu-5.0 and newer use different algorithm to calculate apic-id.
> 
> Hence was suggestion to leave 5.0/5.1 with broken apic id and revert back to
> 4.2 algorithm, which should encode APIC ID correctly when '-smp dies' is used. 
> 
> 
> > Dave
> > 
> > 
> > > > > PS:
> > > > >  I didn't review it yet, but with this series we aren't
> > > > >  making up internal node_ids that should match user provided numa node ids somehow.
> > > > >  It seems series lost the patch that would enforce numa in case -smp dies>1,
> > > > >  but otherwise it heads in the right direction.  
> > > > 
> > > > Dave
> > > > 
> > > > > > 
> > > > > > Dave
> > > > > >   
> > > > >   
> > > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


