Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFA0320004
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 21:52:04 +0100 (CET)
Received: from localhost ([::1]:35712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDCkt-0000r1-68
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 15:52:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lDCjv-0000QD-UR
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 15:51:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lDCjs-00087C-8t
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 15:51:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613767857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9aNciGXUzu/xAmHkX7vDy52xKyx3L0nLWZyDhT7lISc=;
 b=NUpAeOaRvE+DtUOcOKpxeFLkzjDdTviuvlOp7oYPvso36g9yT7cm2niIYpaOHpHkg/XUep
 HBouM+W5VtdQ8hd/D3IV2fMBfYqVIwiKAaDN9iZDrtawfNH/fXlh60fSZaZJXufmEB8fXd
 UE905Uz3xQsoEKMNiB6YPmmrBaLsj84=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-TtMjpcUMNz62yL9nrWXn_g-1; Fri, 19 Feb 2021 15:50:55 -0500
X-MC-Unique: TtMjpcUMNz62yL9nrWXn_g-1
Received: by mail-qt1-f199.google.com with SMTP id x14so1365693qtv.1
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 12:50:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9aNciGXUzu/xAmHkX7vDy52xKyx3L0nLWZyDhT7lISc=;
 b=SF2JQ8/kNDrAHOgD1TiTAghp3+Y1JHnsQkJFcxCD1Zcgee3neAkV5+fPGjkN2yvhdn
 RTKqxClQi2i3Tmy6n7/e9Bd2/vPQKYabLfJt7XA334tckObZKfNa7k9btxNGeu2g4oGW
 fu+cVDd1nMzBB7hWgj4GK74+uBtarkf8xkUp4AiRFg+h8RK8v1I9Tle/voNp8SZIbN3I
 uTbTnccdvIm42QolYaLUy5V1x2vPPe6ZqPbiNbcMi0+i0NwKcWMaFmeavO1Hoo7597Nh
 klO148d7HlNjv+dkofUzEuyJ7cVMQ6bopuu2Q3aK6ezLVqMtdOO8NC4y4vD+6Zao9CeU
 RKlA==
X-Gm-Message-State: AOAM533zMnnjIysyOL+dAN5gzJGbgQv2ErkP2+fKvLzLOhIh1nk3p6M+
 6Oapeai4ODsfo0wzWAV5HVjA3dEi6YcPT/FkkGyvzv4JSt4a8ovrmmD33beVcrXxRdjDP6lszpv
 spSpYlqXR3tg/OwM=
X-Received: by 2002:a0c:dd93:: with SMTP id v19mr3271946qvk.40.1613767854646; 
 Fri, 19 Feb 2021 12:50:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyWXB0oSk/iL0r6O9CL2wgfbasdj2wtnHdVgVD2zXMIyg13Q0ia9aluCAXIFSz+MqdOaHed0Q==
X-Received: by 2002:a0c:dd93:: with SMTP id v19mr3271922qvk.40.1613767854370; 
 Fri, 19 Feb 2021 12:50:54 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id q6sm7045675qkd.41.2021.02.19.12.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 12:50:53 -0800 (PST)
Date: Fri, 19 Feb 2021 15:50:52 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
Message-ID: <20210219205052.GK6669@xz-x1>
References: <20210211210549.GE157159@xz-x1>
 <4E588B57-AAC8-40DD-9260-541836074DB3@redhat.com>
 <20210212030621.GF157159@xz-x1>
 <79c3ebb9-82ba-4714-0cf1-9f2e08eff660@redhat.com>
 <20210212161125.GH157159@xz-x1>
 <add5eef8-ff5b-5708-5383-f76262738e94@virtuozzo.com>
 <20210216233545.GD91264@xz-x1>
 <add9a7f7-9e02-5024-4bfd-2597a8920ec5@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <add9a7f7-9e02-5024-4bfd-2597a8920ec5@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Den Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Andrey,

On Fri, Feb 19, 2021 at 09:57:37AM +0300, Andrey Gruzdev wrote:
> For the discards that happen before snapshot is started, I need to dig into Linux and QEMU virtio-baloon
> code more to get clear with it.

Yes it's very tricky on how the error could trigger.

Let's think of below sequence:

  - Start a guest with init_on_free=1 set and also a virtio-balloon device

  - Guest frees a page P and zeroed it (since init_on_free=1). Now P contains
    all zeros.

  - Virtio-balloon reports this page to host, MADV_DONTNEED sent, then this
    page is dropped on the host.

  - Start live snapshot, wr-protect all pages (but not including page P because
    it's currently missing).  Let's call it $SNAPSHOT1.

  - Guest does alloc_page(__GFP_ZERO), accidentally fetching this page P and
    returned

  - So far, page P is still all zero (which is good!), then guest uses page P
    and writes data to it (say, now P has data P1 rather than all zeros).

  - Live snapshot saves page P, which content P1 rather than all zeros.

  - Live snapshot completed.  Saved as $SNAPSHOT1.

Then when load snapshot $SNAPSHOT1, we'll have P contains data P1.  After
snapshot loaded, when guest allocate again with alloc_page(__GFP_ZERO) on this
page P, since guest kernel "thought" this page is all-zero already so memzero()
is skipped even if __GFP_ZERO is provided.  Then this page P (with content P1)
got returned for the alloc_page(__GFP_ZERO) even if __GFP_ZERO set.  That could
break the caller of alloc_page().

> Anyhow I'm quite sure that adding global MISSING handler for snapshotting
> is too heavy and not really needed.

UFFDIO_ZEROCOPY installs a zero pfn and that should be all of it.  There'll
definitely be overhead, but it may not be that huge as imagined.  Live snapshot
is great in that we have point-in-time image of guest without stopping the
guest, so taking slightly longer time won't be a huge loss to us too.

Actually we can also think of other ways to work around it.  One way is we can
pre-fault all guest pages before wr-protect.  Note that we don't need to write
to the guest page because read would suffice, since uffd-wp would also work
with zero pfn.  It's just that this workaround won't help on saving snapshot
disk space, but it seems working.  It would be great if you have other
workarounds, maybe as you said UFFDIO_ZEROCOPY is not the only route.

Thanks,

-- 
Peter Xu


