Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7AB4C3609
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 20:43:54 +0100 (CET)
Received: from localhost ([::1]:37114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNK1p-0001jP-Pe
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 14:43:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNJrP-0007Xq-3G
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 14:33:09 -0500
Received: from [2607:f8b0:4864:20::633] (port=35738
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNJrK-0003gD-VX
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 14:33:04 -0500
Received: by mail-pl1-x633.google.com with SMTP id i1so2720876plr.2
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 11:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jjfp4EomP1XQlyh4+nAjYguKBouJwUOVZnlE1nlJ4VM=;
 b=wN6N5PtfNBmWwS7Yfz3K0N75IfzRfCxFwK0Hsnffw66NMNQfi6jgyQkVa939eWBHiI
 Rv1ht8YzUKEGOpNDUfdatZKp6asL3WmaSBl8RCbqU6xUC5WYXjzKPky81AtVbwxrNP5s
 Zpx86IeuSwNwwxrfnSbWbE5c1VlOVijUnVQ+USLX9/EbFDmGxAua+F9Y5AJAt012vqFQ
 nuns9bcDRPHl6BsB7hIr4C9lCfEvhhuzBJCx5N77Bb6fGmOMHp0bJqV1GQRtiMkHMVOo
 gqw2fE8ARf5QET1Cf8wjoMkO4vr38pwaNdZqZF0zR7FyUkZOlA8Z4TlcWkzioJieipno
 4sRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jjfp4EomP1XQlyh4+nAjYguKBouJwUOVZnlE1nlJ4VM=;
 b=Pil6YUfK9umM00lkNCPQFMHwOb85DDQiGHo/+viqKarRKVrc4p45V3LzfItv9Ys/Vr
 AEIsGpo/03Q+1xm82CKMEdNRPrJ+YtX06QTjYSUfSII67nGVv6vgp5p1Zefe5ol+Ucbs
 WxqIoOM5LD7pS/ulFRRngteG60KfZQRUEwD7bUC/JtqB/HEQrFMz3Q2oxIoiMfMah//l
 y37D/qaTEy/nqX5LvuQIdyq4/zUYx/NDvG8pQ1N1qU4pT9bfA/0DrldwwS4bFq1z92BB
 BUcXLEQz0zNq5ymHQ7VPXO8dUKSaXVcfi0UG76oE6VgWC74XUIGeo4CXmzkZ358TpxNX
 rJJQ==
X-Gm-Message-State: AOAM531FOcFCwZMnwLHJZfnFKa1OIBgMLvOg0CPMogkxecaL9dCpy/9N
 bNcgDALHlLA3PylG7b/eguScxA==
X-Google-Smtp-Source: ABdhPJyNr9144/GoguJ0286jThi4oPHwDSqmO4hy4c3i7RLZ7O8YSwbJYSAUZWqZiBzD3eaYxjRb+Q==
X-Received: by 2002:a17:90a:bf91:b0:1b9:bda3:10ff with SMTP id
 d17-20020a17090abf9100b001b9bda310ffmr4289546pjs.38.1645731181404; 
 Thu, 24 Feb 2022 11:33:01 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 o17-20020a056a0015d100b004c59f7dc606sm306742pfu.28.2022.02.24.11.33.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 11:33:00 -0800 (PST)
Message-ID: <3dc1bb04-a749-34df-87da-c6c99d3ecd73@linaro.org>
Date: Thu, 24 Feb 2022 09:32:58 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 03/12] osdep.h: move qemu_build_not_reached()
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220224183701.608720-1-marcandre.lureau@redhat.com>
 <20220224183701.608720-4-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220224183701.608720-4-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/22 08:36, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> Move the macro and declaration so it can use glib in the following
> patch.
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   include/qemu/compiler.h | 16 ----------------
>   include/qemu/osdep.h    | 16 ++++++++++++++++
>   2 files changed, 16 insertions(+), 16 deletions(-)

Would this be obviated by a change to _Noreturn?


r~

