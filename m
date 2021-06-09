Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F2B3A0FFE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:11:47 +0200 (CEST)
Received: from localhost ([::1]:35722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqvBa-0003UC-Ff
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqv7k-0005wp-TR
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:07:48 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:43747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqv7j-00007O-8T
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:07:48 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso3814587wmj.2
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 03:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=/KLme25OTTJqqOo6Y5OzBTmwd9nK5suD3WUQbHDAcso=;
 b=JLAqBxtokleuOcnKEFbHI3bBT1i7y6kTn/ZGLeBzPLaZqcyHvCbdipX4nT7ln3YxBC
 lRV675Jya0OA9pg/mncjH9EtaPNviVyQaWJYS9ZvfmiOZ8JrKGxzIFDR1ewYyuoa9v6z
 OB2Abh8ChDFV2NZzqSeK/CgFQe1hpiCsTgO1jBvG+3D3fBJ+heQyUjtNFUR5JQQRJoCG
 z8k3rWwdjzh17OWYPprePrUB05o5N2woq+XA9yBlv0ok+mgpUx7UJd0Rn/zpGCRs3CB1
 rXmaY4lmjSgTPYdKZ+1gv7cvYshTsUAq5z5FhKOLG1x4OSoSITnOiESfW137M4nzX81W
 kNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=/KLme25OTTJqqOo6Y5OzBTmwd9nK5suD3WUQbHDAcso=;
 b=Y+4nLkQmvcasDj5cUHvJDvs9YSGK+854Tdc5OwBwep+19IUHrnoLd/QPsYyve2dwLS
 DCwhlNi45nTHJCTQ5Ce+cAB8jaWWCYFduHv5jCcmLzjEF7iZFaZLN/rl1x7ory3k2RdA
 +/5jMyDblB+WVQFnTSgybPX3VcnviLveGjX16FO3t0OfufQoEBnDTCrbntZS2h2BV3Ra
 KGlGRa492m/Al3AXtoKGcBhkztx4RUW44kVKQzPFPXsV8FoPYCzTkOGF0PzqfbbbrMW1
 bzAX7XKa0AOezZYWckw+Wd6I28nQTYAm7pp4RXCq6lHEQD67h1ftXi74Mqh3Ztk+OZ5p
 5P9g==
X-Gm-Message-State: AOAM530YJ/VUZn4V7V7F3VNYlVPYWX3fTH8NRVSCZjUScotgD9H+PS3Z
 1VJeGexsUjvShBRpPtxEvmhQCuXYajqCtg==
X-Google-Smtp-Source: ABdhPJy9N8QI7ljqxmP1sDlmDLCLTnB3pFu28xZeyeYMzWfBwoHcCyhoBCRZpg2VpZtxtQ5sNbeZDA==
X-Received: by 2002:a1c:23d6:: with SMTP id j205mr9175870wmj.94.1623233265792; 
 Wed, 09 Jun 2021 03:07:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p5sm24089873wrd.25.2021.06.09.03.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 03:07:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3B7471FF7E;
 Wed,  9 Jun 2021 11:07:44 +0100 (BST)
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-21-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 20/28] tcg: Move in_code_gen_buffer and tests to
 region.c
Date: Wed, 09 Jun 2021 11:07:37 +0100
In-reply-to: <20210502231844.1977630-21-richard.henderson@linaro.org>
Message-ID: <87pmwvjqq7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Shortly, the full code_gen_buffer will only be visible
> to region.c, so move in_code_gen_buffer out-of-line.
>
> Move the debugging versions of tcg_splitwx_to_{rx,rw}
> to region.c as well, so that the compiler gets to see
> the implementation of in_code_gen_buffer.
>
> This leaves exactly one use of in_code_gen_buffer outside
> of region.c, in cpu_restore_state.  Which, being on the
> exception path, is not performance critical.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

