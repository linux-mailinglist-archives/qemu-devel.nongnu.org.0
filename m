Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9824EEBDC
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 12:53:01 +0200 (CEST)
Received: from localhost ([::1]:51180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naEtl-0000oT-N8
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 06:52:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1naErk-0007uP-53
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 06:50:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1naErh-0004zo-0x
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 06:50:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648810247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=urrfcC011xZdZa5B/AMuEwSf3ZTwH5OgGLo7NZp2/sE=;
 b=Guq5NdW5m8BfOKB3XHBTQlszTRpqWlizvgkvgREQZXm/4KLyqiMEfqSv73wFumRZN2FL4/
 4u5k5Unt4uK7ARkjYtfpQHpqj5V4tDJ3vig0Pcelw/FB/aVRQ/ZcMfYUeb4/ZdNrgVYnxi
 gblDt7+QpoUfW/CF6b38RmgrZ8NUgNE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-bUsCB3x9PqCW-INkMquZBQ-1; Fri, 01 Apr 2022 06:50:46 -0400
X-MC-Unique: bUsCB3x9PqCW-INkMquZBQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 z22-20020a50cd16000000b0041960ea8555so1328760edi.2
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 03:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=urrfcC011xZdZa5B/AMuEwSf3ZTwH5OgGLo7NZp2/sE=;
 b=CQ3YTe5i29bi6HPHfLM1G25Rs55BDfuwXnWWGe/fI3QW22VBfBl5Mj1ceTcjhg4wTZ
 j/rrCt73RvWWVgfPb5uPKFKxkPvvOzimcNVWc5EBC2xA38dGXy3jZH1aPaGj1J0/6W2f
 AVC0T1GgrDs/u5+nt9LZ4V4K0F2b4dS4DfdFFDMQMvToOgkkO5k8f9E3vbHrcsA3h8xE
 uyOnz2FvK+hpv194N0mO72EtaOoSnE/J1Z5TlGVnTnuZdLhJs3bMsvE7IEUj2ZxCDELe
 hMREeSwyrrU73tlpW838gTI13f33ToXlO7Sme2wf1vJQfhd61ozDOa7rIRHnHjc6rBHe
 3Avw==
X-Gm-Message-State: AOAM531+XffChmcZsI/AbSlkPO50rXCaCUdyhtW90l2O8msNx/tYF4pv
 JBd5a5fJTIcjK8chz6HHhmcHUs1lXF1OUZuEUhMPKRhUXESLYDWGi20bKcA0noFFzRCXO1womib
 igGyQMsCTmJR+mBA=
X-Received: by 2002:a50:f10e:0:b0:41b:71c4:d57 with SMTP id
 w14-20020a50f10e000000b0041b71c40d57mr10463329edl.254.1648810245281; 
 Fri, 01 Apr 2022 03:50:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpJS1u6qyQXx1MCWw3B9DKa4mWFUcLshzaaLtpbnMSUcslJ2Z/IskRrAFCrnAz3J0b3kStjw==
X-Received: by 2002:a50:f10e:0:b0:41b:71c4:d57 with SMTP id
 w14-20020a50f10e000000b0041b71c40d57mr10463314edl.254.1648810245022; 
 Fri, 01 Apr 2022 03:50:45 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a509d02000000b00412d53177a6sm1075579ede.20.2022.04.01.03.50.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 03:50:44 -0700 (PDT)
Message-ID: <0d068a71-3af7-8873-9bc6-e8cac73b4d25@redhat.com>
Date: Fri, 1 Apr 2022 12:50:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/7] block/copy-before-write: refactor option parsing
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
References: <20220401091920.287612-1-vsementsov@openvz.org>
 <20220401091920.287612-2-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220401091920.287612-2-vsementsov@openvz.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, vsementsov@openvz.org,
 stefanha@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.04.22 11:19, Vladimir Sementsov-Ogievskiy wrote:
> We are going to add one more option of enum type. Let's refactor option
> parsing so that we can simply work with BlockdevOptionsCbw object.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   block/copy-before-write.c | 68 +++++++++++++++++++++++----------------
>   1 file changed, 41 insertions(+), 27 deletions(-)
>
> diff --git a/block/copy-before-write.c b/block/copy-before-write.c
> index a8a06fdc09..394e73b094 100644
> --- a/block/copy-before-write.c
> +++ b/block/copy-before-write.c
> @@ -24,6 +24,7 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qapi/qmp/qjson.h"
>   
>   #include "sysemu/block-backend.h"
>   #include "qemu/cutils.h"
> @@ -328,46 +329,49 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
>       }
>   }
>   
> -static bool cbw_parse_bitmap_option(QDict *options, BdrvDirtyBitmap **bitmap,
> -                                    Error **errp)
> +static BlockdevOptionsCbw *cbw_parse_options(QDict *options, Error **errp)
>   {
> -    QDict *bitmap_qdict = NULL;
> -    BlockDirtyBitmap *bmp_param = NULL;
> +    QDict *cbw_qdict = NULL;
> +    BlockdevOptionsCbw *opts = NULL;
>       Visitor *v = NULL;
> -    bool ret = false;
>   
> -    *bitmap = NULL;
> +    cbw_qdict = qdict_clone_shallow(options);
>   
> -    qdict_extract_subqdict(options, &bitmap_qdict, "bitmap.");
> -    if (!qdict_size(bitmap_qdict)) {
> -        ret = true;
> -        goto out;
> -    }
> -
> -    v = qobject_input_visitor_new_flat_confused(bitmap_qdict, errp);
> +    /*
> +     * Delete BlockdevOptions base fields, that are not part of
> +     * BlockdevOptionsCbw.
> +     */
> +    qdict_del(cbw_qdict, "driver");
> +    qdict_del(cbw_qdict, "node-name");
> +    qdict_del(cbw_qdict, "discard");
> +    qdict_del(cbw_qdict, "cache");
> +    qdict_extract_subqdict(cbw_qdict, NULL, "cache.");
> +    qdict_del(cbw_qdict, "read-only");
> +    qdict_del(cbw_qdict, "auto-read-only");
> +    qdict_del(cbw_qdict, "force-share");
> +    qdict_del(cbw_qdict, "detect-zeroes");

Works in practice now, but seems a bit fragile.  If new fields are added 
to the base class, this will break.  (And I don’t know whether people 
will think of updating this when new fields are added to the base class.)

Would there be a problem if instead we parsed the full BlockdevOptions 
object here, asserting that .driver is BLOCKDEV_DRIVER_COPY_BEFORE_WRITE?

> +
> +    v = qobject_input_visitor_new_flat_confused(cbw_qdict, errp);
>       if (!v) {
>           goto out;
>       }
>   
> -    visit_type_BlockDirtyBitmap(v, NULL, &bmp_param, errp);
> -    if (!bmp_param) {
> -        goto out;
> -    }
> -
> -    *bitmap = block_dirty_bitmap_lookup(bmp_param->node, bmp_param->name, NULL,
> -                                        errp);
> -    if (!*bitmap) {
> +    visit_type_BlockdevOptionsCbw(v, NULL, &opts, errp);
> +    if (!opts) {
>           goto out;
>       }


