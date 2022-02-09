Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C70C64AF63E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 17:13:26 +0100 (CET)
Received: from localhost ([::1]:56056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHpav-0008GC-Ew
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 11:13:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHpQ9-0000sf-UH
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 11:02:18 -0500
Received: from [2a00:1450:4864:20::532] (port=41591
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHpPy-00088e-Dw
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 11:02:15 -0500
Received: by mail-ed1-x532.google.com with SMTP id cz16so6014200edb.8
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 08:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Iow97c6CW91dEsYjU2ccERfIJeCAGb1ckz4p8yVFaxs=;
 b=EHFklMkUL7K3ZQG5HC60v/D1oxY1/HBheVL2KNGAw9xwNmiqIcH6jQfexPF0jmHYQA
 8aVamHlQ2jPu7FthNLGx7nMBUdFteE9tKL3Ah1u5mjI78eydKqSIDSg03cVGmhQawdWJ
 X6WZcb0/1/YNzjY722JVVSbVhim7Oagnx85id6fiznYJ5mTV4P2MQb+gqN/YfAof9bjE
 Plj1idboZ4PfO09UMJFfHpee4WlxV2Dqy47OMjBYmz4Av6EbwtJm9SCOgHdwOkpYeg5b
 Kj01dEZu/amk76bY4AlKCxvoZSyUWW5HngKVHfrQ4kIZQ9EE9J6sXAAMpM9n74uTAQEI
 mPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Iow97c6CW91dEsYjU2ccERfIJeCAGb1ckz4p8yVFaxs=;
 b=hPv8zJovbfd9zfkxxsS2xUZnPAmtfy28Ye0hiHZdKnTOAXjv6JhdlXO8/D9wFJ+NcB
 EW0pfpAdlRbQ7A08hdtMIaRx7gzDwdlwdn4iQwES6UiSogqwozhhWh0ZSMxrwwh1NG6w
 c/nI0I7SF/can3PD31yKOMo8wMok11YBFvQs1tOA8c9wnVFXfG6RU+1JFsm3FMiW0aV0
 aGQgXwQO5JE+VVM/ZkGpFCxlBCf1mdMkHPBfxv8FOlxSNtCnekUuIpfxpi2R7TKd9cuR
 rrYSlfPEq/0D+xp0GFjuxE/KgtGrMaX4KpUnURaUO+uBRJQNtb6AvDM1Y4qEVCZkkFVp
 mEYw==
X-Gm-Message-State: AOAM531DOnmbLiUT8zR86Gtdb47Wz4A4bDG9R/AoPwdk/7iGK9sEpANs
 e7VWADamdaI0zxYc2ErJsb2kGw==
X-Google-Smtp-Source: ABdhPJz09t6kP0a31rMlFJ64ATOu1bs+nYn1HEhkFkKYcdj5Tq6V/M/6xCoLocPgXFj77nXYUapHYQ==
X-Received: by 2002:a05:6402:2691:: with SMTP id
 w17mr3247612edd.126.1644422524509; 
 Wed, 09 Feb 2022 08:02:04 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s16sm6431102edy.70.2022.02.09.08.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 08:02:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A221A1FFB7;
 Wed,  9 Feb 2022 16:02:02 +0000 (GMT)
References: <20220208203145.3844662-1-matheus.ferst@eldorado.org.br>
 <20220208203145.3844662-2-matheus.ferst@eldorado.org.br>
User-agent: mu4e 1.7.7; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: matheus.ferst@eldorado.org.br
Subject: Re: [RFC PATCH 1/3] tests/tcg/ppc64le: use inline asm instead of
 __builtin_mtfsf
Date: Wed, 09 Feb 2022 16:01:57 +0000
In-reply-to: <20220208203145.3844662-2-matheus.ferst@eldorado.org.br>
Message-ID: <87wni4do5h.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, groug@kaod.org, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


matheus.ferst@eldorado.org.br writes:

> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>
> LLVM/Clang does not support __builtin_mtfsf.
>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

