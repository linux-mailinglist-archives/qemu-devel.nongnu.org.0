Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A24C3CBADA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 18:59:56 +0200 (CEST)
Received: from localhost ([::1]:41360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4RBr-0005e6-7P
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 12:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4RAM-0004Bn-UZ
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 12:58:22 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:36784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4RAL-0007Od-HE
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 12:58:22 -0400
Received: by mail-pl1-x630.google.com with SMTP id x16so5606828plg.3
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 09:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=jOPgkFI0sXa3NsSEIOoiyF1heu/g+NqAUT0ClUh681A=;
 b=lD0wMu5E96q/HnUAv6hfTX3XZFopYGGyy8hpI2KWG75wUuf45CWcd3ewtAc3SfPF7y
 pvRUAuPX7IngP54MgkkpgEj3cdmrl7CXXxlNtcbT8Gy1dkzsh7DSfxuCWbeKmelojUUE
 Sl9q1s86FCneGXZrCCjM46J69RYA3NdiablKIy1WvKVV/N4/TxOElC3SnAdzsNC4m45Y
 6Kufyl51Ah4oSeM+8HsO/e8PMjN1FzwcqHqAzLljeDlwdCxyqCv7MHRclRfmhlZdyXFA
 FvDgWLZ+0OkJgUuYHuZrWsRpnO11m2QZPTo5pCd68akScnC6wrnIMIBIuCSLNxYpdi85
 V+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jOPgkFI0sXa3NsSEIOoiyF1heu/g+NqAUT0ClUh681A=;
 b=RoOMYo7wN9Hacv+9Jt9W0h0FN4Cessea2U1K/PraukrhZNvN4cJfNj2ovQCm5I47by
 mJ4Kk4ANgbcmZmhN2lpSBlayZ+vEeO5oOU6USfUNclS2gPV0ACKvCtovJgiR99jQ34an
 paMQoJGUtUmdtAm4vX5HT6rbe8No9QncYkUFy70qDephNErptGeTJn4QGpf8gvwW0PRn
 Qu7MJW7vvpXTGKhZw28x1dESKlPgTbCRbu9dK8neke/2oLnga3yUk0DzFh7emfJHln0+
 oGfgsRUCTOEUclimUZuK5AGZ+OB+HUG1BcwOdoxmEHFTrkwaKV5pXiUCroOFi2/3+ODm
 X20A==
X-Gm-Message-State: AOAM531DbopkrJa9OeYnvXx1cyVwOdJm/BDBhGw4A2YwnZzDH4c+QTGw
 N2eFxaP6b7WEEF8+Fy49WA4d5FEA/CMrgA==
X-Google-Smtp-Source: ABdhPJy2XIiQW3bv8veQzHKq712aQQLzGUl8JUMot9TLxufen5Qgj6oq+8HfZymYDtqcoH6IPBQ4uA==
X-Received: by 2002:a17:90a:bd94:: with SMTP id
 z20mr11148379pjr.214.1626454699668; 
 Fri, 16 Jul 2021 09:58:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id h24sm8925600pjv.47.2021.07.16.09.58.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 09:58:19 -0700 (PDT)
Subject: Re: [PATCH for-6.2 08/34] target/arm: Fix VPT advance when ECI is
 non-zero
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d7551081-5ae5-0ff9-63ec-a491c5e1628b@linaro.org>
Date: Fri, 16 Jul 2021 09:58:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 6:37 AM, Peter Maydell wrote:
>       if (mask01 > 8) {
> -        /* high bit set, but not 0b1000: invert the relevant half of P0 */
> -        vpr ^= 0xff;
> +        if (eci == ECI_NONE) {
> +            /* high bit set, but not 0b1000: invert the relevant half of P0 */
> +            vpr ^= 0xff;
> +        } else if (eci == ECI_A0) {
> +            /* Invert only the beat 1 P0 bits, as we didn't execute beat 0 */
> +            vpr ^= 0xf0;
> +        } /* otherwise we didn't execute either beat 0 or beat 1 */
>       }
>       if (mask23 > 8) {
> -        /* high bit set, but not 0b1000: invert the relevant half of P0 */
> -        vpr ^= 0xff00;
> +        if (eci != ECI_A0A1A2 && eci != ECI_A0A1A2B0) {
> +            /* high bit set, but not 0b1000: invert the relevant half of P0 */
> +            vpr ^= 0xff00;
> +        } else {
> +            /* We didn't execute beat 2, only invert the beat 3 P0 bits */
> +            vpr ^= 0xf000;
> +        }
>       }

It might not be any cleaner, but I wondered if mve_eci_mask could help here.

   inv_mask = mve_eci_mask(...);
   if (mask01 <= 8) {
     inv_mask &= ~0xff;
   }
   if (mask23 <= 8) {
     inv_mask &= ~0xff00;
   }
   vpr ^= inv_mask;


r~

