Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5C02B0913
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 16:57:09 +0100 (CET)
Received: from localhost ([::1]:60600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdEyC-0001Vl-TZ
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 10:57:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdExI-00012M-Cn
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:56:12 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:33104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdExG-00072Z-MS
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:56:12 -0500
Received: by mail-ed1-x52d.google.com with SMTP id v4so6867660edi.0
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 07:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uqDfJIrcx3h2+XminX0o1oWVMXhlBzSRquyeeTroQiY=;
 b=Ph5bc23UwAmWyYQZvNRGD8fsjXp9EtmunamoVwax6ge5KAj0+woOevjixDu7N58OqF
 2WueJ5t9F8sm4+li0HX2QPgsDFFBaKFzUl6EebSg8NfrSogVvsm/rMEmWBDwledDBFYT
 j9ul6rAZY10lJLnl1cQEOSsOti8ggVoPYcIdD39LfcfcT1osZJJZerm0yeIf2t92pbsG
 z1AY5ao4PmkAY7mk23tcut2c1F7/pSHGhhDruRz3MrTytPg6Hf48ztjHxtNyMzFrl4Ql
 xBgiuDw9j6FRrA7pwtK5zWgI4TfxZFfHS21Xr9BrFpPxlPbprthZ/baWgeWn3cN2LS62
 6PNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uqDfJIrcx3h2+XminX0o1oWVMXhlBzSRquyeeTroQiY=;
 b=tbquMhPRyyDeNopIouPD4FLlb5OHwO+n6M6JaIffot2m7FutaY5/gyP3crq5Y6qt5S
 yb2ooOWNK4wZCVN35kkJtJAHTVyhQyUzlqP+4pwRZj/G/1Ujk4LU+79fWZypPg//MfuW
 mQ1SUVD2XhSr1EoKa1S1XW+7CXksoA6maBpfxZLz1mGD6hZUFqkcoK++hT2WS1cAznZi
 ju/VcdHo7+Dn7bwXcb65OHRhGfQTTo0Xe1gZx3kC3NZt8n+cOxUpfhXJry3g0hIsJVQe
 D0Phri7pnMJBgE91nsJ2AAOO4Bw1lwhfLLfJgedrLloCpDAbk0mij31wcni+bMCydKvr
 i/qg==
X-Gm-Message-State: AOAM533X9lW8Bl6rZvza3gCQ+WvXJdZzTqBA8wtWnr6P4CaPTp6bVYQQ
 IZsA8r9+N6WU47ED8uTjKwB7soWzRhUFdR6QihBTmQ==
X-Google-Smtp-Source: ABdhPJz1bqtbFdyqhKBrVAashUHs3mwEfdk0Se8E4bvx7d/r+xuVeLiKdvG2apnamKznObh21qIg3PiuhAEPgtNSHVU=
X-Received: by 2002:aa7:d3cc:: with SMTP id o12mr458918edr.36.1605196569058;
 Thu, 12 Nov 2020 07:56:09 -0800 (PST)
MIME-Version: 1.0
References: <20201101215755.2021421-1-f4bug@amsat.org>
In-Reply-To: <20201101215755.2021421-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Nov 2020 15:55:57 +0000
Message-ID: <CAFEAcA8XzpwtFfKd9DvJKu=5NUoM6sZSxo7f+xjJroS=EVVAEA@mail.gmail.com>
Subject: Re: [PATCH-for-5.2 v3] util/cutils: Fix Coverity array overrun in
 freq_to_str()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Luc Michel <luc@lmichel.fr>, Eduardo Habkost <ehabkost@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 1 Nov 2020 at 21:57, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Fix Coverity CID 1435957:  Memory - illegal accesses (OVERRUN):
>
> >>> Overrunning array "suffixes" of 7 8-byte elements at element
>     index 7 (byte offset 63) using index "idx" (which evaluates to 7).
>
> Note, the biggest input value freq_to_str() can accept is UINT64_MAX,
> which is ~18.446 EHz, less than 1000 EHz.
>
> Reported-by: Eduardo Habkost <ehabkost@redhat.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> v3: Follow Peter's suggestion

Since nobody else has picked this up I'll take it via
target-arm.next.

thanks
-- PMM

