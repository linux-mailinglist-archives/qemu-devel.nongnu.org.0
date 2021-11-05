Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD0A446782
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 18:03:11 +0100 (CET)
Received: from localhost ([::1]:55658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj2cQ-0007Qb-9N
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 13:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj2bM-0006kk-Cb
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 13:02:04 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj2bJ-0002tJ-HP
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 13:02:03 -0400
Received: by mail-wr1-x430.google.com with SMTP id d3so14713387wrh.8
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 10:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Id8XnX/dOHpLhgn1iJnRjIRthgHm8aETpKWL4CyaihM=;
 b=sYh21BTWsvFH2V3fYaHJEFPCK6ULK58MVjv8SVN6lL5EX6wM8SiN7vYQ4ktFDYD6pa
 aRaj85qvQJZ7/7sqh1yUZ850llKH1erJ9sJ+eGbAr7t65i0umLyLjIcJZ+3F5BTtH4xB
 6oQv7iboIKVO+PZNDrmHkHXvOj8heyzZRHnT+OdRAflsrnbFIC82qlYwNtbRXBD1x3qb
 7x6AFR9HbMBPZ28+V9Y7q2oiFUUw2csCZ8MdhPUaBHI6tNdKDgbJP6HO33XkGo0BDqEB
 2n7GbWiz7IfmBD0nJwPdqlLfNrsZWfgMi+8z161tBGvusqJa6IABGf/sSEvK02CIvvZs
 b1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Id8XnX/dOHpLhgn1iJnRjIRthgHm8aETpKWL4CyaihM=;
 b=VogiklnhRSFZ7dq08umBwT7bh5SjNsoel0N//20kVftjLW51Z5sY3+bBx156DRdRg+
 eKUhWXfwM+Jj6Kw5sp9B3fX5wkRwz0YMHnos6pFH7/3ZKz0jdpiug73aMPGG2NQ5xlPa
 wTa426AU6W2+K3VdInUFYTLCarNWQcLADEMahXrE2jWa8pSsMrBSfpwWRJzzPrOUC+c1
 e9NzkZiUDaRQ9EqoM5bzyiSyBw38VGmxNjid1+C/EDmpjPeaIkityxD/8+WH76zrzGEI
 jJszBDBmxv3GzwEfjW5SBIZjFn8LToLopy4SOYy0VODig2B2xE58E0/2IXd+GbTmk5+q
 RK8w==
X-Gm-Message-State: AOAM531FhX/20Qb8+FpUQNQfy34zLLsbayuczdlVNXOR0qFDxtLRWg+I
 d1WzXm7mul5W/KVunoRG7KVTz9odpVqtJjcg6IEnhw==
X-Google-Smtp-Source: ABdhPJxwi6CHW/Zi3rF/R7LaXnkjRS9UlA0sGYgT+U6PFbKuFSQKhhM8ytZhhd2uSOKcRrTxNkDs331SwSdIPGwCT1M=
X-Received: by 2002:a5d:6151:: with SMTP id y17mr68459052wrt.275.1636131719699; 
 Fri, 05 Nov 2021 10:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211105165254.3544369-1-laurent@vivier.eu>
In-Reply-To: <20211105165254.3544369-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Nov 2021 17:01:48 +0000
Message-ID: <CAFEAcA_ma2f6UfMSSJwssVjdZHQzO2LQfK2KROfv11Mec0WWsg@mail.gmail.com>
Subject: Re: [PATCH] macfb: fix a memory leak (CID 1465231)
To: Laurent Vivier <Laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Nov 2021 at 16:52, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Rewrite the function using g_string_append_printf() rather than
> g_strdup_printf()/g_strconcat().
>
> Fixes: df8abbbadf74 ("macfb: add common monitor modes supported by the MacOS toolbox ROM")
> Cc: mark.cave-ayland@ilande.co.uk
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  hw/display/macfb.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index 4b352eb89c3f..277d3e663331 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c
> @@ -440,21 +440,18 @@ static MacFbMode *macfb_find_mode(MacfbDisplayType display_type,
>
>  static gchar *macfb_mode_list(void)
>  {
> -    gchar *list = NULL;
> -    gchar *mode;
> +    GString *list = g_string_new("");
>      MacFbMode *macfb_mode;
>      int i;
>
>      for (i = 0; i < ARRAY_SIZE(macfb_mode_table); i++) {
>          macfb_mode = &macfb_mode_table[i];
>
> -        mode = g_strdup_printf("    %dx%dx%d\n", macfb_mode->width,
> +        g_string_append_printf(list, "    %dx%dx%d\n", macfb_mode->width,
>                                 macfb_mode->height, macfb_mode->depth);
> -        list = g_strconcat(mode, list, NULL);
> -        g_free(mode);
>      }
>
> -    return list;
> +    return g_string_free(list, FALSE);

This reverses the order compared to the old code (which prepends
'mode' to the 'list' string it is building up). Does that matter ?

-- PMM

