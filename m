Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C0443B75A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 18:37:32 +0200 (CEST)
Received: from localhost ([::1]:34852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfPS7-0000Fe-KO
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 12:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfPPD-0006Qh-SN
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:34:32 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:44576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfPPC-0004Pu-1K
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:34:31 -0400
Received: by mail-lj1-x230.google.com with SMTP id s19so16901629ljj.11
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 09:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=oA4d7UQCFmNYbtPu1okuyVQtFphNNu2FuXqzcdwqOnI=;
 b=ytPV1AWHBFFFz/nvahVDUpZrOLR1IcNJXTNbZgr2gfQrrYKD59oHTf1c/O40Ny6mCH
 UUMY7mXeWF2rNvYtQ27u7uBwzTI3AbzCtT8v5YcnvND3mhLry/ysehH3p2cvNTITFOhN
 qCs6smSZlFUfaL0yr6vkJWwLvhdM7EAZ/kniXHfTRC5w6LcCDKj8xBSnLgXgYsudvBD7
 7qYiTVhgbpeBiBP2MHBxhNhRoHcJLyEtP7LJybbDv2ygOb+F+NemJNvFDdZBXGLgwtJE
 l0ZjQx69mFrmuUuHRc4qulGhtzDcQhpFWflWD+RACDMCZUGIqFxltt65tkmCiDhJKVWI
 M1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=oA4d7UQCFmNYbtPu1okuyVQtFphNNu2FuXqzcdwqOnI=;
 b=UqDxU/2oi56EP0kLhtvJKC/Gn4TXZf/k/YidQNRtV7gwQLomYQ58HYWYcxSuE5WJGA
 osnxKoh4rM7qNepJgulil77WqCgAEu1GbX9QzUFZDIsi4FMrLvnQCCqvdQpebDd+myib
 DIAHzYXpZPePwwBMRbI3ABvEBZZX93adPMK1oiZa44RxUrqi7w0qj302GHpe+GVHbsvR
 QdTIxrgAq8hWcp+dvZMekQ7iTvrZINnfA3lMGUAzA/FXsQcXG0gJB5KAG/qWeg4TjB5v
 sXk3RJKrZnbD6atCKlgxZTbLtKvf09BdQhOQIB/R4A7IOJABjzyc0qy4hftCWnLOtbLT
 2iKw==
X-Gm-Message-State: AOAM533C1+eqPp43eYsseib5pLvO1yfFILRVzJMe8D4fkpDveT23vgqo
 3bj+IMe4jBWnQpHR2/7ex4jFcg==
X-Google-Smtp-Source: ABdhPJzZI4gGFdcEACOwRyEhF5pJiiqr7UXZg0OdmovgrqSL1QuJ4ox2HViJEJ0uDIwpyzDEC7d1xA==
X-Received: by 2002:a05:651c:111:: with SMTP id
 a17mr26536247ljb.145.1635266068393; 
 Tue, 26 Oct 2021 09:34:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w26sm2397002ljh.18.2021.10.26.09.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 09:34:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5C3691FF96;
 Tue, 26 Oct 2021 17:34:26 +0100 (BST)
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-45-richard.henderson@linaro.org>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 44/48] tcg/optimize: Optimize sign extensions
Date: Tue, 26 Oct 2021 17:34:16 +0100
In-reply-to: <20211021210539.825582-45-richard.henderson@linaro.org>
Message-ID: <87k0hzzqwd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x230.google.com
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
Cc: luis.pires@eldorado.org.br, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Certain targets, like riscv, produce signed 32-bit results.
> This can lead to lots of redundant extensions as values are
> manipulated.
>
> Begin by tracking only the obvious sign-extensions, and
> converting them to simple copies when possible.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

