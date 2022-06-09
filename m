Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0905443C9
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 08:27:39 +0200 (CEST)
Received: from localhost ([::1]:44296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzBdq-0003Cp-8X
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 02:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nzBbS-00026K-EB
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 02:25:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nzBbP-0005Xt-94
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 02:25:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654755905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KHHYGg3liZ9UUg4k7saa3rrUsiZ/XavPZSmKlLHUVjU=;
 b=UogVR2YoRo9FH8FQUZvb5lBwab7DJdluRddK8IMpQUnBIwG2T7qB/V1+uu6oTM/B941tc9
 eQ4Y8Eyhfkuy100T3HM6OntxUpoqehHE9BgoFU+D3hsWoXoke/XnhJ/gqJisxOs2GLd9ds
 nl6UrTqVYvfMGJ0m48x7auV31HVkg50=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-ZSgEl4gYMSqV9UHOqKdjmw-1; Thu, 09 Jun 2022 02:25:03 -0400
X-MC-Unique: ZSgEl4gYMSqV9UHOqKdjmw-1
Received: by mail-wm1-f69.google.com with SMTP id
 m22-20020a7bcb96000000b0039c4f6ade4dso3226060wmi.8
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 23:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KHHYGg3liZ9UUg4k7saa3rrUsiZ/XavPZSmKlLHUVjU=;
 b=ZzqPDgONU2nCRTfz88LKPKT//ktfCOzbPlYPikjVzTphtVkcOCxjuToqCi6bmNBEyv
 SW8+b7wwobOU31mfP8inmEs+TvARrHB53PMs9HVBe+pds53VLuXrUMo1/RBvL8iaLtXy
 flK/g/Ojb2ThMD5GAnYlSTBG8TyLWcbGJ5AEsskKTWXZ3K6IeicJcv0cj0x6OC5mKZcX
 QbBTHvHZS2Cza3HkIZCFCdRX4lHugGnRFOPOcvoro6udblGQ08F7GnsQrNnomw8wRE94
 W8BkIRF9WW06WU53yyaXUiggE8iC3msc9WJC7WYs0Ai7EKHnyaIt0P2U1AhXStZUrG1m
 dIWg==
X-Gm-Message-State: AOAM532EisonQea+bMFH/WVGPu33vtmeKpLlu75AQL2B9VoVgIOa3z6d
 N5vNZCZNhL1odRbQgnqA1CuImGkjKQvgCTbuRnt3SKBfZ38DDw0ANUY9Xgl/lEvEajx1zaMbVmD
 W6NiAOrUdmCWo73s=
X-Received: by 2002:a7b:c205:0:b0:39c:506d:e294 with SMTP id
 x5-20020a7bc205000000b0039c506de294mr1615030wmi.159.1654755902604; 
 Wed, 08 Jun 2022 23:25:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCEoW8prsj9HL3jbPo1ewUCoTyMOqqZUm2INPEXdDrLoVa3kGJOW4/iL0LkaaTK1f4qnJV+A==
X-Received: by 2002:a7b:c205:0:b0:39c:506d:e294 with SMTP id
 x5-20020a7bc205000000b0039c506de294mr1615001wmi.159.1654755902283; 
 Wed, 08 Jun 2022 23:25:02 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-42-115-130.web.vodafone.de.
 [109.42.115.130]) by smtp.gmail.com with ESMTPSA id
 n20-20020a7bc5d4000000b0039aef592ca0sm26115228wmk.35.2022.06.08.23.25.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 23:25:01 -0700 (PDT)
Message-ID: <c7a83cff-c215-9c2e-0a88-956c67742f2d@redhat.com>
Date: Thu, 9 Jun 2022 08:24:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/2] hw: m25p80: add tests for write protect
Content-Language: en-US
To: Iris Chen <irischenlj@fb.com>, qemu-devel@nongnu.org
Cc: pdel@fb.com, qemu-arm@nongnu.org, clg@kaod.org, patrick@stwcx.xyz,
 alistair@alistair23.me, kwolf@redhat.com, hreitz@redhat.com,
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 lvivier@redhat.com, pbonzini@redhat.com, qemu-block@nongnu.org
References: <20220609031320.2212468-1-irischenlj@fb.com>
 <20220609031320.2212468-2-irischenlj@fb.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220609031320.2212468-2-irischenlj@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/06/2022 05.13, Iris Chen wrote:
> Signed-off-by: Iris Chen <irischenlj@fb.com>
> ---
> Include the tests in a separate patch. Using qtest_set_irq_in() as per review.
> 
>   tests/qtest/aspeed_smc-test.c | 60 +++++++++++++++++++++++++++++++++++
>   1 file changed, 60 insertions(+)
> 
> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
> index c5d97d4410..7786addfb8 100644
> --- a/tests/qtest/aspeed_smc-test.c
> +++ b/tests/qtest/aspeed_smc-test.c
> @@ -392,6 +392,64 @@ static void test_read_status_reg(void)
>       flash_reset();
>   }
>   
> +static void test_status_reg_write_protection(void)
> +{
> +    uint8_t r;
> +
> +    spi_conf(CONF_ENABLE_W0);
> +
> +    /* default case: WP# is high and SRWD is low -> status register writable */
> +    spi_ctrl_start_user();
> +    writeb(ASPEED_FLASH_BASE, WREN);
> +    /* test ability to write SRWD */
> +    writeb(ASPEED_FLASH_BASE, WRSR);
> +    writeb(ASPEED_FLASH_BASE, SRWD);
> +    writeb(ASPEED_FLASH_BASE, RDSR);
> +    r = readb(ASPEED_FLASH_BASE);
> +    spi_ctrl_stop_user();
> +    g_assert_cmphex(r & SRWD, ==, SRWD);
> +
> +    /* WP# high and SRWD high -> status register writable */
> +    spi_ctrl_start_user();
> +    writeb(ASPEED_FLASH_BASE, WREN);
> +    /* test ability to write SRWD */
> +    writeb(ASPEED_FLASH_BASE, WRSR);
> +    writeb(ASPEED_FLASH_BASE, 0);
> +    writeb(ASPEED_FLASH_BASE, RDSR);
> +    r = readb(ASPEED_FLASH_BASE);
> +    spi_ctrl_stop_user();
> +    g_assert_cmphex(r & SRWD, ==, 0);
> +
> +    /* WP# low and SRWD low -> status register writable */
> +    qtest_set_irq_in(global_qtest,
> +                     "/machine/soc/fmc/ssi.0/child[0]", "WP#", 0, 0);
> +    spi_ctrl_start_user();
> +    writeb(ASPEED_FLASH_BASE, WREN);
> +    /* test ability to write SRWD */
> +    writeb(ASPEED_FLASH_BASE, WRSR);
> +    writeb(ASPEED_FLASH_BASE, SRWD);
> +    writeb(ASPEED_FLASH_BASE, RDSR);
> +    r = readb(ASPEED_FLASH_BASE);
> +    spi_ctrl_stop_user();
> +    g_assert_cmphex(r & SRWD, ==, SRWD);
> +
> +    /* WP# low and SRWD high -> status register NOT writable */
> +    spi_ctrl_start_user();
> +    writeb(ASPEED_FLASH_BASE, WREN);
> +    /* test ability to write SRWD */
> +    writeb(ASPEED_FLASH_BASE, WRSR);
> +    writeb(ASPEED_FLASH_BASE, 0);
> +    writeb(ASPEED_FLASH_BASE, RDSR);
> +    r = readb(ASPEED_FLASH_BASE);
> +    spi_ctrl_stop_user();
> +    /* write is not successful */
> +    g_assert_cmphex(r & SRWD, ==, SRWD);
> +
> +    qtest_set_irq_in(global_qtest,
> +                     "/machine/soc/fmc/ssi.0/child[0]", "WP#", 0, 1);
> +    flash_reset();
> +}

FWIW, I'd prefer if we could use qtest_writeb / qtest_readb for new code 
instead of writeb / readb, but well, the whole file is already written that 
way, so this is only "consistent" ... so:

Acked-by: Thomas Huth <thuth@redhat.com>


