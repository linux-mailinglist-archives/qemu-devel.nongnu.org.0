Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E408C632C5C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 19:52:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxBtM-0001fb-Vw; Mon, 21 Nov 2022 13:51:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxBtE-0001fH-KQ
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 13:51:35 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxBtC-0003hl-En
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 13:51:31 -0500
Received: by mail-pl1-x62e.google.com with SMTP id w23so11376250ply.12
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 10:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+gqg9TG50bDMqfB0ACiSQIAQxEIUXI3jUxpZy6N5zTA=;
 b=W/3tVZ0KFPbTG06zduCZG3T4v+u3Zj/8e1qWymByKC5aYWvMX0DfsGGvDXAujj0DU2
 In2gR9OqFdyHzDloYBSfJs5w/4xMlzRk2d06QX7Z0sDnLVKiFJ0E5aTar+I/QsSSMHZA
 Nshc440er4jdl+UBG3RO+OmHnpRFwRzbQ7ZpAHuN7AIrk3OlzzbF+ogV5oM6R9DhZYrT
 neupkFyuzQg6GOYWzHfVW6M28lDhpjoj7Eh+YUHwvf1ewqo9YyF1szqDFPRQR0u+8FRs
 yNGADrcsC9+ZrpSA1QKyhRxrnScDQNrW7XlyZgF6Lpz2Do5vAqfPvB6wDgTwc4VuL4gt
 lUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+gqg9TG50bDMqfB0ACiSQIAQxEIUXI3jUxpZy6N5zTA=;
 b=ZJtw6GyUDeMRt+E6Y9ZZt7LPILZkxSXroIiOX+BaViHtTzwxN2vJKnVPEdxNB2xRgt
 uGWVr1BCMSG6+d8+v74aTaS0aEDwQvBFiTo7/PabwI7xy70+aEPxI/vWz10G8YMyLGm+
 V84HV7PxzoDtFaT/lL3Qa4+abIdWE+VNFeXFOMC7iyiH2Sjvy7j3vNc9PR0Jb/XavwVP
 YjYcdnWOGQ4BndYl8vWjjDnnNpHTToNzwgWAW8vqE1hSqSRncwQemdBnI0JHEp5rl6XO
 q9IzQ0TZyIJKrFAxBkm2a2+bKr5m6Ajh+upRdBYTMxHiSy6ygvZC8fGmO3CKaGJ99iZg
 iImA==
X-Gm-Message-State: ANoB5pla7xMKxykDnBTkPXDgAAvZVUz8H/6Ja7J1iYjpHlB10UIfvlbT
 iJ3LQlsvw2ZwObMPsMkbZObDH+/H+DwDf7wD5vZ8wg==
X-Google-Smtp-Source: AA0mqf7RGs29697DjA3EzRXnTFFVAnVNCeLU3AcJVGdHnG8snahv54+HceZfdNT/tn3IJKBl/lNcGsXr62lWniXWRZc=
X-Received: by 2002:a17:90a:7004:b0:218:8757:8f2b with SMTP id
 f4-20020a17090a700400b0021887578f2bmr16658862pjk.221.1669056688685; Mon, 21
 Nov 2022 10:51:28 -0800 (PST)
MIME-Version: 1.0
References: <20221121174326.68520-1-ardb@kernel.org>
In-Reply-To: <20221121174326.68520-1-ardb@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Nov 2022 18:51:17 +0000
Message-ID: <CAFEAcA_Tz1an8cJO_6kDozMQ1kpqzu60gKq+c4Rj1veFz0REpg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Use signed quantity to represent VMSAv8-64
 translation level
To: Ard Biesheuvel <ardb@kernel.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62e.google.com
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

On Mon, 21 Nov 2022 at 17:43, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> The LPA2 extension implements 52-bit virtual addressing for 4k and 16k
> translation granules, and for the former, this means an additional level
> of translation is needed. This means we start counting at -1 instead of
> 0 when doing a walk, and so 'level' is now a signed quantity, and should
> be typed as such. So turn it from uint32_t into int32_t.
>

Does this cause any visible wrong behaviour, or is it just
a cleanup thing ?

thanks
-- PMM

