Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD88578B18
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 21:39:27 +0200 (CEST)
Received: from localhost ([::1]:58972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDWaT-0005zP-Of
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 15:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDVgO-0007Jy-GR
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:41:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDVgA-0006x8-9j
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:41:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658169673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TXRen2tAOoch5MduIIDI7Qix/hl7pOSwsoHijkebK7c=;
 b=Q3418eNin38xNtfSN4ooViH9DQKiWjVcqxvtqcwm9n5vsnRalrJU+FiPOgQ0LTa1P8j9ER
 WHUqi4x3QNC3KOrP1xmNnUWjwWBiO6qimw46YVq/t2Tbp9ByrJ7C1cD/xsvWEe7gbR/o6x
 WiH3zbgqBJz4Y3IwwkCS3qxCiTAxACo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-p1XHSgSuPkKVM-39iX7V-A-1; Mon, 18 Jul 2022 14:41:12 -0400
X-MC-Unique: p1XHSgSuPkKVM-39iX7V-A-1
Received: by mail-wm1-f72.google.com with SMTP id
 a18-20020a05600c225200b003a30355c0feso4267400wmm.6
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 11:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TXRen2tAOoch5MduIIDI7Qix/hl7pOSwsoHijkebK7c=;
 b=tPdRHaSaTIEvUrDGj0uJdvxJI+byfUVlFxns53OZQ/AJHAfa8RLwBF5RsODLG4tVwU
 chnWgsN2SxF0Aw+nnvdy06p3a1z/hrQaoz9UYMS4Fo70DO7AQDSUkhYy5o2J6a9hASB8
 oCLewVd0XO2YubSBe0BAp9op2mv5w9oXSaCLRSiqCYq+ULvuuJuI9qvKFpneXMoRgAUF
 Ga+ZvlBFFngGcsj36rbNi1y87ORihmFvu4wTPe7sG7NhI3S3PBEfYfJf7rr2fjq7vHHA
 om01PW7Iml0o9C5cee5pZqUhE6xWaC3SaB928hYvRnvH+2a57fNd32m7So8cu1aervyk
 7LiA==
X-Gm-Message-State: AJIora9qX61zw6s+2SFy88MblsWc6Lc9TsH0M3qty2F9be9tvCroKgNN
 Nzo+Ad0/gX08J8M+xtTWxgEIJ/Xt25UVjbWYLPx8KT/bgerxumW++tniF9pTmp3GqwbA+/wQjql
 uNrnSWZ+UTWpoKVw=
X-Received: by 2002:a05:600c:4c22:b0:3a3:181e:887 with SMTP id
 d34-20020a05600c4c2200b003a3181e0887mr9037125wmp.85.1658169671178; 
 Mon, 18 Jul 2022 11:41:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sRDbSnoUYvlWXbl8jF+uNfswwy1urWYdUffeVHm0mjj1zbyD3lZOQGhpB08zygY/NS+b9ysg==
X-Received: by 2002:a05:600c:4c22:b0:3a3:181e:887 with SMTP id
 d34-20020a05600c4c2200b003a3181e0887mr9037107wmp.85.1658169670974; 
 Mon, 18 Jul 2022 11:41:10 -0700 (PDT)
Received: from [192.168.8.104] (tmo-096-80.customers.d1-online.com.
 [80.187.96.80]) by smtp.gmail.com with ESMTPSA id
 q7-20020a05600c2e4700b003a03be171b1sm15118260wmf.43.2022.07.18.11.41.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 11:41:10 -0700 (PDT)
Message-ID: <c75f1ad5-765d-65fd-0beb-19c31679eda4@redhat.com>
Date: Mon, 18 Jul 2022 20:41:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] python/qemu/qmp/legacy: Replace 'returns-whitelist' with
 the correct type
Content-Language: en-US
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster
 <armbru@redhat.com>, qemu-trivial@nongnu.org
References: <20220711095721.61280-1-thuth@redhat.com>
 <CAFn=p-ZKR-1W-4yuXSEh10mu5M-PEZdf693vpWsEtEAOHL2gaw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFn=p-ZKR-1W-4yuXSEh10mu5M-PEZdf693vpWsEtEAOHL2gaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 11/07/2022 22.30, John Snow wrote:
> On Mon, Jul 11, 2022 at 5:57 AM Thomas Huth <thuth@redhat.com> wrote:
>>
>> 'returns-whitelist' has been renamed to 'command-returns-exceptions' in
>> commit b86df3747848 ("qapi: Rename pragma *-whitelist to *-exceptions").
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   python/qemu/qmp/legacy.py | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/python/qemu/qmp/legacy.py b/python/qemu/qmp/legacy.py
>> index 03b5574618..1951754455 100644
>> --- a/python/qemu/qmp/legacy.py
>> +++ b/python/qemu/qmp/legacy.py
>> @@ -50,7 +50,7 @@
>>
>>   # QMPMessage can be outgoing commands or incoming events/returns.
>>   # QMPReturnValue is usually a dict/json object, but due to QAPI's
>> -# 'returns-whitelist', it can actually be anything.
>> +# 'command-returns-exceptions', it can actually be anything.
>>   #
>>   # {'return': {}} is a QMPMessage,
>>   # {} is the QMPReturnValue.
>> --
>> 2.31.1
>>
> 
> May I cajole you to send a MR to
> https://gitlab.com/qemu-project/python-qemu-qmp ?

Sure, done now:

https://gitlab.com/qemu-project/python-qemu-qmp/-/merge_requests/9

  Thomas


