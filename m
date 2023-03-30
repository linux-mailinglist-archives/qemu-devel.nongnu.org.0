Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 425B26D0168
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 12:38:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phpet-0007BT-W0; Thu, 30 Mar 2023 06:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phpes-0007Aq-09
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:37:30 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phpep-00053n-Jo
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:37:29 -0400
Received: by mail-ed1-x529.google.com with SMTP id i5so74782641eda.0
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 03:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680172646;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yYfqvxdbKSYzOasiZfDOePYKg7bos5ZxF5L5287U7wg=;
 b=OzBstowvjs+Yfbir0NBjSutnomSc5OPPSIGczGhmdoWINd9+rGgY91ys6puwdReGb9
 thycke0oAAc0bgDICnkDhwCaoVZeSeE7YLaHlqo7WnF9CY2c3XvkljLIQ8JD422jCuCg
 C57Z60XmG6slZMAKWkj2W/jrYanDSgkvcR/LiPcrHJftKAWt2AkBcWjqe6U0dQ7dN5yx
 Mck1Y2fNKK/5FojfbhqpcLm+ZY0HZmyKkKeg4Aq0E4KwL11wRv10USVKPzfrNciJusCk
 /KZ2PZFr9HMtzNe43Dv+SLuLEZP6MQIQMZTwouOcHgOybAvx5Y32awVssZvGfFzqMCFT
 mveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680172646;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yYfqvxdbKSYzOasiZfDOePYKg7bos5ZxF5L5287U7wg=;
 b=7AkHid06gr/2kINfPOY48SL8a2OmKD/IT44rFJcqUPH2wGPyfareMdPfJ8BCv72T3G
 Q3c/6qDmq1yIT180XZksgKCszf1lLC1E/IJnFabfMgGV4cmt/87HzI9DU4lb9CMDIICv
 P4+TPSwNRj9XsYAiDi7kAQ1T4P3iyGxZrP/blNAtGPxNZb5uyJkuJXwPTP7+cAXe6CPk
 iDz+S1KIu1zmJXsmbmSGRI2IWytFi1Ywb2MMYub8mro6EzhIgR1uqJXHKz3LMQ4qNzei
 GxXMpHiJ23Qe2KiYsfc1tsanAjlA7SVOZucNXxPvHksHpt31RNsHaWo9WnAHxnNd/7gU
 gGgw==
X-Gm-Message-State: AAQBX9f+VJB55Sa7ZeUNbNydkpS3P9QBeYMSQwLcrzsQxEvJxrHMDjHH
 YN277InPP07EHfSCadHVFsrELdqyEgMpZ9hQ+C3zXA==
X-Google-Smtp-Source: AKy350aEbpk3A3zOmRRnlP/JbewdHgNG637Xm9IX1fwBU3ObstwCQSdz2X8SwiNlfOi+jTXjbCPhOwMprJYiq+Tqh80=
X-Received: by 2002:a17:906:4ac5:b0:92f:cbfe:1635 with SMTP id
 u5-20020a1709064ac500b0092fcbfe1635mr12046397ejt.6.1680172645956; Thu, 30 Mar
 2023 03:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230328165935.1512846-1-armbru@redhat.com>
In-Reply-To: <20230328165935.1512846-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Mar 2023 11:37:15 +0100
Message-ID: <CAFEAcA-=j4S+QWvK3=QjHV=QLymEHxtfju4YybhtSdrK5UuVUg@mail.gmail.com>
Subject: Re: [PATCH v3] hw/arm: do not free machine->fdt in arm_load_dtb()
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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

On Tue, 28 Mar 2023 at 17:59, Markus Armbruster <armbru@redhat.com> wrote:
>
> At this moment, arm_load_dtb() can free machine->fdt when
> binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will be
> retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as is
> the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer to
> machine->fdt. And, in that case, the existing g_free(fdt) at the end of
> arm_load_dtb() will make machine->fdt point to an invalid memory region.
>
> Since monitor command 'dumpdtb' was introduced a couple of releases
> ago, running it with any ARM machine that uses arm_load_dtb() will
> crash QEMU.
>
> Let's enable all arm_load_dtb() callers to use dumpdtb properly. Instead
> of freeing 'fdt', assign it back to ms->fdt.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Fixes: bf353ad55590f ("qmp/hmp, device_tree.c: introduce dumpdtb")
> Reported-by: Markus Armbruster <armbru@redhat.com>i
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/arm/boot.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 50e5141116..54f6a3e0b3 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -689,7 +689,10 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>      qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
>                                         rom_ptr_for_as(as, addr, size));
>
> -    g_free(fdt);
> +    if (fdt != ms->fdt) {
> +        g_free(ms->fdt);
> +        ms->fdt = fdt;
> +    }
>
>      return size;
>
> --



Applied to target-arm.next, thanks.

-- PMM

