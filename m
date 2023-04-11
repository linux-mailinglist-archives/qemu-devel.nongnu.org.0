Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4467D6DD80D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 12:37:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmBMh-0007p8-DE; Tue, 11 Apr 2023 06:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pmBMf-0007oI-51
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:36:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pmBMd-0000hU-8F
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:36:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681209398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g2avRfZv0y9au9h3KwDHZG3ZwMEqMG52LNoBxtz2/Ss=;
 b=SQUqIWi2tKQMAOpK2t+X0NPYhYP49WQTZoepcsvW7+hNAaHvXsbSMNZaXaOgPWwL469zHI
 OVTXYszTUdhtXANHZJ4V3FnrszBxY5uT7gWFayUYb2403QKJqM7Zimmqs5yNpScROIXzdh
 oXog0o9INjbq5EzX8pqDd/4sO0VJsUg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-jUDKwOq5P1WxGD_WFhUiYw-1; Tue, 11 Apr 2023 06:36:36 -0400
X-MC-Unique: jUDKwOq5P1WxGD_WFhUiYw-1
Received: by mail-wr1-f71.google.com with SMTP id
 d28-20020adfa41c000000b002cea6b2d5a9so1058073wra.14
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 03:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681209395;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g2avRfZv0y9au9h3KwDHZG3ZwMEqMG52LNoBxtz2/Ss=;
 b=FbXgo7RX2Gd3zvgZRS4esMqEPvGrrQ00Ebpk+XItaE1Oqx/CNpC/aytCt5ZOitC2xy
 V0elappFtsK/jBbe+1gwD77cqJw5tpuELsQtSCAmgJsAZgCTD5nEmAWDm6M27tIKMnzX
 Q+a3FqZyI0KHzP9qfpkkGLu21QC/G2KmaOv+8lAkQptsl6L2g23Pk2jNkdGbmLPC1hMn
 WtVoTHEvbSRKEbqIT11OLD2H2Q5KVHzkRjpbbieQCmrKMFbl/3a+aEdvNtRMeSQoKxQR
 J1JypIp7PmU3ZMOgTsAwa0UGy9/ygyZYR8CFWEK79fPuayZFYgONR4KbSvu+b8ES/u0p
 KbPA==
X-Gm-Message-State: AAQBX9cV5Lb4Si7SeMrC0Sf2n9N0ulfCdy8qmTyXRfaE1J1bbi4rnZfL
 fmY8sxLOkA6DqEr4C65oSBE5CbVHOUvTZisxW+w1rmK85B9oo5Zd1SV1aypeknqcAKw0aky/q0S
 Vu56BaEgH6BjpYBU=
X-Received: by 2002:a05:600c:2309:b0:3ef:6396:d9c8 with SMTP id
 9-20020a05600c230900b003ef6396d9c8mr9007508wmo.5.1681209395668; 
 Tue, 11 Apr 2023 03:36:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350YaunUufxOjdjwhUU198cG6siw6m4KnB7tKvmW1WHjUxinWFjMRW1HMd7UPpm7IXlXUBhETQg==
X-Received: by 2002:a05:600c:2309:b0:3ef:6396:d9c8 with SMTP id
 9-20020a05600c230900b003ef6396d9c8mr9007500wmo.5.1681209395404; 
 Tue, 11 Apr 2023 03:36:35 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-153.web.vodafone.de.
 [109.43.179.153]) by smtp.gmail.com with ESMTPSA id
 i2-20020a05600011c200b002d7a75a2c20sm14297280wrx.80.2023.04.11.03.36.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 03:36:34 -0700 (PDT)
Message-ID: <baef8b60-0f73-27ea-97a3-f29ecc2ee1e8@redhat.com>
Date: Tue, 11 Apr 2023 12:36:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [for-8.0] hw/i2c/allwinner-i2c: Fix subclassing of
 TYPE_AW_I2C_SUN6I
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qianfan Zhao <qianfanguijin@163.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
References: <20230411103106.3992862-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230411103106.3992862-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.246, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/04/2023 12.31, Peter Maydell wrote:
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
> ---
>   hw/i2c/allwinner-i2c.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/hw/i2c/allwinner-i2c.c b/hw/i2c/allwinner-i2c.c
> index f24c3ac6f0c..9e8efa1d63f 100644
> --- a/hw/i2c/allwinner-i2c.c
> +++ b/hw/i2c/allwinner-i2c.c
> @@ -466,10 +466,8 @@ static void allwinner_i2c_sun6i_init(Object *obj)
>   
>   static const TypeInfo allwinner_i2c_sun6i_type_info = {
>       .name = TYPE_AW_I2C_SUN6I,
> -    .parent = TYPE_SYS_BUS_DEVICE,
> -    .instance_size = sizeof(AWI2CState),
> +    .parent = TYPE_AW_I2C,
>       .instance_init = allwinner_i2c_sun6i_init,
> -    .class_init = allwinner_i2c_class_init,
>   };
>   
>   static void allwinner_i2c_register_types(void)

Reviewed-by: Thomas Huth <thuth@redhat.com>


