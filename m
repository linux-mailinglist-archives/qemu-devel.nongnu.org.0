Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B76F16A5E9D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 19:09:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX4PF-0004Zs-HI; Tue, 28 Feb 2023 13:08:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX4P8-0004W3-OY
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 13:08:46 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX4P5-0006he-2e
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 13:08:44 -0500
Received: by mail-wr1-x429.google.com with SMTP id bt28so10706458wrb.8
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 10:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0NB9HuK6NgT0TlXOTE/SSLG4kaMh3/am3/EqiNB+zCs=;
 b=Q9tKGiIFucfQqL4GBXQZvBCTNUa2kHdfSeLRbcyT1KMrOtySuyGlFfc1LWO39U5m/F
 g15GvQ3VGPiLDNr7aruCk971/CKmPix7tocp7wuZtTBaSBbQo6OI8EQsM8sdQCOl+MFY
 IKA1UBlFjeUX0cf+oupaOu2Dge2lOeqLrcZRYbYRoQ/KCq4f1r86VtJRB2P06CBHcxX2
 30qG9jbTcjmq0OikfOEvGaNhRdvmmT+801l43ZYK/uIy9aKxpJm1CHI4VGblULPYa4lq
 S+0gOlsvhJqbpt6lK4ZnGHPMhO4fuMI5fZhACUuaJhF0uO5KMa7fOwHDga0TFbLyOQS3
 dcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0NB9HuK6NgT0TlXOTE/SSLG4kaMh3/am3/EqiNB+zCs=;
 b=0tLNWhOchU7XvYYF61XSfnZfiaUV/SML2NfdRxO/Uo0F9oFAT6tIsfpPpfnP6IjEEf
 3KkCdQrIbDE3IdxePpiK4uYULVyp9RS7mMXn137sRaXGSS3ugcc1+Syp+WcdwbGOi7WY
 a5Aj1T0tIVPZF53MMHCd0wcWRFzwzbdFNmIusc2BaaWjU4Y6c3Q4fhwLxWukwTmxdO8U
 0kYL2UBc7C2j4MhC0sqn+kR6geWbaaPZo8jvcKCNS1amMtmopk2EzJPYaWJ8FR3Yjn7/
 aH1tArA6/0ydSNrpZQRy598eNCUutGQBdqcNJ9rfavqWlmDlyQBDc4Chj/k+oGcVQL4X
 P3FA==
X-Gm-Message-State: AO0yUKUF3H9CIVo2z31KMtXh3UtvlcO+DjcFFnfbZOqoEe6FZGN4d9aB
 vj6annBD2SB3k3NXpyK1ONLH1A==
X-Google-Smtp-Source: AK7set+vPpCFQ8YF1Fvnhw7qmGwJg/UhG6xF9e4kJuMQOmmhnBZs/8yxxHdQiHRs2sQhVzQjocWTbQ==
X-Received: by 2002:a05:6000:108c:b0:242:1809:7e17 with SMTP id
 y12-20020a056000108c00b0024218097e17mr2745795wrw.6.1677607721120; 
 Tue, 28 Feb 2023 10:08:41 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 y13-20020adfe6cd000000b002c8476dde7asm10388833wrm.114.2023.02.28.10.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 10:08:40 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4C6651FFB7;
 Tue, 28 Feb 2023 18:08:40 +0000 (GMT)
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
 <20230216025739.1211680-6-richard.henderson@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 05/30] accel/tcg: Reorg system mode load helpers
Date: Tue, 28 Feb 2023 18:08:35 +0000
In-reply-to: <20230216025739.1211680-6-richard.henderson@linaro.org>
Message-ID: <87ilflek7r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

> Instead of trying to unify all operations on uint64_t, pull out
> mmu_lookup() to perform the basic tlb hit and resolution.
> Create individual functions to handle access by size.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

