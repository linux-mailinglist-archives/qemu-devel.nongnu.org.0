Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEDD4000EA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 16:02:27 +0200 (CEST)
Received: from localhost ([::1]:58912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM9ly-0004rp-DB
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 10:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mM9j6-0002mw-Qr
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:59:28 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mM9j2-0006RM-Pe
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:59:26 -0400
Received: by mail-wr1-x431.google.com with SMTP id q14so8381064wrp.3
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 06:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=GNZqg5+KBUOR/ftAx7FYdXjZO5JdGmZAiAxhUxXQimc=;
 b=qPAWV4IQbYw2xT7DeKu0uUA3I3bfzRA7EDnUUOpq4Dt0Rv6TczqZlwOQCjj5BRnSTB
 NIJn5VkHzyBJrsaR8Rc98gW6IyGaPGfvuk8GzOgXq3iZaedw/LvS2IcYI4HVxAFcKgIy
 Y35Dp3yxi8yM4pMGZOt7CEvvmmlxPXHwI/fR/1gJ9TMgwHCDagUvYdduYrOd/NP/FGE5
 ik44h8jxLYl4GSBON5ZnAF3ovr1CVDSBHFjCX0CCTt6iACX2AYWaXUq1TETXR0mOrdbi
 MDUuRUFxoSSlSWDf1NPKvgrWkmidDsJdsv5byfWyrTxJVjWstz699fnxDFpe8VUuyYAs
 0qAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GNZqg5+KBUOR/ftAx7FYdXjZO5JdGmZAiAxhUxXQimc=;
 b=pF6jBd77f+uEXuO/lrlZOtjVBxmE3rDD5R+Knbih3LsaI7mB60es6dtmUa+19q+crE
 7OSkos0Cpna/6T24xzXQRUSS2FBcekKnh3TQbEWP1tAjOFfiOcgQLTOmo8Odiw9JDwCJ
 z7nHlKgKVkyat8yXJ4HIr9d3NChWU4kYLPSi95bf8v0FH7ZnxkOWUK7mXJ037EfunU/u
 Or1gXqatECuSPbNp/umhkbxaZpma95IsvSmwY6WAYLZM1u7YHQMNvJSTPsfib09AWKhl
 Xo/eKB6cZe3zsRY8n/YzjG1OjIZlHhyVjVXEzQ4zhZCekR09wvBzgGZGLRnufab9cJJX
 UgAw==
X-Gm-Message-State: AOAM532CWwQYVc/gNNwX/f7yCTRwRCh4Yi/ls6NON+psdqEUvyi4xIoW
 LCsZyWTJY8EOJr065K+xa7tw0FIrhA05C0PngjU=
X-Google-Smtp-Source: ABdhPJwbDU8S501H6Xbh0CS4obIXafVgVnUZMvdLwsktHgkLp06oFarwCbce7EG8W7xLFIh2TRPxJg==
X-Received: by 2002:adf:80c8:: with SMTP id 66mr4316299wrl.65.1630677563083;
 Fri, 03 Sep 2021 06:59:23 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id c14sm4854725wrr.58.2021.09.03.06.59.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 06:59:22 -0700 (PDT)
Subject: Re: [PATCH 3/4] target/arm: Optimize MVE arithmetic ops
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4fd5648b-5a44-d484-d7ce-497720b0a1a3@linaro.org>
Date: Fri, 3 Sep 2021 15:59:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902150910.15748-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/2/21 5:09 PM, Peter Maydell wrote:
> Optimize MVE arithmetic ops when we have a TCG
> vector operation we can use.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-mve.c | 20 +++++++++++---------
>   1 file changed, 11 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

