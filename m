Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D6F41291C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:56:40 +0200 (CEST)
Received: from localhost ([::1]:33044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSSDG-0006wp-NQ
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSCJ-000692-Kp
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 18:55:39 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:35461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSCF-0000AK-L3
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 18:55:38 -0400
Received: by mail-pf1-x42e.google.com with SMTP id w14so7132115pfu.2
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 15:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5PCcbYqHgNhw2BQ/TAzEbvMqaeC9tH0dm9GCf0aMV3Q=;
 b=H1DgAhYuGhQSYF9hJkzZTkWKPtNMrytcRNLc9pus6e9sU70NZow74iCbJz8U44lRLq
 /F9wbO/dH/cJ8x2ZNLASnatNw5Tr8QIhlI7Jh4LnK4KFXedO0Z485PXcUZAPS1342zQ2
 Tv/4iAZP3SU1+/16F0pyklsz0zBOhKXEyhvtBQB2BxZnvVkDkTa+UOVqifKwPYjF8WH0
 aetScxtStL7jxMfHo2L2MJ6mbNhosupwvBZHvQxQPA6sH/61ZJfyb2ffSy5bvpXp2BFM
 QqzRpJewN+nc8f79NAt0GL6ABY6cQWCoQsYO+/nxIhMuRjxN0Uhg3SXBOgbvPQfJl8kG
 3Bqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5PCcbYqHgNhw2BQ/TAzEbvMqaeC9tH0dm9GCf0aMV3Q=;
 b=PYXirPW0BBhSuGRLysjqqmukzxQJsxu+ZUvsXioD3XFWwjpATn7ar0yHdR0atuOxHL
 o9eMEfSWaZCVdjoHQ6QlCkuR9DzwXl4D2YtfW/OfB/END/kHoUQEPjsQ8pqgtGhaYbPo
 BX7zaZnhFZJ2eMvxk8ejw4LY6FVG85vUfI4QAbzV8ZXB8/qMzPq2x32T4f6j2pfoi927
 zkfjph9HTbFEz0yjU0lskETqu/bD5BFzYYhvq5TXg63s4xQsqDxz0gpHAzYjup97s/HK
 039+Vd4Pvlx7eccJ8IEagfif7PRQQk1d797iaoJX/QCJyDSSddphma2kPnxvsOZaI3eX
 fVFg==
X-Gm-Message-State: AOAM533LkUm4BP2yUAmte754yWvCHNl5XbrpnO7ZEd6YRmJD/c6ZIlSp
 AuWhrmXkqIitmsslg+CX4rTbzQ==
X-Google-Smtp-Source: ABdhPJxdcSeSc8YXI8PcObRo346rPclQu4La8cwMVoQfrgckcmED13pMt8Z4Q1+0Z4sqAAKk/ZGytQ==
X-Received: by 2002:a62:1786:0:b0:445:1a9c:952a with SMTP id
 128-20020a621786000000b004451a9c952amr18625960pfx.39.1632178532171; 
 Mon, 20 Sep 2021 15:55:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c4sm17046322pga.4.2021.09.20.15.55.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 15:55:31 -0700 (PDT)
Subject: Re: [PATCH v3 02/30] Hexagon HVX (target/hexagon) add Hexagon Vector
 eXtensions (HVX) to core
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
 <1632173065-18522-3-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d28a8868-14c0-868f-1148-7f75ec287862@linaro.org>
Date: Mon, 20 Sep 2021 15:55:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1632173065-18522-3-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: ale@rev.ng, bcain@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 2:23 PM, Taylor Simpson wrote:
> HVX is a set of wide vector instructions.  Machine state includes
>      vector registers (VRegs)
>      vector predicate registers (QRegs)
>      temporary registers for intermediate values
>      store buffer (masked stores and scatter/gather)
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

