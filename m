Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F0E18FCFA
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Mar 2020 19:46:42 +0100 (CET)
Received: from localhost ([::1]:38436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGS5x-0004xV-D7
	for lists+qemu-devel@lfdr.de; Mon, 23 Mar 2020 14:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37056)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jGS3x-0003Op-HJ
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 14:44:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jGS3w-0003vI-2y
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 14:44:36 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:44894)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jGS3v-0003up-Rf
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 14:44:36 -0400
Received: by mail-pf1-x442.google.com with SMTP id b72so7916589pfb.11
 for <qemu-devel@nongnu.org>; Mon, 23 Mar 2020 11:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Zu1HzY3aEP2K2cAbQ8V3zxh8z4+CS8uVqTPxmTq4MhI=;
 b=X5mJe48f8ChUHa2asCEWjZmC1IXYoskxXyCP1FOs7boDLks2wUSggDI/Py2yl/5Rw5
 8JPl0l4iVY02qV/NbTiV9HeF07BkjSyNv+ZnunX4TYFTnov+XkWX8cFyQcuXWvN1VV97
 3gEs+SP4uNu32E/+Yb+pY0iqCDjuunH2T9+7JiwtVZqmYaHnMV4beZ07z+r4l6mGStgX
 igrmQrLeuF9yI4zj2wCpcb5xqM6fe63Fph5nQYpEj2hsK6IiP0DSHyb1vYYcHmP9SBNK
 EBx9ZvcRAld3/FJkda+AR9/pfx7ww7f1Zh3biGLSq0OWpmeIzGsAz5VSnb5iZ0Hmil0k
 TVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zu1HzY3aEP2K2cAbQ8V3zxh8z4+CS8uVqTPxmTq4MhI=;
 b=Im2BrI8STss7SchizSDSF6wssltz4ZUr0JCKhRj/kkaf+kasW28prbSiYBywD7pvnn
 VOcSUfx58ImOkhSpHn7N562h9WkmTda0XMqrHklo6uEi44R0OaR/0xzozT0zNYnh/qBZ
 Y29GlNfMBIO6fSENKYXhArdw8FzBekcE4Kypg9Y40QbOe+XSAlDYiUqglz51f+qbuAJf
 IYBZoOM9j8QRaPsNd75qB6jWB6MkHy704jogHH6Y25vgrJF1lKWgM6h3364qLIpbdBAO
 JOyGbva4CAYKTKXbKojUoDH8nta1CvEuZjJ9HBP0QCM4ySNp/PCO1QVMH+gdk6jtRb4i
 3mIQ==
X-Gm-Message-State: ANhLgQ0QrfYAf5tDoBUJ2lwyRRKXhYBszF87ZZ2DIyTYakZsDTsVMr+y
 kQCtySHngNx2T85eS7lcDQGvhQ==
X-Google-Smtp-Source: ADFU+vtETzSKrEPRc44NzF58yTc0/LcV9YO9ywrmtJArWQzjCPKGRkivSMaWz7Wbmm6rf8KAKvWc2Q==
X-Received: by 2002:a05:6a00:8d:: with SMTP id
 c13mr26545393pfj.68.1584989074696; 
 Mon, 23 Mar 2020 11:44:34 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 j1sm14026922pfg.64.2020.03.23.11.44.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2020 11:44:34 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] target/arm: kvm: Handle potential issue with dabt
 injection
To: Beata Michalska <beata.michalska@linaro.org>, qemu-devel@nongnu.org
References: <20200323113227.3169-1-beata.michalska@linaro.org>
 <20200323113227.3169-3-beata.michalska@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fdf4d6f2-ecab-6358-9f74-480f1fa6fdef@linaro.org>
Date: Mon, 23 Mar 2020 11:44:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200323113227.3169-3-beata.michalska@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, Christoffer.Dall@arm.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/20 4:32 AM, Beata Michalska wrote:
>      uint8_t ext_dabt_pending; /* Request for injecting ext DABT */
> +    uint8_t ext_dabt_raised; /* Tracking/verifying injection of ext DABT */

Is there a reason these are uint8_t and not bool?


r~

