Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CE130A34D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 09:31:45 +0100 (CET)
Received: from localhost ([::1]:45032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Uca-00010H-Q9
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 03:31:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l6Uac-00081X-D9
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 03:29:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l6Uaa-0002z2-P1
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 03:29:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612168179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nDu8lGHWni/HQvRShYJ92MWT3THU8lB7iUYvAT26UHs=;
 b=Vr/F4gpGBbaglOH2EphgbYvkxUSHwEoq/YwQGh3NXb58ZCLRO3cntZohQ+yo17TJaUFvT3
 CRA+Dgjmh6eqeAqamiclM1MEu5ZeoSSFgYyxeUKh372AceILE30/LpHersnXBtGyOAyiTv
 IylQXHU5ibqQ59y+MqSjEXQhRS5WHBQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-k0LAuXbnMyKhHBSuGv1yvQ-1; Mon, 01 Feb 2021 03:29:37 -0500
X-MC-Unique: k0LAuXbnMyKhHBSuGv1yvQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 862239CC08;
 Mon,  1 Feb 2021 08:29:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 536202C313;
 Mon,  1 Feb 2021 08:29:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D4951113865F; Mon,  1 Feb 2021 09:29:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 1/7] qemu/queue: add some useful QLIST_ and QTAILQ_ macros
References: <20210129165030.640169-1-vsementsov@virtuozzo.com>
 <20210129165030.640169-2-vsementsov@virtuozzo.com>
Date: Mon, 01 Feb 2021 09:29:34 +0100
In-Reply-To: <20210129165030.640169-2-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 29 Jan 2021 19:50:24 +0300")
Message-ID: <87v9bcfaxd.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: kwolf@redhat.com, den@openvz.org, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> Add QLIST_FOREACH_FUNC_SAFE(), QTAILQ_FOREACH_FUNC_SAFE() and
> QTAILQ_POP_HEAD(), to be used in following commit.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/qemu/queue.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/include/qemu/queue.h b/include/qemu/queue.h
> index e029e7bf66..03e1fce85f 100644
> --- a/include/qemu/queue.h
> +++ b/include/qemu/queue.h
> @@ -173,6 +173,13 @@ struct {                                                                \
>                  (var) && ((next_var) = ((var)->field.le_next), 1);      \
>                  (var) = (next_var))
>  
> +#define QLIST_FOREACH_FUNC_SAFE(head, field, func) do {                 \
> +    typeof(*QLIST_FIRST(head)) *qffs_var, *qffs_next_var;               \
> +    QLIST_FOREACH_SAFE(qffs_var, (head), field, qffs_next_var) {        \
> +        (func)(qffs_var);                                               \
> +    }                                                                   \
> +} while (/*CONSTCOND*/0)
> +
>  /*
>   * List access methods.
>   */
> @@ -490,6 +497,13 @@ union {                                                                 \
>               (var) && ((prev_var) = QTAILQ_PREV(var, field), 1);        \
>               (var) = (prev_var))
>  
> +#define QTAILQ_FOREACH_FUNC_SAFE(head, field, func) do {                \
> +    typeof(*QTAILQ_FIRST(head)) *qffs_var, *qffs_next_var;              \
> +    QTAILQ_FOREACH_SAFE(qffs_var, (head), field, qffs_next_var) {       \
> +        (func)(qffs_var);                                               \
> +    }                                                                   \
> +} while (/*CONSTCOND*/0)
> +
>  /*
>   * Tail queue access methods.
>   */

I wonder whether these are worth having.  Can you show the difference
they make in the next patch?


