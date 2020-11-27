Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C25DC2C6D1A
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 23:05:55 +0100 (CET)
Received: from localhost ([::1]:44516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kilsI-0005Yb-C5
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 17:05:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kilqt-00055T-KT
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 17:04:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kilqp-0008Ek-Sx
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 17:04:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606514661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RTcND+vD749D4IQJIyGSbsV7gpTbBKkDQN1Xv4yEI/c=;
 b=YdiZvarny1DbMzgD9BRkMMAFyivBoCIvKwpN3UDsdzKoyFFPaAxb6paGIiXXjf7pOqwVfu
 qX3aLyRG9eF/18gEEmvR4wR63bYAnt/T7z1KxA80IbTF8Ime5p/N1fCtJu4jfOE+cU7ScS
 X6S8SZheYPtjxD5PaVjmDEd5ei2qzMg=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-9l0i1qVZNRi8Qo14z1vnRg-1; Fri, 27 Nov 2020 17:04:19 -0500
X-MC-Unique: 9l0i1qVZNRi8Qo14z1vnRg-1
Received: by mail-qt1-f198.google.com with SMTP id d9so3937175qtr.5
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 14:04:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RTcND+vD749D4IQJIyGSbsV7gpTbBKkDQN1Xv4yEI/c=;
 b=eRP7yljdN0lQonZNWaKzKlP/IpHuAYx/FaTWRk0GV/DjOKY0BCa55BalIzmZK4fNbm
 spXoXPjbBMRlYw6DJp4blO5hldoZwG7JWkMiQQcxgTmhopdZ9fVmtKfOTj0xnhBJedsq
 KazNd0ubTTvosTb44NJWOdPauTszA2ZPDjHg4/7/9wLxX7Dk51A6GUDsLExuIvm6DaCn
 2zpa4p04vclDU1ZUgGV7wW6izebhN5OavCR10iNmjzqtWkdPRbrVsNPmuFR0gAWvFsJ/
 rKjFSe5LZ/IQ2/MMKOl70fyMfHE7CvXfcPy5+YrG+lvx76rfaCDPNcAHdanec7QR+x/j
 kZBA==
X-Gm-Message-State: AOAM5308tbrTFvjbIVTj85BCnuC89OaijUbwNZv3tEYxnNAu2dVODLHy
 HQV/70JOkLpTbgPaYBJVEAJGXIVW8SmZzh1JwKYzELi2UyMNe4PCgijaBahjcZuOyFQaOyzLv4g
 zNCliw05M30wCUi8=
X-Received: by 2002:ac8:787:: with SMTP id l7mr10484999qth.137.1606514659206; 
 Fri, 27 Nov 2020 14:04:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxNdQAPGuYBBaXlTpiDvMlOTVWkgfiogWa9NlaM9PCej6SIm+s1lensBywuwQ+AWvRF1ZyrQ==
X-Received: by 2002:ac8:787:: with SMTP id l7mr10484975qth.137.1606514659004; 
 Fri, 27 Nov 2020 14:04:19 -0800 (PST)
Received: from xz-x1 ([142.126.81.247])
 by smtp.gmail.com with ESMTPSA id 131sm7464244qkg.69.2020.11.27.14.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 14:04:18 -0800 (PST)
Date: Fri, 27 Nov 2020 17:04:16 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v4 0/6] UFFD write-tracking migration/snapshots
Message-ID: <20201127220416.GH6573@xz-x1>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 26, 2020 at 06:17:28PM +0300, Andrey Gruzdev wrote:
> Changes v3->v4:
> 
> * 1. Renamed migrate capability 'track-writes-ram'->'background-snapshot'.
> * 2. Use array of incompatible caps to replace bulky 'if' constructs.
> * 3. Moved UFFD low-level code to the separate module ('util/userfaultfd.c').
> * 4. Always do UFFD wr-unprotect on cleanup; just closing file descriptor
> *    won't cleanup PTEs anyhow, it will release registration ranges, wait 
> *    queues etc. but won't cleanup process MM context on MMU level.
> * 5. Allow to enable 'background-snapshot' capability on Linux-only hosts.
> * 6. Put UFFD code usage under '#ifdef CONFIG_LINUX' prerequisite.
> * 7. Removed 'wt_' from RAMState struct.
> * 8. Refactored ram_find_and_save_block() to make more clean - poll UFFD
> *    wr-fault events in get_queued_page(), use ram_save_host_page_pre(),
> *    ram_save_host_page_post() notifiers around ram_save_host_page()
> *    instead of bulky inline write-unprotect code.

One thing I mentioned previously but it seems still got lost is that we don't
need dirty tracking for live snapshot.

A few pointers for reference:

  memory_global_dirty_log_start()
  migration_bitmap_sync_precopy()
  memory_region_clear_dirty_bitmap()
  ...

These should not be needed.  But this can also be done on top.

Thanks,

-- 
Peter Xu


