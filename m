Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B874C57F9
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 21:17:55 +0100 (CET)
Received: from localhost ([::1]:43216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO3Vq-0005c1-0D
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 15:17:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1nO3Uj-0004qe-T7
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 15:16:45 -0500
Received: from [2607:f8b0:4864:20::736] (port=42653
 helo=mail-qk1-x736.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1nO3Uh-0004Qr-Vg
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 15:16:45 -0500
Received: by mail-qk1-x736.google.com with SMTP id b20so52689qkn.9
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 12:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=OdDnyTFIzEN5R0UCrB1549FPesJeRH6VW/4VQbmKRps=;
 b=CoOpm3C6nm2jZuEUxpLcviasK+GTWIO68Use8qGiEdx9t3UsqJfj6pOP2u3nRqk0y7
 rE8Bw6mpg5EpomJSS3zrRExqYovalSKs4S7mHfCu77Tgd+3nVgpDz6JCLGcQM92zM1X5
 mCgmXFCk5zkvtBGs/tlv+hZSklZZLVdKTQ5xgHPOvtanFhQOO84R7hw+GTejfdmvzYUu
 NcpAjGDs6+l55+zUk8Fwe6LCYK+5SmMcptYIpkapf/R+loOa3toe//XUAKZbqbfQTSOD
 e44yNXBCE14XAOeK5YwK7Dlh8OQWSfiJO+ndebPlX0UMmJfFYAQ9nVgRfUmsJAo5naVz
 lJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=OdDnyTFIzEN5R0UCrB1549FPesJeRH6VW/4VQbmKRps=;
 b=jJiVGxpmSsoS+eY8Nso6QbjOBGvR6iD0EqrX8ok5Tr0KwUud6+N7NwSxU0upYlgCde
 RF3rOcIPbnpBI3k2bfexgGZTNOp//Yd/s8iwEbswbtwKxCJ5XV8UggLPilH2xgDPjmqZ
 /xWhEX/csQLGalaX94yW0nYZxTZw8ju2gM/UrpXVSUdOTGMDSE/sk/+JmL249vLock14
 r8Ad6IHlwd9u2mj5KvVngKelkKjuQO/cA4FNPo1pEf9RtNfOXM+clfObXwVZZPo3h3Lp
 NUaL91QY2AeH54vgMUrNmerypUgzR7hVKwJMSW7H7R3ilwcUOEaScPUc/jMfx4zJ5Ne+
 0tCA==
X-Gm-Message-State: AOAM53309CNt8t7GISVfWeuZ0BUiW4b54/N9b7HmvJVXumsvgeo6ZrSp
 w4bE78qtUUu/tBzJ3l3epX8tVr2yRw==
X-Google-Smtp-Source: ABdhPJwqTFBAx+TZ6TlIOMhHQjUwI51dtyY0WXjGTIjzbzRRBOglZ5bpBBo9b1xMToqUEIE/+6H/hQ==
X-Received: by 2002:ae9:e307:0:b0:649:113a:818 with SMTP id
 v7-20020ae9e307000000b00649113a0818mr7754214qkf.590.1645906602579; 
 Sat, 26 Feb 2022 12:16:42 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a05620a128d00b006493a9c7c46sm2881801qki.14.2022.02.26.12.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 12:16:42 -0800 (PST)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:6588:6e71:6ba8:df0e])
 by serve.minyard.net (Postfix) with ESMTPSA id 33C8E1800BC;
 Sat, 26 Feb 2022 20:16:41 +0000 (UTC)
Date: Sat, 26 Feb 2022 14:16:40 -0600
From: Corey Minyard <minyard@acm.org>
To: Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH v2 15/22] hw/ipmi/isa_ipmi_bt: Disuse isa_init_irq()
Message-ID: <20220226201640.GB3457@minyard.net>
References: <20220222193446.156717-1-shentey@gmail.com>
 <20220222193446.156717-16-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220222193446.156717-16-shentey@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::736
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=tcminyard@gmail.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 22, 2022 at 08:34:39PM +0100, Bernhard Beschow wrote:
> isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
> Use the original instead such that isa_init_irq() can be removed
> eventually.

Looking at the rest of the patch series, this looks lik a good idea.
This is obviously trivial here, but:

Acked-by: Corey Minyard <cminyard@mvista.com>

For this and the KCS patch.

-corey

> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/ipmi/isa_ipmi_bt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/ipmi/isa_ipmi_bt.c b/hw/ipmi/isa_ipmi_bt.c
> index 02625eb94e..88aa734e9e 100644
> --- a/hw/ipmi/isa_ipmi_bt.c
> +++ b/hw/ipmi/isa_ipmi_bt.c
> @@ -92,7 +92,7 @@ static void isa_ipmi_bt_realize(DeviceState *dev, Error **errp)
>      }
>  
>      if (iib->isairq > 0) {
> -        isa_init_irq(isadev, &iib->irq, iib->isairq);
> +        iib->irq = isa_get_irq(isadev, iib->isairq);
>          iib->bt.use_irq = 1;
>          iib->bt.raise_irq = isa_ipmi_bt_raise_irq;
>          iib->bt.lower_irq = isa_ipmi_bt_lower_irq;
> -- 
> 2.35.1
> 

