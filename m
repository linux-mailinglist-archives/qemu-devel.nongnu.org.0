Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88F46A5EAC
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 19:21:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX4a7-0002tI-Kk; Tue, 28 Feb 2023 13:20:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX4a2-0002st-PD
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 13:20:04 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX4a1-0000wU-3M
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 13:20:02 -0500
Received: by mail-wr1-x42f.google.com with SMTP id e37so8262186wri.10
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 10:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4K7L5l3quespc0mLIALbXsZQzioY1Jbr6kUgX16E1fA=;
 b=IvSyXZJq/BP8pLyRTSnTAaK0tzm7XTkbz/bOZlT0f5tQONccSti/mHYbZG4zl8ah0H
 Ig45mEpVaf9gW08V764iUKHVNFdbaEgds5g/spmbOA/8FsNnIWrVmS+bBdO+TlWe5VUx
 uo6kmtzsD+DQJ6hdOftOXxGiJgtlQMtVp5yGlSz7lVR5vtduBkq+CMgqkz2ZeQDWXqTc
 u6ieqCCOiI15NaVgWzVh5osrk1HS0hH9m0aGHqoYpRdAt3RtnYtjwUV6fq8540ioQldx
 oRpGUUDdjdKtRIHm9M1lYJB16F4vL9q+K6q/cYlxbgWKa1EdcN9uINrpUtFWR/XhTnaz
 3s5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4K7L5l3quespc0mLIALbXsZQzioY1Jbr6kUgX16E1fA=;
 b=Q9h89HaP4036ud/AZp451+bhM+BARY9z/KPHu4yF4xXMFn7LEMiqEcEFNFZoVgnwpR
 v4eow6/jbpk/UnuKuQJ7LYIX5opLxZSZ0XlIIP/DCBk48G3iuFY1GQbdSthLe3dtwHnm
 jPydPfLNbnstuQRUAh4PLsRXiCMStF6udIdxkwcGmyeiLVVWQpD3B3dDrGZRyjLavI0o
 MFv+emlvQQwP9lVCkxbJDoDm0Kk2nzsvFnHzwDY/q1uEFEseXu3it6HvJRmPr998nHT0
 FngCIIMXAZ9H1YUPmu4U51obgZaDdfbBPGWO4pngX7CPMQjYTkr0Q+WiRnRX91iF0KQm
 Vg7w==
X-Gm-Message-State: AO0yUKXRvAV/dWaJWX5rtp5Yxra9vihY2RNYdponqwjhVhML6lDmPV4v
 +6xvykDj9wvtq/3AZv60tK+LEw==
X-Google-Smtp-Source: AK7set8Gg2EA9ycDvI0uB75iHCtPzA53zdqe5dCOn91b6VeJWgAdveY+4+Zr6cjOSBzONZs8f6nxyQ==
X-Received: by 2002:a05:6000:1006:b0:2c7:809:38f2 with SMTP id
 a6-20020a056000100600b002c7080938f2mr2539753wrx.12.1677608397904; 
 Tue, 28 Feb 2023 10:19:57 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 y18-20020adffa52000000b002c55efa9cbesm10279445wrr.39.2023.02.28.10.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 10:19:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 32DB61FFB7;
 Tue, 28 Feb 2023 18:19:57 +0000 (GMT)
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
 <20230216025739.1211680-8-richard.henderson@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 07/30] accel/tcg: Honor atomicity of loads
Date: Tue, 28 Feb 2023 18:19:52 +0000
In-reply-to: <20230216025739.1211680-8-richard.henderson@linaro.org>
Message-ID: <87edq9ejoy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> Create ldst_atomicity.c.inc.
>
> Not required for user-only code loads, because we've ensured that
> the page is read-only before beginning to translate code.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

