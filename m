Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21759694DC3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 18:13:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRcMm-0007e9-0l; Mon, 13 Feb 2023 12:11:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRcMi-0007dN-V9
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:11:45 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRcMg-0001Nh-P6
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:11:44 -0500
Received: by mail-pl1-x629.google.com with SMTP id h4so6323304pll.9
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 09:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oVX6/A3JGFds8sMuszFaaFmMhRFssJSfXrFF3tdQbtE=;
 b=tJ4tFvXRnWAObqtE+mLewg9UTQH3bnrRK5SCEb1ehqhVuJ4o/upwpt0i1/kFanxq52
 gQb+zZvXCPI37uDdRI8gtUPJdfGoZqK/oFS/UofauN6uyNDIcVs1PgPK72dOq9tzIrIl
 0MMycRAZzQls4t8u8+8GQpCSS2J+6m7z2rwmZZlhjvzsTu8mR/Ib0LESrhWP1P1azE2N
 UGcUHEo57H8XTtCJmfhwhu3dL22LfAoxyyWdFg1aDUvJVXsa/yCY5fMbZQv/3KOFiLfg
 ABlWsmXlGWWszN9ypQsh32om/YwORE99dWnB2AJuQG0FrsoTXYeQGp0cSfVVeg40xbZw
 +DJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oVX6/A3JGFds8sMuszFaaFmMhRFssJSfXrFF3tdQbtE=;
 b=HvVuHP4W1LJ2HEAWCP4d/i4zRyePx/dV8NevwaGNoF3YJbUQOrkPyDrmGLnjYnELGO
 9exqa1YAzVbccetTIEn6HFoogTR5KqLmAz2+kbueKzAAKL4B4MIItgnV6EkKOtSyWhba
 m53G7pT8EjLFkT7SxgLC4vCeqiW6+SdjNXDUbQm9vvdJySRPl8qOuBM1YWulqtugYaPb
 nKrbp8yQu7h468DekWb5RPNwG679h7a/Cj+VNT375J5ua6RAx+yQOTC7xAo4bDOjHTmx
 P1ijtcTs/lAPYRdgpsYr6dz3zKGuaN5yKOMsnc4cOLPdvSYfBWbW9F6KuT32hPelViaE
 RzJg==
X-Gm-Message-State: AO0yUKVENN6Lodk8pUYb7kCGXwhe3relQhTKs5w63U819HUFKrT69Prm
 NzQZTkhp840oH540ZACjUGA6Ae9nlMZtE3FFuz4p1g==
X-Google-Smtp-Source: AK7set8qQ6jqGJBfa0APDgrIVqOYXgGsKSKVbON+uUTCbvF/wxm/1Q1WXptLLkZX5l0G2ao5JBq7ucJ6gJv90tTPWv0=
X-Received: by 2002:a17:90a:15d6:b0:233:dcb5:ee15 with SMTP id
 w22-20020a17090a15d600b00233dcb5ee15mr1439459pjd.92.1676308300971; Mon, 13
 Feb 2023 09:11:40 -0800 (PST)
MIME-Version: 1.0
References: <20230202211129.984060-1-aaron@os.amperecomputing.com>
 <20230202211129.984060-8-aaron@os.amperecomputing.com>
In-Reply-To: <20230202211129.984060-8-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2023 17:11:29 +0000
Message-ID: <CAFEAcA_XAC3rT041oB_3aC25kuoL8zoABR+bnNJ47iVzasZMAg@mail.gmail.com>
Subject: Re: [PATCH 7/7] target/arm: Add CPU properties for most v8.3 PAC
 features
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Vincent Dehors <vincent.dehors@smile.fr>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x629.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 2 Feb 2023 at 21:12, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---
>  target/arm/cpu.h   |  5 +++
>  target/arm/cpu64.c | 81 ++++++++++++++++++++++++++++++++++++++--------
>  2 files changed, 72 insertions(+), 14 deletions(-)

Do we really need all these properties ? Generally we don't
add CPU properties unless there's a good reason for the
user (or the board/SoC code) to want to flip them. The
more usual case is that we simply enable them on the 'max'
CPU by setting the ID register fields appropriately.

Somewhere in this series you need to add documentation of
the features being implemented to docs/system/arm/emulation.rst
(just a one-liner per FEAT_whatever).

thanks
-- PMM

