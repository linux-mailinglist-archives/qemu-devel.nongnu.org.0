Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA866504AD
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 21:58:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p70ih-00045o-IB; Sun, 18 Dec 2022 15:57:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p70ib-000459-9q
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 15:57:12 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p70iZ-0006qv-Ti
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 15:57:09 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 hd14-20020a17090b458e00b0021909875bccso12391556pjb.1
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 12:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jlEbJs0Hmw91/cKEmrNuRGaoCj0nc6G2S2VoKXepJHU=;
 b=SwJAqOVd9NfBsAlPqfq4iGFV8oy/gnVxt01UmA3VwA0nGwaY0XpSf8RVZCQ8PLNBvL
 tWApwu1bwaQ1uGNd8OA6Azo+HK+YZ8V8t1Fv102uyK7ZxtZjjBiRcW58mV9SwzioVhQj
 hCln4txsuixMWJpfzpf6BYAB7nwxqAo2x9PS+HNBAdVoWPcsenqkZeHyLmtlOKGyt7du
 9GpoavuoKqLB8aCXxN3GSoFDEY6pCkoQgdiOGGTd8NA54M+ZUD1wXT0xVEjycJrol+AO
 tJy/Qgh54FK5xhILFbDvUtUl4JT2QgTA1+VTmNEx8wOuLcBONcADbaUHqQUnrb+YXCF4
 z2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jlEbJs0Hmw91/cKEmrNuRGaoCj0nc6G2S2VoKXepJHU=;
 b=V3RvgxjYacFC2BvNRNtwQC4rmaXds6h1CLJPp7L+iVLZMHb2lQU9ybDtP/tMzlpbSm
 MxMRRe4O6+5eD8OC5X70dFQt4td/ilZyk/gg8Kd+r6jIarMQlZTukN8pzXHFy2UtTXFB
 1esEDhnBARvtUChVPT24WqgSylDBvrlmsROEOgSwhN5Nk0fRYAwQEmJKqW7Qs8dh44Ps
 dASyc4QkynjXMMM9dVcEzbbScxu32H+pMcOWvdaO64GPn6zc6+l7LooPgr5U4nKqUcwj
 5FK2I9mm/MLwGcp5Vf2vyqYr98YcxNOAzDn/JSD0B9uEGaRbJXGEcgbsyIpXrX+6O1oG
 IoTg==
X-Gm-Message-State: ANoB5pnhmE8ZIYKtyIEKEYr6B6NSn7QP4V+16367RzKCDNYMPvo6Pecf
 /OAvJL1IdOvd/Wy0Z0Ihkz88Qw==
X-Google-Smtp-Source: AA0mqf6a+5Pd5eWDcISk7lmRhc0pniqWAZ+8zFJ7WTOffoD30pqMPhiuBmY4CLsrSKia+93jklFwgg==
X-Received: by 2002:a17:902:ccc8:b0:188:640f:f41e with SMTP id
 z8-20020a170902ccc800b00188640ff41emr48437406ple.4.1671397026481; 
 Sun, 18 Dec 2022 12:57:06 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:3808:f064:41b8:eb9e?
 ([2602:47:d48c:8101:3808:f064:41b8:eb9e])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a170902684f00b00182d25a1e4bsm5456837pln.259.2022.12.18.12.57.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 12:57:06 -0800 (PST)
Message-ID: <e60fa07a-951c-7129-683f-6d8a201ae8bd@linaro.org>
Date: Sun, 18 Dec 2022 12:57:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 06/11] audio/alsaaudio: use g_new0() instead of
 audio_calloc()
Content-Language: en-US
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
 <20221218171539.11193-6-vr_qemu@t-online.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221218171539.11193-6-vr_qemu@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
> The value of the g_new0() argument count is >= 1, which means
> g_new0() will never return NULL. Also remove the unnecessary
> NULL check.
> 
> Signed-off-by: Volker Rümelin<vr_qemu@t-online.de>
> ---
>   audio/alsaaudio.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

