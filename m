Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E11F278301
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 10:41:23 +0200 (CEST)
Received: from localhost ([::1]:51356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLjIA-0002PN-4Y
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 04:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kLjGS-00015Q-Bm
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 04:39:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kLjGQ-0003jm-5g
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 04:39:36 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601023173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M/y31tiJ+4+74mZFCmavOxDlJ8CIUCZMHROgm9V1cXg=;
 b=iqTHLBOcDwC3G9jfKxwEd3LSfDz5KjrfrL5iVpqy4IJBXmNdZsqoSJGiW2LqMv96GnHXYL
 GaAloeuj45EargMT5jYzHb/FnafJ5Bpe7L6IgEdT58otqZis81OpLAXZdcUvJ5wWxFfSvy
 8dCKQus+RpASvUYIk8f8a2w2P/wBGrU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-vkKWMQaiNeKXBbpYOeTnrg-1; Fri, 25 Sep 2020 04:39:28 -0400
X-MC-Unique: vkKWMQaiNeKXBbpYOeTnrg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D924800E23;
 Fri, 25 Sep 2020 08:39:27 +0000 (UTC)
Received: from work-vm (ovpn-114-177.ams2.redhat.com [10.36.114.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B8477368F;
 Fri, 25 Sep 2020 08:39:25 +0000 (UTC)
Date: Fri, 25 Sep 2020 09:39:23 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Ashish Kalra <ashish.kalra@amd.com>
Subject: Re: SEV guest debugging support for Qemu
Message-ID: <20200925083923.GB2873@work-vm>
References: <20200922201124.GA6606@ashkalra_ubuntu_server>
 <20200924135342.GE2792@work-vm>
 <20200924190653.GA8180@ashkalra_ubuntu_server>
 <a35415c9-6e50-5260-e0e6-e36b9f16f2b2@amd.com>
 <20200924215256.GA8562@ashkalra_ubuntu_server>
MIME-Version: 1.0
In-Reply-To: <20200924215256.GA8562@ashkalra_ubuntu_server>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/25 01:07:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, jon.grimm@amd.com,
 Brijesh Singh <brijesh.singh@amd.com>, qemu-devel@nongnu.org,
 thomas.lendacky@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Ashish Kalra (ashish.kalra@amd.com) wrote:
> On Thu, Sep 24, 2020 at 02:37:33PM -0500, Brijesh Singh wrote:
> > 
> > On 9/24/20 2:06 PM, Ashish Kalra wrote:
> > > Hello Dave,
> > >
> > > Thanks for your response, please see my replies inline :
> > >
> > > On Thu, Sep 24, 2020 at 02:53:42PM +0100, Dr. David Alan Gilbert wrote:
> > >> * Ashish Kalra (ashish.kalra@amd.com) wrote:
> > >>> Hello Alan, Paolo,
> > >>>
> > >>> I am following up on Brijesh’s patches for SEV guest debugging support for Qemu using gdb and/or qemu monitor.
> > >>> I believe that last time, Qemu SEV debug patches were not applied and have attached the link to the email thread and Paolo’s feedback below for reference [1].
> > >>> I wanted to re-start a discussion on the same here with the Qemu community and seek the feedback on the approaches which we are considering :
> > >>> Looking at Qemu code, I see the following interface is defined, for virtual memory access for debug : cpu_memory_rw_debug(). 
> > >>> Both gdbstub (target_memory_rw_debug() ) and QMP/HMP (monitor/misc.c : memory_dump() ) use this standard and well-defined interface to access guest memory for debugging purposes. 
> > >>>
> > >>> This internally invokes the address_space_rw() accessor functions which we had  "fixed" internally (as part of the earlier patch) to invoke memory region specific debug ops. 
> > >>> In our earlier approach we were adding debug ops/callbacks to memory regions and as per comments on our earlier patches, Paolo was not happy with this debug API for
> > >>> MemoryRegions and hence the SEV support for Qemu was merged without the debug support.
> > >>>
> > >>> Now, we want to reuse this cpu_memory_rw_debug() interface or alternatively introduce a new generic debug interface/object in the Qemu. This 
> > >>> debug interface should be controlled through the global machine policy.
> > >> Let me leave the question of how the memory_rw_debug interface should
> > >> work to Paolo.
> > >>
> > >>> For e.g., 
> > >>> # $QEMU -machine -debug=<a debug object>
> > >>> or
> > >>> # $QEMU -machine -debug=sev-guest-debug
> > >>>
> > >>> The QMP and GDB access will be updated to use the generic debug  interface. The generic debug interface or the cpu_memory_rw_debug() interace will introduce hooks to call a 
> > >>> vendor specific debug object to delegate accessing the data. The vendor specific debug object may do a further checks before and after accessing the memory.
> > >> I'm not sure that needs a commandline switch for it; since you can
> > >> already get it from the guest policy in the sev object and I can't think
> > >> of any other cases that would need something similar.
> > > Yes, i agree with that, so i am now considering abstracting this vendor
> > > specific debug interface via CPUClass object instead of doing it via
> > > MemoryRegions. 
> > >
> > >>> Now, looking specifically at cpu_memory_rw_debug() interface, this interface is invoked for all guest memory accesses for debugging purposes and it also does 
> > >>> guest VA to GPA translation via cpu_get_phys_page_attrs_debug(), so we can again add a vendor specific callback here to do guest VA to GPA translations specific
> > >>> to SEV as SEV guest debugging will also require accessing guest page table entries and decrypting them via the SEV DBG_DECRYPT APIs and additionally clearing
> > >>> the C-bit on page table entries (PxEs) before using them further for page table walks.
> > >>>
> > >>> There is still an issue with the generic cpu_memory_rw_debug() interface, though it is used for all guest memory accesses for debugging and we can also handle
> > >>> guest page table walks via it (as mentioned above), there are still other gdb/monitor commands such as tlb_info_xx() and mem_info_xx() which also do guest page
> > >>> table walks, but they don’t go through any generic guest memory access/debug interface, so these commands will need to be handled additionally for SEV.
> > >> If some of those should be using the debug interface and aren't then
> > >> please fix them anyway.
> > >>
> > >>> The vendor specific debug object (added as a hook to generic debug object or the generic cpu_memory_rw_debug() interface) will do further checks before and after accessing the memory.
> > >>>
> > >>> e.g., in the case of SEV,
> > >>>
> > >>> 1. Check the guest policy, if guest policy does not allow debug then return an error.
> > >>>
> > >>> 2. If its an MMIO region then access the data.
> > >>>
> > >>> 3. If its RAM region then call the PSP commands to decrypt the data.
> > >>>
> > >>> 4. If caller asked to read the PTE entry then probably clear the C-bits after reading the PTE entry.
> > >> Does that work if the guest is currently running?
> > >>
> > > I assume you are asking that is this done when guest is being debugged,
> > > the above steps are only done when the guest is paused and being debugged.
> > 
> > 
> > I don't why we need to pause the guest. Ideally we should be able to
> > connect to Qemu monitor and run the "x" command to dump memory. IIRC, if
> > paging is enabled then monitor will walk the guest page table to reach
> > to gpa. Something like this in the Qemu monitor console should work:
> > 
> > x /10i $eip
> > 
> > 
> 
> Yes that works, what i basically meant that monitor will invoke a set of debugging
> interfaces to get gpa and then dump guest memory even while guest is
> running.

OK, I was worried about the bit where you said 'clear the C-bits' - as
long as that's just clearing it in the copy you've taken rather than the
in memory version the guest is using then that's OK.

Dave

> Thanks,
> Ashish
> 
> > >
> > >>> 5. many more checks
> > >>>
> > >>> Looking fwd. to your feedback/comments on the above approach or other any other suggestions.
> > >>>
> > >>> Thanks,
> > >>> Ashish
> > >>>
> > >>> [1] -> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fnext.patchew.org%2FQEMU%2F20180308124901.83533-1-brijesh.singh%40amd.com%2F20180308124901.83533-29-brijesh.singh%40amd.com%2F&amp;data=02%7C01%7Cashish.kalra%40amd.com%7Cd21e40d3527d4dba609c08d86091490e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637365524404435805&amp;sdata=P%2F6DqPQmUObJipkbbeXcrUdCqulePiqxSU6OB8xUEWo%3D&amp;reserved=0
> > >>>
> > >> -- 
> > >> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > >>
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


