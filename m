Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 858652F7512
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 10:18:40 +0100 (CET)
Received: from localhost ([::1]:59990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0LFf-0008Tv-05
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 04:18:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0LCr-0003fX-FG; Fri, 15 Jan 2021 04:15:47 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:34484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0LCp-0001Kc-Nf; Fri, 15 Jan 2021 04:15:45 -0500
Received: by mail-ed1-x52e.google.com with SMTP id dk8so8767308edb.1;
 Fri, 15 Jan 2021 01:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Mq/mlI5B4bMXas3BIzzTwe+cKDCqDZ3dG8QrzfLUvX0=;
 b=IebdCecstNewYtiRND8rqwa+vrcfsmQX50U40Fdk7W/Zb627zImKYtUsgTe1xc9Bro
 yWyJE00MjRt2jefrd9GoHEpkOq8UxBtKiverNFkXE9FcWyEYvHXXsIixVQ/FYToUHgvD
 CPtp11UGOMqYjlNdwFuip3tHXAiE/ENGsxfX2Kz2/chvUjp3Q6eF8/smZVhOEjL7hDUZ
 tporNZ8K5jqslIgF5g1G8raBFTFax1q6rXeWo3K65aWlrUqSHxN8wLv2Cyy9c60AQDCM
 XTVBqE4PJguIFKMnIZU5By3GTG56ed7hp3JCKqkxi3GT0yNrXDp2bAQa6kTvrYTpaqHg
 M9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Mq/mlI5B4bMXas3BIzzTwe+cKDCqDZ3dG8QrzfLUvX0=;
 b=Gnid1IwHFUDJT54vVqfnRE70RySv3Cf1u7lXCFbHl/oTb33U5t4ZsK20eAWrnhsXvm
 ZVpKCoCi3objqn481M0GupeLx/P1dcAUYVk1QcdoTtlRyw+K0x/XMXcTFr6yvCRk4M/V
 kTS62qXLDjCtrrHdweu/grvcUYnlbUN6UVlxv1TyQ03h/M9SZ4gElEscVkTzqPhE3IRD
 BKPXEewKFv6KKhhUfeEYWUEEKL18N7U76jXr8U8dfAVjUQxeSPrXAWyAPxQfp82i0BCU
 1Yxh1ipEcgu4Qgi5MZUNp89J/5tU+xQGhR5nyDTy1Pen1iCf7vQ8bMKQ6l7BWT0DG42/
 ZYQQ==
X-Gm-Message-State: AOAM532fssld6uMkegwhs+qj3Zcl/nuGN2WgC/Wxc+CrwKGQzIaG+Jka
 31k+HoGrF9StGEc8FnD6Fgo=
X-Google-Smtp-Source: ABdhPJzHngKCvHurxZcIAP85iMR3R13GBeaieiKbWjJu2CzDo1UioMcur6An2Fb7LMea9kllMW9ZzQ==
X-Received: by 2002:a05:6402:13c8:: with SMTP id
 a8mr4139922edx.191.1610702141345; 
 Fri, 15 Jan 2021 01:15:41 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s7sm2993141eja.97.2021.01.15.01.15.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 01:15:40 -0800 (PST)
Subject: Re: [PATCH] qtest/npcm7xx_pwm-test: Fix memleak in pwm_qom_get
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20210115075634.717909-1-ganqixin@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <74ba9c97-4d1f-111a-cffe-7aff18ac3f7c@amsat.org>
Date: Fri, 15 Jan 2021 10:15:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115075634.717909-1-ganqixin@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.237,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 zhang.zhanghailiang@huawei.com, Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>, Euler Robot <euler.robot@huawei.com>,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/21 8:56 AM, Gan Qixin wrote:
> The pwm_qom_get function didn't free "response", which caused an indirect
> memory leak. So use qobject_unref() to fix it.
> 
> ASAN shows memory leak stack:
> 
> Indirect leak of 74160000 byte(s) in 18000 object(s) allocated from:
>     #0 0x7f96e2f79d4e in __interceptor_calloc (/lib64/libasan.so.5+0x112d4e)
>     #1 0x7f96e2d98a50 in g_malloc0 (/lib64/libglib-2.0.so.0+0x55a50)
>     #2 0x556313112180 in qdict_new ../qobject/qdict.c:30
>     #3 0x556313115bca in parse_object ../qobject/json-parser.c:318
>     #4 0x556313117810 in parse_value ../qobject/json-parser.c:546
>     #5 0x556313117bda in json_parser_parse ../qobject/json-parser.c:580
>     #6 0x55631310fe67 in json_message_process_token ../qobject/json-streamer.c:92
>     #7 0x5563131210b7 in json_lexer_feed_char ../qobject/json-lexer.c:313
>     #8 0x556313121662 in json_lexer_feed ../qobject/json-lexer.c:350
>     #9 0x5563131101e9 in json_message_parser_feed ../qobject/json-streamer.c:121
>     #10 0x5563130cb81e in qmp_fd_receive ../tests/qtest/libqtest.c:614
>     #11 0x5563130cba2b in qtest_qmp_receive_dict ../tests/qtest/libqtest.c:636
>     #12 0x5563130cb939 in qtest_qmp_receive ../tests/qtest/libqtest.c:624
>     #13 0x5563130cbe0d in qtest_vqmp ../tests/qtest/libqtest.c:715
>     #14 0x5563130cc40f in qtest_qmp ../tests/qtest/libqtest.c:756
>     #15 0x5563130c5623 in pwm_qom_get ../tests/qtest/npcm7xx_pwm-test.c:180
>     #16 0x5563130c595e in pwm_get_duty ../tests/qtest/npcm7xx_pwm-test.c:210
>     #17 0x5563130c7529 in test_toggle ../tests/qtest/npcm7xx_pwm-test.c:447
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: Havard Skinnemoen <hskinnemoen@google.com>
> Cc: Tyrone Ting <kfting@nuvoton.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Laurent Vivier <lvivier@redhat.com>
> ---
>  tests/qtest/npcm7xx_pwm-test.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

