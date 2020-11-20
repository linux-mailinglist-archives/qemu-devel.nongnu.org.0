Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E5C2BAECF
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 16:25:08 +0100 (CET)
Received: from localhost ([::1]:41392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg8Hb-0008NP-IC
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 10:25:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kg8Fn-0006aa-VW
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:23:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kg8Fl-0002Mt-1q
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:23:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605885791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UZuN7s5MSFm34vkwG62vDVBsNiD1CGr4NBaoqqfSjJ8=;
 b=EbS7LZX4m+EqRmF9IXTEnoXFv8r1DPQTSpgJjVutM5mCQYh2rdKbx5pGqUfnj/C5kfKRRN
 +EvCfxR23CUqnUeTiwa7SJTA9QySbd+Qkwc7YTYlaAg9PaxQibuRagMqUT6pSR2iGyU/d6
 Z0sF33Yplj1bS/LDx1X2a7Q1zMUYDQ4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-vJDppERUP2CBKmRE4yAcAQ-1; Fri, 20 Nov 2020 10:23:08 -0500
X-MC-Unique: vJDppERUP2CBKmRE4yAcAQ-1
Received: by mail-qt1-f199.google.com with SMTP id i20so7622974qtr.0
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 07:23:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UZuN7s5MSFm34vkwG62vDVBsNiD1CGr4NBaoqqfSjJ8=;
 b=YiBwEoMwXbyQuHAl/GpZ/kjkNI6yN6kImDThoPS02nw+k/wndtE8Lj3eTHXEUeHO6/
 z2upf/nSaKFlv80OiSDlKHp2jzHazBoczg5IPm+a9nt8YjHE+ptz41HMH26LjTdX7/uA
 Gf/4bf6WO3xQbGqIf2HiTxXV0PULDlAh8cXjVM+G2zw5BTZYxb2w5gmjxgB3iNjzrCVi
 3Q9J2Q43oeZjdSpXBCMWovpNc6QqFIlt46pmmFNH3cq5TqqpXxy4p2ztMkX+SvZSb93e
 EKVKFUigjbDN4P072b1c0NGgFPzoSv3OJJ4mb0PkD/uGuC2hqZGHOYjKtneCYjwlfjJN
 biUg==
X-Gm-Message-State: AOAM530VqzzWwNfaiA5dwgVl2YZCquoyBGqjLx9h+BLmNk9DeVjpKPM/
 4GRoEvkykl14pSc78iTR5T6Y9Tnu+u3Q5RM26DX7idNptN7ZvgT9lUizhTqyE+Wpydf8VAW7WE/
 WEZRLCFLEpbGpZkM=
X-Received: by 2002:ad4:5685:: with SMTP id bc5mr17143549qvb.48.1605885788082; 
 Fri, 20 Nov 2020 07:23:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyafMfAX5w8zWpV6FK/2N8AYDw5AEqotcPN5ONohgYRgn/Vdx1xHyY9L9LOutPD5yKBG8Gd+w==
X-Received: by 2002:ad4:5685:: with SMTP id bc5mr17143528qvb.48.1605885787846; 
 Fri, 20 Nov 2020 07:23:07 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-196.dsl.bell.ca. [174.93.89.196])
 by smtp.gmail.com with ESMTPSA id o16sm2293182qkg.27.2020.11.20.07.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 07:23:07 -0800 (PST)
Date: Fri, 20 Nov 2020 10:23:05 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v3 7/7] introduce simple linear scan rate limiting
 mechanism
Message-ID: <20201120152305.GF32525@xz-x1>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
 <20201119125940.20017-8-andrey.gruzdev@virtuozzo.com>
 <20201119200250.GH6538@xz-x1>
 <3f245bae-654f-5a5f-d243-f3f577639678@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <3f245bae-654f-5a5f-d243-f3f577639678@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URG_BIZ=0.573 autolearn=no autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 20, 2020 at 03:06:56PM +0300, Andrey Gruzdev wrote:
> On 19.11.2020 23:02, Peter Xu wrote:
> > On Thu, Nov 19, 2020 at 03:59:40PM +0300, Andrey Gruzdev wrote:
> > > Since reading UFFD events and saving paged data are performed
> > > from the same thread, write fault latencies are sensitive to
> > > migration stream stalls. Limiting total page saving rate is a
> > > method to reduce amount of noticiable fault resolution latencies.
> > > 
> > > Migration bandwidth limiting is achieved via noticing cases of
> > > out-of-threshold write fault latencies and temporarily disabling
> > > (strictly speaking, severely throttling) saving non-faulting pages.
> > 
> > Just curious: have you measured aver/max latency of wr-protected page requests,
> > or better, even its distribution?
> > 
> > I believe it should also be relevant to where the snapshot is stored, say, the
> > backend disk of your tests.  Is that a file on some fs?
> > 
> > I would expect the latency should be still good if e.g. the throughput of the
> > backend file system is decent even without a patch like this, but I might have
> > missed something..
> > 
> > In all cases, it would be very nice if this patch can have the histogram or
> > aver or max latency measured and compared before/after this patch applied.
> > 
> > Thanks,
> > 
> So far I have no objective latency measurements, that really interesting.
> For testing I commonly used SATA HDD, not too fresh one, 1.5TB Seagate
> 7200.11 series, specially not to have large hardware cache or flash buffer.
> And yes, backend is a file on ext4.
> 
> I tried mostly with 'migrate exec:streamdump_utility', a very simple tool
> which writes stream to a file. It even doesn't use AIO - so reads from STDIN
> and file writes don't overlap. Made so intentionally to reduce throughput
> and give some random high-latency writes.
> 
> I think snapshotting performance may be severely degraded by I/O happening
> in parallel on the same storage media, that's the problem we need to
> consider.

Yeah this is a good point.  So ideally I think here we have similar requirement
with postcopy in that we really want the postcopy request stream to be separate
from the main migration stream, just like what we'd probably prefer here too
when vcpus writting to wr-protected pages, rather than missing ones.  So that
the urgent requests got handled faster than the background task.

For postcopy, we may still have some chance if someday we can separate the
migration channels, so that we can try to provide a standalone channel for
postcopy requests.  For example if tcp based, that can be a separate socket.
Then we can try to tune the priority of these sockets to make sure postcopy
stream were sent earlier.

So I guess it's not always easy to seperate these two channels - in your case
if the disk must be shared, seems not easy.  Maybe we can prioritize disk I/Os
somehow too just like tcp channels?  Not sure.  Hmm, it would be good if
QEMUFile could provide some mechanism to prioritize IOs as a common interface,
but that's probably too far beyond our discussion. :)

> 
> And yes, to take latency histogram before/after the patch is nice idea!
> Also I need to make stream dumping tool with AIO, to test with full storage
> throughput.

Yeah I would appreciate if you can provide those.

Note that I think it can even be some work after the functionality got merged
(Dave/Juan could correct me), because it can be some work on top.  Having them
together would be even nicer, of course.  Your call.  It's already much better
than stopping the whole vm, imho.

Thanks,

-- 
Peter Xu


