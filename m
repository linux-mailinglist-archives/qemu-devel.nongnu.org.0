Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3100F2C68FF
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:56:07 +0100 (CET)
Received: from localhost ([::1]:37556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kig6Q-000634-8P
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:56:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kifwY-0005cp-FN
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 10:45:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kifwW-0007IV-M0
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 10:45:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606491951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BDk4KGU12fM9Yex3trs/5DdgC/wMMJyJXqR3QcmFLnk=;
 b=YPah0EqeA81pugDQ51LeaiyI9lQVMgNrQKDnLLNh/e9w/Vh+cj75uMO5aIEj49xWsfNyC+
 j6OEvu3/rtiqUYySLpExarRLryZiCvkfCojMtToNRij2p/JIneNGArX9iia75r47cIuZdl
 wyCN1qw+69I9gOLOotYpLNYCQfa/C3k=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-1jdHcLmuNH-TnXtOv0EnlA-1; Fri, 27 Nov 2020 10:45:49 -0500
X-MC-Unique: 1jdHcLmuNH-TnXtOv0EnlA-1
Received: by mail-qt1-f198.google.com with SMTP id v9so3474294qtw.12
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 07:45:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BDk4KGU12fM9Yex3trs/5DdgC/wMMJyJXqR3QcmFLnk=;
 b=NeY5NKMuwE3GvRXgBU3vHWG2r8sxzjBw1PXr4MdPhDNe+jT9oinbZZvhV77eQKl1mV
 dJV/pgt1WEiqOKprXaB1CxpqEZagtmSi4wRmA0ej0LgFjuvvdPV1ME0SgoDGvj+2lQTx
 S6d4HCUJr7NL9CLwZIWRZCfQcg0kCY7T6fTYVQgaJR2tx4zhNEMzQBKmbhAJYkp5It6x
 kflqgLkc7MRqu1p9UDJ3kiWkAUQOb/nq94ajFEq1/nHCYPOxJiIj8RZINV5pmLaqoKTh
 FuN2MywpMLKlF3+GkcSk97OVGlbqPEq//WX8hFnKhdy1ouxZXm93ajOT18c+MTzlX22S
 75gg==
X-Gm-Message-State: AOAM532xTFwMdU3yQ/nzMiiF46Ysiv18XYd9O9DmVbHzqFO8DLxZgqTs
 xjVFY96sjbOa8MYpZq1KWHQhXz/Ue2MK9HHi8/fejnJ0ukenQhVUMMMBFnAwKE38A2ETPYw+rTi
 0q41/67EOv9008KE=
X-Received: by 2002:a05:6214:58d:: with SMTP id
 bx13mr8493711qvb.44.1606491949449; 
 Fri, 27 Nov 2020 07:45:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0WzShylZBd/JKTkmqy/dk2epPSf7EMKq4DoUQJxRh3C5HE8rQbDLPDS2/2EIBDvmAwX6SOA==
X-Received: by 2002:a05:6214:58d:: with SMTP id
 bx13mr8493696qvb.44.1606491949193; 
 Fri, 27 Nov 2020 07:45:49 -0800 (PST)
Received: from xz-x1 ([142.126.81.247])
 by smtp.gmail.com with ESMTPSA id q123sm6237294qke.28.2020.11.27.07.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 07:45:48 -0800 (PST)
Date: Fri, 27 Nov 2020 10:45:46 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v4 0/6] UFFD write-tracking migration/snapshots
Message-ID: <20201127154546.GC6573@xz-x1>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201126154751.GH2366@angien.pipo.sk>
 <673bec91-31cb-5533-b223-8725948e2189@virtuozzo.com>
 <20201127094911.GI2366@angien.pipo.sk>
 <23cbb153-9260-3357-04ba-94da7da8c0d2@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <23cbb153-9260-3357-04ba-94da7da8c0d2@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Krempa <pkrempa@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 27, 2020 at 01:00:48PM +0300, Andrey Gruzdev wrote:
> On 27.11.2020 12:49, Peter Krempa wrote:
> > On Fri, Nov 27, 2020 at 11:21:39 +0300, Andrey Gruzdev wrote:
> > > On 26.11.2020 18:47, Peter Krempa wrote:
> > > > On Thu, Nov 26, 2020 at 18:17:28 +0300, Andrey Gruzdev via wrote:
> > > > > This patch series is a kind of 'rethinking' of Denis Plotnikov's ideas he's
> > > > > implemented in his series '[PATCH v0 0/4] migration: add background snapshot'.
> > > > > 
> > > > > Currently the only way to make (external) live VM snapshot is using existing
> > > > > dirty page logging migration mechanism. The main problem is that it tends to
> > > > > produce a lot of page duplicates while running VM goes on updating already
> > > > > saved pages. That leads to the fact that vmstate image size is commonly several
> > > > > times bigger then non-zero part of virtual machine's RSS. Time required to
> > > > > converge RAM migration and the size of snapshot image severely depend on the
> > > > > guest memory write rate, sometimes resulting in unacceptably long snapshot
> > > > > creation time and huge image size.
> > > > > 
> > > > > This series propose a way to solve the aforementioned problems. This is done
> > > > > by using different RAM migration mechanism based on UFFD write protection
> > > > > management introduced in v5.7 kernel. The migration strategy is to 'freeze'
> > > > > guest RAM content using write-protection and iteratively release protection
> > > > > for memory ranges that have already been saved to the migration stream.
> > > > > At the same time we read in pending UFFD write fault events and save those
> > > > > pages out-of-order with higher priority.
> > > > 
> > > > This sounds amazing! Based on your description I assume that the final
> > > > memory image contains state image from the beginning of the migration.
> > > > 
> > > > This would make it desirable for the 'migrate' qmp command to be used as
> > > > part of a 'transaction' qmp command so that we can do an instant disk
> > > > and memory snapshot without any extraneous pausing of the VM.
> > > > 
> > > > I'll have a look at using this mechanism in libvirt natively.
> > > > 
> > > 
> > > Correct, the final image contains state at the beginning of migration.
> > > 
> > > So far, if I'm not missing something about libvirt, for external snapshot
> > > creation it performs a sequence like that:
> > > migrate(fd)->transaction(blockdev-snapshot-all)->cont.
> > > 
> > > So, in case 'background-snapshot' capability is enabled, the sequence would
> > > change to:
> > > stop->transaction(blockdev-snapshot-all)->migrate(fd).
> > > With background snapshot migration it will finish with VM running so there's
> > > not need to 'cont' here.
> > 
> > Yes, that's correct.
> > 
> > The reason I've suggested that 'migrate' being part of a 'transaction'
> > is that it would remove the need to stop it for the disk snapshot part.
> > 
> 
> Hmm, I believe stopping VM for a short time is unavoidable to keep saved
> device state consistent with blockdev snapshot base.. May be I've missed
> something but it seems logical.

I guess PeterK meant an explicit stop vm command, rather than the stop in this
series that should be undetectable from the guest.  It would be definitely
great if PeterK could quickly follow up with this on libvirt. :)

One overall comment (before go into details) is that please remember to start
using "migration: " prefixes in patch subjects from the next version.

Thanks,

-- 
Peter Xu


