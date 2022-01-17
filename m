Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A96490C8B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 17:34:51 +0100 (CET)
Received: from localhost ([::1]:43072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Uy2-0000s3-CM
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 11:34:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n9UrO-0002Zl-2J
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 11:27:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n9UrM-00017x-EW
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 11:27:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642436875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f0uGvpFIj/KMeZA6c4YaTxu0+IIkMRQKxMxjWO1itR8=;
 b=dPx4W74FgjNP1bGfqDD7DERgPOx9gsQVXPaX8U40XU0P8magI2dmwONJnrJ0hQ2X7h0Ocf
 8eQEgyNsdPK+0xKDbCmL25p2eOvrwwn5BBX+38D6L6vdtloUXBG3NpZNZPVr3RTQyKw6zO
 MdMwgbGszu22Gs0l4c3VKZvNmhefQ9Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-Ws-TU8_ZPH-VapoQMW2bug-1; Mon, 17 Jan 2022 11:27:54 -0500
X-MC-Unique: Ws-TU8_ZPH-VapoQMW2bug-1
Received: by mail-wm1-f71.google.com with SMTP id
 k41-20020a05600c1ca900b0034aea0b9948so9112540wms.3
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 08:27:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f0uGvpFIj/KMeZA6c4YaTxu0+IIkMRQKxMxjWO1itR8=;
 b=InW+VzjRV+xIVNMiYwLHqg7IeIiFNS9yH7ZORvtfL/l66H5FNG/jHhrNtZ3eJvmFV+
 t1/uE/gkfljUfhkNENpLkHVRPquXyTVV9ILUWjaMxoLSAwJhEINctVquPRcXzWkPG0bF
 to6hcqE+6oYAxP7ur+9XBvYkvi19SA26boRIiCP0cSnwlBLR23OaARGxZ64ugD2F8rDx
 XMYzyvhUUSJmXkPjUo8wLTVGOZZIODE5/KjQP3Gyv5sFZuFk4enc+54AO2vi8PF35J2e
 PjWTgzl6nugi/m52XkY9vE4OkvHAdSe5MINqMPC1otGVNDTUOdyUU1pIZzgnyixmwbc2
 GAJA==
X-Gm-Message-State: AOAM530y/6jBvHiVN1It8+wYaO3jCHbcTuWBk+3lDqbTSXbGeMS4KQmJ
 tUCiBIRAt54LvTlzjCK71LaIPxs3jHXLat6uRZl5bauD52UwvzkO0tBXOTpIQ0yES02b7YOLycr
 rUAfe0CKJzm5YLXI=
X-Received: by 2002:a1c:f205:: with SMTP id s5mr21661742wmc.33.1642436873522; 
 Mon, 17 Jan 2022 08:27:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwayFU7cg7sEXvi74forWDTBl/ltielWpOdSEk5IHYI4EWzdj3ATV4kxfWbd6gWp6KxzvC2Kw==
X-Received: by 2002:a1c:f205:: with SMTP id s5mr21661716wmc.33.1642436873169; 
 Mon, 17 Jan 2022 08:27:53 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id e10sm16968176wrq.40.2022.01.17.08.27.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 08:27:52 -0800 (PST)
Message-ID: <f8af32c2-6127-dc87-0230-a98914897a27@redhat.com>
Date: Mon, 17 Jan 2022 17:27:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/2] block/io: Update BSC only if want_zero is true
To: qemu-block@nongnu.org
References: <20220117162649.193501-1-hreitz@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220117162649.193501-1-hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Nir Soffer <nsoffer@redhat.com>,
 qemu-devel@nongnu.org, qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Forgot to CC qemu-stable.

On 17.01.22 17:26, Hanna Reitz wrote:
> Hi,
>
> As reported by Nir
> (https://lists.nongnu.org/archive/html/qemu-block/2022-01/msg00292.html)
> there’s a problem with the block-status cache, namely that it is updated
> when want_zero is false, but we return the result later even when the
> caller now passes want_zero=true.  In the worst case, the
> want_zero=false call may have resulted in the cache containing an entry
> describing the whole image to contain data, and then all future requests
> will be served from that cache entry.
>
> There are a couple ways this could be fixed (e.g. one cache per
> want_zero mode, or storing want_zero in the cache and comparing it when
> the cached data is fetched), but I think the simplest way is to only
> store want_zero=true block-status results in the cache.  (This way, the
> cache will not work with want_zero=false, but the want_zero=true case is
> the one for which we introduced the cache in the first place.  I think
> want_zero=false generally is fast enough(tm), that’s why we introduced
> want_zero after all.)
>
> Patch 1 is the fix, patch 2 a regression test.
>
>
> Hanna Reitz (2):
>    block/io: Update BSC only if want_zero is true
>    iotests/block-status-cache: New test
>
>   block/io.c                                    |   6 +-
>   tests/qemu-iotests/tests/block-status-cache   | 130 ++++++++++++++++++
>   .../qemu-iotests/tests/block-status-cache.out |   5 +
>   3 files changed, 140 insertions(+), 1 deletion(-)
>   create mode 100755 tests/qemu-iotests/tests/block-status-cache
>   create mode 100644 tests/qemu-iotests/tests/block-status-cache.out
>


