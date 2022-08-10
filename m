Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B75C358EE39
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 16:26:03 +0200 (CEST)
Received: from localhost ([::1]:43032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLmeo-0002lT-TE
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 10:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oLmAf-0003tC-D9
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:54:55 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:37605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oLmAc-0002Iy-QH
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:54:53 -0400
Received: by mail-pf1-x429.google.com with SMTP id f30so13405620pfq.4
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 06:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=sMhLd/Wh9fSvmDKAeKx5DBDULXg3vzGqof4mwYcF+R4=;
 b=cdUqB72pTnZjPS0Fe3nkr5mo/FlkzZ/EMfpniLgS6dOSdo1MZOBtDFlMnLgPik5O2s
 DEHxIGNThx9qh6qm2VC2im4RwLeyazWDW+/pKMiPd8qFpmIZc132aQvr+CERPvSBz0YT
 tG8i4vCQJcQgHoPPl6ACgGTnayoohstgNg9WTOLQ2vlyOVfAjDFagMzuDX2CbRYd1cp4
 cPEqM/5GwlX0bTZhMb3Iz3QCJcAAzIGaAqHcuFe7Vr6InIehnGToTpS3jp55HfqNryP3
 crQtmSEBuhGSDLFGGlo+viI8nhibUOkbNow85S6Pbg8z1KbVBoKlgjjOkU933px1Ncfx
 JzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=sMhLd/Wh9fSvmDKAeKx5DBDULXg3vzGqof4mwYcF+R4=;
 b=ZLuBRWui/qZRfcGa2L8PBF/1aVoCGvIkEoaOBuEMnLVGW0uxfXqKK+3J8WA7MUQ3uJ
 sHMpDi3e+gwPoyoKFlT/Vo2RAN5+WRwP762aB0YwHgx7j1pDKv862SqNuGgC8Aq5MVh3
 OQdKgdGlfanVUC2wbvkgOGPWtF2mH8GhU4EdQljfDg28n/lr9QdjMdq7jAuZu6HGrWzL
 0B36/eQg4NV0lLaeg/QlT3BGIpiWm8l6bNh2c5UrfYkzxePVf+CS2g5fMhgEmuK+t4rg
 miEIzsPcikSMCZgShn9dhPK3HHJOdcOdLxUlykN67XfN4o1E8ZwvTNt4R0X5PqhoKvYg
 jpMA==
X-Gm-Message-State: ACgBeo0M33rvrMKvtY0zKSbzfj1Em9jUNLJLVbXZ2ylCfWu55qBPjfe0
 z/f5hbRqGxk9mzNfBy1u14U=
X-Google-Smtp-Source: AA6agR4AKwEPdgxnGr3ISGk5yJaNHtlYvAZutPxBOGNJNRSNqAob4qt0IP0DD5F30C/deQdiR8FBjw==
X-Received: by 2002:a63:4948:0:b0:41c:1e55:7efa with SMTP id
 y8-20020a634948000000b0041c1e557efamr23773148pgk.555.1660139689151; 
 Wed, 10 Aug 2022 06:54:49 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y67-20020a623246000000b0052acb753b8bsm1979133pfy.158.2022.08.10.06.54.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 06:54:48 -0700 (PDT)
Message-ID: <7b2d19bc-ae57-e399-75f4-5c5d62d966f8@amsat.org>
Date: Wed, 10 Aug 2022 15:54:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH] tests/unit: fix a -Wformat-trunction warning
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>
References: <20220810121513.1356081-1-marcandre.lureau@redhat.com>
 <87bkssb825.fsf@pond.sub.org>
In-Reply-To: <87bkssb825.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 10/8/22 14:24, Markus Armbruster wrote:
> Typo in subject, it's -Wformat-truncation
> 
> marcandre.lureau@redhat.com writes:
> 
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> ../tests/test-qobject-input-visitor.c: In function ‘test_visitor_in_list’:
>> ../tests/test-qobject-input-visitor.c:454:49: warning: ‘%d’ directive output may be truncated writing between 1 and 10 bytes into a region of size 6 [-Wformat-truncation=]
>>    454 |         snprintf(string, sizeof(string), "string%d", i);
>>        |                                                 ^~
>> ../tests/test-qobject-input-visitor.c:454:42: note: directive argument in the range [0, 2147483606]
>>    454 |         snprintf(string, sizeof(string), "string%d", i);
>>        |                                          ^~~~~~~~~~
>> ../tests/test-qobject-input-visitor.c:454:9: note: ‘snprintf’ output between 8 and 17 bytes into a destination of size 12
>>    454 |         snprintf(string, sizeof(string), "string%d", i);
>>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> Not trying to be clever, this is called 3 times during tests,
>> let simply use g_strdup_printf().
>>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> ---
>>   tests/unit/test-qobject-input-visitor.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/tests/unit/test-qobject-input-visitor.c b/tests/unit/test-qobject-input-visitor.c
>> index 14329dabcf..5f614afdbf 100644
>> --- a/tests/unit/test-qobject-input-visitor.c
>> +++ b/tests/unit/test-qobject-input-visitor.c
>> @@ -447,9 +447,8 @@ static void test_visitor_in_list(TestInputVisitorData *data,
>>       g_assert(head != NULL);
>>   
>>       for (i = 0, item = head; item; item = item->next, i++) {
>> -        char string[12];
>> +        g_autofree char *string = g_strdup_printf("string%d", i);
>>   
>> -        snprintf(string, sizeof(string), "string%d", i);
>>           g_assert_cmpstr(item->value->string, ==, string);
>>           g_assert_cmpint(item->value->integer, ==, 42 + i);
>>       }
> 
> Even less clever would be char string[32].

Or assert(i < 10) before calling snprintf (the test data only contains 3 
strings).

> 
> Anyway, with the typo corrected:
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 
> 


