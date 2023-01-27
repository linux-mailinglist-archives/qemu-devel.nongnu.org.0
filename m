Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 928AA67E720
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 14:54:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLPAK-0005O7-So; Fri, 27 Jan 2023 08:53:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pLPAJ-0005Lx-3J
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 08:53:15 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pLPA7-0004gH-H0
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 08:53:06 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so3522066wms.2
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 05:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/mGuIKgVsTE+CvJoGsAzJynfI0o3WXdnbTyYl7ZYs8I=;
 b=Kkp6JGnj12rEluQGo44ejl0Jl9zXmvV3FfcPGMbZDS8gXOtTwvLpvStp9Gd+C94ajQ
 +LPxgVoiRzj37xXqbEPK5WvWw82Av5lqdNNe7mOvUUFNrwo7hMWlEU/fzQp2QpPgcTov
 NAmCaulAqWjajs4CKLlpDNhHKpCqtYaicmWUNNRS/UbnI2AIZYN4nXfF1SXn1CNXkQmH
 NjKtGjnfJEucv2InFwikv5PSBBYn8AtYrC/pzUQEuR67aP5xHudv47cHRh2J/U4azPqy
 nXltzfeAHtj5533YTnvaN0KRmq2+JLPjGoN2i9gMgzPsJ6DphMalQP5CIUPEvRt3B8xA
 kCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/mGuIKgVsTE+CvJoGsAzJynfI0o3WXdnbTyYl7ZYs8I=;
 b=YX6uSqq1BHL68wr4FlgcAXjs83R/3JLpOw7BByvztYjeGh6+iy6wWKsbadolH3EjaJ
 hMz8490rebQwe0WhRy1qNL1+rk3mnJXpNZqU75cwjLuKg90+fEFDXhVocdALbQeG6ZJE
 ISqwB7ahS3Z8VDTcpjfPWpdLY/mRUw1ksJtdGoHIt9XX2eyU1YRKA7InNL9Oc+cHVmL6
 kVIDgpM/+49Rymyk0NfhmVVvisACpw9IuaqMA2Cgpq37lc5eTJUglXO6QUphUQFBFfBm
 QfgJrmRFx/Redb2hwiWZ4/UyvUFH/a96up6fn0pTGqAUPu9BbaypJEL2K389hCiF0OiF
 AIaQ==
X-Gm-Message-State: AO0yUKWCvs82LhiBk1C15zOGQizHkM6B87P8gBZPgZNrA03K1YcKaEJh
 1zAdgoS61DuZqTO55lawOqcsMg==
X-Google-Smtp-Source: AK7set+IxtuOzER19ANrX2MpVSEL9xUq5cLy+LAhAl+yDRjqSfxUWU3e4UFGWJl+Rs7rNfci1+jcrw==
X-Received: by 2002:a05:600c:35c4:b0:3dc:4313:fc59 with SMTP id
 r4-20020a05600c35c400b003dc4313fc59mr299301wmq.28.1674827579435; 
 Fri, 27 Jan 2023 05:52:59 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j38-20020a05600c1c2600b003daff80f16esm11096573wms.27.2023.01.27.05.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 05:52:59 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8C21E1FFB7;
 Fri, 27 Jan 2023 13:52:58 +0000 (GMT)
References: <20230126043824.54819-1-richard.henderson@linaro.org>
 <20230126043824.54819-10-richard.henderson@linaro.org>
User-agent: mu4e 1.9.16; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v5 09/36] tcg/i386: Add TCG_TARGET_CALL_{RET,ARG}_I128
Date: Fri, 27 Jan 2023 13:52:52 +0000
In-reply-to: <20230126043824.54819-10-richard.henderson@linaro.org>
Message-ID: <87r0vgnkxx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

> Fill in the parameters for the host ABI for Int128.
> Adjust tcg_target_call_oarg_reg for _WIN64, and
> tcg_out_call for i386 sysv.  Allow TCG_TYPE_V128
> stores without AVX enabled.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

