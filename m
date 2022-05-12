Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E03FB524834
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 10:47:37 +0200 (CEST)
Received: from localhost ([::1]:51520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np4Tw-0001KS-LA
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 04:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1np49I-0004FK-Rr
 for qemu-devel@nongnu.org; Thu, 12 May 2022 04:26:18 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:42992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1np49G-0005Ng-I2
 for qemu-devel@nongnu.org; Thu, 12 May 2022 04:26:15 -0400
Received: by mail-ej1-x62e.google.com with SMTP id i27so8655613ejd.9
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 01:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kCS0djnBburNoAd8VwJ6gb94l+fwr8nsgn2Gw+yepas=;
 b=WpJI0Yl44lq6V6cUtMhcaOs/yDN8AZKnhjtzBRh1/xI3oyPyolWCagcPIp4xDgRj7o
 bzF4ZCDrPMNMKrdj1+W5e5du7MKAkpEgdR7UbSnWT7pp7BQrH+pS2uI+jJR8o+3Fqot5
 JDNbzsLBhEIw/8MrQyJEHop9QNQ+EYzjZlirBujE7bdjm2gmvMstWnbD4ELRiJ24R4rf
 66Ft1PYbZH+X6z18MdhMx/z7J+RVAA7l/ibbNc+KU3abGQ5D3wC1QE/169BeoloP5uHD
 Pbv0lo3971U5UKqqTNyyY/tEG055WnyReE9AuZujqMx8CtJPoNnQw+CqwQEl30DBt44V
 hWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kCS0djnBburNoAd8VwJ6gb94l+fwr8nsgn2Gw+yepas=;
 b=Hh6x29S/wtU5XfFAwR+ghUusHpmjOMqOF+nA3YkidNGUyF4jQ5fIMK88oz/1M6U701
 G1K8yJqHhp8b4LWPG0DlVh/unlOrvHJvUzC8S0oSBhery0rLeTGdeMeW68vV35Yn28Yw
 AkGi4Ffa1RwT5Fmz/gc4SjnysJYKdy3775cYBcvayYyDJqG4H6Qg0eoMDBVKnZr/7Ll/
 nkUOW19ALoActSpDoEQPJ0DHe8jXBe/kF+d3gFofebL8IkLQcG/hRJHwTJXJ+wGZdnnF
 yHeEu0iPtBjoVKEQUAUSq647weNxQKWQeFXu1GiTglgbaC66YmILhrL+6dpU+FhGpGvq
 dgnw==
X-Gm-Message-State: AOAM530w88W+nkMxkoGFCwO/yEf3H0R78sTlvBupm42kMOBsrQZs5D5n
 /RoaEX8KIEqWIRNzZVl3PVI=
X-Google-Smtp-Source: ABdhPJykblA5UCmKihg36eyGWTVsfeB/MS5K20x67ktP/xakzxMqEZ5IF/tHwiCr8362JE7egrV0GA==
X-Received: by 2002:a17:907:7f12:b0:6f4:57e7:b20a with SMTP id
 qf18-20020a1709077f1200b006f457e7b20amr27926371ejc.538.1652343973119; 
 Thu, 12 May 2022 01:26:13 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 p2-20020a170906614200b006f3ef214e41sm1860305ejl.167.2022.05.12.01.26.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 01:26:12 -0700 (PDT)
Message-ID: <a1d20baf-03de-d567-50d9-3c58080699a2@redhat.com>
Date: Thu, 12 May 2022 10:26:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] qapi: make machine type deprecation a warning
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
References: <20220511175043.27327-1-pbonzini@redhat.com>
 <871qwzdi3r.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <871qwzdi3r.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
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

On 5/11/22 20:44, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   softmmu/vl.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index c2919579fd..fbef0f5c5f 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -3723,7 +3723,7 @@ void qemu_init(int argc, char **argv, char **envp)
>>   
>>       machine_class = MACHINE_GET_CLASS(current_machine);
>>       if (!qtest_enabled() && machine_class->deprecation_reason) {
>> -        error_report("Machine type '%s' is deprecated: %s",
>> +        warn_report("Machine type '%s' is deprecated: %s",
>>                        machine_class->name, machine_class->deprecation_reason);
>>       }
> 
> Anti-pattern: error_report() not followed by "fail function".

Good point, thanks for writing it down... That's what I couldn't put my 
fingers on (hence the scant commit message).  I'll augment the commit 
message with the following:

error_report should generally be followed by a failure; if we can 
proceed anyway, that is just a warning and should be communicated
properly to the user with warn_report.

Paolo

> The commit only changes the message printed to stderr.  The commit
> message made me expect it would change an actual (fatal?) error into a
> mere warning.  It's too late in my day to come up with a clearer
> phrasing, so
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 
> 


