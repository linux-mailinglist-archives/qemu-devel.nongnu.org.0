Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C303666E52F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 18:47:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHq2v-0004dw-Ak; Tue, 17 Jan 2023 12:46:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHq2M-0004Wd-Rz
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:46:18 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHq2K-0002bg-VC
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:46:18 -0500
Received: by mail-wr1-x42b.google.com with SMTP id h16so31415294wrz.12
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 09:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S70hy7hnAxt29XEEJxeHBbBUW/HBjwefMHzH1X/OuoM=;
 b=cqbqLSoqVT5fm5sAA4kWE+1pGYTEUmAAdhg5s+eIs0Zkur5tSAhyNnLOZgNZBNUSAb
 K3XLu4GYV4xXCsRcBjXtaphjJgMWb09lM+vRuPQ8bn5Fy0/PLAn9YFxgkQyfM5OgqSSZ
 7ZU/l0CLTa3/DMIKiHmIIh9JSgmiOe31vwJU7eTWdI0t4DSMgBCBUmjZCaEDYAF0eFxv
 tuM8mDLSKrNh4fMCPXqPiVGiS465AkVcp8EKqPhVSBO7QifHsYe2IITHPCCqEg0TDnFk
 bagAIB9W336ZciJTeqzpeF0ZKz7uN7217dp6rmJRPOBerKcF2q/PN4TJw/sNfYPZ8sWG
 0AyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=S70hy7hnAxt29XEEJxeHBbBUW/HBjwefMHzH1X/OuoM=;
 b=7koqX8jGyQPbohkl8x7rY17K0VUa0tQ0cez5LPfd72TjTs50H1yOTPk3K2bKZl/Akp
 8HprL+XyEvgmrcizz26iF3bGNcBD4b3XJQdIT6fWGnmfHCuJS8Mz4P9nAiOZvxnHFf8i
 Iy4VAYXR/Wg9DgfuSmaUPiDhdS3TDrAoRrOdXhlydO2wPfLeIK+YQN87AaaAnJWkLKa+
 jxFaCC4SncvmJElX7CShAUysqA1Icn+1iJggeRw1dDkU00ibh8us/OJXLzUI7e1RjNag
 2SJxc78dQ5n33z/AxrLAvVZIz1EhIlZwFTZ+k7hRI2W9LZAB2vlcpXz5BC3q+yZFXkyD
 EScw==
X-Gm-Message-State: AFqh2kqDzfekTIfZvucRR0i42BihkzGVKZ4P1LzAS4NPBET9zzb5jWdo
 MldopWioCPy6aXAmha8FyP9nDg==
X-Google-Smtp-Source: AMrXdXvfJYuinyuZpY4dYDqoJRZRDC8rh2erMt+Jz+GuarjcO19w8b61h290Xam9AfZyyzKm8eJpdQ==
X-Received: by 2002:a05:6000:1708:b0:2bd:daf1:9e4c with SMTP id
 n8-20020a056000170800b002bddaf19e4cmr4319379wrc.43.1673977575100; 
 Tue, 17 Jan 2023 09:46:15 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e20-20020a5d5954000000b002be099f78c0sm5042409wri.69.2023.01.17.09.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 09:46:14 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4D1C41FFB7;
 Tue, 17 Jan 2023 17:46:14 +0000 (GMT)
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
 <20230109014248.2894281-3-richard.henderson@linaro.org>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 02/22] tcg/i386: Remove unused goto_tb code for
 indirect jump
Date: Tue, 17 Jan 2023 17:46:09 +0000
In-reply-to: <20230109014248.2894281-3-richard.henderson@linaro.org>
Message-ID: <87ilh53vh6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

