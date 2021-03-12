Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 281E1338D63
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 13:47:36 +0100 (CET)
Received: from localhost ([::1]:50166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKhCY-0006CI-Sj
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 07:47:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKh9e-0004Y4-Bk
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 07:44:34 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:45596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKh9Z-0003qF-5D
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 07:44:34 -0500
Received: by mail-ej1-x635.google.com with SMTP id mm21so53033010ejb.12
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 04:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=95jfuNOZfztYyEUpdxbTtvXx7P4QjryGzam85CUFeQU=;
 b=inbwutkD+Uv3IFqxwT3oH/0lLTR1ao1VFFDU4riNU2UjkIxXaBdhMKwLsbXeNFE07v
 BEGXSInhpuwm2Xqi5+11ewNtRPoIXxCfAnhT8ZP+YHzFmYJTHIWkXWSkKqkZ+Z4hyDt8
 DJBhTTLgCwdEh2fqn+7F0HSOThuwjVPrgzKjTL8bKijskh4zLshYWL8R4rT38aoC0nW1
 ze1FAvNS1wlUjtNTOARMPsHpopgJVf2elCGdJOy2m2xQlfcJTCMwcl4FMnbGqrPybcTO
 EhRKFbnJh72fcW1TssVMoiUM5HGCNBDXMZNHy/4K3ZSw11gxGq1ppkOBPZMrNirvW2qT
 qoBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=95jfuNOZfztYyEUpdxbTtvXx7P4QjryGzam85CUFeQU=;
 b=MmgVENqhNgT+P7e86agBs4FrXZggrqTlz5uBXaKoyu3HegVL/BlAH8FsAWEjEoNgme
 mJsWnvm16dBAx16npl+wV5DdWiRmQffvuBml+URK/29LjX3Gw8R5FQbuNBvsrm68zOzG
 rVFSCCCqIuwtcNVnvRcBejKAXYUsuiKm+tDPXmr0dCR6SpWZ8qz89l92zCr8J1QYlJA8
 R5JIhpvw3skdVkiq+jdp6aA1Oupwspt7Z34K6oYtNnkQxAztQKYyUWJO4vbDJnR+OoDp
 fwvSMv5BRULs12jk5yIaOhrueRy2UAynCyWtgDJHIXl4qKEm8LjMErq//uR3SXyj4YiX
 o23Q==
X-Gm-Message-State: AOAM533Q+TYPzsk06VxAXowFs0k/LjRNvfR9iHSS6ueUnx3Cy2Sqlv1S
 6J7ljUuJOR87I+mvR0VItGMacVjfXig1n3ePJwG8pA==
X-Google-Smtp-Source: ABdhPJwQUvPE7+LyNiGHm1vf14TS3cqMh6mCkb7FBIOAi8tS1QieCWFhvmQV3LHG7VlHH9JOIctKEbERxXzdob+1yDk=
X-Received: by 2002:a17:907:10ce:: with SMTP id
 rv14mr8474230ejb.56.1615553065995; 
 Fri, 12 Mar 2021 04:44:25 -0800 (PST)
MIME-Version: 1.0
References: <20210312001845.1562670-1-f4bug@amsat.org>
In-Reply-To: <20210312001845.1562670-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Mar 2021 12:44:07 +0000
Message-ID: <CAFEAcA8FsxO01NQntu8XVQb2w-0Scjpxv2Lxg-p=dKsNvc_9Vw@mail.gmail.com>
Subject: Re: [PATCH] hw/timer/sse-timer: Propagate eventual error in
 sse_timer_realize()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Mar 2021 at 00:18, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> If the SSECounter link is absent, we set an error message
> in sse_timer_realize() but forgot to propagate this error.
> Add the missing 'return'.
>
> Fixes: CID 1450755 (Null pointer dereferences)
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/timer/sse-timer.c | 1 +
>  1 file changed, 1 insertion(+)



Applied to target-arm.next, thanks.

-- PMM

