Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F8E66E4F8
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 18:32:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHpnn-0003yd-80; Tue, 17 Jan 2023 12:31:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHpnl-0003xE-Lr
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:31:13 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHpnj-0007qi-3d
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:31:13 -0500
Received: by mail-wr1-x433.google.com with SMTP id r9so8595990wrw.4
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 09:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dvgzWXuv9D+9/Ks28khbanI5bN6UJWzmkv5U+v/8rCk=;
 b=QShYAMjKIw/GUHwxWixgbAbS8/mUf2QtEcM8dW3zrLZZWAQB2EQAGtRieS07P7qRRA
 uZfU3x63gT+jknJ9bZLHQy/ej5TO70O92RXRH+u4WALOFvC1muV6veGy/atezBdXxnaR
 /6MmZ8LrGMVIKSEiJXR0ABp2BeA9YqoJQ1AoZaw2Hg5e9QpxEojzFD44u/KY2b+V2KSe
 J/WAN7jJhkYLfgaHnCBu36e2pTml9qiKVGLClYKLhb0m2V8eF+CfgMuJBBP/bJLuEqHv
 Q3qteuc0c5rXhnw5exqpKc+1xIplot5C21B/OUoO9Ngh3C3XIliGlH4eiz+89FZbI0FU
 9WAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dvgzWXuv9D+9/Ks28khbanI5bN6UJWzmkv5U+v/8rCk=;
 b=zOK5TsJK78tn3bVl0aOrVJinkXs7xVDAPT0lZvss78HJrCXtM2cDVNDy4338ptpmmP
 5Bd3YQ4LlFRV+2zdCXWyoqQt0d4kITqxqMDnLXLPlq/kEY5WZXTrghfmTUiSkIwZGbSr
 nWsCdpxparKeEySlM9YPbu0L/4CHZKVeIN4mt1RCPV2HbRvVb++yOs6dQwV45l1AMQ99
 VCPlW2n8H9tqyaV10MeM/TYieFUilE/KopurmHEvm+YS8VOABnxuLR4o7ggURIXKIJsH
 /RaRXf5orzzKmc1SwoSs+Py09U28R1d0R6VeOSD8MoEK8cuXwGnrqpkiocY4+UPGRSv4
 LTOQ==
X-Gm-Message-State: AFqh2kqBatjzQr/wCUmu2yyL3xquBbfP4NFi9LyDF13aYnsv+xQzaq6d
 8wKOZTBneK0VbZAb4qUe1nOY3w==
X-Google-Smtp-Source: AMrXdXsBgNZ1A0C+qwq1yoiosDlGJ00y6Q/V9hogAtn1RZBtDlUnWbB03BXe9SHmgUba6PHdZPNmtw==
X-Received: by 2002:adf:edd1:0:b0:2bd:c6ce:7bfc with SMTP id
 v17-20020adfedd1000000b002bdc6ce7bfcmr3470761wro.42.1673976669572; 
 Tue, 17 Jan 2023 09:31:09 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u14-20020adfdd4e000000b002366e3f1497sm29614240wrm.6.2023.01.17.09.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 09:31:09 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 95A871FFB7;
 Tue, 17 Jan 2023 17:31:08 +0000 (GMT)
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
 <20230109014248.2894281-2-richard.henderson@linaro.org>
User-agent: mu4e 1.9.14; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 01/22] tcg: Split out tcg_out_exit_tb
Date: Tue, 17 Jan 2023 17:31:03 +0000
In-reply-to: <20230109014248.2894281-2-richard.henderson@linaro.org>
Message-ID: <87h6wpcbkz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

> The INDEX_op_exit_tb opcode needs no register allocation.
> Split out a dedicated helper function for it.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

