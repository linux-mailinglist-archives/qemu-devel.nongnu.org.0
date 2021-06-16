Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D933AA421
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 21:18:56 +0200 (CEST)
Received: from localhost ([::1]:55132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltb3v-0000Z4-GU
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 15:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1ltb1m-0006PR-7e
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:16:42 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:35748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1ltb1k-0001BU-8a
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:16:41 -0400
Received: by mail-oi1-x229.google.com with SMTP id l12so3666614oig.2
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 12:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=iwYgsGqaMnikrs5SiKIqwp82TkLou4IHu977RuRJhE0=;
 b=Z25Wu33YKYMuUNgyZxk9iz9rARRaaBsBjQCRZucHJajc5vKAJXRmE7TB662hWE/Spe
 MSGQpcYLUtteuVNVDUsO5kxicUG7B4am83OAvsSZkxIrqV2gxZT06lXCM0Poujek+a0Y
 gMyLSry5qbGVEfa9CKBQyeEdlnu6yPjVhTTAwpCVkxO5PdKhEysAYZWvVmRNMh/DhiFV
 Mb/Yv/Z9NW5Njz+eDy9f7xMKA3D3zCMiXGLSaDgohmKcsi2482BR1q9mnelLz2Xi3o6U
 fAtHq54xY6LrWANWyO0PVuQ1yMIn8NfFI54Z89AvTYv55jmmPm7DekKqcCXBbK3jT+kn
 4yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=iwYgsGqaMnikrs5SiKIqwp82TkLou4IHu977RuRJhE0=;
 b=rAtsIdrZgP759FtvQMhTOjIjJHD7P5n9gNWmdKysNL1f2mWkBcamd/QzRfA4Fee2mx
 QOgwDK2F2tpoxmc/Kyik6cx83ZhMXZto2RVESksMx7nrVuL6xrFC2gd239F9VvM1IgT9
 L4vD1FSccVc7x13uKRgV/aoCMSKqNFUe6c3qqqoy+hGoDHT2ws6vNGwszH22on1TFw/I
 z1kjByXCq1i431TegAUZpbW3i7swb/0LJxN6ggYl5cqFOCKLVpAZcI1V6yySFm0HEZQF
 GcH8Nta+o84NaGDEhfjsjEcF24oCEWV8Lhko7DXC/yJMzx2oh08HA8ojpQBb8YdO1iak
 pdeg==
X-Gm-Message-State: AOAM532WpUqbAQuDDy20Tr5JU9kf0FxlgQRS3MsDK5Ozib/+Q1+RBu6l
 2lp3vVLNQ65X+/YKgfeUHOBsNw==
X-Google-Smtp-Source: ABdhPJw4boMLDnnjCkZMraNVjJdYAR5ChVQFh2XPAIyU/LXSZi9x9yX6pxzPzKO4Ova9i4UYXZ2gVA==
X-Received: by 2002:a54:4401:: with SMTP id k1mr733503oiw.2.1623870999092;
 Wed, 16 Jun 2021 12:16:39 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:ede8:ade8:da1:e1cc])
 by smtp.gmail.com with ESMTPSA id s23sm732546otp.38.2021.06.16.12.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 12:16:38 -0700 (PDT)
Date: Wed, 16 Jun 2021 14:16:37 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 06/13] hw/i2c/ppc4xx_i2c: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
Message-ID: <20210616191637.GF11196@minyard.net>
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-7-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210616161418.2514095-7-f4bug@amsat.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=cminyard@mvista.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: cminyard@mvista.com
Cc: "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 16, 2021 at 06:14:11PM +0200, Philippe Mathieu-Daudé wrote:
> Instead of using the confuse i2c_send_recv(), rewrite to directly
> call i2c_recv() & i2c_send(), resulting in code easire to review.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/i2c/ppc4xx_i2c.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/i2c/ppc4xx_i2c.c b/hw/i2c/ppc4xx_i2c.c
> index f4c5bc12d36..b3d3da56e38 100644
> --- a/hw/i2c/ppc4xx_i2c.c
> +++ b/hw/i2c/ppc4xx_i2c.c
> @@ -240,11 +240,14 @@ static void ppc4xx_i2c_writeb(void *opaque, hwaddr addr, uint64_t value,
>                          i2c->sts &= ~IIC_STS_ERR;
>                      }
>                  }
> -                if (!(i2c->sts & IIC_STS_ERR) &&
> -                    i2c_send_recv(i2c->bus, &i2c->mdata[i], !recv)) {
> -                    i2c->sts |= IIC_STS_ERR;
> -                    i2c->extsts |= IIC_EXTSTS_XFRA;
> -                    break;
> +                if (!(i2c->sts & IIC_STS_ERR)) {
> +                    if (recv) {
> +                        i2c->mdata[i] = i2c_recv(i2c->bus);
> +                    } else if (i2c_send(i2c->bus, i2c->mdata[i])) {

In the previous patch you checked < 0, it would be nice to be
consistent.

-corey

> +                        i2c->sts |= IIC_STS_ERR;
> +                        i2c->extsts |= IIC_EXTSTS_XFRA;
> +                        break;
> +                    }
>                  }
>                  if (value & IIC_CNTL_RPST || !(value & IIC_CNTL_CHT)) {
>                      i2c_end_transfer(i2c->bus);
> -- 
> 2.31.1
> 

