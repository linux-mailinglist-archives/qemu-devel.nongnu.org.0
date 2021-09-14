Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1F240B594
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 19:06:40 +0200 (CEST)
Received: from localhost ([::1]:33940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQBtH-0000di-OD
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 13:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQBrf-0007uG-Jo
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:04:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQBrc-0008H0-Vt
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:04:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631639096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tUVjlFHNXmCa8Js779pWipBhiI5Qz+agCSvcz3EWAJc=;
 b=fFagU9Qpn2KRFNfzvr9wD3UrMf1C1HEodXuxgHSy+FvPE7RVOu1mREOkZvahC9yrSxPs/V
 Vs4P7SdL5ETBVcFDUw5IW5CJ1Xyc+a/FcV1ZJEh/GN/Os/BynRSN8K03tan9O1FCagCIFl
 0Oq0iQJLEIRU2RNvjKu+TsRl5Aoo0j4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-koMRQi_tNMK926w5S1tlaA-1; Tue, 14 Sep 2021 13:04:54 -0400
X-MC-Unique: koMRQi_tNMK926w5S1tlaA-1
Received: by mail-wm1-f71.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so18799wmj.8
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 10:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=tUVjlFHNXmCa8Js779pWipBhiI5Qz+agCSvcz3EWAJc=;
 b=ViH7/aww6e19r1j+WkFgZ8KaFeXQ7uziSfNfLJpGwwG8XJyshVpUh8Owqwovjgca71
 CF9vutm7niPRvCslpD4WJ+xgJm0cbttpcBnOIK6fmMBi5il4rU2PQUxGlPODGHXmXMf1
 bymuZBf4ikewgJ1+oZqwTq+ds+s6ja3D9qEb0ZWM4ZDz3e2gvKTGNYjMUhAJDrpmgPot
 WHm4N54p/NZFlbqzQIq24u8RoTaWPCA1NwWPKRc6V0gxLOGR7Jv7Y5NlPXudlq7GHfL7
 5A8GJy9Qym7glmYM5/YPRRmehx8a1299/O2OQri0eAQMG+c4z1cqug9fjoZKO0Eq8F5O
 O7/A==
X-Gm-Message-State: AOAM5321f8zp76QCMGhrWEJH/dmKilHuxbZ0h6n2l+xX01WUpNbdXPMG
 HH7VBb1yi4H4J5ZLN+3IucP2xUX2XhwPgisF6WQLwAJio+ixcYo8+zWb3Kn3DaDbOBqS1vSmtbv
 ymNeKeJQXyDlkM24=
X-Received: by 2002:adf:ef02:: with SMTP id e2mr150684wro.401.1631639093188;
 Tue, 14 Sep 2021 10:04:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytCOfBX3N0TupTpQKysrJGCj0pxmFWr0I2eQYSD4V8ee24XpVsLhP23ozoQfX01XxF3OM+vQ==
X-Received: by 2002:adf:ef02:: with SMTP id e2mr150662wro.401.1631639093031;
 Tue, 14 Sep 2021 10:04:53 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id f19sm1690898wmf.11.2021.09.14.10.04.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 10:04:52 -0700 (PDT)
Subject: Re: [PATCH v3 07/17] iotests.py: filter out successful output of
 qemu-img create
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210914102547.83963-1-vsementsov@virtuozzo.com>
 <20210914102547.83963-8-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <90fa7766-a503-341d-509a-9c38c61e4eee@redhat.com>
Date: Tue, 14 Sep 2021 19:04:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914102547.83963-8-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.09.21 12:25, Vladimir Sementsov-Ogievskiy wrote:
> The only "feature" of this "Formatting ..." line is that we have to
> update it every time we add new option. Let's drop it.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/149.out    | 21 ---------------------
>   tests/qemu-iotests/237.out    |  3 ---
>   tests/qemu-iotests/255.out    |  4 ----
>   tests/qemu-iotests/274.out    | 29 -----------------------------
>   tests/qemu-iotests/280.out    |  1 -
>   tests/qemu-iotests/296.out    | 10 +++-------
>   tests/qemu-iotests/iotests.py | 10 ++++++++--
>   7 files changed, 11 insertions(+), 67 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


