Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319274FC470
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 20:55:05 +0200 (CEST)
Received: from localhost ([::1]:38664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndzBn-0001wx-Sc
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 14:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ndzA1-0000wG-1S
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 14:53:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ndz9w-0006LT-KH
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 14:53:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649703186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S5NyicVFy1X3rKrIl/DzOVkz5EEzFNljCW0zjfNaRjg=;
 b=ZLYdAKW3lJSA6kFzrcDIYp5FqnR/ywy5HoGiYdmHZfIdl2bwjQTVkPIP3mEtGCf3hClC05
 Htj58f4DxBZ/+UyDehuiS64W6R2JZwLr3OheO4pTMDp8w5KttViUjtuK+MU8t0rWExR+4i
 6n/t9LYNzjJIV2duwUfcISjD0mNycqY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-PtRrW3x-MXKHlbMuL2TW6w-1; Mon, 11 Apr 2022 14:53:05 -0400
X-MC-Unique: PtRrW3x-MXKHlbMuL2TW6w-1
Received: by mail-wm1-f72.google.com with SMTP id
 o35-20020a05600c512300b0038e83a52c71so4889193wms.7
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 11:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=S5NyicVFy1X3rKrIl/DzOVkz5EEzFNljCW0zjfNaRjg=;
 b=Yf/kjdpNW9JKumnUUwmfVWQ6K3LFb1WHVjEgzHDmwy+YuYmKZ6a1c4QUvhMt6QYgW/
 Rn0jgayTNv1a5xqeaCMZckiwhzQJva6i9I+Er9z/bLZtscFG8FcQsxuhadPX89ZenbtA
 NOOvihgqzZkQdwAwa7afU1TmQxP3edMvXbCytx576767SfC9oXX26ZUSMW38noDeGO/U
 HFuta3M5BNjPnicYudTqb3sL9hrXI5xP3Dk0RG3EtJdZmDQwkYCb57wgU0zgtKdh4Vue
 r8JM/0RZk7COjkL9r2WHb3YP9bn46XwTRFfP7fntdvGgPv2g4zgKu93xiCqPj/d2mEYq
 ybCA==
X-Gm-Message-State: AOAM531n3fq2HJs6nc8q+dlr8PqwEFS8gGt00RHHzgGsd1UMpDrYwm0Z
 70VvQ+ouW5dJxtglOOLZT5h8pLjFJTeAtud/TXQhSPDZilHtS/Ehza62c8UXvaVZbLFnLgX8lXa
 fjDJw8pWxJVu971I=
X-Received: by 2002:a05:600c:1e11:b0:38c:b316:e6f5 with SMTP id
 ay17-20020a05600c1e1100b0038cb316e6f5mr510285wmb.93.1649703184501; 
 Mon, 11 Apr 2022 11:53:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkJZdO5/dA20JrQcgbcsoqCWJTZoVowQG+43tVtQxcfbBvl9VI2HpKzSU5k4h6g0fbQJ6Utw==
X-Received: by 2002:a05:600c:1e11:b0:38c:b316:e6f5 with SMTP id
 ay17-20020a05600c1e1100b0038cb316e6f5mr510263wmb.93.1649703184249; 
 Mon, 11 Apr 2022 11:53:04 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 w12-20020adf8bcc000000b002060e3da33fsm22296932wra.66.2022.04.11.11.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 11:53:03 -0700 (PDT)
Date: Mon, 11 Apr 2022 19:53:01 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [libvirt RFC] virFile: new VIR_FILE_WRAPPER_BIG_PIPE to improve
 performance
Message-ID: <YlR5DYFHKztZpU8c@work-vm>
References: <737974fa-905c-d171-05b0-ec4df42bc762@suse.de>
 <Yj2nh1LRZ54BXuds@redhat.com>
 <47af35ec-2ca8-26ae-f4e4-d81f18f2a05b@suse.de>
 <YkFycBMT0HsYUfJr@redhat.com>
 <c5924d0a-78e4-29ed-e856-e8ab823bc560@suse.de>
 <Ykv/TLS8zgwh/ros@work-vm>
 <9e990c54-746f-eb97-1e6a-1ce298d511b9@suse.de>
 <Yk7s3CSYTKiZPPON@work-vm>
 <33b6e8a9-5fe1-146c-3a0c-f5d8e9367ce8@suse.de>
 <b8ab68e2-315f-d026-21b1-b310a818dbfd@suse.de>
MIME-Version: 1.0
In-Reply-To: <b8ab68e2-315f-d026-21b1-b310a818dbfd@suse.de>
User-Agent: Mutt/2.2.1 (2022-02-19)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: libvir-list@redhat.com, andrea.righi@canonical.com,
 Jiri Denemark <jdenemar@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Claudio Fontana (cfontana@suse.de) wrote:
> On 4/7/22 3:57 PM, Claudio Fontana wrote:
> > On 4/7/22 3:53 PM, Dr. David Alan Gilbert wrote:
> >> * Claudio Fontana (cfontana@suse.de) wrote:
> >>> On 4/5/22 10:35 AM, Dr. David Alan Gilbert wrote:
> >>>> * Claudio Fontana (cfontana@suse.de) wrote:
> >>>>> On 3/28/22 10:31 AM, Daniel P. Berrangé wrote:
> >>>>>> On Sat, Mar 26, 2022 at 04:49:46PM +0100, Claudio Fontana wrote:
> >>>>>>> On 3/25/22 12:29 PM, Daniel P. Berrangé wrote:
> >>>>>>>> On Fri, Mar 18, 2022 at 02:34:29PM +0100, Claudio Fontana wrote:
> >>>>>>>>> On 3/17/22 4:03 PM, Dr. David Alan Gilbert wrote:
> >>>>>>>>>> * Claudio Fontana (cfontana@suse.de) wrote:
> >>>>>>>>>>> On 3/17/22 2:41 PM, Claudio Fontana wrote:
> >>>>>>>>>>>> On 3/17/22 11:25 AM, Daniel P. Berrangé wrote:
> >>>>>>>>>>>>> On Thu, Mar 17, 2022 at 11:12:11AM +0100, Claudio Fontana wrote:
> >>>>>>>>>>>>>> On 3/16/22 1:17 PM, Claudio Fontana wrote:
> >>>>>>>>>>>>>>> On 3/14/22 6:48 PM, Daniel P. Berrangé wrote:
> >>>>>>>>>>>>>>>> On Mon, Mar 14, 2022 at 06:38:31PM +0100, Claudio Fontana wrote:
> >>>>>>>>>>>>>>>>> On 3/14/22 6:17 PM, Daniel P. Berrangé wrote:
> >>>>>>>>>>>>>>>>>> On Sat, Mar 12, 2022 at 05:30:01PM +0100, Claudio Fontana wrote:
> >>>>>>>>>>>>>>>>>>> the first user is the qemu driver,
> >>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>> virsh save/resume would slow to a crawl with a default pipe size (64k).
> >>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>> This improves the situation by 400%.
> >>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>> Going through io_helper still seems to incur in some penalty (~15%-ish)
> >>>>>>>>>>>>>>>>>>> compared with direct qemu migration to a nc socket to a file.
> >>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> >>>>>>>>>>>>>>>>>>> ---
> >>>>>>>>>>>>>>>>>>>  src/qemu/qemu_driver.c    |  6 +++---
> >>>>>>>>>>>>>>>>>>>  src/qemu/qemu_saveimage.c | 11 ++++++-----
> >>>>>>>>>>>>>>>>>>>  src/util/virfile.c        | 12 ++++++++++++
> >>>>>>>>>>>>>>>>>>>  src/util/virfile.h        |  1 +
> >>>>>>>>>>>>>>>>>>>  4 files changed, 22 insertions(+), 8 deletions(-)
> >>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>> Hello, I initially thought this to be a qemu performance issue,
> >>>>>>>>>>>>>>>>>>> so you can find the discussion about this in qemu-devel:
> >>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>> "Re: bad virsh save /dev/null performance (600 MiB/s max)"
> >>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>> https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg03142.html
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>> Current results show these experimental averages maximum throughput
> >>>>>>>>>>>>>> migrating to /dev/null per each FdWrapper Pipe Size (as per QEMU QMP
> >>>>>>>>>>>>>> "query-migrate", tests repeated 5 times for each).
> >>>>>>>>>>>>>> VM Size is 60G, most of the memory effectively touched before migration,
> >>>>>>>>>>>>>> through user application allocating and touching all memory with
> >>>>>>>>>>>>>> pseudorandom data.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> 64K:     5200 Mbps (current situation)
> >>>>>>>>>>>>>> 128K:    5800 Mbps
> >>>>>>>>>>>>>> 256K:   20900 Mbps
> >>>>>>>>>>>>>> 512K:   21600 Mbps
> >>>>>>>>>>>>>> 1M:     22800 Mbps
> >>>>>>>>>>>>>> 2M:     22800 Mbps
> >>>>>>>>>>>>>> 4M:     22400 Mbps
> >>>>>>>>>>>>>> 8M:     22500 Mbps
> >>>>>>>>>>>>>> 16M:    22800 Mbps
> >>>>>>>>>>>>>> 32M:    22900 Mbps
> >>>>>>>>>>>>>> 64M:    22900 Mbps
> >>>>>>>>>>>>>> 128M:   22800 Mbps
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> This above is the throughput out of patched libvirt with multiple Pipe Sizes for the FDWrapper.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Ok, its bouncing around with noise after 1 MB. So I'd suggest that
> >>>>>>>>>>>>> libvirt attempt to raise the pipe limit to 1 MB by default, but
> >>>>>>>>>>>>> not try to go higher.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>> As for the theoretical limit for the libvirt architecture,
> >>>>>>>>>>>>>> I ran a qemu migration directly issuing the appropriate QMP
> >>>>>>>>>>>>>> commands, setting the same migration parameters as per libvirt,
> >>>>>>>>>>>>>> and then migrating to a socket netcatted to /dev/null via
> >>>>>>>>>>>>>> {"execute": "migrate", "arguments": { "uri", "unix:///tmp/netcat.sock" } } :
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> QMP:    37000 Mbps
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>> So although the Pipe size improves things (in particular the
> >>>>>>>>>>>>>> large jump is for the 256K size, although 1M seems a very good value),
> >>>>>>>>>>>>>> there is still a second bottleneck in there somewhere that
> >>>>>>>>>>>>>> accounts for a loss of ~14200 Mbps in throughput.
> >>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> Interesting addition: I tested quickly on a system with faster cpus and larger VM sizes, up to 200GB,
> >>>>>>>>>>> and the difference in throughput libvirt vs qemu is basically the same ~14500 Mbps.
> >>>>>>>>>>>
> >>>>>>>>>>> ~50000 mbps qemu to netcat socket to /dev/null
> >>>>>>>>>>> ~35500 mbps virsh save to /dev/null
> >>>>>>>>>>>
> >>>>>>>>>>> Seems it is not proportional to cpu speed by the looks of it (not a totally fair comparison because the VM sizes are different).
> >>>>>>>>>>
> >>>>>>>>>> It might be closer to RAM or cache bandwidth limited though; for an extra copy.
> >>>>>>>>>
> >>>>>>>>> I was thinking about sendfile(2) in iohelper, but that probably
> >>>>>>>>> can't work as the input fd is a socket, I am getting EINVAL.
> >>>>>>>>
> >>>>>>>> Yep, sendfile() requires the input to be a mmapable FD,
> >>>>>>>> and the output to be a socket.
> >>>>>>>>
> >>>>>>>> Try splice() instead  which merely requires 1 end to be a
> >>>>>>>> pipe, and the other end can be any FD afaik.
> >>>>>>>>
> >>>>>>>
> >>>>>>> I did try splice(), but performance is worse by around 500%.
> >>>>>>
> >>>>>> Hmm, that's certainly unexpected !
> >>>>>>
> >>>>>>> Any ideas welcome,
> >>>>>>
> >>>>>> I learnt there is also a newer  copy_file_range call, not sure if that's
> >>>>>> any better.
> >>>>>>
> >>>>>> You passed len as 1 MB, I wonder if passing MAXINT is viable ? We just
> >>>>>> want to copy everything IIRC.
> >>>>>>
> >>>>>> With regards,
> >>>>>> Daniel
> >>>>>>
> >>>>>
> >>>>> Crazy idea, would trying to use the parallel migration concept for migrating to/from a file make any sense?
> >>>>>
> >>>>> Not sure if applying the qemu multifd implementation of this would apply, maybe it could be given another implementation for "toFile", trying to use more than one cpu to do the transfer?
> >>>>
> >>>> I can't see a way that would help; well, I could if you could
> >>>> somehow have multiple io helper threads that dealt with it.
> >>>
> >>> The first issue I encounter here for both the "virsh save" and "virsh restore" scenarios is that libvirt uses fd: migration, not unix: migration.
> >>> QEMU supports multifd for unix:, tcp:, vsock: as far as I can see.
> >>>
> >>> Current save procedure in QMP in short:
> >>>
> >>> {"execute":"migrate-set-capabilities", ...}
> >>> {"execute":"migrate-set-parameters", ...}
> >>> {"execute":"getfd","arguments":{"fdname":"migrate"}, ...} fd=26
> >>> QEMU_MONITOR_IO_SEND_FD: fd=26
> >>> {"execute":"migrate","arguments":{"uri":"fd:migrate"}, ...}
> >>>
> >>>
> >>> Current restore procedure in QMP in short:
> >>>
> >>> (start QEMU)
> >>> {"execute":"migrate-incoming","arguments":{"uri":"fd:21"}, ...}
> >>>
> >>>
> >>> Should I investigate changing libvirt to use unix: for save/restore?
> >>> Or should I look into changing qemu to somehow accept fd: for multifd, meaning I guess providing multiple fd: uris in the migrate command?
> >>
> >> So I'm not sure this is the right direction; i.e. if multifd is the
> >> right answer to your problem.
> > 
> > Of course, just exploring the space.
> 
> 
> I have some progress on multifd if we can call it so:
> 
> I wrote a simple program that sets up a unix socket,
> listens for N_CHANNELS + 1 connections there, sets up multifd parameters, and runs the migration,
> spawning threads for each incoming connection from QEMU, creating a file to use to store the migration data coming from qemu (optionally using O_DIRECT).
> 
> This program plays the role of a "iohelper"-like thing, basically just copying things over, making O_DIRECT possible.
> 
> I save the data streams to multiple files; this works, for the actual results though I will have to migrate to a better hardware setup (enterprise nvme + fast cpu, under various memory configurations).
> 
> The intuition would be that if we have enough cpus to spare (no libvirt in the picture as mentioned for now),
> say, the same 4 cpus already allocated for a certain VM to run, we can use those cpus (now "free" since we suspended the guest)
> to compress each multifd channel (multifd-zstd? multifd-zlib?), thus reducing the amount of stuff that needs to go to disk, making use of those cpus.

Yes possibly; you have an advantage over ormal migration, in that your
vCPUs are stopped.

> Work in progress...
> 
> > 
> >> However, I think the qemu code probably really really wants to be a
> >> socket.
> > 
> > Understood, I'll try to bend libvirt to use unix:/// and see how far I get,
> > 
> > Thanks,
> > 
> > Claudio
> > 
> >>
> >> Dave
> >>
> >>>
> >>> Thank you for your help,
> >>>
> >>> Claudio
> >>>
> > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


