Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 246AD6FF777
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 18:36:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px9Gc-0006hm-0Q; Thu, 11 May 2023 12:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px9GZ-0006hO-Ci
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:35:43 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px9GX-0006UQ-Kz
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:35:43 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f427118644so47853745e9.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 09:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683822940; x=1686414940;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZYnr4/Yoax6yjN4VsfssLZoR6QQyCXUyrxIFATu6X18=;
 b=XpoLGbgWBZZ4ZXxcOyUdSPmrt9wZ3brA3uS3RKZxoeCdp++wdoFOLSfhvb3EcxzXz7
 lW4TWDSZ2QBkfQ4fi/SedQ0/jeCJce9cy6KPJRcEJ0AakWcIawUuIzjVL1dH1qYdHRuB
 I2RV72hNfnCP7NU6+F9kCrdkZslxxiK08eEz/Y52l0nVqhwDGgtck80B/VgDRRNaSo3m
 e/aJsU8qv1nhlufH/DVL/RxTX04ZgBVzU+wl9Q2UM9KNiFNDY+dmtpfEpNOoL7F6R7Qy
 wjHUQFiqngyDm4SZMtHIfYWQ85KhHNbkTBj3M8Sxo99laVYvaOEkJgYLaZ0usULsYLRj
 bnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683822940; x=1686414940;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ZYnr4/Yoax6yjN4VsfssLZoR6QQyCXUyrxIFATu6X18=;
 b=WxCK91bI2yOT6msUXErlPmD5AL3olW3GyYCJdUt20QH/wofmRcgPcbkC6e6LjCiLOs
 mEniA5CYyu1eDpqzv2e3AmZ5OqW5xuoA3+Hh3o0LqYcNauQAF3NV5G0zPIKcXjDPJGPA
 /WqjBByxEyZxeFJa/BW7GWe2+owyhO6+lePX1fOMGGXy7wPwekIUFPwVqpG05rhqMP2X
 nfEkQhq3P9ACCFPL7Zs9q1JQjioPr3p7Wr+pNIMpYE4wwo2kqC88V19xA7vysprZGMNW
 rw04n9B0HDCG+JLo/IqXgYPzIaGe1xUx00ldX4cJ7x1F1eB54BwtLS+L3Xjm0CjOQqpQ
 Px5Q==
X-Gm-Message-State: AC+VfDxk21pjy54zGf1isHesJeTyULo06VE0QDgObkiG3JYLva4cx2N0
 YZy3EyScDdxFjFSJKlmyUX6UKw==
X-Google-Smtp-Source: ACHHUZ6XD0hrgicoV8K4PZuRsshYfX+30JrBxrF7Ad4L7uZf9fNXXGT0thP8xDefFDucKRYqZGD3Ug==
X-Received: by 2002:a05:600c:3797:b0:3f4:20ec:7601 with SMTP id
 o23-20020a05600c379700b003f420ec7601mr14431452wmr.34.1683822939661; 
 Thu, 11 May 2023 09:35:39 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a22-20020a1cf016000000b003f42d8dd7ffsm6804270wmb.19.2023.05.11.09.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 09:35:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0D2EB1FFBB;
 Thu, 11 May 2023 17:35:39 +0100 (BST)
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-17-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng, qemu-devel@nongnu.org
Subject: Re: [PATCH 16/84] tcg/i386: Always enable
 TCG_TARGET_HAS_extr[lh]_i64_i32
Date: Thu, 11 May 2023 17:35:15 +0100
In-reply-to: <20230503072331.1747057-17-richard.henderson@linaro.org>
Message-ID: <871qjm25d0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Keep all 32-bit values zero extended in the register, not solely when
> addresses are 32 bits.  This eliminates a dependency on TARGET_LONG_BITS.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

