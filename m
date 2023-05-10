Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1647B6FDF28
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 15:51:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwkD7-00046m-1X; Wed, 10 May 2023 09:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwkCn-0003wd-G4
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:50:09 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwkCh-00027e-F2
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:50:04 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f420618d5bso29787575e9.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 06:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683726601; x=1686318601;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6auvlv37Fi1hzFy+Wmiak3D0+JSZnTyE6fUN0VQfjIc=;
 b=xkpch263kILocWPpcz9+q1cbRJ/hkNyzKAq98GlTBz86qRaBrJt+XeRcQlvt/Z9PG+
 3yf8g3gePEPcgWf5I3ii+90JvZRDDomAgX/Ib1HQqGg0Y9HqCKRSyg/f/20slUoFQx7q
 oEpt3ATyXT5PhGtLHO/DH3EQ9UQwspDZ9XLUmWSkACfZBy3ze1luzsvPhwnVLYQAkaRK
 Ul9oRQGv00Hh0s3w4Ir4xbWA5N6MRYmucTkW2lLOuT5eBnvXB92U2lPttLwUkFlJyX4I
 ysoEHc4cyPkw64mHr6Xfx7getjqfMTq6JkjtX6zrUT4l63ptTDWjRZ1mEFyHD4zXPHg6
 fB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683726601; x=1686318601;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6auvlv37Fi1hzFy+Wmiak3D0+JSZnTyE6fUN0VQfjIc=;
 b=LAidGfM9PzvpcplWbM462Phu+CUfCXvLovz5Wcc9r3TTninGV8vyZoL60mJ1fNouSn
 7yCfiBT5fbV+7hLFJKh7d8gz5F+9XxyGJH2Fk4Ft6EPA60x2iceAW4HV+gAqtQymg8LJ
 PEzT9P/P6E9xoMa+I44Rgyf3tXvTLihgYc8sICDq8CEcqZDNS9FXtolh7sLX0Z2PFCbg
 7iZ8+f+8m93KwOVX+a+1PbpTcuplPwrBdCihI9IQeqcr49R3gwkSnCyaVRxzWsuAQPzS
 SvJTa7ldlAZnlBxiUCrVk+gjwm3wHxAiyhG9ekZsYveaPwMu6NUVKOFpPemw0AY6LZIM
 0hpg==
X-Gm-Message-State: AC+VfDwj/FQDhjcRiwC7AtKX2+JDIlf5YXSKO6OhMtxLMSbdJtAnQXtJ
 3wRC2HpVouA0oSZVUGr61Ztu/g==
X-Google-Smtp-Source: ACHHUZ5dLA8MLnjsPdw6oSitbUkcXxSOQVqiBMtQoZAsjR7Md8UvJEdgi9J9Im35bSiMV2Wu58Pn8g==
X-Received: by 2002:a5d:5589:0:b0:307:8666:a50e with SMTP id
 i9-20020a5d5589000000b003078666a50emr10030548wrv.67.1683726600785; 
 Wed, 10 May 2023 06:50:00 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm17529458wrq.82.2023.05.10.06.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 06:50:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 07BAF1FFBB;
 Wed, 10 May 2023 14:50:00 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-23-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 22/30] tcg/mips: Reorg tlb load within prepare_host_addr
Date: Wed, 10 May 2023 14:49:51 +0100
In-reply-to: <20230506072235.597467-23-richard.henderson@linaro.org>
Message-ID: <874jok70u0.fsf@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

> Compare the address vs the tlb entry with sign-extended values.
> This simplifies the page+alignment mask constant, and the
> generation of the last byte address for the misaligned test.
>
> Move the tlb addend load up, and the zero-extension down.
>
> This frees up a register, which allows us use TMP3 as the returned base
> address register instead of A0, which we were using as a 5th temporary.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

