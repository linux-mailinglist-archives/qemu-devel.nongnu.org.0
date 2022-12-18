Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 192CA650480
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 20:29:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6zKY-00071t-QM; Sun, 18 Dec 2022 14:28:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p6zKW-00071R-UL
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 14:28:12 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p6zKV-0000sw-F6
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 14:28:12 -0500
Received: by mail-wm1-x335.google.com with SMTP id ay40so5160126wmb.2
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 11:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F5K6t4ihCM1u9A9UZMUBD6AE/oPsFkQp637Fm2nY924=;
 b=tRRUjBItk5ZjwsgsSU7Dyb9Q0igDKR2dBbKtZM6doRXjJf9ltNsZOMoHBf9bST/2qV
 9328g3RrX+RpiiVecyuFE4a3+3+19HUgmPF/nQoaJVmKTJsoHs+TImdpTWJKQ4AKJ+qe
 FhpGk/5jFm7SophWhYFG72yBVwO55B5SHU6tNRo78otnF7+ccVIU1kug847x0GFZLya7
 s1CXTPfZ19/tmA8b+a/SkCKam2KybXCCA8c9niVD3/noIkRHKcUDlHKMJ/3aNDF8dXg8
 r17Mm0oIiHDhRQom13FGb47VyEX6Z32k82PGELc9+wms8+NUubZq8Q+N/4OgQTJ1SJEq
 hN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=F5K6t4ihCM1u9A9UZMUBD6AE/oPsFkQp637Fm2nY924=;
 b=jKZi6U3TYCGl5EhgqAk7KPOX2dSuW4fNrBYHx9/k1gZLUF30bnv8tVzFSvK/QpKtWS
 yLBid6aIuFjIVyTZ6kX3hrhqi26Km59Upb0e2+mefWbxHiWPfW3DVd216xwkh/DALtdb
 nMoRY6ZaG8QEjDdsY5xbbg5rfJpFDmf6UnZS+OjLlGMLzC3Nw/mHUbmJ57osbT7z8Tv4
 7IU+5c9gTTU3y7fv9xXl10Al3CGkQV35PUTxT+KJgbn0ibX0GvUE72qgbJrEKWiiiFd/
 oelL1exV7IBbRZk2kl+l9MMM+ngcsCC8sSlWyLLs0hGZhYwbBwqqlsi7H2MhQxEeiMgB
 6IPA==
X-Gm-Message-State: ANoB5pmUKGiqfXsZfnH3HFmh3Zanm3tykcikrnaMKUFNNfAHu5nWJmLV
 FxtQ6HqEDADhVym0ka8Aovy2SQ==
X-Google-Smtp-Source: AA0mqf4YcfqHTYuEfX+7FDT7qtVkQI9I2qiO93K1IzsT9S3LZfVqQsH2fZOCK1fH/Rv9zME79s7+4Q==
X-Received: by 2002:a05:600c:1da3:b0:3d1:ebdf:d58b with SMTP id
 p35-20020a05600c1da300b003d1ebdfd58bmr32600246wms.5.1671391689262; 
 Sun, 18 Dec 2022 11:28:09 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d22-20020a05600c34d600b003a6125562e1sm9795598wmq.46.2022.12.18.11.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 11:28:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5D6281FFB7;
 Sun, 18 Dec 2022 19:28:08 +0000 (GMT)
References: <20221121203906.64404-1-richard.henderson@linaro.org>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] accel/tcg/plugin: Fix op_rw
Date: Sun, 18 Dec 2022 19:28:01 +0000
In-reply-to: <20221121203906.64404-1-richard.henderson@linaro.org>
Message-ID: <87v8m8tstz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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

> The value of op->args[2] is enum qemu_plugin_mem_rw, which
> is already 1-based.  Adding 1 produces incorrect results
> for QEMU_PLUGIN_MEM_W and QEMU_PLUGIN_MEM_RW.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

