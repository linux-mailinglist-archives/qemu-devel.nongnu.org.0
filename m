Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 891BA46D46D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 14:30:20 +0100 (CET)
Received: from localhost ([::1]:57820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mux1X-0004wQ-80
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 08:30:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muwrP-0002Gx-E0
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 08:19:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muwrH-0003za-PH
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 08:19:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638969582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nCog95x+ITvGwxoJ0Ic4arcpfcxYLhPnC/f4oN5NSbg=;
 b=K8UlzrRmSkKuU0f/t/F8aN6BvRrUXagVsYV+XtwppOS5p25WlaMYBdYMkK9QU3kAHe2m9U
 ShJV89RNHWqZyUVdaNYRwxaEm8xwgxnv8ghj74ns6Fp8o8mBRTevTNF5tCfsRIrGFqNtvu
 mbRZESHEGDgk3RgpxRaM2XLDk9ouBng=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-uyd5LfA6PX-CrhmL-J77nA-1; Wed, 08 Dec 2021 08:19:41 -0500
X-MC-Unique: uyd5LfA6PX-CrhmL-J77nA-1
Received: by mail-wr1-f69.google.com with SMTP id
 k15-20020adfe8cf000000b00198d48342f9so382674wrn.0
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 05:19:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nCog95x+ITvGwxoJ0Ic4arcpfcxYLhPnC/f4oN5NSbg=;
 b=kyuoLli1vccVQ9cu77giptPnzgT7KiFjHhlnJDniVwpeA84eLrVde6a3FthBOsIMob
 cjfi6PWqTfLS6cUe41x0D0nr7xYZlAAoVJth18ux5DsRibvlsAo+3TjOoX+/ulzJRDn1
 HyMaqh6/CRrzZTyAwEuIRsPVc7JXl9IMC8+FIP/gi9ESzr68jrLsgTganH1Fh2OwuZjm
 ltF4Qsfq7yXtHLkx5eizS9208RXhT4xjn2dDH3NxQS3a3UkgAGkkFepf54Aok6uMWBkd
 FVWCUAWZyfSzau6qQ4PXa++7+ypCmHPvisXXqahBaU23dqBeNHHI9nvpFiNISbBP/gN/
 B3zg==
X-Gm-Message-State: AOAM530aChFDUeeVKMoxuq9Zc3t5Bykfx/b0A1n0H2PgUQVGREwT/OIa
 Bu+BbCYIzcxsxCSN0596zN/XkQROeWF/cduZ1XStEa5A7+vKCX8GVRD4H+himt0as3t6mu1EQLV
 q5iZSj1KdPLuqi8E=
X-Received: by 2002:a1c:1d04:: with SMTP id d4mr15700305wmd.103.1638969580671; 
 Wed, 08 Dec 2021 05:19:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5UIedaTYkgEYFp+n4QnQcedpWk17JDZ/Jj8DTmx9w4FLooiGD1sjnfNiPTWM7V1YMInS6YQ==
X-Received: by 2002:a1c:1d04:: with SMTP id d4mr15700277wmd.103.1638969580472; 
 Wed, 08 Dec 2021 05:19:40 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id b13sm2907051wrh.32.2021.12.08.05.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 05:19:40 -0800 (PST)
Message-ID: <bbaf15f6-7c77-78a2-118d-f2771b65096d@redhat.com>
Date: Wed, 8 Dec 2021 14:19:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] hw/ppc/ppc405_boards: Change kernel load address
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211202191446.1292125-1-clg@kaod.org>
 <d8119266-e6f1-969c-d440-d511951178f6@redhat.com>
 <8d21273b-0b81-5041-cfc4-704307aa37cc@kaod.org>
 <32012645-274e-9ee9-2d8a-a3d87c4a6bf5@csgroup.eu>
 <599e5aa0-d7a9-b89c-2da9-5e7c909a6064@kaod.org>
 <75b27dfe-cb8f-d40c-c1bd-79415264a87f@redhat.com>
 <CAFEAcA9OQ=nFaMXgFi22BSuchP35OUiTwteG_yxFSnLXFHNTbQ@mail.gmail.com>
 <f29e3aba-a1d7-484d-2aa2-b676113c4f43@kaod.org>
 <d6005c8e-d007-2a66-00f3-5f9d3f30e420@redhat.com>
 <91db1fab-46f4-ebcc-bf2c-1bb36b49ebf8@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <91db1fab-46f4-ebcc-bf2c-1bb36b49ebf8@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 LEROY Christophe <christophe.leroy@csgroup.eu>, Greg Kurz <groug@kaod.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/12/2021 14.15, Cédric Le Goater wrote:
> On 12/8/21 14:07, Thomas Huth wrote:
>> On 03/12/2021 13.25, Cédric Le Goater wrote:
>>> On 12/3/21 11:40, Peter Maydell wrote:
>>>> On Fri, 3 Dec 2021 at 10:32, Thomas Huth <thuth@redhat.com> wrote:
>>>>> I guess it's an accidential NULL pointer dereference somewhere in the 
>>>>> u-boot
>>>>> code ... which will be quite hard to track down when the first page of
>>>>> memory is marked as writable... :-/
>>>>
>>>> Attach a target-arch gdb to the QEMU gdbstub and put a watchpoint on
>>>> address zero ? (Or if you suspect something inside QEMU is doing it
>>>> then run QEMU under gdb and watchpoint the host memory location
>>>> corresponding to guest address 0, but that's more painful.) Nothing
>>>> in the pre-kernel part of the boot process will have set up paging,
>>>> so the watchpointing should be pretty reliable.
>>>
>>> That's the guy:
>>>
>>> https://gitlab.com/huth/u-boot/-/blob/taihu/arch/powerpc/cpu/ppc4xx/sdram.c#L199 
>>>
>>>
>>> There must be an error in how get_ram_size() restores the RAM values :
>>>
>>>    https://gitlab.com/huth/u-boot/-/blob/taihu/common/memsize.c
>>
>> There is definitely something wrong in that function. Seems like they 
>> tried to fix it once here:
>>
>>   https://source.denx.de/u-boot/u-boot/-/commit/b8496cced856ff411f
>>
>> but that patch got later reverted without a replacement later...
> 
> 
> a fix restoring address 0, something like :
> 
> @@ -60,6 +60,9 @@ long get_ram_size(long *base, long maxsi
>           return (0);
>       }
> 
> +    addr = base;
> +    *addr = save[i];
> +
>       for (cnt = 1; cnt < maxsize / sizeof(long); cnt <<= 1) {
>           addr = base + cnt;    /* pointer arith! */
>           val = *addr;
> 
> is not enough. trap_init() will also overwrite the kernel image.
> And u-boot will complain about a wrong CRC.
> 
> The 405 series I sent improves support and latest kernel 5.16-rc4
> can be loaded without uboot. It's a start to debug user space.

Yes, your series is certainly the better way forward. I'll stop messing with 
u-boot now ... since upstream u-boot already removed the 405 support a long 
time ago, my hack was a dead end anyway (but it helped to get at least a 
kernel running again, so it was not in vain)

  Thomas


