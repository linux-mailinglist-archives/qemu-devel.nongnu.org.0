Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4539E548026
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 09:14:40 +0200 (CEST)
Received: from localhost ([::1]:54120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0eHV-0002i3-7L
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 03:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o0eFC-0001s2-Ae
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 03:12:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o0eFA-0004zN-2u
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 03:12:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655104329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rzgfJirUsrpnZQQknEOaNxT6n3AsfPw4mkn+DCYpURw=;
 b=YZ0FqS2Lww6GZzMp/QwuJkkH9RZZYU5DMy3q+83JNVNgjsHypw9+lwt3XoW0kf6RA+k+7i
 1Ua9rYVHRrDgGyuHe3sZzBoJW3ebftAyhmvxQr6JjmzBrVn9wBQGv1G5cBi8OaTXC8qF/y
 gVLf06IAxEg+k8ICx/BW7mYwsACvV3M=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-tWwqvDB6NFuYiIOewLp_Dw-1; Mon, 13 Jun 2022 03:12:08 -0400
X-MC-Unique: tWwqvDB6NFuYiIOewLp_Dw-1
Received: by mail-ej1-f72.google.com with SMTP id
 s4-20020a170906500400b006feaccb3a0eso1417185ejj.11
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 00:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rzgfJirUsrpnZQQknEOaNxT6n3AsfPw4mkn+DCYpURw=;
 b=0kh1xg1r7HySYovCZHlGzELmfkGx+MNWljYjUC9gYP44V09PZ5fIlpg+WKfvA9StlO
 ZS+i1DzghlY6y8/ZNe8dzGja5J47LJXJJqN+rCVyip6/rVpttqpq6fIKhHY2apP3hmz5
 VGVw73Nm6Nw6qvP4zLtOHZCJcXRUxNqIoGLK3lDvk44r4xyczwPp0dLSvRZqQF/Tj+Yk
 e+JyXJgPatEKQISaTF7CmsnmCqPhm+vpNA3sGnNLkBHxTRiXDtokPksz83uYVxdS3iGB
 RwOvZTrnx+4Jkj+qctJAdukbpzgz8zrlCF6J1jsAtEJwSrjUNEgh9bEq16RjOWSexn03
 vYTA==
X-Gm-Message-State: AOAM532J2RPOyiCbrjmPTC+OEDxTaL+zCi74c3A2d2TFcht/7rsWtO6O
 duaBsGI3Gm5rNHbbNOpbZajkFl6dEVX001YLtIXsJDbXzlkt+Ss3oHZ2yr375+UmVEHcAb25N3d
 Sbf36zMXDoP+anmQ=
X-Received: by 2002:a17:907:a420:b0:6ff:1541:8d34 with SMTP id
 sg32-20020a170907a42000b006ff15418d34mr27503592ejc.447.1655104327304; 
 Mon, 13 Jun 2022 00:12:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7lMyQJemoTD/ESpOSy6n0JqApros63GWqAXE0dxzOyZqfIvZ/HsaI9NZbSVuC5NaRDlqnQQ==
X-Received: by 2002:a17:907:a420:b0:6ff:1541:8d34 with SMTP id
 sg32-20020a170907a42000b006ff15418d34mr27503578ejc.447.1655104327113; 
 Mon, 13 Jun 2022 00:12:07 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a170906391500b006feec47dae9sm3453043eje.157.2022.06.13.00.12.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 00:12:06 -0700 (PDT)
Message-ID: <c2efbe5a-9e75-0af6-3000-f7570a1be4aa@redhat.com>
Date: Mon, 13 Jun 2022 09:12:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
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
 <3cffc38f-e82f-0d34-21f1-6089ac9de21c@redhat.com>
 <37cccb24-79f8-3bca-f289-c8d17e9176a1@yandex-team.ru>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <37cccb24-79f8-3bca-f289-c8d17e9176a1@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 09.06.22 16:56, Vladimir Sementsov-Ogievskiy wrote:
> On 6/8/22 14:49, Hanna Reitz wrote:
>> On 30.03.22 23:28, Vladimir Sementsov-Ogievskiy wrote:
>>> To be used in further commit.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>>> ---
>>>   block.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 48 insertions(+)
>>
>> Looking at bdrv_child_try_set_aio_context(), it looks like 
>> bdrv_can_set_aio_context() were supposed to be the .prepare action, 
>> and bdrv_set_aio_context_ignore() should be the .commit action.  Can 
>> we not use it that way?
>>
>>
>
>
> The difference is that we want the whole action be done in .prepare 
> stage, not only the check. It's generally better: when do several 
> actions in a transaction, actions usually depend on result of previous 
> actions.

Ah, yes.

> And I think it's necessary for graph update. Graph relations are 
> changed during other actions .prepare phases, so I can't imagine how 
> to postpone aio-context update to .commit phase.

OK, sounds good.

> But I agree, that having both _can_ / _set_  and *tran APIs don't look 
> good. May be we can refactor it.. But not in this series I think)


