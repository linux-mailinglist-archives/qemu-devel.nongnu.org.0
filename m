Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC173A12C4
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 13:32:10 +0200 (CEST)
Received: from localhost ([::1]:57136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqwRN-0000Lg-Sw
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 07:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqwQ9-0006tm-0I
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 07:30:53 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqwQ7-0003FG-5J
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 07:30:52 -0400
Received: by mail-wr1-x42a.google.com with SMTP id o3so6703948wri.8
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 04:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=qsff9arP5b37s7MVi6ZJeEG9tSAEaYW9/3VNnoItIiY=;
 b=bS+66+Am+ezcUYHPZ2p4okFiBW0kxbqvXVupvuolIynX1x4ddiNhhMOWYdKYZ7UfJO
 V3rWThsrACojrOTW9vBISvqZ0InDx/5rfltr11SmcUiSPXOGz076Kcz+hU11iTheX+2D
 06fgpNdijcFpxxZsqMu/Zz+dzuKjspFEjReaLoL7BpHyZ1U47rkfsddBQczmASBYMNGL
 JzfJ74a8lHVDGTgSSUA2f0xEw4aabaEABjvAVlpBcZfR8WJPnfaYkcXbTRz2cEUZMdmn
 pnUCuC0SwnzX+C3qJeA/aa/c7qV9hlLq2jioKdGGz+LsAAg1UroShUGUxcbqe8XfFS/c
 vJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=qsff9arP5b37s7MVi6ZJeEG9tSAEaYW9/3VNnoItIiY=;
 b=U/BnlBsC0MhyVLCG7HD8vVNJkrg4rqP4iUn/rV/oolsejH5cWRAnAcpWDNcEIeIIDA
 /lf+9Z3CDsceM4OlW1T6DqxdC5PrJPdJikV0FfyB+KRv5K2g5Jfcqn7PSX9YGdQZBM3G
 SyZ/ja8XR9/Fl0plFTZ/3g9O03fL83fXeQ8diNtacrAWAiizTqWal7fedoC1uDVM+Jtp
 bbnVPTFe68y+MMvbq7pJFTNHz/RZnSBRyz9NRQ2S1FJkjZo/87yN52NtPXBl2Gqj/Dzp
 BGbetuGxIs8dgxp0qnNLOVCBI8pmxhzsLyq6WZpakz4YgDUFySoYZxiQo8v6g4dD6S6F
 Xjcg==
X-Gm-Message-State: AOAM532imiBtAx8SuQlqumGMVqhAEITw6SxmOmxhdIjtxr9IUb0BUHN0
 hyDTSuAsgavN5Y6jxvgADbR4vQ==
X-Google-Smtp-Source: ABdhPJztxGulCu9ignabMemCcajoJBgpsCU5VqTNzggWboMgvniopjCmZXgbcIBtiUHIKYdUlCnULA==
X-Received: by 2002:a5d:4a4b:: with SMTP id v11mr28058122wrs.246.1623238248764; 
 Wed, 09 Jun 2021 04:30:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i21sm5830414wmq.12.2021.06.09.04.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 04:30:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1F5C61FF7E;
 Wed,  9 Jun 2021 12:30:47 +0100 (BST)
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-29-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 28/28] tcg: Move tcg_init_ctx and tcg_ctx from
 accel/tcg/
Date: Wed, 09 Jun 2021 12:30:42 +0100
In-reply-to: <20210502231844.1977630-29-richard.henderson@linaro.org>
Message-ID: <8735trjmvs.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> These variables belong to the jit side, not the user side.
>
> Since tcg_init_ctx is no longer used outside of tcg/, move
> the declaration to tcg/internal.h.
>
> Suggested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

