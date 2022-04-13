Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E034FFE1E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 20:46:45 +0200 (CEST)
Received: from localhost ([::1]:35122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nei0r-0007NR-0k
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 14:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nehyi-0006KR-7H
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 14:44:33 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:41671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nehyg-0007pz-Li
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 14:44:31 -0400
Received: by mail-ej1-x62a.google.com with SMTP id bh17so5765137ejb.8
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 11:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=QjXUGtXI4WJ7rAgCwyoyBVxLYbOOEqyj2b1edygipeU=;
 b=kCg7Vk2WH2UwynwY3RnEs4pfGuVYp+k2Q8Jg7QBujcpEehLjPMXODCpGaD9g3E+VYz
 YFoQVTg6C4OW7xjy43PJgRHoT38JRGDtxgKbiqLo+tdo1D4Q/gU1zWUINsLGtxLRBv8X
 +5k8erZX9+ngYfHYs+jpvDAUF2kUzWQyE2dvUJV8ot7QoXN7IRTW3O8pjpHsNJ5vZ3IO
 KVVZpYD0BMH7Td9NJfyUggdgZUapuyaBpOFBl6XhLno7q6hi8FLBDC1Rxn8XcOqMYt3E
 p7lUmv4eGjzY5Rzzm8nolKC1Agc6TsUqk1t/MJ7RnPyUKgazYRNVh9R+HhNiMHsxQscG
 9Qpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=QjXUGtXI4WJ7rAgCwyoyBVxLYbOOEqyj2b1edygipeU=;
 b=lUYSpv4lP/IqElE6z84f1EapOe6+X5mN5e29Y2KFWxGIrs+xeNb5LwN8aUPBuwEAmm
 u556/Tx+jPeAxlZcV7Nfy3gJ+Iv/2wXrstedtoUAEaWR27KlElLzSOKa+V3PtkzOmecB
 2G67m622m18uVps5vhv1Rj5N7T+hCP2LVWwIsyIEWln8kzkmrPVeGVZqwO1an+sauiIu
 fhc+vITX/v+G63K8paBrsT5shM6RvqZt1VnYOOEtP67uJ7EUaiyRWaI6k+K2fG4nJSZf
 20OxCUp/J/SMakcW4cd9fEfaT4DKR3hwLrZCqQzwYV9aKHsz5EtwLz101gqJeMwFOQcH
 7UCQ==
X-Gm-Message-State: AOAM5309qC/UVqpQBowvXCIbX6K0oGU87InWpP00u4k5dg0HxRzPrG2r
 pNMffd1i8NIaewTIrL7jsY8DEw==
X-Google-Smtp-Source: ABdhPJz9wh9Xh0orZP8gDBDvTkHyu6+A0y9BuJLvtzlwiBzUtulmBsfOO8hM/G+x3dRwuuAh372pVw==
X-Received: by 2002:a17:906:3ad3:b0:6cd:382b:86e5 with SMTP id
 z19-20020a1709063ad300b006cd382b86e5mr38282576ejd.145.1649875468842; 
 Wed, 13 Apr 2022 11:44:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a50ce4f000000b00420119333c1sm584953edj.62.2022.04.13.11.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 11:44:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1C2241FFB7;
 Wed, 13 Apr 2022 19:44:27 +0100 (BST)
References: <20220413160945.544176-1-pbonzini@redhat.com>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] target/i386: do not access beyond the low 128 bits of
 SSE registers
Date: Wed, 13 Apr 2022 19:44:13 +0100
In-reply-to: <20220413160945.544176-1-pbonzini@redhat.com>
Message-ID: <875yncygac.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> The i386 target consolidates all vector registers so that instead of
> XMMReg, YMMReg and ZMMReg structs there is a single ZMMReg that can
> fit all of SSE, AVX and AVX512.
>
> When TCG copies data from and to the SSE registers, it uses the
> full 64-byte width.  This is not a correctness issue because TCG
> never lets guest code see beyond the first 128 bits of the ZMM
> registers, however it causes uninitialized stack memory to
> make it to the CPU's migration stream.
>
> Fix it by only copying the low 16 bytes of the ZMMReg union into
> the destination register.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

And:

Fixes: b7711471f5 ("target-i386: make xmm_regs 512-bit wide")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/420

?
--=20
Alex Benn=C3=A9e

