Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DECF3EFFCB
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 11:00:37 +0200 (CEST)
Received: from localhost ([::1]:59754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGHR6-0000Sx-8g
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 05:00:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGHPx-0007JI-U4
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:59:25 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:36365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGHPw-0003IC-H2
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:59:25 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 79-20020a1c0452000000b002e6cf79e572so3866074wme.1
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 01:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zw6APIHLF/JzZDpXKUaJ8WNHYHwQhmomu1Fkh8mCjas=;
 b=efdYZHG3ZpWqEBq/g0wFzbJstJBVqo/ZRsm8mDjsKD5wZ/OvVi1dEQV2tpxpXxHSBe
 ybYNj2PM7g5aJeMlYOkLF+GK0AB0tZXaFpIik1+ykJv7nyMd/MZl6lxVwXz3cSgfrM3R
 9a7mdQYVkiZvXNFZsHqJwpVsH7Y/OjsF93blV8o1o7aFFfJ60xltJM46C9KQG5mkc9m7
 x4QXIebXZ2cWD8482f+MMB5Wu6TV1CAs5mUKqh3i21M7trxhd0I3jcs5FZ4J6Xb7LdUC
 DqBye1VjpR9nyprkHd2mZpJMFsDwjsqGghTSXWiL9+7b5BOnhUj7e4JHoeamHLu4jfxa
 6TfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zw6APIHLF/JzZDpXKUaJ8WNHYHwQhmomu1Fkh8mCjas=;
 b=YT1oxRpMxxZq7P8Qv7t6oLtv52UiWmvt4P70I+E2g+SMvKQ8gGjYm45TFsXFSA9doe
 ibzYnoudjURF2KtIFWYtG0Fr1OMCubBqUmdJHFXRZCN4t5c1zQNy/MD94HfLzIz8ks5T
 V378yoJvuSOGp7j7SwcWNfU4HkdDEesiRDUThbikxU0mAp+wTfMkjG+s46uszVA6Gk2p
 HeZzl/RK90PQdzyfj+saavk5dSo6ZGosyKQ31LZL0PpXa8busq6ZyxNJURH2OOETPiqT
 8n1MTb6gaV91i615jGsJqYWekIygqip3htLtv4sPzvQiy4aarRHgKNYMl3GUc0JUbCKl
 qEeg==
X-Gm-Message-State: AOAM530X5tWVctVhxn5l/w7MUjHiQ11L2CdsfaJpCNRWssX+XDr0TFro
 0y0dP576Cv8mL1hzKQHAMfW6qrfvVJc=
X-Google-Smtp-Source: ABdhPJwbLlozkuSPqz1j9DLcAO3xaiJ0qc1T+m3HueGeqyQf4ryzIe0ZtRK24QrmZ0DeR9jop3Fcqw==
X-Received: by 2002:a1c:2904:: with SMTP id p4mr7302596wmp.178.1629277163036; 
 Wed, 18 Aug 2021 01:59:23 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id b20sm4796602wmj.48.2021.08.18.01.59.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 01:59:22 -0700 (PDT)
Subject: Re: [PATCH v2 30/55] target/i386: Use MO_128 for 16 byte atomics
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-31-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9d303a4f-4a5c-d928-34d2-9fef0abfd44c@amsat.org>
Date: Wed, 18 Aug 2021 10:59:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803041443.55452-31-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/3/21 6:14 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/i386/tcg/mem_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


