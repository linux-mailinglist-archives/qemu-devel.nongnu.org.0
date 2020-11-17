Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7572B688B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 16:22:29 +0100 (CET)
Received: from localhost ([::1]:36586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf2oO-0006u5-T4
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 10:22:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf2mr-00061h-CH
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 10:20:54 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:37057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf2mo-0000WW-Lx
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 10:20:53 -0500
Received: by mail-pl1-x641.google.com with SMTP id d3so10400186plo.4
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 07:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oqXV8Wkwa3DBwdbXx+s5mzb6Yygf26QpzZ/Rvn2nxW4=;
 b=K7wjA20vz+GjK67whSMD6Iqs5hhk96+A8iQBLP4pd6ODp/rSLNKwjJuXSQNU7bfYzF
 dbovsm9dHc7zlKZZjUiIsisbM8xvB0aNz1UWvXd5qBZbIs7sNI7qWcNFwJsXO0/rQh70
 NzCDZQxqhfvpQQYBakO7jrlVG9FkBOaTK3vlRfWm3N+djORy5b/oFxRD4VYM2gzQt77C
 1lDd5AgAYUxCX4dfSDpYP4cJOCnctQhdY/ZJyYlMtQbMS+nssm8eWTItZCFaWqJb9QwG
 1l2XPXlpod+iRBsyGBB0ZnIk4o0aSa+YIk1IZo+qJman6pksuK8dVYIBA2tCkBvElC79
 EZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oqXV8Wkwa3DBwdbXx+s5mzb6Yygf26QpzZ/Rvn2nxW4=;
 b=kPoumq2h/XEGUzSwANn60mGFWei29kjGEv10Xi0Qxf3ZWZi/m5id09tRk5BAHuwM1p
 CZVJ1DLtUmtHPJjFqN9wZ1u+kdQx4tuteO/ZUkzm5HziuZpvFU6of6EnOyOHoibceWnU
 9YIrPL6YvSk/EaMDNyUFG7sostC47T1GhEoC9oiV9BT4JUZuZKtJYFlgksJJpMAtsSG8
 l40/WMWA7r8j/B8eo5BJgKZTyREm6SAxLgOTpUdQztuoxb8dH9mPjNQymiOIdwVWogSN
 lmFahvOQKQJ+mjfMQ5Q7CJdJ+qtvLMBf/qdHNYHJlUM/06h0/58KY5AXYHSrPHpX9PNH
 NecQ==
X-Gm-Message-State: AOAM5326QFSUuWxIInP7oq8H3LBxhL+HzolzEmjiJaTQImdngHe1OBL6
 v7vdMrzZNzH6fN+HFw86pVZjpaEL+FnD5g==
X-Google-Smtp-Source: ABdhPJxDZ7oqSEJd3los5s9NL14zoB7ukoKhVqWmNPJazTSpldQGZv9h2oQwdii5rMtMBFjIuEWvEg==
X-Received: by 2002:a17:90a:16c1:: with SMTP id
 y1mr4859317pje.168.1605626448302; 
 Tue, 17 Nov 2020 07:20:48 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id s18sm1554679pjp.17.2020.11.17.07.20.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 07:20:47 -0800 (PST)
Subject: Re: [PATCH v3 00/41] Mirror map JIT memory for TCG
To: Joelle van Dyne <j@getutm.app>
References: <20201106032921.600200-1-richard.henderson@linaro.org>
 <CA+E+eSAOL+Gx=8X54HTFup5Qash7erpuCSY3_t2gynr1X27tXg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8b0e2ecd-0a2d-de71-2fa6-6e47758d4db6@linaro.org>
Date: Tue, 17 Nov 2020 07:20:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+E+eSAOL+Gx=8X54HTFup5Qash7erpuCSY3_t2gynr1X27tXg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/20 7:47 PM, Joelle van Dyne wrote:
> Hi, I'm wondering what the progress is for this patch set and the iOS
> support one? I know 5.2 is frozen, so will this be considered for 6.0?
> Apple Silicon Macs are out now and a few people are asking about QEMU
> support :)

Yes, this will be considered for 6.0.

It does need to be reviewed more completely than a "LGTM", but there's time for
that.


r~

