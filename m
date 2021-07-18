Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 153CC3CC9E9
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 18:41:03 +0200 (CEST)
Received: from localhost ([::1]:49776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m59qg-0006dB-4y
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 12:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m59pO-0005tF-8B
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 12:39:42 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m59pM-0003zA-Re
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 12:39:41 -0400
Received: by mail-ej1-x62a.google.com with SMTP id hr1so24109288ejc.1
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 09:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kLhY5PqSJnmXwCk8imhx7s6jHuhx0LkHHbM6yb5uR8s=;
 b=smlrpAS0X7JWyQ4kAZhGBLPBkh0rl4Hj8YeXSeNswvo/b/CaBXNzsUi62F9da4yYVW
 201/LWuNel11aE4LbDbA9e0nxh9lkI7rvi7c55VqXKG8yo7wwxXCGYgZTlKXls1c61kb
 2BtekMK20lB1oYus7QTVl2a4FhMGT0QYMYbpbYimNZUkNCGpPqsK5RmTwk6DaTRvkMHd
 dGYA+J/q1uWRippr0nsirqmcwpnXH6CyJE/pjWOBlTTUrKlmCCI2b1On4sBgwah/4F6q
 ZyGDxbDp114xPfOo1uO5Zi8kOTnwXQ9pkpI5ujVpVRWQvQsqpe7T7n/ikAZuu8LEbADz
 Yo1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kLhY5PqSJnmXwCk8imhx7s6jHuhx0LkHHbM6yb5uR8s=;
 b=GQ2mnX+ymOW3n+rKzf0M+iIsTafPJK0JWJkgssfut8TPjjBVueOmnJK3ai9ccpC/ZX
 dnBd9OjEBoJiT9rcYNYYfVQn/623b/jjL508M83Z1/0m8cIrHaavVu5E2EcvDkk171Zg
 PFqhUZwpfHq9LrL8Hb0R7Shwty8KUsG7WcYynTKUVYTU42COgLHJelaX/FopHDB6AalH
 8U3v6hwBN0kCuCSaDMr8kA7tjPGirs5pMkBiodRhMr+nS84rtjvW4vvm9xsFMMmEHphq
 ykDWAAbu4bij/qZLvraQrrxZbAOmAoeC0L5skyhm92luo9J9XlC3CcrvaTXAJVrk2ysI
 2xxw==
X-Gm-Message-State: AOAM531MqKrrkcYbcNUuO8nYi24V+TraD6hmsEkogDnxdUwFcAmUxN9b
 EI/9X4DXWz8JiQqUY1AvNN5QzbeFCFaaZOcJ8mV0uQT1lrI=
X-Google-Smtp-Source: ABdhPJyWqDewL5qC0DZKsiRT4NU65XKFaAP7Ovgyn1Xp44KKs0dDZ4miTfiFxzb6P+xV/asXrIUfxQ2vOJoBb93Lqs4=
X-Received: by 2002:a17:907:a05c:: with SMTP id
 gz28mr23655356ejc.56.1626626378872; 
 Sun, 18 Jul 2021 09:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210718134650.1191-1-reinoud@NetBSD.org>
 <20210718134650.1191-3-reinoud@NetBSD.org>
In-Reply-To: <20210718134650.1191-3-reinoud@NetBSD.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Jul 2021 17:38:58 +0100
Message-ID: <CAFEAcA9qiT46qvAgD2cGSqo=FsJhJjCSxR+KBN+7XpvVaSgfuQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] Fix nvmm_ram_block_added() function arguments
To: Reinoud Zandijk <reinoud@netbsd.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 18 Jul 2021 at 14:54, Reinoud Zandijk <reinoud@netbsd.org> wrote:
>
> A parameter max_size was added to the RAMBlockNotifier
> ram_block_added function. Use the max_size for pre allocation
> of hva space.
>
> Signed-off-by: Reinoud Zandijk <Reinoud@NetBSD.org>
> ---
>  target/i386/nvmm/nvmm-all.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
> index dfa690d65d..fdcd37ed3e 100644
> --- a/target/i386/nvmm/nvmm-all.c
> +++ b/target/i386/nvmm/nvmm-all.c
> @@ -1134,13 +1134,14 @@ static MemoryListener nvmm_memory_listener = {
>  };
>
>  static void
> -nvmm_ram_block_added(RAMBlockNotifier *n, void *host, size_t size)
> +nvmm_ram_block_added(RAMBlockNotifier *n, void *host, size_t size,
> +                     size_t max_size)
>  {
>      struct nvmm_machine *mach = get_nvmm_mach();
>      uintptr_t hva = (uintptr_t)host;
>      int ret;
>
> -    ret = nvmm_hva_map(mach, hva, size);
> +    ret = nvmm_hva_map(mach, hva, max_size);
>
>      if (ret == -1) {
>          error_report("NVMM: Failed to map HVA, HostVA:%p "

This suggests that this code isn't being covered by our CI. Is
there something we can do to get it tested?

-- PMM

