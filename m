Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE7669C2E3
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Feb 2023 23:31:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTsCR-0005j1-6X; Sun, 19 Feb 2023 17:30:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pTsCI-0005gp-AJ
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 17:30:18 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pTsCF-00052S-TH
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 17:30:17 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 l2-20020a05600c1d0200b003e1f6dff952so992735wms.1
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 14:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cGk1FMsmkY60SOKAjYWS00E6WzhG03PvJGU99S6DOAs=;
 b=iCOVV1S6SJLYhXN99ESZKXQAPpDnJrGNLM0obC7Pe4q6sl5lgpLSOr+1EYEcJoN3CO
 QkkelPpAgleW7/Wq7koE0esoZ12KmQizeC5SrUAY5QHJB4WxEqJEnCNh4a5/1GInMRgp
 rxdwI7sfRtYJtWmctvKZtYlVeX2lg7i0Id9bLFn7fImgAzj2ciPlwMABFNpo6zKD8nCo
 1sjoF1OH9VIHUz2V8SM72xVLFwJvWkYHM3BZCuf8UkXQwmtwlHTNV7G9qpzu0QmIryM+
 OnXNqWAE3zBewQVeosv/F3JHAuySVzUgsYzZHssZ6NaaoQwSJut4ByN1YB5KCyOZ/z8s
 ly0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cGk1FMsmkY60SOKAjYWS00E6WzhG03PvJGU99S6DOAs=;
 b=cu5ezobDmZrTdPDLBx6W2oNwgbPAPHfEDJCPgIwxPY+eUo7VRf4S4aEnOXcC23yN5a
 H0UQnnxf3/g5mh6XreK6ix0jHjm+/rZw9XjVB/ASrApsVVLqBcQDg9c6168Xh7PfQdGg
 TJf6I8G8NrF5CCyS18vqEy5t9AnuXbgYKghiGaaBou+Bk4GJwfbEi3WFvmw5D/HXt89g
 dF2VM+fK7SBwjvjh3iPEXnVlqfx8bpwTzz3VuUDnq6OgYt+rM5FvJtudK1LLVmZhp6OA
 DHezoj+s/YLHODzdnQ4zLQ3gCcORGhtLSt2afFwomXSsazwoNeTEFSROTsbfccUXaMIe
 lLFQ==
X-Gm-Message-State: AO0yUKUF/x3vkDshZIbfNAR8ciQsq5gLdYARCt/1o4W75yYP0AEQruNG
 AG0PLVssRy8xAwE6X4maMVF+wg==
X-Google-Smtp-Source: AK7set+MFvdDW1fhz9jn/0TTJM3VS0V/93ySkhUm62EdrPnxVXRyMDfkREMkVCjGjKG5+einp75jrg==
X-Received: by 2002:a05:600c:181b:b0:3e0:10d:f1c with SMTP id
 n27-20020a05600c181b00b003e0010d0f1cmr5223966wmp.37.1676845813051; 
 Sun, 19 Feb 2023 14:30:13 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a05600c1d9100b003e21dcccf9fsm10605981wms.16.2023.02.19.14.30.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Feb 2023 14:30:12 -0800 (PST)
Message-ID: <1e0cbd22-18c1-dfdc-b3a9-8961903bfa6a@linaro.org>
Date: Sun, 19 Feb 2023 23:30:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v1 1/2] hw: allwinner-i2c: Make the trace message more
 readable
Content-Language: en-US
To: qianfanguijin@163.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>
References: <20230217094207.16882-1-qianfanguijin@163.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230217094207.16882-1-qianfanguijin@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi,

On 17/2/23 10:42, qianfanguijin@163.com wrote:
> From: qianfan Zhao <qianfanguijin@163.com>
> 
> Next is an example when allwinner_i2c_rw enabled:
> 
> allwinner_i2c_rw write   CNTR[0x0c]: 50 { M_STP BUS_EN  }
> allwinner_i2c_rw write   CNTR[0x0c]: e4 { A_ACK M_STA BUS_EN INT_EN  }
> allwinner_i2c_rw  read   CNTR[0x0c]: cc { A_ACK INT_FLAG BUS_EN INT_EN }
> allwinner_i2c_rw  read   STAT[0x10]: 08 { STAT_M_STA_TX }
> 
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> ---
>   hw/i2c/allwinner-i2c.c | 90 +++++++++++++++++++++++++++++++++++++++++-
>   hw/i2c/trace-events    |  4 +-
>   2 files changed, 89 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/i2c/allwinner-i2c.c b/hw/i2c/allwinner-i2c.c
> index a435965836..36b387520f 100644
> --- a/hw/i2c/allwinner-i2c.c
> +++ b/hw/i2c/allwinner-i2c.c
> @@ -129,6 +129,39 @@ enum {
>       STAT_IDLE = 0x1f
>   } TWI_STAT_STA;
>   
> +#define TWI_STAT_STA_DESC(sta)  [sta] = #sta
> +static const char *twi_stat_sta_descriptors[] = {
> +    TWI_STAT_STA_DESC(STAT_BUS_ERROR),
> +    TWI_STAT_STA_DESC(STAT_M_STA_TX),
> +    TWI_STAT_STA_DESC(STAT_M_RSTA_TX),
> +    TWI_STAT_STA_DESC(STAT_M_ADDR_WR_ACK),
> +    TWI_STAT_STA_DESC(STAT_M_ADDR_WR_NACK),
> +    TWI_STAT_STA_DESC(STAT_M_DATA_TX_ACK),
> +    TWI_STAT_STA_DESC(STAT_M_DATA_TX_NACK),
> +    TWI_STAT_STA_DESC(STAT_M_ARB_LOST),
> +    TWI_STAT_STA_DESC(STAT_M_ADDR_RD_ACK),
> +    TWI_STAT_STA_DESC(STAT_M_ADDR_RD_NACK),
> +    TWI_STAT_STA_DESC(STAT_M_DATA_RX_ACK),
> +    TWI_STAT_STA_DESC(STAT_M_DATA_RX_NACK),
> +    TWI_STAT_STA_DESC(STAT_S_ADDR_WR_ACK),
> +    TWI_STAT_STA_DESC(STAT_S_ARB_LOST_AW_ACK),
> +    TWI_STAT_STA_DESC(STAT_S_GCA_ACK),
> +    TWI_STAT_STA_DESC(STAT_S_ARB_LOST_GCA_ACK),
> +    TWI_STAT_STA_DESC(STAT_S_DATA_RX_SA_ACK),
> +    TWI_STAT_STA_DESC(STAT_S_DATA_RX_SA_NACK),
> +    TWI_STAT_STA_DESC(STAT_S_DATA_RX_GCA_ACK),
> +    TWI_STAT_STA_DESC(STAT_S_DATA_RX_GCA_NACK),
> +    TWI_STAT_STA_DESC(STAT_S_STP_RSTA),
> +    TWI_STAT_STA_DESC(STAT_S_ADDR_RD_ACK),
> +    TWI_STAT_STA_DESC(STAT_S_ARB_LOST_AR_ACK),
> +    TWI_STAT_STA_DESC(STAT_S_DATA_TX_ACK),
> +    TWI_STAT_STA_DESC(STAT_S_DATA_TX_NACK),
> +    TWI_STAT_STA_DESC(STAT_S_LB_TX_ACK),
> +    TWI_STAT_STA_DESC(STAT_M_2ND_ADDR_WR_ACK),
> +    TWI_STAT_STA_DESC(STAT_M_2ND_ADDR_WR_NACK),
> +    TWI_STAT_STA_DESC(STAT_IDLE),
> +};
> +
>   static const char *allwinner_i2c_get_regname(unsigned offset)
>   {
>       switch (offset) {
> @@ -155,6 +188,59 @@ static const char *allwinner_i2c_get_regname(unsigned offset)
>       }
>   }
>   
> +static const char *twi_cntr_reg_bits[] = {
> +    [2] = "A_ACK",
> +    [3] = "INT_FLAG",
> +    [4] = "M_STP",
> +    [5] = "M_STA",
> +    [6] = "BUS_EN",
> +    [7] = "INT_EN",
> +};
> +
> +static void trace_buffer_append_bit_descriptors(char *s, size_t sz,
> +                                                unsigned int value,
> +                                                unsigned int start,
> +                                                unsigned int end,
> +                                                const char **desc_arrays)
> +{
> +    for (; start <= end; start++) {

You call this once, so no need to pass a desc_arrays[] argument.
Directly iterate over twi_cntr_reg_bits[] and its ARRAY_SIZE().

> +        if (value & (1 << start)) {
> +            strncat(s, desc_arrays[start], sz - 1);

Watch out, desc_arrays[start] could be NULL.

> +            strncat(s, " ", sz - 1);
> +        }
> +    }
> +}
> +
> +static void allwinner_i2c_trace_rw(int is_write, unsigned int offset,

Please use 'bool' for 'is_write' which is a boolean.

> +                                   unsigned int value)
> +{

You can call trace_event_get_state_backends() to check if a
trace event is enabled and return early without further processing.

> +    char s[256] = { 0 };
> +
> +    snprintf(s, sizeof(s), "%s %6s[0x%02x]: %02x ",

Please prefix hexadecimal values with 0x.

> +             is_write ? "write": " read",
> +             allwinner_i2c_get_regname(offset), offset,
> +             value);

We prefer the safer g_autofree ... g_strdup_printf().

> +    switch (offset) {
> +    case TWI_CNTR_REG:
> +        strncat(s, "{ ", sizeof(s) - 1);
> +        trace_buffer_append_bit_descriptors(s, sizeof(s), value,
> +                                            2, 7, twi_cntr_reg_bits);
> +        strncat(s, " }", sizeof(s) - 1);
> +        break;
> +    case TWI_STAT_REG:
> +        if (STAT_TO_STA(value) <= STAT_IDLE) {
> +            strncat(s, "{ ", sizeof(s) - 1);
> +            strncat(s, twi_stat_sta_descriptors[STAT_TO_STA(value)],
> +                    sizeof(s) - 1);
> +            strncat(s, " }", sizeof(s) - 1);
> +        }
> +        break;
> +    }
> +
> +    trace_allwinner_i2c_rw(s);
> +}
> +
>   static inline bool allwinner_i2c_is_reset(AWI2CState *s)
>   {
>       return s->srst & TWI_SRST_MASK;
> @@ -271,7 +357,7 @@ static uint64_t allwinner_i2c_read(void *opaque, hwaddr offset,
>           break;
>       }
>   
> -    trace_allwinner_i2c_read(allwinner_i2c_get_regname(offset), offset, value);
> +    allwinner_i2c_trace_rw(0, (unsigned int)offset, (unsigned int)value);
>   
>       return (uint64_t)value;
>   }
> @@ -283,7 +369,7 @@ static void allwinner_i2c_write(void *opaque, hwaddr offset,
>   
>       value &= 0xff;
>   
> -    trace_allwinner_i2c_write(allwinner_i2c_get_regname(offset), offset, value);
> +    allwinner_i2c_trace_rw(1, (unsigned int)offset, (unsigned int)value);
>   
>       switch (offset) {
>       case TWI_ADDR_REG:
> diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
> index 8e88aa24c1..fa5e8d5021 100644
> --- a/hw/i2c/trace-events
> +++ b/hw/i2c/trace-events
> @@ -16,9 +16,7 @@ i2c_recv(uint8_t address, uint8_t data) "recv(addr:0x%02x) data:0x%02x"
>   i2c_ack(void) ""
>   
>   # allwinner_i2c.c
> -
> -allwinner_i2c_read(const char* reg_name, uint64_t offset, uint64_t value) "read %s [0x%" PRIx64 "]: -> 0x%" PRIx64
> -allwinner_i2c_write(const char* reg_name, uint64_t offset, uint64_t value) "write %s [0x%" PRIx64 "]: <- 0x%" PRIx64
> +allwinner_i2c_rw(const char *s) "%s"

Please do not remove the other events. The tracing framework provides
multiple backends. Some can be processed by scripts, and providing
integer values are simpler to parse than a string.

That said, your event would be more useful for other backends as:

allwinner_i2c_rw(unsigned is_write,
                  const char *regname,
                  uing8_t regaddr,
                  uing8_t value,
                  const char *desc)
                  "wr:%u   %s[0x02x]: 0x%02x { %s }"

Regards,

Phil.

