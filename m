Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A46462C8346
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 12:31:43 +0100 (CET)
Received: from localhost ([::1]:33898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjhPC-0007Yn-M9
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 06:31:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjhNP-0006C4-Vh
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 06:29:51 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:45944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjhNN-0000Hc-76
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 06:29:51 -0500
Received: by mail-ed1-x541.google.com with SMTP id q3so15538365edr.12
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 03:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P+o5O/EdfZlNyxRTfK8vGn1ByagQrBiS+Vc7OCE/rAw=;
 b=geh7I8/l+FpGBuKIfpLVFpoygHk/X0Y2SmtWPwVKXPc8y86k0ZUr8RJe0BknhmESko
 AuOlqeKOpPba6GBkSUkGoaRu0ug/xq4b/Pc1wi98D5cc5gEpbc2v8hZv7/QQA5OSS1Sc
 dav/K2FlLufSEHyUtwR9Fi0/SQ4KKq/LnZKkU4Z9+2fMwNjYuG32BdLI8h0cpxw3Kyxu
 qlF1WntQxydEamlr1w3+a7NF6VyoIptl3J5MyhbBVn5EqmAsOLtuchrlyASoBL5zBypW
 Pqfo6e535IqerZUGEPRhh8s1d/kW9gAkogUFrQF3CRkj94XrPBCBfnrw/oABF2CesXJN
 UH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P+o5O/EdfZlNyxRTfK8vGn1ByagQrBiS+Vc7OCE/rAw=;
 b=gfHWZNvk910KTNmooOYGrsL4mRFAW8Ou5NlsMWKrjbY3LIQ3HtrC64Ktk6U766+duE
 +2D7pKfEEpsywybdaVEbjv+stVoqYWQURvjtQJaRdtaXJxkQzZ8jzLvQqvYV/q03+evS
 dY8f8XL9hKfNff/59+PkS/Y15SZ9+wBXgiRGca7VxnXVfz1B3A2xj7+MOIFcQ58qMIWG
 urY1mL+Gucgymsuum1uSTAXd0EEARcblypm3+ZFEbjJ+nzaF3YACqqdHA7fJuNQzAcaJ
 Z5OjqD2HOhgnoNir68jxtEDH4fhBSAUnHSXcWJHvw6T7eanCNfV786eqY4ttO1mdxsGW
 KwCA==
X-Gm-Message-State: AOAM533VMXNZ6BkPhkEl9Y9ynDy79V+bUjZ9k4+pKZswGLrUGEYqxokm
 9cX9OFJGvqZXclYSWYXKQs5y9uq7qmGk6yAbtyNwNA==
X-Google-Smtp-Source: ABdhPJw00lHdERczMuSrSv0+52952yEO3+P+3DI7lOc3bQN+MhaGlYFFa9HuPkiFQk/JSrgie4yMvEHuyAfUWU36sMY=
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr21011873edb.100.1606735787612; 
 Mon, 30 Nov 2020 03:29:47 -0800 (PST)
MIME-Version: 1.0
References: <20201124023711.1184-1-jiangkunkun@huawei.com>
In-Reply-To: <20201124023711.1184-1-jiangkunkun@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Nov 2020 11:29:36 +0000
Message-ID: <CAFEAcA_tfEO0FaTq_Ud4FE_j93O0ohx3mGKtm2GoGZDfw-ZPAQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/smmuv3: Fix up L1STD_SPAN decoding
To: Kunkun Jiang <jiangkunkun@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
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
Cc: Eric Auger <eric.auger@redhat.com>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>, Keqian Zhu <zhukeqian1@huawei.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Nov 2020 at 02:37, Kunkun Jiang <jiangkunkun@huawei.com> wrote:
>
> Accroding to the SMMUv3 spec, the SPAN field of Level1 Stream Table
> Descriptor is 5 bits([4:0]).
>
> Fixes: 9bde7f0674f(hw/arm/smmuv3: Implement translate callback)
> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> ---


Applied to target-arm.next for 6.0, thanks.

-- PMM

