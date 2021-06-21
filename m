Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A67573AEC2B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 17:17:57 +0200 (CEST)
Received: from localhost ([::1]:55720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvLgS-0002lz-N9
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 11:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvLeM-0001Io-Oe
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:15:49 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:41838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvLeL-0005fp-3B
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:15:46 -0400
Received: by mail-ej1-x636.google.com with SMTP id ho18so29425497ejc.8
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 08:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eum21gyszsyfYlpCgiO977+Jm+fkA3ZeW0aXf44dHI0=;
 b=ea3+xrHee33kGLTCcdK1/1C7DBkD1R6Aaqfu8RGcvDjPEdvrVVWOFFHGoOZNrKnkv1
 XuLvb9/5nFz17V+GHlHdYuoCh9JSD698cLw4OGCwNQruws7MATzfgOAFBI3B8mKzyUWm
 y80oPd245Av7i7TftpOlqhXLssgeZtvVc19km/HWWilVpHbD+7aBm7BwRkqtp0Zmz7Xz
 QMQUyFem5h3emtGQPogdqTNhr/8NvRRdVvqWuWJcvQDYa1bPjps7X+NXmM6Dr4wyWr1W
 Y9rF/yV9nrDhynCaMyzKYdOs7fg6I2zY2DefRBg5aB+TQn7Ntgeb4GYq8eTGm6swPjQ9
 u5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eum21gyszsyfYlpCgiO977+Jm+fkA3ZeW0aXf44dHI0=;
 b=gokGvozOf7r2wnQFgEdIp9GsnARDLtM+u1QdeC26U1xKBwQX40GvPQVBx3KqmoYB6r
 iDJIS3JqVrLGTzw/gnipe3OnwkHSnLNZcwbUQKBiKkxKycMR/AB299slKy7RUlFHheIf
 ebxxHffo5syGJYSWxlot4n4nP/jbgah0QZFqioQUHZaoQYTxmsM2a9092F4+oC5TFXDr
 uOj4IvQZUOMng8AIUtda13Por7Qxy4cs12BYnO3RDalZOQms7wGTumX29Z84Ar0BYifD
 o4NLNVKjd00Git7gSBIAbqXvxKx7a1XZnt6Hj96JSTKJFFC2ml1khQTISm3m7qlCNDOb
 dMxA==
X-Gm-Message-State: AOAM532Sf2TGYDw7Th8rCLZ0oFyhRD69OiDK1kXoiNgwFMiy4KK7jDTB
 mObEJbvQcrEF6CcrwKYZZWvTNcUI5pK1XtBCbye9vw==
X-Google-Smtp-Source: ABdhPJw0Tk392v3uo2uNw1qnwYLKKLSJ1CtxF0w+pxvpolH80V7IKR2fS3+DcWOt4Y1XmLWbM5DwBEMFEvS50n+abw8=
X-Received: by 2002:a17:907:98eb:: with SMTP id
 ke11mr23752673ejc.85.1624288543172; 
 Mon, 21 Jun 2021 08:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-24-richard.henderson@linaro.org>
In-Reply-To: <20210614083800.1166166-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 16:15:07 +0100
Message-ID: <CAFEAcA8D86nk_cLE7Zbyo68zndNjfNMO05nJjrSAfYneLUTe0Q@mail.gmail.com>
Subject: Re: [PATCH 23/28] target/i386: Improve bswap translation
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Jun 2021 at 09:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use a break instead of an ifdefed else.
> There's no need to move the values through s->T0.
> Remove TCG_BSWAP_IZ and the preceding zero-extension.
>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

