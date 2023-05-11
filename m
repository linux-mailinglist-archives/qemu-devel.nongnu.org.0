Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1D26FEFE9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 12:28:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px3Wp-0006Ua-G0; Thu, 11 May 2023 06:28:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px3Wn-0006UR-OI
 for qemu-devel@nongnu.org; Thu, 11 May 2023 06:28:05 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px3Wm-0005j7-7b
 for qemu-devel@nongnu.org; Thu, 11 May 2023 06:28:05 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3078fa679a7so5103819f8f.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 03:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683800882; x=1686392882;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MJUPaM7RfZfixa3yXfX4vZwO0KtBmIZu2lEHJY/vn4c=;
 b=Qe65VYjYopkubQ8o7Np2PktU4Rzi14SK7XaSyl7C6aSOOC0NYAql7w7HDsWckrF+Ak
 YWI6R4n3Sbe1AKYnX5ADcmn7jP9BkFmd6RyAGMhyFOzChEAI6Csz+RIoIRYC9wSIUAVT
 UiPNbQ5QzYBDRJ8oPIv2CSwNulVSmzS69m8Fnf2Et8MhhN4RRAGUn0AGfMlRPmmpZfbR
 sHjZzAVqyBf9DjAgKp48TN6W3YIWM6bRHLiTNa2LHQPgGfjZXf5AUGmh0Ov/psRq8i85
 Jy8I6V2iY5Ddhpf+JZgmq8vp/NWEwcOX41Dx54GlBOFm1YCDkxqWkZV4rhuto8WwoD/P
 TKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683800882; x=1686392882;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MJUPaM7RfZfixa3yXfX4vZwO0KtBmIZu2lEHJY/vn4c=;
 b=I9N3eb3jAXvh1nPi2N0UiBOFpvgNirpTXJICKQr1yx+cfo9021lduP0H7tVtMmOHPs
 egC74uaQbhtWHwnxiYF3bgbwbF3m435QNG8sDermcH5qJMs35bdKREGqqEEI9lJxUNR3
 izjMu/+c6QMQRYx0F7LBLqOg19Kt049T1g590h5tkpETWzwQxyFe1w5olKRAKBg4Ax4a
 g+4MXd/OexpsnLRHltIfySKlKj1ur39xxpWSCjTzPa4oDJ6O5gMEdasgpoUZOr8eZmFA
 WHNwqLo82KHDyopbzW1ORJCjogS8F4d0lPwaxma0PZGTvblL1O0vZxM5dsrvvIjv5xt6
 hBUg==
X-Gm-Message-State: AC+VfDwNRwgff1ub9/ihFbjSBVtAKwp2MonnbpOOQ3BRGyjrvMBhpvyZ
 G/w5pyJVM0NY0FDP16qg4ZIp8g==
X-Google-Smtp-Source: ACHHUZ765cY4Cfg+7xXN5lGLODu2VIv0w9fqGq1rnMa8JJzjNsXovEYJdE5aOieBJBTqQBZQA78UHw==
X-Received: by 2002:a5d:558d:0:b0:306:3604:255b with SMTP id
 i13-20020a5d558d000000b003063604255bmr14634232wrv.5.1683800882389; 
 Thu, 11 May 2023 03:28:02 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a5d4091000000b003078a3f3a24sm16244220wrp.114.2023.05.11.03.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 03:28:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A864C1FFBB;
 Thu, 11 May 2023 11:28:01 +0100 (BST)
References: <20230511080119.99018-1-sledgeh4w@gmail.com>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Lizhi Yang <sledgeh4w@gmail.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, thuth@redhat.com
Subject: Re: [PATCH v2] docs/about/emulation: fix typo
Date: Thu, 11 May 2023 11:27:56 +0100
In-reply-to: <20230511080119.99018-1-sledgeh4w@gmail.com>
Message-ID: <87fs8340y6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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


Lizhi Yang <sledgeh4w@gmail.com> writes:

> Duplicated word "are".
>
> Signed-off-by: Lizhi Yang <sledgeh4w@gmail.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

