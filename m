Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54C06FE101
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:01:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwlIM-00024w-4o; Wed, 10 May 2023 10:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwlIG-00023s-Kd
 for qemu-devel@nongnu.org; Wed, 10 May 2023 10:59:52 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwlID-0007pC-KG
 for qemu-devel@nongnu.org; Wed, 10 May 2023 10:59:52 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f423ac6e2dso28216745e9.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 07:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683730787; x=1686322787;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gZztRwGESU51JyfM11+c5FaKCh4dWKtdo+/Yqwl4kLY=;
 b=Fp7hV3riEzkQ71nyw4inXEv/SHn8019vTzVFZzkpQSzS7pyDr+OAMddzZykXD0iCOf
 viFs00NfS5Pyr6yxSHrJ5FODQlAG+GX1SZ0guiynx7M2CFWl+q9i6LSbEIycGo3H98RE
 kfHiJ283ch0dGIUYMSO353SRLxyi/JRWReU6CY3QnjxNiwA97kCc0IYSEdiGL+gLuLqQ
 ztCtG+PyazZLYcfyo1R/V36+HTqw8YPRqEfUnF2JU/mbj6m5MxIMz3U889UdZeQbHif5
 XuPARYN0rZH+i42EgH6nwdvUK1X8roCu6qRtwN8sdDxyHZ7+UhzvkjYIYTVC33TKfR1T
 jhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683730787; x=1686322787;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gZztRwGESU51JyfM11+c5FaKCh4dWKtdo+/Yqwl4kLY=;
 b=Su2Di6dtlBibfB9KuCS0+pjDvweBHB0rA36gLpUNF6FyiVd5rvsm4QmML2543hUvjv
 69DVp37cdVZrnwv7ahWfZJwNWstl1GXI+bbAQv6jHqX2qU1WuBtL1mhH8w5+s2TN3RsY
 kAbYDYUbYpHd3BBh7SPl0L966aFjkyZwl0DMpwB1BeyY/Gt/r1XA5aumVCOHbSGGU4tr
 4g7gx0JCvJjKwf3eOifyNb7BWV6iK05rWRHABKbHb3IdnyFnHA7TjyHobS4ELSZrIL53
 o9BWuItCXOrtVwKl50XVr/pzED+raN5vVOadnXCzvXL4y/kSX5MX9EtvFi/NUEaUv0/J
 wtTQ==
X-Gm-Message-State: AC+VfDyxGuhqnA1tFWPB0444CDueusxewW+JX2/uR2p0q071jKDAnEzx
 wTzfxVnpf8YmYt9oWECMNQbcyw2/8Y4IUdfY61jFDg==
X-Google-Smtp-Source: ACHHUZ5NjBkjFLR5wXMf59hTTX2HQ1pEGjdYAAqFZ0MfK4jhbzWxLMLxTdUzGzQznS1UmyR0uhX24w==
X-Received: by 2002:a7b:cd11:0:b0:3f4:b6bc:bd93 with SMTP id
 f17-20020a7bcd11000000b003f4b6bcbd93mr1586772wmj.35.1683730787648; 
 Wed, 10 May 2023 07:59:47 -0700 (PDT)
Received: from [192.168.1.177] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a1ccc08000000b003f17eaae2c9sm23133138wmb.1.2023.05.10.07.59.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 07:59:47 -0700 (PDT)
Message-ID: <e94e5411-66de-3aa6-3ed2-f16154ec5294@linaro.org>
Date: Wed, 10 May 2023 15:59:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL v2 00/17] QAPI patches patches for 2023-05-09
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20230510081224.3588673-1-armbru@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230510081224.3588673-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/10/23 09:12, Markus Armbruster wrote:
> The following changes since commit 792f77f376adef944f9a03e601f6ad90c2f891b2:
> 
>    Merge tag 'pull-loongarch-20230506' of https://gitlab.com/gaosong/qemu into staging (2023-05-06 08:11:52 +0100)
> 
> are available in the Git repository at:
> 
>    https://repo.or.cz/qemu/armbru.git tags/pull-qapi-2023-05-09-v2
> 
> for you to fetch changes up to a937b6aa739f65f2cae2ad9a7eb65a309ad2a359:
> 
>    qapi: Reformat doc comments to conform to current conventions (2023-05-10 10:01:01 +0200)
> 
> ----------------------------------------------------------------
> QAPI patches patches for 2023-05-09
> 
> ----------------------------------------------------------------
> Markus Armbruster (17):
>        docs/devel/qapi-code-gen: Clean up use of quotes a bit
>        docs/devel/qapi-code-gen: Turn FIXME admonitions into comments
>        qapi: Fix crash on stray double quote character
>        meson: Fix to make QAPI generator output depend on main.py
>        Revert "qapi: BlockExportRemoveMode: move comments to TODO"
>        sphinx/qapidoc: Do not emit TODO sections into user manuals
>        qapi: Tidy up a slightly awkward TODO comment
>        qapi/dump: Indent bulleted lists consistently
>        tests/qapi-schema/doc-good: Improve a comment
>        tests/qapi-schema/doc-good: Improve argument description tests
>        qapi: Fix argument description indentation stripping
>        qapi: Rewrite parsing of doc comment section symbols and tags
>        qapi: Relax doc string @name: description indentation rules
>        qapi: Section parameter @indent is no longer used, drop
>        docs/devel/qapi-code-gen: Update doc comment conventions
>        qga/qapi-schema: Reformat doc comments to conform to current conventions
>        qapi: Reformat doc comments to conform to current conventions

I didn't notice earlier, because centos-stream-8-x86_64 failure is optional,
but this has another error:

https://gitlab.com/qemu-project/qemu/-/jobs/4258751398#L4649

Exception occurred:
   File 
"/home/gitlab-runner/builds/Jpwtyaz7/0/qemu-project/qemu/docs/../scripts/qapi/parser.py", 
line 566, in QAPIDoc
     def _match_at_name_colon(string: str) -> re.Match:
AttributeError: module 're' has no attribute 'Match'


r~

