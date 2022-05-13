Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FE1526D21
	for <lists+qemu-devel@lfdr.de>; Sat, 14 May 2022 00:49:54 +0200 (CEST)
Received: from localhost ([::1]:35570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npe6a-00021g-Ll
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 18:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1npe4X-0001Et-6a; Fri, 13 May 2022 18:47:45 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:46891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1npe4V-0003N4-5v; Fri, 13 May 2022 18:47:44 -0400
Received: by mail-lf1-x136.google.com with SMTP id i10so16763604lfg.13;
 Fri, 13 May 2022 15:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=efrhvYSsnbcAAZzTuMWbyN+jCMcPVPFgSQVBASvi6I8=;
 b=Ac9HKtmTvXypBDvQfIp1jWX+kBbSMD5IL2tb3hjtRShmpk5DIt2nOfOL14HSPrEGFR
 E1YCf43fq6KoIhStaEOXQ/mJAbXJjXh/c76Sy4X8PJlbl0ZHPShrFrFRBRBjGHuCk95T
 hf+2aQhWEQK/tm7/S6T8HexkZNqa9QXBhgTYLNnNW21CMy+vGO59Ly7K2X9WrKYf2QQQ
 Lv2P7MVQT5r+SjQquae4yaCFHfYZ1zAmUHlAWHu1Ni6xpxKSm2Y2D6t/DMd5yYEXS+yH
 tqHlgd5f13HdH9vc2zF6QmtEM8Jj/73M7/W78ffi1Dfg4FMhnpvdcXcRQ0MPLZQgPG1s
 o5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=efrhvYSsnbcAAZzTuMWbyN+jCMcPVPFgSQVBASvi6I8=;
 b=C4yP959eJ6XExmdc4+YvluWcZEuYBDbjhlEvhTnsEpfrKnNen4eRhsUiqCrw63utqI
 K8uMIQ+Ua0Js1ZBpCEcyasOfk8Lh9YkJRbk1q6jPIE19rIuIFtAJiBbiav4CH/2pk4Gh
 m/kcqR9KDLJ7P29E/S+aXUJ7DHkItUDnxJrhaRtOTo4m3Pp721UiVKOCaxwUDnAkjeW1
 +dZr6LmDpk+TQjuyGYY6rhJNF3XR2AbNg2zDPtCwcwmSeMIpnvGdqH2fCXh/CsGB2akZ
 6yj0BpbQQiAReWb74bG4g+yyV10gyyRakyC59VL+b42mQjGq5FV7ikvoOSNU/oeyMriq
 dicQ==
X-Gm-Message-State: AOAM532pGcG+3w44A4oRqwxBaslcWLapY1yHo2f1sJFWOoTe+fGqrIPs
 qodXwC/A04WbX0gMZfLIYNg=
X-Google-Smtp-Source: ABdhPJyDnVK36KOcrsQ8MF3sg62yJavt7ep3rdPhDdGM241i/XjEl3qTxD/qoBe3EgW+Icvv9Fobvg==
X-Received: by 2002:ac2:4e15:0:b0:473:c4c2:dc0f with SMTP id
 e21-20020ac24e15000000b00473c4c2dc0fmr4870246lfr.13.1652482058536; 
 Fri, 13 May 2022 15:47:38 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 y11-20020ac2420b000000b0047255d211fdsm510643lfh.300.2022.05.13.15.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 15:47:37 -0700 (PDT)
Date: Sat, 14 May 2022 00:47:36 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Iris Chen <irischenlj@fb.com>
Cc: pdel@fb.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, clg@kaod.org,
 patrick@stwcx.xyz, alistair@alistair23.me, kwolf@redhat.com,
 hreitz@redhat.com, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, thuth@redhat.com, lvivier@redhat.com,
 pbonzini@redhat.com, qemu-block@nongnu.org
Subject: Re: [PATCH v3] hw: m25p80: allow write_enable latch get/set
Message-ID: <20220513224735.GB10629@fralle-msi>
References: <irischenlj@gmail.com> <20220513055022.951759-1-irischenlj@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513055022.951759-1-irischenlj@fb.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x136.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On [2022 May 12] Thu 22:50:22, Iris Chen via wrote:
> The write_enable latch property is not currently exposed.
> This commit makes it a modifiable property.
> 
> Signed-off-by: Iris Chen <irischenlj@fb.com>
> ---
> v3: Addressed comments by Peter and Cedric.
> v2: Ran ./scripts/checkpatch.pl on the patch and added a description. Fixed comments regarding DEFINE_PROP_BOOL.
> 
>  hw/block/m25p80.c              |  1 +
>  tests/qtest/aspeed_gpio-test.c | 40 +++++++------------------------
>  tests/qtest/aspeed_smc-test.c  | 43 ++++++++++++++++++++++++++++++++++
>  tests/qtest/libqtest.c         | 24 +++++++++++++++++++
>  tests/qtest/libqtest.h         | 22 +++++++++++++++++
>  5 files changed, 98 insertions(+), 32 deletions(-)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 430d1298a8..4283b990af 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -1558,6 +1558,7 @@ static int m25p80_pre_save(void *opaque)
>  
>  static Property m25p80_properties[] = {
>      /* This is default value for Micron flash */
> +    DEFINE_PROP_BOOL("write-enable", Flash, write_enable, false),

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

>      DEFINE_PROP_UINT32("nonvolatile-cfg", Flash, nonvolatile_cfg, 0x8FFF),
>      DEFINE_PROP_UINT8("spansion-cr1nv", Flash, spansion_cr1nv, 0x0),
>      DEFINE_PROP_UINT8("spansion-cr2nv", Flash, spansion_cr2nv, 0x8),
> diff --git a/tests/qtest/aspeed_gpio-test.c b/tests/qtest/aspeed_gpio-test.c
> index c1003f2d1b..bac63e8742 100644
> --- a/tests/qtest/aspeed_gpio-test.c
> +++ b/tests/qtest/aspeed_gpio-test.c
> @@ -28,30 +28,6 @@
>  #include "qapi/qmp/qdict.h"
>  #include "libqtest-single.h"
>  
> -static bool qom_get_bool(QTestState *s, const char *path, const char *property)
> -{
> -    QDict *r;
> -    bool b;
> -
> -    r = qtest_qmp(s, "{ 'execute': 'qom-get', 'arguments': "
> -                     "{ 'path': %s, 'property': %s } }", path, property);
> -    b = qdict_get_bool(r, "return");
> -    qobject_unref(r);
> -
> -    return b;
> -}
> -
> -static void qom_set_bool(QTestState *s, const char *path, const char *property,
> -                         bool value)
> -{
> -    QDict *r;
> -
> -    r = qtest_qmp(s, "{ 'execute': 'qom-set', 'arguments': "
> -                     "{ 'path': %s, 'property': %s, 'value': %i } }",
> -                     path, property, value);
> -    qobject_unref(r);
> -}
> -
>  static void test_set_colocated_pins(const void *data)
>  {
>      QTestState *s = (QTestState *)data;
> @@ -60,14 +36,14 @@ static void test_set_colocated_pins(const void *data)
>       * gpioV4-7 occupy bits within a single 32-bit value, so we want to make
>       * sure that modifying one doesn't affect the other.
>       */
> -    qom_set_bool(s, "/machine/soc/gpio", "gpioV4", true);
> -    qom_set_bool(s, "/machine/soc/gpio", "gpioV5", false);
> -    qom_set_bool(s, "/machine/soc/gpio", "gpioV6", true);
> -    qom_set_bool(s, "/machine/soc/gpio", "gpioV7", false);
> -    g_assert(qom_get_bool(s, "/machine/soc/gpio", "gpioV4"));
> -    g_assert(!qom_get_bool(s, "/machine/soc/gpio", "gpioV5"));
> -    g_assert(qom_get_bool(s, "/machine/soc/gpio", "gpioV6"));
> -    g_assert(!qom_get_bool(s, "/machine/soc/gpio", "gpioV7"));
> +    qtest_qom_set_bool(s, "/machine/soc/gpio", "gpioV4", true);
> +    qtest_qom_set_bool(s, "/machine/soc/gpio", "gpioV5", false);
> +    qtest_qom_set_bool(s, "/machine/soc/gpio", "gpioV6", true);
> +    qtest_qom_set_bool(s, "/machine/soc/gpio", "gpioV7", false);
> +    g_assert(qtest_qom_get_bool(s, "/machine/soc/gpio", "gpioV4"));
> +    g_assert(!qtest_qom_get_bool(s, "/machine/soc/gpio", "gpioV5"));
> +    g_assert(qtest_qom_get_bool(s, "/machine/soc/gpio", "gpioV6"));
> +    g_assert(!qtest_qom_get_bool(s, "/machine/soc/gpio", "gpioV7"));
>  }
>  
>  int main(int argc, char **argv)
> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
> index 87b40a0ef1..ec233315e6 100644
> --- a/tests/qtest/aspeed_smc-test.c
> +++ b/tests/qtest/aspeed_smc-test.c
> @@ -26,6 +26,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/bswap.h"
>  #include "libqtest-single.h"
> +#include "qemu/bitops.h"
>  
>  /*
>   * ASPEED SPI Controller registers
> @@ -40,6 +41,7 @@
>  #define   CTRL_FREADMODE       0x1
>  #define   CTRL_WRITEMODE       0x2
>  #define   CTRL_USERMODE        0x3
> +#define SR_WEL BIT(1)
>  
>  #define ASPEED_FMC_BASE    0x1E620000
>  #define ASPEED_FLASH_BASE  0x20000000
> @@ -49,6 +51,8 @@
>   */
>  enum {
>      JEDEC_READ = 0x9f,
> +    RDSR = 0x5,
> +    WRDI = 0x4,
>      BULK_ERASE = 0xc7,
>      READ = 0x03,
>      PP = 0x02,
> @@ -348,6 +352,44 @@ static void test_write_page_mem(void)
>      flash_reset();
>  }
>  
> +static void test_read_status_reg(void)
> +{
> +    uint8_t r;
> +
> +    spi_conf(CONF_ENABLE_W0);
> +
> +    spi_ctrl_start_user();
> +    writeb(ASPEED_FLASH_BASE, RDSR);
> +    r = readb(ASPEED_FLASH_BASE);
> +    spi_ctrl_stop_user();
> +
> +    g_assert_cmphex(r & SR_WEL, ==, 0);
> +    g_assert(!qtest_qom_get_bool
> +            (global_qtest, "/machine/soc/fmc/ssi.0/child[0]", "write-enable"));
> +
> +    spi_ctrl_start_user();
> +    writeb(ASPEED_FLASH_BASE, WREN);
> +    writeb(ASPEED_FLASH_BASE, RDSR);
> +    r = readb(ASPEED_FLASH_BASE);
> +    spi_ctrl_stop_user();
> +
> +    g_assert_cmphex(r & SR_WEL, ==, SR_WEL);
> +    g_assert(qtest_qom_get_bool
> +            (global_qtest, "/machine/soc/fmc/ssi.0/child[0]", "write-enable"));
> +
> +    spi_ctrl_start_user();
> +    writeb(ASPEED_FLASH_BASE, WRDI);
> +    writeb(ASPEED_FLASH_BASE, RDSR);
> +    r = readb(ASPEED_FLASH_BASE);
> +    spi_ctrl_stop_user();
> +
> +    g_assert_cmphex(r & SR_WEL, ==, 0);
> +    g_assert(!qtest_qom_get_bool
> +            (global_qtest, "/machine/soc/fmc/ssi.0/child[0]", "write-enable"));
> +
> +    flash_reset();
> +}
> +
>  static char tmp_path[] = "/tmp/qtest.m25p80.XXXXXX";
>  
>  int main(int argc, char **argv)
> @@ -373,6 +415,7 @@ int main(int argc, char **argv)
>      qtest_add_func("/ast2400/smc/write_page", test_write_page);
>      qtest_add_func("/ast2400/smc/read_page_mem", test_read_page_mem);
>      qtest_add_func("/ast2400/smc/write_page_mem", test_write_page_mem);
> +    qtest_add_func("/ast2400/smc/read_status_reg", test_read_status_reg);
>  
>      ret = g_test_run();
>  
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 228357f1ea..a9904eba82 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -1423,3 +1423,27 @@ void qtest_client_inproc_recv(void *opaque, const char *str)
>      g_string_append(qts->rx, str);
>      return;
>  }
> +
> +void qtest_qom_set_bool(QTestState *s, const char *path, const char *property,
> +                         bool value)
> +{
> +    QDict *r;
> +
> +    r = qtest_qmp(s, "{ 'execute': 'qom-set', 'arguments': "
> +                     "{ 'path': %s, 'property': %s, 'value': %i } }",
> +                     path, property, value);
> +    qobject_unref(r);
> +}
> +
> +bool qtest_qom_get_bool(QTestState *s, const char *path, const char *property)
> +{
> +    QDict *r;
> +    bool b;
> +
> +    r = qtest_qmp(s, "{ 'execute': 'qom-get', 'arguments': "
> +                     "{ 'path': %s, 'property': %s } }", path, property);
> +    b = qdict_get_bool(r, "return");
> +    qobject_unref(r);
> +
> +    return b;
> +}
> diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
> index 4ab0cad326..94b187837d 100644
> --- a/tests/qtest/libqtest.h
> +++ b/tests/qtest/libqtest.h
> @@ -783,4 +783,26 @@ QTestState *qtest_inproc_init(QTestState **s, bool log, const char* arch,
>                      void (*send)(void*, const char*));
>  
>  void qtest_client_inproc_recv(void *opaque, const char *str);
> +
> +/**
> + * qtest_qom_set_bool:
> + * @s: QTestState instance to operate on.
> + * @path: Path to the property being set.
> + * @property: Property being set.
> + * @value: Value to set the property.
> + *
> + * Set the property with passed in value.
> + */
> +void qtest_qom_set_bool(QTestState *s, const char *path, const char *property,
> +                         bool value);
> +
> +/**
> + * qtest_qom_get_bool:
> + * @s: QTestState instance to operate on.
> + * @path: Path to the property being retrieved.
> + * @property: Property from where the value is being retrieved.
> + *
> + * Returns: Value retrieved from property.
> + */
> +bool qtest_qom_get_bool(QTestState *s, const char *path, const char *property);
>  #endif
> -- 
> 2.30.2
> 
> 

