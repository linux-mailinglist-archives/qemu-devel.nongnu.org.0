Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F291B581C13
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 00:25:36 +0200 (CEST)
Received: from localhost ([::1]:46936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGSzf-0006H7-RN
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 18:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oGSxw-0004fO-NZ
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 18:23:48 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:44840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oGSxu-0006eF-6f
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 18:23:47 -0400
Received: by mail-ej1-x635.google.com with SMTP id ss3so28429573ejc.11
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 15:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:user-agent:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=P2ZuyMuzEnpOKdZuGHMsiPuMOJF+8fDSk6ydo8CgunQ=;
 b=EcnzXnvCUwQLRxtliAgfCad5cQBvIKWa2A74h85WcoizqN9Rh7Khp6pfoi3xjnVxoC
 HFqRdkkkZK7Lafd5ABztx+O9tM+3dOfb0p2Pa6MV0YpoZfLN5iZVtRXMwIKdCFqSbJ1v
 T7/rHhFl1hbEoAJINx3sPj2mVvfkVxikpuxqKvWEuzC9HZnz1tN/jmynfRVSPeb9uNNo
 o5PIp2ODTkaAx9GB9YvvEApQ8zT0Pl4nh1GDnH/d9uasSejsH1ld7xY/Z8IfyohUh27E
 QfBkNJcSOpTP9chTPMlKL1Pmm28aRXpXqnq6MRquAsq1bEDnwf35uvo3WFYotMthVCAd
 iABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
 :references:message-id:mime-version:content-transfer-encoding;
 bh=P2ZuyMuzEnpOKdZuGHMsiPuMOJF+8fDSk6ydo8CgunQ=;
 b=kIFWXXr+TaC3yW1au8tyvfJsxJpWoxjAGced3iGcYeKIDN2OMzyENmrAnFkHvJCYmO
 kmhpMKZvZGUnxjMHJ/fV2CpvKRVlhE3rlhARsFWQjwwCUpiMwe/zsfb/tIHRWdfQHZod
 CFYrAy9B5GeG5cQ6ZVP4+ktHMxw71ePZEk6QfXdZ4jggSeyQkTx4a4EdoG+wHoeqdrPg
 Xn1J1X9oPvctUZJJ3NXgTuVuXclDb+MJwVT8Kgf7gMkz2ffNgAfyIV10yTRtnFt5hJM0
 LM95396Av+bEqMQp4x2LkyF+VSFv6rE6nH3uPKr5X8b6Y9BMr0a7IHBpJ8yyBPBB5TzD
 Axmw==
X-Gm-Message-State: AJIora/KIobEDaNMp6QOMBEvKa2CFb/n5LHMuBkHupXti3vEg16RE0SV
 MNmiQ9zoddojhQ3zM5jE8ik=
X-Google-Smtp-Source: AGRyM1soWs2IL//AV4Gzmy5zgsoBlyNIyI+yuI9nPCDT3W8x85asu/QiCJlXK2pbs6tzP46A7Bssag==
X-Received: by 2002:a17:907:270b:b0:72b:1418:f3dc with SMTP id
 w11-20020a170907270b00b0072b1418f3dcmr15825511ejk.748.1658874223667; 
 Tue, 26 Jul 2022 15:23:43 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-183-089-244.77.183.pool.telefonica.de.
 [77.183.89.244]) by smtp.gmail.com with ESMTPSA id
 1-20020a170906218100b0072af7566927sm7022742eju.13.2022.07.26.15.23.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 15:23:43 -0700 (PDT)
Date: Wed, 27 Jul 2022 00:23:38 +0200
From: BB <shentey@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 00/11] QOM'ify PIIX3 southbridge
User-Agent: K-9 Mail for Android
In-Reply-To: <20220726105147-mutt-send-email-mst@kernel.org>
References: <20220713081735.112016-1-shentey@gmail.com>
 <20220726105147-mutt-send-email-mst@kernel.org>
Message-ID: <B5DB8938-0DF4-47F2-B848-8F5F70B423E7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 26=2E Juli 2022 16:53:03 MESZ schrieb "Michael S=2E Tsirkin" <mst@redha=
t=2Ecom>:
>On Wed, Jul 13, 2022 at 10:17:24AM +0200, Bernhard Beschow wrote:
>> Similar to PIIX4 this series QOM'ifies internal device creation for PII=
X3=2E
>> This reduces the delta between the implementations of PIIX3 and PIIX4 a=
nd
>> therefore might allow to merge both implementations in the future=2E
>>=20
>> There were two challenges in this series:
>>=20
>> First, QEMU considers the ACPI and USB functions to be optional in PIIX=
3=2E
>> When instantiating those with object_initialize_child(), they need to b=
e
>> unparented in the realize function to prevent an assertion (see respect=
ive
>> commit messages)=2E
>>=20
>> Second, the PIC used to be instantiated outside of the southbridge whil=
e
>> some sub functions require a PIC with populated qemu_irqs=2E This has b=
een
>> solved by introducing a proxy PIC which furthermore allows PIIX3 to be
>> agnostic towards the virtualization technology used (KVM, TCG, Xen)=2E
>
>Thanks!
>I think it's best to merge this after the 7=2E1 release=2E
>I'll tag this but if possible pls also ping me after the release
>to make sure I don't forget=2E Thanks!

Sure!
I'm extending the scope of this series to go all the way to consolidate th=
e piix 3 + 4 southbridges which is why I didn't post a v2 yet=2E The extend=
ed series will also address Peter's comments=2E

Thanks,
Bernhard

P=2ES=2E:
I've got a working POC where PIIX4 rather than PIIX3 is used in the "pc" m=
achine which also supports KVM accelleration: https://github=2Ecom/shentok/=
qemu/commits/pc-piix4

>
>> Testing done:
>> * make check
>> * make check-avocado
>> * Boot live CD:
>>   * qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom manjaro-=
kde-21=2E3=2E2-220704-linux515=2Eiso
>>   * qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom manjaro=
-kde-21=2E3=2E2-220704-linux515=2Eiso
>>=20
>> Bernhard Beschow (11):
>>   hw/i386/pc: QOM'ify DMA creation
>>   hw/i386/pc_piix: Allow for setting properties before realizing PIIX3
>>     southbridge
>>   hw/isa/piix3: QOM'ify USB controller creation
>>   hw/isa/piix3: QOM'ify ACPI controller creation
>>   hw/i386/pc: QOM'ify RTC creation
>>   hw/i386/pc: No need for rtc_state to be an out-parameter
>>   hw/intc/i8259: Introduce i8259 proxy "isa-pic"
>>   hw/isa/piix3: QOM'ify ISA PIC creation
>>   hw/isa/piix3: QOM'ify IDE controller creation
>>   hw/isa/piix3: Wire up ACPI interrupt internally
>>   hw/isa/piix3: Remove extra ';' outside of functions
>>=20
>>  hw/i386/Kconfig               |  1 -
>>  hw/i386/pc=2Ec                  | 17 ++++---
>>  hw/i386/pc_piix=2Ec             | 70 ++++++++++++++++-------------
>>  hw/i386/pc_q35=2Ec              |  3 +-
>>  hw/intc/i8259=2Ec               | 27 +++++++++++
>>  hw/isa/Kconfig                |  1 +
>>  hw/isa/lpc_ich9=2Ec             | 11 +++++
>>  hw/isa/piix3=2Ec                | 84 ++++++++++++++++++++++++++++++++-=
--
>>  include/hw/i386/ich9=2Eh        |  2 +
>>  include/hw/i386/pc=2Eh          |  2 +-
>>  include/hw/intc/i8259=2Eh       | 14 ++++++
>>  include/hw/southbridge/piix=2Eh | 16 ++++++-
>>  12 files changed, 201 insertions(+), 47 deletions(-)
>>=20
>> --=20
>> 2=2E37=2E1
>>=20
>

