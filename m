Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BBC4F768F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 08:48:03 +0200 (CEST)
Received: from localhost ([::1]:60636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncLw1-0006KY-RD
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 02:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ncLqy-0005Hx-P5
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 02:42:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ncLqw-0000gH-4o
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 02:42:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649313764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hXb//J5pDHqA/p5Nl9rfXfovT5bBUD1Wfp6B44bF7dQ=;
 b=Hn8dxv8fqj3QijWoP7eODlOMMQRoddyblzkp4yLa2qrkKpDUL/3XyXa7G94Y+abHPEgsM+
 JYZwKFb0JIMEzL2aBdgm3iRcI7byVODLdUy3iGUFgO7HagMWQ+dda70rPJz9SoVUFK1M9x
 Yg4YfuDLNlg9hE4udSiVMczF6dfNYjs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-O6CQitemNh2ikQRBXfZs9Q-1; Thu, 07 Apr 2022 02:42:43 -0400
X-MC-Unique: O6CQitemNh2ikQRBXfZs9Q-1
Received: by mail-ej1-f70.google.com with SMTP id
 qb5-20020a1709077e8500b006e7f59d3cc0so2461300ejc.15
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 23:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hXb//J5pDHqA/p5Nl9rfXfovT5bBUD1Wfp6B44bF7dQ=;
 b=Oy4bUoP/Ztnl9Aomob3znTd7lkWrLe8h/xvEFZ9AVBAXFkKqU6/K4Be2HBXkqKzuAG
 qR3Kh16tCncb2xDXDE1HLnAys43160IWG3POcAJyvtY4HWyuy/gkrW9QvZOwnSxJjyzA
 sadb/cQHRYr2T1OQNEz99dAciODrzTWqsDxEWW+YEChdqjrT/iL5VN8oNKeoH9r4vcuF
 LELQe8kWqBS2o6rEpqIKy0bsXHkzwI+XmdtCrsOE75N1ydLblJjX9Kf3brX6fY20i/Aa
 AvnMo/uExia/zazX4jAHa97DAerF5DrnQC/F/iIxTN/AGq3KXKWUtZVR3UMmYO0BFlh8
 7sSw==
X-Gm-Message-State: AOAM532LBk7Jws2nSzlRIW0SG9oSpnioLQOGx1Yb0NSHLbkXhdgAi7/B
 iEL8cvlUH7vH+knZuRFBvW+FC8C4OzbAcM7Z2xiSS6Fg+wKoJtPASwOumnVKHQEQMd7L3HtHiCn
 eld/KOqphpjSsz1M=
X-Received: by 2002:a17:907:6d19:b0:6db:89c8:52e3 with SMTP id
 sa25-20020a1709076d1900b006db89c852e3mr12207658ejc.754.1649313761917; 
 Wed, 06 Apr 2022 23:42:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDDzBrrP6k+wx3D7mpCVxBGJeZcjwfbqBJP7eBbVhUQgqSjiBzZ6FHMRVZMFwx8dK0Q0JUpg==
X-Received: by 2002:a17:907:6d19:b0:6db:89c8:52e3 with SMTP id
 sa25-20020a1709076d1900b006db89c852e3mr12207640ejc.754.1649313761716; 
 Wed, 06 Apr 2022 23:42:41 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a50e68b000000b00412ec8b2180sm8803763edm.90.2022.04.06.23.42.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 23:42:41 -0700 (PDT)
Message-ID: <8d1a8d01-82c6-c6be-43e9-e8dde0c94467@redhat.com>
Date: Thu, 7 Apr 2022 08:42:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] block/throttle-groups: use QEMU_CLOCK_REALTIME for
 qtest too
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
References: <20220406153202.332186-1-vsementsov@openvz.org>
 <20220406153202.332186-2-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220406153202.332186-2-vsementsov@openvz.org>
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
Cc: kwolf@redhat.com, vsementsov@openvz.org, v.sementsov-og@mail.ru,
 berto@igalia.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.04.22 17:32, Vladimir Sementsov-Ogievskiy wrote:
> Virtual clock just doesn't tick for iotests, and throttling just not
> work. Let's use realtime clock.

It does tick when you make it take, specifically with the clock_step 
qtest command.  093 does this, and so with this patch, it fails, because 
it is no longer deterministic.

So far, if I needed realtime throttling, I simply switched the 
accelerator to tcg (e.g. in stream-error-on-reset).

I’m not really opposed to this, but it does break 093, and without 
looking too closely into it, I would guess that it’d be difficult to 
rewrite 093 in a deterministic way without it relying on throttling 
using the virtual clock.  (A runtime option for the throttle-group 
object to choose the clock type might be an option.)

> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   block/throttle-groups.c | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/block/throttle-groups.c b/block/throttle-groups.c
> index fb203c3ced..029158d797 100644
> --- a/block/throttle-groups.c
> +++ b/block/throttle-groups.c
> @@ -753,10 +753,6 @@ static void throttle_group_obj_init(Object *obj)
>       ThrottleGroup *tg = THROTTLE_GROUP(obj);
>   
>       tg->clock_type = QEMU_CLOCK_REALTIME;
> -    if (qtest_enabled()) {
> -        /* For testing block IO throttling only */
> -        tg->clock_type = QEMU_CLOCK_VIRTUAL;
> -    }
>       tg->is_initialized = false;
>       qemu_mutex_init(&tg->lock);
>       throttle_init(&tg->ts);


