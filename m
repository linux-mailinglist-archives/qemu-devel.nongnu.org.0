Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 719D94E7215
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 12:16:38 +0100 (CET)
Received: from localhost ([::1]:55624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXhvo-0001c5-Vm
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 07:16:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nXhu7-0000oT-Sm
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 07:14:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nXhu1-0005AE-65
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 07:14:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648206883;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O6k1TyO4dOBTdwDpcHa7ot4pt6EtsJlzHX386NRWDeA=;
 b=jCzrw62K0Mnyvs+mPPfMYaVRqmmycjaVs+7tlRU6gfA+83rmeQOiRyxi7oOHIAWuR3gDrT
 htkyIBq7Qky/hF2pTJSQ5qW3iJjLTvJbwf6b7jDVNxIk5fa4krhzJ4c2ZdB9RRFiMFuPpE
 FZqSJDhCnB0u7LUk0i8uSe8hg39MFJQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-9AHUuN2uPYefshgF2KITCQ-1; Fri, 25 Mar 2022 07:14:17 -0400
X-MC-Unique: 9AHUuN2uPYefshgF2KITCQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDBF6811E76;
 Fri, 25 Mar 2022 11:14:16 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB09C40D0166;
 Fri, 25 Mar 2022 11:14:15 +0000 (UTC)
Date: Fri, 25 Mar 2022 11:14:13 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [libvirt RFC] virFile: new VIR_FILE_WRAPPER_BIG_PIPE to improve
 performance
Message-ID: <Yj2kBc+AfYYcxxvO@redhat.com>
References: <Yi+ACeaZ+oXTVYjc@redhat.com>
 <2d1248d4-ebdf-43f9-e4a7-95f586aade8e@suse.de>
 <7c641d9d-fffa-e21b-7ae2-12ad35c0c238@suse.de>
 <YjMMfnEjXsz3Vi8h@redhat.com>
 <f94f9d54-b71b-e8ff-1a5b-931e42120e4e@suse.de>
 <35da2366-99e4-7680-a1c5-46aff83d747c@suse.de>
 <YjNNqzb7eBBwMFJN@work-vm>
 <737974fa-905c-d171-05b0-ec4df42bc762@suse.de>
 <Yj2aa9OXv2CTQi/j@redhat.com>
 <da4a4121-7be9-26ff-5b7f-244b124ef0fd@suse.de>
MIME-Version: 1.0
In-Reply-To: <da4a4121-7be9-26ff-5b7f-244b124ef0fd@suse.de>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: libvir-list@redhat.com, andrea.righi@canonical.com,
 Jiri Denemark <jdenemar@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 25, 2022 at 11:56:44AM +0100, Claudio Fontana wrote:
> Thanks Daniel,
> 
> On 3/25/22 11:33 AM, Daniel P. Berrangé wrote:
> > On Fri, Mar 18, 2022 at 02:34:29PM +0100, Claudio Fontana wrote:
> >> On 3/17/22 4:03 PM, Dr. David Alan Gilbert wrote:
> >>> * Claudio Fontana (cfontana@suse.de) wrote:
> >>>> On 3/17/22 2:41 PM, Claudio Fontana wrote:
> >>>>> On 3/17/22 11:25 AM, Daniel P. Berrangé wrote:
> >>>>>> On Thu, Mar 17, 2022 at 11:12:11AM +0100, Claudio Fontana wrote:
> >>>>>>> On 3/16/22 1:17 PM, Claudio Fontana wrote:
> >>>>>>>> On 3/14/22 6:48 PM, Daniel P. Berrangé wrote:
> >>>>>>>>> On Mon, Mar 14, 2022 at 06:38:31PM +0100, Claudio Fontana wrote:
> >>>>>>>>>> On 3/14/22 6:17 PM, Daniel P. Berrangé wrote:
> >>>>>>>>>>> On Sat, Mar 12, 2022 at 05:30:01PM +0100, Claudio Fontana wrote:
> >>>>>>>>>>>> the first user is the qemu driver,
> >>>>>>>>>>>>
> >>>>>>>>>>>> virsh save/resume would slow to a crawl with a default pipe size (64k).
> >>>>>>>>>>>>
> >>>>>>>>>>>> This improves the situation by 400%.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Going through io_helper still seems to incur in some penalty (~15%-ish)
> >>>>>>>>>>>> compared with direct qemu migration to a nc socket to a file.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> >>>>>>>>>>>> ---
> >>>>>>>>>>>>  src/qemu/qemu_driver.c    |  6 +++---
> >>>>>>>>>>>>  src/qemu/qemu_saveimage.c | 11 ++++++-----
> >>>>>>>>>>>>  src/util/virfile.c        | 12 ++++++++++++
> >>>>>>>>>>>>  src/util/virfile.h        |  1 +
> >>>>>>>>>>>>  4 files changed, 22 insertions(+), 8 deletions(-)
> >>>>>>>>>>>>
> >>>>>>>>>>>> Hello, I initially thought this to be a qemu performance issue,
> >>>>>>>>>>>> so you can find the discussion about this in qemu-devel:
> >>>>>>>>>>>>
> >>>>>>>>>>>> "Re: bad virsh save /dev/null performance (600 MiB/s max)"
> >>>>>>>>>>>>
> >>>>>>>>>>>> https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg03142.html
> >>>>>>
> >>>>>>
> >>>>>>> Current results show these experimental averages maximum throughput
> >>>>>>> migrating to /dev/null per each FdWrapper Pipe Size (as per QEMU QMP
> >>>>>>> "query-migrate", tests repeated 5 times for each).
> >>>>>>> VM Size is 60G, most of the memory effectively touched before migration,
> >>>>>>> through user application allocating and touching all memory with
> >>>>>>> pseudorandom data.
> >>>>>>>
> >>>>>>> 64K:     5200 Mbps (current situation)
> >>>>>>> 128K:    5800 Mbps
> >>>>>>> 256K:   20900 Mbps
> >>>>>>> 512K:   21600 Mbps
> >>>>>>> 1M:     22800 Mbps
> >>>>>>> 2M:     22800 Mbps
> >>>>>>> 4M:     22400 Mbps
> >>>>>>> 8M:     22500 Mbps
> >>>>>>> 16M:    22800 Mbps
> >>>>>>> 32M:    22900 Mbps
> >>>>>>> 64M:    22900 Mbps
> >>>>>>> 128M:   22800 Mbps
> >>>>>>>
> >>>>>>> This above is the throughput out of patched libvirt with multiple Pipe Sizes for the FDWrapper.
> >>>>>>
> >>>>>> Ok, its bouncing around with noise after 1 MB. So I'd suggest that
> >>>>>> libvirt attempt to raise the pipe limit to 1 MB by default, but
> >>>>>> not try to go higher.
> >>>>>>
> >>>>>>> As for the theoretical limit for the libvirt architecture,
> >>>>>>> I ran a qemu migration directly issuing the appropriate QMP
> >>>>>>> commands, setting the same migration parameters as per libvirt,
> >>>>>>> and then migrating to a socket netcatted to /dev/null via
> >>>>>>> {"execute": "migrate", "arguments": { "uri", "unix:///tmp/netcat.sock" } } :
> >>>>>>>
> >>>>>>> QMP:    37000 Mbps
> >>>>>>
> >>>>>>> So although the Pipe size improves things (in particular the
> >>>>>>> large jump is for the 256K size, although 1M seems a very good value),
> >>>>>>> there is still a second bottleneck in there somewhere that
> >>>>>>> accounts for a loss of ~14200 Mbps in throughput.
> >>>>
> >>>>
> >>>> Interesting addition: I tested quickly on a system with faster cpus and larger VM sizes, up to 200GB,
> >>>> and the difference in throughput libvirt vs qemu is basically the same ~14500 Mbps.
> >>>>
> >>>> ~50000 mbps qemu to netcat socket to /dev/null
> >>>> ~35500 mbps virsh save to /dev/null
> >>>>
> >>>> Seems it is not proportional to cpu speed by the looks of it (not a totally fair comparison because the VM sizes are different).
> >>>
> >>> It might be closer to RAM or cache bandwidth limited though; for an extra copy.
> >>
> >> I was thinking about sendfile(2) in iohelper, but that probably can't work as the input fd is a socket, I am getting EINVAL.
> >>
> >> One thing that I noticed is:
> >>
> >> ommit afe6e58aedcd5e27ea16184fed90b338569bd042
> >> Author: Jiri Denemark <jdenemar@redhat.com>
> >> Date:   Mon Feb 6 14:40:48 2012 +0100
> >>
> >>     util: Generalize virFileDirectFd
> >>     
> >>     virFileDirectFd was used for accessing files opened with O_DIRECT using
> >>     libvirt_iohelper. We will want to use the helper for accessing files
> >>     regardless on O_DIRECT and thus virFileDirectFd was generalized and
> >>     renamed to virFileWrapperFd.
> >>
> >>
> >> And in particular the comment in src/util/virFile.c:
> >>
> >>     /* XXX support posix_fadvise rather than O_DIRECT, if the kernel support                                                                                                 
> >>      * for that is decent enough. In that case, we will also need to                                                                                                         
> >>      * explicitly support VIR_FILE_WRAPPER_NON_BLOCKING since                                                                                                                
> >>      * VIR_FILE_WRAPPER_BYPASS_CACHE alone will no longer require spawning                                                                                                   
> >>      * iohelper.                                                                                                                                                             
> >>      */
> >>
> >> by Jiri Denemark.
> >>
> >> I have lots of questions here, and I tried to involve Jiri and Andrea Righi here, who a long time ago proposed a POSIX_FADV_NOREUSE implementation.
> >>
> >> 1) What is the reason iohelper was introduced?
> > 
> > With POSIX you can't get sensible results from poll() on FDs associated with
> > plain files. It will always report the file as readable/writable, and the
> > userspace caller will get blocked any time the I/O operation causes the
> > kernel to read/write from the underlying (potentially very slow) storage.
> > 
> > IOW if you give QEMU an FD associated with a plain file and tell it to
> > migrate to that, the guest OS will get stalled.
> 
> we send a stop command to qemu just before migrating to a file in virsh save though right?
> With virsh restore we also first load the VM, and only then start executing it.
> 
> So for virsh save and virsh restore, this should not be a problem? Still we need the iohelper?

The same code is used in libvirt for other commands like 'virsh dump'
and snapshots, where the VM remains live though. In general I don't
think we should remove the iohelper, because QEMU code is written from
the POV that the channels honour O_NOBLOCK.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


