Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CE06DDE59
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 16:44:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmFE1-0004Du-9R; Tue, 11 Apr 2023 10:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmFDx-0004DM-EZ
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:43:57 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmFDv-00050M-6f
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:43:57 -0400
Received: by mail-ej1-x635.google.com with SMTP id sh8so20938338ejc.10
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 07:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681224233; x=1683816233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7kEXBW9SVgS3rCMO2/Yt+VZhmc7IQ314trffUzR2+58=;
 b=XiY/YjpK05AlGn6os2hVbvQSmT2gGFUw/YeRBrAoENKT/yRNC+JUjJqCxtfNZapDm3
 /yGInbkwnnha6Hqq545jVFPcLhLjiAxrnOumMQNorSXjHcvON98cGkPevkYkwgEoR7av
 0HJoVDxtjbfVZhq8UqOhh9CBzUIeqhHqsbduCKA/EF7FPflPOZ24i6GIFKJY6Nljnhqu
 xMLIbHeiNBAVqaUruv7iObReTOS/pJ1uhl2yUvPsrcN5vVwipUmaf5S2Hq3M0PtipADO
 lEJorqkoZWIpi4664xq8XjtMkP153uKXS4Vf2yNJK4EW8r/x9FYtrWIphyCz87OKjkeb
 G0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681224233; x=1683816233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7kEXBW9SVgS3rCMO2/Yt+VZhmc7IQ314trffUzR2+58=;
 b=eTUjQ0+qSeWO6+qRXHInl4/LVzDKqJ883VFRWFjKnd9mlI/OZ93T1YRJySyaUtlxi5
 3A/9VLo3U+KoX3ttgmF7AcNH74mQTmOIhACB7SJkmeyFxcQyg9bwWpglVOoHhncO0Nvg
 lj+OThw+V2CO7E7x5l2nUtDNHWR0bNcXCPpH6FidvNODY6ZhwQhkiGi/lUye0AWTYOgS
 WbnNWU0t25xLFNNUgMxC8w0g3AXBRlw5H8+L5lu2WGMRFRqR60RcTOxQEXlwJzS/EdZL
 zSIi3CJZpVUnD0rHuBaGelT7IT33WkMKkSXFDwSDGLrtynkU0T5+AkQ78GXh6Fb8R3b/
 eLyg==
X-Gm-Message-State: AAQBX9fVKPMOYnnkFM7at8twPjBVG90ORqVKolu4HLJpQmJQRw6f0F8L
 j6nWcOkgjVNvrPp+DuNzUJTPzt2WXH0do053S/WBjQ==
X-Google-Smtp-Source: AKy350YH6292cMbO9TxIJLl9nDCTxSTNc5nodk/S09BYTb/H6380MB3snJo+tS1QmcAqFJOM/yB7evs5iP4xKSjuMzs=
X-Received: by 2002:a17:906:2a48:b0:920:da8c:f7b0 with SMTP id
 k8-20020a1709062a4800b00920da8cf7b0mr5646066eje.6.1681224233464; Tue, 11 Apr
 2023 07:43:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230405153644.25300-1-akihiko.odaki@daynix.com>
In-Reply-To: <20230405153644.25300-1-akihiko.odaki@daynix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 15:43:42 +0100
Message-ID: <CAFEAcA_7KtRxVQB2fdeFe1g8j2PmXgckTX_L+GQ7uQwKongB4A@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Initialize debug capabilities only once
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 5 Apr 2023 at 16:36, Akihiko Odaki <akihiko.odaki@daynix.com> wrote=
:
>
> kvm_arm_init_debug() used to be called several times on a SMP system as
> kvm_arch_init_vcpu() calls it. Move the call to kvm_arch_init() to make
> sure it will be called only once; otherwise it will overwrite pointers
> to memory allocated with the previous call and leak it.
>
> Fixes: e4482ab7e3 ("target-arm: kvm - add support for HW assisted debug")
> Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
> Supersedes: <20230405070244.23464-1-akihiko.odaki@daynix.com>
> ("[PATCH] target/arm: Check if debug is already initialized")

Oops, I was going through my to-review folder in a somewhat
random order and hadn't realized this was a v2 of that
other patch I just replied to.

Applied to target-arm.next for 8.1, thanks.

-- PMM

