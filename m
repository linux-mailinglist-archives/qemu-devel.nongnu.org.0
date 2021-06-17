Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7956D3ABAA1
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 19:29:14 +0200 (CEST)
Received: from localhost ([::1]:46218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltvpJ-0005It-IA
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 13:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltvnH-0002vx-6m
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:27:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltvnF-0007fH-6a
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:27:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623950824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gj5I5qRqRT2cLbkS9sw8AqgZDN2gGIJIYAnNxKFb0/M=;
 b=WASTlGAB4cbiuto+x/sqjCVFwXGc+aNHUykfDykw0idzJVcjes3CUyqY0H5//3r6Vg+jdI
 h7va9rHqCNobL/Pj4Wh12+EGosF739FoJVboC8939CXhF0gsPs1bSDihMb5fKvjUihc/sT
 xwTw4GL2yKTM8hSG23WXnZ4rpqFcUE0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-EZXoHPcAOP-Gadrsx7b7sg-1; Thu, 17 Jun 2021 13:27:03 -0400
X-MC-Unique: EZXoHPcAOP-Gadrsx7b7sg-1
Received: by mail-wr1-f71.google.com with SMTP id
 x5-20020adff0c50000b029011a7be832b7so859878wro.18
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 10:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gj5I5qRqRT2cLbkS9sw8AqgZDN2gGIJIYAnNxKFb0/M=;
 b=JJ9AYsi30EyBQDaaRrN254GU+bbJL6c3wIiWmtZeB31Tuw1xMIEOJgMNipQ18y0Y+2
 U0LrdVR6VPDU0bnKqoyWVNH950EEhteJ51fNHEepz8faoWjDCg/jgYSWu8b9E/KeNRwa
 2myUm8Sfu3VrHV4fqEWpuSIVmkBuz2wDIEedBVAuuVMJJBIdQYlMnMNA6RqV5ywCcw+G
 TeLQiAE0vGwKc4w6RoY4KvJJzMBEqWS50a093uDjI710MdFaNsOIKApP7HMPcwFICkXy
 cBlrlF/stJi/2HP6gbR4lvd6aYXi6SF5IlsJcREeYUQU8NUyJl+e5btxMr9dX3Yeb6AQ
 bMBA==
X-Gm-Message-State: AOAM531SQiW0+CnIHKPLEgEWJgD+XqiCTTM0kNkFcwRb5TQpBK7a8h6r
 DFLwDT0U1lSExPiH0a6PoJLKmlHZ4d70FfU0pbFDK5Rm8r7rch+34DnD3kH8Av4R86AHoojSIzT
 bsMMntp3f4DJfuTw=
X-Received: by 2002:a7b:cc87:: with SMTP id p7mr6519072wma.85.1623950822315;
 Thu, 17 Jun 2021 10:27:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7vJcj6HkVTEKdPuXvpNxIVMiw+CmAEYo7NA2m2fka/Uql4nVP00TszNbfhyjEZcw47P2KUQ==
X-Received: by 2002:a7b:cc87:: with SMTP id p7mr6519035wma.85.1623950822041;
 Thu, 17 Jun 2021 10:27:02 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id b11sm6074964wrf.43.2021.06.17.10.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 10:27:01 -0700 (PDT)
Subject: Re: [PATCH] x86: add SEV hashing to fw_cfg for kernel/initrd/cmdline
To: Dov Murik <dovmurik@linux.ibm.com>, James Bottomley <jejb@linux.ibm.com>, 
 Connor Kuehl <ckuehl@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20210525065931.1628554-1-dovmurik@linux.ibm.com>
 <20210615152033.czhsaz44yxtc5ext@habkost.net>
 <1cff8347-ee38-a0a8-f089-36b28a40b828@redhat.com>
 <06b28ac7-19ed-edd8-a555-2858e976d964@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <649abfe3-e799-3535-c56a-ad55ca5df947@redhat.com>
Date: Thu, 17 Jun 2021 17:48:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <06b28ac7-19ed-edd8-a555-2858e976d964@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.254, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Tobin Feldman-Fitzthum <tobin@ibm.com>, qemu-devel@nongnu.org,
 Hubertus Franke <frankeh@us.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Dov,

+Thomas

On 6/17/21 2:48 PM, Dov Murik wrote:
> On 15/06/2021 22:53, Philippe Mathieu-Daudé wrote:
>> Hi Dov, James,
>>
>> +Connor who asked to be reviewer.
>>
>> On 6/15/21 5:20 PM, Eduardo Habkost wrote:
>>> On Tue, May 25, 2021 at 06:59:31AM +0000, Dov Murik wrote:
>>>> From: James Bottomley <jejb@linux.ibm.com>
>>>>
>>>> If the VM is using memory encryption and also specifies a kernel/initrd
>>>> or appended command line, calculate the hashes and add them to the
>>>> encrypted data.  For this to work, OVMF must support an encrypted area
>>>> to place the data which is advertised via a special GUID in the OVMF
>>>> reset table (if the GUID doesn't exist, the user isn't allowed to pass
>>>> in the kernel/initrd/cmdline via the fw_cfg interface).
>>>>
>>>> The hashes of each of the files is calculated (or the string in the case
>>>> of the cmdline with trailing '\0' included).  Each entry in the hashes
>>>> table is GUID identified and since they're passed through the memcrypt
>>>> interface, the hash of the encrypted data will be accumulated by the
>>>> PSP.
>>>>
>>>> Signed-off-by: James Bottomley <jejb@linux.ibm.com>
>>>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>>>> [dovmurik@linux.ibm.com: use machine->cgs, remove parsing of GUID
>>>> strings, remove GCC pragma, fix checkpatch errors]
>>>> ---
>>>>
>>>> OVMF support for handling the table of hashes (verifying that the
>>>> kernel/initrd/cmdline passed via the fw_cfg interface indeed correspond
>>>> to the measured hashes in the table) will be posted soon to edk2-devel.
>>>>
>>>> ---
>>>>  hw/i386/x86.c | 120 +++++++++++++++++++++++++++++++++++++++++++++++++-
>>>>  1 file changed, 119 insertions(+), 1 deletion(-)
>>>>
>>>
>>> This is not an objection to the patch itself, but: can we do
>>> something to move all sev-related code to sev.c?  It would make
>>> the process of assigning a maintainer and reviewing/merging
>>> future patches much simpler.
>>>
>>> I am not familiar with SEV internals, so my only question is
>>> about configurations where SEV is disabled:
>>>
>>> [...]
>>>> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
>>>> @@ -778,6 +818,11 @@ void x86_load_linux(X86MachineState *x86ms,
>>>>      const char *initrd_filename = machine->initrd_filename;
>>>>      const char *dtb_filename = machine->dtb;
>>>>      const char *kernel_cmdline = machine->kernel_cmdline;
>>>> +    uint8_t buf[HASH_SIZE];
>>>> +    uint8_t *hash = buf;
>>>> +    size_t hash_len = sizeof(buf);
>>>> +    struct sev_hash_table *sev_ht = NULL;
>>>> +    int sev_ht_index = 0;
>>
>> Can you move all these variable into a structure, and use it as a
>> SEV loader context?
>>
>> Then each block of code you added can be moved to its own function,
>> self-described, working with the previous context.
>>
>> The functions can be declared in sev_i386.h and defined in sev.c as
>> Eduardo suggested.
>>
> 
> Thanks Philippe, I'll try this approach.
> 
> 
> I assume you mean that an addition like this:
> 
> +    if (sev_ht) {
> +        struct sev_hash_table_entry *e = &sev_ht->entries[sev_ht_index++];
> +
> +        qcrypto_hash_bytes(QCRYPTO_HASH_ALG_SHA256, (char *)kernel_cmdline,
> +                           strlen(kernel_cmdline) + 1,
> +                           &hash, &hash_len, &error_fatal);
> +        memcpy(e->hash, hash, hash_len);
> +        e->len = sizeof(*e);
> +        memcpy(e->guid, sev_cmdline_entry_guid, sizeof(e->guid));
> +    }
> 
> will be extracted to a function, and here (in x86_load_linux()) replaced
> with a single call:
> 
>     sev_kernel_loader_calc_cmdline_hash(&sev_loader_context, kernel_cmdline);
>   
> and that function will have an empty stub in non-SEV builds, and a do-
> nothing condition (at the beginning) if it's an SEV-disabled VM, and
> will do the actual work in SEV VMs.

This works, but I'd rather use:

  if (sev_enabled()) {
      sev_kernel_loader_calc_cmdline_hash(&sev_loader_context,
                                          kernel_cmdline);
  }

And have sev_enabled() defined as:

#ifdef CONFIG_SEV
bool sev_enabled(void);
#else
#define sev_enabled() false
#endif

So the compiler could elide the statement if SEV is disabled,
and stub is not necessary.

But that means we'd need to add "#include CONFIG_DEVICES" in
a sysemu/ header, which looks like an anti-pattern.

Thomas / Paolo, what do you think?

> Also, should I base my next version on top of the current master, or on
> top of your SEV-Housekeeping patch series, or on top of some other tree?

It depends its shape :> If the maintainers disagree with it, you better
base your patch on Eduardo's tree. Indeed the code will be different.
If you think the housekeeping is worthwhile, you could also review it
to increase the odds to get it queued ;)

Regards,

Phil.


