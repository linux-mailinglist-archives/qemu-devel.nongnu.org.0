Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E0F3AEBFE
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 17:06:16 +0200 (CEST)
Received: from localhost ([::1]:35126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvLV9-0005MG-8h
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 11:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvLTv-0003l4-9l
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:04:59 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:34476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvLTt-0007Ar-Qy
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:04:59 -0400
Received: by mail-ed1-x533.google.com with SMTP id i5so1969114eds.1
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 08:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZPWHAVAGXPo4/SbAeLtNcLcHW5dMb9gQ3diizrZPTcg=;
 b=x0KjqFArnLChC8thhNHSjyX9Qrg+LE7VAoCOave7iHg7fkElnolYouJzyplo7IBMeJ
 pZEnneSdSFrXo5nftrNVmJ2kgF5iT9sDwYuWMylq6RjwaliQSjxD3RPB8fTEaN5ZseA+
 q2Va4g543ccLXMQv1Vk7heyYkJGxx6ktYsuaqrwD/Q8qOKiKkDVzp3cv5hWsMv0/4qAD
 areSurD0RSGaLSSoVQgcGL72sqZu1SZncDWIpaEh0xAVlj5PRGflwwArRfEjTRsJOrt5
 htnutc6I3Lb+kZENsz0n4uEherqpPif5ExhHyr3ZG7G4PKQFalRlWukhTUOPqd6Yde5k
 rkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZPWHAVAGXPo4/SbAeLtNcLcHW5dMb9gQ3diizrZPTcg=;
 b=m+W2PYPhzgXgvnsAkid8LndRyWXZecJbqwy1+BG+1xHlBQAOw2HDFxU+PM2TuPIIoH
 cdNqMtlRClVcLIraqqag9vdeIqv1J3eeIEF6WRcNxqBm50N95bBT1z51/rOm5yBS+Ry/
 pW4qP8uY5rL/9Qq11eQ/x6GjP/Eup7J6id4v3LlzBhMOo+eEZjfIBxmfUH/k/g/OLTkW
 n2aKGqq5cVPInJpodDJ4Vr0mA4bMYAPmp4obEF9nopjMGWP4K2ESbWUgbbXdr2nhK60C
 N+sgQ89NyA1cLERRHqVIQGZz36JClOMCZwPWTdj/KMzy30oWvavwntQLLk7g5yd7e1g8
 UnzQ==
X-Gm-Message-State: AOAM533tgZt7cl51lSSj3HjpB/zpJSg6AeFtqkfc2ZLD9yTgu/eoz1N/
 ek0zXps+45oUa1ufLuGPk9k9JswB1L8uwLfFUat8BA==
X-Google-Smtp-Source: ABdhPJya2VFQRnQHI+YV/ARn7W3mLBo8M/NZX+/qyBN5OhY1X6ZQc0iGnwy8TAfC9rMqYfH8NNQ5irddta40jdWs0e0=
X-Received: by 2002:aa7:da14:: with SMTP id r20mr20925337eds.36.1624287896246; 
 Mon, 21 Jun 2021 08:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-19-richard.henderson@linaro.org>
In-Reply-To: <20210614083800.1166166-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 16:04:20 +0100
Message-ID: <CAFEAcA-xVq=RWRGKE-Am2Riw-yh7degqCG4SM++R=DpHfTiW4g@mail.gmail.com>
Subject: Re: [PATCH 18/28] tcg: Make use of bswap flags in tcg_gen_qemu_ld_*
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Jun 2021 at 10:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We can perform any required sign-extension via TCG_BSWAP_OS.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

