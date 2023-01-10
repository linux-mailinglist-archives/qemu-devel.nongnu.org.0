Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE38E6643B2
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 15:53:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFEB5-0005tl-Gg; Tue, 10 Jan 2023 07:56:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFEAz-0005tB-Ac
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 07:56:25 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFEAx-0003gy-3o
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 07:56:24 -0500
Received: by mail-wm1-x334.google.com with SMTP id ja17so8712221wmb.3
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 04:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=71tJgIQCs7ueEr/v8AFbcWJ1xJqHy7WsUWnMUWGgZss=;
 b=HBGjXqzLNNJq9IyLmTEESJTif97TeZYULtF2YYMRSMp3BRYHgPPenyTCME4VI0J7uQ
 VyS9n/7YLouoWRbJQhEogiFtYRMUOk3ogxRGwEZz9p60PHiO07HwJCmvWsMNCE1gepLW
 aMIaCBlMPuyTjkV6tmR2TA7ZjFVVibT3C2/z1ADslhuyXz5fygPN4nKEApdavNV4Nb5d
 08zalmw2KLaKNfNdXUOqA2Mux1xX/XgaxOXQDi+AlfdhE0oqbAnBbaBHC7pERNLmWclQ
 lyce+6TQIAvbK+0E+hT1/t6ai96cgCn1rGwYcZX+vrvdDb7vVbyQzCIrk2lYMEGaC2jH
 sJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=71tJgIQCs7ueEr/v8AFbcWJ1xJqHy7WsUWnMUWGgZss=;
 b=XX0svrzv2UbGvP4O0zQWNxaG8TY3ePrJFdXKpip/A717Mq6m+rCRBCcGzUre6KmQqh
 YL5Oz44U4sOkvd56JMSKBb/Fi05ZRaUySrqtAiRROcDTJlokqdbdjh4fnRPdBGeoZa+9
 v0i28sXv3HGWiKlJ78AgInvMILQjEhJJHgoofc9cMISRHOv/OI5bRfGsRFdp19w5CHXl
 VFCgrcjdjMTLJdqWLJ5RfkwdTLHmHNt9dM8Jl1kHUc0JhNaFHyKoZZpoDVTDuvo95hl0
 ePdfMrfK4QasNnnAyPtcU5qy/3d0dKWlrE4O6lbDE5SP/DrSnKAGDBoCFf1mikOiGMle
 FSQQ==
X-Gm-Message-State: AFqh2kpR9MkaPOZOeQR1YCtXNgcBxpAITjkNbbpD1LY+SLdZG6ybhe3j
 J7wp+CupNyzF8Q0UNImRwJ5/iQ==
X-Google-Smtp-Source: AMrXdXskrTvhjLtcfUlKu1dE7Lylau2NXCjaLrwP54lk5bC8eh3t9OeGDjgGICZx8qIZuUvgtPybbQ==
X-Received: by 2002:a05:600c:5012:b0:3d3:5a4a:9103 with SMTP id
 n18-20020a05600c501200b003d35a4a9103mr48300171wmr.31.1673355381405; 
 Tue, 10 Jan 2023 04:56:21 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a05600c310c00b003c70191f267sm20940123wmo.39.2023.01.10.04.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 04:56:21 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 72BBE1FFB7;
 Tue, 10 Jan 2023 12:56:20 +0000 (GMT)
References: <20230109224954.161672-1-cota@braap.org>
User-agent: mu4e 1.9.12; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Emilio Cota <cota@braap.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 0/5] tsan fixes
Date: Tue, 10 Jan 2023 12:55:30 +0000
In-reply-to: <20230109224954.161672-1-cota@braap.org>
Message-ID: <87y1qamtu3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

> Changes since v1:
>
> - call g_free_rcu on tb_jmp_cache directly, and call
>   tcg_exec_unrealizefn after calling cpu_list_remove(cpu)
>
> - add patch to de-const qemu_spin_destroy
>
> - remove wrappers for qht_do_if_first_in_stripe
>
> Thanks,
> 		Emilio

Queued to plugins/next, as there is some intersection with plugins.

Richard,

Please shout if you want to pull this stuff in directly.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

