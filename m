Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA60034B85F
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Mar 2021 18:00:21 +0100 (CET)
Received: from localhost ([::1]:36002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQCIO-0004s5-0Y
	for lists+qemu-devel@lfdr.de; Sat, 27 Mar 2021 13:00:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lQCHA-0004RC-7g
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 12:59:04 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:41546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lQCH8-00082C-Rw
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 12:59:04 -0400
Received: by mail-ej1-x630.google.com with SMTP id u5so13062298ejn.8
 for <qemu-devel@nongnu.org>; Sat, 27 Mar 2021 09:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dj6BQiIDgRMe9rLWVFojxm/888cPPjfzb5Nu/iF9A/M=;
 b=SjKg+kDorJuXMdkqzic6DtoJWy2LLIeuX+5hZToRlmouiqDent8iMwCB7Mw/dZJS87
 ZOrML8DseKJlLYctz1qmhX79AtXzb5HSX/k//HOnyD2MGaOzQSRjCsfL5g7Px/rbZJLo
 J4sF6dXuIvGHUTgYLHUTYFu2OHotSHBP8lfrYjKHtGq8g2xDIeQlpFRvVzMs8yA+Ep/O
 yQMn6NTnkX6rXrwH1/f9reBoJUHmX+lekRCv7oJ4PGoDeu4UuC7/e08iTks8jNrPMZ3+
 eniicqvNvWCkDdHM9c7CeljpEOyga1aReHF7yYbVR1+C7bB6zBg72ssa34kYmkNTwktH
 LPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dj6BQiIDgRMe9rLWVFojxm/888cPPjfzb5Nu/iF9A/M=;
 b=AjWnTuns8FvO3EEAg5ZvHAhuPl8fZCzkXVAsuu/lmtdJRotr/Nuf9A3ViaGwscGW7+
 9vXz2zaAGyIQJ3t8r0RV88remV4mYYn1/808U52JljTDBydYYCKe3CPQ4DbRHeonwD3V
 1R1yxFJYmjRnpF/0EsUOnQ7CjG93+evHoUVmtNhhvW/WatQTeg9f+Yb1nA8yMFs0rUSq
 3fKW80jjBCbU1RIhi4oTJka0yQdBQ+JRl//aDGwe5rEG9iKjqzpYMmf5CwCD/zvC44q4
 RcuUQ0A2T2koc8x1H8hXOy2S87KRH3llNtNtdc9ps5fDH3D9Azy+Iai2+k/F8aPRWQOB
 X0/Q==
X-Gm-Message-State: AOAM530X1ZIMsqfaRjZQTQcUEmFv/4ScRMOcmxO8PbrhuAdi4zRioHRu
 IWObOqUKZ5iMJVN+LiHzyU6ryXk4Q+OYzgSBLpgU6g==
X-Google-Smtp-Source: ABdhPJypbpiI0H6AiODMidmytVy+zxX9fXAlAFdWwtDfV4NwObcLEExi23Vefx88Ba1DA+h8i+qYpDuycEjZ8iPuntE=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr21482178ejc.250.1616864340779; 
 Sat, 27 Mar 2021 09:59:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210327143452.1514392-1-f4bug@amsat.org>
In-Reply-To: <20210327143452.1514392-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 27 Mar 2021 16:58:30 +0000
Message-ID: <CAFEAcA8Ue2BcWy0RuOO7jbK-+gBjFMwXvugvAwUhLb1E9VfN8w@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] memory: Add 'priority' property setter
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Paolo Bonzini <pbonzini@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 27 Mar 2021 at 14:34, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The first patch is an old fix, it would be nice to get it
> merged eventually, but not a problem during years, so can
> also wait 6.1.
>
> The second patch add the memory_region_set_priority() helper
> useful to memory controller devices.
>
> The rest add the 'size'/'priority' object setters.

Do you have a series which makes use of these new APIs?

thanks
-- PMM

