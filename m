Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB6B66DF62
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 14:51:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHmMQ-0007sn-B3; Tue, 17 Jan 2023 08:50:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHmMM-0007ie-M8
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:50:43 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHmML-0005d4-21
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:50:42 -0500
Received: by mail-pf1-x42b.google.com with SMTP id g205so6411446pfb.6
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 05:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YMY6ESmdDG9Xclj4ipJgoT2OZT7+OvsQUtfNxfRyaG0=;
 b=Syhk8GtNdS8S7HTf856AKBp7kovRojpGBxRJAQ6F1BdjLmcuFFubIiQasDT3aMK5X/
 Lzil1WG/bjSTOYFtzgpcs5p6pzNvKLSracJIm4njJQdPCfE9u4GOgTLIurm0RzL8Kgqw
 qT9mlOeqBUpbAqg0Rs31f+zzo+8aUvhnlABi8FOKSmTGvfYoMOPsb0SyUdJv532Sfzn/
 tu39/Vgz+TcYZf/bBIUpCXu0EraQmHfHo+OSuiIFeUu32+7ZVGSeWHgAmC1Jiy8HpiNz
 3hGhzMWE/fhWUt0HnjuxFCWsuazRJwwOJFqxsVFAeOdO60CPavhEh9jH0npwUMabahbJ
 SOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YMY6ESmdDG9Xclj4ipJgoT2OZT7+OvsQUtfNxfRyaG0=;
 b=v41NdFYiNfS9gjfUAvRYJj8Hmka1bCNIrdl1tOci64cZ76VUgGbq3xJoPwNzWmos5d
 kpR81GaMxbktJzcKlF/HolNBc2d9AB6thKRIFWXejT4px2KYtrY2qDrLfSmDy4RiqKGK
 W1uCM7G/09RgI71pot3zpV0qw8mH06rkecb/IilBF5/pixihrEpgYZ7z3DtQ8yrHDX8s
 cOznMFUKfGQzEZcaYMimIljeOSTf6U8gNrFYzh/CpoXCEyvNgcm2c3CMud6P18uvKKSv
 VVhQWrEt/xZkfRmoRmZLAh1IVMyxDCJ78dyAIm+uIFRnFf4LywvuDiD0KnZrSEUQFvM7
 ZYgw==
X-Gm-Message-State: AFqh2kp8omAetNbT9GYzXl2StiItrAaMbdAIguEc8J40zDqcAyNBaJSK
 Ymmich7W78wUgV1h3jHhPQlq0hCI4n7eDGF08CN0in2gU29iGQ==
X-Google-Smtp-Source: AMrXdXu+9Y3HIc8rTIj7R0IfPjIy1xRS4fdHDnUaN70VcA1x+t69o5+LpWb5y0BSSQxWE29/U1nIjMJ/dn8zBUOTZ/8=
X-Received: by 2002:a63:1005:0:b0:4af:9f91:54d1 with SMTP id
 f5-20020a631005000000b004af9f9154d1mr154987pgl.192.1673963439622; Tue, 17 Jan
 2023 05:50:39 -0800 (PST)
MIME-Version: 1.0
References: <20230110082508.24038-1-philmd@linaro.org>
In-Reply-To: <20230110082508.24038-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 13:50:28 +0000
Message-ID: <CAFEAcA_VzFUAWmDeD4Y000JnuDPqnCaaK33UPFzqx21PRMDyFw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] hw/i2c: Rename TYPE_VERSATILE_I2C ->
 TYPE_ARM_SBCON_I2C
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
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

On Tue, 10 Jan 2023 at 08:25, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Series fully reviewed.
>
> Since v1:
> - Updated MAINTAINERS
> - Picked R-b tags
>



Applied to target-arm.next, thanks.

-- PMM

