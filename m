Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671093B5D1E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 13:27:57 +0200 (CEST)
Received: from localhost ([::1]:44664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxpQi-0006Qv-5S
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 07:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lxpOc-0004Qm-49; Mon, 28 Jun 2021 07:25:46 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:40641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lxpOa-0006Ye-Fg; Mon, 28 Jun 2021 07:25:45 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 o33-20020a05600c5121b02901e360c98c08so11742732wms.5; 
 Mon, 28 Jun 2021 04:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M3vtFcDfZWj+hSQVJjEpOBeY9Ly7QOeRkSZuC8co9tk=;
 b=CTI93bNq/DMYJdyOyRLvJF7QvIFjBJFE2VSACPVKF1DNOu/0mYEaym5RWd7Ga+DKDO
 X71alD6hkSdKMVNYyoE+PRU/us/ZjTNKQWxXW+xrqJO7FAjff9rqCb9/WI7xroG8t+4z
 uZSRLIiethSj0kNLGwQVXwQ1ybRGFK248FT5jqo7SbIBOpn2+sEN1MWinbDKLkWGXPrK
 fV9d3NT5f4+zMhpR1k+o8DibRA90OFQaqiQHisi7WjEP3KdEXZSWrSZdPZOvy9N2SwZ8
 aqorGgCO/kbQMNGp8L/mHe8Cx2TZTw+l3/7a9IBgzk8COnS63pRU6F3fjkTYcM5/t4+G
 nB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M3vtFcDfZWj+hSQVJjEpOBeY9Ly7QOeRkSZuC8co9tk=;
 b=HP7tUZ8mn3KVOrghczd6eP7pQEfrZxqmCIOsxsjfGdqLEpRODavbZ8oxpPluETkysR
 VIEUlePe/mVppVwk7AGRWem43bdzvg/tmG1KD2FsTojIzczxN1xmawyHoNAYTcvbYS9+
 tfWRwmcxpibE0k9R8jnwoFJfxb9AGA79TisyNvfya+d2YHZNy35B11fc4s2vf7HY1cOf
 ZP9+Xgiap0J0wa6zC6UWDp4Ce2jJ4BNCoI1LyvK+z9M7oFJl/8ziogKdcu+2gPf3rXNM
 gcfJMhs79VpQeFa8ngHHHV9Na7C6HS78cYWMVoMIOwUqHD+CMhd9tjr5/zdYzrqMUXEP
 fMhw==
X-Gm-Message-State: AOAM531iUr4uZdQbLejP2x+Bro2guN5Z0JvNfq5d29cA17UIQeZDUfrs
 0sWlZbrrX5zNWQ0pqlZ6vZAoC9FQjl20hw==
X-Google-Smtp-Source: ABdhPJwax43OhambsJiX8YCXLq7Jvesyvb7mbWxhAP9MZxL38Wjq2V53zraqdURK5LjQZOsfVj1A5A==
X-Received: by 2002:a05:600c:4b88:: with SMTP id
 e8mr25777151wmp.46.1624879542366; 
 Mon, 28 Jun 2021 04:25:42 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id q19sm18859106wmc.44.2021.06.28.04.25.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 04:25:40 -0700 (PDT)
Subject: Re: [RFC PATCH 04/10] hw/sd: Introduce sd_cmd_handler type
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20210624142209.1193073-1-f4bug@amsat.org>
 <20210624142209.1193073-5-f4bug@amsat.org>
 <76d91bb6-c8ac-6d33-a5f1-9f196ea54756@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <42a083b6-a681-2380-6fe5-9bdc0e6fa491@amsat.org>
Date: Mon, 28 Jun 2021 13:25:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <76d91bb6-c8ac-6d33-a5f1-9f196ea54756@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Bin Meng <bin.meng@windriver.com>,
 Joel Stanley <joel@jms.id.au>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/21 9:29 AM, Cédric Le Goater wrote:
> On 6/24/21 4:22 PM, Philippe Mathieu-Daudé wrote:
>> Add 2 command handler arrays in SDProto, for CMD and ACMD.
>> Have sd_normal_command() / sd_app_command() use these arrays:
>> if an command handler is registered, call it, otherwise fall
>> back to current code base.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/sd/sd.c | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
>> index a1cc8ab0be8..ce1eec0374f 100644
>> --- a/hw/sd/sd.c
>> +++ b/hw/sd/sd.c
>> @@ -88,8 +88,12 @@ enum SDCardStates {
>>      sd_disconnect_state,
>>  };
>>  
>> +typedef sd_rsp_type_t (*sd_cmd_handler)(SDState *sd, SDRequest req);
>> +
>>  typedef struct SDProto {
>>      const char *name;
>> +    sd_cmd_handler cmd[SDMMC_CMD_MAX];
>> +    sd_cmd_handler acmd[SDMMC_CMD_MAX];
>>  } SDProto;
> 
> 
> A class would be better but it's no big deal for the moment.

Could be. Easily modifiable later. For now I'd rather focus on
finding the easiest code path keeping maintenance simple enough,
and worry about implementation details later.

> 
>>  
>>  struct SDState {
>> @@ -994,6 +998,10 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>>          return sd_illegal;
>>      }
>>  
>> +    if (sd->proto->cmd[req.cmd]) {
>> +        return sd->proto->cmd[req.cmd](sd, req);
>> +    }
>> +
> 
> I expect that some default array will be used to initialize ->cmd ?

Maybe at the end of the conversion. For now it is NULL-initialized.
See patch 3:

+static const SDProto sd_proto_sd = {
+    .name = "SD",
+};

> 
> Thanks,
> 
> C.
> 
> 
>>      switch (req.cmd) {
>>      /* Basic commands (Class 0 and Class 1) */
>>      case 0:	/* CMD0:   GO_IDLE_STATE */
>> @@ -1533,6 +1541,11 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
>>      trace_sdcard_app_command(sd->proto->name, sd_acmd_name(req.cmd),
>>                               req.cmd, req.arg, sd_state_name(sd->state));
>>      sd->card_status |= APP_CMD;
>> +
>> +    if (sd->proto->acmd[req.cmd]) {
>> +        return sd->proto->acmd[req.cmd](sd, req);
>> +    }
>> +
>>      switch (req.cmd) {
>>      case 6:	/* ACMD6:  SET_BUS_WIDTH */
>>          if (sd->spi) {
>>
> 
> 

