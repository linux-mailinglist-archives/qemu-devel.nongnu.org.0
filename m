Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED071313B0B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 18:37:25 +0100 (CET)
Received: from localhost ([::1]:35980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ATU-0000xb-Um
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 12:37:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94Gm-0002Hw-3q
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 05:59:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94GV-0001pk-SD
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 05:59:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612781974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mb9snAn/xcduVdRN+Q2ylcojHAmzKps4kfLjg/8hWW8=;
 b=PPxkAmjGQrCi9SWVRnYSd7Z9cuuPx1oro16eKzcKvi5/ppl6oJI83/L8PWBukAC+9TNMPY
 zduSwJSL89hjjDviKnHnhhRflTgvYHOVGCNmQYZaF3/fsnuhFI3NOHLClK3JeRh9c4EhsR
 CDMJZZyqwrkNblftrPrVk5K2WlgKK9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-YOTtCalnOBux0Q4gRub_cA-1; Mon, 08 Feb 2021 05:59:33 -0500
X-MC-Unique: YOTtCalnOBux0Q4gRub_cA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED567801965;
 Mon,  8 Feb 2021 10:59:31 +0000 (UTC)
Received: from work-vm (ovpn-115-22.ams2.redhat.com [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7224101E245;
 Mon,  8 Feb 2021 10:59:30 +0000 (UTC)
Date: Mon, 8 Feb 2021 10:59:27 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: [PATCH] migration: only check page size match if RAM postcopy is
 enabled
Message-ID: <20210208105927.GA28440@work-vm>
References: <20210204163522.13291-1-s.reiter@proxmox.com>
MIME-Version: 1.0
In-Reply-To: <20210204163522.13291-1-s.reiter@proxmox.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Reiter (s.reiter@proxmox.com) wrote:
> Postcopy may also be advised for dirty-bitmap migration only, in which
> case the remote page size will not be available and we'll instead read
> bogus data, blocking migration with a mismatch error if the VM uses
> hugepages.
> 
> Fixes: 58110f0acb ("migration: split common postcopy out of ram postcopy")
> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>

Queued

> ---
>  migration/ram.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 7811cde643..6ace15261c 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -3521,7 +3521,7 @@ static int ram_load_precopy(QEMUFile *f)
>                          }
>                      }
>                      /* For postcopy we need to check hugepage sizes match */
> -                    if (postcopy_advised &&
> +                    if (postcopy_advised && migrate_postcopy_ram() &&
>                          block->page_size != qemu_host_page_size) {
>                          uint64_t remote_page_size = qemu_get_be64(f);
>                          if (remote_page_size != block->page_size) {
> -- 
> 2.20.1
> 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


