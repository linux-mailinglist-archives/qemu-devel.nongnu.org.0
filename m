Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B86255EFA
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 18:47:18 +0200 (CEST)
Received: from localhost ([::1]:59688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBhX3-0008Ge-IR
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 12:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kBhVu-0007pe-N4
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 12:46:06 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:60467
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kBhVs-0000eD-93
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 12:46:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598633162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fykrKCQle2jMnDXwLcpW7TndDkgUzMIq1FymNOy0GQE=;
 b=BDUR3vGuDI0wCvrT4n5h4uZkTWqk5Hn1eCHOW0GfnVYz05WwsGfrcG+plIyOJtnihV75lK
 QJ+DXT7K8yt6/ksLvup2o+RK9jJ39VxORSYS6f7ANV4S7FBGijbF5LbzO7swM7S77M+rku
 /k1qdPnEOPcNWcca8qUneC6e4X63H2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-LpfBd3iwMdmTD7ADZ5VUvg-1; Fri, 28 Aug 2020 12:46:00 -0400
X-MC-Unique: LpfBd3iwMdmTD7ADZ5VUvg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 319FD8030BC;
 Fri, 28 Aug 2020 16:45:59 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A14C1C4;
 Fri, 28 Aug 2020 16:45:55 +0000 (UTC)
Date: Fri, 28 Aug 2020 12:45:54 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v5 0/8] Remove EPYC mode apicid decode and use generic
 decode
Message-ID: <20200828164554.GM642093@habkost.net>
References: <20200826153034.115126cb@redhat.com>
 <20200826133638.GO168515@redhat.com>
 <20200826160258.0e9047f4@redhat.com>
 <20200826150340.GP168515@redhat.com>
 <20200827190314.717ec788@imammedo-mac>
 <20200827190752.GK642093@habkost.net>
 <20200827225526.0b1f6d32@imammedo-mac>
 <20200828085533.GC224144@redhat.com>
 <20200828162931.GL642093@habkost.net>
 <20200828163251.GQ224144@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200828163251.GQ224144@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/28 12:33:08
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
Cc: mst@redhat.com, Michal Privoznik <mprivozn@redhat.com>,
 qemu-devel@nongnu.org, Babu Moger <babu.moger@amd.com>, pbonzini@redhat.com,
 Igor Mammedov <imammedo@redhat.com>, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 28, 2020 at 05:32:51PM +0100, Daniel P. Berrangé wrote:
> On Fri, Aug 28, 2020 at 12:29:31PM -0400, Eduardo Habkost wrote:
> > On Fri, Aug 28, 2020 at 09:55:33AM +0100, Daniel P. Berrangé wrote:
> > > On Thu, Aug 27, 2020 at 10:55:26PM +0200, Igor Mammedov wrote:
> > > > On Thu, 27 Aug 2020 15:07:52 -0400
> > > > Eduardo Habkost <ehabkost@redhat.com> wrote:
> > > > 
> > > > > On Thu, Aug 27, 2020 at 07:03:14PM +0200, Igor Mammedov wrote:
> > > > > > On Wed, 26 Aug 2020 16:03:40 +0100
> > > > > > Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > > > > 
> > > > > > > On Wed, Aug 26, 2020 at 04:02:58PM +0200, Igor Mammedov wrote:
> > > > > > > > On Wed, 26 Aug 2020 14:36:38 +0100
> > > > > > > > Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > > > > > > 
> > > > > > > > > On Wed, Aug 26, 2020 at 03:30:34PM +0200, Igor Mammedov wrote:
> > > > > > > > > > On Wed, 26 Aug 2020 13:50:59 +0100
> > > > > > > > > > Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > > > > > > > >   
> > > > > > > > > > > On Wed, Aug 26, 2020 at 02:38:49PM +0200, Igor Mammedov wrote:  
> > > > > > > > > > > > On Fri, 21 Aug 2020 17:12:19 -0500
> > > > > > > > > > > > Babu Moger <babu.moger@amd.com> wrote:
> > > > > > > > > > > >     
> > > > > > > > > > > > > To support some of the complex topology, we introduced EPYC mode apicid decode.
> > > > > > > > > > > > > But, EPYC mode decode is running into problems. Also it can become quite a
> > > > > > > > > > > > > maintenance problem in the future. So, it was decided to remove that code and
> > > > > > > > > > > > > use the generic decode which works for majority of the topology. Most of the
> > > > > > > > > > > > > SPECed configuration would work just fine. With some non-SPECed user inputs,
> > > > > > > > > > > > > it will create some sub-optimal configuration.
> > > > > > > > > > > > > Here is the discussion thread.
> > > > > > > > > > > > > https://lore.kernel.org/qemu-devel/c0bcc1a6-1d84-a6e7-e468-d5b437c1b254@amd.com/
> > > > > > > > > > > > > 
> > > > > > > > > > > > > This series removes all the EPYC mode specific apicid changes and use the generic
> > > > > > > > > > > > > apicid decode.    
> > > > > > > > > > > > 
> > > > > > > > > > > > the main difference between EPYC and all other CPUs is that
> > > > > > > > > > > > it requires numa configuration (it's not optional)
> > > > > > > > > > > > so we need an extra patch on top of this series to enfoce that, i.e:
> > > > > > > > > > > > 
> > > > > > > > > > > >  if (epyc && !numa) 
> > > > > > > > > > > >     error("EPYC cpu requires numa to be configured")    
> > > > > > > > > > > 
> > > > > > > > > > > Please no. This will break 90% of current usage of the EPYC CPU in
> > > > > > > > > > > real world QEMU deployments. That is way too user hostile to introduce
> > > > > > > > > > > as a requirement.
> > > > > > > > > > > 
> > > > > > > > > > > Why do we need to force this ?  People have been successfuly using
> > > > > > > > > > > EPYC CPUs without NUMA in QEMU for years now.
> > > > > > > > > > > 
> > > > > > > > > > > It might not match behaviour of bare metal silicon, but that hasn't
> > > > > > > > > > > obviously caused the world to come crashing down.  
> > > > > > > > > > So far it produces warning in linux kernel (RHBZ1728166),
> > > > > > > > > > (resulting performance might be suboptimal), but I haven't seen
> > > > > > > > > > anyone reporting crashes yet.
> > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > What other options do we have?
> > > > > > > > > > Perhaps we can turn on strict check for new machine types only,
> > > > > > > > > > so old configs can keep broken topology (CPUID),
> > > > > > > > > > while new ones would require -numa and produce correct topology.  
> > > > > > > > > 
> > > > > > > > > No, tieing this to machine types is not viable either. That is still
> > > > > > > > > going to break essentially every single management application that
> > > > > > > > > exists today using QEMU.
> > > > > > > > for that we have deprecation process, so users could switch to new CLI
> > > > > > > > that would be required.
> > > > > > > 
> > > > > > > We could, but I don't find the cost/benefit tradeoff is compelling.
> > > > > > > 
> > > > > > > There are so many places where we diverge from what bare metal would
> > > > > > > do, that I don't see a good reason to introduce this breakage, even
> > > > > > > if we notify users via a deprecation message. 
> > > > > > I find (3) and (4) good enough reasons to use deprecation.
> > > > > > 
> > > > > > > If QEMU wants to require NUMA for EPYC, then QEMU could internally
> > > > > > > create a single NUMA node if none was specified for new machine
> > > > > > > types, such that there is no visible change or breakage to any
> > > > > > > mgmt apps.  
> > > > > > 
> > > > > > (1) for configs that started without -numa &&|| without -smp dies>1,
> > > > > >       QEMU can do just that (enable auto_enable_numa).
> > > > > 
> > > > > Why exactly do we need auto_enable_numa with dies=1?
> > > > > 
> > > > > If I understand correctly, Babu said earlier in this thread[1]
> > > > > that we don't need auto_enable_numa.
> > > > > 
> > > > > [1] https://lore.kernel.org/qemu-devel/11489e5f-2285-ddb4-9c35-c9f522d603a0@amd.com/
> > > > 
> > > > in case of 1 die, -numa is not must have as it's one numa node only.
> > > > Though having auto_enable_numa, will allow to reuse the CPU.node-id property
> > > > to compose CPUID_Fn8000001E_ECX. i.e only code one path vs numa|non-numa variant.
> > > > 
> > > >  
> > > > > > (2) As for configs that are out of spec, I do not care much (junk in - junk out)
> > > > > > (though not having to spend time on bug reports and debug issues, just to say
> > > > > > it's not supported in the end, makes deprecation sound like a reasonable
> > > > > > choice)
> > > > > > 
> > > > > > (3) However if config matches bare metal i.e. CPU has more than 1 die and within
> > > > > > dies limits (spec wise), QEMU has to produce valid CPUs.
> > > > > > In this case QEMU can't make up multiple numa nodes and mappings of RAM/CPUs
> > > > > > on user's behalf. That's where we have to error out and ask for explicit
> > > > > > numa configuration.
> > > > > > 
> > > > > > For such configs, current code (since 5.0), will produce in the best case
> > > > > > performance issues  due to mismatching data in APICID, CPUID and ACPI tables,
> > > > > > in the worst case issues might be related to invalid APIC ID if running on EPYC host
> > > > > > and HW takes in account subfields of APIC ID (according to Babu real CPU uses
> > > > > > die_id(aka node_id) internally).
> > > > > > I'd rather error out on nonsense configs earlier than debug such issues
> > > > > > and than error out anyways later (upsetting more users).
> > > > > > 
> > > > > 
> > > > > The requirements are not clear to me.  Is this just about making
> > > > > CPU die_id match the NUMA node ID, or are there additional
> > > > > constraints?
> > > > die_id is per socket numa node index, so it's not numa node id in
> > > > a sense we use it in qemu
> > > > (that's where all the confusion started that led to current code)
> > > > 
> > > > I understood that each die in EPYC chip is a numa node, which encodes
> > > > NUMA node ID (system wide) in CPUID_Fn8000001E_ECX, that's why I
> > > > wrote earlier that EPYC makes -numa non optional.
> > > 
> > > AFAIK, that isnt a hard requirement.  In bare metal EPYC machine I
> > > have used, the BIOS lets you choose whether the dies are exposed as
> > > 1, 2 or 4 NUMA nodes. So there's no fixed  die == numa node mapping
> > > that I see.
> > 
> > If you change that setting, will all CPUID bits be kept the same,
> > or the die topology seen by the OS will change?
> 
> I don't know offhand, and don't currently have access to the hardware.
> All I know is that I was able to change between 1, 2 and 4 NUMA nodes
> and that was reflected in numactl display, I didn't check the CPUID
> when I was testing previously.

Babu, do you know the answer here?

If CPUID is kept the same with 1, 2 and 4 NUMA nodes, then having
NUMA configured is not a requirement at all.

-- 
Eduardo


