Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 785FB6F00E6
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 08:39:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prvHX-00042p-Fk; Thu, 27 Apr 2023 02:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1prvHS-00041y-G2; Thu, 27 Apr 2023 02:39:05 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1prvHQ-0008Kq-Js; Thu, 27 Apr 2023 02:39:02 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4ec8eca56cfso8956664e87.0; 
 Wed, 26 Apr 2023 23:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682577537; x=1685169537;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R0Eg+Phx3jScS7HnUgDmf2NBR9psdWE4ikBaBcKUjmE=;
 b=cqLDDtv0425EYKetX1cuJvaijFFPeVbLRKm9TtFYhAnl3Etn83BsXPziJp7z0U5J4M
 jlueaeiZORfdm3fBMNaHLyuRG0CJe+lGtYhqk8xqC4JPG/m3V8jUB06tDwBNo+i/I1/Z
 +z7oLNy8ibbOkqZ3N4O2C8ukrUXUJlA8w+TtZat/8d1Yz8ezqjGti8rtkjckPmdQARk2
 EEbpL8/V59u5XW3Oewd5mptkPD4leRQnArzGv3HaRznr79dbzgLvTVS+j/HNzTzIWYHt
 6BFIgJbzlhw/th1iu8MEcK3ELk/RmpErI+KRY9o+4bOxH20+Apr+GnqXYeE1kZfzHMdr
 uIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682577537; x=1685169537;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R0Eg+Phx3jScS7HnUgDmf2NBR9psdWE4ikBaBcKUjmE=;
 b=WpNnlWxTF2hLk2L+mGyFi0L7Hkyzfm7L0YtfYLbVGUxWnYw5kojLwj5uf9h2RZAYLE
 pM0kKpWx8p9ONShAzMFzC+RCeywoRkmNVoQxGbEZFHpm5HwI40lVSUB+z+ozEVrZvm7h
 yV6wUNVdGDeURHLvuVFn5MNAVhJ8a9oVgGe09VYkOHIFgYjFCjBQ1J7Pnqyjx+d4Z4gq
 ZusFfrm6Q3MdXK1zC4KpP4I3s38cgqqxPdS7wlgRMXwgKmpIFZ8VmO+UIVSKyNfDkdf9
 HcZ8862zG46Y45bA0QAowde+3uu1ftqzNIR8ew54mg8ov+ldeCnR1tgyWy9wTS8+ty+m
 e1MA==
X-Gm-Message-State: AC+VfDzfJv2QyroFrLtxvjYyJEnpaJhAMUXoge3i9NXEaWK6P32uiChH
 HrCM+4pw+iDrCw1qxpezBwI=
X-Google-Smtp-Source: ACHHUZ55fetCBC/+0iJEQqQcQMMxiSJ1Mi+6czBFTDxMIv5l675cxn+aur2R2Apgu3FriaAMqmrxzw==
X-Received: by 2002:ac2:5dd8:0:b0:4e9:813e:409c with SMTP id
 x24-20020ac25dd8000000b004e9813e409cmr230174lfq.28.1682577537352; 
 Wed, 26 Apr 2023 23:38:57 -0700 (PDT)
Received: from fralle-msi (217-76-87-243.cust.bredband2.com. [217.76.87.243])
 by smtp.gmail.com with ESMTPSA id
 r26-20020ac24d1a000000b004efecbf5768sm1842889lfi.264.2023.04.26.23.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 23:38:56 -0700 (PDT)
Date: Thu, 27 Apr 2023 08:38:55 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Tong Ho <tong.ho@amd.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair@alistair23.me,
 edgar.iglesias@gmail.comi, peter.maydell@linaro.org
Subject: Re: [PATCH] hw/nvram: Avoid unnecessary Xilinx eFuse backstore write
Message-ID: <20230427063854.GA6030@fralle-msi>
References: <20230426211607.2054776-1-tong.ho@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426211607.2054776-1-tong.ho@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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

On [2023 Apr 26] Wed 14:16:07, Tong Ho wrote:
> Add a check in the bit-set operation to write the backstore
> only if the affected bit is 0 before.
> 
> With this in place, there will be no need for callers to
> do the checking in order to avoid unnecessary writes.
> 
> Signed-off-by: Tong Ho <tong.ho@amd.com>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  hw/nvram/xlnx-efuse.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/nvram/xlnx-efuse.c b/hw/nvram/xlnx-efuse.c
> index fdfffaab99..655c40b8d1 100644
> --- a/hw/nvram/xlnx-efuse.c
> +++ b/hw/nvram/xlnx-efuse.c
> @@ -143,6 +143,8 @@ static bool efuse_ro_bits_find(XlnxEFuse *s, uint32_t k)
>  
>  bool xlnx_efuse_set_bit(XlnxEFuse *s, unsigned int bit)
>  {
> +    uint32_t set, *row;
> +
>      if (efuse_ro_bits_find(s, bit)) {
>          g_autofree char *path = object_get_canonical_path(OBJECT(s));
>  
> @@ -152,8 +154,13 @@ bool xlnx_efuse_set_bit(XlnxEFuse *s, unsigned int bit)
>          return false;
>      }
>  
> -    s->fuse32[bit / 32] |= 1 << (bit % 32);
> -    efuse_bdrv_sync(s, bit);
> +    /* Avoid back-end write unless there is a real update */
> +    row = &s->fuse32[bit / 32];
> +    set = 1 << (bit % 32);
> +    if (!(set & *row)) {
> +        *row |= set;
> +        efuse_bdrv_sync(s, bit);
> +    }
>      return true;
>  }
>  
> -- 
> 2.25.1
> 

