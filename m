Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1456016E9
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:07:23 +0200 (CEST)
Received: from localhost ([::1]:55596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okVSM-0008IM-3h
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1okVPT-0006bb-GH
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 15:04:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1okVPP-0000Cs-Nk
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 15:04:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666033458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lS4q53bcBM9KTzQ7jXX2hQYDlrnGtFzUm52D7xGgmVA=;
 b=S9V2jJdD0/FWDiVVebUC7fMdn9fxEDFKfExKcchyLgFf6tV4iDcYPVwjIyogEh7OM//UPL
 BN11FLnRfbqkVy7RCe/6GlfIESlBZe9YH38GeJtUwdWfXwECykzVjL/fw4DBaTQ3YU6JTu
 bUg5FgG2YqpOHi1e8pCPAgzJ+JQx+nc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-EVzPy8_iOzGBnjwP7WK9lw-1; Mon, 17 Oct 2022 15:04:16 -0400
X-MC-Unique: EVzPy8_iOzGBnjwP7WK9lw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D59CD1012440;
 Mon, 17 Oct 2022 19:04:15 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DCA82414A815;
 Mon, 17 Oct 2022 19:04:07 +0000 (UTC)
Date: Mon, 17 Oct 2022 14:04:05 -0500
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Subject: Re: [PATCH] nbd/server: Use smarter assert
Message-ID: <20221017190405.p5wlw44czdufmwro@redhat.com>
References: <20221017173727.1246179-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221017173727.1246179-1-eblake@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Given the file touched by this patch[1],

The subject should use 'nbd/client:'

On Mon, Oct 17, 2022 at 12:37:27PM -0500, Eric Blake wrote:
> Assigning strlen() to a uint32_t and then asserting that it isn't too
> large doesn't catch the case of an input string 4G in length.
> Thankfully, the incoming string can never be that large: if the export
> name is reflecting what the client asked about, we already guarantee

and this should be 'is reflecting a name provided by the server'...

> that we drop the NBD connection if the client tries to send more than
> 32M in a single NBD_OPT_* request; and if the export name is coming

...'if the server tries to send more than 32M in a reply to a single
NBD_OPT_* request from the client'

> from qemu, nbd_receive_negotiate() asserted that strlen(info->name) <=
> NBD_MAX_STRING_SIZE.  Still, it doesn't hurt to be more explicit in
> how we write our assertion that we are aware that no wraparound is
> possible.
> 
> Fixes: 93676c88 ("nbd: Don't send oversize strings", v4.2.0)
> Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  nbd/client.c | 2 +-

[1] this patch is to the client, not the server.

>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/nbd/client.c b/nbd/client.c
> index 60c9f4941a..b601ee97e5 100644
> --- a/nbd/client.c
> +++ b/nbd/client.c
> @@ -658,7 +658,7 @@ static int nbd_send_meta_query(QIOChannel *ioc, uint32_t opt,
>      char *p;
> 
>      data_len = sizeof(export_len) + export_len + sizeof(queries);
> -    assert(export_len <= NBD_MAX_STRING_SIZE);
> +    assert(strlen(export) <= NBD_MAX_STRING_SIZE);
>      if (query) {
>          query_len = strlen(query);
>          data_len += sizeof(query_len) + query_len;

           assert(query_len <= NBD_MAX_STRING_SIZE);

and this assertion on query_len could use the same treatment (similar
analysis as to why callers are never passing in a 4G string, but it
doesn't hurt to be explicit in the assertion).  v2 coming up.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


