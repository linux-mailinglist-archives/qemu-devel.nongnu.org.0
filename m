Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AA6553063
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 13:05:56 +0200 (CEST)
Received: from localhost ([::1]:54214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3bhi-0007Ub-Qx
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 07:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o3bgB-00068w-9q
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 07:04:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o3bg8-0003Ez-CZ
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 07:04:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655809455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R2SebNImI0bEq43q812MxGBfvv39lfB/tpX1Tzxxu5U=;
 b=FrosGe0EaEX55lzw6r8Jwt8GOEl8vplZjELbjBY7Yoblm5Gj7GsJuAJzeekJUgIeyOkl3Q
 Lh9AJ7i6jw+1sYQh85y7ENqLXZ1+vH8Y6PP/URJf+LaxPo3ALz8f356FZlb+YY1NHWurtT
 z2lW3lhfI1CIJSMLpbv2DIGKg4QfK/8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-pfJUC_2zPgy4LD37ET0-1Q-1; Tue, 21 Jun 2022 07:04:14 -0400
X-MC-Unique: pfJUC_2zPgy4LD37ET0-1Q-1
Received: by mail-ej1-f71.google.com with SMTP id
 fp4-20020a1709069e0400b00711911cecf9so4620781ejc.3
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 04:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=R2SebNImI0bEq43q812MxGBfvv39lfB/tpX1Tzxxu5U=;
 b=giVWKfpj5GK1Cer7df9wOPa8//hfKHL+YOfF0MJc0yMnMEPTGckxlgwL0Vb2NXOnte
 K44dMBcbmIUhBSECTlU6RPwuR/ukmDD75AVguANmZTf471bG4iRB/ahbnfLeJLfnfOBd
 ZrCUW3yYRYShIn/LBa/xiVTcsVDh90Z3QmpjZ8p0KF3oRP8swGbpAbmdatF1xB3EFq0V
 mjRq66YgO7ilO2RahpqJI0eaGJAl7h8w1TWwCo0hIWSgDVv3R6SoHfGlasQ/civA+/N8
 gQQIhksHpwBhcoxZmJTY/OKhar4IyMGI+JRWY+/3i+ZhrJhTdKqOwHPW2yipkVEmS3Ng
 /26A==
X-Gm-Message-State: AJIora/Gws+Knz38342rPzGVCZrOzecDzy4oIfOGsIo/t4zrYBzlr/6l
 lbVKy7bcnyr0P3LiM1/cI9+HcMTyvN2WUT+/078AWsUrpVvnsP/QGMc95JWMXafLK5hSzrQjUzB
 ow1tHg1Rw+vZlIWw=
X-Received: by 2002:a17:907:2c65:b0:70e:c2ee:781b with SMTP id
 ib5-20020a1709072c6500b0070ec2ee781bmr25560073ejc.281.1655809453129; 
 Tue, 21 Jun 2022 04:04:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v1DGMng+rk3N3A7dy9eULnY777JOhy/aGN1/hY4gENrEKkOH4Gd4ww2Doz7NDVJmuEnsUffQ==
X-Received: by 2002:a17:907:2c65:b0:70e:c2ee:781b with SMTP id
 ib5-20020a1709072c6500b0070ec2ee781bmr25560054ejc.281.1655809452901; 
 Tue, 21 Jun 2022 04:04:12 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 hf27-20020a1709072c5b00b006fee961b9e0sm7410569ejc.195.2022.06.21.04.04.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 04:04:12 -0700 (PDT)
Message-ID: <690b7c71-7719-bffe-ea65-ae021cb49b47@redhat.com>
Date: Tue, 21 Jun 2022 13:04:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 21/45] block: add bdrv_try_set_aio_context_tran
 transaction action
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-22-vsementsov@openvz.org>
 <80b132a2-bf15-4335-c8fa-048d2b7a83ec@redhat.com>
 <b9bfb45e-821e-a832-68a9-f7cf5bacda58@yandex-team.ru>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <b9bfb45e-821e-a832-68a9-f7cf5bacda58@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 20.06.22 22:57, Vladimir Sementsov-Ogievskiy wrote:
> On 6/13/22 10:46, Hanna Reitz wrote:
>> On 30.03.22 23:28, Vladimir Sementsov-Ogievskiy wrote:
>>> To be used in further commit.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>>> ---
>>>   block.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 48 insertions(+)
>>>
>>> diff --git a/block.c b/block.c
>>> index be19964f89..1900cdf277 100644
>>> --- a/block.c
>>> +++ b/block.c
>>> @@ -2907,6 +2907,54 @@ static void bdrv_child_free(BdrvChild *child)
>>>       g_free(child);
>>>   }
>>> +typedef struct BdrvTrySetAioContextState {
>>> +    BlockDriverState *bs;
>>> +    AioContext *old_ctx;
>>> +} BdrvTrySetAioContextState;
>>> +
>>> +static void bdrv_try_set_aio_context_abort(void *opaque)
>>> +{
>>> +    BdrvTrySetAioContextState *s = opaque;
>>> +
>>> +    if (bdrv_get_aio_context(s->bs) != s->old_ctx) {
>>> +        bdrv_try_set_aio_context(s->bs, s->old_ctx, &error_abort);
>>
>> As far as I understand, users of this transaction will need to do a 
>> bit of AioContext lock shuffling: To set the context, they need to 
>> hold old_ctx, but not new_ctx; but in case of abort, they need to 
>> release old_ctx and acquire new_ctx before the abort handlers are 
>> called.  (Due to the constraints on bdrv_set_aio_context_ignore().)
>>
>> If that’s true, I think that should be documented somewhere.
>>
>
> Hmm.. Actually, I think that bdrv_try_set_aio_context_abort() should 
> do this shuffling by it self. The only hope to correctly rollback a 
> transaction, is operation in assumption that on .abort() we are 
> exactly on the same state as on .prepare(), regardless of other 
> actions. And this means that old_ctx is acquired and new_ctx is not.

But if old_ctx is acquired and new_ctx is not, you cannot invoke 
bdrv_try_set_aio_context(bs, old_ctx), because that requires the current 
context (bdrv_get_aio_context(bs)) to be held, but not old_ctx (the 
“new” context for this call).


