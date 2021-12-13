Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C91A472FD6
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 15:55:29 +0100 (CET)
Received: from localhost ([::1]:39294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwmjg-0001zx-5V
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 09:55:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwmg9-0005m6-Us
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 09:51:51 -0500
Received: from [2a00:1450:4864:20::32c] (port=54014
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwmg7-0000tS-Hb
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 09:51:49 -0500
Received: by mail-wm1-x32c.google.com with SMTP id y196so12088977wmc.3
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 06:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=U4BpNZSPFdcrTROeIQhSNSLg8Z94jNPZMYhDWi2/1Lo=;
 b=VdsMyeVHA2kL3/KNC7/q+ZajH3/JsnhGu1MH23wqE3/SUGlSC43QM+RUQXkoIAPayd
 kb4OdWiL1OrKhLc6/P8UBL0hJzBpDMPQRoc2zUIc0ASYrvdcnrMNEL53xcmaRcIOV6Zj
 nMi2mj3FIK01eQIdGj5UA9gYF0lSqUFTJF3wawT0pRE2pWWpQ3d+zEnoAxRbRmPC486R
 emlqJGjDUjB9fhYCVy6xWhuVgiqi2qTTbFJwame7/oHB8fqk6Vjsm5y4bcH7STs31AWh
 /euEM0j8tCposys0ymH0LM6NGcWXZncihCku0A2opKL7+v90o3b2xDcLm6Pkjf4arSK1
 kgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=U4BpNZSPFdcrTROeIQhSNSLg8Z94jNPZMYhDWi2/1Lo=;
 b=UsHGFfDeHkuBvLN9vYxoxptxHo3sJfYuqPRcktw4ylvvkl6AaC014Druglo+BgrgE0
 gM2aCzRwrgq98ICLfO6CQIBAnvSYHI1Ioo05NptbXBw6Dzihl9HycoOcOgCTYdqVcZ6w
 XzaaXAJ8m/UfV4yGJlUQk2QwUAYQF+NzcxYW+TL/Q0Z5tqonFcWRzdaT8/ls1s6Gh3wj
 0AcYEnMu5WvuqN/odmv/cEocTQtaKsOwe75EWzv3tUnX5FzMM1Un9LYo/+XlQ4fu8r19
 eExd0qEctXPEG9x5EzpDjkPba5qcCdt9jtPkyoSHF+W5Riw7hvPy42onLPeczIaR8MBu
 i4RA==
X-Gm-Message-State: AOAM530rr3rpEapAanpfvXW7oi5PknVCTtV37mMjy08EZXxd8KWVdS3h
 X45b0R9zgzgx8fG9JTh/puEnU+vc7mokqw==
X-Google-Smtp-Source: ABdhPJxwaev6rjxNLVcK7xZy7b6Uff86vERcI7lvpP8c/obZh/YjKth5bCz75PhxvLz/i2E5m/GRng==
X-Received: by 2002:a05:600c:4f92:: with SMTP id
 n18mr37210003wmq.123.1639407105970; 
 Mon, 13 Dec 2021 06:51:45 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l3sm7680768wmq.46.2021.12.13.06.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 06:51:45 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DD3191FF96;
 Mon, 13 Dec 2021 14:51:44 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-25-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 24/26] hw/intc/arm_gicv3_its: Fix return codes in
 process_mapc()
Date: Mon, 13 Dec 2021 14:51:39 +0000
In-reply-to: <20211211191135.1764649-25-peter.maydell@linaro.org>
Message-ID: <87a6h4k16n.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> Fix process_mapc() to consistently return CMD_STALL for memory
> errors and CMD_CONTINUE for parameter errors, as we claim in the
> comments that we do.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

