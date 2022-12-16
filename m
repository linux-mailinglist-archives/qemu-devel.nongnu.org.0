Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB2664F28B
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 21:45:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6HZO-0000pS-Gc; Fri, 16 Dec 2022 15:44:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6HZM-0000og-Ln
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 15:44:36 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6HZK-0003c8-FG
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 15:44:36 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 n65-20020a17090a2cc700b0021bc5ef7a14so3582735pjd.0
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 12:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C2XXkvxwl6l/W6UfkORXUuMeMLQ/1EwUfwgkQH+zNQY=;
 b=Z9Fivbd+y0s6QRzRg7rZOvLHfAAxCE0pdXZ2TnfJUbGuga9Rki7BtmyWeH2cKI1e0L
 gxIzk3Pl0gLvY1GwEJ4Y1AKZJOw1xhjsVfB6G5JMcWPsn3ZRWYE5jiM8S9YyRep05moD
 Jgmd7PAPypY1NKwnVfRFiSnu9aBRBMX/Nv1xTSo36z89aJFCgG41hra6yczJ4V3fOWxb
 Hv5TMoc/vKEaWj1VfX/JGkWnbDIZ+kEQvjHjEa1IeJ9SSonheqsKPmTLceilI44tkKfk
 p/2jkFxJgIcY8X5d7gx9syB1/I3FyvMYEYeWPwRNT612fruKBKN6rxa3EtenR7CQQwTj
 f8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C2XXkvxwl6l/W6UfkORXUuMeMLQ/1EwUfwgkQH+zNQY=;
 b=FNlFDsP291/NFUejOQp00Dzq0eHgRA5rTEyL+GZAcA9/hbKjhY/s5x+LcZTHRMeBbX
 waKCK1NX88nbAwXXFO14qeDuNJi8YtNlAx5Q9sAY8Da4zBZl/WC2Vq0WeSTNOHGGSrpo
 4DeMJTQy0HGyV2pxycEiFKETv3rfhEFQEtMXSxOSSjxMM5RQoMsTZNRRO07w2zak/cS8
 eNkLcwUullAjkm94psH6FB8NDceFmY2WSghn6L3uLp071y8rLVoNVcYqd9v7a5rnpiqQ
 fylII6vsy7zsO23xuNuu12vbBiV7Cv2PKWJsGfpodmaY9QsiIMUhl2gAijQGe0yQOhih
 Jciw==
X-Gm-Message-State: ANoB5pkPF/elAak7nB3pcWAw2a8Z0MWKebMY5MqJ/P1ZVk0ieiZS2I0l
 e4+X0YzZvMB8CAY1MJNTeWgFKA==
X-Google-Smtp-Source: AA0mqf7WlNN5uZcLtQO21xa1DWMS0q3gB051YQ5PlqPHp0IxtQwt8NtonF6sIRm2muZyYy3XqyrPhw==
X-Received: by 2002:a17:902:968e:b0:189:c6fb:f933 with SMTP id
 n14-20020a170902968e00b00189c6fbf933mr33230045plp.28.1671223472596; 
 Fri, 16 Dec 2022 12:44:32 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a170902dac700b00188f07c10c9sm2048976plx.192.2022.12.16.12.44.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 12:44:32 -0800 (PST)
Message-ID: <6b04aaaf-75a1-6578-c975-148508656382@linaro.org>
Date: Fri, 16 Dec 2022 12:44:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] linux-user: ppoll: eliminate large alloca
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <20221216192220.2881898-1-mjt@msgid.tls.msk.ru>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216192220.2881898-1-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 12/16/22 11:22, Michael Tokarev wrote:
> do_ppoll() in linux-user/syscall.c uses alloca() to
> allocate an array of struct pullfds on the stack.
> The only upper boundary for number of entries for this
> array is so that whole thing fits in INT_MAX. But this
> is definitely too much for a stack allocation.
> 
> Use heap allocation when large number of entries
> is requested (currently 128, arbitrary), and continue
> to use alloca() for smaller allocations, to optimize
> small operations for small sizes.

I think it would be cleaner to always use heap allocation, and use g_autofree for the pointer.


r~

