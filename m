Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E2A340909
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 16:40:32 +0100 (CET)
Received: from localhost ([::1]:49240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMulD-0004s9-Q1
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 11:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMujJ-0003xx-7z
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:38:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMujH-000478-Lo
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616081910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=prZ50HFcvEU/WIUL0wzCBfrqQw7ok75M3qNWi0dyHSs=;
 b=MtA9hpUAnVy+gMA8zyO3mvDId72BLdjQMdXuqe9tmm9VCeCvN25g4/kyuJov22+PTUnDpz
 TgcyNXUjd4ZR5Y/CMfsvBtIlQdD+DVgpIzTZ5rB9vF1oFR1ceMwC1xD6yE/xw0e3h3R700
 Jz45uIB1PJQad0WyxL5Y99nCM5o0ecY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-5uRwE-HuO-q_my5-VzkLnA-1; Thu, 18 Mar 2021 11:38:28 -0400
X-MC-Unique: 5uRwE-HuO-q_my5-VzkLnA-1
Received: by mail-wr1-f70.google.com with SMTP id i5so20295876wrp.8
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 08:38:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=prZ50HFcvEU/WIUL0wzCBfrqQw7ok75M3qNWi0dyHSs=;
 b=I1KrWBv4IwJimtljxyhCr6nP3DalTa5VblWM9DzGA8+Wzh4BP9UiAtUWFI4bSs6skT
 PhhH2CaAxX5hDBEnVVEQxgZl8oJ+rizjmdaHD1sVmuRIQSAx4Tnu0sJzntyHPobqhXAa
 jwTZKp/m+1iTrHOEXDA+EjdtoFIAIkniJ3AfqKPsbDBrBS5HNriJ1xUGIybpVnpxlVC8
 stVlOmKXJA+tvBRYMw9GXqqHyar4qBnFVgOj3QJuVURjILJqX8qkF4tlwBdvfDpuLfdU
 N2xRX9j2GCvqfJ8cDMAQc78uYMqYd1UP9LG0Guzef0yg3fKJSFyIuOiC83z6ZCPHELi8
 OWLw==
X-Gm-Message-State: AOAM530pdKrkkiR1BqN99YZN/c7D+PVnK6dTcsjugHf3G0SvekrThyZO
 R3ReWFY/T2apygB+3VRdZIVS3lOCejbRc/XD7YLfxifZWkF1gTWUkJbGo3dLgoXg/b4tTL+Ue3x
 VIJR9IFYtdsRE9cU=
X-Received: by 2002:a5d:4bcd:: with SMTP id l13mr10543071wrt.56.1616081906460; 
 Thu, 18 Mar 2021 08:38:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymk2C20h0j0rXK1+hzEazShq/VG2gurAqO5OlWXTiu6wA82CT8BsIsdlGCy6NuoKbg91LPAA==
X-Received: by 2002:a5d:4bcd:: with SMTP id l13mr10543052wrt.56.1616081906348; 
 Thu, 18 Mar 2021 08:38:26 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id b17sm3431052wrt.17.2021.03.18.08.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 08:38:25 -0700 (PDT)
Subject: Re: [PATCH] target/i386/sev: Ensure sev_fw_errlist is sync with
 update-linux-headers
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
References: <20210219180131.2061072-1-philmd@redhat.com>
 <bb91385d-ce8d-c949-d261-ec5315888b30@redhat.com>
Message-ID: <590b0e2c-361a-e339-6b39-1793a5be6ea8@redhat.com>
Date: Thu, 18 Mar 2021 16:38:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <bb91385d-ce8d-c949-d261-ec5315888b30@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping^2?

On 3/8/21 11:21 AM, Philippe Mathieu-Daudé wrote:
> ping?
> 
> On 2/19/21 7:01 PM, Philippe Mathieu-Daudé wrote:
>> Ensure sev_fw_errlist[] is updated after running
>> the update-linux-headers.sh script.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> Based-on: <20210218151633.215374-1-ckuehl@redhat.com>
>> ---
>>  target/i386/sev.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/i386/sev.c b/target/i386/sev.c
>> index 37690ae809c..92c69a23769 100644
>> --- a/target/i386/sev.c
>> +++ b/target/i386/sev.c
>> @@ -87,7 +87,7 @@ typedef struct __attribute__((__packed__)) SevInfoBlock {
>>  static SevGuestState *sev_guest;
>>  static Error *sev_mig_blocker;
>>  
>> -static const char *const sev_fw_errlist[] = {
>> +static const char *const sev_fw_errlist[SEV_RET_MAX] = {
>>      [SEV_RET_SUCCESS]                = "",
>>      [SEV_RET_INVALID_PLATFORM_STATE] = "Platform state is invalid",
>>      [SEV_RET_INVALID_GUEST_STATE]    = "Guest state is invalid",
>> @@ -114,6 +114,8 @@ static const char *const sev_fw_errlist[] = {
>>      [SEV_RET_RESOURCE_LIMIT]         = "Required firmware resource depleted",
>>      [SEV_RET_SECURE_DATA_INVALID]    = "Part-specific integrity check failure",
>>  };
>> +/* Ensure sev_fw_errlist[] is updated after running update-linux-headers.sh */
>> +QEMU_BUILD_BUG_ON(SEV_RET_SECURE_DATA_INVALID + 1 != SEV_RET_MAX);
>>  
>>  #define SEV_FW_MAX_ERROR      ARRAY_SIZE(sev_fw_errlist)
>>  
>> @@ -160,6 +162,7 @@ fw_error_to_str(int code)
>>      if (code < 0 || code >= SEV_FW_MAX_ERROR) {
>>          return "unknown error";
>>      }
>> +    assert(sev_fw_errlist[code]);
>>  
>>      return sev_fw_errlist[code];
>>  }
>>
> 


