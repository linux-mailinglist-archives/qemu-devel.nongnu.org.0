Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F95380FFF
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 20:48:29 +0200 (CEST)
Received: from localhost ([::1]:49808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhcrL-0005vr-QR
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 14:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhcqZ-00053D-Cn
 for qemu-devel@nongnu.org; Fri, 14 May 2021 14:47:39 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:44980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhcqW-00050b-Lg
 for qemu-devel@nongnu.org; Fri, 14 May 2021 14:47:39 -0400
Received: by mail-qk1-x735.google.com with SMTP id a2so29667711qkh.11
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 11:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=00UNbHG8R9AgyWWp8PjGmvrM0CuNWPLsA/rCZjsZ8aQ=;
 b=N3yRHhvxxnbKqYGnkNXh/5/DtMoOHdOzDcQUY3RtyORpQhHHsxQar1K6IBjvQqy0wd
 LLfZGdke9NxN6ECJn4hx0QSGK8yj0zMecpaHZKha4CW8iTpdnFZtq2DliJPxc0MLaxtv
 WtCKtGDHDsIw1p2Z6kAtgrWKWGXmRLZ1AyoWN9sfsMJy6PKN2nB//UoSQiExlnziVz08
 CmpBrldSOz8eLOeWPZN3u1DgoD0Ds81HX9HKyQTrkN3y8cV8b5/te5otNVLXC62FN9pl
 EiNJjuh/CNlG3uBCmk8vfuVX8AKsSaKKgNEfbPB7vZ6lUob+6YpoOiBj4chOxXYFlIIg
 2kwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=00UNbHG8R9AgyWWp8PjGmvrM0CuNWPLsA/rCZjsZ8aQ=;
 b=LrA7VJJa5kgE3bxf4hY23uxV0PoGejXy95E0jNDcCLU7m2mzjopg8oYLS1Hmv/8VvC
 /WoJz5H5qCwoL4O+eapScAys5EAkFA2OPYQlNzAHs29mb2pOdaosPcrnS4zCgVVUkxxd
 YMNVPIzlY1OQqfuyvHPdlw83DSNSbGUzFI/GaKgxM7Gtf6RmhiYNvTlPbDXAzoYDR+wa
 Kcf0yZ7m6fQet9eHESD66uiLKvKnvk3TTmSGF2+YTaFa5qFzZXQ6/TsnjSe/0gwqmSgN
 7at6SpP9x8K/Ri9+Elc2qDNzrdbcClBEPJusJMzJ6GqwsZ0PSxHyGfeY9D0IZQy4Opsk
 zqwQ==
X-Gm-Message-State: AOAM531YhR4po7xgcNStPW9MqPcNdUnQPRWYaCla0ajaMUZpEQH6kGOx
 fYy6cZG8tke55+6X9peILug/cw==
X-Google-Smtp-Source: ABdhPJyPQBwQHUqIZOM/f6Kw++DbBVyL1aXVEeKbwWQ5+a5c2A7N9YnNq1nQ5qI7r3dHiu9RlbbQmg==
X-Received: by 2002:a37:9042:: with SMTP id s63mr46147958qkd.324.1621018055449; 
 Fri, 14 May 2021 11:47:35 -0700 (PDT)
Received: from [192.168.183.76] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id q13sm5308610qkn.10.2021.05.14.11.47.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 11:47:35 -0700 (PDT)
Subject: Re: [PATCH v6 59/82] target/arm: Implement SVE mixed sign dot product
 (indexed)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-60-richard.henderson@linaro.org>
 <CAFEAcA-_SNn6bM52KV5z5v8tLS1e=-Si+KiC_gi-3oykV1Rzkg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fad61fa6-cb4e-99bb-ba54-f24cc95a6c60@linaro.org>
Date: Fri, 14 May 2021 13:47:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-_SNn6bM52KV5z5v8tLS1e=-Si+KiC_gi-3oykV1Rzkg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/21 7:57 AM, Peter Maydell wrote:
> Maybe we should macroify this, as unless I'm misreading them
> gvec_sdot_idx_b, gvec_udot_idx_b, gvec_sudot_idx_b and gvec_usdot_idx_b
> only differ in the types of the index and the data.

Done.

r~

