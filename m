Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C406D31F94A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 13:17:43 +0100 (CET)
Received: from localhost ([::1]:57542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD4j8-0003qE-JD
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 07:17:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD4b9-0004EP-HI
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:09:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD4b4-0003yA-9x
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:09:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613736560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H0j06Q/EpAZvGEReV+kqCVRCNZpaO1eYalr07yFsh78=;
 b=ECRFbBSJMwy3bMxVDs+AzUTgTsC3sfGeX1UwXgIMbsQLIH5L9zNTQtyROaWAh+mgCxlhjN
 fV4vaC+iA3aRVX5Oweb6prfwk4FY+bhSQ6aYUpVKbbkpa6HlrYgHd8cz1fq6yM33Nswvrq
 aDUNuu0pgGrfjxDffqjfYwPGVREb65Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-I2I_03CfMuOuQh6lWMm3nw-1; Fri, 19 Feb 2021 07:09:17 -0500
X-MC-Unique: I2I_03CfMuOuQh6lWMm3nw-1
Received: by mail-wr1-f70.google.com with SMTP id v1so2376514wru.2
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 04:09:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H0j06Q/EpAZvGEReV+kqCVRCNZpaO1eYalr07yFsh78=;
 b=f+801IpKLqeV0d47iOk8yaDywm1kC+sXQEnLW7Uzi6tcElpRFtNE90TtcXSU/dP4ct
 1PvoTL4YU05Y961/cw9Z8Wgx9aG2rNzZREXRN3Ijt8sP4JF1Vo8ogy4mhtVPbgkN78+8
 RaTP5yL0dyGAxI8fnoYy64z4zNdV7GevaTVWapE3ZP2AU9y+lO/roQMzT03G6l7BjQ9x
 eSk4wB9OzHOHRj5fZBhAjfGMe+1Q4eCd5LpVBYODhGH4/pgvWBWnoo5F6nJ8NWowFXgE
 a1Jp4xzS12ec6eKR4m3EEV0Wt2MwrnKyK4josvgrjXV/w5XmtJozCu+LxQzHVlMgpsQk
 0y0w==
X-Gm-Message-State: AOAM531fqJq9sdpgiK/fV8xQVaeck4Cg9eZrZzr5ckC926Ar16cTtCoq
 6CnZfNZZAWzDHetwVK77pMMJhTSvzXjOl6C64ezKFIh/UgCkIcyxUjNKkiUABdwfJgshQAtg+NI
 jhNEGE8BxXuTEQS4=
X-Received: by 2002:adf:dc83:: with SMTP id r3mr9028702wrj.53.1613736555979;
 Fri, 19 Feb 2021 04:09:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxw/T3ZfMjUCs4n5WYSN6vBdrm/b7SQb17yJe6mqRiyTZfFmy9E3rQEwsMtWD3AILPt2bfV/g==
X-Received: by 2002:adf:dc83:: with SMTP id r3mr9028654wrj.53.1613736555703;
 Fri, 19 Feb 2021 04:09:15 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o129sm11997743wme.21.2021.02.19.04.09.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 04:09:15 -0800 (PST)
Subject: Re: [PATCH 0/7] hw/kvm: Exit gracefully when KVM is not supported
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210219114428.1936109-1-philmd@redhat.com>
 <CAFEAcA_66DuWfrftpaodqBZwBhS-VOD9uH=KwvGYC_VcksVFAA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f0677f28-9b1a-eac6-c160-a8db13606216@redhat.com>
Date: Fri, 19 Feb 2021 13:09:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_66DuWfrftpaodqBZwBhS-VOD9uH=KwvGYC_VcksVFAA@mail.gmail.com>
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
Cc: Radoslaw Biernacki <rad@semihalf.com>, kvm-devel <kvm@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Thomas Huth <thuth@redhat.com>, Leif Lindholm <leif@nuviainc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 12:55 PM, Peter Maydell wrote:
> On Fri, 19 Feb 2021 at 11:44, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>> This series aims to improve user experience by providing
>> a better error message when the user tries to enable KVM
>> on machines not supporting it.
> 
> Thanks for having a look at this; fixing the ugly assertion
> failure if you try to enable KVM for the raspi boards has
> been vaguely on my todo list but never made it up to the top...

The other one annoying was the xlnx-zcu102 when creating
the Cortex-R cores.

>> Philippe Mathieu-Daudé (7):
>>   accel/kvm: Check MachineClass kvm_type() return value
>>   hw/boards: Introduce 'kvm_supported' field to MachineClass
>>   hw/arm: Set kvm_supported for KVM-compatible machines
>>   hw/mips: Set kvm_supported for KVM-compatible machines
>>   hw/ppc: Set kvm_supported for KVM-compatible machines
>>   hw/s390x: Set kvm_supported to s390-ccw-virtio machines
>>   accel/kvm: Exit gracefully when KVM is not supported
> 
> Don't we also need to set kvm_supported for the relevant
> machine types in hw/i386 ?

Lol, clearly a parapraxis =)

I'll send it as 8/7 until I get more review comments for a
v2 (in particular on the PPC patch):

-- >8 --
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 6329f90ef90..da895aa051d 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1218,6 +1218,7 @@ static void x86_machine_class_init(ObjectClass
*oc, void *data)
     mc->cpu_index_to_instance_props = x86_cpu_index_to_props;
     mc->get_default_cpu_node_id = x86_get_default_cpu_node_id;
     mc->possible_cpu_arch_ids = x86_possible_cpu_arch_ids;
+    mc->kvm_supported = true;
     x86mc->compat_apic_id_mode = false;
     x86mc->save_tsc_khz = true;
     nc->nmi_monitor_handler = x86_nmi;
---

Regards,

Phil.


