Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F9D30F62A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:23:46 +0100 (CET)
Received: from localhost ([::1]:41232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7gTx-0007S8-NA
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:23:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7gIR-0004yU-FL
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:11:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7gIP-0006FV-CH
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:11:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612451508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TJq2x6W8JjDGKAWuEqOsNoiKHnlvzqk1GOwth6j1Bnw=;
 b=RpX4KdKObx+eUcwaoyEmLiryx5WCxy1zwZ1QFsKDYeKsgjiV0+X11XrKsYy4E8JJpba1oo
 mhuOKcjRtbqeoYWvu9BTgwQUtZm000N6QMUEspL8P7/DgjQGqO8XZHuF+dk3FtXBD+sxFU
 0oRwKawk/0qXoyxj3J9drhgbbyk9a6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-nKsTYIJPNTacbde9UUQx3Q-1; Thu, 04 Feb 2021 10:11:46 -0500
X-MC-Unique: nKsTYIJPNTacbde9UUQx3Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DD639126F
 for <qemu-devel@nongnu.org>; Thu,  4 Feb 2021 15:11:46 +0000 (UTC)
Received: from work-vm (ovpn-114-21.ams2.redhat.com [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62C675C257;
 Thu,  4 Feb 2021 15:11:32 +0000 (UTC)
Date: Thu, 4 Feb 2021 15:11:29 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, peterx@redhat.com, eblake@redhat.com,
 alex.williamson@redhat.com, laine@redhat.com
Subject: Re: [PATCH 0/2] migration blocker information
Message-ID: <20210204151129.GE24147@work-vm>
References: <20210202135522.127380-1-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210202135522.127380-1-dgilbert@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Hi,
>   This is a rework of 'migration: Provide a test for migratability',
> based on Eric's feedback this is now an addition to the existing
> info/query migrate commands rather than a new command.
> 
>   One other importovement is that we now list all the reasons for the
> block rather than just one.
> 
> Dave

Queued

> 
> Dr. David Alan Gilbert (2):
>   migration: Add blocker information
>   migration: Display the migration blockers
> 
>  migration/migration.c | 25 +++++++++++++++++++++++--
>  migration/savevm.c    | 13 +++++++++++++
>  migration/savevm.h    |  1 +
>  monitor/hmp-cmds.c    |  9 +++++++++
>  qapi/migration.json   |  6 ++++++
>  5 files changed, 52 insertions(+), 2 deletions(-)
> 
> -- 
> 2.29.2
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


