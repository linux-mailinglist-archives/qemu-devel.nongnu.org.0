Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF44402623
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 11:24:42 +0200 (CEST)
Received: from localhost ([::1]:50194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNXLN-0003nB-Vc
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 05:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNXK3-0001i4-K3
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 05:23:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNXJy-0003tw-V2
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 05:23:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631006593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ERo37G1SgpHRzuc9dhhVg4Mk2Bs7VveQpkU3P/eaOQ=;
 b=P5Yxy1M+6cMM2dTkMrFMagARpUdVudUoPBQWJsbu+K9IeR/gl4cWFLQhiK+LgWkEwnHyp3
 9bmSpze1S93Oi6/U+U1qAUe4ZYhA1wDDexvABwxhkCGhgRKtFTHddQXcLEb+bIqwHCrdhQ
 quSFW+w0Faf9CE5+DlFehnsPc5h0kzs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-7Wc57TC4Myq8MlH4kzPHWw-1; Tue, 07 Sep 2021 05:23:10 -0400
X-MC-Unique: 7Wc57TC4Myq8MlH4kzPHWw-1
Received: by mail-wm1-f69.google.com with SMTP id
 h1-20020a05600c350100b002e751bf6733so869216wmq.8
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 02:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=7ERo37G1SgpHRzuc9dhhVg4Mk2Bs7VveQpkU3P/eaOQ=;
 b=PKpdLQ29Z098LLkGbHDZ66e4O0lq0Fw1Pz97JMkqYqmyD77OY83COl8w+K2JrdhNCE
 j4Js2eXbHy9qbiNz8fA72zGWooY8cXn4xzNXaOxUFJNXX0See7lAJghHa2quArRQ0UhY
 4tDeOcQMaQp6AKkIa7lFGtm23uFYg69p2enAHQH4/JrzMkco48JYGTbsU7v6vhsP8J+A
 An8wKE2VnNrRbcHnyH7Zf7i2C8lNlhuI7nOBweNPaVS81LZimp2r3Ag1wGZITqY9sA2q
 nClQTsxbvNUHIrA30M0x/jEhzvAkdbZeuBM30NvKLrp0MiGPrxDx3b0tNjbus8WLPGJS
 HNtw==
X-Gm-Message-State: AOAM531UwJ1cTC/jhhT2p1W/qFltPNyHo9/f5USpDjTXAWO57Y+aHdCp
 u74n1oNjcqKYh94Fx4uyNz8ckH7330K3Clei4rlwG3Bf1xOHAnhpZXUc8Phg5InrhraFc35UaZY
 MYbsFo9Lpl3yJ54o=
X-Received: by 2002:a1c:1b48:: with SMTP id b69mr1899443wmb.14.1631006589030; 
 Tue, 07 Sep 2021 02:23:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAiV4506qNFRqCav08fTEWiOJ8+T9SVsyHDqTNuudzSNiQYXQxROGN4OJ+HDgVFr0sxOYqGA==
X-Received: by 2002:a1c:1b48:: with SMTP id b69mr1899425wmb.14.1631006588845; 
 Tue, 07 Sep 2021 02:23:08 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id g1sm2452676wmk.2.2021.09.07.02.23.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 02:23:08 -0700 (PDT)
Subject: Re: [PATCH v3 0/6] block-status cache for data regions
To: qemu-block@nongnu.org
References: <20210812084148.14458-1-hreitz@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <121f2215-ac58-fee4-3658-9f0b802124ed@redhat.com>
Date: Tue, 7 Sep 2021 11:23:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210812084148.14458-1-hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.08.21 10:41, Hanna Reitz wrote:
> Hi,
>
> See the cover letter from v1 for the general idea:
> https://lists.nongnu.org/archive/html/qemu-block/2021-06/msg00843.html
>
> Cover letter from v2, introducing RCU locking:
> https://lists.nongnu.org/archive/html/qemu-block/2021-06/msg01060.html
>
>
> v3:
> - Patch 2:
>    - Add rcu_head object to BdrvBlockStatusCache, so we can use
>      g_free_rcu() to free it instead of synchronize_rcu()+g_free()
>    - Use qatomic_rcu_read() every time we read bs->block_status_cache
>      (except in bdrv_close(), where no concurrency is possible)
>    - Use RCU_READ_LOCK_GUARD() instead of WITH_RCU_READ_LOCK_GUARD() in
>      functions where we lock the whole scope anyway
>    - Same for QEMU_LOCK_GUARD() instead of WITH_QEMU_LOCK_GUARD() in
>      bdrv_bsc_fill()
>    - Drop from_cache variable in bdrv_co_block_status()
>      (was an artifact from v1, which had a different control flow and
>      needed this variable)
>    - Assert that local_map returned from a protocol driver’s
>      bdrv_co_block_status() implementation is equal to the offset we
>      passed to it (see comment there for why we should do this)
>
> - Patch 3:
>    - Add note why block drivers should return larger *pnum values in
>      addition to just saying that it’s allowed

Thanks for the reviews, I’ve added the `local_file == bs` assertion in 
patch 2 as suggested by Vladimir (and updated the comment to match) and 
applied the series to my block branch:

https://github.com/XanClic/qemu/commits/block

Hanna


