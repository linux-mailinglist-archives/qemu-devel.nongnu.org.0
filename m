Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55736656D7D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Dec 2022 18:40:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pADw1-0003b5-Qu; Tue, 27 Dec 2022 12:40:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pADvz-0003as-2r
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 12:40:15 -0500
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pADvw-0001Lx-UH
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 12:40:14 -0500
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1441d7d40c6so16152862fac.8
 for <qemu-devel@nongnu.org>; Tue, 27 Dec 2022 09:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C1qQeuDOWn0AI6kwzxx9rT+UZPoDK0enSmsJ93WfuJc=;
 b=SJNi2o7fLNS9iDd4jez3/WmRYd7Y9DtjMOlEw/rrYPxRnb51Y9jLwg5RwOIlvxEQQW
 VZydILgOx0LbQKlvAFkDBD6LKdvd51+/PKmR/XHgXfsMJajGI5qg3BG2j6JdbRmub13k
 os8XJ1Dd0Yn4mAIES0m4DyRRbljucxoovhASXRmWsy/ODreIhulvYcm0lDpyajiM67ee
 wEt09QWp1vtdjKvIPnr1YzFomcdKW0iIDgEbSu2WyPbpHndZc5GrkIF5cB+LvgBFoeal
 44pkM0jHHDHRuY5tkILlM9/RcM9jrTivfDVnYJbWn+iysTF00/SRFqkUfjudTARF8lnD
 Obcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C1qQeuDOWn0AI6kwzxx9rT+UZPoDK0enSmsJ93WfuJc=;
 b=hPCDiVAez6x80KGhEyhcf+xG5ka+pBiTwzZ2+WM4YqmvjLAWT3qnm/bGWspHwU733f
 INfWMnWKQqFTSDbYEBaWX6gX/Yx4gHUTT1ZADyVGraGhEGo8xuArqABBbZPhD1g0BYi8
 lDvI3y75bsGrwycu9Z2JmthuD5n1Oxt8w6MWiV9yBohU8U9eq63UpOHtWgwNhrkv+JY6
 vo+ZIfYhEXYCfnsH77jfhljd0GRymLPiK6S1Ol0fSOY8/rBBnaK5UJ5dYFtIWMU4U1Oe
 2BlXk5x9PYiR7zhi0F/NDHpENwQ04d51ZOzTf2vL4+2YOUgtTk9Xa5tYtx6JlA6UYBP8
 DM5g==
X-Gm-Message-State: AFqh2koUztnLZeVpabZl7uOk6RSIHcknRJf3Vk44op7O+qbA1IMEqRxu
 x1NePd8j/L3KghUazjfdLHAhBQ==
X-Google-Smtp-Source: AMrXdXv8NEUpFfrOEtJKuzseW02cVJe3nBM6WXyvtMi8HKSfhQbh6kWUQPa3/nScj2xX1IGL03bQow==
X-Received: by 2002:a05:6870:468b:b0:148:6257:ca1b with SMTP id
 a11-20020a056870468b00b001486257ca1bmr13708110oap.14.1672162810872; 
 Tue, 27 Dec 2022 09:40:10 -0800 (PST)
Received: from [192.168.68.107] ([177.102.70.162])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a056870428c00b0012d939eb0bfsm6369277oah.34.2022.12.27.09.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Dec 2022 09:40:10 -0800 (PST)
Message-ID: <eb20a4c6-4b58-d5ed-3c1e-fa75b1ceadda@ventanamicro.com>
Date: Tue, 27 Dec 2022 14:40:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 11/12] hw/riscv/boot.c: Introduce riscv_find_firmware()
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
References: <20221227064812.1903326-1-bmeng@tinylab.org>
 <20221227064812.1903326-12-bmeng@tinylab.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20221227064812.1903326-12-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 12/27/22 03:48, Bin Meng wrote:
> Rename previous riscv_find_firmware() to riscv_find_bios(), and
> introduce a new riscv_find_firmware() to implement the first half
> part of the work done in riscv_find_and_load_firmware().
>
> This new API is helpful for machine that wants to know the final
> chosen firmware file name but does not want to load it.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>
>   include/hw/riscv/boot.h |  2 ++
>   hw/riscv/boot.c         | 39 +++++++++++++++++++++++++--------------
>   2 files changed, 27 insertions(+), 14 deletions(-)
>
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index 60cf320c88..b273ab22f7 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -38,6 +38,8 @@ target_ulong riscv_find_and_load_firmware(MachineState *machine,
>                                             hwaddr firmware_load_addr,
>                                             symbol_fn_t sym_cb);
>   const char *riscv_default_firmware_name(RISCVHartArrayState *harts);
> +char *riscv_find_firmware(const char *firmware_filename,
> +                          const char *default_machine_firmware);
>   target_ulong riscv_load_firmware(const char *firmware_filename,
>                                    hwaddr firmware_load_addr,
>                                    symbol_fn_t sym_cb);
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index e1a544b1d9..98b80af51b 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -84,11 +84,11 @@ const char *riscv_default_firmware_name(RISCVHartArrayState *harts)
>       return RISCV64_BIOS_BIN;
>   }
>   
> -static char *riscv_find_firmware(const char *firmware_filename)
> +static char *riscv_find_bios(const char *bios_filename)
>   {
>       char *filename;
>   
> -    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, firmware_filename);
> +    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_filename);
>       if (filename == NULL) {
>           if (!qtest_enabled()) {
>               /*
> @@ -97,8 +97,8 @@ static char *riscv_find_firmware(const char *firmware_filename)
>                * running QEMU test will complain hence let's suppress the error
>                * report for QEMU testing.
>                */
> -            error_report("Unable to load the RISC-V firmware \"%s\"",
> -                         firmware_filename);
> +            error_report("Unable to find the RISC-V BIOS \"%s\"",
> +                         bios_filename);
>               exit(1);
>           }
>       }
> @@ -106,25 +106,36 @@ static char *riscv_find_firmware(const char *firmware_filename)
>       return filename;
>   }
>   
> -target_ulong riscv_find_and_load_firmware(MachineState *machine,
> -                                          const char *default_machine_firmware,
> -                                          hwaddr firmware_load_addr,
> -                                          symbol_fn_t sym_cb)
> +char *riscv_find_firmware(const char *firmware_filename,
> +                          const char *default_machine_firmware)
>   {
> -    char *firmware_filename = NULL;
> -    target_ulong firmware_end_addr = firmware_load_addr;
> +    char *filename = NULL;
>   
> -    if ((!machine->firmware) || (!strcmp(machine->firmware, "default"))) {
> +    if ((!firmware_filename) || (!strcmp(firmware_filename, "default"))) {
>           /*
>            * The user didn't specify -bios, or has specified "-bios default".
>            * That means we are going to load the OpenSBI binary included in
>            * the QEMU source.
>            */
> -        firmware_filename = riscv_find_firmware(default_machine_firmware);
> -    } else if (strcmp(machine->firmware, "none")) {
> -        firmware_filename = riscv_find_firmware(machine->firmware);
> +        filename = riscv_find_bios(default_machine_firmware);
> +    } else if (strcmp(firmware_filename, "none")) {
> +        filename = riscv_find_bios(firmware_filename);
>       }
>   
> +    return filename;
> +}
> +
> +target_ulong riscv_find_and_load_firmware(MachineState *machine,
> +                                          const char *default_machine_firmware,
> +                                          hwaddr firmware_load_addr,
> +                                          symbol_fn_t sym_cb)
> +{
> +    char *firmware_filename;
> +    target_ulong firmware_end_addr = firmware_load_addr;
> +
> +    firmware_filename = riscv_find_firmware(machine->firmware,
> +                                            default_machine_firmware);
> +
>       if (firmware_filename) {
>           /* If not "none" load the firmware */
>           firmware_end_addr = riscv_load_firmware(firmware_filename,


