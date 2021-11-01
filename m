Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E259D441B42
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 13:36:55 +0100 (CET)
Received: from localhost ([::1]:36902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhWYY-0006ME-I4
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 08:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mhWTd-0002Ee-Gb
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 08:31:50 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mhWTa-00035f-2f
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 08:31:49 -0400
Received: by mail-wr1-x435.google.com with SMTP id v17so27895511wrv.9
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 05:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ovb//gKht9NemRnUfqvVOX6eTQ3N34O8Ui5x1gvAFK4=;
 b=SW/pcHbkV3flpylOBoYGfqrCVo5zbN4VrEuBCKYtrD8twF/NistzKKE/sPqEdo79G/
 RhnhPZLGp+LdjNF9LTyiacdTd6JTylZo0FpbT36TQoqFb9R9phb5NO7Tmoy6ra6wMEbp
 SJrEiHIqDsyPSlzjjN3xm//+FudhknrWQ4AIHZW3Kod/Px2xTXwkVZTm6FzraHC8PzMp
 FredGJdJ5qT0lGPFoyBSqUZIQ5MeZI1eUjzg/YxrnJ1W6BpzZwMcLYI6EyxQKEhneTSy
 eohr/2nzS6RfqQC7geCWdru4VFjHDyFhyNqtYxDedLmHzkDmS4bGO2SzhUKy0PnDucIB
 tzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ovb//gKht9NemRnUfqvVOX6eTQ3N34O8Ui5x1gvAFK4=;
 b=BSUEDImjg5bRXKtrnlQtXFeAuzwAINm2Sf1iLTwwQ2zcFC+QAm66Youkb7Bdophi7o
 MrBsM+ktqJQwOb/4MfM/YZz7puO68QEAl5RtLTEw2YT4XFeicQqtLtC70gL9GMtCPNIn
 8YDghJx0N3MF8LLj0337BguODDSbYTzNncCpwB98/TvzzxlBqJFZectrw10h0jpygC2s
 w21PGmBKTGa8wwd8weBKYRqcHELLryNpe82zY9ZE1SRpaDLK8npeA+hqgjjPNM2joxSZ
 tt2KgumkYFyETJbfNAtgen709T3QgBC6ZJvicYbAgl8Aw8hcct07xjVtef05U1eJeSfC
 uGeg==
X-Gm-Message-State: AOAM5310eXurvx4UxmFMEXxSzw7IliIlaFWlahxx5sRl+c1DpBfuLzRq
 1Qom1ewyFUQOHe+e6KVPGaGhbQ==
X-Google-Smtp-Source: ABdhPJwJGu907yN57UWE8GCzRVD76E6Q6tFEPVJ9siZSxKZmQ6Qu8jviIkLkSK0X8xUXW0yDyFOS7w==
X-Received: by 2002:a5d:604b:: with SMTP id j11mr14540875wrt.22.1635769903656; 
 Mon, 01 Nov 2021 05:31:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r7sm5743697wrq.29.2021.11.01.05.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 05:31:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C841B1FF96;
 Mon,  1 Nov 2021 12:31:41 +0000 (GMT)
References: <20211028184440.1508585-1-richard.henderson@linaro.org>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] tcg: Extend call args using the correct opcodes
Date: Mon, 01 Nov 2021 10:14:28 +0000
In-reply-to: <20211028184440.1508585-1-richard.henderson@linaro.org>
Message-ID: <87k0hskqfm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: luis.pires@eldorado.org.br, qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Pretending that the source is i64 when it is in fact i32 is
> incorrect; we have type-changing opcodes that must be used.
> This bug trips up the subsequent change to the optimizer.
>
> Fixes: 4f2331e5b67a
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

