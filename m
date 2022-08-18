Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE225988F4
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 18:34:15 +0200 (CEST)
Received: from localhost ([::1]:40726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOiTG-0007yf-Fs
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 12:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oOiR2-0006RW-52
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 12:31:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oOiQy-0001bq-AQ
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 12:31:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660840311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kGpSxfEj9iAcworcdF49HdEro/fi8Bzi14CP45NmT0M=;
 b=G1s5YGdspVBkR852pRXbDnaCzavIkQaSFv9+ebQ0lyHFm+MtnwVSNAesuuYflDiiIVHhKA
 kJvSjBTcqebbwuq39SGXhDNYToydbJny03Xbe57Xfe8isqbHMAi/nbmJO7VgECX+1HSeVz
 yRcQwY4Ck9uyQBzM0p8iVgCSoykRV2s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-228-fqdxSUbVN-OOBj2g7QH_-Q-1; Thu, 18 Aug 2022 12:31:49 -0400
X-MC-Unique: fqdxSUbVN-OOBj2g7QH_-Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 t12-20020adfa2cc000000b00224f577fad1so297734wra.4
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 09:31:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc;
 bh=kGpSxfEj9iAcworcdF49HdEro/fi8Bzi14CP45NmT0M=;
 b=Fd9bxePPXRmlglfBBBAOOdRIhd1zdcy2qW2gLwJ/PpB8x8/T1g6hbxktB9vdeseRh3
 42nQ4lvoWapdcg6qi4rhFoUeTLeysaKLmKqRnlEXdcCQFONE5mZUK4jk5mqzX+KJk998
 hoKqH11gqsH0FqOGxm8YFFeKkBeLX6ZKbP9gtkdJ2fCaVmE7T+b/3gDflCwTtHmcSWAm
 2Z29O0Hlc2Mdemu6BjC4QW3DbYkR5Oa9erF4NQ7Mbge2oiTCVYlRmOjyi1lEmhzNxVPP
 XyIGSFsWV93O4LERuiQc/1vXtfZVm8C1L8VPhrnOWYF+ZL+mBnF7OYrWlEyBo7ETbIjt
 qsMA==
X-Gm-Message-State: ACgBeo12Oq7xu8S6bhoFwspLJMpUGeZnd6MZTiw9+bYqfj+NGgnIWP1r
 MWRcIf5zDMkSagPpXhOHvp1cPQfEYkvhOyoJWEcnJ2V44GhQqCM4jt5on9m4U8GPtoucN8kFwnz
 S9xaMOjbBGywfIC0=
X-Received: by 2002:a5d:6d0f:0:b0:225:273b:d0a2 with SMTP id
 e15-20020a5d6d0f000000b00225273bd0a2mr1977027wrq.668.1660840308656; 
 Thu, 18 Aug 2022 09:31:48 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4Qor5sRuIm1MWHe6fbxHUeSxreRUiAgEj9Fa3LV10cuV6785w2nS4VQZU4dvAaeKnHsHwK6w==
X-Received: by 2002:a5d:6d0f:0:b0:225:273b:d0a2 with SMTP id
 e15-20020a5d6d0f000000b00225273bd0a2mr1977008wrq.668.1660840308350; 
 Thu, 18 Aug 2022 09:31:48 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 n16-20020a05600c3b9000b003a608d69a64sm6201014wms.21.2022.08.18.09.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 09:31:47 -0700 (PDT)
Date: Thu, 18 Aug 2022 17:31:45 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Nikolay Borisov <nborisov@suse.com>, berrange@redhat.com,
 qemu-devel@nongnu.org, Claudio Fontana <Claudio.Fontana@suse.com>,
 Jim Fehlig <jfehlig@suse.com>, quintela@redhat.com
Subject: Re: towards a workable O_DIRECT outmigration to a file
Message-ID: <Yv5pcSfuLajkZSsb@work-vm>
References: <b727f0da-8051-2ce5-b1ab-a57452d2b0c3@suse.com>
 <6f8a6a33-5a68-0eeb-d278-9397b1fd0015@suse.com>
 <Yv4ys6e0kK/2BMFk@work-vm>
 <f1aa569d-e70f-1b7d-7e10-d6615cfafd7d@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1aa569d-e70f-1b7d-7e10-d6615cfafd7d@suse.de>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> On 8/18/22 14:38, Dr. David Alan Gilbert wrote:
> > * Nikolay Borisov (nborisov@suse.com) wrote:
> >> [adding Juan and David to cc as I had missed them. ]
> > 
> > Hi Nikolay,
> > 
> >> On 11.08.22 г. 16:47 ч., Nikolay Borisov wrote:
> >>> Hello,
> >>>
> >>> I'm currently looking into implementing a 'file:' uri for migration save
> >>> in qemu. Ideally the solution will be O_DIRECT compatible. I'm aware of
> >>> the branch https://gitlab.com/berrange/qemu/-/tree/mig-file. In the
> >>> process of brainstorming how a solution would like the a couple of
> >>> questions transpired that I think warrant wider discussion in the
> >>> community.
> > 
> > OK, so this seems to be a continuation with Claudio and Daniel and co as
> > of a few months back.  I'd definitely be leaving libvirt sides of the
> > question here to Dan, and so that also means definitely looking at that
> > tree above.
> 
> Hi Dave, yes, Nikolai is trying to continue on the qemu side.
> 
> We have something working with libvirt for our short term needs which offers good performance,
> but it is clear that that simple solution is barred for upstream libvirt merging.
> 
> 
> > 
> >>> First, implementing a solution which is self-contained within qemu would
> >>> be easy enough( famous last words) but the gist is one  has to only care
> >>> about the format within qemu. However, I'm being told that what libvirt
> >>> does is prepend its own custom header to the resulting saved file, then
> >>> slipstreams the migration stream from qemu. Now with the solution that I
> >>> envision I intend to keep all write-related logic inside qemu, this
> >>> means there's no way to incorporate the logic of libvirt. The reason I'd
> >>> like to keep the write process within qemu is to avoid an extra copy of
> >>> data between the two processes (qemu outging migration and libvirt),
> >>> with the current fd approach qemu is passed an fd, data is copied
> >>> between qemu/libvirt and finally the libvirt_iohelper writes the data.
> >>> So the question which remains to be answered is how would libvirt make
> >>> use of this new functionality in qemu? I was thinking something along
> >>> the lines of :
> >>>
> >>> 1. Qemu writes its migration stream to a file, ideally on a filesystem
> >>> which supports reflink - xfs/btrfs
> >>>
> >>> 2. Libvirt writes it's header to a separate file
> >>> 2.1 Reflinks the qemu's stream right after its header
> >>> 2.2 Writes its trailer
> >>>
> >>> 3. Unlink() qemu's file, now only libvirt's file remains on-disk.
> >>>
> >>> I wouldn't call this solution hacky though it definitely leaves some
> >>> bitter aftertaste.
> > 
> > Wouldn't it be simpler to tell libvirt to write it's header, then tell
> > qemu to append everything?
> 
> I would think so as well. 
> 
> > 
> >>> Another solution would be to extend the 'fd:' protocol to allow multiple
> >>> descriptors (for multifd) support to be passed in. The reason dup()
> >>> can't be used is because in order for multifd to be supported it's
> >>> required to be able to write to multiple, non-overlapping regions of the
> >>> file. And duplicated fd's share their offsets etc. But that really seems
> >>> more or less hacky. Alternatively it's possible that pwrite() are used
> >>> to write to non-overlapping regions in the file. Any feedback is
> >>> welcomed.
> > 
> > I do like the idea of letting fd: take multiple fd's.
> 
> Fine in my view, I think we will still need then a helper process in libvirt to merge the data into a single file, no?
> In case the libvirt multifd to single file multithreaded helper I proposed before is helpful as a reference you could reuse/modify those patches.

Eww that's messy isn't it.
(You don't fancy a huge sparse file do you?)

> Maybe this new way will be acceptable to libvirt,
> ie avoiding the multifd code -> socket, but still merging the data from the multiple fds into a single file?

It feels to me like the problem here is really what we want is something
closer to a dump than the migration code; you don't need all that
overhead of the code to deal with live migration bitmaps and dirty pages
that aren't going to happen.
Something that just does a nice single write(2) (for each memory
region);
and then ties the device state on.

Dave

> > 
> > Dave
> > 
> 
> Thanks for your comments,
> 
> Claudio
> >>>
> >>>
> >>> Regards,
> >>> Nikolay
> >>
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


