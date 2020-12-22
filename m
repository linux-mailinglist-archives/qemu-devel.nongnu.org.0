Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF6F2E0CED
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 16:56:56 +0100 (CET)
Received: from localhost ([::1]:43882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krk1v-0003xN-OF
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 10:56:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1krk0i-0003SO-Pd; Tue, 22 Dec 2020 10:55:40 -0500
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:37352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1krk0h-0003wC-At; Tue, 22 Dec 2020 10:55:40 -0500
Received: by mail-lf1-x12e.google.com with SMTP id o17so33121221lfg.4;
 Tue, 22 Dec 2020 07:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jijhnB3fRl5eF2oqZpIoNUQbTFLEj2JAtzFodOjC6hU=;
 b=uPoPD02o+hskmbUzksuwCew8MpM8xei5XnZb3C4N7R5hfvKIdng4Lg39ntRG9Y4ire
 LMrsoqg7qPiYXKOhkPLmWG/C0YAWj9cwkdH05NZNGuggrrsyS8N7dE8CZxGNO1G+aqUu
 rvST4FIfXWGc+apuve2duMVSl+cPnkEm7fxDmmd+5fL0J2yyUA4zJR12YIhlMqZulZo3
 CR9j76IRLlhQn1WuUcuei1W3r8d3Z6kfyXwxG7spZq5QTxh+glWPuE3y99pt1/53NAsj
 yvi1SMHTdMULgGJtMVt0TgyLZcKtTnfzDKgmBJrf5bS/0EriCbYIHqhEK8l6ProJYKf2
 MG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jijhnB3fRl5eF2oqZpIoNUQbTFLEj2JAtzFodOjC6hU=;
 b=JtndgNu427KbBopCQlOBSF4CKuCj7KK8NOAD5GJfjpckeUOjn3lJ4SJwWIL1T3kHiu
 xTD7sRGB9QKBTMmLCGmu0oeaaG0EFv7zgHLpwdTL5J4yHtfexhNU/4ICo7pESDFt7w24
 p9bYfCvjIka5a9G/b3RiLQJq/E2bsB5Fmyq1SUIloShdc9m49hiZENn+IYLyKi3+kvJ2
 qP2zKz7GRHTXvM0PJ8Hd/jU5z8fz/Z1bFZg7PHFlVDvWNuWx2Z3jY4P9rYoLLIljDDGG
 cl/Xdk5e6DwaiK7Y5d044qOrXEBff2C2hAvPJ8mqGtnyG1TXieO7JYI6SUyhrh8V8ntR
 hcYQ==
X-Gm-Message-State: AOAM530mUdQSbx2YxamdjyvwOxmSMMDhqEE8hFu3vrZRI0ewl3JdC7Lr
 iKlszG38GTLV//G7pVJWHQc=
X-Google-Smtp-Source: ABdhPJxCiEMGKb/hMUBkADyCtYc2JXMFK/rXiglmiBkF9rXcRWtKuJsyDZqjczCK4pkOLfZYVhdzHw==
X-Received: by 2002:a19:c6c2:: with SMTP id w185mr8879841lff.354.1608652536933; 
 Tue, 22 Dec 2020 07:55:36 -0800 (PST)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 s7sm2914758ljp.38.2020.12.22.07.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 07:55:36 -0800 (PST)
Date: Tue, 22 Dec 2020 16:55:34 +0100
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v4 1/2] hw/block: m25p80: Don't write to flash if write
 is disabled
Message-ID: <20201222155533.GB26555@fralle-msi>
References: <1608619520-62782-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1608619520-62782-1-git-send-email-bmeng.cn@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On [2020 Dec 22] Tue 14:45:19, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> When write is disabled, the write to flash should be avoided
> in flash_write8().
> 
> Fixes: 82a2499011a7 ("m25p80: Initial implementation of SPI flash device")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> 
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - new patch: honor write enable flag in flash write
> 
>  hw/block/m25p80.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 483925f..236e1b4 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -594,6 +594,7 @@ void flash_write8(Flash *s, uint32_t addr, uint8_t data)
>  
>      if (!s->write_enable) {
>          qemu_log_mask(LOG_GUEST_ERROR, "M25P80: write with write protect!\n");
> +        return;
>      }
>  
>      if ((prev ^ data) & data) {
> -- 
> 2.7.4
> 

