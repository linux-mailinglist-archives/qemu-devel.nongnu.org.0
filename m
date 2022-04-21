Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B7850AB4D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 00:17:28 +0200 (CEST)
Received: from localhost ([::1]:47216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhf79-0006tS-8C
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 18:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhf5t-000691-Cf
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 18:16:09 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:36684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhf5n-00040J-G7
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 18:16:07 -0400
Received: by mail-pl1-x635.google.com with SMTP id q3so6774044plg.3
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 15:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=QcOJce1eO0Hbdp51nO8gUQblC/nUzW979OsfFBQydjw=;
 b=HfQ6/y1Rs4p3rns4rkxuWEqSE5K1CC6mpHlAT3CIKo8zEdoyDkBhpUcF7YeFFlnHDU
 +m8b6zeLw0lAS85BDlN4tUkL5lQUkAGoaidVEUU9NWGpldMLcax9ebvpHKYbhJvgcnvu
 mL16dLcXoH2rjbdauPA0Wg3eSaMXys5MN9QRzsNtWqbHFg8IC71MIf7fHppnGthhYWwj
 HTMyZA5ZL3rLLM06jxE1JWAHXHy4IAVbavswpeZyMKQuy4EGf3NoduKNcyMRVUSi0AqS
 VNnAxuoOdAbvi+TqaNULIJPaofhBCPnFin2gHdBxJG7wrg6M5r3LKnDxXjYGUKoo5m9N
 Ex9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QcOJce1eO0Hbdp51nO8gUQblC/nUzW979OsfFBQydjw=;
 b=hSEvp4f5atEr092POLFg60Gvi39czmLU2EaKwgB25fcayTFmhjiPcwfEGQhgZGZEy9
 x4r82cfPXbxmtdhs3WWlXqRkJQbaMece0t0UMdg8ErbIHavWhUUJWsmZM9V0RCoCZGZM
 adhV9LxsvuLMUo1bYaSP/YBiKxWgWfDmTj7HF6lRgpm0GM09n2Md7fUuREOPEQaP4sJT
 YUF5KawNqcpPcoLwgg5WslH9x+PtGz3PEfrtf7+B9Qlkl/ZUkPIIZf6IqKXO/PvaMp6t
 7xRrU35Kw8Ma0xYhNLNRW2E+Z1mCQCZvsqww70fxEx1AzgQHAEbBHjBRTWOU6bytLjGq
 6N4w==
X-Gm-Message-State: AOAM533ne5ob2gqRVurKp6hag7V2Gcg/3voaJh7z/SN1678dOWYlhali
 HocAUnvBtUMgbizjXkX2m5TPnQ==
X-Google-Smtp-Source: ABdhPJwXoLFMm2TmgrzXbLvuxpw4M/HRhCYyn2+Tw8LMi24lZFsJYRIZ0HY1OjdNN8ZmM3xWckXRSw==
X-Received: by 2002:a17:902:edd1:b0:158:8318:b51e with SMTP id
 q17-20020a170902edd100b001588318b51emr1322762plk.89.1650579361195; 
 Thu, 21 Apr 2022 15:16:01 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8060:946d:c7f7:991d:96a5:ff15?
 ([2607:fb90:8060:946d:c7f7:991d:96a5:ff15])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a63a442000000b0039cc5a6af1csm133069pgp.30.2022.04.21.15.15.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 15:16:00 -0700 (PDT)
Message-ID: <63f923bf-b3a2-87c7-6be3-7a98ad102526@linaro.org>
Date: Thu, 21 Apr 2022 15:15:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 0/7] QAPI patches patches for 2022-04-21
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20220421143135.1491256-1-armbru@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220421143135.1491256-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/22 07:31, Markus Armbruster wrote:
> The following changes since commit 9c125d17e9402c232c46610802e5931b3639d77b:
> 
>    Merge tag 'pull-tcg-20220420' of https://gitlab.com/rth7680/qemu into staging (2022-04-20 16:43:11 -0700)
> 
> are available in the Git repository at:
> 
>    git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2022-04-21
> 
> for you to fetch changes up to de7371bc7c39ccacb963acb5129b261087967070:
> 
>    qapi: Fix version of cpu0-id field (2022-04-21 10:23:06 +0200)
> 
> ----------------------------------------------------------------
> QAPI patches patches for 2022-04-21

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Andrea Bolognani (3):
>        docs: qapi: Remove outdated reference to simple unions
>        qapi: Fix documentation for query-xen-replication-status
>        qapi: Fix typo
> 
> Dov Murik (1):
>        qapi: Fix version of cpu0-id field
> 
> Paolo Bonzini (3):
>        qapi-schema: support alternates with array type
>        qapi-schema: test: add a qapi-schema-test for array alternates
>        qapi-schema: test: add a unit test for parsing array alternates
> 
>   docs/devel/qapi-code-gen.rst                    |  4 +--
>   qapi/migration.json                             |  2 +-
>   qapi/misc-target.json                           |  2 +-
>   qapi/sockets.json                               |  2 +-
>   tests/unit/test-qobject-input-visitor.c         | 40 +++++++++++++++++++++++++
>   scripts/qapi/expr.py                            |  2 +-
>   scripts/qapi/schema.py                          |  4 +++
>   tests/qapi-schema/alternate-array.err           |  2 --
>   tests/qapi-schema/alternate-array.json          |  2 --
>   tests/qapi-schema/alternate-array.out           | 18 +++++++++++
>   tests/qapi-schema/alternate-conflict-lists.err  |  2 ++
>   tests/qapi-schema/alternate-conflict-lists.json |  6 ++++
>   tests/qapi-schema/alternate-conflict-lists.out  |  0
>   tests/qapi-schema/meson.build                   |  1 +
>   tests/qapi-schema/qapi-schema-test.json         |  1 +
>   tests/qapi-schema/qapi-schema-test.out          |  4 +++
>   16 files changed, 82 insertions(+), 10 deletions(-)
>   create mode 100644 tests/qapi-schema/alternate-conflict-lists.err
>   create mode 100644 tests/qapi-schema/alternate-conflict-lists.json
>   create mode 100644 tests/qapi-schema/alternate-conflict-lists.out
> 


