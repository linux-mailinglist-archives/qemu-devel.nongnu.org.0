Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2E953E45D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 14:29:46 +0200 (CEST)
Received: from localhost ([::1]:60622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyBrd-0006y4-Gr
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 08:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyBlj-0002K3-JM
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:23:39 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:37879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyBlh-0000mV-1Z
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:23:39 -0400
Received: by mail-yb1-xb32.google.com with SMTP id u3so15665391ybi.4
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 05:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1DC6FRY2ZMdbfLfbhhSMUisD9rsaznFOfRvb1p4vpdc=;
 b=vIhNAk0FZacjr6OcFzJZuAQ2wsYjVjEN6PVlGproOexgnjH0Mzklgg5C5qcJ3hWpH4
 ElCVgV0djZY8jCvApMiWwOHrH8t76icjbMotNoTduTX0iF5lqEolLHbQiQf2psGQYbNU
 sW9XEntk8xB5zhyL0ueI3jPUg862V6oZoE8OvcxxyHeuY7mQaMBjdgWKUNZ3TZMKg5j/
 vneGMi7tiK5Hi+vN7t4fuvyWu2AAzlVrHHEgjFwVlktu08/3qt+z/Jwp5aBerhL4WRxy
 7Y6pefZcN0qYMAXfaFoLr3cgfG7zi4kz676x1rQ/vzn1Y/v4WQKT1nWEXLkaiUnEYDVy
 pt/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1DC6FRY2ZMdbfLfbhhSMUisD9rsaznFOfRvb1p4vpdc=;
 b=Et6fBnseyJFVsNb5wR+yAtgepOp8DIQhBrg3nh9o4Zju7qBsskH8SqTQpKEeFb9gzI
 Jlfh7FnlsHaEtyxjLYVbR4SiIh9fgie3eAPMWQpo4YIFg+dov9LuoCtgheAr2BJ/kJgl
 U4Aj2/uYmmJ0dFDGs2H4GmktXFL3XL2HbVJ248CyxGLXpF9IysETR6XoB7EwsRIUMTWA
 2du8HpUHeXDrYWnRikynEv/ajjCHsR6B+Zw0GP2Di9DkxBdx/Xib6HEYFMnHfPps9wt+
 foh4EincZrLHz+EySwTGPIvWhZdUspuYWIWbs5HT4+7LFaj0n271O9V0vDMmBQjdha7G
 JfpQ==
X-Gm-Message-State: AOAM532TKbWV2QTilx4Zo2kdMPNZg5NrKotA1MG+6QNtceZw+QrvbRhT
 0ztUaZUfbgiJ01Xl8aY7JVjHHqefpNAWMnxu72Emew==
X-Google-Smtp-Source: ABdhPJw05AeibRqlEvwn52Qre3S+LZi+75X/rYYPEo9XSDDPtW6gB2p5BN+nAxeK0jWy90E39wqrfWq6pLx5xzoiMmU=
X-Received: by 2002:a05:6902:728:b0:663:5591:aa2c with SMTP id
 l8-20020a056902072800b006635591aa2cmr9733673ybt.288.1654518215985; Mon, 06
 Jun 2022 05:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-5-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 13:23:25 +0100
Message-ID: <CAFEAcA_wBqtJxkgMYqGnxs2TKrLFMz-xi9oG0QcjwmL_HCi=Aw@mail.gmail.com>
Subject: Re: [PATCH 04/71] target/arm: Remove fp checks from sve_exception_el
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 Jun 2022 at 22:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of checking these bits in fp_exception_el and
> also in sve_exception_el, document that we must compare
> the results.  The only place where we have not already
> checked that FP EL is zero is in rebuild_hflags_a64.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

