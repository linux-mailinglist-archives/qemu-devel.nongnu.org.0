Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FC76FCB3D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 18:21:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwQ5A-0001QR-Nj; Tue, 09 May 2023 12:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwQ57-0001QA-7s
 for qemu-devel@nongnu.org; Tue, 09 May 2023 12:20:55 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwQ54-0004qN-Vn
 for qemu-devel@nongnu.org; Tue, 09 May 2023 12:20:52 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-305f0491e62so5777078f8f.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 09:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683649249; x=1686241249;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=So9/Di8NwgMCd35yeKZTabaZE1y+DUwVngwL6wjTyl0=;
 b=KWqa5hx5Z3MYdPd432bjQFKoqJubdbORUeGr4o5wMCP5wJjJs+qi6Fs0US9ejrlueN
 iRG2NkQplwvCXk7k4XPHdM7CpBvlGH7h/YvMJAg9w0Yj1Rgh2cRklnVGBEOU3rjyhCG/
 qenboL9KeOOOXQMhx0YZolukdqt4i8s+87YeQ7yQ5MJO5RPO6lLje4oIFAB+TLJEHMNc
 0yIHWrt0zjoxRKNj0CYMrfA4dI3yEATjG6BblhK5nNmnYxqtbMXcD2qXew4NA10NW+WJ
 uwv/DmWJ++SpvArI+0Zrz2lvjanWAyuHv/LySw3n04AxZYbFnJF/QfdR2kz35MMOZweo
 w2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683649249; x=1686241249;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=So9/Di8NwgMCd35yeKZTabaZE1y+DUwVngwL6wjTyl0=;
 b=EOciRWsMEsNS8CHRmlGJwWtAB9EuFOHM60ZW4/sTEA1lmxonW2MZxu6JaCbJ+q9Mzr
 jtKThDYhvFxjvif6mbwfDYf4dSmnWa9ydDiNg82dJkQ84zf9l2PBLwuRQ55kETJ/rrGH
 DNJaJMF7IwC/cwzXbrgPSUCfF8maPwu8KldcU2IilCCeVKHb2Gjo+GK2zNeNrif9eNZC
 g13EK9wJKOCXhjR/zHwjAt3FQuBY5k3IFJBX+99n2wzclV//ATz132h/TzOxjIBZ1DJy
 eWqvPbrYC4+pQg2efDuXnbWf7DCMArIwoipbRVwO87glzyOCspuON+UjfP05BVz2ub5v
 KOxA==
X-Gm-Message-State: AC+VfDwfdptfVWWRmtuRRegWDQsEGPMpfbsUYpVQ1FzQHgtyJe6iNbga
 FW/YkGhR/Ly/ktWH0VhDFeNahQ==
X-Google-Smtp-Source: ACHHUZ6JPUoOZJDy3Zgt8fBIvh7Zm4znHwlih26LWvtOPO/8YBngnkT0Xb0VWw4bjiEF2zZJTDPaNQ==
X-Received: by 2002:adf:ff85:0:b0:307:92e8:ec60 with SMTP id
 j5-20020adfff85000000b0030792e8ec60mr5605530wrr.39.1683649249152; 
 Tue, 09 May 2023 09:20:49 -0700 (PDT)
Received: from [192.168.11.23] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a5d4f11000000b003079986fd71sm5698784wru.88.2023.05.09.09.20.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 09:20:48 -0700 (PDT)
Message-ID: <874d3ef2-0b6f-526d-fc81-e2d1f5cce104@linaro.org>
Date: Tue, 9 May 2023 17:20:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/17] QAPI patches patches for 2023-05-09
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20230509080011.3231661-1-armbru@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230509080011.3231661-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
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

On 5/9/23 08:59, Markus Armbruster wrote:
> The following changes since commit 792f77f376adef944f9a03e601f6ad90c2f891b2:
> 
>    Merge tag 'pull-loongarch-20230506' of https://gitlab.com/gaosong/qemu into staging (2023-05-06 08:11:52 +0100)
> 
> are available in the Git repository at:
> 
>    https://repo.or.cz/qemu/armbru.git tags/pull-qapi-2023-05-09
> 
> for you to fetch changes up to ddd37ae995acacfd858d2ee090c3fa61e33b986b:
> 
>    qapi: Reformat doc comments to conform to current conventions (2023-05-09 09:57:15 +0200)
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

This has a number of CI failures, including

https://gitlab.com/qemu-project/qemu/-/jobs/4252925621#L4673
../docs/meson.build:27:6: ERROR: Problem encountered: Install a Python 3 version of 
python-sphinx and the readthedoc theme


r~

