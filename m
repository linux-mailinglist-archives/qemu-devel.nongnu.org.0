Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 802086DDA0B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 13:49:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmCUz-0006gM-O1; Tue, 11 Apr 2023 07:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pmCUs-0006bm-9b; Tue, 11 Apr 2023 07:49:15 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pmCUq-0007xr-AA; Tue, 11 Apr 2023 07:49:13 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 39-20020a9d04aa000000b006a1370e214aso1969907otm.11; 
 Tue, 11 Apr 2023 04:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681213750; x=1683805750;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IsQyc95o8bd+OcnbSy5PFUoAsdLax7/Na5qep9DeBzA=;
 b=fjKFjpqk2JIn23C9/CQ01lfb6BSSjZWOAM5eVdNlCnv+q2P9Q9NEbKWoPfYmgtIsEp
 6D3wk+j36ZdREzwbBRLPZbg+CdjB8Hxooymy/oiPzkocZemazghFWRcpmd5oXalsYFmi
 x1mBZkJ1kG/eD+oxFcNKYKggEP58eOH+9GO+3AN9w6GbADxGtOAFJ56wQMtDFfMJ9p+I
 6msx0ciACRQmoC7iZoxD/uLW/FwEudPxbJHi46xCZrtkHVrzw1SHXxdR5Zu0B9mBK452
 e1jv4QquJIuWg2I/SYd83zu5enFH1GxPqaT+yyxIVBQgqw9HFrr+MSyT4jj26oo+v6ly
 /hqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681213750; x=1683805750;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IsQyc95o8bd+OcnbSy5PFUoAsdLax7/Na5qep9DeBzA=;
 b=2ox+30ohrKu8djAt8b2GTdKEaPwMQEa7yOmIHCUUCqi6IGaUMh75tEGlKipn7ZXTZE
 02tUn/CXsn/V0WVKijGCiieoUs7VYpWTRKmuF2bbQhvbL0klQoijbQEtXmW2J6WSiHL5
 3J6QcdCemKbTixZiSTpxzmdBGx8bbV+a3kFIde6FeBZftRw4do7rqf76dBbKMKumsnlW
 QI6BSRrFijLm9Pq9BoC5QJcdUw0WSe8SFjZkYzP8ucWxgGwd6WUaloyfPQPA3+JSXpFJ
 i+WjsSdB6GByEbcvO5SNVLYV8pgX79DmYTO2E4Pdb9O/wgGn5r+2l1ePna75zFweYGo2
 D26A==
X-Gm-Message-State: AAQBX9ePYD4RW4BkVY1YgppGE4vu/mLLoLyZTt12ASR4h5P7I9M1IrFO
 QIX2bf2kyyuznULidiPyTg==
X-Google-Smtp-Source: AKy350bWMy9pk2CnijUx8Yb5eCCV7A3v/w+BjtMkBs5WYZ5b2isv/A3CSJRgQksmZ8YdA65BhvKi/A==
X-Received: by 2002:a05:6830:12c8:b0:6a1:37f1:9863 with SMTP id
 a8-20020a05683012c800b006a137f19863mr5698389otq.11.1681213750376; 
 Tue, 11 Apr 2023 04:49:10 -0700 (PDT)
Received: from serve.minyard.net ([47.184.185.84])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a056830104e00b0069457b86060sm5407387otp.47.2023.04.11.04.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 04:49:09 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:b8e9:4170:b6dc:61ca])
 by serve.minyard.net (Postfix) with ESMTPSA id 8F32A1800BB;
 Tue, 11 Apr 2023 11:49:08 +0000 (UTC)
Date: Tue, 11 Apr 2023 06:49:07 -0500
From: Corey Minyard <minyard@acm.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 qianfan Zhao <qianfanguijin@163.com>, Thomas Huth <thuth@redhat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: Re: [for-8.0] hw/i2c/allwinner-i2c: Fix subclassing of
 TYPE_AW_I2C_SUN6I
Message-ID: <ZDVJM2q/rim1lsBU@minyard.net>
References: <20230411103106.3992862-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411103106.3992862-1-peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=tcminyard@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Apr 11, 2023 at 11:31:06AM +0100, Peter Maydell wrote:
> In commit 8461bfdca9c we added the TYPE_AW_I2C_SUN6I, which is a
> minor variant of the TYPE_AW_I2C device.  However, we didn't quite
> get the class hierarchy right.  We made the new TYPE_AW_I2C_SUN6I a
> subclass of TYPE_SYS_BUS_DEVICE, which means that you can't validly
> use a pointer to this object via the AW_I2C() cast macro, which
> insists on having something that is an instance of TYPE_AW_I2C or
> some subclass of that type.
> 
> This only causes a problem if QOM cast macro debugging is enabled;
> that is supposed to be on by default, but a mistake in the meson
> conversion in commit c55cf6ab03f4c meant that it ended up disabled by
> default, and we didn't catch this bug.
> 
> Fix the problem by arranging the classes in the same way we do for
> TYPE_PL011 and TYPE_PL011_LUMINARY in hw/char/pl011.c -- make the
> variant class be a subclass of the "normal" version of the device.
> 
> This was reported in
> https://gitlab.com/qemu-project/qemu/-/issues/1586 but this fix alone
> isn't sufficient, as there is a separate cast-related issue in the
> CXL code in pci_expander_bridge.c.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Looks correct ot me.

Reviewed-by: Corey Minyard <cminyard@mvista.com>

> ---
>  hw/i2c/allwinner-i2c.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/hw/i2c/allwinner-i2c.c b/hw/i2c/allwinner-i2c.c
> index f24c3ac6f0c..9e8efa1d63f 100644
> --- a/hw/i2c/allwinner-i2c.c
> +++ b/hw/i2c/allwinner-i2c.c
> @@ -466,10 +466,8 @@ static void allwinner_i2c_sun6i_init(Object *obj)
>  
>  static const TypeInfo allwinner_i2c_sun6i_type_info = {
>      .name = TYPE_AW_I2C_SUN6I,
> -    .parent = TYPE_SYS_BUS_DEVICE,
> -    .instance_size = sizeof(AWI2CState),
> +    .parent = TYPE_AW_I2C,
>      .instance_init = allwinner_i2c_sun6i_init,
> -    .class_init = allwinner_i2c_class_init,
>  };
>  
>  static void allwinner_i2c_register_types(void)
> -- 
> 2.34.1
> 
> 

