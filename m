Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0A23559CF
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 18:57:28 +0200 (CEST)
Received: from localhost ([::1]:58326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTp15-0005mh-Dl
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 12:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lToxH-0004F8-6z
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 12:53:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lToxE-00073Q-G8
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 12:53:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617728007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tE9zbfZheWcTh5pk8F1swqMCUkkQhqosZ5nWaJsM8UQ=;
 b=SPbg3kw6uH2THK5Bz6x+ODkkwrtX+x48cV8X2cQpgAq25km1eaTEeMvL13Uc7Z5XPN84ed
 ErgZX9jZt0X8PwBN8tifA9lZ+ewMm2bWhiOKCpdkkSgcgvngvq3EBQfKwfB0EyJhiXHe4B
 tBwsWQ/ojd4qw0nknGT3Wx58L4caVxY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-0NdXntmlO4a0AlHWdyrkVQ-1; Tue, 06 Apr 2021 12:53:25 -0400
X-MC-Unique: 0NdXntmlO4a0AlHWdyrkVQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A848E190D34A;
 Tue,  6 Apr 2021 16:53:24 +0000 (UTC)
Received: from work-vm (ovpn-114-244.ams2.redhat.com [10.36.114.244])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE79E10016F4;
 Tue,  6 Apr 2021 16:53:22 +0000 (UTC)
Date: Tue, 6 Apr 2021 17:53:20 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH for-6.0 v1 0/4] migration: Fixes to the
 'background-snapshot' code
Message-ID: <YGySAFr2uWyiI5pe@work-vm>
References: <20210401092226.102804-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210401092226.102804-1-andrey.gruzdev@virtuozzo.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
> Changes v0->v1:
>  * Fixes to coding style and commit messages
>  * Renamed 'bs' to 'block' in migration/ram.c background snapshot code
> 
> This patch series contains:
>  * Fix to the issue with occasionally truncated non-iterable device state
>  * Solution to compatibility issues with virtio-balloon device
>  * Fix to the issue when discarded or never populated pages miss UFFD
>    write protection and get into migration stream in dirty state
>  * Renaming of 'bs' to commonly used 'block' in migration/ram.c background
>    snapshot code
> 
> Andrey Gruzdev (4):
>   migration: Fix missing qemu_fflush() on buffer file in
>     bg_migration_thread
>   migration: Inhibit virtio-balloon for the duration of background
>     snapshot
>   migration: Pre-fault memory before starting background snasphot
>   migration: Rename 'bs' to 'block' in background snapshot code
> 
>  hw/virtio/virtio-balloon.c |   8 ++-
>  include/migration/misc.h   |   2 +
>  migration/migration.c      |  22 ++++++-
>  migration/ram.c            | 119 ++++++++++++++++++++++++++-----------
>  migration/ram.h            |   1 +
>  5 files changed, 115 insertions(+), 37 deletions(-)

Queued

> -- 
> 2.27.0
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


