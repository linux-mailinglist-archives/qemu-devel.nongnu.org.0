Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E02254BFE89
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:28:05 +0100 (CET)
Received: from localhost ([::1]:56960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMY1E-00079u-PF
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:28:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nMXs3-0002nz-GR
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 11:18:35 -0500
Received: from [2a00:1450:4864:20::52e] (port=40881
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nMXs1-0005mG-Ss
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 11:18:35 -0500
Received: by mail-ed1-x52e.google.com with SMTP id h15so21177294edv.7
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 08:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=URPj+p7sdMUkm9Pe63Gwcq+49cwFR5bq3Aw3LiPoRw0=;
 b=iFkQ1aFrwvOdh4ARp6kWyMvXjQX/2ie26TP4/JGoGJnewrF5TL/TyQ4hqno128iGGx
 iky0NLM9ReL7OaKN4IN7Qh3Oohua36yGCYJ9lYe9OOJoIAz0CDlUZtOlSAEtAvnjQVqQ
 RWKJ+v9hDZmaDMl3kviYYUgsP29FZXaAc5EuvD9S2QLkvxxAAVrA2f1YJGlC0bqmM1ob
 DppZYiPqzlnOl5WQO1ACu6Zxo4To727Fh1HtDgzhqT4jco2rb5SY5MCvOkhL/9+1dqn4
 tZQNmwYc9kkkj3WIkTTxTlNyQcFwQJ3yukI4PUaAP7odxRUUCnpC3wW55qq/N0e3cWz3
 c2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=URPj+p7sdMUkm9Pe63Gwcq+49cwFR5bq3Aw3LiPoRw0=;
 b=7sSzu2LueGTuwnoCKMutOY6GZPzqB6EVOiQPKIsJZz5shCFN4ODIt+yEdq3qn9/odo
 KwPnDhM9UFWSuMOV5x0lYJJPFGWToR2J3Snufk1LaetgNZ3GB9VIwgMzA1PlbCLQSiS9
 n4ALNDrxrdTKpISkJAIgF4bwWyKmk6mTLMdwPBC76thyQvUQYpVC+9EHrsqJ1NXmjShm
 EDnY+RpFYUW7DKabpRw4Nut7p9eYtNs4ufHNDyFKw0N8O+vjk428MTQ+b/alIZRyKD0V
 Ox+iV3eIrLwgBz/wRqIat2SMln1Wk4oo0hCWfhXAZZj5GKoJLpU6TbE+LU0Um0oO9xje
 xEVA==
X-Gm-Message-State: AOAM531PqRxObcaylXqyEgnstolAowOw2qoKGGoWlTgmoQFc30mTUBrx
 81WSh6i17tO08O216oHgMAuTqw==
X-Google-Smtp-Source: ABdhPJyzxeIZ3ROwIeTAJOK/TfPRY4ZoL+lRVF9ECyyQ3ZH3KEty9D7PWoOU9E/pgMAJs8wq1Ce2IQ==
X-Received: by 2002:a50:f689:0:b0:410:a334:2b9f with SMTP id
 d9-20020a50f689000000b00410a3342b9fmr26487899edn.251.1645546711246; 
 Tue, 22 Feb 2022 08:18:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i8sm1980974edt.49.2022.02.22.08.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 08:18:30 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 78CB41FFB7;
 Tue, 22 Feb 2022 16:18:29 +0000 (GMT)
References: <874k4xbqvp.fsf@linaro.org>
User-agent: mu4e 1.7.8; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel <qemu-devel@nongnu.org>, Laszlo Ersek <lersek@redhat.com>
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Date: Tue, 22 Feb 2022 16:17:23 +0000
In-reply-to: <874k4xbqvp.fsf@linaro.org>
Message-ID: <878ru2nacq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <cleber@redhat.com>,
 Oleg Vasilev <me@svin.in>, Richard Henderson <richard.henderson@linaro.org>,
 Emilio Cota <cota@braap.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Idan Horowitz <idan.horowitz@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Hi,
>
> TL;DR:
>
>   - pc-bios/edk2-aarch64-code.fd should be rebuilt without debug

Laszlo,

Would it be possible to do a less debug enabled version of EDK2 on the
next update to pc-bios/edk2-*?

>
> So my working theory is:
>
>   - booting with EFI leaves a number stale code pages
>   - as the kernel boots it clears these pages triggering lots of
>     slow-path writes
>   - result very slow boot
>
> I think the only real solution is to improve our TB invalidation code
> but perhaps another approach would be to detect a high TB invalidation
> churn and just tb_flush the whole thing and start again?
>
> Any thoughts or ideas?


--=20
Alex Benn=C3=A9e

