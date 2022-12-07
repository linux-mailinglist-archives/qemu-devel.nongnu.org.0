Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 741A6645E61
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 17:09:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2wyF-0003H0-3u; Wed, 07 Dec 2022 11:08:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2wy8-0003FN-Ox
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 11:08:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2wy6-0003Ti-J9
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 11:08:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670429301;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oluc/fOxdmQy9SiJhMGNLFcDbBtah4xkKqBCYf+PT0U=;
 b=E3xZPT/zXetRXKUMbH+Gh53q6dAFKJYJ0yRDPbSKbBs+CLtNhRzJWmoQcXmGhaZTZbqXeQ
 3NCqLFyuY7Zvixv1UmtLwwCIGB1mAOi9xedHVxtgZE/irbVya5CEk3UOIGxL/+PoeXbZ2c
 g81tr3c3uGpGnu6fVXS/0Y+9Y058m/I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-520-tXUgAeNwMi--b6RpAgJfZg-1; Wed, 07 Dec 2022 11:08:20 -0500
X-MC-Unique: tXUgAeNwMi--b6RpAgJfZg-1
Received: by mail-wr1-f72.google.com with SMTP id
 v14-20020adf8b4e000000b0024174021277so4360198wra.13
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 08:08:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oluc/fOxdmQy9SiJhMGNLFcDbBtah4xkKqBCYf+PT0U=;
 b=JlaQPya3MTShPHi4dnwX0/HeA+7BK+qd97NTdyzpEaU0oFUo708PGs+S2YS8dFLSHX
 2GJr22SgqWpWfN5pu+OYj1B2llQ3JV0f/j6Glk47X4CtQnuRXN/LomdFqgFee1kTCnFy
 nQxxW7euUpXWFUWmv5QL9yDdZvXgYf2UB6QlyoYbY439NLn/ig1Enf7HXOA1l23jFJmZ
 +hbC5PkasouY1SClkgV2l799BoPSrGy/BM7XosoTTFVmd5FWv7/jDWm70vbAHfmBRYjU
 9PVgL0yXzR2eMM9t13bj7NvjfUdZckFrPhsMn3VARWQ86yQpsakCH6iMVcF3cLVUp7wr
 ZVfg==
X-Gm-Message-State: ANoB5pmgfB4sCwr2zUbtkMCzm3mR/8HHWWf86nAqXe+Gu7Fih7bDzl6r
 ZLFlLilc8r4BU3gL4l1h1qDYPA98PyLEkH2WNC9SEyAQKla4JwO9YRADWvI+m3ZVtW/oCAZ5v1x
 Y+XkJYQ7HW5qz2uQ=
X-Received: by 2002:a5d:5917:0:b0:242:5f6c:9dc2 with SMTP id
 v23-20020a5d5917000000b002425f6c9dc2mr8996519wrd.304.1670429298905; 
 Wed, 07 Dec 2022 08:08:18 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7n42uWvBbjy6CZHl0bq6AEUzRoxvU9cl7FxlTd1ws2nggBUbDawYGGL5IlsTIf3hliXrxQYA==
X-Received: by 2002:a5d:5917:0:b0:242:5f6c:9dc2 with SMTP id
 v23-20020a5d5917000000b002425f6c9dc2mr8996499wrd.304.1670429298680; 
 Wed, 07 Dec 2022 08:08:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 az5-20020a05600c600500b003a6125562e1sm2281946wmb.46.2022.12.07.08.08.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 08:08:17 -0800 (PST)
Message-ID: <660c1fa1-3575-1849-01d0-8411ca4101d8@redhat.com>
Date: Wed, 7 Dec 2022 17:08:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH for 7.2?] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: eric.auger.pro@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, paul@nowt.org, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, Stefan Hajnoczi <stefanha@redhat.com>
References: <20221207132439.635402-1-eric.auger@redhat.com>
 <f8a36758-cff2-3df3-3e30-083175e47131@redhat.com>
 <CAJSP0QXo0p5E_G9rqLO0wqC=NDQzMhoJOJDb0ShV+7OetFMMbg@mail.gmail.com>
 <6a39520b-5445-bda4-951f-998675d6e045@redhat.com>
 <CAJSP0QXKf5X0FijR64_0JWUBcnpNm-Jk58bfCk=966dZmj7NOw@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAJSP0QXKf5X0FijR64_0JWUBcnpNm-Jk58bfCk=966dZmj7NOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.262, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Stefan,

On 12/7/22 16:55, Stefan Hajnoczi wrote:
> On Wed, 7 Dec 2022 at 09:34, Eric Auger <eric.auger@redhat.com> wrote:
>> Hi Stefan,
>>
>> On 12/7/22 15:09, Stefan Hajnoczi wrote:
>>> On Wed, 7 Dec 2022 at 08:31, Eric Auger <eric.auger@redhat.com> wrote:
>>>> On 12/7/22 14:24, Eric Auger wrote:
>>>>> Initialize r0-3 to avoid compilation errors when
>>>>> -Werror=maybe-uninitialized is used
>>>>>
>>>>> ../target/i386/ops_sse.h: In function ‘helper_vpermdq_ymm’:
>>>>> ../target/i386/ops_sse.h:2495:13: error: ‘r3’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>  2495 |     d->Q(3) = r3;
>>>>>       |     ~~~~~~~~^~~~
>>>>> ../target/i386/ops_sse.h:2494:13: error: ‘r2’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>  2494 |     d->Q(2) = r2;
>>>>>       |     ~~~~~~~~^~~~
>>>>> ../target/i386/ops_sse.h:2493:13: error: ‘r1’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>  2493 |     d->Q(1) = r1;
>>>>>       |     ~~~~~~~~^~~~
>>>>> ../target/i386/ops_sse.h:2492:13: error: ‘r0’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>  2492 |     d->Q(0) = r0;
>>>>>       |     ~~~~~~~~^~~~
>>>>>
>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>> Fixes: 790684776861 ("target/i386: reimplement 0x0f 0x3a, add AVX")
>>>>>
>>>>> ---
>>>>>
>>>>> Am I the only one getting this? Or anything wrong in my setup.
>>>> With Stefan's correct address. Forgive me for the noise.
>>> When is -Wmaybe-uninitialized used? QEMU's build system doesn't set
>>> it. Unless it's automatically set by meson this must be a manual
>>> --extra-cflags= option you set.
>> I am using this configure cmd line:
>>
>> ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/qemu
>> --target-list=x86_64-softmmu --docdir=/usr/share/doc/qemu --enable-kvm
>> --extra-cflags=-O --enable-trace-backends=log --python=/usr/bin/python3
>> --extra-cflags=-Wall --extra-cflags=-Wundef
>> --extra-cflags=-Wwrite-strings --extra-cflags=-Wmissing-prototypes
>> --extra-cflags=-fno-strict-aliasing --extra-cflags=-fno-common
>> --extra-cflags=-Werror=type-limits
>>> If you added it manually then let's fix this in 8.0 since it's not
>>> tested/supported and very few people will see this issue.
> Did you create the ./configure command-line manually? Do you think
> other people will hit this?
no I did not. I just tried to install a fresh qemu repo and just ran the
above configure command. You should be able to reproduce I think.

I am actually surprised nobody hit that already.

Thanks

Eric
>
> Stefan
>


