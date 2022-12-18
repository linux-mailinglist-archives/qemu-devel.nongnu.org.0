Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9706504B0
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 22:03:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p70nw-0005ih-Vk; Sun, 18 Dec 2022 16:02:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p70nk-0005hr-Cx
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 16:02:37 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p70ni-0007ed-QF
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 16:02:28 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 e7-20020a17090a77c700b00216928a3917so11095820pjs.4
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 13:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QsKjZf1PddWtM5Fixcy2C56sLUAUI6nzPPRGUJIxw74=;
 b=ioUnlPnjJsl+TN3Pa1eS6PO6kKzIvMzsiD+E8Qyv0Nt69VCQj8ZuNzDVTMGndyBH4d
 hTIXsGiLoRGUh/u3wdeU4mDf5Hc4SFexdq9rvo0/qyhzXM028NcRAaN3t1DaQkPWTr/L
 wDQw5CsIU5Ypl2gwjkbR3jV0uGnKStyx0EFlf3Lpg7NDD7b3fCAKCw1SGyqkw5xNWEZZ
 Vd9c/GFGg2phSmyd7YaPAUALQQoV5n1CVARCfaT/WcgyKQX86ntM7DDbW2NZv786UBJO
 tKOXrq991aqIKgDk4LD0LfrK0MH0+Qm41jeXYrcMFRkjtf97Lw0RBfCVnL22eNrZB/tW
 qGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QsKjZf1PddWtM5Fixcy2C56sLUAUI6nzPPRGUJIxw74=;
 b=jQFw03+BKZ1hbKlI3cB3E6pW0/2ZiLWYrODKZv+Kit596rzNl+/IW7XysUs2pqmEcr
 b1HynZCGkc19jLBqga5AYI6eGmPeHQkntdOChwiyaeovFvyKYKJVHavDWdzgQYJAc23M
 sYCT6PHCjl81i2ToQztNa3hc/ACPSSR1Sm/MM7lholxiexqDhKtRHvI4uCFTqVIBoqAR
 0d6e6mFYs4SsKh5tzSRR7hOT+FW6q/8XV2RRC+aNSWI7OXkZuQhXUIqjKA3R5qH7hFze
 fyxwmAZbmSDV2uvQktHNE+g7C93dFJUENWBy90zNXMxZgJcbra/jb9jGrxLvsqR/Hpd2
 rpHA==
X-Gm-Message-State: ANoB5pkJYPLz51tcMYqJNy2lTyxkP+zKWfAi9CiSGJp5zrMbXjJ8hGMR
 UlVy2Y9AOMKBGjhdi+cEpWLdqA==
X-Google-Smtp-Source: AA0mqf5r/+v8ty8a114XjaXunsPN+8B4nPIRy3/J6Zkzif1SP9jwpOx8B/fhqeVwOTD6ULianEkN0A==
X-Received: by 2002:a17:902:7247:b0:189:d780:b98f with SMTP id
 c7-20020a170902724700b00189d780b98fmr41858105pll.35.1671397344886; 
 Sun, 18 Dec 2022 13:02:24 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:3808:f064:41b8:eb9e?
 ([2602:47:d48c:8101:3808:f064:41b8:eb9e])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a170902e74200b0017f57787a4asm5503858plf.229.2022.12.18.13.02.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 13:02:24 -0800 (PST)
Message-ID: <210f146f-d854-f100-72f1-2bde24b1d669@linaro.org>
Date: Sun, 18 Dec 2022 13:02:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 08/11] audio/audio_template: use g_new0() to replace
 audio_calloc()
Content-Language: en-US
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
 <20221218171539.11193-8-vr_qemu@t-online.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221218171539.11193-8-vr_qemu@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 12/18/22 09:15, Volker Rümelin wrote:
> Replace audio_calloc() with the equivalent g_new0().
> 
> With a n_structs argument >= 1, g_new0() never returns NULL.
> Also remove the unnecessary NULL checks.
> 
> Signed-off-by: Volker Rümelin<vr_qemu@t-online.de>
> ---
>   audio/audio_template.h | 23 ++++++-----------------
>   1 file changed, 6 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

