Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDD6457DD8
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 13:26:48 +0100 (CET)
Received: from localhost ([::1]:59382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moPSA-00043j-MX
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 07:26:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moPQO-0002jl-Vh
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 07:24:56 -0500
Received: from [2a00:1450:4864:20::430] (port=43637
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moPQN-0007K9-9z
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 07:24:56 -0500
Received: by mail-wr1-x430.google.com with SMTP id t30so22991158wra.10
 for <qemu-devel@nongnu.org>; Sat, 20 Nov 2021 04:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IsQUvqEkZgI/RMwh3SJD+wLaoccTLgVBtN2xS9tMxME=;
 b=Y8R3gDeGOxNUqp8WZ7TTd92zHb1XKPRGNttm9stF0InV/mJEpGb6M0oP2lsUwC3P5U
 zkqO52XVuA1D37WCo4oVEs5HKwbUi7MT50FJIkZHUC5ftzb72aTO/zyqDd+9DKn2aBT4
 iMLaaYgKqxuox3kyQEojJsv4mZ0FUBcRLK/B+MdqlJiQNw1g/tsyjNbhjhAvFJwnQagb
 znMoZ5FmaDR51U+EuuE1IK7YPq0UkVyiDNK6RDqlzAciSDgCC/9syCb1D1EY1RHnemt7
 MrbWL+F6nVqaY1H2FcFjfpOSpYh1oNjhGLKzMwk1qz+UP2yCyDOJZPMsfaNNMc5S25Lc
 SpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IsQUvqEkZgI/RMwh3SJD+wLaoccTLgVBtN2xS9tMxME=;
 b=vkY4+SSR5pGBZrCuy/8laFG4wzMR3L4E+lKtFSJs6lG2b1gMGzRX3Brw/OYr4L75ER
 baeMK7hVfafUFNIUc4Dv/Lzbh/I+R8E5M0eOxlw3x8C9ymwnRKb1IGhyJiNm3z9wr6C8
 shM2iSl2SWlD/PN7MyuCQJyHOX71u3KRk04AE+AY3m9hce9jEAbDsjuvnC/t7Gbm1HlW
 /LamXdjeKT9vo5YFLGADszCYahIrWKRAH3y37/F3WeX9rE5Ce7v+G7gKDfkhI9JwwuZO
 FrPWWP/zzqMgk5sPX2J+EA5IA396/Aln1IHGk5vwoxFHMZO6j1LyI6VUt+gHYx0b3fKD
 DCzQ==
X-Gm-Message-State: AOAM532Rga6vvlD5vpGMwQK9wSqFDS5FUIOVxTVuwPPhrs7TIFSuWbGO
 nPAx6YHw839TkKJ0wtSqhep4Fg==
X-Google-Smtp-Source: ABdhPJzg/mp2j4dcsQotkdrN8eHPkmnIL4MPHcQJqu367aY0Cy9G0ni7864oSf3eYMeB3Rp945UJTg==
X-Received: by 2002:a5d:4e0b:: with SMTP id p11mr16912693wrt.88.1637411093245; 
 Sat, 20 Nov 2021 04:24:53 -0800 (PST)
Received: from [192.168.8.104] (9.red-95-126-194.staticip.rima-tde.net.
 [95.126.194.9])
 by smtp.gmail.com with ESMTPSA id r62sm2627677wmr.35.2021.11.20.04.24.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Nov 2021 04:24:52 -0800 (PST)
Subject: Re: [PATCH 01/11] migration: Remove is_zero_range()
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
References: <20211119165903.18813-1-quintela@redhat.com>
 <20211119165903.18813-2-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <60257dc9-9613-4229-2d4c-273ffb9e02a6@linaro.org>
Date: Sat, 20 Nov 2021 13:24:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211119165903.18813-2-quintela@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.625,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 5:58 PM, Juan Quintela wrote:
> It just calls buffer_is_zero().  Just change the callers.
> 
> Signed-off-by: Juan Quintela<quintela@redhat.com>
> ---
>   migration/ram.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


