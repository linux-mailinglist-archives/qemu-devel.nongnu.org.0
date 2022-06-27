Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668E955B8D8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 11:04:56 +0200 (CEST)
Received: from localhost ([::1]:33040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5kfv-0006gq-8E
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 05:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o5kYC-0008Sj-MQ
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 04:56:56 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:37425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o5kYA-00062r-A6
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 04:56:55 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 r81-20020a1c4454000000b003a0297a61ddso5600629wma.2
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 01:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=vw+4KlHe3+4eh78zLuLQH///2Hyz6HeH8C0n/7jdC7M=;
 b=vUxasnUUiR3Hx4ubOhY5G8iPovXXLOWW55Ee/yz+XOSeKHZg9hmuqhN0+QqbjE+vMQ
 hgTx5J6mhiuYpJi8OhU77SYXdrLaHyzNcqW5GwW/WvjODhhdKpTcqejN+1B8IX4eXyTf
 q09TqbB5GW+7oKQi1gbspU/PHZePFl3gtNDjY4Nfe/avlLB0/sblGUfg7pwBlFDrVo5a
 nKuaCCc+bHIN/VYcOnzGneb4CWlgvryUSD0W+cMjtsC6w5TveAxDWN4+oYvgjZM+gdTi
 3HaipU3eLkVioA4ig6v3Eyqtog+Z9ib+nsyHhuWQECtS3dO6yNbHH3xTDGrnbRbU9Lrr
 urXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=vw+4KlHe3+4eh78zLuLQH///2Hyz6HeH8C0n/7jdC7M=;
 b=qo+jvVv5PfPCavbFp/3mkbtLxqKnwbgjgHC2Kt5sCGmxhElu2eppXPqynpotcW8GTa
 xjGV0qrD2wswAV52i4Xdg2hax8BMvz+hhUlZp0mj2aIUObSlI19nWFQI9xkjJiY42Oum
 zxqDgpNtT7/R6+YycRLMW0fEFonuIPjRRMS8UZcwxUw2nUsX85do7iZZUissUTofv6De
 848xvaSWbNDXJHK6MyCynnzeslrJIxH8N+lyODGIh35d20E/0/BZr9tAxTTO9gheSE++
 YcT2Q8g2fEw6CmVEROm52R1rdwCi6RwkJGMrTAjrvwplY48RVwn4+8S7PWgqgnzIK8DY
 eHTQ==
X-Gm-Message-State: AJIora9ejiijgmfx0kmOdcuTZfjJGPtUDX/3OPuYrgEWrJM9ow3HIitU
 sUhOREkgXd03m27E47bMm4Ywrg==
X-Google-Smtp-Source: AGRyM1tWRvCm/BW0e0yEk0X0BhmrzLitL9+lkADsbBA61LlfBdT8dJ2zx5K05J0HO/I2F87ZOAOKHQ==
X-Received: by 2002:a05:600c:2246:b0:3a0:4d14:e9ca with SMTP id
 a6-20020a05600c224600b003a04d14e9camr1498280wmm.25.1656320211203; 
 Mon, 27 Jun 2022 01:56:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a05600c1d0f00b003a04962ad3esm4762821wms.31.2022.06.27.01.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 01:56:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9ABEB1FFB7;
 Mon, 27 Jun 2022 09:56:49 +0100 (BST)
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-47-richard.henderson@linaro.org>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 46/53] semihosting: Add GuestFDConsole
Date: Mon, 27 Jun 2022 09:56:44 +0100
In-reply-to: <20220607204557.658541-47-richard.henderson@linaro.org>
Message-ID: <87k092lc1a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Add a GuestFDType for connecting to the semihosting console.
> Hook up to read, write, isatty, and fstat syscalls.
>
> Note that the arm-specific syscall flen cannot be applied
> to the console, because the console is not a descriptor
> exposed to the guest.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

