Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6564F513022
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 11:48:37 +0200 (CEST)
Received: from localhost ([::1]:38234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk0lH-0001Rq-RI
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 05:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0d6-0004wF-12
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:40:08 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:36384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0d4-00074b-FD
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:40:07 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id f38so8010660ybi.3
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 02:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+RazEXZ5ZnwHXU/LQ+zhvx1Vn4ZeCaCRassTJ/KRCKM=;
 b=x0XUf/hQfxr0fpyGErqYC/rDAwcalwoq2BBIg4c1HuMUxcgVS+l+OS6hP5AjCvXfvt
 WEsG5NuVnk1j63iBNAMhmpquobLj/w0Rqc3iFSWo659o6VVDnzqT31jAuK4IfUxoS9Vn
 lQsmIo0gzNO1XQtHE3+V36a7Qx2iwcnCs38cuivnyx7vuW/lakCEmKTMCycx687V0Xal
 bI+riiPBcJzcTfccvJ82ZcRXsbBl71Ab/gl5eFooHmWbEqdWzLns08vMufWznTMvzBNq
 exvqSgbTYh6vWCs6bNxNKOIP1zgzc+g2hbxgBpF5+A2ZvEwiXdhnycJTVv2uzf653Mvv
 5u8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+RazEXZ5ZnwHXU/LQ+zhvx1Vn4ZeCaCRassTJ/KRCKM=;
 b=usIsmWicEuD/fwxMcAa5ZySJZRo51AIEslxteX0wDEaH2WAiX/Lcj2wE3d+VNpJf/E
 V14J7vAhzZyNRL0C2NuBpDg6HYoDhHAFiIQHiuI1i5xZ3b2l8FJBT5oR7X9byP366omZ
 GFmti62b4d1PK32HZEzi1hovDIqOJSodya36Om2luTifeITiSlrfhgQ9eZES15NjSKn8
 ExuKpQsUwJlzmniJZj7J5u9BlVVtIbiZyeE0/dmBTO10mID/JA1zNca4BBNeLs1ewRe3
 96XsmFfe2E3DI78kFFBxRZyBAzZk5VFhHFTGwu1nYev/PVrefKYazrrmmYtm33OQaw+u
 RBUQ==
X-Gm-Message-State: AOAM530vgR2mOmfBT4vsJzlZ7ZVIRO07DbtE8NzbCwA93gwrZfDmN2nc
 Mui8IfyqP6sh5LgRkTGzPNV3msEQ+Kp0BjwdGJhxhA==
X-Google-Smtp-Source: ABdhPJzgDVLQ2asHCg6OGY3WeH0ybcyGo5zKkW+Ma0QcKjiDoNrz5+k/BSJgpp8KrAryCTV+4SxM4qOFhtsiygWHEZo=
X-Received: by 2002:a25:40c4:0:b0:645:88a3:eb8b with SMTP id
 n187-20020a2540c4000000b0064588a3eb8bmr28043207yba.193.1651138805590; Thu, 28
 Apr 2022 02:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-6-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 10:39:54 +0100
Message-ID: <CAFEAcA_fscePT7YvywrfBgAn5rExLVo-jH8WqZQrYCR5No95FA@mail.gmail.com>
Subject: Re: [PATCH 05/47] target/arm: Use tcg_constant in handle_msr_i
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 at 17:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

