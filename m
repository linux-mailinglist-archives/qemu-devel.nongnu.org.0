Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8234768E01E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 19:34:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPSnp-0001wS-Tr; Tue, 07 Feb 2023 13:34:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPSnn-0001nq-VR
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:34:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPSnm-0006dt-5W
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:34:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675794885;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XW+wzR5ZNUMCvWZmmeSXXJF+62TYtLDnQdaQYPCCpTw=;
 b=aIPC6b50B5Wu7VpN40IdZiZKvq/ietB+mildmoLTIdXzt0d513srynaEdWmViwq4miKvJQ
 IDVMsRwU4UgeOlqYZ5/MEkJwe/kNRW+JSVHzyGJHGmcaEbbaiF95XLsWQa5uy7C+VGuTK5
 fFdQU0RGF6xzo20glnqYEAwERJeAfuc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-KTKJjh2LOuW4Fan4NySaZw-1; Tue, 07 Feb 2023 13:34:43 -0500
X-MC-Unique: KTKJjh2LOuW4Fan4NySaZw-1
Received: by mail-wm1-f71.google.com with SMTP id
 j20-20020a05600c1c1400b003dc5dd44c0cso7608756wms.8
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 10:34:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XW+wzR5ZNUMCvWZmmeSXXJF+62TYtLDnQdaQYPCCpTw=;
 b=AUBiV8hHV5LefyUVa/B4yvdnJQonlLp6ro+2Jgup7eEvtqmocXpxHgBNy5W0NDGW8A
 0N59QsQYjhdD+q5FypJRzoZICfPULRYhCJNkwFt4/XF2WF+ERrw8J5ZYGLYVYHU/RSIa
 1gl/JXrJ+EuZJZxZFuv+FkE6I8ZSR7acRhEYMpZMQdZ0TSsX2YhuLrOlArbHynLjXW12
 F0L3hz/W8o4CLAnDwjkdnNWTFjhUF1PwWS4ECtDpBVFlmZ2KhtKMJ1mzX6q1jE5fCaKs
 KAvFJ/JAQolP1RD/CdqnHSGS0Yc6TxNytJqA1rHo5evnziMZyfKQVwxsgshxakQedFdR
 /qfQ==
X-Gm-Message-State: AO0yUKX0KjnhsBT/tnpnYhgAesRf9FoN3cd14CDy5ZI1qAgPoi9LJwrZ
 wQwnXRH2dh1JrxgD0mNWzNpg+/+CxDOOWozznExJYRtCktPzIIw6mGasns/+tXDOZOWie501ahm
 aQZpF3BUdf1Yl8AEKeRwWnFU=
X-Received: by 2002:adf:efce:0:b0:2c3:db9e:4afe with SMTP id
 i14-20020adfefce000000b002c3db9e4afemr3569042wrp.60.1675794882373; 
 Tue, 07 Feb 2023 10:34:42 -0800 (PST)
X-Google-Smtp-Source: AK7set94C+6r1Zju3S/ZP4PKyi8B4tS7qnFg5H8ZHntmselXNf4Rgsusx11Y/N4L7hgiQx8fHHUeRA==
X-Received: by 2002:adf:efce:0:b0:2c3:db9e:4afe with SMTP id
 i14-20020adfefce000000b002c3db9e4afemr3569019wrp.60.1675794882142; 
 Tue, 07 Feb 2023 10:34:42 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 a4-20020a5d5084000000b002c3db0eec5fsm10104247wrt.62.2023.02.07.10.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 10:34:41 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Eduardo Habkost <eduardo@habkost.net>,
 qemu-trivial@nongnu.org,  BALATON Zoltan <balaton@eik.bme.hu>,  Laurent
 Vivier <lvivier@redhat.com>,  Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,  Igor
 Mammedov <imammedo@redhat.com>,  Ani Sinha <ani@anisinha.ca>,  "Dr. David
 Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 8/9] hw/i386/x86: Make TYPE_X86_MACHINE the owner of
 smram
In-Reply-To: <CAG4p6K4woqhr2ZxyV6MbehASDXVB9=ssTzHrPMEB=0N+c3P3Yw@mail.gmail.com>
 (Bernhard Beschow's message of "Tue, 7 Feb 2023 16:17:56 +0100")
References: <20230204151027.39007-1-shentey@gmail.com>
 <20230204151027.39007-9-shentey@gmail.com>
 <10bf125e-85a4-72cc-07de-0d6206941f62@linaro.org>
 <87h6vzcdlb.fsf@secure.mitica>
 <CAG4p6K4woqhr2ZxyV6MbehASDXVB9=ssTzHrPMEB=0N+c3P3Yw@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 07 Feb 2023 19:34:40 +0100
Message-ID: <87h6vxnx33.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Bernhard Beschow <shentey@gmail.com> wrote:
v> On Mon, Feb 6, 2023 at 11:06 AM Juan Quintela <quintela@redhat.com> wrot=
e:
>
>> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
>> > On 4/2/23 16:10, Bernhard Beschow wrote:
>> >> Treat the smram MemoryRegion analoguous to other memory regions such =
as
>> >> ram, pci, io, ... , making the used memory regions more explicit when
>> >> instantiating q35 or i440fx.
>> >> Note that the q35 device uses these memory regions only during the
>> >> realize phase which suggests that it shouldn't be the owner of smram.
>> >
>> > Few years ago I tried something similar and it wasn't accepted because
>> > the MR owner name is used in the migration stream, so this was breaking
>> > migrating from older machines.
>>
>> I don't remember the details O:-)
>>
>> Migration code, really depends on RAMBlocks names, not memory region
>> names.  But as far as I remember, that don't matter too much because the
>> memory region names ends tangled quite a bit with the RAMBlock name, rig=
ht?
>>
>> > Adding David/Juan for double-checking that.
>>
>>     trace_vmstate_save(se->idstr, se->vmsd ? se->vmsd->name : "(old)");
>>
>> You can try to enable this trace and see that every section has the same
>> name with and without your change (i.e. that memory region name is not
>> seen by the migration stream).
>>
>> But that is the only help that I can came with.
>>
>> The code that you are changing (smram) is something that I don't know
>> about to give you more help.
>>
>> Looking at the patch, it looks that the name was before and now the
>> "sram", so perhaps it could help.  But I don't know.
>>
>> In the i440fx you say that you only use it until realize, so you should
>> be safe.
>>
>> For q35, it is not clear to me.
>>
>> If the trace don't show new names, I will just try:
>> - migrate a i440fx machine from binary without your patch to one with
>>   your patch
>> - the same for q35.
>>
>> And depending on the result, we can go from there.
>>
>
> Thanks for the pointers, Juan!
>
> I took some inspiration and created four migration files,
> {pc,q35}-{before,after}.mig by running `qemu-system-x86_64 -M {pc,q35} -S`
> with qemu built from master and from my branch. Then I basically ran
>  `./scripts/analyze-migration.py -d desc -f *.mig > *.json` on the four
> files and compared the diffs. Both diffs were empty. AFAIU this proves th=
at
> there is no binary change, right?

We have two options here:
- you are right (my opinion)
- you got a bug in analyze-migration.py script and you have a new job.

But I think you can send this patch.

Later, Juan.

> Best regards,
> Bernhard
>>
>>
>> Later, Juan.
>>
>>


