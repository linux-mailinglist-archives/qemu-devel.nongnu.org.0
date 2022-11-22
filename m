Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DA2634104
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 17:11:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxVrp-0003Lk-Ad; Tue, 22 Nov 2022 11:11:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxVrY-0003KH-U3
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 11:11:09 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxVrT-0007Jb-3H
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 11:11:08 -0500
Received: by mail-pf1-x42a.google.com with SMTP id c203so14776228pfc.11
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 08:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4BgJSr+/VND+4QGRXrF4Dy4+4jwhkyEQ5zaF17WGIrk=;
 b=Z1d6gpT/RzTJQNTbs7pQ62Qzb5XV16hVAHDsTy98OKHsN0TRQOpbeqTkDU0VM6aguc
 FaWovddMg+MUhb4hx6nxxkePRUE0Y1NxoVllGb2keyXyf37eivNh9MN2ViNpp0IdD2jP
 KOgxE4y3oLj8B1mWSslgi6FmqfKPAUarIGiGsntEGrmdvXzltc79bHVVIuiETP2WwENB
 Vkwn3HRYqOgppr3LtSZU/CAVUlm89RW1EiT0Wgfzt6OMb48zlxEAHYGKEjoPliAZ6v5Q
 h8kQW/HkHFxUxforsnc2nxBvau9fAGXGb/aFXNZGccGnSuNZTBwQXNMaxAuqAPGWjuzy
 /bNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4BgJSr+/VND+4QGRXrF4Dy4+4jwhkyEQ5zaF17WGIrk=;
 b=HzgzLd257aHwcH7Pk7q9r5AqVH7kYgbk8Bx8PYCDR0bKKUjkVfyTwGv38FnRys8Cb9
 98G6AMv7BrhhnSQQrpohXL15/uIWyGltpYcIqmjX9npis4l++lhpYw30r25yoo4vZEuc
 dKFlcZ7hwHjZqUWVAkxEh60lpQKx346Z/L72n5444pk24BpcQypRBp7A+r8q7A3iTbTC
 CqXYjb9PhEMDMndo8QwJEG+H697oZl3EFoPo0tXpMv2YAn7u0p90mSPamtLN0TNDgN+T
 9ihmX8CIv76acMLnqLncxRHT6ZGcySZ8x6OHLVsmZ8qlqxVtbrgP8Yqdl21jQl7je/JT
 Gpsw==
X-Gm-Message-State: ANoB5pkbPbx4s/cxQRT13WZuMYEPBwL+OvEOdUmSkD8e2GIk9Wb8xWRl
 3ZWveB6+AMFjhIK0zc/BcYPB5YO4mD3cSgW7oy19ig==
X-Google-Smtp-Source: AA0mqf5LtMReA6gwN8dUK1Q6RNaRuthEPnFI199RLOnwd3koAD0KmR+zxOZeiHR7hCBrP/9UMCIAdJAvNuDe+jHobFc=
X-Received: by 2002:a62:5f81:0:b0:56b:bb06:7dd5 with SMTP id
 t123-20020a625f81000000b0056bbb067dd5mr5185287pfb.3.1669133461530; Tue, 22
 Nov 2022 08:11:01 -0800 (PST)
MIME-Version: 1.0
References: <20221122155515.2426188-1-ardb@kernel.org>
In-Reply-To: <20221122155515.2426188-1-ardb@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Nov 2022 16:10:50 +0000
Message-ID: <CAFEAcA--5wekm0w5Le+xqOm5rLR1=vtcK44PR9kyXBU0BVqX+w@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Use signed quantity to represent VMSAv8-64
 translation level
To: Ard Biesheuvel <ardb@kernel.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 22 Nov 2022 at 15:55, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> The LPA2 extension implements 52-bit virtual addressing for 4k and 16k
> translation granules, and for the former, this means an additional level
> of translation is needed. This means we start counting at -1 instead of
> 0 when doing a walk, and so 'level' is now a signed quantity, and should
> be typed as such. So turn it from uint32_t into int32_t.
>
> This avoids a level of -1 getting misinterpreted as being >=3D 3, and
> terminating a page table walk prematurely with a bogus output address.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>



Applied to target-arm.next for 7.2, thanks.

-- PMM

