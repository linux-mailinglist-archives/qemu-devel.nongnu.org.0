Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F97E301591
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 14:54:12 +0100 (CET)
Received: from localhost ([::1]:46544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3JMh-0006hw-Jv
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 08:54:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l3JLk-0006A9-EW
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 08:53:12 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:37814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l3JLh-00049B-W7
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 08:53:12 -0500
Received: by mail-ej1-x62e.google.com with SMTP id kg20so11203838ejc.4
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 05:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vgYY/aBSxYWmJUdTMmRz+eJ5RIoKbDSVQOWQcDWn5aA=;
 b=hR4sFk8avLuivjMExonKw7Oc6kGHoqiHk5FFrTN5ZVdK3TKBbQemCGe9QoPzQQol0H
 EWwMspiFKCp346JmF3wFB03JPx7YsNypQXl1mJQICGTBfDOYT+uxwp9j2+rKPAj6TOX1
 7N5fPgonthB04v63O+Zo8QZPcD4Af6xM0btrwtjvflQa9LEn2eVy4eAgKpt0TYsQnzX1
 Z3ckwZnkivvIoNgk9Jd/l9pZHmpPmQiRFTjolIYZ1qIb95aIKvwMaot5Vn8nTj0Tbzu0
 a7teic5tVswP//DfI5lteXAuOzxo2i4oJDpdf/w0CJ3tAbQPWSU/VicvZX2u1RUJOeMx
 Noqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vgYY/aBSxYWmJUdTMmRz+eJ5RIoKbDSVQOWQcDWn5aA=;
 b=qmd5AkIDrGkS3AINa/IX4dNBb6vnGzCuC3gm5sFDGzmp2KwnLQTOSuean/7EKdN9b/
 2BrzUfQH1ARPQbWUCW31HTv0hNABPPD7vNau+tQoOk85NUvnAVlsczkqTMPkmEWlysSH
 hLKRLGOxsMxi2gBZ7VUWRWK0741+OiiJrKC0Zq6izl27DO+P2oYLlVcPRpTsbkTfNdR+
 SaVYPptpMxkNVTbb7+KRU3vAUECpX7Q8KwA9jxzwQ0cd2o1bowo+/fP5R5eAjWFhqBVj
 FI4x5KB+/KWL7LqA4CpANBrJocnJUlwtJ0AH3j40QE6j0bMeJuUzug/J2MABuTMC7wC1
 qWOw==
X-Gm-Message-State: AOAM531KsbGv2KpP9wepwbrjueWIupcAj9cqjHzZyhwywyTQAScaYoUQ
 zacKXlqL+P7H/xbJULtTj4TOw+a6Lmu2Mzxs2tqdSA==
X-Google-Smtp-Source: ABdhPJyQmnDvFPzkOCBpr5DCmtr3LEYjJ7mlyO1slbuAjuK/5sdeLNzCBEH0RLjQH+hPVSZUQ/ZqI0amlfPGyuH0JAE=
X-Received: by 2002:a17:906:3d4a:: with SMTP id
 q10mr997743ejf.85.1611409988123; 
 Sat, 23 Jan 2021 05:53:08 -0800 (PST)
MIME-Version: 1.0
References: <20210123045632.18482-1-j@getutm.app>
 <20210123045632.18482-10-j@getutm.app>
In-Reply-To: <20210123045632.18482-10-j@getutm.app>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 23 Jan 2021 13:52:57 +0000
Message-ID: <CAFEAcA-nxjUifZ8yb85KGAFnwwa10ZAdemxyH5YnetNLhVt8cA@mail.gmail.com>
Subject: Re: [PATCH v8 09/11] block: check availablity for preadv/pwritev on
 mac
To: Joelle van Dyne <j@getutm.app>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "open list:raw" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 23 Jan 2021 at 05:03, Joelle van Dyne <j@getutm.app> wrote:
>
> macOS 11/iOS 14 added preadv/pwritev APIs. Due to weak linking, configure
> will succeed with CONFIG_PREADV even when targeting a lower OS version.
> We therefore need to check at run time if we can actually use these APIs.

If you make the preadv check be a meson.build has_function()
test, I think (but have not tested) that it ought to correctly
fail the link in the targeting-lower-OS-version case, because
meson.build's has_function() implementation for clang
https://github.com/mesonbuild/meson/blob/bad0e95caec4cf49165572df3cf2edc4832280fa/mesonbuild/compilers/mixins/clang.py#L89
adds -Wl,-no-weak-imports when it's building the test-case
exactly to force that linker visibility obeys the minimum
version targets for OSX.

If that works I think it would be neater than delaying the
check to runtime (and it would also mean another test moved
out of configure and into meson.build, which is the direction
we're heading anyway).

thanks
-- PMM

