Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAE84289B4
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 11:32:17 +0200 (CEST)
Received: from localhost ([::1]:52680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZrfK-0001V3-Kn
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 05:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mZrdB-0000Xm-4D
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 05:30:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mZrd9-0002CZ-Aa
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 05:30:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633944598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KsDPYysVWpjjUakREKrOz53dFS5sPlSgfgH7alVnhJY=;
 b=AI/4S9ldbV79eU1hs8bhs6t0q7WIaWejTIfD5dq8GCzG54fNXJUJxZhV1wYlj0T1SNcwDK
 65kpacNgVb0PAhksqLPLx5HiE5mvc/D17wWR/DHd61gTZTcWMnXBr2SFlgMRISOyALSqVT
 9nra+4sV90L5jNn4LQKUrOYXiUEpt4s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-c5NqoLNGMaSDTMRwoSN5aw-1; Mon, 11 Oct 2021 05:29:55 -0400
X-MC-Unique: c5NqoLNGMaSDTMRwoSN5aw-1
Received: by mail-wr1-f72.google.com with SMTP id
 e12-20020a056000178c00b001606927de88so12781298wrg.10
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 02:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KsDPYysVWpjjUakREKrOz53dFS5sPlSgfgH7alVnhJY=;
 b=teJaZ4eXsmFkO5EfEZlJ6BofV87NDjxRHgT622jz5DrjOEQnhraG8maESi2yTEQoBa
 qAsQnaVvbijgE4BUYYc5rDoZM1g5GpODQNaYiJ+SxkkeSdOlwWmXBFJCfZ/SsGzQ+XJu
 KI1zsKnmzOYPw050dN+1YIoeMN3++RvvFbyKGqxBx3XU8vCqPNAZwoH1pR98agIhygny
 dVXOC/mv1Cqgv4TQgcp1RIzepkx6BnPyXpVQoFgLxP+L1xy5EidLhiRbICb4NZlBkHCh
 bXne/7S3EOYJa7PaBRIC+3sH/qmJQd/LlRjjdZXB7VVikYMEYMTA36l4LpBiooQLXujR
 Mybg==
X-Gm-Message-State: AOAM533YCZwkOaf1plsYoCOvEIz/JBQQSXnkjXV9kPmSS1gnbcrhE9W1
 hcrKBHmX+xoXQIcGirIkc/tHFQlgQHV63PNEf5s2zeMp7j7FI/evOkSjIWMwfo6dzthHzsi/hnD
 ZfGWWkhw2arC6LuY=
X-Received: by 2002:a05:6000:1541:: with SMTP id
 1mr22445230wry.273.1633944593880; 
 Mon, 11 Oct 2021 02:29:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDPZZJ7YJfbDSKQVflK2pxX3Q44GWg4aUgShfRKQft+EkupRKMhRb5YpbugFFln6yp1LDAdw==
X-Received: by 2002:a05:6000:1541:: with SMTP id
 1mr22445206wry.273.1633944593551; 
 Mon, 11 Oct 2021 02:29:53 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id n66sm7258602wmn.2.2021.10.11.02.29.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 02:29:52 -0700 (PDT)
Message-ID: <ec26842c-27a7-4f3a-3eab-7f2096581101@redhat.com>
Date: Mon, 11 Oct 2021 11:29:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 0/2] pylint: fix new errors and warnings in qemu-iotests
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211008062821.1010967-1-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211008062821.1010967-1-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.10.21 08:28, Emanuele Giuseppe Esposito wrote:
> There are some warnings and errors that we either miss or
> are new in pylint. Anyways, test 297 of qemu-iotests fails
> because of that, so we need to fix it.
>
> All these fixes involve just indentation or additional spaces
> added.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
> v2:
> * temporarly enable and then disable "bad whitespace" error in image-fleecing
> * better indentation for a fix in test 129 in patch one

So the changes look good to me, but I can’t get my pylint to generate a 
bad-whitespace warning no matter how hard I try.  (When you asked on IRC 
whether others see pylint warnings, I thought you meant the 
consider-using-f-string warnings that John disabled in 
3765315d4c84f9c0799744f43a314169baaccc05.)

I have pylint 2.11.1, which should be the newest version.  So I tried to 
look around what might be the cause and found this: 
https://pylint.pycqa.org/en/latest/whatsnew/2.6.html – it seems that as 
of pylint 2.6, bad-whitespace warnings are no longer emitted.  If that’s 
the reason why I can’t see the warning, then I think we should take only 
patch 1 (because it just makes sense), but skip patch 2.

Hanna


