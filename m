Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C863A34248C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 19:23:00 +0100 (CET)
Received: from localhost ([::1]:57644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNJlz-0002t5-Ky
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 14:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lNJjn-0001kT-NF
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 14:20:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lNJjb-0006Xb-Vv
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 14:20:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616178028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=faTYSP/t+ovCIyqIc6HV+2bx5Hlf2FmGaq1G0lho9KE=;
 b=bAC8EEoNI9WoaWVF1N14h1HmsTNcYW0osNTPdFpNp7O2y8t7hTh05NGfoPXFwoLsDIoySW
 A4meJQmt8HgcxPkIdNYUVaBXX0/JzIxiPGgQ0SEWBPnqF03+gk54DNtSfKBv1QC06KewSw
 6I0fO4SrZiJHbH95vsAXP6mdz5o28UM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-kENLWnfAOUm5jxiX0mHsXQ-1; Fri, 19 Mar 2021 14:20:26 -0400
X-MC-Unique: kENLWnfAOUm5jxiX0mHsXQ-1
Received: by mail-wr1-f72.google.com with SMTP id r6so8935781wrt.20
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 11:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=faTYSP/t+ovCIyqIc6HV+2bx5Hlf2FmGaq1G0lho9KE=;
 b=oIyFuJlzaqY4NdJA978ZIvnoG36JWp8BnUSQWjTum3jUkbykcdzTwAfXyn1UwDN04Y
 dwwAoFOJokyq2mZezXBSpAkwTMtSGa6RdaVESgCc8BmKPRdBOYcEde/scfJwNfP7i0v0
 9H00qT1PFTVsbqhfP9F/dFWS1IdM8PRW+meeCalVFRizKWHaLDWmXBblGRMzcilo7c4E
 +JiLKcdIcdBKMLtp2dklt6afk7larsM4mSy75h0Nj1e7kRxxcmp9iBt0RBlSex84pVRc
 8QBUXbWxtZ8t10qbeyFvrsurBrvvTaTpLN/0K8TY42dPrFQmv13eKYQycpGrcfCl0OyC
 xv0g==
X-Gm-Message-State: AOAM531WPeW+98aALogSRwQeGtE134nL4+zexmDYfgpASiL9w/bFcCQZ
 /dpvD6DZeUM91EqCNGkMKHS6T7mZfsponVyR1+8EP3hneYkFU/oBqiK2LHt6F5CO13gi99B2g/z
 /DjMEJm1UCoxAz/s=
X-Received: by 2002:a1c:b789:: with SMTP id h131mr4924484wmf.106.1616178025460; 
 Fri, 19 Mar 2021 11:20:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjw/uCELJh/RIVn2N4S+gXHovdyyIq9m5vtmoR315iZHJ5j3xu2xYzXUloB/XErb/WQrPxeg==
X-Received: by 2002:a1c:b789:: with SMTP id h131mr4924471wmf.106.1616178025259; 
 Fri, 19 Mar 2021 11:20:25 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id a131sm7631660wmc.48.2021.03.19.11.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 11:20:24 -0700 (PDT)
Date: Fri, 19 Mar 2021 19:20:22 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PULL 18/76] optionrom: add new PVH option rom
Message-ID: <20210319182022.veha5gbcg3p4idgk@steredhat>
References: <1549390526-24246-1-git-send-email-pbonzini@redhat.com>
 <1549390526-24246-19-git-send-email-pbonzini@redhat.com>
 <e3d925e6-a48e-07b9-6418-05c5a4d2cd36@redhat.com>
 <f33bf6fa-1fa3-4e33-bd8e-843bec2d5638@redhat.com>
 <20210319173524.rnrxslpmdjck6uxv@steredhat>
 <CABgObfZHP1aSMpbdWh6TwCN_D5gy5TS5+Q7-La8d7E5czvn7Rg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABgObfZHP1aSMpbdWh6TwCN_D5gy5TS5+Q7-La8d7E5czvn7Rg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 19, 2021 at 06:52:39PM +0100, Paolo Bonzini wrote:
>It's likely that the compiler will online it. But indeed it's better to add
>-minline-all-stringops to the compiler command line.
>

Cool, I didn't know that one!
I tried but I did something wrong because the linker is not happy, next 
week I'll check better:
ld: pvh_main.o: in function `search_rsdp':
/home/stefano/repos/qemu/pc-bios/optionrom/pvh_main.c:62: undefined reference to `memcmp'
ld: /home/stefano/repos/qemu/pc-bios/optionrom/pvh_main.c:62: undefined reference to `memcmp'


In the mean time, I simply tried to assign the RSDP_SIGNATURE macro to 
an uint64_t variable and I have this new warning, using gcc 10.2.1 "cc 
(Alpine 10.2.1_pre2) 10.2.1 20210313":

In file included from /tmp/qemu-test/src/pc-bios/optionrom/pvh_main.c:25:
/tmp/qemu-test/src/pc-bios/optionrom/pvh_main.c: In function 'search_rsdp':
/tmp/qemu-test/src/pc-bios/optionrom/pvh_main.c:30:42: warning: conversion from 'long long unsigned int' to 'uint64_t' {aka 'long unsigned int'} changes value from '2329016660419433298' to '541348690' [-Woverflow]
    30 | #define RSDP_SIGNATURE          UINT64_C(0x2052545020445352) /* "RSD PTR " */
       |                                          ^~~~~~~~~~~~~~~~~~
/tmp/qemu-test/src/pc-bios/optionrom/pvh_main.c:69:31: note: in expansion of macro 'RSDP_SIGNATURE'
    69 |     uint64_t rsdp_signature = RSDP_SIGNATURE;
       |

Using gcc (GCC) 10.2.1 20201125 (Red Hat 10.2.1-9) I don't have it.

It seems a bit strange, I don't know if it's related to the fact that we 
compile with -m16, I'll check better.

Thanks,
Stefano

>Paolo
>
>Il ven 19 mar 2021, 18:35 Stefano Garzarella <sgarzare@redhat.com> ha
>scritto:
>
>> On Fri, Mar 19, 2021 at 06:03:59PM +0100, Paolo Bonzini wrote:
>> >On 19/03/21 15:06, Philippe Mathieu-Daudé wrote:
>> >>>+
>> >>>+/* Search RSDP signature. */
>> >>>+static uintptr_t search_rsdp(uint32_t start_addr, uint32_t end_addr)
>> >>>+{
>> >>>+    uint64_t *rsdp_p;
>> >>>+
>> >>>+    /* RSDP signature is always on a 16 byte boundary */
>> >>>+    for (rsdp_p = (uint64_t *)start_addr; rsdp_p < (uint64_t
>> *)end_addr;
>> >>>+         rsdp_p += 2) {
>> >>>+        if (*rsdp_p == RSDP_SIGNATURE) {
>> >>>+            return (uintptr_t)rsdp_p;
>> >>>+        }
>> >>>+    }
>> >>>+
>> >>>+    return 0;
>> >>>+}
>> >>gcc 10.2.1 "cc (Alpine 10.2.1_pre2) 10.2.1 20210313" reports:
>> >>
>> >>pc-bios/optionrom/pvh_main.c: In function 'search_rsdp':
>> >>pc-bios/optionrom/pvh_main.c:61:21: warning: comparison is always false
>> >>due to limited range of data type [-Wtype-limits]
>> >>    61 |         if (*rsdp_p == RSDP_SIGNATURE) {
>> >>       |                     ^~
>> >
>> >This is probably a different bug, but I'll also add that uint64_t is
>> >supposed to be aligned to 64 bits, so you need either
>> >__attribute__((packed)), or use char* and memcmp.  If you go for the
>> >latter, it would fix the issue that Philippe is reporting.
>>
>> Yes, memcmp maybe is also more readable, but being baremetal, I have to
>> implement it right?
>>
>> Thanks,
>> Stefano
>>
>>


