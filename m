Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEDD3A8A23
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 22:27:54 +0200 (CEST)
Received: from localhost ([::1]:35834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltFf6-0006dm-GP
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 16:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ltFds-0005ly-9r; Tue, 15 Jun 2021 16:26:36 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:46863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ltFdq-00043u-D0; Tue, 15 Jun 2021 16:26:35 -0400
Received: by mail-qt1-x832.google.com with SMTP id a15so22834qtx.13;
 Tue, 15 Jun 2021 13:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AUEwGlkuov5lGX/cLB7G8HplOlAImoEl/RkyBJKzsRw=;
 b=CDMBvuI/b0mGgaArBhfxJpvdCCjwH7uD+1Q44h7dZz/hcql11lomSKIyIk7xEsy1Re
 4B/YseSDI0SNw+KJd5y0jAmbOJlKvw/pSuLswXaYa2+G41qAxs/3BsWu0ltcWQheGzIZ
 +zLx28kzfC2o4DfUXjeCXpFb3lqV/WKD2O5zClsEUxo2URNbEkEYKHTnxuRqxJ3q3rlK
 vy24C2qfJfg7bj2mbquJjxmjwB+bCN9aSKs4uxBu3ybVMUuVOA7FZHNNhNPAuO3ddkn/
 /vi5n42yQHNSXXePnjc553Yfk3Co3u/j1wFGSrIExE1UlpsBoMIoF+UOmvpM7Mz89F2i
 7ClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AUEwGlkuov5lGX/cLB7G8HplOlAImoEl/RkyBJKzsRw=;
 b=Aru3bixuYNlWO3+/iA2/vGRrH2GWChkVRNFNPcI4vmTMmaOk0J6VRPKF0h8FrBR7fB
 RGAKBLWyRTJd79mvNoLeycIOnj0J9kTxnxROvn71d0f92WN6r/PDfOmGY6p2xf0IsdkX
 T97CjN+6775C6ukzDFyCxaGfJfKU1W2KYRiVHYIhdj8w/qMPXZAKXzy5jLSR41t954s5
 r3SBWZC8Fi0hammv3kaaEevdfR6vkjl89cmDmtvzX3zs9AHEohShqPjgmoy0Se6MZkOW
 L+z8trMpJ6kYnjfI1+7GdnLpBVuPKejooW6mF9y08Y6668POWv4lfNDcu2sSj9blR5hg
 kf6Q==
X-Gm-Message-State: AOAM530RiH54XVysjtkbe0F+YTrLfNZVC1P6w6ctjwFwF2A4FpqkZVXA
 ddjlP6qMvalTjKF3HkLbKT8=
X-Google-Smtp-Source: ABdhPJzkmAyecefa8SEPTIdBYm1NRjYZLgPYUc/AwVdkr4eYedxwv6xdnY9y6b/rx67JpzVrCIRUyw==
X-Received: by 2002:ac8:709a:: with SMTP id y26mr1413377qto.315.1623788792647; 
 Tue, 15 Jun 2021 13:26:32 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c6:4d9a:784f:a7de:c020:5f1e?
 ([2804:431:c7c6:4d9a:784f:a7de:c020:5f1e])
 by smtp.gmail.com with ESMTPSA id o66sm108937qkd.60.2021.06.15.13.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 13:26:32 -0700 (PDT)
Subject: Re: [RFC PATCH 3/8] spapr_numa.c: wait for CAS before writing rtas DT
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210615013309.2833323-1-danielhb413@gmail.com>
 <20210615013309.2833323-4-danielhb413@gmail.com> <YMgmPDrr7oJFGME1@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <65a744dc-3edd-a0e8-4e32-dab7ad1d64d5@gmail.com>
Date: Tue, 15 Jun 2021 17:26:29 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YMgmPDrr7oJFGME1@yekko>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x832.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: aneesh.kumar@linux.ibm.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/15/21 1:02 AM, David Gibson wrote:
> On Mon, Jun 14, 2021 at 10:33:04PM -0300, Daniel Henrique Barboza wrote:
>> spapr_numa_write_rtas_dt() is called from spapr_dt_rtas(), which in
>> turned is called by spapr_build_fdt(). spapr_build_fdt() is called in
>> two places: spapr_machine_reset() and do_client_architecture_support().
>> When called in machine_reset() we're writing RTAS nodes with NUMA
>> artifacts without going through CAS first.
>>
>> This is not an issue because we always write the same thing in DT, since
>> we support just FORM1 NUMA affinity. With the upcoming FORM2 support,
>> we're now reliant on guest choice to decide what to write.
>>
>> Instead of taking a guess (e.g. default to FORM1, switch to FORM2 if
>> guest chooses it), postpone the writing of
>> ibm,associativity-reference-points and ibm,max-associativity-domains
>> until we're sure what was negotiated with the guest.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
> I think it makes sense to fold this in with 1/8 moving the calculation
> itself until after CAS.

Ok.

> 
> This does make a (theoretical) functional change - it means that NUMA
> information is not available before CAS, which it was before.  I think
> that's very unlikely to break anything, but I wonder if we should make
> it dependent on the machine version just to be safe.

I don't mind making it dependent on the default machine. I'll wrap this
CAS change (and as result, all FORM2 support) to be available only for
the default machine type.


Thanks,


Daniel

> 
>> ---
>>   hw/ppc/spapr_numa.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
>> index 04a86f9b5b..e1a7f80076 100644
>> --- a/hw/ppc/spapr_numa.c
>> +++ b/hw/ppc/spapr_numa.c
>> @@ -379,6 +379,10 @@ static void spapr_numa_FORM1_write_rtas_dt(SpaprMachineState *spapr,
>>    */
>>   void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas)
>>   {
>> +    if (spapr_ovec_empty(spapr->ov5_cas)) {
>> +        return;
>> +    }
>> +
>>       spapr_numa_FORM1_write_rtas_dt(spapr, fdt, rtas);
>>   }
>>   
> 

