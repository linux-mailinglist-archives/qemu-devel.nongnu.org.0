Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D154C10E4
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 12:01:46 +0100 (CET)
Received: from localhost ([::1]:54686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMpOz-00028m-Op
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 06:01:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nMpHp-0005QA-6v
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 05:54:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nMpHm-0003kd-FV
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 05:54:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645613647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WOQ3L6rgQgO/svpqo7TSklbArkszRegdbYFm3zs887E=;
 b=ZeLrEOTXAS4KLi+ydh8pt5wlHoVhIB21e3276UvkQxYch+uSB9Fxq8xmzPBQOuxuG6ZovI
 e8sxGGBF2xJGN7qjwFBokiDkyxwdz/KaO3MOz8JBV+iuiFeaFzXBfuRFfDeTyhe4oBEM40
 MzbH+cpMvmCN9x1wcfMSV77MJrl5g2k=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-_tUsEI-DM0GHaaihfh6bFg-1; Wed, 23 Feb 2022 05:54:06 -0500
X-MC-Unique: _tUsEI-DM0GHaaihfh6bFg-1
Received: by mail-ed1-f70.google.com with SMTP id
 eq13-20020a056402298d00b00412cfa4bb0eso8589289edb.7
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 02:54:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WOQ3L6rgQgO/svpqo7TSklbArkszRegdbYFm3zs887E=;
 b=AP5qd3fEuXlOKnezbWrojzfU+/5rJRCwW0+5wdt31Y2tw1NYgGyKqsQTubjx+63Xhv
 5A12aU62OrErAeJJii1j6NPYUhyG/ikn/QsckaIPdtyeoKzZLD5Seps1MS4nqHtiSxqz
 MizrpcKmfleN9Mk1Rka6Ja33tf/yjcKLB1kwjcojGlQbf/WYGnIIqL1BchIMrKv5XtER
 RFoz28VboLnNuMtFLE/8IIu2h+ePbJnPP3YGpN3bq+NL/mpwGUXsMza+5sBXlP5ei36G
 t7JhyknieKDRQdOZJNUCwWms8i1tcADP4hiTj6tXUgMyrUuLroR6VuwoKQBn99Ism3CX
 2Rlw==
X-Gm-Message-State: AOAM533Yyj/mzrdm5bv8uC1xrjB7hShm9SzrD/xMOsfiy0zyrOlE+QDN
 FIkAQk2ITrywKdGS9ePBzd1eFkpuC5WHGqJsWxbwtrNqEn4qsOyE4FZkbOEqW7wPS/FG1FyHOnJ
 jYHVKm0zKpfrrBNk=
X-Received: by 2002:a17:906:d8dc:b0:6cf:d1d1:db25 with SMTP id
 re28-20020a170906d8dc00b006cfd1d1db25mr22719871ejb.285.1645613645534; 
 Wed, 23 Feb 2022 02:54:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1xsb0W1RS4lc9zXGa1iX6D0YeW/3DD9wPM2fg2RuKiq1IfIeBYLQeoADYGv7ko2utYswlfg==
X-Received: by 2002:a17:906:d8dc:b0:6cf:d1d1:db25 with SMTP id
 re28-20020a170906d8dc00b006cfd1d1db25mr22719857ejb.285.1645613645300; 
 Wed, 23 Feb 2022 02:54:05 -0800 (PST)
Received: from ?IPV6:2003:cb:c70d:5300:b415:ca4f:9aa8:c7ec?
 (p200300cbc70d5300b415ca4f9aa8c7ec.dip0.t-ipconnect.de.
 [2003:cb:c70d:5300:b415:ca4f:9aa8:c7ec])
 by smtp.gmail.com with ESMTPSA id t24sm5411460edq.62.2022.02.23.02.54.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 02:54:04 -0800 (PST)
Message-ID: <12e026c0-1c27-db38-2404-85d572ae2bd9@redhat.com>
Date: Wed, 23 Feb 2022 11:54:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 4/4] tests/tcg/s390x: changed to using .insn for tests
 requiring z15
To: Thomas Huth <thuth@redhat.com>, David Miller <dmiller423@gmail.com>,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20220217231728.13932-1-dmiller423@gmail.com>
 <20220217231728.13932-5-dmiller423@gmail.com>
 <e0b1e009-6684-6a4a-a8f3-1fd6048a89ad@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <e0b1e009-6684-6a4a-a8f3-1fd6048a89ad@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: pasic@linux.ibm.com, borntraeger@linux.ibm.com, farman@linux.ibm.com,
 cohuck@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.02.22 11:44, Thomas Huth wrote:
> On 18/02/2022 00.17, David Miller wrote:
>> Signed-off-by: David Miller <dmiller423@gmail.com>
>> ---
>>   tests/tcg/s390x/mie3-compl.c | 21 +++++++++++----------
>>   tests/tcg/s390x/mie3-mvcrl.c |  2 +-
>>   tests/tcg/s390x/mie3-sel.c   |  6 +++---
>>   3 files changed, 15 insertions(+), 14 deletions(-)
>>
>> diff --git a/tests/tcg/s390x/mie3-compl.c b/tests/tcg/s390x/mie3-compl.c
>> index 98281ee683..31820e4a2a 100644
>> --- a/tests/tcg/s390x/mie3-compl.c
>> +++ b/tests/tcg/s390x/mie3-compl.c
>> @@ -14,25 +14,26 @@
>>   #define FbinOp(S, ASM) uint64_t S(uint64_t a, uint64_t b) \
>>   { uint64_t res = 0; F_PRO; ASM; return res; }
>>   
>> +
>>   /* AND WITH COMPLEMENT */
>> -FbinOp(_ncrk,  asm("ncrk  %%r0, %%r3, %%r2\n" F_EPI))
>> -FbinOp(_ncgrk, asm("ncgrk %%r0, %%r3, %%r2\n" F_EPI))
>> +FbinOp(_ncrk,  asm(".insn rrf, 0xB9F50000, %%r0, %%r3, %%r2, 0\n" F_EPI))
>> +FbinOp(_ncgrk, asm(".insn rrf, 0xB9E50000, %%r0, %%r3, %%r2, 0\n" F_EPI))
>>   
>>   /* NAND */
>> -FbinOp(_nnrk,  asm("nnrk  %%r0, %%r3, %%r2\n" F_EPI))
>> -FbinOp(_nngrk, asm("nngrk %%r0, %%r3, %%r2\n" F_EPI))
>> +FbinOp(_nnrk,  asm(".insn rrf, 0xB9740000, %%r0, %%r3, %%r2, 0\n" F_EPI))
>> +FbinOp(_nngrk, asm(".insn rrf, 0xB9640000, %%r0, %%r3, %%r2, 0\n" F_EPI))
>>   
>>   /* NOT XOR */
>> -FbinOp(_nxrk,  asm("nxrk  %%r0, %%r3, %%r2\n" F_EPI))
>> -FbinOp(_nxgrk, asm("nxgrk %%r0, %%r3, %%r2\n" F_EPI))
>> +FbinOp(_nxrk,  asm(".insn rrf, 0xB9770000, %%r0, %%r3, %%r2, 0\n" F_EPI))
>> +FbinOp(_nxgrk, asm(".insn rrf, 0xB9670000, %%r0, %%r3, %%r2, 0\n" F_EPI))
>>   
>>   /* NOR */
>> -FbinOp(_nork,  asm("nork  %%r0, %%r3, %%r2\n" F_EPI))
>> -FbinOp(_nogrk, asm("nogrk %%r0, %%r3, %%r2\n" F_EPI))
>> +FbinOp(_nork,  asm(".insn rrf, 0xB9760000, %%r0, %%r3, %%r2, 0\n" F_EPI))
>> +FbinOp(_nogrk, asm(".insn rrf, 0xB9660000, %%r0, %%r3, %%r2, 0\n" F_EPI))
>>   
>>   /* OR WITH COMPLEMENT */
>> -FbinOp(_ocrk,  asm("ocrk  %%r0, %%r3, %%r2\n" F_EPI))
>> -FbinOp(_ocgrk, asm("ocgrk %%r0, %%r3, %%r2\n" F_EPI))
>> +FbinOp(_ocrk,  asm(".insn rrf, 0xB9750000, %%r0, %%r3, %%r2, 0\n" F_EPI))
>> +FbinOp(_ocgrk, asm(".insn rrf, 0xB9650000, %%r0, %%r3, %%r2, 0\n" F_EPI))
>>   
>>   
>>   int main(int argc, char *argv[])
>> diff --git a/tests/tcg/s390x/mie3-mvcrl.c b/tests/tcg/s390x/mie3-mvcrl.c
>> index 81cf3ad702..f0be83b197 100644
>> --- a/tests/tcg/s390x/mie3-mvcrl.c
>> +++ b/tests/tcg/s390x/mie3-mvcrl.c
>> @@ -6,7 +6,7 @@ static inline void mvcrl_8(const char *dst, const char *src)
>>   {
>>       asm volatile (
>>       "llill %%r0, 8\n"
>> -    "mvcrl 0(%[dst]), 0(%[src])\n"
>> +    ".insn sse, 0xE50A00000000, 0(%[dst]), 0(%[src])"
>>       : : [dst] "d" (dst), [src] "d" (src)
>>       : "memory");
>>   }
>> diff --git a/tests/tcg/s390x/mie3-sel.c b/tests/tcg/s390x/mie3-sel.c
>> index d6b7b0933b..32d434b01a 100644
>> --- a/tests/tcg/s390x/mie3-sel.c
>> +++ b/tests/tcg/s390x/mie3-sel.c
>> @@ -19,9 +19,9 @@
>>   { uint64_t res = 0; F_PRO ; ASM ; return res; }
>>   
>>   
>> -Fi3 (_selre,     asm("selre    %%r0, %%r3, %%r2\n" F_EPI))
>> -Fi3 (_selgrz,    asm("selgrz   %%r0, %%r3, %%r2\n" F_EPI))
>> -Fi3 (_selfhrnz,  asm("selfhrnz %%r0, %%r3, %%r2\n" F_EPI))
>> +Fi3 (_selre,     asm(".insn rrf, 0xB9F00000, %%r0, %%r3, %%r2, 8\n" F_EPI))
>> +Fi3 (_selgrz,    asm(".insn rrf, 0xB9E30000, %%r0, %%r3, %%r2, 8\n" F_EPI))
>> +Fi3 (_selfhrnz,  asm(".insn rrf, 0xB9C00000, %%r0, %%r3, %%r2, 7\n" F_EPI))
>>   
>>   
>>   int main(int argc, char *argv[])
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> ... maybe best to squash this into the previous patch, though (I can do that 
> when picking up the patch if you agree - no need to resend for this).
> 

Do we need this with my debian11 container change?

-- 
Thanks,

David / dhildenb


