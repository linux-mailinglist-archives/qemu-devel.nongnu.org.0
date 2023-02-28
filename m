Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0DA6A5E74
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 18:58:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX4Ec-0005zy-GI; Tue, 28 Feb 2023 12:57:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX4ES-0005xN-5F
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 12:57:47 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX4EP-00054H-JF
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 12:57:42 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so10189254wms.2
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 09:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N0gh65sRUhsA2cQW+O5nyV56sqnxNUp7wWGO78elrfk=;
 b=Q2ILYkStOLzqlhPQ/lOwHLaZarYNtBP1rP6088k6KHEiFYADCUnE956ohoQOTPCd+S
 On7OUyA8W8KEDiF+2Ac3z76B4l5s4fxZRg0c6pfo+VomIYMZMDN4NAXJj2r4gKGGwQMD
 qLmgHeDrFRhVY8nTyMOuFMej4OqJicpF7HPvUUUE1No2IbuSJM0uyuijwfDPXfuUk7tl
 cxfML1Ar+BHn9QgeWjLrEvKMagpyfzTxMpJg5BcPu8RcnP4mJCs8pVJUiMADFi6bL9hg
 0wOyjvoAyNdk2NSmMwzZceureFlOcv/ckfzgMVk5SK+G0ezMl2xWTGE2kK/46nGX3gPJ
 Shlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=N0gh65sRUhsA2cQW+O5nyV56sqnxNUp7wWGO78elrfk=;
 b=flSSpPElLh0ftOBdbqhlvuTwYkkHzEp2B+sjONGAosF/ZT8OaGXFQM60fJ7wnjKsB7
 ZyHvPEY1UUBQQmn3Wd/Y1sVTKbwGJnZ3b7O/rKqxlt5pS+HTw1wj6z9DiTiObdAZ0VIx
 2ohZdHML8cqM07Bsk4ZTiDHcQWN02BGpOmD/ToWXQA5qxDP/7HLv+2p7SzuirXUWDNuC
 L63cqhEjI4dHftY1WPUsPCqRMbPJqJqt1CATCEdgLVUKz2d9RjI/7NAIf2+YufVj78WB
 2rEyh9bu2U4d/cRqHPDG/FgGc0zMu/JCzMz8jjSAJ2aTbNA7JSOkE6gD1Wm19/CiZ36r
 064w==
X-Gm-Message-State: AO0yUKUjSJyQCnciM3QQFgQBHFLhQQHcCN+A+dwkOh0pyTWFlk1aShQv
 CYHiFyEHXW0E5eNUA86E0gnc63kaVdCW+WBW
X-Google-Smtp-Source: AK7set/Dt/NJyggFxsL1D4/ePBvyzIBpIHzMDdpUr1GxP6HJYbDLQWFofd4JN5Z/HnoVK39kCTg6Jw==
X-Received: by 2002:a05:600c:1894:b0:3ea:d610:f068 with SMTP id
 x20-20020a05600c189400b003ead610f068mr2643212wmp.33.1677607059512; 
 Tue, 28 Feb 2023 09:57:39 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a1c6a05000000b003d9aa76dc6asm16693417wmc.0.2023.02.28.09.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 09:57:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D348B1FFB7;
 Tue, 28 Feb 2023 17:57:38 +0000 (GMT)
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
 <20230216025739.1211680-4-richard.henderson@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 03/30] accel/tcg: Add cpu_in_serial_context
Date: Tue, 28 Feb 2023 17:57:28 +0000
In-reply-to: <20230216025739.1211680-4-richard.henderson@linaro.org>
Message-ID: <87r0u9ekq5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

> Like cpu_in_exclusive_context, but also true if
> there is no other cpu against which we could race.
>
> Use it in tb_flush as a direct replacement.
> Use it in cpu_loop_exit_atomic to ensure that there
> is no loop against cpu_exec_step_atomic.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

