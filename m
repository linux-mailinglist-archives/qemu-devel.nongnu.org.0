Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B28B069E53F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 17:57:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUVwI-0008Vd-Ib; Tue, 21 Feb 2023 11:56:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUVwG-0008Tu-VJ
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 11:56:24 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUVwF-0002As-DF
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 11:56:24 -0500
Received: by mail-pl1-x62a.google.com with SMTP id q11so6049193plx.5
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 08:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676998582;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=52B+7W7q446JH6dWkTm6gVpF849VXknIGCBunwuKg7w=;
 b=cTaAGjdUdUmsfLKNNJb+iJWhdQ9QagbcXSIs9IL/PFtFiPnN2JjLGY5uEQ33mGnU4h
 mEpcMjuksnVU/YVLHCYqblsjbJCiUA448FMYbQcKejUKUiDqJIs5+Xa4YbASxno/m3zH
 H7iBXU2b/BRFNwPOR1AI1cq0fHKqOnEquI6H8Sy7bHulHq9dLyTrhSjQVSHCSZf1GaBg
 yDM5wBeiG68MOaN3lLh8Gy9aLBMyC6RjCgwwVPoiZz2PpqzZNzj1zcfA5+vLRkmb2F/I
 8DMbdDyBN+mJwLhLCoqeOzQKi/1LhbX76FXUwOMpMqS2tFr3r/cJx6CPJXdDF3M5x9RR
 pdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676998582;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=52B+7W7q446JH6dWkTm6gVpF849VXknIGCBunwuKg7w=;
 b=Y+HQeKeYygQ48/g1itArNtNRuvQzqrOAqAJNsOO2dWYuyViCKgdcT95I7jbmft2XNb
 QLfoaoBhJsc08VCsD+rkdzJXKl2fGmWb8P9xSZmFjJWU7NCIO62+VarUqcQZd+5rVZyh
 yYahGrnLMnlBcN0WRRJkXRZLNIJ/OF+C/u3//sk5QtHA68RMEqR0tWfE9Dli1LvOClWD
 bv6xkSOVpbYaQ9po2U52YkxzBaW2iIa7O29Z/S4X4sAPvf8yZAu3flEr6CAeTDWyAS2E
 2SJbMVKT0xVbdUZLqXsAlx71839MdmdqECzHu9yNcMTvxcupzFN1lu3bxw719KURQmOM
 ji1Q==
X-Gm-Message-State: AO0yUKWCb+zg941DdWuI1HE7ZbCcUXaI/Aaha5SK+4jncF0/qYpT2W3C
 5wDyzJn1LgGqVGbhAUwf/A+KChKZHFOKZYBpVb4p7Q==
X-Google-Smtp-Source: AK7set/TWxYYyc1jrEhO3K9cj6bosrwahf/xF6BGI2UD9YaMXPcq5vlSzOlKnr+O3By6EkDFitoZ+24+iboGUGxQSpk=
X-Received: by 2002:a17:902:ab8e:b0:19a:721b:bce1 with SMTP id
 f14-20020a170902ab8e00b0019a721bbce1mr861699plr.23.1676998581854; Tue, 21 Feb
 2023 08:56:21 -0800 (PST)
MIME-Version: 1.0
References: <20230221034122.471707-1-richard.henderson@linaro.org>
 <20230221034122.471707-3-richard.henderson@linaro.org>
In-Reply-To: <20230221034122.471707-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 16:56:10 +0000
Message-ID: <CAFEAcA8yq_h953pLi+zJ0Ai52ErYyS28YkZP2Mq0L2ZWfEK3FQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Fix arm_cpu_get_phys_page_attrs_debug for
 m-profile
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
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

On Tue, 21 Feb 2023 at 03:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> M-profile is not supported by arm_is_secure, so using it as
> a replacement when bypassing get_phys_addr was incorrect.

That's pretty non-obvious. I think we should either
make arm_is_secure() handle M-profile[*], or else have
it assert if you try to call it for an M-profile CPU.

[*] i.e.
  if (arm_feature(env, ARM_FEATURE_M)) {
      return env->v7m.secure;
  }
at the top of the function.

If we do the latter we wouldn't need the revert in patch 1,
right? Or do you think regime_is_secure() is a better
choice of function here anyway?

thanks
-- PMM

