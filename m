Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8995387807
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 13:49:10 +0200 (CEST)
Received: from localhost ([::1]:46086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liyDl-0001pb-PB
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 07:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1liyBv-0000XT-B0
 for qemu-devel@nongnu.org; Tue, 18 May 2021 07:47:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1liyBt-0007nR-Mc
 for qemu-devel@nongnu.org; Tue, 18 May 2021 07:47:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621338432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z2mMOyt7bAgOCrGWOfGuvVwLNpgVok+IfbU5p2C9lfw=;
 b=WXPZ/kV6NgQIYtVEX0Of2YBvwsFuetpgOcf8nn2T8UwMlNAUBCoXLWmdg1la4MnwVviuIa
 KHypyNb3LuAnlTru9wagTnazba44JWCycZEh+Hh7fv1f/DzKgqWuwVT29aATqvxYLFgvz/
 l9az43NIxeAEv0kb+4/0aKx883P9ZS4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-SuSPjC8WPu-AFeLlqsS8cg-1; Tue, 18 May 2021 07:47:11 -0400
X-MC-Unique: SuSPjC8WPu-AFeLlqsS8cg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23C15C73A1;
 Tue, 18 May 2021 11:47:10 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-121.ams2.redhat.com
 [10.36.115.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D040319D9F;
 Tue, 18 May 2021 11:47:03 +0000 (UTC)
Subject: Re: [PATCH 11/21] block/copy-before-write: use file child instead of
 backing
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-13-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <29390f62-af03-f9a6-c349-af69578302de@redhat.com>
Date: Tue, 18 May 2021 13:47:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517064428.16223-13-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
> We are going to publish copy-before-write filter, and there no public
> backing-child-based filter in Qemu. No reason to create a precedent, so
> let's refactor copy-before-write filter instead.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/copy-before-write.c | 40 ++++++++++++++++++++++-----------------
>   1 file changed, 23 insertions(+), 17 deletions(-)
> 
> diff --git a/block/copy-before-write.c b/block/copy-before-write.c
> index af2bb97a30..2f06a524b8 100644
> --- a/block/copy-before-write.c
> +++ b/block/copy-before-write.c

[...]

> @@ -201,22 +195,34 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
>       state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
>                                         BDRV_CHILD_DATA, errp);
>       if (!state->target) {
> +        error_prepend(errp, "Cannot attach target child: ");
>           bdrv_unref(target);
>           bdrv_unref(top);
>           return NULL;
>       }
>   
> +    bdrv_ref(source);
> +    top->file = bdrv_attach_child(top, source, "file", &child_of_bds,
> +                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
> +                                  errp);
> +    if (!top->file) {
> +        error_prepend(errp, "Cannot attach file child: ");
> +        bdrv_unref(source);

Already existing in the code above, but why is the reference to @source 
dropped here?  Shouldn’t bdrv_attach_child()’s error path have done that 
already?

Max

> +        bdrv_unref(top);
> +        return NULL;
> +    }


