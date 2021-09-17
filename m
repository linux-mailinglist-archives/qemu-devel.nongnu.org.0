Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0A740F6A8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 13:21:58 +0200 (CEST)
Received: from localhost ([::1]:51048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRBwL-0006Pz-N0
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 07:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRBtS-0004wG-Jj
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 07:18:58 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRBtQ-0005fL-SC
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 07:18:58 -0400
Received: by mail-wr1-x435.google.com with SMTP id u15so14580887wru.6
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 04:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=R/IY9E01Oa8SWGzlb8ofPYd8yYcbaS4qWoo3dBcbL/s=;
 b=cb+ticA5IhKCLg/Z7UfPlz2R1uoJG07oeVaAkz93usTcDnEtQZ0eHuqm9WSW2JXDTy
 kDG3Jy9S/sGz18gwZd34qjtXJ40NFp37M3KDkI4tJ9R/EU2XG2hHgwfGkXA5O2XiOVrM
 SWU2vZXHxPiLdz9eNSr5FmHhsWYMBomEV4t/QDNCD6rYiuz9BR4GIKJPBWwol7b1KkSt
 WOBRq4TwJ+637gJDpCmi0cebFgPottX8VEqy3yi5ANFnA1nIJsb7d8bjOVfMtwp1LP1z
 RSCo1bl+8fb0qIzPR7a+K0VhscFaEDZsycM6wdCXFQvhLruPZzdK3Kgdebhl89e6gVd9
 OJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=R/IY9E01Oa8SWGzlb8ofPYd8yYcbaS4qWoo3dBcbL/s=;
 b=4xs6BNovadxxDeUicyk5n2tHpmv4AZrioxz7sdCWmcnC4ZzYjhGkVRgmKCWaFGtAFX
 +bUg3nHUXd7BUsTtGbVYF51fQ5ZJyTipe8dYB2m6TFn0pfFxzhRJhVbGenc4fVXrh7EH
 TCpwqLJ9vvYX5PwhkIuLvosQbGy/qoU+/SYv6li/fAOtwqFJD/WQelaB7zP/gyQTU4OO
 iN+1xkBZTUb5P8wGIC13AHbAmyRZJvqL0zGlxVumkTeUyL2Rvb6ti/STQBqeEM1hvhuN
 D0EN/D5otu9uthqGomfyDo81ezVpJkJeBLz+L/cWzMslBCd/ZGGbimLZr9f5dBwH5qMM
 oYKA==
X-Gm-Message-State: AOAM533aesiZoGxUIZ8NeCEl9dLnSr06jvtqPIoAdeQ2CuqXTBKrnmxr
 ge8iEJHDVEcn/DpvGX2Cw3kYLmVccQr55w==
X-Google-Smtp-Source: ABdhPJwvIhVIsLQUA/KHURIZBXJWiREvwVzgaCZrSpTnm9ThKuOGnIGRxmxeEQwo2VJ3dnWs83al1A==
X-Received: by 2002:a5d:58c9:: with SMTP id o9mr11660759wrf.279.1631877535259; 
 Fri, 17 Sep 2021 04:18:55 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h16sm6413256wre.52.2021.09.17.04.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 04:18:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6AE5C1FF96;
 Fri, 17 Sep 2021 12:18:53 +0100 (BST)
References: <YUOssEF1lND+Rhsr@strawberry.localdomain>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: plugins: Missing Store Exclusive Memory Accesses
Date: Fri, 17 Sep 2021 12:05:09 +0100
In-reply-to: <YUOssEF1lND+Rhsr@strawberry.localdomain>
Message-ID: <87fsu3tppe.fsf@linaro.org>
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
Cc: cota@braap.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> Hello,
>
> I recently noticed that the plugin interface does not appear to be
> emitting callbacks to functions registered via
> `qemu_plugin_register_vcpu_mem_cb` for AArch64 store exclusives. This
> would include instructions like `stxp  w16, x2, x3, [x4]` (encoding:
> 0xc8300c82). Seeing as how I'm only running with a single CPU, I don't
> see how this could be due to losing exclusivity after the preceding
> `ldxp`.

The exclusive handling is a bit special due to the need to emulate it's
behaviour using cmpxchg primitives.

>
> In looking at QEMU's source, I *think* this is because the
> `gen_store_exclusive` function in translate-a64.c is not making the same
> calls to `plugin_gen_mem_callbacks` & company that are being made by
> "normal" stores handled by functions like `tcg_gen_qemu_st_i64` (at
> least in my case; I do see some code paths under `gen_store_exclusive`
> call down into `tcg_gen_qemu_st_i64` eventually, but it appears not all
> of them do?).

The key TCG operation is the cmpxchg which does the effective store. For
-smp 1 we should use normal ld and st tcg ops. For > 1 it eventually
falls to tcg_gen_atomic_cmpxchg_XX which is a helper. That eventually
ends up at:

  atomic_trace_rmw_post

which should be where things are hooked.

> Does my initial guess check out? And, if so, does anyone have insight
> into how to fix this issue most cleanly/generically? I suspect if/when I
> debug my particular case I can discover one code path to fix, but I'm
> wondering if my discovery may be part of a larger class of cases which
> fell through the cracks and ought to be fixed together.

Have you got simple example of a test case?

>
> Thanks for any help,
>
> Aaron


--=20
Alex Benn=C3=A9e

