Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC9C321ECC
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 19:07:14 +0100 (CET)
Received: from localhost ([::1]:44242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEFc1-0002nY-C6
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 13:07:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEFZb-0001AP-GL
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 13:04:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEFZY-0004LD-Cs
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 13:04:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614017079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SSsnX5SjnKwxu3rr90T4nBZzi1MZ/dtXAKPK6GY/CHA=;
 b=ZWxe0nAudjV76Sa0hoBoMUufLym2zYX3bzBFxc7SPK5wKCIKjGcXxmccSJVKqIS2WCQzId
 2xM2NVWjZZ2So0KTBmY7Zti+kxwqfFSRl67JMElhP0p//iSvvA8gBpYvo6WmNkZvLOLeOL
 NVD24G9eX4U35qKjrVOIRbqtamCpF6w=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-JT0Vrd7OMLKk0CkcIrTsSA-1; Mon, 22 Feb 2021 13:04:37 -0500
X-MC-Unique: JT0Vrd7OMLKk0CkcIrTsSA-1
Received: by mail-ed1-f69.google.com with SMTP id d3so7457638edk.22
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 10:04:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SSsnX5SjnKwxu3rr90T4nBZzi1MZ/dtXAKPK6GY/CHA=;
 b=QnwlaQgTG6lOkPVs2TxTdr+E6DhEs5BtqybTeYIhZ2fszVqYYrIUUvVSBO6t/c3HWU
 Foz0jLtVD02m0F5Vd1IasFGc0sYbP/pS5KUGTEWuONMaJ6LZPvhy5qoM8AzUW/jOUzSB
 4BzJlwO4fjj8g5mskBWYrRCXVqk3Y48b0Z/T4tTa0QyuhzcXNXnhxWlOAqrrmHhj7yvE
 MSwAkmIbn4qodF+pC/agURa0qM/PcukS2ZCn1Qjmo9MhsivayDC1VD9k3gnLf6uTPHys
 Ytk7jmoo9DhH6OnRkiv7IRlhFzG3uvhem9tOp7qtXe1Bt5f6lsOLTBnfp1kqKAt2ut2n
 78+A==
X-Gm-Message-State: AOAM531WTGoDn0dbKuYR/OM6ctw7+DnpDuRmtpkmBymKAuVrF2D9HUZv
 sivSkyCG57nOvY7jUqnEWZ50oBveMdQK+qswx5l9edoChV0jiAq2ApRFGDOto8BV/b7Ie/XNKOd
 PPOzzIy+wZ2M/I0A=
X-Received: by 2002:a17:906:7e42:: with SMTP id
 z2mr21995973ejr.177.1614017076157; 
 Mon, 22 Feb 2021 10:04:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/JC++82lk2ObRrXbPMXgvjOy+aii8aMRtQqY2wAzax0ZKP5G6jLvuYpnN+D+qmV72Wu/wKA==
X-Received: by 2002:a17:906:7e42:: with SMTP id
 z2mr21995909ejr.177.1614017075776; 
 Mon, 22 Feb 2021 10:04:35 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b27sm7825403eja.64.2021.02.22.10.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 10:04:35 -0800 (PST)
Subject: Re: [PATCH v2 01/11] accel/kvm: Check MachineClass kvm_type() return
 value
To: Cornelia Huck <cohuck@redhat.com>
References: <20210219173847.2054123-1-philmd@redhat.com>
 <20210219173847.2054123-2-philmd@redhat.com>
 <20210222182405.3e6e9a6f.cohuck@redhat.com>
 <bc37276d-74cc-22f0-fcc0-4ee5e62cf1df@redhat.com>
 <20210222185044.23fccecc.cohuck@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0f2a252e-34d8-6714-d1fd-d4e3764feef7@redhat.com>
Date: Mon, 22 Feb 2021 19:04:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222185044.23fccecc.cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Leif Lindholm <leif@nuviainc.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 6:50 PM, Cornelia Huck wrote:
> On Mon, 22 Feb 2021 18:41:07 +0100
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> On 2/22/21 6:24 PM, Cornelia Huck wrote:
>>> On Fri, 19 Feb 2021 18:38:37 +0100
>>> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>   
>>>> MachineClass::kvm_type() can return -1 on failure.
>>>> Document it, and add a check in kvm_init().
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> ---
>>>>  include/hw/boards.h | 3 ++-
>>>>  accel/kvm/kvm-all.c | 6 ++++++
>>>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>>>> index a46dfe5d1a6..68d3d10f6b0 100644
>>>> --- a/include/hw/boards.h
>>>> +++ b/include/hw/boards.h
>>>> @@ -127,7 +127,8 @@ typedef struct {
>>>>   *    implement and a stub device is required.
>>>>   * @kvm_type:
>>>>   *    Return the type of KVM corresponding to the kvm-type string option or
>>>> - *    computed based on other criteria such as the host kernel capabilities.
>>>> + *    computed based on other criteria such as the host kernel capabilities
>>>> + *    (which can't be negative), or -1 on error.
>>>>   * @numa_mem_supported:
>>>>   *    true if '--numa node.mem' option is supported and false otherwise
>>>>   * @smp_parse:
>>>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>>>> index 84c943fcdb2..b069938d881 100644
>>>> --- a/accel/kvm/kvm-all.c
>>>> +++ b/accel/kvm/kvm-all.c
>>>> @@ -2057,6 +2057,12 @@ static int kvm_init(MachineState *ms)
>>>>                                                              "kvm-type",
>>>>                                                              &error_abort);
>>>>          type = mc->kvm_type(ms, kvm_type);
>>>> +        if (type < 0) {
>>>> +            ret = -EINVAL;
>>>> +            fprintf(stderr, "Failed to detect kvm-type for machine '%s'\n",
>>>> +                    mc->name);
>>>> +            goto err;
>>>> +        }
>>>>      }
>>>>  
>>>>      do {  
>>>
>>> No objection to this patch; but I'm wondering why some non-pseries
>>> machines implement the kvm_type callback, when I see the kvm-type
>>> property only for pseries? Am I holding my git grep wrong?  
>>
>> Can it be what David commented here?
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg784508.html
>>
> 
> Ok, I might be confused about the other ppc machines; but I'm wondering
> about the kvm_type callback for mips and arm/virt. Maybe I'm just
> confused by the whole mechanism?

For MIPS see https://www.linux-kvm.org/images/f/f2/01x08a-MIPS.pdf
and Jiaxun comment here:
https://lore.kernel.org/linux-mips/a2a2cfe3-5618-43b1-a6a4-cc768fc1b9fb@www.fastmail.com/

TE KVM: Trap-and-Emul guest kernel
VZ KVM: HW Virtualized

For "the whole mechanism" I'll defer to Paolo =)


