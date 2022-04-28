Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B838C51322C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:12:18 +0200 (CEST)
Received: from localhost ([::1]:34222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk24H-0006i4-PC
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1YW-0000ju-Ei
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:39:28 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:42743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1YV-0000Vq-1L
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:39:28 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id w17so8210739ybh.9
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DJj8YaKhJUq+07L3vh9lecA+8B8VlGTOVFfMPOQ4w+E=;
 b=IikTqJ5cocVcEdxfrZd/iOtnwu2L7PsDUFdimwI4Mg1sORB+gVsKBl2kG4TZApStVz
 vq+M2jt4bqg9K4GrO/2MBCKvToFTLA8PE0IU9eFKreMr8ZDymszdr+3RUdGKHCdqqBv5
 ddvdfda5w7XwuLmtzs8RYofvm0wKGwU/buvPit0rh6Etf8m1EOC2yf7ndMkfOK0BNEe8
 zC13SFz+lzmzpeMiXNJEZlnSAP7YJ5DFIiPJgeOTqJ6mwUN3suKFFO7ZT8z/CAR8yvvo
 FplbMSgu0/oVGPX2137coYAf91P2xaVv79orG25FA5dPAf9DDRIANK9hN+3j6j9kIs+Q
 YiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DJj8YaKhJUq+07L3vh9lecA+8B8VlGTOVFfMPOQ4w+E=;
 b=zFAWhCUlr9zqrwe8XnPlFA2dbVomWnDasgHfgoqjU689OAJv4w3+cYImduE6wOacIB
 C5Z+7AD4Indqw4ERnaLhCLnJ50KN8wCTRpKUb8SM0Rsq06hMWj5EAXIum01X+hNDBm8G
 xXLl7EKSAK+TeBXjo0Z4CKI2/kSK3CrLomFmblv7/RbJ0ES9Taxu+FxGBSiGVuPZmkQ6
 gc5FeMU9JtxWb1kUYcoz1hv9tV5T2+2pCNaR+3Fsrp5jV/0RGbKsy59MGrPZnuMoEslA
 6AUYYdQ2ZQOyULKRUPA/M7FyepxQR4JrlR9ZvqQXWKKa3HhL2UBs+hOJVSgrfOeDihPD
 2NYg==
X-Gm-Message-State: AOAM531jaWB+JoXs0XITNv8omXTO8H2NsyuvmNsgYq9oygBCEyrik2sl
 EJqq6oZ2230sybW0KYfKK7hg2uZcKiclrSHY3bz8rQ==
X-Google-Smtp-Source: ABdhPJwpOX2adBHlWqE0LraY9dPKRrsiPoayFotnXMW31P0hssaxtaR4l7fQu0GEMjhFWSn0442BHxAPR2ZZBuvC/AU=
X-Received: by 2002:a25:2fc2:0:b0:647:dcee:b2dd with SMTP id
 v185-20020a252fc2000000b00647dceeb2ddmr23630454ybv.288.1651142365967; Thu, 28
 Apr 2022 03:39:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-35-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:39:14 +0100
Message-ID: <CAFEAcA-4f5ugG37+fCcL5mgNVY1Yb93KkEFgKbj6DqdDAh-5Wg@mail.gmail.com>
Subject: Re: [PATCH 34/47] target/arm: Use tcg_constant in trans_CPS_v7m
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 at 18:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

