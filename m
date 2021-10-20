Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2165434FB3
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 18:06:21 +0200 (CEST)
Received: from localhost ([::1]:43806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdE6c-0001jX-9G
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 12:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdE2e-00060R-2u
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 12:02:12 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:46594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdE2b-0006gL-A7
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 12:02:11 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 l38-20020a05600c1d2600b0030d80c3667aso11336105wms.5
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 09:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=9mkRDhzmf1EigP6zaHmZVNTMbtTotqvz1Luy0bXjlWs=;
 b=M+arrx7PDBpI22PxUFSXrIemu4HzJZUpJImjmm6pwu7BbJQRPT9/IWBFSgzLylMWEL
 LaGazQmGUmxfkBMr638POw7yDN9kyI+DI9pz/4mVWL4/rF9Iz+IwZ/UDGvXAz66kbeUT
 3Uv4oxN8CbHBR7MlCocUjoJQ7+OvbJEJ4Xe8G6QSj3NV2tKq2jROaz+FXQ9AJqXbhumJ
 by25UlMt0Haghf5fAY0h9dKIH/TSIcu/OEtWyzpoZrYukqQXOTruDyJtIcKfSjwRnPkC
 GD52S9wD0gXf/RFnqYRtZbBD8z3XFbzbBjW8yf9ceCs+86y5vinqzf1DjEPutmeRsTEP
 edZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=9mkRDhzmf1EigP6zaHmZVNTMbtTotqvz1Luy0bXjlWs=;
 b=WQC094dIoL928t/quWxrkNhhMt+m3grU2aKM8X8jTiX3d11S5hC+FYMZ+jMYmxtguz
 6G1iU7g7n0+3xba/o8im9slZDGq4A25G3WzC6nKyf/RoZxZRgKml+SHCrk4w4wwIgNLP
 XwQRR+080/5EImb5/jqxMXz5GX40iDwNbWYBV2Dp+Tnu34ovbhgrU+DVxfOAegYQYNJ2
 SoqMnIWLNXy6CBdp/5uZieWjlkL/r9hP/9pVwPQl4QC0+ADGSaiotdqTQ8NsswJDr4rJ
 MdfigODfeBRwhzqykqBLVQ5PIGKmUL27rCcccUsTlf3ctxSfXUbU+rqv5WjMDejT0Jx6
 BYCQ==
X-Gm-Message-State: AOAM530RN/4UxKNc2mzIRuuwy5KExzvbzVTVZIibl2Qi0S0cm+MnSXyO
 VUiT36S2HXrY5Hao4rF+JZKA+A==
X-Google-Smtp-Source: ABdhPJx1PTjFytSiwx+k1YDzK/nPQ0xrnYrYPgAj0lf1pdO5OrTA+oteVBYttoYRFAV1g+MofZ5QuQ==
X-Received: by 2002:adf:f309:: with SMTP id i9mr110529wro.256.1634745726514;
 Wed, 20 Oct 2021 09:02:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o26sm5389101wmc.17.2021.10.20.09.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 09:02:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D37D11FF96;
 Wed, 20 Oct 2021 17:02:03 +0100 (BST)
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-8-richard.henderson@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 07/48] tcg/optimize: Split out copy_propagate
Date: Wed, 20 Oct 2021 17:01:58 +0100
In-reply-to: <20211007195456.1168070-8-richard.henderson@linaro.org>
Message-ID: <87tuhbvg5g.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

> Continue splitting tcg_optimize.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

