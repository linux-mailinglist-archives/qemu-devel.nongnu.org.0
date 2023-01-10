Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A593663D1C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 10:41:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFAd6-0001cF-8d; Tue, 10 Jan 2023 04:09:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFAd3-0001aL-Dr
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 04:09:09 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFAd1-0007vJ-NF
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 04:09:09 -0500
Received: by mail-wr1-x42f.google.com with SMTP id z5so9935734wrt.6
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 01:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KRoELvSfHcQPo35L8fw/HfgAs8Hw1gVQhewdo9wBd4M=;
 b=Wda5vL89CSWL2cceiuT5xTi4O2Q52iLJhWfI+7dSr/fQr9y31nzytDGTpQH1mEiFap
 L34qXMgbd0KozeYThXcllRU8X2NX/hautV7hkPgpx/dCSH56/GKWeJgpYqXAznn/VbWP
 GpAIUU9mn3As7IfXuSi/LowzQ0qxACXsN0gZ31uWXv5IOm7ufQBepaoAQgDsigtlBc3x
 +wNrngtqVhH1kDLoCpN/SoQr6CWFTc863oGxMI7NzX5QNQF/BwwYTshgZxefFjFN+SOh
 yM+XIDJlVZvUMhVSNkM9TZR7pCI89z7BsCDeTGNLE9VT94T+EHnRMrJA3wsXCUBtOGt5
 uygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KRoELvSfHcQPo35L8fw/HfgAs8Hw1gVQhewdo9wBd4M=;
 b=vlIrbgBvcZevomAv9inG41HqS1Mf6tzIymFdRbf0KUIOc2xRFAeg9UYylgz0awcWPe
 YJDvY+AoogmUYiFrQqmd3JQ5fdGdTjV8AqwOPDrPYxnV9HQTqHspOm1mBlRbKN3wu9oJ
 wtRjNOcyiyVGBd3nIqqliBi2QxEUgpxFdaB3+YqpIM+bUCDWzfiHQTj5ODjTEmPNSZCM
 /eyQJhGcY7PbfZf1p224YVSIRjyhwfKmVAwf1T5gXn0y2GLmxigvnmKeQ82v0Mw/flWe
 UL47ZGSd85uKVweLxsFt+MwutZ8PNB8LoTOZ2zpqrOns3luiQXLyR1AE1Qei5/8muqYQ
 duoQ==
X-Gm-Message-State: AFqh2kpMIVm++H6t4GRNEl23BN5hvakLfeNdTUCDHEJriJ3X6RI8HyxM
 o/CtqL//v9L+MEXmmS7Gy0y3cw==
X-Google-Smtp-Source: AMrXdXuIk95u+OqQPOKkNEMi5PsG3M3i3lJv6HoiMxJUvMMJOP634+UJ6Zwy2CUqas5gu/6Q3lvUow==
X-Received: by 2002:adf:fa4f:0:b0:2ba:f3a5:d0fe with SMTP id
 y15-20020adffa4f000000b002baf3a5d0femr9441538wrr.63.1673341745858; 
 Tue, 10 Jan 2023 01:09:05 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a5d6241000000b002bbdaf21744sm7682859wrv.113.2023.01.10.01.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 01:09:05 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 187921FFB7;
 Tue, 10 Jan 2023 09:09:05 +0000 (GMT)
References: <20230109224954.161672-1-cota@braap.org>
 <20230109224954.161672-3-cota@braap.org>
User-agent: mu4e 1.9.12; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Emilio Cota <cota@braap.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 2/5] util/qht: add missing atomic_set(hashes[i])
Date: Tue, 10 Jan 2023 09:08:59 +0000
In-reply-to: <20230109224954.161672-3-cota@braap.org>
Message-ID: <87bkn6oixa.fsf@linaro.org>
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


Emilio Cota <cota@braap.org> writes:

> We forgot to add this one in "a890643958 util/qht: atomically set b->hash=
es".
>
> Detected with tsan.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Emilio Cota <cota@braap.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

