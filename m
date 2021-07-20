Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DB03D01F6
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 20:54:16 +0200 (CEST)
Received: from localhost ([::1]:36076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ush-0004Wt-FY
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 14:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m5urf-0003dR-Gh
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:53:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m5urd-0008Ur-6i
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:53:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626807187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5b99ZXW6sePOq+WJKJ3/Bmk/bH5CvWBXwKGRD9PVNo4=;
 b=X6vEos9E6pVbD49PYVTG7fg5OE/zJbeq741aV3p2Oj/04RkHeciB/tqkXPojr7gY6OKdWq
 2CCql4gMOxv7LO7Fcpk4CAWrPiIhqxnu2tqYQvYLt4PgviX7Z37gMTHyjLIRS5kiqwGSDA
 P7m7Pybo+62jKQ1MKdpXSwOMP4Hvo3Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-6btsUW1qMJiT4bSYW5xIkA-1; Tue, 20 Jul 2021 14:53:04 -0400
X-MC-Unique: 6btsUW1qMJiT4bSYW5xIkA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 315A719057A0
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 18:53:04 +0000 (UTC)
Received: from redhat.com (ovpn-112-216.phx2.redhat.com [10.3.112.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AED605D6A1;
 Tue, 20 Jul 2021 18:53:03 +0000 (UTC)
Date: Tue, 20 Jul 2021 13:53:02 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 10/16] migration: Handle migration_incoming_setup()
 errors consistently
Message-ID: <20210720185302.dzekdqfpymfxasl7@redhat.com>
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-11-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210720125408.387910-11-armbru@redhat.com>
User-Agent: NeoMutt/20210205-619-921509
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 20, 2021 at 02:54:02PM +0200, Markus Armbruster wrote:
> Commit b673eab4e2 "multifd: Make multifd_load_setup() get an Error
> parameter" changed migration_incoming_setup() to take an Error **
> argument, and adjusted the callers accordingly.  It neglected to
> change adjust multifd_load_setup(): it still exit()s on error.  Clean
> that up.
> 
> The error now gets propagated up two call chains: via
> migration_fd_process_incoming() to rdma_accept_incoming_migration(),
> and via migration_ioc_process_incoming() to
> migration_channel_process_incoming().  Both chain ends report the
> error with error_report_err(), but otherwise ignore it.  Behavioral
> change: we no longer exit() on this error.
> 
> This is consistent with how we handle other errors here, e.g. from
> multifd_recv_new_channel() via migration_ioc_process_incoming() to
> migration_channel_process_incoming().  Wether it's consistently right

Whether

> or consistently wrong I can't tell.
> 
> Also clean up the return value from the unusual 0 on success, 1 on
> error to the more common true on success, false on error.
> 
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  migration/migration.c | 27 +++++++++------------------
>  1 file changed, 9 insertions(+), 18 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


