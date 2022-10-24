Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D88DB60AD70
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:24:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omyIz-0004UZ-19; Mon, 24 Oct 2022 10:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1omyIw-0004U0-8V
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:19:51 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1omyIt-0004iY-T9
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:19:50 -0400
Received: by mail-wr1-x432.google.com with SMTP id bk15so16474680wrb.13
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 07:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3KO1nMTnNXE656bcXzEaTRcgJC05+j0kM/MObb+GXYU=;
 b=X3B8LbFOoXCnimXMnyRvIs8XOgu9XQ+FxB2U0gvLzaEVf5CD7xWqtlmwkd1XJcZlSa
 2Vk1+2WZzgFF+/oguzdm8BnlqynL8wH7eI6PiyNkjVOBdoy7aCndn+6Ham48ulrSR9ZX
 E9ZuzRebK9zrqdUIiJZk19LNIpr1i7D5GApb5qLO/dK+hWLhN98Wae1Z6oZvz5Y8TeoM
 1Eiiw2OcRUqJTSpAUGQF1rVN1DGT5R8RQG35z9GW0HPVA04UZJHcOKPX4XxG1nhEjZLi
 m7t7ssRoIM6pmdAIi+2kwxA1asQmpVdbpkckgGG9kp91IZuf/f5mBaXUnQs5DM48D47P
 vccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3KO1nMTnNXE656bcXzEaTRcgJC05+j0kM/MObb+GXYU=;
 b=vVSfTm1uvi3S0Krqxis1Da4Msu+bUPe35zGClmwLslKI3pvQN5XWx0Oc6rLcmABFwE
 qtczTUIsRCVU1nzDeJy9oNvMBVYRC264FnSs5JgVgZ80yQIFrrVKhrdP01jOQO2tNDy0
 xoQVxjDU+RDGWJNQEKBPL6rpD0PEXfF9AiqymiIVZwxdX8TCUeMXZ31ACJXwkXfRgBOy
 dlBG53aeMyl4ah6sUhbK9iB6hy4oco/y9BX1cGF/5vqAG3U8rr1jmhrnRLoSbXt0q1cL
 nru3Fk3jgdIHxf8GanxWsHpEkGW+9ZhC1vM8SipFBVmq8vROcTcudI1gyHiewrTW6K4l
 z1cA==
X-Gm-Message-State: ACrzQf2nt9I0NhY1Vya6aSt81/3HYhZ6fClzPrvI0Gbl0Sr76ttG7mcM
 8GtzTpAE+IOImp24/AHO3Aui/Q==
X-Google-Smtp-Source: AMsMyM7o1DnXxNldqC0JuktHIz4hq+ed/G238VTg1kCXk5guhNOpg7dbWNPED4nmvTL7jI9ybfnu1w==
X-Received: by 2002:a5d:6483:0:b0:22e:4804:8be4 with SMTP id
 o3-20020a5d6483000000b0022e48048be4mr21174742wri.528.1666621185820; 
 Mon, 24 Oct 2022 07:19:45 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a056000188a00b0022e344a63c7sm27597783wri.92.2022.10.24.07.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 07:19:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E25841FFB7;
 Mon, 24 Oct 2022 15:19:44 +0100 (BST)
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
 <20221024051851.3074715-5-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v6 04/14] target/arm: Extract HA and HD in
 aa64_va_parameters
Date: Mon, 24 Oct 2022 15:19:40 +0100
In-reply-to: <20221024051851.3074715-5-richard.henderson@linaro.org>
Message-ID: <87k04p9udb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

