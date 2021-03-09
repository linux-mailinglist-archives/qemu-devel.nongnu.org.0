Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9055633314C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:56:16 +0100 (CET)
Received: from localhost ([::1]:37984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJkKt-00031K-Bg
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:56:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJkJ5-0002F6-PM
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 16:54:23 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:38218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJkJ4-000614-4T
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 16:54:23 -0500
Received: by mail-ed1-x52d.google.com with SMTP id m9so23478041edd.5
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 13:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hYJX6F0+WDZk8sRq+sZCFCzpxdyQs/mBc2YEAvCbjTU=;
 b=MLAkwU52G7tunDcOhXzVFpd9R7UIvJpuZqV6SX6F/UNR24I5KIDRm8YTurVSgPubE7
 sQ++Yy/vJQx+S5MTUpZ1RzEv9bzy0RTIT4gUcpHkdmrvYSFFkD0DEe0ZL8ZotV+JSWrF
 ZA3cQS9jcvTRfHaDx85dxgrxTwLULKiwGNACMtsCsifYYq/u8oSD09XgguFwp45Z8yIa
 4wKc4IfrxySS1yRLWS0Z0kUNELKvFPPJp9WIgfbIUdzvgsPbXVqaF+yXOoO5KGoWk8Qj
 Zx0eWGEJbd05eR76GbseWzxZtmFuoLXVLPo4FMTlsRQF/p/QlKIPcJ+QV6yBkDND6HuT
 7QdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hYJX6F0+WDZk8sRq+sZCFCzpxdyQs/mBc2YEAvCbjTU=;
 b=sNOTOnAvVEFJMLCEe/Vx/zaUSpmgfS07xllXajcXfdbHLxGd6hMIFks/Z1yB0/rtOl
 2IYedgtCQlowiSOT9AGxNZwuKh5pBJNmj+5PRSMCDCxu+idEHUK0MJsTNQMdnq7NcP1k
 EdEFAVsC7eQXp32FQ0KYrgRzqeF04M2HNU17Bl0aD+ZqKlLCDKE2QbBOWjyfWRpXUbVf
 S8asZ/45X+kr5u/Gx0DMbMiD/WQd12nzEEKkekTuYKjYAmw6cq2cuSE5CVka+00uBFAj
 vDVW3O2DWS9HQIILEgJgdwzx/4p5FI8dJXPMNAuvWWj4o4ZROJ18HpFc7vuMgA4JFbZL
 cyyA==
X-Gm-Message-State: AOAM533i3JYLb0/IkgeveiaH9N2CRZFIuEOB4tzCsYVfIhOezuhDM7lM
 2LBd33cH26P6XV/VHBr2JN0=
X-Google-Smtp-Source: ABdhPJzgj4BN99TBT8TVhkX/pNzrcx5nRXq35v6d4GaEjygaVTf/RcsBaTjPgDjkkNgJQ1Nk1tDbFA==
X-Received: by 2002:a05:6402:26ce:: with SMTP id
 x14mr6457023edd.359.1615326860758; 
 Tue, 09 Mar 2021 13:54:20 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y2sm9042233ejf.30.2021.03.09.13.54.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 13:54:20 -0800 (PST)
Subject: Re: [PATCH 2/3] memory: Provide 'base address' argument to
 mtree_print_mr()
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20210305235414.2358144-1-f4bug@amsat.org>
 <20210305235414.2358144-3-f4bug@amsat.org> <20210308234025.GP397383@xz-x1>
 <f3bda42d-759f-dbcd-04f0-45375e3eb9fd@amsat.org>
Message-ID: <c524c45f-695e-fed5-bd24-f3d4deff4016@amsat.org>
Date: Tue, 9 Mar 2021 22:54:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <f3bda42d-759f-dbcd-04f0-45375e3eb9fd@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Peter/Mark/Edgar for SoC modelling

On 3/9/21 10:39 AM, Philippe Mathieu-Daudé wrote:
> Hi Peter,
> 
> On 3/9/21 12:40 AM, Peter Xu wrote:> On Sat, Mar 06, 2021 at 12:54:13AM
> +0100, Philippe Mathieu-Daudé wrote:
>>> @@ -3188,14 +3188,15 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
>>>  
>>>      QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
>>>          qemu_printf("address-space: %s\n", as->name);
>>> -        mtree_print_mr(as->root, 1, 0, &ml_head, owner, disabled);
>>> +        mtree_print_mr(as->root, 1, 0, as->root->addr,
>>
>> Root MR of any address space should have mr->addr==0, right?
>>
>> I'm slightly confused on what this patch wanted to do if so, since then "base"
>> will always be zero..  Or am I wrong?
> 
> That is what I am expecting too... Maybe the problem is elsewhere
> when I create the address space... The simpler way to
> figure it out is add an assertion. I haven't figure out my
> issue yet, I'll follow up later with a proof-of-concept series
> which triggers the assertion.

To trigger I simply use:

mydevice_realize()
{
  memory_region_init(&mr, obj, name, size);

  address_space_init(&as, &mr, name);
  // here we have as.root.addr = 0

  sysbus_init_mmio(sbd, &mr);
}

soc_realize()
{
    ...
    sysbus_realize(SYS_BUS_DEVICE(&mydevice), &error_abort);
    sysbus_mmio_map(SYS_BUS_DEVICE(&mydevice), 0, NONZERO_ADDRESS);
    ...
}

sysbus_mmio_map
-> sysbus_mmio_map_common
   -> memory_region_add_subregion
      -> memory_region_add_subregion_common

Which does:

static void memory_region_add_subregion_common(MemoryRegion *mr,
                                               hwaddr offset,
                                               MemoryRegion *subregion)
{
    assert(!subregion->container);
    subregion->container = mr;
    subregion->addr = offset;
    // subregion = &as.root
    // offset = NONZERO_ADDRESS
    // so here as.root.addr becomes non-zero

Is that use case incorrect? If so:
- where to add the proper assertions to avoid having address spaces
  with non-zero base address?
- what is the proper design?

Else what should we fix?

Thanks,

Phil.

