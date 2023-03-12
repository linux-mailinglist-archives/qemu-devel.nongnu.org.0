Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8776B6C0C
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 23:48:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbUSZ-00060C-Ro; Sun, 12 Mar 2023 18:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pbUSX-0005zV-S7
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 18:46:33 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pbUSV-0004vJ-FY
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 18:46:33 -0400
Received: by mail-ed1-x52f.google.com with SMTP id o12so41689482edb.9
 for <qemu-devel@nongnu.org>; Sun, 12 Mar 2023 15:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678661190;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qxxg+yMSmQOYh3KX1jXi8BFj1dKDUZyFIxwuTPFPlaE=;
 b=JSVqcgfhDMXFrv3CEfgWjaaLyMLk5b44fkL7SYTWTEETR8E61gLU2pe5efUznA6CB3
 AakuoNvvZqSFTuW+VER5sUyxh4HinuQRaK5uN4ao11gsI1TYwpojfkocZqvcOfZK0/v/
 8/eeUcwkpwMHQT+McCzzaHZYIFkJLdQy4YooZVZXp82jL8QKUsbJP+olc/DYNrbc1S71
 GMhv2K2nGPsHdxo1Z7poSQ1PXQgk/6pKrseLfpdh+hzm1S9XACyAum2uucM6LcAmn2oO
 KR7I2OUNPUBMp6USCfVzb7iOUFGAojQkHAajsL/2VfwSoRiQ2AS0cKsFhSCbPu0OHTfV
 2Ong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678661190;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qxxg+yMSmQOYh3KX1jXi8BFj1dKDUZyFIxwuTPFPlaE=;
 b=4ZYWZrVyAz6XEK1KQSGB1bwmx/+7IsIL430om5lRZd4GZXVUFIe0FTjF+e0TZMa0rk
 lWHge0jlRxe72LDduQvDuAe4nE+MSu5UNMF+GCnpeKu8AooWeQsVILi7U44VZCGqcacd
 9ICC1qX8swTeWm5WI+i//zqjFCZvFvkpVzw79RZfcV1DNSpq3krMQgxyPwXnRO1GDBmi
 BeZQ4InNiFixr8984GjmBTrB64poEMzstfgqGas2H1EBp9gJ+SkdMHVmWvhDchwUvOvJ
 anZpfcrE8xF+AB6F2Ii+fYli6QGn4l1RTUhxnT/IyBmLN7OpcZehgqg1+5ykwX99qfuQ
 03LQ==
X-Gm-Message-State: AO0yUKVd96xo6dcI7WjRf8IKkpXSrp0JA66duDMY2PltSyXgIBGUVkw+
 V0fUgpdtxeztTSfZ/+dOpcE=
X-Google-Smtp-Source: AK7set/xsFZ4RBNWkegWu0Pjo20Mag59ZycQ/FBq97AZcGItLDQDr1d7yFXtW76bHSRJP/21JssInA==
X-Received: by 2002:a17:906:b007:b0:8aa:c038:974c with SMTP id
 v7-20020a170906b00700b008aac038974cmr32473011ejy.54.1678661189735; 
 Sun, 12 Mar 2023 15:46:29 -0700 (PDT)
Received: from [127.0.0.1] ([77.13.79.143]) by smtp.gmail.com with ESMTPSA id
 b22-20020a170906709600b008c06de45e75sm2689035ejk.107.2023.03.12.15.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Mar 2023 15:46:29 -0700 (PDT)
Date: Sun, 12 Mar 2023 22:46:22 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Chuck Zmudzinski <brchuckz@aol.com>
CC: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
In-Reply-To: <e79db0b0-8d35-91b7-1d60-8670c6594ef7@aol.com>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230118051230-mutt-send-email-mst@kernel.org>
 <Y9ADQ/Yu8QQD0oyD@perard.uk.xensource.com>
 <0C2B1FE4-BB48-4C38-9161-6569BA1D6226@gmail.com>
 <96A4863B-D6BA-48B5-B5E4-54DD103FEBAA@gmail.com>
 <6C8AA4D4-FF57-4E43-A464-7F64C576ED5B@gmail.com>
 <c20b7056-037d-67ff-0b2d-ea931d501bac@aol.com>
 <FD7FF486-D06D-4CC1-8618-13B4138596B2@gmail.com>
 <e79db0b0-8d35-91b7-1d60-8670c6594ef7@aol.com>
Message-ID: <06039976-94E0-4487-8854-C8F9E978422D@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
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



Am 12=2E M=C3=A4rz 2023 21:02:03 UTC schrieb Chuck Zmudzinski <brchuckz@ao=
l=2Ecom>:
>On 3/12/23 5:22=E2=80=AFAM, Bernhard Beschow wrote:
>>=20
>>=20
>> Am 11=2E M=C3=A4rz 2023 22:20:29 UTC schrieb Chuck Zmudzinski <brchuckz=
@aol=2Ecom>:
>>>On 2/9/2023 4:53 PM, Bernhard Beschow wrote:
>>>> Am 1=2E Februar 2023 08:11:10 UTC schrieb Bernhard Beschow <shentey@g=
mail=2Ecom>:
>>>> >
>>>> >
>>>> >Am 24=2E Januar 2023 17:07:30 UTC schrieb Bernhard Beschow <shentey@=
gmail=2Ecom>:
>>>> >>
>>>> >>
>>>> >>Am 24=2E Januar 2023 16:11:47 UTC schrieb Anthony PERARD <anthony=
=2Eperard@citrix=2Ecom>:
>>>> >>>On Wed, Jan 18, 2023 at 05:13:03AM -0500, Michael S=2E Tsirkin wro=
te:
>>>> >>>> On Wed, Jan 04, 2023 at 03:44:31PM +0100, Bernhard Beschow wrote=
:
>>>> >>>> > This series first renders TYPE_PIIX3_XEN_DEVICE redundant and =
finally removes
>>>> >>>> > it=2E The motivation is to 1/ decouple PIIX from Xen and 2/ to=
 make Xen in the PC
>>>> >>>> > machine agnostic to the precise southbridge being used=2E 2/ w=
ill become
>>>> >>>> > particularily interesting once PIIX4 becomes usable in the PC =
machine, avoiding
>>>> >>>> > the "Frankenstein" use of PIIX4_ACPI in PIIX3=2E
>>>> >>>>=20
>>>> >>>> Looks ok to me=2E
>>>> >>>> Reviewed-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>>>> >>>>=20
>>>> >>>> Feel free to merge through Xen tree=2E
>>>> >>>
>>>> >>>Hi Bernhard,
>>>> >>
>>>> >>Hi Anthony,
>>>> >>
>>>> >>>The series currently doesn't apply on master=2E And a quick try at
>>>> >>>applying the series it is based on also failed=2E Could you rebase=
 it , or
>>>> >>>maybe you would prefer to wait until the other series "Consolidate
>>>> >>>PIIX=2E=2E=2E" is fully applied?
>>>> >>
>>>> >>Thanks for looking into it!
>>>> >>
>>>> >>You can get the compilable series from https://patchew=2Eorg/QEMU/2=
0230104144437=2E27479-1-shentey@gmail=2Ecom/ =2E If it doesn't work for you=
 let me know, then I can rebase onto master=2E All necessary dependencies f=
or the series are upstreamed meanwhile=2E
>>>> >
>>>> >Ping
>>>>
>>>> Ping^2
>>>
>>>Hi Bernhard,
>>=20
>> Hi Chuck,
>>=20
>>>I took a look at this today to see why it cannot be applied=2E
>>=20
>> Thanks for looking at it!
>>=20
>>>I can see clearly that
>>>all the prerequisite patches have *not* been applied to master yet, so =
I can
>>>understand why Anthony cannot pull this up yet=2E Specifically, the ser=
ies that
>>>consolidates PIIX3 and PIIX4 south bridges is not yet applied, and that=
 is one of
>>>the prerequisites=2E I think you said it was reviewed, but it apparentl=
y never got
>>>pulled up into master=2E
>>=20
>> Correct, the PIIX consolidation series isn't merged yet=2E This series =
currently depends on it to avoid merge conflicts but doesn't need it otherw=
ise=2E Back then I anticipated that the consolidation series would land in =
master soon since it was fully reviewed before this one=2E But that turned =
out not to be the case=2E
>>=20
>> This series depends on some necessary refactoring [1] which I did in th=
e context of PIIX consolidation which is already in master=2E So this serie=
s can easily be rebased onto master and it even simplifies the consolidatio=
n series a bit=2E I'll take this route now and I'll post a v3=2E
>
>Thanks for posting v3, I was at a loss trying to figure out how to merge =
the 30-patch piix
>consolidation series into the master branch=2E

Yeah, the code suffered from bit rod=2E=2E=2E

>I just tested your recent v3 (all 6 patches)
>on top of the current master branch and it works well on my Xen guests, s=
o you can keep my
>Tested-by tag on that patch series!

Thanks!

Best regards,
Bernhard

>
>Kind regards,
>
>Chuck

