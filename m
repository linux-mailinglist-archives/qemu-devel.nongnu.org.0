Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB2348D994
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 15:17:29 +0100 (CET)
Received: from localhost ([::1]:45782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n80uu-00087x-Fy
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 09:17:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n80t9-0006g3-OM
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 09:15:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n80t6-00047v-Mc
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 09:15:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642083335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0q3v5yvHXfGWB63nILcBmaD8EHCBcMz6ke/GIDSFtws=;
 b=bn4cwZZqo6Hnn4FNmBay5ahbcY/jNBPqAKrWI77nVMHUMwF22Lvn+IzP4R6pQ+vtdhCSW0
 3rBi9grSejfYKRgVdDIDk7cFzuluL0mtxAi7Q8ZUqWE8EXyZ4sa0bOGrACm3K2UbqL7LO2
 Hr3WiEpn5QOvjC2UlVasogE+oPtnloQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-ufXi1IMVPVeo5f5yWGD3rQ-1; Thu, 13 Jan 2022 09:15:34 -0500
X-MC-Unique: ufXi1IMVPVeo5f5yWGD3rQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 j18-20020a05600c1c1200b0034aeea95dacso575425wms.8
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 06:15:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=0q3v5yvHXfGWB63nILcBmaD8EHCBcMz6ke/GIDSFtws=;
 b=D/k2oPOFUFGeoNiSuYg1Rt6R2rui0TCfrwhWbva42i03mWLGOWrbDG8ORM0Tr/15B5
 FBndYtLPfsy0fxeDgKGloruNf2q9m/Lv0U8HvjVPloXOM+suaKqAwDv3Hgu0uGcDlbdd
 Qq99r47b02Sk4WcvfcZCwjEmvQZ0Pnwzsq4YmL8vd8II9WueTA7IsBGevfJAJ18/Y1Hf
 OUXFm0Z0WomrY824++5stXtopbr3Q5ePNpEQaET4zq8PnjbBOKQDFBeQiC2450kaaVY9
 GUFgIYLu94cjWQfF1nj1vakplUuQB8oXTiqNokUTmBt1du9Bn39pN6P1TEcinGIgjrG6
 +qKw==
X-Gm-Message-State: AOAM530P5DQCm+uuOnEQOTrgZG9vw4qxXsyeZrO/AoNcT/gzVztHC/xS
 ABkjcoL7zq6DMU7b63vKUzPFUgk7iwWbAqKC7Odaey1YWN0QyvKrEOqezuWJrBZoxaYT773j/c9
 b2bZx+VgFBR69ZEs=
X-Received: by 2002:a5d:6dad:: with SMTP id u13mr4369938wrs.604.1642083333216; 
 Thu, 13 Jan 2022 06:15:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzoaecIeuufO8D9HZ4QMZLkSGSeuxGNl2Y0M9xHvr4w/SOto9j0LbKavhtiTCGJNqhCB1ly7Q==
X-Received: by 2002:a5d:6dad:: with SMTP id u13mr4369907wrs.604.1642083332880; 
 Thu, 13 Jan 2022 06:15:32 -0800 (PST)
Received: from [192.168.2.110] (p54886a44.dip0.t-ipconnect.de. [84.136.106.68])
 by smtp.gmail.com with ESMTPSA id c7sm3611720wri.21.2022.01.13.06.15.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 06:15:32 -0800 (PST)
Message-ID: <9c6d01f1-7fc3-b980-54ee-4645b19d7b6e@redhat.com>
Date: Thu, 13 Jan 2022 15:15:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: Patrick Venture <venture@google.com>, lvivier@redhat.com,
 pbonzini@redhat.com
References: <20220107222557.3812222-1-venture@google.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/qtest: add qtests for npcm7xx sdhci
In-Reply-To: <20220107222557.3812222-1-venture@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Shengtan Mao <stmao@google.com>, hskinnemoen@google.com,
 qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Chris Rauer <crauer@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi!

On 07/01/2022 23.25, Patrick Venture wrote:
[...]
> diff --git a/tests/qtest/npcm7xx_sdhci-test.c b/tests/qtest/npcm7xx_sdhci-test.c
> new file mode 100644
> index 0000000000..feb09b921a
> --- /dev/null
> +++ b/tests/qtest/npcm7xx_sdhci-test.c
> @@ -0,0 +1,201 @@
> +/*
> + * QTests for NPCM7xx SD-3.0 / MMC-4.51 Host Controller
> + *
> + * Copyright (c) 2021 Google LLC

You might want to update to 2022 now.

> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/sd/npcm7xx_sdhci.h"
> +
> +#include "libqos/libqtest.h"
> +#include "libqtest-single.h"
> +#include "libqos/sdhci-cmd.h"
> +
> +#define NPCM7XX_MMC_BA 0xF0842000
> +#define NPCM7XX_BLK_SIZE 512
> +#define NPCM7XX_TEST_IMAGE_SIZE (1 << 30)
> +
> +char *sd_path;
> +
> +static QTestState *setup_sd_card(void)
> +{
> +    QTestState *qts = qtest_initf(
> +        "-machine kudo-bmc "
> +        "-device sd-card,drive=drive0 "
> +        "-drive id=drive0,if=none,file=%s,format=raw,auto-read-only=off",
> +        sd_path);
> +
> +    qtest_writew(qts, NPCM7XX_MMC_BA + SDHC_SWRST, SDHC_RESET_ALL);
> +    qtest_writew(qts, NPCM7XX_MMC_BA + SDHC_CLKCON,
> +                 SDHC_CLOCK_SDCLK_EN | SDHC_CLOCK_INT_STABLE |
> +                     SDHC_CLOCK_INT_EN);
> +    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_APP_CMD);
> +    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0x41200000, 0, (41 << 8));
> +    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_ALL_SEND_CID);
> +    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_SEND_RELATIVE_ADDR);
> +    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0x45670000, 0,
> +                   SDHC_SELECT_DESELECT_CARD);
> +
> +    return qts;
> +}
> +
> +static void write_sdread(QTestState *qts, const char *msg)
> +{
> +    size_t len = strlen(msg);
> +    char *rmsg = g_malloc(len);
> +
> +    /* write message to sd */
> +    int fd = open(sd_path, O_WRONLY);
> +    int ret = write(fd, msg, len);
> +    close(fd);
> +    g_assert(ret == len);
> +
> +    /* read message using sdhci */
> +    ret = sdhci_read_cmd(qts, NPCM7XX_MMC_BA, rmsg, len);
> +    g_assert(ret == len);
> +    g_assert(!strcmp(rmsg, msg));
> +
> +    free(rmsg);

g_free(), please. Or you could use g_autofree instead.

> +}
> +
> +/* Check MMC can read values from sd */
> +static void test_read_sd(void)
> +{
> +    QTestState *qts = setup_sd_card();
> +
> +    write_sdread(qts, "hello world");
> +    write_sdread(qts, "goodbye");
> +
> +    qtest_quit(qts);
> +}
> +
> +static void sdwrite_read(QTestState *qts, const char *msg)
> +{
> +    size_t len = strlen(msg);
> +    char *rmsg = g_malloc(len);
> +
> +    /* write message using sdhci */
> +    sdhci_write_cmd(qts, NPCM7XX_MMC_BA, msg, len, NPCM7XX_BLK_SIZE);
> +
> +    /* read message from sd */
> +    int fd = open(sd_path, O_RDONLY);
> +    int ret = read(fd, rmsg, len);

according to the QEMU coding style:

"declarations should be at the beginning
of blocks"

So please separate the declarations from the assignment here.

> +    close(fd);
> +    g_assert(ret == len);
> +
> +    g_assert(!strcmp(rmsg, msg));
> +
> +    free(rmsg);

g_free() or g_autofree please.

> +}
> +
> +/* Check MMC can write values to sd */
> +static void test_write_sd(void)
> +{
> +    QTestState *qts = setup_sd_card();
> +
> +    sdwrite_read(qts, "hello world");
> +    sdwrite_read(qts, "goodbye");
> +
> +    qtest_quit(qts);
> +}
> +
> +/* Check SDHCI has correct default values. */
> +static void test_reset(void)
> +{
> +    QTestState *qts = qtest_init("-machine kudo-bmc");
> +
> +    uint64_t addr = NPCM7XX_MMC_BA;
> +    uint64_t end_addr = addr + NPCM7XX_REG_SIZE;
> +    uint16_t prstvals_resets[] = {NPCM7XX_PRSTVALS_0_RESET,
> +                                  NPCM7XX_PRSTVALS_1_RESET,
> +                                  0,
> +                                  NPCM7XX_PRSTVALS_3_RESET,
> +                                  0,
> +                                  0};

I'd prefer a space after the "{" and before the "}" ... I wonder why 
checkpatch doesn't complain here... maybe it's just a matter of taste, indeed.

> +    int i;
> +    uint32_t mask;
> +    while (addr < end_addr) {
> +        switch (addr - NPCM7XX_MMC_BA) {
> +        case SDHC_PRNSTS:
> +            /* ignores bits 20 to 24: they are changed when reading registers */
> +            mask = 0x1f00000;
> +            g_assert_cmphex(qtest_readl(qts, addr) | mask, ==,
> +                            NPCM7XX_PRSNTS_RESET | mask);
> +            addr += 4;
> +            break;
> +        case SDHC_BLKGAP:
> +            g_assert_cmphex(qtest_readb(qts, addr), ==, NPCM7XX_BLKGAP_RESET);
> +            addr += 1;
> +            break;
> +        case SDHC_CAPAB:
> +            g_assert_cmphex(qtest_readq(qts, addr), ==, NPCM7XX_CAPAB_RESET);
> +            addr += 8;
> +            break;
> +        case SDHC_MAXCURR:
> +            g_assert_cmphex(qtest_readq(qts, addr), ==, NPCM7XX_MAXCURR_RESET);
> +            addr += 8;
> +            break;
> +        case SDHC_HCVER:
> +            g_assert_cmphex(qtest_readw(qts, addr), ==, NPCM7XX_HCVER_RESET);
> +            addr += 2;
> +            break;
> +        case NPCM7XX_PRSTVALS:
> +            for (i = 0; i < NPCM7XX_PRSTVALS_SIZE; ++i) {
> +                g_assert_cmphex(qtest_readw(qts, addr + 2 * i), ==,
> +                                prstvals_resets[i]);
> +            }
> +            addr += NPCM7XX_PRSTVALS_SIZE * 2;
> +            break;
> +        default:
> +            g_assert_cmphex(qtest_readb(qts, addr), ==, 0);
> +            addr += 1;
> +        }
> +    }
> +
> +    qtest_quit(qts);
> +}
> +
> +static void drive_destroy(void)
> +{
> +    unlink(sd_path);
> +    g_free(sd_path);
> +}
> +
> +static void drive_create(void)
> +{
> +    int fd, ret;
> +    sd_path = g_strdup("/tmp/qtest.XXXXXX");
> +
> +    /* Create a temporary raw image */
> +    fd = mkstemp(sd_path);

Maybe use g_file_open_tmp() instead, so you don't have to hard-code the /tmp 
directory (in case we ever want to run the qtests on non-POSIX systems).

> +    g_assert_cmpint(fd, >=, 0);
> +    ret = ftruncate(fd, NPCM7XX_TEST_IMAGE_SIZE);
> +    g_assert_cmpint(ret, ==, 0);
> +    g_message("%s", sd_path);
> +    close(fd);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    drive_create();
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    qtest_add_func("npcm7xx_sdhci/reset", test_reset);
> +    qtest_add_func("npcm7xx_sdhci/write_sd", test_write_sd);
> +    qtest_add_func("npcm7xx_sdhci/read_sd", test_read_sd);
> +
> +    int ret = g_test_run();
> +    drive_destroy();
> +    return ret;
> +}

  Thomas


