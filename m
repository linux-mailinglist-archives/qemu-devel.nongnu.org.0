Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4141430C604
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:37:21 +0100 (CET)
Received: from localhost ([::1]:53824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6yg4-0003dU-AC
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:37:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6yJm-0001go-VP
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:14:18 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:43167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6yJj-0002MT-9D
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:14:18 -0500
Received: by mail-ej1-x632.google.com with SMTP id y9so9219579ejp.10
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 08:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+w43zbTSLJBu7VWWaaLBzSOwZdWeRWvOnn+bi1MmeVk=;
 b=c/iUXsKFuYi6AQZEDZsSpBt0Jblyc8p3Ts7gED83JodKFbqatk9vRbNI5pL71iKpcX
 gtQ2giehUihl5luiN/nG197Iv7Dk9ol7gK2CtAISZoYl3PVZ4pkgc0qQbnIIIxHskvmv
 DE4MQsg1GZ3+4QMQ0wziOEn+Kykgqe3A23A625DNxzgy4HIbROm3mSONtwWrSYg9dLA2
 vE9UYHIj3h0MoMUbLcnFQrC5q246DjmLPa8C+O1Dh9mD7E0zcHFBJNWp0NE4ZjaH3afE
 d8bHYxT2PqtwatXqaWQUh8TABLS3KueP1xvkg6fGNgQ56+nnoY7rWwuMKgtF2+dJWhUe
 I5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+w43zbTSLJBu7VWWaaLBzSOwZdWeRWvOnn+bi1MmeVk=;
 b=Jj9lo1p8Y61qwclRnQxHmE3yFHtvpetXuFm52QxQrA4XCjjxB/iWDhDNiQJmSNXyng
 PRYJMzo1y3cRas/lQJYhsPNrUKpwBZoly3/NyeHW9ZwKpSk6dLQCMbIpJoG0w7fkwEYH
 2W+gXZWvuiRFuK0xeZIBVcrtool34rnSkcPiw/S38xfJa4/mXFg/Vdu+qgLKy3Ionik9
 T0SBmtOp5oRENOqxBQb53VF8FroRA170NNeXh7GfHGbHESz3C1+yxVtjITWwIugqYYPG
 RO7kJFhyBuy2j18q1qmVbXrrpa4hOACFt6l1dNPh6nHLC2ZYYrkAg27NaL4fimNT3NRy
 ALrQ==
X-Gm-Message-State: AOAM5333cDUv8htS82dBaQFQ1PhMlQByx5HRmsFwbHKc2Id0c8Ic5/OJ
 av6BXb+2gYob6DcS0l2Ka6AZZrxTkcuiLoAxfmhZHA==
X-Google-Smtp-Source: ABdhPJxA42KbebMiyA/AOMiih0lYNRoZa/NiydykWU7ksBwUNHW1uwX/O+P2cU3RU82pHwwDg71Fg9ONaKyoh/TnQCU=
X-Received: by 2002:a17:907:1b10:: with SMTP id
 mp16mr23157728ejc.482.1612282453767; 
 Tue, 02 Feb 2021 08:14:13 -0800 (PST)
MIME-Version: 1.0
References: <20210131164406.349825-1-f4bug@amsat.org>
 <20210131164406.349825-4-f4bug@amsat.org>
In-Reply-To: <20210131164406.349825-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 16:14:02 +0000
Message-ID: <CAFEAcA9bSzUfrYWjHPoG-jh2yS16U2DYP+gWRqfV+86XLuw3og@mail.gmail.com>
Subject: Re: [PATCH 3/5] target/arm: Restrict v8M IDAU to TCG
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 31 Jan 2021 at 16:44, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> IDAU is specific to M-profile. KVM only supports A-profile.
> Restrict this interface to TCG, as it is pointless (and
> confusing) on a KVM-only build.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

