Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B43ED2C2D8C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 17:57:05 +0100 (CET)
Received: from localhost ([::1]:59422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khbcm-0005dW-LV
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 11:57:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1khbOL-0002p5-Jd
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:42:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1khbOJ-0004OL-IK
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:42:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606236126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iPlNU5or96iGvFpOMNsqM5K2rpovCYabGRGU96T+E68=;
 b=cq1G76fZmdpGylMayUlqAXU1feBaMvUXv4PdJKGHD6vMfnujNG++qWKhqx7vkWJ2EdRJMl
 zA11v4VxIbGryYcBbgoKvkiTywbQMD1yHEEmx88Y/LHmBCronMGa0jyXPM+S/fNfaYxqbJ
 0JcgHygTfiRZbETJGfLHJsWRBYzJQPQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-BqKHkxQrONKyAXtgFB9X0g-1; Tue, 24 Nov 2020 11:42:04 -0500
X-MC-Unique: BqKHkxQrONKyAXtgFB9X0g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 135511007461;
 Tue, 24 Nov 2020 16:42:03 +0000 (UTC)
Received: from work-vm (ovpn-115-42.ams2.redhat.com [10.36.115.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CFDC860864;
 Tue, 24 Nov 2020 16:41:57 +0000 (UTC)
Date: Tue, 24 Nov 2020 16:41:55 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v3 0/7] UFFD write-tracking migration/snapshots
Message-ID: <20201124164155.GI3366@work-vm>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
Cc: zhang.zhanghailiang@huawei.com, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, chen.zhang@intel.com,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
> Changes with v3:
> * coding style fixes to pass checkpatch test
> * qapi/migration.json: change 'track-writes-ram' capability
> *                      supported version to 6.0
> * fixes to commit message format
> 

cc'ing in COLO people, since they could use this as well. 
> This patch series is a kind of 'rethinking' of Denis Plotnikov's ideas he's
> implemented in his series '[PATCH v0 0/4] migration: add background snapshot'.
> 
> Currently the only way to make (external) live VM snapshot is using existing
> dirty page logging migration mechanism. The main problem is that it tends to
> produce a lot of page duplicates while running VM goes on updating already
> saved pages. That leads to the fact that vmstate image size is commonly several
> times bigger then non-zero part of virtual machine's RSS. Time required to
> converge RAM migration and the size of snapshot image severely depend on the
> guest memory write rate, sometimes resulting in unacceptably long snapshot
> creation time and huge image size.
> 
> This series propose a way to solve the aforementioned problems. This is done
> by using different RAM migration mechanism based on UFFD write protection
> management introduced in v5.7 kernel. The migration strategy is to 'freeze'
> guest RAM content using write-protection and iteratively release protection
> for memory ranges that have already been saved to the migration stream.
> At the same time we read in pending UFFD write fault events and save those
> pages out-of-order with higher priority.
> 
> How to use:
> 1. Enable write-tracking migration capability
>    virsh qemu-monitor-command <domain> --hmp migrate_set_capability.
> track-writes-ram on
> 
> 2. Start the external migration to a file
>    virsh qemu-monitor-command <domain> --hmp migrate exec:'cat > ./vm_state'
> 
> 3. Wait for the migration finish and check that the migration has completed.
> state.
> 
> Andrey Gruzdev (7):
>   introduce 'track-writes-ram' migration capability
>   introduce UFFD-WP low-level interface helpers
>   support UFFD write fault processing in ram_save_iterate()
>   implementation of write-tracking migration thread
>   implementation of vm_start() BH
>   the rest of write tracking migration code
>   introduce simple linear scan rate limiting mechanism
> 
>  include/exec/memory.h |   7 +
>  migration/migration.c | 338 +++++++++++++++++++++++++++++++-
>  migration/migration.h |   4 +
>  migration/ram.c       | 439 +++++++++++++++++++++++++++++++++++++++++-
>  migration/ram.h       |   4 +
>  migration/savevm.c    |   1 -
>  migration/savevm.h    |   2 +
>  qapi/migration.json   |   7 +-
>  8 files changed, 790 insertions(+), 12 deletions(-)
> 
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


