Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF0A613855
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:47:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opV7v-0007DX-41; Mon, 31 Oct 2022 09:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1opV7c-0006yc-HQ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:46:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1opV7Z-0006rx-8h
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:46:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667223992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+78H1RTv6mzQKqO2Uv6i6RLX5on7MLfuTa5sU4ShRiI=;
 b=jJh7SHUZOGsYeHuiPrnZigCnqUvW6zwR9vDGZj86AyCotZjzvMDgRdfsXFirdXM+A7hYXV
 sh7zcoSZSN8q2z9OMaRZFoy9kFpPKaUMWSeQgv2ifSRHzTx8wVDwRVnHqWqKTb348q2316
 2BUjbFqHwPlXmNtaIj5/WKrU6Ri3Pdk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-nWgAYXymMXmdnlYZ-SM68g-1; Mon, 31 Oct 2022 09:46:28 -0400
X-MC-Unique: nWgAYXymMXmdnlYZ-SM68g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F9E9887405;
 Mon, 31 Oct 2022 13:46:28 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CD9DC1908A;
 Mon, 31 Oct 2022 13:46:27 +0000 (UTC)
Date: Mon, 31 Oct 2022 08:46:25 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Subject: Re: [PATCH v2] nbd/client: Use smarter assert
Message-ID: <20221031134625.ulx6yf5dkju4lyvi@redhat.com>
References: <20221017191207.1255807-1-eblake@redhat.com>
 <fae5e95a-ab8c-3471-dfdb-a959cc7aa1bd@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fae5e95a-ab8c-3471-dfdb-a959cc7aa1bd@yandex-team.ru>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 24, 2022 at 02:59:48PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> On 10/17/22 22:12, Eric Blake wrote:
> > Assigning strlen() to a uint32_t and then asserting that it isn't too
> > large doesn't catch the case of an input string 4G in length.
> > Thankfully, the incoming strings can never be that large: if the
> > export name or query is reflecting a string the client got from the
> > server, we already guarantee that we dropped the NBD connection if the
> > server sent more than 32M in a single reply to our NBD_OPT_* request;
> > if the export name is coming from qemu, nbd_receive_negotiate()
> > asserted that strlen(info->name) <= NBD_MAX_STRING_SIZE; and
> > similarly, a query string via x->dirty_bitmap coming from the user was
> > bounds-checked in either qemu-nbd or by the limitations of QMP.
> > Still, it doesn't hurt to be more explicit in how we write our
> > assertions to not have to analyze whether inadvertent wraparound is
> > possible.
> > 
> > Fixes: 93676c88 ("nbd: Don't send oversize strings", v4.2.0)
> > Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Signed-off-by: Eric Blake <eblake@redhat.com>
> > ---
> > 
> > v2: update subject line and commit message to reflect file being
> > touched; adjust a second nearby assertion with the same issue
> > 
> >   nbd/client.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/nbd/client.c b/nbd/client.c
> > index 30d5383cb1..90a6b7b38b 100644
> > --- a/nbd/client.c
> > +++ b/nbd/client.c
> > @@ -658,11 +658,11 @@ static int nbd_send_meta_query(QIOChannel *ioc, uint32_t opt,
> >       char *p;
> > 
> >       data_len = sizeof(export_len) + export_len + sizeof(queries);
> > -    assert(export_len <= NBD_MAX_STRING_SIZE);
> > +    assert(strlen(export) <= NBD_MAX_STRING_SIZE);
> >       if (query) {
> >           query_len = strlen(query);
> >           data_len += sizeof(query_len) + query_len;
> > -        assert(query_len <= NBD_MAX_STRING_SIZE);
> > +        assert(strlen(query) <= NBD_MAX_STRING_SIZE);
> >       } else {
> >           assert(opt == NBD_OPT_LIST_META_CONTEXT);
> >       }
> 
> I'm a bit late, and this should work as is.
> 
> Still, for me it's a bit strange: you point to the fact that we probably overflow uint32_t variable. But we keep this fact hidden in the code. So, everyone who read should guess "aha, this extra strlen here is because the previous one may overflow the variable)".
> 
> Could we use strnlen() instead of strlen()? That would be also more effective.

Good idea.  As in:

assert(strnlen(query, NBD_MAX_STRING_SIZE + 1) <= NBD_MAX_STRING_SIZE);

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


