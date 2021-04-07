Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 321C6356E08
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 16:00:57 +0200 (CEST)
Received: from localhost ([::1]:52466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU8jo-0006RU-5m
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 10:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lU8f8-0002dz-SI
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:56:08 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:36445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lU8f3-0000Xr-Qf
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:56:06 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 j20-20020a05600c1914b029010f31e15a7fso1205238wmq.1
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 06:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=g6Wn26LL1JOmpaAlzidk/wAH5a4sP4A4FUeOLvDBpig=;
 b=yw+5AVHdxlP7zRDXc7xT/cl7KF2nBkc5Nt6bA+aCM4lzsV/7uSo4hGxOPDOxig3Lq1
 sx5BjNnqhsydTgTS7M04pyly4zep5uYUsvX86xbMSiZPpRxPj8mHr4QRH8Pv7LGZEJWA
 thw22BfkoimyuxxDtQRn2qP+myEfW8RPPH63tK5sNh0bDRMVAKq7TojSlCeIvzPk8f68
 Eml8utht4aexc4RGiSg+omPIEH7RoLW1cYR560FBWP498rK/gvvCAWSO264uqYOprkln
 RiREbUeb8QMB84pJyYanbleuzymynbRHwJ0QCmEWnEzd5QZ2UQI8hN0UdFQWNP8bzA6W
 CpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=g6Wn26LL1JOmpaAlzidk/wAH5a4sP4A4FUeOLvDBpig=;
 b=iqMTlGNOxw7EnsXC5U/tZI/wmrR6T9g3ArHgrshoi9N5qe866Ai/eeEqZtT00KRgPv
 AXWckNShZQ1EXuQMCWv+lUis0eplkSC2KN14DvJ8G73wpVAkM6snN0M+w8ypjHiLqend
 B34KbdhI2rRZ3uhxRYIdqKUNmefHMwhF9drsmnnEZHMMNewJZhcxH2S1b2jNGg4MiKp2
 kf5Vy/rtRupHgjf6TrqmmSFcMDWGcsWxK1qoFCZry+sZk+WkfKOXuNEy9MKyE60MKkZb
 x2SeCVBLdZgIJvA7r2X3eXLQKLgplf7NS8IPI/FC1czNKrFqm06QV4fhxstxZRZFvcp5
 oIjw==
X-Gm-Message-State: AOAM532QE1GhiUCO9w51RGbD8kUQWAybZnEs5ssoJ+7ZE8Hi1TUoAvmm
 cKeQJRf65bdcu5Pye41Wof7snA==
X-Google-Smtp-Source: ABdhPJxVq7HSe1+MehqBmiLq3faFT+rRg/bPoxTmGv3Rbeue8F33HIeAXu0L8lhGA4RDTdd2zVB0Ig==
X-Received: by 2002:a7b:c74c:: with SMTP id w12mr3265527wmk.73.1617803759149; 
 Wed, 07 Apr 2021 06:55:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j23sm8122562wmo.33.2021.04.07.06.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 06:55:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A216A1FF7E;
 Wed,  7 Apr 2021 14:55:57 +0100 (BST)
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-2-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 01/12] accel/tcg: Preserve PAGE_ANON when changing
 page permissions
Date: Wed, 07 Apr 2021 14:55:20 +0100
In-reply-to: <20210406174031.64299-2-richard.henderson@linaro.org>
Message-ID: <87tuoiurki.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Using mprotect() to change PROT_* does not change the MAP_ANON
> previously set with mmap().  Our linux-user version of MTE only
> works with MAP_ANON pages, so losing PAGE_ANON caused MTE to
> stop working.
>
> Reported-by: Stephen Long <steplong@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Yay test case ;-) It certainly fails before and works after.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

