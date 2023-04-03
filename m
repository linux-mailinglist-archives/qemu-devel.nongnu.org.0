Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DA56D5140
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 21:23:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjPll-0002Pu-K4; Mon, 03 Apr 2023 15:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjPld-0002J7-SH
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 15:23:01 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjPlc-0002wf-8v
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 15:23:01 -0400
Received: by mail-pj1-x102a.google.com with SMTP id x15so28237560pjk.2
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 12:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680549778;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KyPJPZOz616tGfU3a0unnS7jdLMteqYbtwQ1KgxtNZI=;
 b=K/28iRkWX0ymA65dLro2BxMJ2EJtr0WL+lSl3WsrcacExODZLwc/k+nhbzv9Xjvefq
 AwYQ5lADOCjomMNoVZGolchZidxNvYPvUw966nTVJhq7bR6bP2HCgnX0KDogaxpiv9gb
 kmUokkF+KH3tyL4muuoJXABrsUmv91nw4AE4M8kjgKiKnnHhHwFXYAx9X06+SKaKGmwe
 pmwCJbba7Dbm5XNjehYbe1wDWS1WucgP6nW+a/23issAxvf55evjvAUL5Bzc26dKlARC
 VPcBllvlAum6eHPWbIaNKf7HTzwETqn5g+X/xV9NgnHqCB85EiWdxJiLKomSXXUOrCAj
 O0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680549778;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KyPJPZOz616tGfU3a0unnS7jdLMteqYbtwQ1KgxtNZI=;
 b=0x7YIvVy/wPT6UAEUxiwqw36OHNVLkK6/FgbnYZPnPRH+WDVKgZ50A+xznfev2Zm/Y
 W1L2e29ZjuD1ra25OVsasCbrqjqDEd7bbViulHgkXvzJ53dqMKVE4sPbA1Hd2MffslXd
 J75dSSe/pKKgHarSBha6KQF2wzCl4F3xePkmbDdnYLSW9JUo6SkoW6w1IrxSDyyCoUP6
 nXXy2qiaojAKlp5Zt5iyX9l4agB+PtN9irgdl7nUHuaOQ3V6PRYxIgE9jWjtiKFv8H1l
 /U0w3d3nNfc2cM1XvC+YuZd6T87B7+K5jibLf7Z43UQ4OhEI5J86HyWN5RUSEWCzW6SJ
 21vQ==
X-Gm-Message-State: AAQBX9eChdsQwNWWkCdAQMwL4JO6e8t54wC3BKSkUjmHY/LhFiG0yIdb
 Oc+P/Cq626C2IIp2CLxFD+hJ7Q==
X-Google-Smtp-Source: AKy350Z8HO7HJSMvrSdwsAWLuUlvkB+ZwayVU7OwTJgxnrz84VgqXBNjNDlf44tbzYYhr9AgdK73+g==
X-Received: by 2002:a17:903:1c3:b0:1a3:d392:2f29 with SMTP id
 e3-20020a17090301c300b001a3d3922f29mr30884plh.20.1680549778738; 
 Mon, 03 Apr 2023 12:22:58 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:c7ce:2c40:3ee4:21c4?
 ([2602:ae:1541:f901:c7ce:2c40:3ee4:21c4])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a170902a60800b001a045f45d49sm6957420plq.281.2023.04.03.12.22.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 12:22:58 -0700 (PDT)
Message-ID: <ac4fb2ff-b494-8061-1e8c-bd3df72d17c1@linaro.org>
Date: Mon, 3 Apr 2023 12:22:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 09/10] qapi/run-state.json: Fix missing newline at end
 of file
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
 <20230403144637.2949366-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230403144637.2949366-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.349,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 4/3/23 07:46, Peter Maydell wrote:
> The run-state.json file is missing a trailing newline; add it.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Noticed this because my editor wanted to add the newline
> when I touched the file for the following patch...
> ---
>   qapi/run-state.json | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

