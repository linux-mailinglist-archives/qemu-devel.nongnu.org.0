Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BD86ADC68
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:51:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUtS-0006Fq-DG; Tue, 07 Mar 2023 05:50:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZUtQ-0006Fh-0b
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:50:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZUtN-0007ij-8Z
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:50:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678186198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VfNj5LNZYx4fSmCybigLzsdQO/m5xL7DaIsWKucgNo4=;
 b=XGUIoDnkZBE+ps1FDGvSC1XC9kbIEBp7Rf9NaqEjiqle7/qOHlCk3HU4BYYpKVWdXJDoTY
 8EtzQnIUvHgOX1Q53HbnBNG+HDXeAzsLXdYkzzG4WzfrYPG530783v8r4dx9HdxyU/tvn1
 Zqj0i//13aS5ZIWauMmVzssAnImjdCM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-FUzteAlIMFWziSuByNrzMw-1; Tue, 07 Mar 2023 05:49:57 -0500
X-MC-Unique: FUzteAlIMFWziSuByNrzMw-1
Received: by mail-ed1-f70.google.com with SMTP id
 h15-20020a056402280f00b004bf9e193c23so18535933ede.11
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 02:49:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678186196;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VfNj5LNZYx4fSmCybigLzsdQO/m5xL7DaIsWKucgNo4=;
 b=z0AjIC2aU2NkxEISFDtbEagrRgQ9bn3q4rdoGXVcql1XBG3PUOENEjXlhpBYA67eh4
 2lQQiPB/s1tC2v/KToYOQpZN2ngu/jyN7OmwgLcZp/v20Ksvd9PPKV3SByuVBf3Ukms1
 y+xYXpHxOBrq1phtFAlbNGIl/AAsdq4k0tnh7jvpbknNrUDs06gACshaaMRdjN7sEVJv
 HcKkNWj9M1AV/sUO/LddsvrlD4L8AwsJP1RBswofXy23eMPVmv3d6XqC/XV76RkxUK1p
 6vq5CpopyUb52I25DcK5Pk0Eyt20lxCYvI2PyOocnXh0iEyJGg7UIXX34eVvI336kTyi
 3jWw==
X-Gm-Message-State: AO0yUKXYNmCqOKZOlhd02Xs/Y6KgywkzNyyuqqIrCJglt8p6rktNF3Vo
 xrptaTL46OkHP6u6lqFXz+vPXTcdmzOc1m7OgVYKHBGk8TiDLBFXrY9FJWFIGbvvdbu8l5kzYPC
 rK1laJnY3oljn7es=
X-Received: by 2002:a17:906:ce39:b0:8aa:f2f2:7543 with SMTP id
 sd25-20020a170906ce3900b008aaf2f27543mr14020349ejb.29.1678186196428; 
 Tue, 07 Mar 2023 02:49:56 -0800 (PST)
X-Google-Smtp-Source: AK7set8kNxB2YdEmlJE8HtYiwakaeWi7CBebGD8TEx9NggqoPkpIqRq9rJv5pa0b3vgjrLAkDJofJg==
X-Received: by 2002:a17:906:ce39:b0:8aa:f2f2:7543 with SMTP id
 sd25-20020a170906ce3900b008aaf2f27543mr14020336ejb.29.1678186196122; 
 Tue, 07 Mar 2023 02:49:56 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 dx11-20020a170906a84b00b008e493b7bb61sm5865592ejb.153.2023.03.07.02.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 02:49:55 -0800 (PST)
Message-ID: <12ea9d46-1e95-62a1-70f7-d77a66b44bd0@redhat.com>
Date: Tue, 7 Mar 2023 11:49:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 8/9] async: update documentation of the memory barriers
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com
References: <20230306223306.84383-1-pbonzini@redhat.com>
 <20230306223306.84383-9-pbonzini@redhat.com>
 <10e49543-b4f8-f22c-a9ab-e6340c6a0074@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <10e49543-b4f8-f22c-a9ab-e6340c6a0074@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/7/23 00:39, Richard Henderson wrote:
> On 3/6/23 14:33, Paolo Bonzini wrote:
>> @@ -107,11 +114,8 @@ static QEMUBH *aio_bh_dequeue(BHList *head, 
>> unsigned *flags)
>>       QSLIST_REMOVE_HEAD(head, next);
>>       /*
>> -     * The qatomic_and is paired with aio_bh_enqueue().  The implicit 
>> memory
>> -     * barrier ensures that the callback sees all writes done by the 
>> scheduling
>> -     * thread.  It also ensures that the scheduling thread sees the 
>> cleared
>> -     * flag before bh->cb has run, and thus will call aio_notify 
>> again if
>> -     * necessary.
>> +     * Synchronizes with qatomic_fetch_or() in aio_bh_enqueue(), 
>> ensuring that
>> +     * the removal finishes before BH_PENDING is reset.
>>        */
>>       *flags = qatomic_fetch_and(&bh->flags,
> 
> Per this new comment, about the remove finishing first, it would seem 
> that we need smp_mb__before_rmw here, because QSLIST_REMOVE_HEAD is not 
> SEQCST.

Only release-acquire is needed for consistent access to the list, seqcst 
and smp_mb__before/after_rmw() are only needed (as expected) to handle 
wakeup.

Just to be safe, I tried modeling this with cppmem 
(http://svr-pes20-cppmem.cl.cam.ac.uk/cppmem/); support for 
compare-and-swap is very limited, therefore the test looks nothing like 
the C code(*), but it should be ok:

int main() {
   atomic_int x = 0;
   atomic_int y = 0;
   {{{
       { cas_strong_explicit(&x, 0, 1, mo_acquire, mo_acquire);
         x.load(mo_relaxed).readsvalue(1); // fetch_or returned 0
//      r1 = y.load(mo_relaxed);
         y.store(1, mo_release); }         // bh inserted

   ||| { y.load(mo_acquire).readsvalue(1); // bh was in list
         y.store(0, mo_relaxed);           // bh removed
//      r1 = x.load(mo_relaxed);
         x.store(0, mo_release); }         // fetch_and

   ||| { cas_strong_explicit(&x, 0, 2, mo_acquire, mo_acquire);
         x.load(mo_relaxed).readsvalue(2); // fetch_or returned 0
//      r1 = y.load(mo_relaxed);
         y.store(2, mo_release); }         // bh inserted

   }}};
   return 0;
}

You can uncomment the debugging instructions (r1 = ...) too, but leaving 
all three uncommented will blow up.

Use the release_acquire model since it's faster and there are no seqcst 
operations in the above test.  It will take 1-2 minutes to run the model 
on a laptop, and the result shows that the only consistent (i.e. allowed 
by the C standard) execution is the one where thread 0 runs entirely 
before thread 1, and thread 1 runs entirely before thread 2.  You get 
the opposite order if the "bh was in list" line is changed to 
"readsvalue(2)".

This matches the description I had sent yesterday.

Paolo

(*) A couple points of interest.  First, there is no way to say "CAS has 
succeeded" so I am writing different values to x (this is not a problem 
because the code in QEMU only checks whether the pending bit was zero) 
and checking that they can be read back (which isn't a big limitation 
because other threads could sneak in anyway right after the checking 
load).  Second, there is no way to say "reads something other than 0", 
so you cannot get both valid executions with one run of the model, 
instead you can change the "bh was in list" line to "readsvalue(2)".



