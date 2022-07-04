Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C60F565431
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 13:57:31 +0200 (CEST)
Received: from localhost ([::1]:35640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Khm-000398-Oz
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 07:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8KZc-0007sj-Nh
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 07:49:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8KZa-0002kp-RQ
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 07:49:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656935342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x0q9e/ioEijo2Iyhs1HLls8d0BbM1udzZP1sLciYUfE=;
 b=BmM+pN+EnFOM7lIwDDAzXzidqHAyVSH2zXyuzB2FTX4s9EvKW2wHhvoLIFI8M/d86UWjSx
 kY3j93at28RKOH260xW7i8FYQRGmZfUt1w7SAQ5+q7OLhxVCVGRTXCMNFxj4rTPiZpd9ht
 /rE/Z6gM1Ufpa9XZCx1wavkH+JwNWJ0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-G1R4CB4GMUGPoSHMlIXo8A-1; Mon, 04 Jul 2022 07:49:00 -0400
X-MC-Unique: G1R4CB4GMUGPoSHMlIXo8A-1
Received: by mail-ed1-f70.google.com with SMTP id
 n8-20020a05640205c800b00434fb0c150cso6972759edx.19
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 04:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x0q9e/ioEijo2Iyhs1HLls8d0BbM1udzZP1sLciYUfE=;
 b=fHkpcSap0K/RyJtFbp8ZqxO76UCPzshVBhifDZKptpKIohMYbvkNt4nuL9iIcXjzFa
 uTHaJmD4HGN5fYaoddXWq88yuzGyjxY0omfXrpKO1oUtRQqHo8PNZkQOOZzEAkhbbgnt
 PDNm+2cysHfcucdQ4SlBUQv9hdzdW8TjDoLpUbEx3IVl7k0PyivtaEkx/aLkmn8G/jmP
 xdveNHPWm5Uyb8mQU4xdSs7HZiUZRd0jUR9VTEHZGcatVZXrEGJSAOACAIqV5hD6Pews
 1C+YREeG31VxWLQbFN+D31SWSqTvylllGVO8s155EWp+BFf4U1GsUOgBLQ2cCdUEC8Xg
 UtiA==
X-Gm-Message-State: AJIora/lQRhWv82T5jzjL9wDO3+tc+Qg+yuCXpitvmlt5l/qSZpuHgb4
 uXPsXKL3VlxQazUyHaQYXkFPyr8fiM1pF/claDBKq01r7OOh6k3McxMG6ELnkzu2D6nRiqSoYeb
 bBt+a7+68ZuAhphg=
X-Received: by 2002:a05:6402:3907:b0:431:6776:64e7 with SMTP id
 fe7-20020a056402390700b00431677664e7mr38477327edb.0.1656935339705; 
 Mon, 04 Jul 2022 04:48:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sszM1rYI/84ZmepWK/KoZDL0fwUwX6L19xwk4uXKlx7w8J9VlOfauFHiIw5Cf7lbC+Kzt+Bw==
X-Received: by 2002:a05:6402:3907:b0:431:6776:64e7 with SMTP id
 fe7-20020a056402390700b00431677664e7mr38477317edb.0.1656935339571; 
 Mon, 04 Jul 2022 04:48:59 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 se13-20020a170906ce4d00b006fef0c7072esm14042402ejb.144.2022.07.04.04.48.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 04:48:59 -0700 (PDT)
Message-ID: <0167ea7b-75cb-af39-7081-c6b7a58dc0ed@redhat.com>
Date: Mon, 4 Jul 2022 13:48:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 04/10] crypto: Make block callbacks return 0 on success
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Ari Sundholm <ari@tuxera.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Fam Zheng <fam@euphon.net>, Jeff Cody <codyprime@gmail.com>,
 qemu-block@nongnu.org, Vladimir Sementsov-Ogievskiy
 <v.sementsov-og@mail.ru>, Stefan Weil <sw@weilnetz.de>
References: <20220609152744.3891847-1-afaria@redhat.com>
 <20220609152744.3891847-5-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220609152744.3891847-5-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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

On 09.06.22 17:27, Alberto Faria wrote:
> They currently return the value of their headerlen/buflen parameter on
> success. Returning 0 instead makes it clear that short reads/writes are
> not possible.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block/crypto.c                 | 52 +++++++++++++++++-----------------
>   block/qcow2.c                  | 22 +++++++-------
>   crypto/block-luks.c            |  8 +++---
>   crypto/block.c                 |  6 ++--
>   include/crypto/block.h         | 32 ++++++++++-----------
>   tests/unit/test-crypto-block.c | 38 ++++++++++++-------------
>   6 files changed, 79 insertions(+), 79 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


