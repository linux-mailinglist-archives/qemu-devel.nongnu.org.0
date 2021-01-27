Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9C3305DA7
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 14:57:50 +0100 (CET)
Received: from localhost ([::1]:44308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4lKO-0006k0-Q2
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 08:57:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l4lJT-0006JO-6n
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 08:56:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l4lJP-0002fQ-Cm
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 08:56:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611755805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sBAQSpzgqgWEo2B5E7mf9hxc4xZnfBPIGiLyouSefKs=;
 b=T1SgLfku2z0NRy+mqnqXdRG+gPW4dHkDGK5YRgCEPiwiB41v+bm5WGk8w+j7/mzNxI1LE2
 /QzuRI9w3YtPgCkwr8dy6OxdlI4O0/NJp1uMB9kgxz22TpMrCRZOOA+pwhk+VZxGYHkyPb
 8GEwLNPaMjYgUvMYfuvlJ1stt1OKCOw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-rQMLnEKpO6ermRAbTzqUVw-1; Wed, 27 Jan 2021 08:56:43 -0500
X-MC-Unique: rQMLnEKpO6ermRAbTzqUVw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24243801AA3
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 13:56:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6BF510074E2;
 Wed, 27 Jan 2021 13:56:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 669D3113865F; Wed, 27 Jan 2021 14:56:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 3/6] qapi: Simplify full_name_nth() in
 qobject-input-visitor
References: <20201112172850.401925-1-kwolf@redhat.com>
 <20201112172850.401925-4-kwolf@redhat.com>
Date: Wed, 27 Jan 2021 14:56:40 +0100
In-Reply-To: <20201112172850.401925-4-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 12 Nov 2020 18:28:47 +0100")
Message-ID: <87ft2mpjon.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Instead of counting how many elements from the top of the stack we need
> to ignore until we find the thing we're interested in, we can just
> directly pass the StackObject pointer because all callers already know
> it.
>
> We only need a different way now to tell if we want to know the name of
> something contained in the given StackObject or of the StackObject
> itself. Passing name = NULL is the obvious way to request the latter.
>
> This simplifies the interface and makes it easier to use in cases where
> we have the StackObject, but don't know how many steps down the stack it
> is.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  qapi/qobject-input-visitor.c | 38 ++++++++++++++++++------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
> index a00ac32682..1415561828 100644
> --- a/qapi/qobject-input-visitor.c
> +++ b/qapi/qobject-input-visitor.c
> @@ -87,20 +87,16 @@ static QObjectInputVisitor *to_qiv(Visitor *v)
>  }
>  
>  /*
> - * Find the full name of something @qiv is currently visiting.
> - * @qiv is visiting something named @name in the stack of containers
> - * @qiv->stack.
> - * If @n is zero, return its full name.
> - * If @n is positive, return the full name of the @n-th container
> - * counting from the top.  The stack of containers must have at least
> - * @n elements.
> - * The returned string is valid until the next full_name_nth(@v) or
> - * destruction of @v.
> + * Find the full name of something named @name in @so which @qiv is
> + * currently visiting.  If @name is NULL, find the full name of @so
> + * itself.
> + *
> + * The returned string is valid until the next full_name_so(@qiv) or
> + * destruction of @qiv.

How can this distinguish between a list and its member?

Before the patch:

* list member: n = 0, name = NULL
* list: n = 1, name = NULL

Afterwards?

Checking... yes, regression.  Test case:

    {"execute": "blockdev-add", "arguments": {"driver": "file", "node-name": "blk0", "filename": "tmp.img"}}
    {"return": {}}
    {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "node-name": "blk1", "image": "blk0", "take-child-perms": [0]}}
    {"error": {"class": "GenericError", "desc": "Invalid parameter type for 'take-child-perms', expected: string"}}

The second command's reply changes from

    {"error": {"class": "GenericError", "desc": "Invalid parameter type for 'take-child-perms[0]', expected: string"}}

to

    {"error": {"class": "GenericError", "desc": "Invalid parameter type for 'take-child-perms', expected: string"}}

The idea of using @so instead of @n may be salvagable.

[...]


