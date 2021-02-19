Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E28A531FE72
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 18:58:58 +0100 (CET)
Received: from localhost ([::1]:52426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDA3N-0006Yy-VF
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 12:58:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lDA1w-0005TT-3I
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:57:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lDA1o-0002jG-Nw
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:57:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613757439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nAR+LvZ/chuhZS9BatQLseRtC+w49o+W4+h/U7f9hAQ=;
 b=aTNptzb0Uxi6oVummTSdLnLDQp2oFQJ8Pq2qhMUSeFNXNwCW3Mar8MzfUdfqSHV3wHBazI
 T1XVoORmH3pVLfbBatOBgThTBr8j8jbiTgp3zMbknSLlE+7wKqmsBGXzWpYqu8yobifKXd
 PjwLUyuecKLrfRpIEcsPX7zvO86vJE8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-GuXvBn50OOuLqtH3UkqJPQ-1; Fri, 19 Feb 2021 12:57:17 -0500
X-MC-Unique: GuXvBn50OOuLqtH3UkqJPQ-1
Received: by mail-wr1-f69.google.com with SMTP id p18so2821820wrt.5
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 09:57:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nAR+LvZ/chuhZS9BatQLseRtC+w49o+W4+h/U7f9hAQ=;
 b=EJPn7gcGv7bjmqEUQBG397jQKNGzSlJNj2fj4c7Z0cINXkQwt2SL5U8iugyzm2EjK+
 jH7lybEEoa1Wc64cRm8alAYScr8qe3caU/2e1xnTtsNBTyEhIPHmar/6sQaFci9fR/yT
 xSP+swo9qgtLZ2bJYcNrABwNyiBLVADGjMJy/GYp38K+opc+s/2EoqvXvj/7BWKOhgkN
 97mV1Dbkqt6hOXKeoHPsuBqVpBdwqd0VzXB5XjSutYAIvsYNKGO8nYX+71URpwEYx+2S
 tQ/dwz1HNenrRm4VSYBAqw37sTZzLMc0dWCvpfPnvegIdDfpztq0m51Fq6S8amqBi8/d
 I7Zg==
X-Gm-Message-State: AOAM532lg2lQj+oCb7oV5lhg1RfMuKH8COCn6tMMRRFShnzl3JdE+cgI
 0qoI5kpEDTaxPdjtM4Uk44+YSdDZYYpYQlmmjAqB8bc5aw2N10EUSpBu/stJ7XCoATH5ZRiuZja
 UGb1/HEC3gELPHuc=
X-Received: by 2002:a7b:c010:: with SMTP id c16mr9469683wmb.134.1613757436057; 
 Fri, 19 Feb 2021 09:57:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTC0/UYyeU8t8fFJHNu83yNjMBPysCpuuSE3Av/Vb0kX3ZE9B7zO92pMiAdBjdy49reHDr0Q==
X-Received: by 2002:a7b:c010:: with SMTP id c16mr9469667wmb.134.1613757435877; 
 Fri, 19 Feb 2021 09:57:15 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r12sm3140734wrt.69.2021.02.19.09.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 09:57:15 -0800 (PST)
Subject: Re: [PATCH 0/2] SEV firmware error list touchups
To: Connor Kuehl <ckuehl@redhat.com>, qemu-devel@nongnu.org
References: <20210218151633.215374-1-ckuehl@redhat.com>
 <5ab9738d-b5c2-a580-47f1-9ebd289903f4@redhat.com>
 <d32f8265-c82c-b09e-87b1-18fa040ae70f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fbcf5e53-4ec2-eee9-dd48-2a8420ef9f02@redhat.com>
Date: Fri, 19 Feb 2021 18:57:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <d32f8265-c82c-b09e-87b1-18fa040ae70f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com,
 brijesh.singh@amd.com, thomas.lendacky@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 3:46 PM, Connor Kuehl wrote:
> On 2/18/21 9:48 AM, Philippe Mathieu-Daudé wrote:
>> On 2/18/21 4:16 PM, Connor Kuehl wrote:
>>> Connor Kuehl (2):
>>>    sev: use explicit indices for mapping firmware error codes to strings
>>>    sev: add missing firmware error conditions
>>>
>>>   target/i386/sev.c | 48 ++++++++++++++++++++++++-----------------------
>>>   1 file changed, 25 insertions(+), 23 deletions(-)
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Thank you! :-)
> 
>> To avoid this problem in future (new error code added on the Linux
>> kernel side) would it be acceptable to add a 3rd patch as:
>>
>> -- >8 --
>> diff --git a/target/i386/sev.c b/target/i386/sev.c
>> index 0f414df02f3..e086d3198e8 100644
>> --- a/target/i386/sev.c
>> +++ b/target/i386/sev.c
>> @@ -155,9 +155,12 @@ sev_platform_ioctl(int fd, int cmd, void *data, int
>> *error)
>>   static const char *
>>   fw_error_to_str(int code)
>>   {
>> +    QEMU_BUILD_BUG_ON(SEV_RET_SECURE_DATA_INVALID + 1 == SEV_RET_MAX);
>> +
>>       if (code < 0 || code >= SEV_FW_MAX_ERROR) {
>>           return "unknown error";
>>       }
>> +    assert(sev_fw_errlist[code]);
>>
>>       return sev_fw_errlist[code];
>>   }
>> ---
>>
>> which triggers a build error if scripts/update-linux-headers.sh
>> added another sev_ret_code entry?
>>
> 
> I like this a lot. Should I send a v2 of the series with a third patch
> like this or shall I wait to see if these patches get applied then send
> something like this as a follow up patch?

Since I've the patch locally I'll simply send it.


