Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 396391C3329
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 08:51:48 +0200 (CEST)
Received: from localhost ([::1]:52472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVUx9-0004pr-Bb
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 02:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jVUwG-0004H9-BJ; Mon, 04 May 2020 02:50:52 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:34490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jVUwD-0004B9-Qv; Mon, 04 May 2020 02:50:51 -0400
Received: by mail-wm1-x342.google.com with SMTP id v4so14736991wme.1;
 Sun, 03 May 2020 23:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0Sgl2Qoozw9sNyqLejt9h7wTdbWGWJdZpZVOb/oFPgY=;
 b=R/CIoW2U+lCHRRPctPqJBaQ0L0jxMRRuUNBMKCntC0Rd6I8BX68a2DdSGqZfDoaPdu
 mhvqxCPBGtSmUgJ9PzqkfWHH7f+UWOJv0YXDuxEcvr8ZN0bERhZb2V+z3bAsv95prqWZ
 M7VbXJevuzQjXlEH2SesvhZZCqcc+TR/GRlX7AypgJ9gZfVMfQ4c0FEB0PwcgdLh3PRR
 o0KpIV7Dc07j4Pa3kO5haD6ONmvvzBL7zRpMT421tnrbRl/NCElLVPDeFgZkUL6Xz1MK
 77EZ5hTCk2a8pK9ra5j5hEMq/zfvcs7kCjvQFTGa/o+EYxoQCCscqrfPIqH28nnrH95d
 42NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0Sgl2Qoozw9sNyqLejt9h7wTdbWGWJdZpZVOb/oFPgY=;
 b=DOCXPH9ENcpmx/7RGERMNCBTVvJH+bhhoCF5LjvHlu+8a1fUSY0QCAcW3sr8sHkkOt
 ODCuU1y1Yu0SRWaD587X34gMoZS2jbKNbaiYV4KAbhLm3yj/BpoY0lJe+RTZkyHurITP
 DeSIbzdf3cijg1OOG/dVdZL6ygPlZOipJj0VN3D3n2BqnKQDiIlpuRt8jMzw88BHXBRQ
 xXhxgLmO9nrY4SWo67l/BGQqEl4KRqWX76SJNC7B/LRWbyHaoH8Nu/cgx54sKDXyHblo
 oDuXnmFMk046RQM5wQsbuPEV4SOD6AM30gU1hlx+cs8wPV9PsMmsLawKnhU1R6LMDndf
 P8IQ==
X-Gm-Message-State: AGi0PuaJOFBs9W/i5vwW9k0/yQIewIVpTSH9AU3aXQcoJj/Nrw+E+Dwb
 cct1dGoi7PGcE4vMcz3m7qk=
X-Google-Smtp-Source: APiQypItDzF11D3siu1GF8iZEtgOX9/hIs+A4CTeEJOhZ1DCh86h8Wo048a4JREeHcB2GGd27c5Hhw==
X-Received: by 2002:a05:600c:148:: with SMTP id
 w8mr13487016wmm.144.1588575048109; 
 Sun, 03 May 2020 23:50:48 -0700 (PDT)
Received: from [192.168.1.39] (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id a125sm11435208wme.3.2020.05.03.23.50.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 May 2020 23:50:47 -0700 (PDT)
Subject: Re: [RFC PATCH 1/2] audio/mixeng: Fix Clang 'int-conversion' warning
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 qemu-devel@nongnu.org
References: <20200503113220.30808-1-f4bug@amsat.org>
 <20200503113220.30808-2-f4bug@amsat.org>
 <06aef378-80cf-e24c-d271-58a7670d975d@t-online.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d646a579-0317-c062-4672-0fe3229cc56a@amsat.org>
Date: Mon, 4 May 2020 08:50:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <06aef378-80cf-e24c-d271-58a7670d975d@t-online.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>, Alexander Bulekov <alxndr@bu.edu>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/20 7:49 AM, Volker Rümelin wrote:
> 
>> Fix by using a 64-bit float for the conversion, before casting
>> back to 32-bit float.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   audio/mixeng.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/audio/mixeng.c b/audio/mixeng.c
>> index 739a500449..9946bfeaec 100644
>> --- a/audio/mixeng.c
>> +++ b/audio/mixeng.c
>> @@ -271,7 +271,7 @@ f_sample *mixeng_clip[2][2][2][3] = {
>>   #define CONV_NATURAL_FLOAT(x) (x)
>>   #define CLIP_NATURAL_FLOAT(x) (x)
>>   #else
>> -static const float float_scale = UINT_MAX / 2.f;
>> +static const float float_scale = UINT_MAX / 2.;
> 
> I would prefer an explicit cast of UINT_MAX to float. This is what we already have in audio/mixeng_template.h in the conf_* and clip_* functions with FLOAT_MIXENG defined. I think similar functions should look similar.
> 
>>   #define CONV_NATURAL_FLOAT(x) ((x) * float_scale)
>>   
>>   #ifdef RECIPROCAL
> 
> Please don't forget to fix the RECIPROCAL case.
> 
> 
> Btw. the problem was reported here:
> https://lists.nongnu.org/archive/html/qemu-devel/2020-03/msg02270.html

Ah I missed that, I now feel safer knowing developers who understand 
this code are already trying to fix it, thanks Volker!

> 
> With best regards,
> Volker
> 
> 

