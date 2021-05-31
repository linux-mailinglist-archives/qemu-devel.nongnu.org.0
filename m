Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A6C396656
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 19:02:49 +0200 (CEST)
Received: from localhost ([::1]:56428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnlJQ-0004Hp-7L
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 13:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lnlE4-00007m-Te
 for qemu-devel@nongnu.org; Mon, 31 May 2021 12:57:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lnlE2-0001ZV-NR
 for qemu-devel@nongnu.org; Mon, 31 May 2021 12:57:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622480233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PVuB8aNQLN2znAM0v9wYDDvBmAS+xv+fm2NNR1FN2qo=;
 b=DlFmTDozTVhoe5+cxkczeecFQYgZDOPS7cfxE39mN/3FSbc1P8Pz7qPJlf3pOdBGv7yLkJ
 jbuqEZ5qaHvea4NU9RlsgMzNqvqxy58Tp9jyEbvWTac5iA4/cBK0W9ITpCzE6a2UGGR/CZ
 yakr7SEKpdCfgrTarlZmwopwoDipkAA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-KJBwY66XMma9tvO86D2kGg-1; Mon, 31 May 2021 12:57:09 -0400
X-MC-Unique: KJBwY66XMma9tvO86D2kGg-1
Received: by mail-ej1-f70.google.com with SMTP id
 gv42-20020a1709072beab02903eab8e33118so1534898ejc.19
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 09:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=PVuB8aNQLN2znAM0v9wYDDvBmAS+xv+fm2NNR1FN2qo=;
 b=OI1tNe71a09Ub8KRB8MqhtD9deTbdYSWFb3ZsmaIOP5DVESKpSQp8cz5laIijsvd8/
 CYpLuPrEcOzlJfTnEBGNyCEzxqK7ZTKW+Dz00yo0YcwEdIT71bWNTzBr2xdrS9IEe3fc
 VHlwhiXjoRu585nCjQK8l3uwmIhgMrK/xveo/871j+K+5R1MrcQ7M55qGkNJxRkLgvBR
 fyQDiQ9oi9ZXKLRlbxpzu+qU4yIVD9Xo/2+bBWWvwfvFpS0sV0hZ9kYtyNW7BarMAX8Y
 AZH9/hXrf1xf8Ps0plMpuhTz2XtPiediY38U5i3mcNvVRsJZgnh1OStTXxtpva2q0N8p
 ehHg==
X-Gm-Message-State: AOAM530ZcCe4BhvPSSX5biVOMMw+GtQRURhOC2VflEqPr99k1WxYnJ+W
 Zxc5/y51SJBZrQeQOLjcViLwGZmmBfoha1X3kPnKy+YLmxDk9mPoeH67pGUeGtvoFSEtRQ44Kat
 sDTerZXyZ/r+OqqI=
X-Received: by 2002:a50:f09a:: with SMTP id v26mr23109087edl.302.1622480228720; 
 Mon, 31 May 2021 09:57:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAtRm0B1K0igM4gfluzuK7V8+Xk29bhuYsNtY5HVzMCymmaA8499ah5ysruoEzlPAXkwRDaQ==
X-Received: by 2002:a50:f09a:: with SMTP id v26mr23109067edl.302.1622480228565; 
 Mon, 31 May 2021 09:57:08 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 cw24sm93186ejb.20.2021.05.31.09.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 09:57:08 -0700 (PDT)
Subject: Re: [PATCH v2 15/33] block/copy-before-write: introduce cbw_init()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
 <20210520142205.607501-16-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <c325ce6f-f89d-3a72-babd-f906c57d3a1e@redhat.com>
Date: Mon, 31 May 2021 18:57:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520142205.607501-16-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com, den@openvz.org,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.05.21 16:21, Vladimir Sementsov-Ogievskiy wrote:
> Move part of bdrv_cbw_append() to new function cbw_open(). It's an
> intermediate step for adding noramal .bdrv_open() handler to the

Didn’t notice this in v1, but: *normal

Max

> filter. With this commit no logic is changed, but we have a function
> which will be turned into .bdrv_open() handler in future commit.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> ---
>   block/copy-before-write.c | 69 +++++++++++++++++++++++----------------
>   1 file changed, 41 insertions(+), 28 deletions(-)
>   


