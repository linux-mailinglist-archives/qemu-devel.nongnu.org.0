Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E237458ED91
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:46:41 +0200 (CEST)
Received: from localhost ([::1]:52348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLm2i-0007o5-Og
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlb8-0004f7-8W
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:18:10 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:46041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlb6-00046N-Th
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:18:09 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 q1-20020a05600c040100b003a52db97fffso969639wmb.4
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 06:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=VBNAaU9YQLnoqQCP0/d2dBkbwZ7SkoJ7Scq1Ft8kats=;
 b=F+sTDd1j8QNlPxXlbBbRb+S0JKMi+nTTcM58L3d6Z96LLmLRJAdHHqYS1nAMnlXVVc
 jO1kQkVHM9yRGo6rgx3KaGcb6Ra+zWMDvPUagPteyv1I/UhNqa7hPPkodWa9erpmTxDZ
 QjRZXxL5qp1cqJYcIXgHHMOdqsxfdqNYwNQnz4ZcU2t0AsgglKHClFeT9kE5VpqbLS42
 4cs/VE7XfRsO2AzY2qEl5208/OFK1Yv8CSwPzmzVroC680lsr8bnjhXe4iNZqBAdwTw+
 nrf5YqtjSe2cU8IVoW45vDRetCkpFEcOnZTBFAw6djI7v0EHfnpX+7q0SiRwX0sgXtd8
 rZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=VBNAaU9YQLnoqQCP0/d2dBkbwZ7SkoJ7Scq1Ft8kats=;
 b=BatSbuD/qnvzO7YLuMlekCsOzE7Ma6h7rU35i9Rf0FBaO6Sd0YTtfZMEFmkt62pO0O
 1oIvT+6sqMJj2pYRCGv3MQ92iEWrfSS2xbm4qRgBSnhIZTl37yRww3AqLpUYbpWO0ccf
 /0EB4MPmSsnKaymgbM/YAad4Y+fb7So4fddh471OYJzqmGSoYlp2W/EpDK6Zw6M+7M+y
 +p0Qo8iXkqtnYnncy+mgTDue8BdsOQ2bUGsG4d8C0QjFPi/KIJla5ipEuLidP35H/WL+
 Wc4BAxfv4g2yEph7fukoRerG42FYd+dwz2n4uwRKE7sC+/a4wGO0EI9o2YHWgpcBMDiu
 zaOA==
X-Gm-Message-State: ACgBeo0U2igKIVrHE4d9ltLjyyns7x9w/fbi4OcLobI5dGBWv0MNFCNV
 yAyAhIdxlln6/6HrJcFwEwYa3Q==
X-Google-Smtp-Source: AA6agR7/IuctKtYAKhUPTmE0CfwQsLNM8Oj/e1bwx1fHy3pg42dFthcuRFPoNwlOKErQvYsYXwEtMw==
X-Received: by 2002:a05:600c:3b85:b0:3a5:24a7:6d69 with SMTP id
 n5-20020a05600c3b8500b003a524a76d69mr2490768wms.159.1660137487671; 
 Wed, 10 Aug 2022 06:18:07 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c5-20020adfe705000000b0021f1522c93bsm19587209wrm.45.2022.08.10.06.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 06:18:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A28FA1FFB7;
 Wed, 10 Aug 2022 14:18:06 +0100 (BST)
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-25-richard.henderson@linaro.org>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 24/62] target/arm: Add is_secure parameter to
 get_phys_addr_lpae
Date: Wed, 10 Aug 2022 14:18:02 +0100
In-reply-to: <20220703082419.770989-25-richard.henderson@linaro.org>
Message-ID: <877d3gkzjl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

> Remove the use of regime_is_secure from get_phys_addr_lpae.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

