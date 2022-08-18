Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E7D598C39
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 20:56:43 +0200 (CEST)
Received: from localhost ([::1]:37126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOkh8-0002Vc-Il
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 14:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oOkaI-0004Lf-FH
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 14:49:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oOkaE-0001BQ-4s
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 14:49:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660848573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X1woe6ElVCZojSO8yaLa1JAZYpjYzltwXXwdX4om/xY=;
 b=VChIgs3zeCZt7oXMnM7pMkjRIUV4agaG+6PFKZt10fdACFVk+ei9McicCXF0zX/Q9dOnCM
 N4lPSYaw0VIEMRJyiGYCQKkrOPnVRhi3PlhSxGE2CECS9cNe+zr30oRzLJ73UdBZxdXcDl
 mL/au/n10Th+LufVPAyXZhg/QCOXM9U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-307-MODiduWbPvawmFd4pIRSEA-1; Thu, 18 Aug 2022 14:49:31 -0400
X-MC-Unique: MODiduWbPvawmFd4pIRSEA-1
Received: by mail-wm1-f69.google.com with SMTP id
 j36-20020a05600c1c2400b003a540d88677so1324847wms.1
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 11:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc;
 bh=X1woe6ElVCZojSO8yaLa1JAZYpjYzltwXXwdX4om/xY=;
 b=lNtUlm+f8xDjGAxWomIli+NA7ktcM/djrlGwGy3cUzMA6wpalKoLI8QuaCuKp7D8Hb
 fth6JuWutib23JJfe6UE2uC3/xJ+cH52dwjobWpJijapEe+qF9KzaVd4qrfuIpGCqw+q
 AKQMOzx9ZOYwaYgsPE/K4MYxK4xIdr71fIPzDQsIL9n7OWtzF4iXOwDCR7XjFV8wlyGx
 E0kvzsqR/ZI7FfDuCyVQFD9W42BQVc01tt8WjGy9rqR10N6JSa+TV2UaHfknW7t4iDG6
 QrRYwElwA5ILmLE3s2oJ68f6dIjSKUrWEkarRk+sN2MTQWWcOotwGFolJPU0dwhWFSM2
 hXaw==
X-Gm-Message-State: ACgBeo1luxBmB2UY/J5OzLtvOGpJcooAEv1iWuIYlKgFtHHaguWCfGoc
 OvukbV0Cyr6fMySsTj7hcwIztt08ofTXrI0fLZvnZaE/CnqKbsvPBvGM9kt3kJGhoC2o2NJ8kbZ
 lE1sp3cvauYzyVhs=
X-Received: by 2002:a05:600c:1f11:b0:3a5:3df9:4859 with SMTP id
 bd17-20020a05600c1f1100b003a53df94859mr5735289wmb.175.1660848570506; 
 Thu, 18 Aug 2022 11:49:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR46+15iyIY0NltVzoyXUje36n3HtryThfeb+RmUXKOomVsVIgEwR4iMsWjJc8Wj4t3sNkCnRg==
X-Received: by 2002:a05:600c:1f11:b0:3a5:3df9:4859 with SMTP id
 bd17-20020a05600c1f1100b003a53df94859mr5735271wmb.175.1660848570255; 
 Thu, 18 Aug 2022 11:49:30 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 r5-20020a05600c35c500b003a5b6086381sm6538351wmq.48.2022.08.18.11.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 11:49:29 -0700 (PDT)
Date: Thu, 18 Aug 2022 19:49:27 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Nikolay Borisov <nborisov@suse.com>, berrange@redhat.com,
 qemu-devel@nongnu.org, Claudio Fontana <Claudio.Fontana@suse.com>,
 Jim Fehlig <jfehlig@suse.com>, quintela@redhat.com
Subject: Re: towards a workable O_DIRECT outmigration to a file
Message-ID: <Yv6Jt65jKNGyokFZ@work-vm>
References: <b727f0da-8051-2ce5-b1ab-a57452d2b0c3@suse.com>
 <6f8a6a33-5a68-0eeb-d278-9397b1fd0015@suse.com>
 <Yv4ys6e0kK/2BMFk@work-vm>
 <f1aa569d-e70f-1b7d-7e10-d6615cfafd7d@suse.de>
 <Yv5pcSfuLajkZSsb@work-vm>
 <4c984c87-d8c4-0af5-0619-9509a23f916c@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c984c87-d8c4-0af5-0619-9509a23f916c@suse.de>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Claudio Fontana (cfontana@suse.de) wrote:
> On 8/18/22 18:31, Dr. David Alan Gilbert wrote:
> > * Claudio Fontana (cfontana@suse.de) wrote:
> >> On 8/18/22 14:38, Dr. David Alan Gilbert wrote:
> >>> * Nikolay Borisov (nborisov@suse.com) wrote:
> >>>> [adding Juan and David to cc as I had missed them. ]
> >>>
> >>> Hi Nikolay,
> >>>
> >>>> On 11.08.22 г. 16:47 ч., Nikolay Borisov wrote:
> >>>>> Hello,
> >>>>>
> >>>>> I'm currently looking into implementing a 'file:' uri for migration save
> >>>>> in qemu. Ideally the solution will be O_DIRECT compatible. I'm aware of
> >>>>> the branch https://gitlab.com/berrange/qemu/-/tree/mig-file. In the
> >>>>> process of brainstorming how a solution would like the a couple of
> >>>>> questions transpired that I think warrant wider discussion in the
> >>>>> community.
> >>>
> >>> OK, so this seems to be a continuation with Claudio and Daniel and co as
> >>> of a few months back.  I'd definitely be leaving libvirt sides of the
> >>> question here to Dan, and so that also means definitely looking at that
> >>> tree above.
> >>
> >> Hi Dave, yes, Nikolai is trying to continue on the qemu side.
> >>
> >> We have something working with libvirt for our short term needs which offers good performance,
> >> but it is clear that that simple solution is barred for upstream libvirt merging.
> >>
> >>
> >>>
> >>>>> First, implementing a solution which is self-contained within qemu would
> >>>>> be easy enough( famous last words) but the gist is one  has to only care
> >>>>> about the format within qemu. However, I'm being told that what libvirt
> >>>>> does is prepend its own custom header to the resulting saved file, then
> >>>>> slipstreams the migration stream from qemu. Now with the solution that I
> >>>>> envision I intend to keep all write-related logic inside qemu, this
> >>>>> means there's no way to incorporate the logic of libvirt. The reason I'd
> >>>>> like to keep the write process within qemu is to avoid an extra copy of
> >>>>> data between the two processes (qemu outging migration and libvirt),
> >>>>> with the current fd approach qemu is passed an fd, data is copied
> >>>>> between qemu/libvirt and finally the libvirt_iohelper writes the data.
> >>>>> So the question which remains to be answered is how would libvirt make
> >>>>> use of this new functionality in qemu? I was thinking something along
> >>>>> the lines of :
> >>>>>
> >>>>> 1. Qemu writes its migration stream to a file, ideally on a filesystem
> >>>>> which supports reflink - xfs/btrfs
> >>>>>
> >>>>> 2. Libvirt writes it's header to a separate file
> >>>>> 2.1 Reflinks the qemu's stream right after its header
> >>>>> 2.2 Writes its trailer
> >>>>>
> >>>>> 3. Unlink() qemu's file, now only libvirt's file remains on-disk.
> >>>>>
> >>>>> I wouldn't call this solution hacky though it definitely leaves some
> >>>>> bitter aftertaste.
> >>>
> >>> Wouldn't it be simpler to tell libvirt to write it's header, then tell
> >>> qemu to append everything?
> >>
> >> I would think so as well. 
> >>
> >>>
> >>>>> Another solution would be to extend the 'fd:' protocol to allow multiple
> >>>>> descriptors (for multifd) support to be passed in. The reason dup()
> >>>>> can't be used is because in order for multifd to be supported it's
> >>>>> required to be able to write to multiple, non-overlapping regions of the
> >>>>> file. And duplicated fd's share their offsets etc. But that really seems
> >>>>> more or less hacky. Alternatively it's possible that pwrite() are used
> >>>>> to write to non-overlapping regions in the file. Any feedback is
> >>>>> welcomed.
> >>>
> >>> I do like the idea of letting fd: take multiple fd's.
> >>
> >> Fine in my view, I think we will still need then a helper process in libvirt to merge the data into a single file, no?
> >> In case the libvirt multifd to single file multithreaded helper I proposed before is helpful as a reference you could reuse/modify those patches.
> > 
> > Eww that's messy isn't it.
> > (You don't fancy a huge sparse file do you?)
> 
> Wait am I missing something obvious here?
> 
> Maybe we don't need any libvirt extra process.
> 
> why don't we open the _single_ file multiple times from libvirt,
> 
> Lets say the "main channel" fd is opened, we write the libvirt header,
> then reopen again the same file multiple times,
> and finally pass all fds to qemu, one fd for each parallel transfer channel we want to use
> (so we solve all the permissions, security labels issues etc).
> 
> And then from QEMU we can write to those fds at the right offsets for each separate channel,
> which is easier from QEMU because we can know exactly how much data we need to transfer before starting the migration,
> so we have even less need for "holes", possibly only minor ones for single byte adjustments
> for uneven division of the interleaved file.
> 
> What is wrong with this one, or does anyone see some other better approach?

You'd have to know exactly how to space the channels position in the
file, unless you somehow controlled it; the allocation across the
multifd threads is load/scheduler/random I think, so you'd have to
assume the worst case of everything going to one thread.
I.e. a big sparse area and then something to tell you where they are.

Dave

> Thanks,
> 
> C
> 
> > 
> >> Maybe this new way will be acceptable to libvirt,
> >> ie avoiding the multifd code -> socket, but still merging the data from the multiple fds into a single file?
> > 
> > It feels to me like the problem here is really what we want is something
> > closer to a dump than the migration code; you don't need all that
> > overhead of the code to deal with live migration bitmaps and dirty pages
> > that aren't going to happen.
> > Something that just does a nice single write(2) (for each memory
> > region);
> > and then ties the device state on.
> > 
> > Dave
> > 
> >>>
> >>> Dave
> >>>
> >>
> >> Thanks for your comments,
> >>
> >> Claudio
> >>>>>
> >>>>>
> >>>>> Regards,
> >>>>> Nikolay
> >>>>
> >>
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


