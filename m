Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6342B613856
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:47:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opV7o-00075l-RW; Mon, 31 Oct 2022 09:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1opV6X-0006gI-5w
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:45:44 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1opV6V-0006ho-Hr
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:45:28 -0400
Received: by mail-pf1-x434.google.com with SMTP id m6so10761751pfb.0
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=m0frJ9pR2s7qSGbh2hXV3o6veMMw2yuc/M1weprAhOw=;
 b=HtkEjv4+ZtDglb4lLge9DZL8UktGjMxD/rIW05oPPB0LaiStIuKcIVg3RWpUALi9Ab
 aPhaCNinxlIfKxS+ElB9AtQ5L3IaegaI19Szb4p4HtORGCHNYtjYcyMwTdKNn5X2uxCy
 XFWsBfosBe/jRAJ7e/AqQOhD158y7pvAXKCw7A5kdccN6dvOueGUVjFPxe1VBwZsjEZT
 HqHHiw1q+eo7FzFPLwoMrGAUIERn1+B3iEdLqKPvgisVTYN3k+di4KojwoV0PPJZiLR/
 PBcKdBJvfIt5euofUH9s9ypiIhHvO0JFdtFF6e6KzCNTmpiiDe5/0EzOcNrQguq7SLev
 2lmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m0frJ9pR2s7qSGbh2hXV3o6veMMw2yuc/M1weprAhOw=;
 b=YhCwx9ndPF7tI8r3B+1T6AezW9veal2tjT3LEuu/YY4xM4azM1IY1NmqJAQWIIB74n
 tujAAPgc8CNwfbONb1C9IfdmjMpHmQO0H/r2F4iGR0J5Cb7/vLOwBEVr3ip2IXHv/4Er
 UJLFkmfIIwcD2cuoOui4l1C/5zS/L4Yu0FAl4yaTbKq9DaV3Xhbgs3bHP75IBzogDjq+
 rdx54qJVSf0hFmvWAZXZRCaoD3lA+CTRsXu5W2MQ6P7eMbAOuEzEITprQtAyT8CgKM18
 oXNrnhJ5ok+ddiat0WRZ0ZK3MP5W1/l24hvh0g/EAFLnE40hECRuIGy2qY2sq2IdU4X9
 euCg==
X-Gm-Message-State: ACrzQf3neFGhjBOMlrTqjgAnshTgqZ97SwCSzeWJG+HY15FrxSYfCOxh
 Kd5BG+DucHMzYpFD1NrRSJ3ke3z9xz7zaPDoZ7Fd/A==
X-Google-Smtp-Source: AMsMyM7i0ZsuTfbi5Z3OKCVQ0wSQTmGSHUuCGKwZ5F7ntXwiB4S3cpntq3XZB9gJdGod9hKxWzPmZ7uCfKeO/umbJBE=
X-Received: by 2002:a05:6a00:181b:b0:56b:fcbe:2e7f with SMTP id
 y27-20020a056a00181b00b0056bfcbe2e7fmr14546063pfa.3.1667223925777; Mon, 31
 Oct 2022 06:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221031054144.3574-1-richard.henderson@linaro.org>
In-Reply-To: <20221031054144.3574-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Oct 2022 13:45:14 +0000
Message-ID: <CAFEAcA_ms4-Zh7s01fcbMxrbj3Vr6LACODMP75PF+sf42HpRTA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Copy the entire vector in DO_ZIP
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Idan Horowitz <idan.horowitz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 31 Oct 2022 at 05:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With odd_ofs set, we weren't copying enough data.
>
> Fixes: 09eb6d7025d1 ("target/arm: Move sve zip high_ofs into simd_data")
> Reported-by: Idan Horowitz <idan.horowitz@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>



Applied to target-arm.next, thanks.

-- PMM

