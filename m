Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926376C507C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 17:22:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf1Dp-0001iy-G2; Wed, 22 Mar 2023 12:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pf1Dn-0001iZ-9K
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 12:21:55 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pf1Dl-0007Dp-F4
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 12:21:55 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 p13-20020a05600c358d00b003ed346d4522so11877520wmq.2
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 09:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679502111;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sX1GrapPE7KPgHgrKcW8nFNUR4W3JyWmEQMdyCxeUMY=;
 b=I5kjSP6mOFaivuZaoET1/BCKmFBBnsXjXUXl0yw/lwy3FJmcIcKvyQF0bntH2f+yPC
 05EkiJVVfU7aIE0kNFTYTR/ZNSfNO0TY9uUh42ygvUjGRoNzwvV7S04ba3uXqx4PNpGT
 nJExaWViusSagMAH8/jqg9kduKq5wWH1Kee4go6Wzirf1naECnRtVpe5er8c0VpSMJ5z
 2VWsoR8hLscXtjmnkVCbiqMK5Ec6uqK5Actt7b9g8EwchDcdqhGmH6LvtWZ8qOuFZkQz
 d7ObsqyKb/9e7kuTOG3RjoWWQc1Pc8hpFW+AoakZ6XZ+G8BT0IqTquCPo3IXFRuv84l0
 pKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679502111;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sX1GrapPE7KPgHgrKcW8nFNUR4W3JyWmEQMdyCxeUMY=;
 b=DiLsK9Inv+zGAeofzoosfnnD5LsEezV9TOOrMykFFWQCdL9IuuKN+PKRA7XODzyinp
 IgX+6NQDObRvIiImrRe+V8nm4TnPN7mmlPmPetkeVnSERTnWvW5doz2vu/kbb/Lp1NzO
 9cLGGd3kGz7tMaSQcwW/1gOdU4c8puHw/2Z2ehSV3aBXErqNYN8AgJCCdzcQGYH7GAIi
 RE3yT2UnLGgAjjgcCwblom8wsKHiUyfwMop24maQ5jc/SZnJWMjYodlhlCL24E1PtLBN
 8nv2DoN7tlL2tWnn6xct4M4Pk8wfQDslIhj7X+MekQF1MXeWUwl2f2W+xtUiej1KffJl
 bhuw==
X-Gm-Message-State: AO0yUKXUnaUhCOXrPK7TAcm5IEYhdS210dtZRVi7HTa5NKqOuILZpTx1
 lDzgHj3y/0hYJEUamQu61if7Rg==
X-Google-Smtp-Source: AK7set8QRVhznpe5LdgHUkKLLPeacZVGUwK8nZmBGma2/A97kWqFaM/M9AEQaSHELk5i8GEP0hV/hQ==
X-Received: by 2002:a1c:771a:0:b0:3ed:e715:1784 with SMTP id
 t26-20020a1c771a000000b003ede7151784mr118088wmi.15.1679502111146; 
 Wed, 22 Mar 2023 09:21:51 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a5d4c51000000b002c54c9bd71fsm14076489wrt.93.2023.03.22.09.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 09:21:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1038D1FFB7;
 Wed, 22 Mar 2023 16:21:50 +0000 (GMT)
References: <20230322142902.69511-1-philmd@linaro.org>
 <20230322142902.69511-3-philmd@linaro.org>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 Claudio Fontana <cfontana@suse.de>, qemu-arm@nongnu.org
Subject: Re: [PATCH-for-8.0 2/2] target/arm/gdbstub: Only advertise
 M-profile features if TCG available
Date: Wed, 22 Mar 2023 16:21:45 +0000
In-reply-to: <20230322142902.69511-3-philmd@linaro.org>
Message-ID: <877cv869k1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Cortex-M profile is only emulable from TCG accelerator. Restrict
> the GDBstub features to its availability in order to avoid a link
> error when TCG is not enabled:
>
>   Undefined symbols for architecture arm64:
>     "_arm_v7m_get_sp_ptr", referenced from:
>         _m_sysreg_get in target_arm_gdbstub.c.o
>     "_arm_v7m_mrs_control", referenced from:
>         _arm_gdb_get_m_systemreg in target_arm_gdbstub.c.o
>   ld: symbol(s) not found for architecture arm64
>   clang: error: linker command failed with exit code 1 (use -v to see inv=
ocation)
>
> Fixes: 7d8b28b8b5 ("target/arm: Implement gdbstub m-profile systemreg and=
 secext")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

