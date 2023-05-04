Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A3D6F6588
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 09:11:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puT7h-0002g1-NX; Thu, 04 May 2023 03:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1puT7f-0002fD-HC
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:11:27 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1puT7U-0004it-6v
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:11:27 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-306f9df5269so3228f8f.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 00:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683184274; x=1685776274;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t0Wo3uefcpS5Q1aMl6UD2UN9hB6fkt4MkdHLD0ggN44=;
 b=QSxttezjNZUivm1dvWx6pIIUbEf/6XMXdNs94HHtQ4yvH7X/tkkV+AvZ6yUQL5JaYb
 4WAcS0/GpcNvyRBOEwoZgUZAEvLXPVOXPdWX1XWpOIUAGT/k4edRPSRdYxn6gq2L2wnq
 wO11oeyFbK+vxr+Cgclb+lpG2hDru62dXTB0odHxl90gbcA2ahFefnsQWK86kYkJF4FH
 pEJVPO1DR3cg+mcQO1LFX5hXLq3JQ+2NXOOscfVcrtwkYrv9snoeXI5cb7l+8JluzTMM
 wrpdMryEm/hW8jBvpRu5BnKejEv1dfYhfWX+9KRz8EALZjweM4VWp15Wd5VCxwJkxEOG
 0wFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683184274; x=1685776274;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=t0Wo3uefcpS5Q1aMl6UD2UN9hB6fkt4MkdHLD0ggN44=;
 b=j6tFF2F04YgpmKpqoNUEyAcnd5fmdFodZdLN0LddtxWPE9aLNZjzWc8WoKi6RuI5Ga
 kKJKzBNtMKfW2b2m7J6XCO5piX4Jz7Yie+h3CX6EX963GXSRECGaO8nZK2bxf1Zg21yI
 Xw30Vf8pCIdqu18uQYsNv5R3iXMuQUl/t9loQq+eB0s3iU/8xN7Im204xvQlRHpeHYss
 iXYhU72M7BLatkNO7Dtt31DoRPxx6j1JuXYTOfN+J5iMnhoDF/C8/UgzGZHUAZ3xRzj9
 USi4CFiatc2ZC0KC4R4FOEeFYdBVySa3DLG82oRI/5Kav2vrHPWzslT9IN90KjIo1lw6
 3Akg==
X-Gm-Message-State: AC+VfDztODrNP6FAlg6iytwSHoinzgS7K0H1x63qDBpI7zxcH8UiLdff
 udLKSAw5iIMuwQzz+jkVtljVSg==
X-Google-Smtp-Source: ACHHUZ4cck+7QBymC5S+Tzi32JjgWVQP+k0h9qUASNwGRml8zKfAfLpy9EfiNgMW48bGXg3PwJMsig==
X-Received: by 2002:adf:f147:0:b0:306:2f8e:d259 with SMTP id
 y7-20020adff147000000b003062f8ed259mr1651879wro.57.1683184274242; 
 Thu, 04 May 2023 00:11:14 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002fe522117fdsm35741381wrf.36.2023.05.04.00.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 00:11:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 640411FFBA;
 Thu,  4 May 2023 08:11:13 +0100 (BST)
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-6-alex.bennee@linaro.org>
 <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com>
 <87y1m5s9yl.fsf@linaro.org>
 <5fb214d8-4a54-f896-f23f-fe9e646e4b2d@redhat.com>
 <CAFEAcA-Cfz8CkNeTQodoSitocBmm4ddk25Dq8x=5FiiGvaS34Q@mail.gmail.com>
 <6ed176f9-be38-b4ea-ac90-906cc62c24c4@redhat.com>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-devel@nongnu.org, Laurent Vivier
 <lvivier@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>, Gerd
 Hoffmann <kraxel@redhat.com>, Helge Deller <deller@gmx.de>, Xiaojuan Yang
 <yangxiaojuan@loongson.cn>, Stefan Hajnoczi <stefanha@redhat.com>, Cleber
 Rosa <crosa@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Juan
 Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>, Yoshinori
 Sato <ysato@users.sourceforge.jp>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>, Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Mark
 Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Aurelien Jarno
 <aurelien@aurel32.net>, David Hildenbrand <david@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>, Joel
 Stanley <joel@jms.id.au>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Fabiano Rosas
 <farosas@suse.de>
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
Date: Thu, 04 May 2023 08:09:17 +0100
In-reply-to: <6ed176f9-be38-b4ea-ac90-906cc62c24c4@redhat.com>
Message-ID: <87pm7gsh9q.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


Thomas Huth <thuth@redhat.com> writes:

> On 03/05/2023 20.32, Peter Maydell wrote:
>> On Wed, 3 May 2023 at 18:06, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>>
>>> On 5/3/23 17:35, Alex Benn=C3=A9e wrote:
>>>>> You should select a device only if you cannot even start
>>>>> the machine without --nodefaults.
>>>>
>>>> Which is the case here right? We could skip tests that explicitly
>>>> instantiate a device but these are tests failing with default devices
>>>> the machine tries to instantiate.
>>>
>>> I'm sorry, I meant "select" directives are needed if you cannot even
>>> start the machine *with* --nodefaults.
>>>
>>> Devices that are added *without* --nodefaults should use "imply"
>>> directives instead, as is already the case.
>> Do we really want to build a QEMU that then barfs unless
>> you pass -nodefaults, though ? That doesn't seem very useful.
>> Something somewhere ought to be saying "if you want the
>> virt board then you almost certainly want these". Or
>> alternatively we should fall back to "don't create a
>> network device we don't have", maybe ?
>
> I think we should do the latter. If you compiled without certain
> devices that are used only in the default mode, the board should not
> try to instantiate such devices (since it is also working fine without
> them). Just my 0.02 =E2=82=AC.

So I hand hacked qtest_spawn_qemu with:

    va_start(ap, fmt);
    g_string_append_printf(command, CMD_EXEC "%s %s -nodefaults ",qtest_qem=
u_binary(), tracearg);
    g_string_append_vprintf(command, fmt, ap);
    va_end(ap);=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20

And the following tests fail on the --no-default-devices
--no-default-features build:

  18/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/qom-test                     =
        ERROR          51.23s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
   37/436 qemu:qtest+qtest-aarch64 / qtest-aarch64/bios-tables-test        =
         ERROR           0.20s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
   55/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/test-hmp                    =
         ERROR          50.24s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
   94/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/qos-test                    =
         ERROR          50.19s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
  103/436 qemu:qtest+qtest-sparc64 / qtest-sparc64/prom-env-test           =
         ERROR          608.02s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
  115/436 qemu:qtest+qtest-aarch64 / qtest-aarch64/cdrom-test              =
         ERROR           0.31s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
  122/436 qemu:qtest+qtest-alpha / qtest-alpha/test-filter-mirror          =
         ERROR           0.16s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
  123/436 qemu:qtest+qtest-alpha / qtest-alpha/test-filter-redirector      =
         ERROR           0.16s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
  132/436 qemu:qtest+qtest-arm / qtest-arm/pflash-cfi02-test               =
         ERROR          50.28s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
  134/436 qemu:qtest+qtest-arm / qtest-arm/microbit-test                   =
         ERROR          51.02s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
  135/436 qemu:qtest+qtest-arm / qtest-arm/test-arm-mptimer                =
         ERROR          51.20s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
  136/436 qemu:qtest+qtest-arm / qtest-arm/cdrom-test                      =
         ERROR           0.31s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
  157/436 qemu:qtest+qtest-hppa / qtest-hppa/test-filter-mirror            =
         ERROR           0.16s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
  158/436 qemu:qtest+qtest-hppa / qtest-hppa/test-filter-redirector        =
         ERROR           0.26s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
  167/436 qemu:qtest+qtest-i386 / qtest-i386/test-filter-mirror            =
         ERROR           0.17s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
  168/436 qemu:qtest+qtest-i386 / qtest-i386/test-filter-redirector        =
         ERROR           0.17s   killed by signal 6 SIGABRT
  169/436 qemu:qtest+qtest-i386 / qtest-i386/ipmi-bt-test                  =
         ERROR           0.17s   killed by signal 6 SIGABRT
  171/436 qemu:qtest+qtest-i386 / qtest-i386/usb-hcd-uhci-test             =
         ERROR           0.17s   killed by signal 6 SIGABRT
  172/436 qemu:qtest+qtest-i386 / qtest-i386/usb-hcd-ehci-test             =
         ERROR           0.17s   killed by signal 6 SIGABRT
  173/436 qemu:qtest+qtest-i386 / qtest-i386/rtl8139-test                  =
         ERROR           0.17s   killed by signal 6 SIGABRT
  192/436 qemu:qtest+qtest-i386 / qtest-i386/cdrom-test                    =
         ERROR           0.65s   killed by signal 6 SIGABRT
  197/436 qemu:qtest+qtest-i386 / qtest-i386/readconfig-test               =
         ERROR           0.41s   killed by signal 6 SIGABRT
  287/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/test-filter-mirror          =
         ERROR          51.44s   killed by signal 6 SIGABRT
  288/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/test-filter-redirector      =
         ERROR          51.20s   killed by signal 6 SIGABRT
  289/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/m48t59-test                 =
         ERROR          51.20s   killed by signal 6 SIGABRT
  290/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/boot-order-test             =
         ERROR          51.19s   killed by signal 6 SIGABRT
  291/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/device-plug-test            =
         ERROR          51.20s   killed by signal 6 SIGABRT
  292/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/pnv-xscom-test              =
         ERROR          51.20s   killed by signal 6 SIGABRT
  293/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/rtas-test                   =
         ERROR          51.20s   killed by signal 6 SIGABRT
  294/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/usb-hcd-uhci-test           =
         ERROR          51.20s   killed by signal 6 SIGABRT
  295/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/display-vga-test            =
         ERROR          51.21s   killed by signal 6 SIGABRT
  296/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/numa-test                   =
         ERROR          51.19s   killed by signal 6 SIGABRT
  297/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/cpu-plug-test               =
         ERROR          51.20s   killed by signal 6 SIGABRT
  298/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/drive_del-test              =
         ERROR          51.20s   killed by signal 6 SIGABRT
  299/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/cdrom-test                  =
         ERROR          51.20s   killed by signal 6 SIGABRT
  300/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/device-introspect-test      =
         ERROR          51.20s   killed by signal 6 SIGABRT
  301/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/machine-none-test           =
         ERROR          51.20s   killed by signal 6 SIGABRT
  302/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/qmp-test                    =
         ERROR          51.20s   killed by signal 6 SIGABRT
  303/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/qmp-cmd-test                =
         ERROR          51.19s   killed by signal 6 SIGABRT
  304/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/readconfig-test             =
         ERROR          51.20s   killed by signal 6 SIGABRT
  305/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/netdev-socket               =
         ERROR          51.20s   killed by signal 6 SIGABRT
  306/436 qemu:qtest+qtest-ppc / qtest-ppc/test-filter-mirror              =
         ERROR           0.17s   killed by signal 6 SIGABRT
  307/436 qemu:qtest+qtest-ppc / qtest-ppc/test-filter-redirector
   ERROR           0.17s   killed by signal 6 SIGABRT
   338/436 qemu:qtest+qtest-s390x / qtest-s390x/test-filter-mirror         =
          ERROR           0.32s   killed by signal 6 SIGABRT
  339/436 qemu:qtest+qtest-s390x / qtest-s390x/test-filter-redirector      =
         ERROR           0.43s   killed by signal 6 SIGABRT
  341/436 qemu:qtest+qtest-s390x / qtest-s390x/device-plug-test            =
         ERROR           0.28s   killed by signal 6 SIGABRT
  342/436 qemu:qtest+qtest-s390x / qtest-s390x/virtio-ccw-test             =
         ERROR           0.16s   killed by signal 6 SIGABRT
  344/436 qemu:qtest+qtest-s390x / qtest-s390x/cdrom-test                  =
         ERROR           0.30s   killed by signal 6 SIGABRT
  365/436 qemu:qtest+qtest-sparc64 / qtest-sparc64/test-filter-mirror      =
         ERROR           0.33s   killed by signal 6 SIGABRT
  366/436 qemu:qtest+qtest-sparc64 / qtest-sparc64/test-filter-redirector  =
         ERROR           0.32s   killed by signal 6 SIGABRT
  391/436 qemu:qtest+qtest-x86_64 / qtest-x86_64/test-filter-mirror        =
         ERROR           0.16s   killed by signal 6 SIGABRT
  392/436 qemu:qtest+qtest-x86_64 / qtest-x86_64/test-filter-redirector    =
         ERROR           0.17s   killed by signal 6 SIGABRT
  393/436 qemu:qtest+qtest-x86_64 / qtest-x86_64/ipmi-bt-test              =
         ERROR           0.17s   killed by signal 6 SIGABRT
  395/436 qemu:qtest+qtest-x86_64 / qtest-x86_64/usb-hcd-uhci-test         =
         ERROR           0.18s   killed by signal 6 SIGABRT
  396/436 qemu:qtest+qtest-x86_64 / qtest-x86_64/usb-hcd-ehci-test         =
         ERROR           0.16s   killed by signal 6 SIGABRT
  397/436 qemu:qtest+qtest-x86_64 / qtest-x86_64/rtl8139-test              =
         ERROR           0.17s   killed by signal 6 SIGABRT
  416/436 qemu:qtest+qtest-x86_64 / qtest-x86_64/cdrom-test                =
         ERROR           0.66s   killed by signal 6 SIGABRT
  421/436 qemu:qtest+qtest-x86_64 / qtest-x86_64/readconfig-test           =
         ERROR           0.40s   killed by signal 6 SIGABRT

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

