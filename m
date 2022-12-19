Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7F9651553
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 23:09:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7OKE-0008QF-6S; Mon, 19 Dec 2022 17:09:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7OKC-0008Q6-En
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 17:09:32 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7OKA-0003vB-Px
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 17:09:32 -0500
Received: by mail-ej1-x631.google.com with SMTP id u19so24932613ejm.8
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 14:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QaQvqUO2pf9zXzUb9lEEKJNNQUCcDd57GX6tblhTKj0=;
 b=nAZbgwRT1GvrOtewfI+n5+Wo7Tp7PH+mMzLRFONFVWGIdz0pQr0oC444EF9dOHMx/N
 9mPzK5VzABlM2KnElayx316zGl9g/dNcQOk2WV+6tZKSp5RxgYeEU3SL+iYo1H1owyzm
 cvuY8OtoUs40BCsvyYmhRHRw8dRc8bJ8mZfDkgqvKqFxAkOmSmf9uLR/n7fNrBYKVSi1
 6YsQe07NlECzrmKg0ZOLKDUPFG/RaP0cZ3w8rlub1rvBrZPcIhCPqXfcaCVl9Q6fuyvq
 oiNmOPprFpZfHOyJVPBcPsbTm20adiCFUvXjA5NkAghoHkxUhSPKdHebZ5t0qUSqmyjf
 wBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QaQvqUO2pf9zXzUb9lEEKJNNQUCcDd57GX6tblhTKj0=;
 b=5elb1yZORKBJntuQO/wHA3hd6srcZ+EiiDU1M5unA+xvLrDaqdezPEnxcPbXdZdmkh
 yWaFvYS2smLAbhOeXQgpfZZW5ynhIlzG7Ts/yhxjChBzm6amn9E1DLnZnOHxLGkZLF+s
 c9bC3nUg2roi57DsiRQookVEBCxLtPNc9/v76AfdLLxSUmF42KVilzHdSIkwTSSSHXc5
 JHVLrsFUo2BpqEkPvv8DbboL0kHySX3ldMXPGidjHjAnoccXkh1D/9qvQAlATC8otY79
 XV4d3I5v5GZlgWlx8TzgGEXun5msKBdr2ytm4ofP7VeFR4PaqG3kTDAeU5Zrg8Y9NE93
 1+yg==
X-Gm-Message-State: ANoB5pkK0iHKdSdZQUxCxcxGrwc6tj35+jfBaibggr7JGfhFaEB1h8pT
 r+zLiPUdkuAbChYhApFtAMCn+jo1iUCy2wi5Woc=
X-Google-Smtp-Source: AA0mqf7VnWR8gSfzkyF3nJW+ac5rfH1Nkb4EgJpj+tg1bW7Aw3p5EA1bxFtjAWNV/evmn+Go/X9bzQ==
X-Received: by 2002:a17:907:6743:b0:7c1:7c3a:5c65 with SMTP id
 qm3-20020a170907674300b007c17c3a5c65mr28950451ejc.4.1671487768740; 
 Mon, 19 Dec 2022 14:09:28 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 gx26-20020a1709068a5a00b007ba9c181202sm4852880ejc.56.2022.12.19.14.09.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Dec 2022 14:09:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v4 04/27] tcg: Introduce paired register allocation
Date: Mon, 19 Dec 2022 23:09:22 +0100
Message-Id: <20221219220925.79218-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213212541.1820840-5-richard.henderson@linaro.org>
References: <20221213212541.1820840-5-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x631.google.com
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

Splitting this patch in 3 to ease review.

Philippe Mathieu-Daudé (2):
  tcg: Massage process_op_defs()
  tcg: Massage tcg_reg_alloc_op()

Richard Henderson (1):
  tcg: Introduce paired register allocation

 include/tcg/tcg.h |   2 +
 tcg/tcg.c         | 475 ++++++++++++++++++++++++++++++++++++++--------
 2 files changed, 403 insertions(+), 74 deletions(-)

-- 
2.38.1


