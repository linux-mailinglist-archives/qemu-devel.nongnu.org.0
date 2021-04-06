Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B47354E7E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 10:24:45 +0200 (CEST)
Received: from localhost ([::1]:42132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTh0v-0003Kw-1a
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 04:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lTgzc-0002Hg-Hm
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 04:23:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lTgzb-0000Y5-0a
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 04:23:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617697402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zGynn22vUUkjekIAr47jpmGIq2bsXZFg1R8A8ZTv7fI=;
 b=Ay3df7tmJZx7uo8SqHcI2nXTya4h/aPLKAiTgWxK3KETCi6HRg5rlvGUWznymtyYQEKwsN
 xP5hWpCUu4FOiwba4RrTClsE634ZAsHs1BT1SHyGXZOSurMaZGKYUzlySB34IlRN0RRwHO
 87ToKBXZCcFuzVmPrT6ePK673h7ISZc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-rtH3i4ZXPWGwSyV9qsZ7bQ-1; Tue, 06 Apr 2021 04:23:11 -0400
X-MC-Unique: rtH3i4ZXPWGwSyV9qsZ7bQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAC09800D53;
 Tue,  6 Apr 2021 08:23:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B80519D61;
 Tue,  6 Apr 2021 08:23:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0EEA4113865F; Tue,  6 Apr 2021 10:23:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH 2/2] block/rbd: fix memory leak in
 qemu_rbd_co_create_opts()
References: <20210329150129.121182-1-sgarzare@redhat.com>
 <20210329150129.121182-3-sgarzare@redhat.com>
Date: Tue, 06 Apr 2021 10:23:04 +0200
In-Reply-To: <20210329150129.121182-3-sgarzare@redhat.com> (Stefano
 Garzarella's message of "Mon, 29 Mar 2021 17:01:29 +0200")
Message-ID: <87eefnddp3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Florian Florensa <fflorensa@online.net>,
 Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefano Garzarella <sgarzare@redhat.com> writes:

> When we allocate 'q_namespace', we forgot to set 'has_q_namespace'
> to true. This can cause several issues, including a memory leak,
> since qapi_free_BlockdevCreateOptions() does not deallocate that
> memory, as reported by valgrind:
>
>   13 bytes in 1 blocks are definitely lost in loss record 7 of 96
>      at 0x4839809: malloc (vg_replace_malloc.c:307)
>      by 0x48CEBB8: g_malloc (in /usr/lib64/libglib-2.0.so.0.6600.8)
>      by 0x48E3FE3: g_strdup (in /usr/lib64/libglib-2.0.so.0.6600.8)
>      by 0x180010: qemu_rbd_co_create_opts (rbd.c:446)
>      by 0x1AE72C: bdrv_create_co_entry (block.c:492)
>      by 0x241902: coroutine_trampoline (coroutine-ucontext.c:173)
>      by 0x57530AF: ??? (in /usr/lib64/libc-2.32.so)
>      by 0x1FFEFFFA6F: ???
>
> Fix setting 'has_q_namespace' to true when we allocate 'q_namespace'.
>
> Fixes: 19ae9ae014 ("block/rbd: Add support for ceph namespaces")
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  block/rbd.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/block/rbd.c b/block/rbd.c
> index 24cefcd0dc..f098a89c7b 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -444,6 +444,7 @@ static int coroutine_fn qemu_rbd_co_create_opts(BlockDriver *drv,
>      loc->user        = g_strdup(qdict_get_try_str(options, "user"));
>      loc->has_user    = !!loc->user;
>      loc->q_namespace = g_strdup(qdict_get_try_str(options, "namespace"));
> +    loc->has_q_namespace = !!loc->q_namespace;
>      loc->image       = g_strdup(qdict_get_try_str(options, "image"));
>      keypairs         = qdict_get_try_str(options, "=keyvalue-pairs");

Reviewed-by: Markus Armbruster <armbru@redhat.com>


