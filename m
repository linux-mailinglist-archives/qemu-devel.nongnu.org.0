Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B83402066
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 21:30:08 +0200 (CEST)
Received: from localhost ([::1]:37820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNKJi-0007ht-Or
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 15:30:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNKIL-0006Sd-UV
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 15:28:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNKII-0007ph-Vm
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 15:28:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630956518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VqYDdaGP8uDCzKXdu2BfE62F1lj1bE4RW8puB0vjg+4=;
 b=C7Os4rxKV9WFo2ghaSx/2Cbl2U/g7sZuzfiZ4wVzfHnanAPzxAvrrMKlRwTfPUMw/J+8rv
 mheosxll9dMDhm4S8Ppdd4xO45EZxQZbTjSGncSSYc+9TQN4w57Aoep/x3mAy2EEK6WghJ
 hXH376CZ5gfYtzY4VwIv5DgYTYsY/iw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-Y0hGk_k6MtmU6xgWb1A50w-1; Mon, 06 Sep 2021 15:28:36 -0400
X-MC-Unique: Y0hGk_k6MtmU6xgWb1A50w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2BE68145E5;
 Mon,  6 Sep 2021 19:28:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38B825C23A;
 Mon,  6 Sep 2021 19:28:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AA2791138606; Mon,  6 Sep 2021 21:28:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 2/9] qapi: make blockdev-add a coroutine command
References: <20210906190654.183421-1-vsementsov@virtuozzo.com>
 <20210906190654.183421-3-vsementsov@virtuozzo.com>
Date: Mon, 06 Sep 2021 21:28:32 +0200
In-Reply-To: <20210906190654.183421-3-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Mon, 6 Sep 2021 22:06:47 +0300")
Message-ID: <87tuixa4gv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 hreitz@redhat.com, den@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> We are going to support nbd reconnect on open in a next commit. This
> means that we want to do several connection attempts during some time.
> And this should be done in a coroutine, otherwise we'll stuck.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  qapi/block-core.json | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 06674c25c9..6e4042530a 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -4219,7 +4219,8 @@
>  # <- { "return": {} }
>  #
>  ##
> -{ 'command': 'blockdev-add', 'data': 'BlockdevOptions', 'boxed': true }
> +{ 'command': 'blockdev-add', 'data': 'BlockdevOptions', 'boxed': true,
> +  'coroutine': true }
>  
>  ##
>  # @blockdev-reopen:

Why is this safe?

Prior discusson:
Message-ID: <87lfq0yp9v.fsf@dusky.pond.sub.org>
https://lists.gnu.org/archive/html/qemu-devel/2020-01/msg04921.html


