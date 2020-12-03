Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 330122CDC43
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 18:19:33 +0100 (CET)
Received: from localhost ([::1]:49284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kksGS-0001fr-97
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 12:19:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kks85-0002GW-5c
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:10:54 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:36403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kks82-0007ek-CO
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:10:52 -0500
Received: by mail-ot1-x344.google.com with SMTP id y24so2445737otk.3
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 09:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JPPNUp8ipWsWAexZlipoUMJzkuZiXqBMqIoHxwBPwdU=;
 b=M+wzzlj/kAeU/xpmtdZ4Tg95yS6OYatcG4YPHEHL7aYZWJo++b6CWyalPwkHn8qmz5
 XoIcKVbNVlnRDFjdgAdEKJjeT/XlCHZr3HoCjS4cgc3jNkMXd7XSLRRCAuhoLA/EA9a9
 iQKx+AEn3n1ZlLKAW8+Z9YMlK4ZDebR2l0WTVwCHC3lXNZxY8H5S868tjrDdx67cKzQP
 h0xdj5bissL12yAzdIUxwjAyfR40V0XphV6UY7T9u+CesD8+S+4mY74sBlKUuYqEglh3
 m5JWPx6p8H+CnQZwvN7+PZu/Z7WPRzspQPI2FL/itVyPzaONDqEUiSQCv/ubRSWi4hbp
 URwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JPPNUp8ipWsWAexZlipoUMJzkuZiXqBMqIoHxwBPwdU=;
 b=OdtVira3EkBqgWRZT1Db1aZb+cApo8WmrqziWSmYTsePU7UwMedo0BPpidvJqO8J2t
 UQ3Xwj9UxhXsW00s261GGTZhzCzUiVN5JG9gTsDPmbbnRADYCU264bQoyWw6Lp9dLzcY
 glT5EUHzSStVGVNfnNnIHNjFKQ4m8VGFu1yB4CTNLC++kvkN4MqYIn2YuvYzO82X5b87
 +rGhhG1dvJgN2TvTJZn6E7WjlGohYweloKX01Hs31Ma74A3vvoeOP+99Ft0KBiXMJz9c
 qqldf7nPsE/VFG6jNqy0G9Za8MMmgx81YHu7+CCA3MwC0MOKriCm+fTz8fONTQAufimA
 l1qw==
X-Gm-Message-State: AOAM530U4ma+BB94HHLI9aus16CSVh7PDg1lO7svl/+w9syc+FHR4jWP
 JWcLfQPpOB8M4bBSlvjvZBa8xw==
X-Google-Smtp-Source: ABdhPJwVg9zuB8t8KHOn6UojPPtk+I9rXG9IER8xQKaBXO9P1UfJ+eFM5ep7TXAyG9kJ0A27BkyJcA==
X-Received: by 2002:a9d:7c99:: with SMTP id q25mr100207otn.157.1607015449201; 
 Thu, 03 Dec 2020 09:10:49 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id v15sm356437otj.8.2020.12.03.09.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 09:10:48 -0800 (PST)
Subject: Re: [PATCH 3/9] target/mips: Use CP0_Config3 to set MIPS_HFLAG_MSA
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201202184415.1434484-1-f4bug@amsat.org>
 <20201202184415.1434484-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <904ce358-d0bf-1787-216c-c71545e7c870@linaro.org>
Date: Thu, 3 Dec 2020 11:10:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201202184415.1434484-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/20 12:44 PM, Philippe Mathieu-Daudé wrote:
> MSA presence is expressed by the MSAP bit of CP0_Config3.
> We don't need to check anything else.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/internal.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


