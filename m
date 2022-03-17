Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C884DC3FA
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 11:31:05 +0100 (CET)
Received: from localhost ([::1]:38236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUnPM-0006ml-0k
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 06:31:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nUnKJ-0004oh-Dg
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 06:25:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nUnK1-0006gD-7T
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 06:25:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647512728;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DD7yUTLMQi2Ohl1aDjbYerPp5+1ppu9gQGxD00aw1RY=;
 b=LdI85X6rJ61TZEi1UHa6NqYD2XAvWXzZGqYP6ZbvXmiPttfyu0QrG9nwcFqme+P4+SKkbg
 o90luMajysyCq4/IuCZLKVjDK79np5HYctVVcEI4OxyPzjgXYX8ax7bSqrIvvBkGNyyst4
 JVeislNR/vpgC+ikegUz4gYsfYyU5js=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-CHdl0XC6N4q8s3rJHliXlg-1; Thu, 17 Mar 2022 06:25:17 -0400
X-MC-Unique: CHdl0XC6N4q8s3rJHliXlg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B445185A7BA;
 Thu, 17 Mar 2022 10:25:17 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13E04112C08B;
 Thu, 17 Mar 2022 10:25:04 +0000 (UTC)
Date: Thu, 17 Mar 2022 10:25:02 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [libvirt RFC] virFile: new VIR_FILE_WRAPPER_BIG_PIPE to improve
 performance
Message-ID: <YjMMfnEjXsz3Vi8h@redhat.com>
References: <20220312163001.3811-1-cfontana@suse.de>
 <Yi94mQUfrxMVbiLM@redhat.com>
 <34eb53b5-78f7-3814-b71e-aa7ac59f9d25@suse.de>
 <Yi+ACeaZ+oXTVYjc@redhat.com>
 <2d1248d4-ebdf-43f9-e4a7-95f586aade8e@suse.de>
 <7c641d9d-fffa-e21b-7ae2-12ad35c0c238@suse.de>
MIME-Version: 1.0
In-Reply-To: <7c641d9d-fffa-e21b-7ae2-12ad35c0c238@suse.de>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: libvir-list@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 17, 2022 at 11:12:11AM +0100, Claudio Fontana wrote:
> On 3/16/22 1:17 PM, Claudio Fontana wrote:
> > On 3/14/22 6:48 PM, Daniel P. Berrangé wrote:
> >> On Mon, Mar 14, 2022 at 06:38:31PM +0100, Claudio Fontana wrote:
> >>> On 3/14/22 6:17 PM, Daniel P. Berrangé wrote:
> >>>> On Sat, Mar 12, 2022 at 05:30:01PM +0100, Claudio Fontana wrote:
> >>>>> the first user is the qemu driver,
> >>>>>
> >>>>> virsh save/resume would slow to a crawl with a default pipe size (64k).
> >>>>>
> >>>>> This improves the situation by 400%.
> >>>>>
> >>>>> Going through io_helper still seems to incur in some penalty (~15%-ish)
> >>>>> compared with direct qemu migration to a nc socket to a file.
> >>>>>
> >>>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> >>>>> ---
> >>>>>  src/qemu/qemu_driver.c    |  6 +++---
> >>>>>  src/qemu/qemu_saveimage.c | 11 ++++++-----
> >>>>>  src/util/virfile.c        | 12 ++++++++++++
> >>>>>  src/util/virfile.h        |  1 +
> >>>>>  4 files changed, 22 insertions(+), 8 deletions(-)
> >>>>>
> >>>>> Hello, I initially thought this to be a qemu performance issue,
> >>>>> so you can find the discussion about this in qemu-devel:
> >>>>>
> >>>>> "Re: bad virsh save /dev/null performance (600 MiB/s max)"
> >>>>>
> >>>>> https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg03142.html


> Current results show these experimental averages maximum throughput
> migrating to /dev/null per each FdWrapper Pipe Size (as per QEMU QMP
> "query-migrate", tests repeated 5 times for each).
> VM Size is 60G, most of the memory effectively touched before migration,
> through user application allocating and touching all memory with
> pseudorandom data.
> 
> 64K:     5200 Mbps (current situation)
> 128K:    5800 Mbps
> 256K:   20900 Mbps
> 512K:   21600 Mbps
> 1M:     22800 Mbps
> 2M:     22800 Mbps
> 4M:     22400 Mbps
> 8M:     22500 Mbps
> 16M:    22800 Mbps
> 32M:    22900 Mbps
> 64M:    22900 Mbps
> 128M:   22800 Mbps
> 
> This above is the throughput out of patched libvirt with multiple Pipe Sizes for the FDWrapper.

Ok, its bouncing around with noise after 1 MB. So I'd suggest that
libvirt attempt to raise the pipe limit to 1 MB by default, but
not try to go higher.

> As for the theoretical limit for the libvirt architecture,
> I ran a qemu migration directly issuing the appropriate QMP
> commands, setting the same migration parameters as per libvirt,
> and then migrating to a socket netcatted to /dev/null via
> {"execute": "migrate", "arguments": { "uri", "unix:///tmp/netcat.sock" } } :
> 
> QMP:    37000 Mbps

> So although the Pipe size improves things (in particular the
> large jump is for the 256K size, although 1M seems a very good value),
> there is still a second bottleneck in there somewhere that
> accounts for a loss of ~14200 Mbps in throughput.

In the above tests with libvirt, were you using the
--bypass-cache flag or not ?

Hopefully use of O_DIRECT doesn't make a difference for
/dev/null, since the I/O is being immediately thrown
away and so ought to never go into I/O cache. 

In terms of the comparison, we still have libvirt iohelper
giving QEMU a pipe, while your test above gives QEMU a
UNIX socket.

So I still wonder if the delta is caused by the pipe vs socket
difference, as opposed to netcat vs libvirt iohelper code.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


