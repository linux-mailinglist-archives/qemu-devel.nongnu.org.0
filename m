Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8CA390320
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 15:53:53 +0200 (CEST)
Received: from localhost ([::1]:46636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llXVI-0005gO-5b
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 09:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llXRq-0001BC-2w
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:50:20 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:44824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llXRn-0000c6-5N
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:50:17 -0400
Received: by mail-pg1-x530.google.com with SMTP id 29so11688946pgu.11
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 06:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=32C1A3ybXqZsAfQ+VQxBGjGF9/ZnL+5taTa6I8CDR54=;
 b=eFrjvniok9KPlQbWDRebFrR0hqQhMiwj/e4e2veKPw/jfAFYrwhfLsCneDPNysTLbw
 F0rep4RwJMXhJ9xi5UllpVRqegnjSz8Lfo+kaGQozLcN0SY1HbOrguTMRMbiZd+Up9Qy
 OhuQRaxE83i8zOMxn93KPPuu91ceZ0lWI09kNJV4nu3jE33kQpxPIJoOfdyR4uQDzhEA
 KQgAM4pS0DH5VcvzEJHTJbyYTR2poZ3Rc7yVp03jY8fx7XtR/Ze8r4igIwFfxwn4AKR/
 mtvIODsr9sNoA7yHS5ZwwgjreJoRT/tSc/fT9NqwVvv1SjzEK/Dagwtrhy4H0X6NJSzO
 eWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=32C1A3ybXqZsAfQ+VQxBGjGF9/ZnL+5taTa6I8CDR54=;
 b=aWDzJ738cgySaRBIKn+NzPMz+AFFBroQBCXQErUQkHOYBQbhOg9/dTnY0s+x/VMlpC
 6TW0EkzoKKz5DudJ2Dvi03vUZxJyAfIQEsy5zV/S/5tjcwNeX2QjrA9yCkpcurvB1qly
 WRkNxewnqRFl7hbAntq/ED7KiPVOcj8giTwYcLzy69d1UBoBKPKL8IxRmdUYyBqjagRY
 GOe/iapq2VkGpT+8FXg1VmBDuvUIywbSUBM8xuI5FeSFdwn8n3X8GOpKGDsNHVXH7LhG
 yiSytRCjINbPA5ki40vZR4BgzZjoOa6uRRB/L84xh2EqWcoxmvYobPYrBwVbJimNjzLz
 /W7Q==
X-Gm-Message-State: AOAM533MMEkYYonrI928TFkdMS6oVkssIJEr9TrVUZiUOT4S53fUh/a4
 UaYavb3kZtjwvf60WeNWXs0dZA==
X-Google-Smtp-Source: ABdhPJy1ZqtlkZNfMebndPAzRX+sEx/iwFVEeILux06TV7DBOy/2bzi5aIe+Wx3/mVgyF/TNdnaBQQ==
X-Received: by 2002:a63:3dc5:: with SMTP id
 k188mr18794616pga.140.1621950613679; 
 Tue, 25 May 2021 06:50:13 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 gj21sm2125562pjb.49.2021.05.25.06.50.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 06:50:13 -0700 (PDT)
Subject: Re: [PATCH 8/9] accel/tlb: Rename tlb_flush_[page_bits >
 range]_by_mmuidx_async_[2 > 1]
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210509151618.2331764-1-f4bug@amsat.org>
 <20210509151618.2331764-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cdb928e7-610a-32ec-fbac-e4af11d0ef6a@linaro.org>
Date: Tue, 25 May 2021 06:50:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210509151618.2331764-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/9/21 8:16 AM, Philippe Mathieu-Daudé wrote:
> From: Richard Henderson<richard.henderson@linaro.org>
> 
> Signed-off-by: Richard Henderson<richard.henderson@linaro.org>
> Message-Id:<20210508201640.1045808-1-richard.henderson@linaro.org>
> [PMD: Split from bigger patch]
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   accel/tcg/cputlb.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Rename to match tlb_flush_range_locked.


r~

