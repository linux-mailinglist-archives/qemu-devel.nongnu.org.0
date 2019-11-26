Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0941910A5C7
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Nov 2019 22:07:39 +0100 (CET)
Received: from localhost ([::1]:59020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZi3d-0006Cd-AK
	for lists+qemu-devel@lfdr.de; Tue, 26 Nov 2019 16:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46490)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iZi1A-0004gk-0a
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 16:05:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iZi0X-0004L6-F1
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 16:04:26 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:36792)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iZi0T-0004EV-Sj
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 16:04:23 -0500
Received: by mail-wr1-x441.google.com with SMTP id z3so24133586wru.3
 for <qemu-devel@nongnu.org>; Tue, 26 Nov 2019 13:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VG2sMJBPHsAoU1EbZvezAk3PWquynbkCLDavk/F1YHo=;
 b=HGZn8gSyFXLXl2BVdGssmwXR8j7ZAp0UHP2iRsTIxjOiuONp0DFliudxAP2TgK/NKX
 uN6M2jbfQC7ohD8OqV0mQFWQMIoZ50MI6zjAC7ZApbU2PKKG6CMVsC0EC8nurX7a4rza
 wZD1YF68yJMkpE76hDef/RlPXiOii9k463cW0R1BQOfADH7SLZ2yc7QPcosc3H+xAI9V
 +qL+67TVWTDQ1kKyVI0zzVe0Fd0RkJH0vMQKEOUBvD6HHs9Tkrp1WMrKkDQVjzw6/zpQ
 Xc4D0yKf7nod2C55O8lXm4ah6uCciLbAIpV4ENnowBFOjodlBS0nhT22tB7AceAa1P3M
 XMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VG2sMJBPHsAoU1EbZvezAk3PWquynbkCLDavk/F1YHo=;
 b=qNNSaON/izISY50v6a9p9PqIowKV/F7zWhacXsfLO63curR/9EAkX35ggWQoVKlDwj
 I34ij0XOmoid1K0mcehji80p5Ez9H7jLnADc+dGBqgOCA46osaxc4zDIRZXtlviRNdIm
 b4Y1+7TBoLlFnYW8AxR3OnQPR3nu99HjfcZUjTI2aiAll3XrLM0EOlCU1wU5trRtETCS
 C8BtJVSu0vkuP+9mJSO1jII4m3i4YPezK3G9Azwc2krjY4LOiOyfWGEe2cbZiI18gLIj
 g8Tcgce10eGfO39JD7OzrQPoMJZWYurMjyuoB23jteFRmgqTz6B8heqS6GYHGWp5uEYd
 9NTw==
X-Gm-Message-State: APjAAAWN3eT5E2aiQesxSKba3ex9+yucU5nj7zCH0+HHotwjzXWuDtmA
 a9dDzHtIM7jjqBjOzKWTczO8fw==
X-Google-Smtp-Source: APXvYqy/Yqa8VJhKBH3hw7SPfLL6si1o4j+uigjdVcBxp0SKi21vOlr8cF8QsNxXJ70EgtKFLN9+jQ==
X-Received: by 2002:adf:eb42:: with SMTP id u2mr21407807wrn.173.1574802259359; 
 Tue, 26 Nov 2019 13:04:19 -0800 (PST)
Received: from [192.168.1.136] ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v9sm15285628wrs.95.2019.11.26.13.04.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Nov 2019 13:04:18 -0800 (PST)
Subject: Re: [PATCH] target/arm: Honor HCR_EL2.TID3 trapping requirements
To: Marc Zyngier <maz@kernel.org>, qemu-devel@nongnu.org
References: <20191123115618.29230-1-maz@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <11f7be55-a53d-bab1-c2e6-edbca1abb554@linaro.org>
Date: Tue, 26 Nov 2019 21:04:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191123115618.29230-1-maz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/19 11:56 AM, Marc Zyngier wrote:
> HCR_EL2.TID3 mandates that access from EL1 to a long list of id
> registers traps to EL2, and QEMU has so far ignored this requirement.
> 
> This breaks (among other things) KVM guests that have PtrAuth enabled,
> while the hypervisor doesn't want to expose the feature to its guest.
> To achieve this, KVM traps the ID registers (ID_AA64ISAR1_EL1 in this
> case), and masks out the unsupported feature.
> 
> QEMU not honoring the trap request means that the guest observes
> that the feature is present in the HW, starts using it, and dies
> a horrible death when KVM injects an UNDEF, because the feature
> *really* isn't supported.
> 
> Do the right thing by trapping to EL2 if HCR_EL2.TID3 is set.
> 
> Reported-by: Will Deacon <will@kernel.org>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
> There is a number of other trap bits missing (TID[0-2], for example),
> but this at least gets a mainline Linux going with cpu=max.

BTW, Peter, this appears to have been the bug that was causing me so many
problems on my VHE branch.  Probably *exactly* this bug wrt ptrauth, since that
would also be included with -cpu max.

I am now able to boot a kvm guest kernel to the point of the no rootfs panic,
which I wasn't before.

I can only think that I mis-identified the true cause in Lyon.

Anyway, thanks Marc!


r~

