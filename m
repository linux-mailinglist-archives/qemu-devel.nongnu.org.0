Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C31413B4DDC
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 11:49:33 +0200 (CEST)
Received: from localhost ([::1]:52718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx4wO-0007lp-QK
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 05:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lx4vU-00075v-Gl; Sat, 26 Jun 2021 05:48:36 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:39762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lx4vR-0000DB-KF; Sat, 26 Jun 2021 05:48:35 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso9988661wmh.4; 
 Sat, 26 Jun 2021 02:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/XcW52t8m5DqFBbNEPyirxALe/NQE53Uk/YEuaX6AUU=;
 b=Q/IzQc6WDOTNcXe6Ltn/ZPK+E73WR/ioqS+i8SGguGHyabljXCpI2iZ2NVnSOP+0Zv
 akk1EYQy0og6cOLjg6sxeOzvlCP1+BDw7svtIgmpoHZYyVAPTXniRclyxroFnOfQtLt4
 e07Rd5Lv06VjRT4GQEOy7v4pynWLddLHCQ1PKb6KqXt/+nu5AFClQs3Fk2JTrayXCVZs
 9f7M6KieXvzDr58g6G+LM+xme1rvb/XrTDonFhTiAV6O2LBXeMm6zcLIBwCag+8S/A7H
 1nWIQlPrjkOUrscRUW/ea+NNsqaXsFIHpy75047adUGP216Bh2xFgO9aO/w7yI4T8LWB
 LQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/XcW52t8m5DqFBbNEPyirxALe/NQE53Uk/YEuaX6AUU=;
 b=KRuRCHltWobMWMyegRk7KdyQNKHDwdTzuNDBwl0xdF7u8I38W+E3d3NjDxmbjsGkaC
 6vtVXLsYPeRUKJ6n7hujswDQE6aukCVB7Q83FtqHb0fAfQ/nlCebwFE6+d0PMOj9kL+N
 ixexGgRP6/0NmkjoNw04qmrSHtzK88dVmU87oCDaCsvrPtNA1A76fVrG//NwfXS2bzI1
 w4tfDgj3HtgzyBr4GXfQAOf04X74LfykIKwJDZ7sTTNFjKYbZyoS2IpumHG98pQWPqhq
 zRi0Ha+YNjApkzt4BmTK81eXZP/6airPKY8/LxpJen8rPFETqWbZGrj578zO7t1uOqOa
 F+xA==
X-Gm-Message-State: AOAM531t20YWpe4nc9OlvXBnrHRBumCyEeWBJWZWGx5A9gX6smSKDzsi
 R6+nM9N/dizhMmOEgfojK10=
X-Google-Smtp-Source: ABdhPJwOVvuhO4DAQ1VEe6Pq/r9OK3m4crncSErylVRA8prmkmv9oBbp/szOyz3/gqF4pOOrmkUIWg==
X-Received: by 2002:a05:600c:4a19:: with SMTP id
 c25mr15701888wmp.125.1624700911039; 
 Sat, 26 Jun 2021 02:48:31 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id k13sm8050262wrp.73.2021.06.26.02.48.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Jun 2021 02:48:30 -0700 (PDT)
Subject: Re: [RFC PATCH 05/10] hw/sd: Add sd_cmd_illegal() handler
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210624142209.1193073-1-f4bug@amsat.org>
 <20210624142209.1193073-6-f4bug@amsat.org>
 <CAEUhbmUMeuirsW+kFrevJweBn4+d+7B+bXTk=i2Z+cG7fZeb6A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a6640d6a-2e03-db90-959c-4484ffb6516e@amsat.org>
Date: Sat, 26 Jun 2021 11:48:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmUMeuirsW+kFrevJweBn4+d+7B+bXTk=i2Z+cG7fZeb6A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Qemu-block <qemu-block@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/21 3:47 PM, Bin Meng wrote:
> On Thu, Jun 24, 2021 at 10:23 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Log illegal commands as GUEST_ERROR.
>>
>> Note: we are logging back the SDIO commands (CMD5, CMD52-54).
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/sd/sd.c | 57 ++++++++++++++++++++++--------------------------------
>>  1 file changed, 23 insertions(+), 34 deletions(-)
>>
>> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
>> index ce1eec0374f..0215bdb3689 100644
>> --- a/hw/sd/sd.c
>> +++ b/hw/sd/sd.c
>> @@ -965,6 +965,14 @@ static sd_rsp_type_t sd_invalid_state_for_cmd(SDState *sd, SDRequest req)
>>      return sd_illegal;
>>  }
>>
>> +static sd_rsp_type_t sd_cmd_illegal(SDState *sd, SDRequest req)
>> +{
>> +    qemu_log_mask(LOG_GUEST_ERROR, "%s: Unknown CMD%i\n",
>> +                  sd->proto->name, req.cmd);
>> +
>> +    return sd_illegal;
>> +}
>> +
>>  static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>>  {
>>      uint32_t rca = 0x0000;
>> @@ -1017,15 +1025,10 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>>          break;
>>
>>      case 1:    /* CMD1:   SEND_OP_CMD */
>> -        if (!sd->spi)
>> -            goto bad_cmd;
>> -
>>          sd->state = sd_transfer_state;
>>          return sd_r1;
>>
>>      case 2:    /* CMD2:   ALL_SEND_CID */
>> -        if (sd->spi)
>> -            goto bad_cmd;
>>          switch (sd->state) {
>>          case sd_ready_state:
>>              sd->state = sd_identification_state;
>> @@ -1037,8 +1040,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>>          break;
>>
>>      case 3:    /* CMD3:   SEND_RELATIVE_ADDR */
>> -        if (sd->spi)
>> -            goto bad_cmd;
>>          switch (sd->state) {
>>          case sd_identification_state:
>>          case sd_standby_state:
>> @@ -1052,8 +1053,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>>          break;
>>
>>      case 4:    /* CMD4:   SEND_DSR */
>> -        if (sd->spi)
>> -            goto bad_cmd;
>>          switch (sd->state) {
>>          case sd_standby_state:
>>              break;
>> @@ -1063,9 +1062,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>>          }
>>          break;
>>
>> -    case 5: /* CMD5: reserved for SDIO cards */
>> -        return sd_illegal;
>> -
>>      case 6:    /* CMD6:   SWITCH_FUNCTION */
>>          switch (sd->mode) {
>>          case sd_data_transfer_mode:
>> @@ -1081,8 +1077,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>>          break;
>>
>>      case 7:    /* CMD7:   SELECT/DESELECT_CARD */
>> -        if (sd->spi)
>> -            goto bad_cmd;
>>          switch (sd->state) {
>>          case sd_standby_state:
>>              if (sd->rca != rca)
>> @@ -1212,8 +1206,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>>          break;
>>
>>      case 15:   /* CMD15:  GO_INACTIVE_STATE */
>> -        if (sd->spi)
>> -            goto bad_cmd;
>>          switch (sd->mode) {
>>          case sd_data_transfer_mode:
>>              if (sd->rca != rca)
>> @@ -1320,8 +1312,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>>          break;
>>
>>      case 26:   /* CMD26:  PROGRAM_CID */
>> -        if (sd->spi)
>> -            goto bad_cmd;
>>          switch (sd->state) {
>>          case sd_transfer_state:
>>              sd->state = sd_receivingdata_state;
>> @@ -1466,15 +1456,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>>          }
>>          break;
>>
>> -    case 52 ... 54:
>> -        /* CMD52, CMD53, CMD54: reserved for SDIO cards
>> -         * (see the SDIO Simplified Specification V2.0)
>> -         * Handle as illegal command but do not complain
>> -         * on stderr, as some OSes may use these in their
>> -         * probing for presence of an SDIO card.
>> -         */
>> -        return sd_illegal;
>> -
>>      /* Application specific commands (Class 8) */
>>      case 55:   /* CMD55:  APP_CMD */
>>          switch (sd->state) {
>> @@ -1515,19 +1496,12 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>>          break;
>>
>>      case 58:    /* CMD58:   READ_OCR (SPI) */
>> -        if (!sd->spi) {
>> -            goto bad_cmd;
>> -        }
>>          return sd_r3;
>>
>>      case 59:    /* CMD59:   CRC_ON_OFF (SPI) */
>> -        if (!sd->spi) {
>> -            goto bad_cmd;
>> -        }
>>          return sd_r1;
>>
>>      default:
>> -    bad_cmd:
>>          qemu_log_mask(LOG_GUEST_ERROR, "SD: Unknown CMD%i\n", req.cmd);
>>          return sd_illegal;
>>      }
>> @@ -2114,10 +2088,25 @@ void sd_enable(SDState *sd, bool enable)
>>
>>  static const SDProto sd_proto_spi = {
>>      .name = "SPI",
>> +    .cmd = {
>> +        [2 ... 4]   = sd_cmd_illegal,
>> +        [5]         = sd_cmd_illegal,
> 
> Above 2 can be merged into [2 ... 5]

I let it apart because currently we are ignoring SDIO commands
(CMD5, CMD52-54), so maybe it is desirable to keep doing so,
adding a handler such sd_cmd_illegal_but_ignored? Not sure
yet, I need to do more testing.

> 
>> +        [7]         = sd_cmd_illegal,
>> +        [15]        = sd_cmd_illegal,
>> +        [26]        = sd_cmd_illegal,
>> +        [52 ... 54] = sd_cmd_illegal,
>> +    },
>>  };
>>
>>  static const SDProto sd_proto_sd = {
>>      .name = "SD",
>> +    .cmd = {
>> +        [1]         = sd_cmd_illegal,
>> +        [5]         = sd_cmd_illegal,
>> +        [52 ... 54] = sd_cmd_illegal,
>> +        [58]        = sd_cmd_illegal,
>> +        [59]        = sd_cmd_illegal,
>> +    },
>>  };
>>
>>  static void sd_instance_init(Object *obj)
> 
> Otherwise LGTM:
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> 

