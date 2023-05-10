Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B66916FE38E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 19:58:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwo4p-0007YJ-DI; Wed, 10 May 2023 13:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwo4n-0007Y7-0Q
 for qemu-devel@nongnu.org; Wed, 10 May 2023 13:58:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwo4l-0006tx-6C
 for qemu-devel@nongnu.org; Wed, 10 May 2023 13:58:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683741486;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=7gcz8SJ+JwpveSmBeuCZA2z8zYhBUj+vwkenErewPdc=;
 b=AJ1LOztJSB3Z8yg4M7GSPGec4S6x8OK1wbauqL7jTmwIXIXPyX22b/XW6HgtOOUlozeHax
 m0JXvTVq2ywlgCjLzY6EDyp0H52GjGHb4LRYVdV2M1VPuNUK7HaOKJDX/mUjeY52ZC/+Ye
 t3dL5aCZ3P5UHmOajG3h1iKJCqsUvug=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-Cxas_G_qPcGY2cBqhLPcUA-1; Wed, 10 May 2023 13:57:57 -0400
X-MC-Unique: Cxas_G_qPcGY2cBqhLPcUA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-306489b7585so2642861f8f.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 10:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683741476; x=1686333476;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7gcz8SJ+JwpveSmBeuCZA2z8zYhBUj+vwkenErewPdc=;
 b=R8yYEkq6TCXBNoUxmZFoHBJLHuNTbo2Td7cZK/5mg92mfvOKue2w9e+ZDml3r4ENOn
 0Okiug0JJcWsiDF/bz/+yYzMRWglYTGslCt0Xi2CZl2PNsKBHMoKW+/Q61hCCH0sX1rC
 NWa+v6FfJGunf3nnzbWZKMZ2AXkPqDhqcVb1YMFPQGxYdsutC2TBurQvCS0fHpNeFYYg
 4yj7O83s7Kj8GhC4KR7eKKEEb1PHEj/BXWVQssj+tdBKNSd1+k/DlyQ+r+OxSgRzRPAH
 Ck0Db96YTTsad6sr7VKm8h+7FIDEqB6oKaYAkpnMvwI2UIPccSpWSbrUFummeYIybMYa
 cFcQ==
X-Gm-Message-State: AC+VfDw5sd0LNN9tOsFRQcI5BJh/diKLDBUITa9QxnqxWVEhRrU8qXuY
 PJCsIefGqUXhb7Xk0rFDdZBdEugIvESrUN6araJVrFgI8GkDsT/Gjq23vyuhhOY25eiDUKakQxX
 KPqCdaJjE2Qqkbow=
X-Received: by 2002:a5d:6ac2:0:b0:306:28f4:963c with SMTP id
 u2-20020a5d6ac2000000b0030628f4963cmr12301781wrw.23.1683741476184; 
 Wed, 10 May 2023 10:57:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7bToJYU2D0ww59IKz+Qsd/sSVzLz26mUlmFrS9cxamymDiavVwCoBwD5rIFNu39+JY33pa6g==
X-Received: by 2002:a5d:6ac2:0:b0:306:28f4:963c with SMTP id
 u2-20020a5d6ac2000000b0030628f4963cmr12301770wrw.23.1683741475894; 
 Wed, 10 May 2023 10:57:55 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 l18-20020a5d4bd2000000b003078bb639bdsm13690727wrt.68.2023.05.10.10.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 10:57:55 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Andrei Gudkov <gudkov.andrei@huawei.com>
Cc: <qemu-devel@nongnu.org>,  <eblake@redhat.com>,  <armbru@redhat.com>,
 <berrange@redhat.com>,  <zhengchuan@huawei.com>
Subject: Re: [PATCH v2 3/4] migration/calc-dirty-rate: added n-zero-pages
 metric
In-Reply-To: <ccdc82d8bdf6b4a0ccf49eec563db34e0dcf5e59.1682598010.git.gudkov.andrei@huawei.com>
 (Andrei Gudkov's message of "Thu, 27 Apr 2023 15:42:59 +0300")
References: <cover.1682598010.git.gudkov.andrei@huawei.com>
 <ccdc82d8bdf6b4a0ccf49eec563db34e0dcf5e59.1682598010.git.gudkov.andrei@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 10 May 2023 19:57:54 +0200
Message-ID: <871qjo6pct.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Andrei Gudkov <gudkov.andrei@huawei.com> wrote:
> In sampling mode, a new metric is collected and reported:
> number of pages entirely filled with zeroes.

Good idea.

> @@ -331,11 +336,20 @@ static uint32_t compute_page_hash(void *ptr)
>      v2 = QEMU_XXHASH_SEED + XXH_PRIME64_2;
>      v3 = QEMU_XXHASH_SEED + 0;
>      v4 = QEMU_XXHASH_SEED - XXH_PRIME64_1;
> -    for (i = 0; i < TARGET_PAGE_SIZE / 8; i += 4) {
> -        v1 = XXH64_round(v1, p[i + 0]);
> -        v2 = XXH64_round(v2, p[i + 1]);
> -        v3 = XXH64_round(v3, p[i + 2]);
> -        v4 = XXH64_round(v4, p[i + 3]);
> +    if (ptr) {

It smells like a hack, that is only going to be used once in the
program.
But the only other option that I can think is repeating the function for
the zero case.

No way to win here.


> +        for (i = 0; i < TARGET_PAGE_SIZE / 8; i += 4) {
> +            v1 = XXH64_round(v1, p[i + 0]);
> +            v2 = XXH64_round(v2, p[i + 1]);
> +            v3 = XXH64_round(v3, p[i + 2]);
> +            v4 = XXH64_round(v4, p[i + 3]);
> +        }
> +    } else {
> +        for (i = 0; i < TARGET_PAGE_SIZE / 8; i += 4) {
> +            v1 = XXH64_round(v1, 0);
> +            v2 = XXH64_round(v2, 0);
> +            v3 = XXH64_round(v3, 0);
> +            v4 = XXH64_round(v4, 0);
> +        }

>      }
>      res = XXH64_mergerounds(v1, v2, v3, v4);
>      res += TARGET_PAGE_SIZE;
> @@ -343,6 +357,17 @@ static uint32_t compute_page_hash(void *ptr)
>      return (uint32_t)(res & UINT32_MAX);
>  }
>  
> +static uint32_t get_zero_page_hash(void)
> +{
> +    static uint32_t hash;
> +    static int is_computed;

bool?


Later, Juan.


