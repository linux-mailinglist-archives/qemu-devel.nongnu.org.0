Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3441E68E385
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 23:44:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPWgO-00014g-RA; Tue, 07 Feb 2023 17:43:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pPWgK-00013Q-Og; Tue, 07 Feb 2023 17:43:21 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pPWgI-0001KL-Od; Tue, 07 Feb 2023 17:43:20 -0500
Received: by mail-ej1-x631.google.com with SMTP id jg8so7085544ejc.6;
 Tue, 07 Feb 2023 14:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CLNU6zUWL8XdhKLFhPtLqoqW2DVP6mUKKflRHEJsQ3c=;
 b=NMkZMl0U5DZ/olbz0LymS8Nl4Cyuzxo4NUXEgPBInDfI2i2oeWdqyoFIoM52PN4Ry4
 doWVdpKhTgAPjH8H5hTvsP6RpsxTsIHFdPu9I/p4gcBoGROB0w2iVrO6vEEyXXOMMhEm
 utyR4S4HDXPnZBO2k3vAEFhVRjZw9i0y4KPzc2u1jeqzVSByNtAyRuT64SxXaOe35uCy
 p8aBRkmWtrx6UxsGh7RMdDJW4qGQ5dTLYtMmBHg7brVHM+oIBCVOFiiWm9kPVu7y1ebH
 I69Qwi3HUR6BsaHE3GKQobvE4LCK0ZYyccQeQAuPmF95Ogu5HeybYKpLiII4gYZqFZOd
 dWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CLNU6zUWL8XdhKLFhPtLqoqW2DVP6mUKKflRHEJsQ3c=;
 b=75piO+67dGlW9jcZj7s45SC0tmrmjzkCkkCC96Db7Xj0d1ruGTara00/OVOnnX9Nif
 I3nL+8ZrOr0MyNKhcf9fUb8qAJ80NIhWrUHK3dCxNumdY+J7uj0tyaolcW3RlvR//V0r
 SnR2p3sOrj9w2NUT2TyVraHO9Bqi0syvtRjNWxtGkXNQBxrfYC8MvUUOv+Igen0hU+lT
 zrcNrtIiUMitMu2uX1Fhl9vq0zf3J4u52NLuWcc7xMfN348/NxG9HL3BdYyN9FEo+DdY
 HAufscKJW0dABJkMAhEXYooz3BgktX80Ow7MDSy3j1d7POADqv/XruxeKBhmcpmxxdQ9
 riqA==
X-Gm-Message-State: AO0yUKXACLOGApWK1hEW+VN9yXPeKw7EKqgbFoymcauvozwOBhohhdH8
 sIQMIiCgNQZMS4M4sQisfAM=
X-Google-Smtp-Source: AK7set9mybFk74HrnHAJRyUBULMJ1B/PSAgLCZOPFLpjYOQWMoKa8yPsagx246MSHRH3pGsfAVNG3g==
X-Received: by 2002:a17:906:e0c9:b0:84d:4394:e8e with SMTP id
 gl9-20020a170906e0c900b0084d43940e8emr5110096ejb.41.1675809794042; 
 Tue, 07 Feb 2023 14:43:14 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-014-074-246.89.14.pool.telefonica.de.
 [89.14.74.246]) by smtp.gmail.com with ESMTPSA id
 fd8-20020a056402388800b004a245350e0fsm7056780edb.36.2023.02.07.14.43.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 14:43:13 -0800 (PST)
Date: Tue, 07 Feb 2023 22:43:06 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: quintela@redhat.com, Juan Quintela <quintela@redhat.com>
CC: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_8/9=5D_hw/i386/x86=3A_Make?=
 =?US-ASCII?Q?_TYPE=5FX86=5FMACHINE_the_owner_of_smram?=
In-Reply-To: <87h6vxnx33.fsf@secure.mitica>
References: <20230204151027.39007-1-shentey@gmail.com>
 <20230204151027.39007-9-shentey@gmail.com>
 <10bf125e-85a4-72cc-07de-0d6206941f62@linaro.org>
 <87h6vzcdlb.fsf@secure.mitica>
 <CAG4p6K4woqhr2ZxyV6MbehASDXVB9=ssTzHrPMEB=0N+c3P3Yw@mail.gmail.com>
 <87h6vxnx33.fsf@secure.mitica>
Message-ID: <99607654-0527-42CD-8EB1-CE3550C74FD9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 7=2E Februar 2023 18:34:40 UTC schrieb Juan Quintela <quintela@redhat=
=2Ecom>:
>Bernhard Beschow <shentey@gmail=2Ecom> wrote:
>v> On Mon, Feb 6, 2023 at 11:06 AM Juan Quintela <quintela@redhat=2Ecom> =
wrote:
>>
>>> Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg> wrote:
>>> > On 4/2/23 16:10, Bernhard Beschow wrote:
>>> >> Treat the smram MemoryRegion analoguous to other memory regions suc=
h as
>>> >> ram, pci, io, =2E=2E=2E , making the used memory regions more expli=
cit when
>>> >> instantiating q35 or i440fx=2E
>>> >> Note that the q35 device uses these memory regions only during the
>>> >> realize phase which suggests that it shouldn't be the owner of smra=
m=2E
>>> >
>>> > Few years ago I tried something similar and it wasn't accepted becau=
se
>>> > the MR owner name is used in the migration stream, so this was break=
ing
>>> > migrating from older machines=2E
>>>
>>> I don't remember the details O:-)
>>>
>>> Migration code, really depends on RAMBlocks names, not memory region
>>> names=2E  But as far as I remember, that don't matter too much because=
 the
>>> memory region names ends tangled quite a bit with the RAMBlock name, r=
ight?
>>>
>>> > Adding David/Juan for double-checking that=2E
>>>
>>>     trace_vmstate_save(se->idstr, se->vmsd ? se->vmsd->name : "(old)")=
;
>>>
>>> You can try to enable this trace and see that every section has the sa=
me
>>> name with and without your change (i=2Ee=2E that memory region name is=
 not
>>> seen by the migration stream)=2E
>>>
>>> But that is the only help that I can came with=2E
>>>
>>> The code that you are changing (smram) is something that I don't know
>>> about to give you more help=2E
>>>
>>> Looking at the patch, it looks that the name was before and now the
>>> "sram", so perhaps it could help=2E  But I don't know=2E
>>>
>>> In the i440fx you say that you only use it until realize, so you shoul=
d
>>> be safe=2E
>>>
>>> For q35, it is not clear to me=2E
>>>
>>> If the trace don't show new names, I will just try:
>>> - migrate a i440fx machine from binary without your patch to one with
>>>   your patch
>>> - the same for q35=2E
>>>
>>> And depending on the result, we can go from there=2E
>>>
>>
>> Thanks for the pointers, Juan!
>>
>> I took some inspiration and created four migration files,
>> {pc,q35}-{before,after}=2Emig by running `qemu-system-x86_64 -M {pc,q35=
} -S`
>> with qemu built from master and from my branch=2E Then I basically ran
>>  `=2E/scripts/analyze-migration=2Epy -d desc -f *=2Emig > *=2Ejson` on =
the four
>> files and compared the diffs=2E Both diffs were empty=2E AFAIU this pro=
ves that
>> there is no binary change, right?
>
>We have two options here:
>- you are right (my opinion)
>- you got a bug in analyze-migration=2Epy script and you have a new job=
=2E

I take option one ;)

>But I think you can send this patch=2E

The patches still need reviews=2E

Best regards,
Bernhard
>
>Later, Juan=2E
>
>> Best regards,
>> Bernhard
>>>
>>>
>>> Later, Juan=2E
>>>
>>>
>

