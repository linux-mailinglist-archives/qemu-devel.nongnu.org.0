Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7252E478970
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 12:06:25 +0100 (CET)
Received: from localhost ([::1]:55396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myB4C-0008CG-CQ
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 06:06:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1myB2s-0006ww-Fm
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 06:05:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1myB2m-0007QY-Lw
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 06:04:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639739092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fqezuOokYDwQ00bxfXxEFNZ+lmDoVr7dL71JT0ONSJU=;
 b=G6WHPqGi1tXKedRuu0g77nMc8/M53Pn8hBPv7rIbmXCVb4zwUrs2yxqg89P/NKEW/VNl+h
 MwXT/inZFO5PJ59eD+RrV9yn0PaplUpsEqoSPZyfv3JUDYpsKAgzoCLI9BJV+OQOb4tUiY
 Qc6vYSwrqAYrM6kxeQadb8Pl7pvBvyE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-smmNMxzoMsuOSyBLfFszwQ-1; Fri, 17 Dec 2021 06:04:51 -0500
X-MC-Unique: smmNMxzoMsuOSyBLfFszwQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 c16-20020adfa310000000b001a2349890e1so510420wrb.0
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 03:04:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fqezuOokYDwQ00bxfXxEFNZ+lmDoVr7dL71JT0ONSJU=;
 b=g/xkkuTBbMWy4VSCkOZfUV86jhN4wMJLHE3MYGnrCXoMjv4AEbWUY6bvDTg01vi5jm
 8FQk3+guYcoe4FvOPSmZTTVhieev/xnF4b8a07V3spUJZXmERyOn2oTHbi7WdLAeAr8l
 k/zv5b7BdzJb5QKRu2bJxvWaecuYuw/gsA7nthlmqVtosCqv/lAS2/VL2tCooip9xb7H
 BYd69RmP3tKGM1kuTCmHkVnkWb/ySg4LFiMwlkeUtRLV7oL4LBB7rwEhohch0yno32z/
 nHTPp/PYM6xstEQqrxhfChdiAWPaue1yhlzd/FmpZTRWJwUg4ynobLKOGSOZ8zT6hzMa
 BDug==
X-Gm-Message-State: AOAM530Ek+kW5pPGY6dTlmd74Dql/5jFLnh9IcYVHd6rjZWXSV31GynV
 Ilo/gBYHURRT2b8/QgWtQm2EF3F8CtU6Jjt1ZfCyAJRymFecO0RHhriPAb9/S3i12mkTNANAAdw
 ntIwNznXUI+9hlzg=
X-Received: by 2002:a5d:6b81:: with SMTP id n1mr2116558wrx.56.1639739090705;
 Fri, 17 Dec 2021 03:04:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8fjM/nZYNzXwbeDYZXDK/9hF3/49pu1JYoZIMurOiYngzZdwa4kRbNr8sx7qzYezvBIfktw==
X-Received: by 2002:a5d:6b81:: with SMTP id n1mr2116510wrx.56.1639739090277;
 Fri, 17 Dec 2021 03:04:50 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id u15sm5920200wmq.13.2021.12.17.03.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 03:04:50 -0800 (PST)
Message-ID: <56deaef1-6a4e-c544-9916-42a20cc20c7a@redhat.com>
Date: Fri, 17 Dec 2021 12:04:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 28/31] block.c: assert BQL lock held in
 bdrv_co_invalidate_cache
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211124064418.3120601-1-eesposit@redhat.com>
 <20211124064418.3120601-29-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211124064418.3120601-29-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.11.21 07:44, Emanuele Giuseppe Esposito wrote:
> bdrv_co_invalidate_cache is special: it is an I/O function,

I still don’t believe it is, but well.

(Yes, it is called by a test in an iothread, but I believe we’ve seen 
that the tests simply sometimes test things that shouldn’t be allowed.)

> but uses the block layer permission API, which is GS.
>
> Because of this, we can assert that either the function is
> being called with BQL held, and thus can use the permission API,
> or make sure that the permission API is not used, by ensuring that
> bs (and parents) .open_flags does not contain BDRV_O_INACTIVE.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>
> diff --git a/block.c b/block.c
> index a0309f827d..805974676b 100644
> --- a/block.c
> +++ b/block.c
> @@ -6574,6 +6574,26 @@ void bdrv_init_with_whitelist(void)
>       bdrv_init();
>   }
>   
> +static bool bdrv_is_active(BlockDriverState *bs)
> +{
> +    BdrvChild *parent;
> +
> +    if (bs->open_flags & BDRV_O_INACTIVE) {
> +        return false;
> +    }
> +
> +    QLIST_FOREACH(parent, &bs->parents, next_parent) {
> +        if (parent->klass->parent_is_bds) {
> +            BlockDriverState *parent_bs = parent->opaque;

This looks like a really bad hack to me.  We purposefully have made the 
parent link opaque so that a BDS cannot easily reach its parents.  All 
accesses should go through BdrvChildClass methods.

I also don’t understand why we need to query parents at all.  The only 
fact that determines whether the current BDS will have its permissions 
changed is whether the BDS itself is active or inactive.  Sure, we’ll 
invoke bdrv_co_invalidate_cache() on the parents, too, but then we could 
simply let the assertion fail there.

> +            if (!bdrv_is_active(parent_bs)) {
> +                return false;
> +            }
> +        }
> +    }
> +
> +   return true;
> +}
> +
>   int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
>   {
>       BdrvChild *child, *parent;
> @@ -6585,6 +6605,12 @@ int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
>           return -ENOMEDIUM;
>       }
>   
> +    /*
> +     * No need to muck with permissions if bs is active.
> +     * TODO: should activation be a separate function?
> +     */
> +    assert(qemu_in_main_thread() || bdrv_is_active(bs));
> +

I don’t understand this, really.  It looks to me like “if you don’t call 
this in the main thread, this better be a no-op”, i.e., you must never 
call this function in an I/O thread if you really want to use it.  I.e. 
what I’d classify as a GS function.

It sounds like this is just a special case for said test, and 
special-casing code for tests sounds like a bad idea.

Hanna

>       QLIST_FOREACH(child, &bs->children, next) {
>           bdrv_co_invalidate_cache(child->bs, &local_err);
>           if (local_err) {


