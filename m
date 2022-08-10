Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F7D58EDB8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:57:56 +0200 (CEST)
Received: from localhost ([::1]:48066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLmDb-0008DT-PL
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlbi-0005U1-IZ
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:18:47 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlbh-0004AG-8z
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:18:46 -0400
Received: by mail-wr1-x42b.google.com with SMTP id l22so17734666wrz.7
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 06:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=myWBl1xlVEi5VUOM3mIGe41vUBiscN6NtBG1mZBWQ0U=;
 b=OkewMJbCDwrxUXLRJR1a5TK2FQmNIEsruwiJwt6bl9DFFAqspW/DqbOzMhpvlUwiFk
 WsQuArYbmGy64Afz9RoEytjkERFKRy8Nkp9TlcNIGl5iQR7IJabKucpKGS6sifAIEcwN
 7wmQPaR4D757TlYSe0nAbsuVM6Lw/BvU6gM2vMVaZNPBnZD6hcI/iaAgsFd4fluf42Nb
 EoXQchOINYrVQ2jUWi4yynEc5A79sG6K4KRIX+U2HnMCzNaI9F+PXBu7MEfxt+7cqlaX
 oMw788/R/H7diQKbVzblHcanJWpPsK7l6KCKAAgLMLG079Qh1lJZdewmNBz8gvzqmu1T
 NX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=myWBl1xlVEi5VUOM3mIGe41vUBiscN6NtBG1mZBWQ0U=;
 b=iRMiXlNYBXAsgpVB4WB7NZUM44Vufd7d5x/a704KBqGZODoQjCkGY5VDF/vG+ytIdg
 4AIZLXUSkKi87KZehjcYoVYXZLB6t+Xtoeukt9uqKZ10OTcDlamguzamicmNm9Wk3Ejb
 ZivWys2jxPHqm+MZBXfpw/oxwSH0LJ/UO2J78tzm818D5eQmak6uT/LX+ITI6dMlYzrA
 WZh2iUn1mw6UOg3KuuuGfHJZDKtquIHP6a9tjxWKSACqQZb7WsibQ7bvYceoBYw+Rg69
 z6rxZ4X6BzrpMC6hrIJvgmPkmw0X0Kl1xhdqmKuqHFhcR39y5VRBNrhKMeDAmMAAqw2E
 W+hw==
X-Gm-Message-State: ACgBeo2hexuztuzL9iJubbzlmBGb6MjeYJaPpHaesIb8UVvA8LGUZjQY
 Rj5zASvfWwQJiqyX8H4bstAWkQFpGE9shQ==
X-Google-Smtp-Source: AA6agR6ZFfi5iAae9cPzGPe2dy82uPETYGY76Tgty8stKaLtI86w2gAxyUj0QiCvFdlrwGzz/vecMQ==
X-Received: by 2002:adf:ed8e:0:b0:223:6c32:9b9a with SMTP id
 c14-20020adfed8e000000b002236c329b9amr4660754wro.618.1660137523932; 
 Wed, 10 Aug 2022 06:18:43 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a5d49ca000000b0021d6dad334bsm15905296wrs.4.2022.08.10.06.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 06:18:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BF7781FFB7;
 Wed, 10 Aug 2022 14:18:42 +0100 (BST)
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-28-richard.henderson@linaro.org>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 27/62] target/arm: Add is_secure parameter to
 get_phys_addr_pmsav5
Date: Wed, 10 Aug 2022 14:18:37 +0100
In-reply-to: <20220703082419.770989-28-richard.henderson@linaro.org>
Message-ID: <87tu6kjky5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Remove the use of regime_is_secure from get_phys_addr_pmsav5.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

