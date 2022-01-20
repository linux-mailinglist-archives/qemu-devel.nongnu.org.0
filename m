Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A9B4955F6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 22:29:53 +0100 (CET)
Received: from localhost ([::1]:57976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAf0C-00077m-3I
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 16:29:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nAZqb-0001xK-Am
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:59:40 -0500
Received: from [2a00:1450:4864:20::329] (port=40551
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nAZqZ-00026o-Dc
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:59:36 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 r7-20020a1c4407000000b0034e043aaac7so609990wma.5
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 07:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=BF0M/a7bEq2+kldQtIwAvMgNZYIFYOJDqtqHazWZUBY=;
 b=XHvjvuJgKrN/ufazpWunIf40sN7vhfiE9/CfaxKejgMbcgsLBkEIHAOC7iEqNE4BCq
 R5kyAj9pO5JuAW5wK5DbKGkS64vTxU/pJQp+8ZTf/bcmOLu/NCoAe7LQkXKyFunaQvWD
 XZtvfJE4tR0sa9usPgn3/XJl+fLGmvxx+ampfPAdJVDUWHIAyxNy8U9AUJdqk8XWeBHy
 lbjhYBy16zVdimh/iUOFjBu5T/F6I5F6pEgmqc56WYptTtubboEKZRk5tgkOVwYa8HBU
 z8UouvoVSxxhuSAg7IAwt9zY5Zk/iKE/HJMhtC/LBZDz+rV/7QgmIesWkxOxZXIf6Kyd
 y/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=BF0M/a7bEq2+kldQtIwAvMgNZYIFYOJDqtqHazWZUBY=;
 b=1Z0vbYvx8jJELihxghMrXxCGno6R7mjrthe0f7i0LCP5Qhj5mfk+J9SbmPMQl2KrxO
 LPvwlY6YziXDh+rhXS4ZNuCLvg9RjPLLkRtIcKuCu0Xp+AYVMh6gpUcHZGmSU070nXci
 PNI1fXUyNcRLoaVXAY1pDZtQqW6a335upeVdlF8oHxUXt4NC6Rh2c5eR3Kk1d7YUb1NY
 KlK2AgPeWzXJLOnp47co3zvD+Y5rc1oj8K9gNFWh2qRAKWnXv748Nk4LTXnf37usWULE
 FC2myT4G442sqJW2sQ8YodUL6S46J0Oc3VJMs5o7clj3XeTfjxMGEbmNR5u2kz3YeYLP
 ZjhQ==
X-Gm-Message-State: AOAM532FIiMcP7VEyV3DQ4ZqCIOjFcV1aR17qDFF1g4tK/NkkCcb1FVp
 LPfl+bVVraMpTDCtn9Rvl/usLw==
X-Google-Smtp-Source: ABdhPJzimB2BdY8RAnf0D6DRIdXUKnShEIHale665KEv3yL/Re4vKNTqo//epcWgWGngAyfQTJikpw==
X-Received: by 2002:adf:eb4f:: with SMTP id u15mr34136209wrn.6.1642694373876; 
 Thu, 20 Jan 2022 07:59:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l9sm3370186wrs.106.2022.01.20.07.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 07:59:33 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7B40E1FFB7;
 Thu, 20 Jan 2022 15:59:32 +0000 (GMT)
References: <cover.1641987128.git.viresh.kumar@linaro.org>
 <20220117034606-mutt-send-email-mst@kernel.org>
 <871r16br9n.fsf@linaro.org> <20220120040234.ehcjcdr6wrvlz3yc@vireshk-i7>
 <20220120055543-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/2] virtio: Add vhost-user-gpio device's support
Date: Thu, 20 Jan 2022 15:41:57 +0000
In-reply-to: <20220120055543-mutt-send-email-mst@kernel.org>
Message-ID: <87ilue75zv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Thu, Jan 20, 2022 at 09:32:34AM +0530, Viresh Kumar wrote:
>> On 17-01-22, 10:11, Alex Benn=C3=A9e wrote:
>> >=20
>> > "Michael S. Tsirkin" <mst@redhat.com> writes:
>> >=20
>> > > On Wed, Jan 12, 2022 at 05:04:57PM +0530, Viresh Kumar wrote:
>> > >> Hello,
>> > >>=20
>> > >> This patchset adds vhost-user-gpio device's support in Qemu. The su=
pport for the
>> > >> same has already been added to virtio specification and Linux Kerne=
l.
>> > >>=20
>> > >> A Rust based backend is also in progress and is tested against this=
 patchset:
>> > >>=20
>> > >> https://github.com/rust-vmm/vhost-device/pull/76
>> > >
>> > >
>> > > I'm reluctant to add this with no tests in tree.
>> > > Want to write a minimal libhost-user based backend?
>>=20
>> I actually have one already, that I wrote before attempting the Rust
>> counterpart, but never upstreamed as I am not sure if anyone is ever
>> going to use it, as I am not. And I thought what's the point of
>> merging code which I will never end up using.
>>=20
>> I am not sure what test I can add here to make sure this doesn't
>> breaks in future though.
>
> something that executes with make check.

With Eric's latest series
(20220118203833.316741-1-eric.auger@redhat.com) we are already
exercising most of the PCI code:

  =E2=9E=9C  gcov ./libqemu-aarch64-softmmu.fa.p/hw_virtio_vhost-user-gpio.=
c.gcda
  File '../../hw/virtio/vhost-user-gpio.c'
  Lines executed:10.43% of 163
  Creating 'vhost-user-gpio.c.gcov'

  File '/home/alex/lsrc/qemu.git/include/qemu/bitops.h'
  Lines executed:100.00% of 4
  Creating 'bitops.h.gcov'

  File '/home/alex/lsrc/qemu.git/include/hw/virtio/virtio.h'
  Lines executed:12.50% of 8
  Creating 'virtio.h.gcov'

  File '/home/alex/lsrc/qemu.git/include/hw/virtio/vhost-user-gpio.h'
  Lines executed:0.00% of 1
  Creating 'vhost-user-gpio.h.gcov'

  File '/home/alex/lsrc/qemu.git/include/hw/virtio/virtio-bus.h'
  Lines executed:0.00% of 1
  Creating 'virtio-bus.h.gcov'

  File '/home/alex/lsrc/qemu.git/include/hw/qdev-core.h'
  Lines executed:50.00% of 2
  Creating 'qdev-core.h.gcov'

  =F0=9F=95=9915:40:35 alex@zen:qemu.git/builds/gprof  on =EE=82=A0 review/=
virtio-gpio-boilerplate [$?]=20
  =E2=9E=9C  gcov ./libqemu-aarch64-softmmu.fa.p/hw_virtio_vhost-user-gpio-=
pci.c.gcda
  File '../../hw/virtio/vhost-user-gpio-pci.c'
  Lines executed:76.92% of 26
  Creating 'vhost-user-gpio-pci.c.gcov'

  File '/home/alex/lsrc/qemu.git/include/qemu/bitops.h'
  Lines executed:100.00% of 4
  Creating 'bitops.h.gcov'

  File '../../hw/virtio/virtio-pci.h'
  Lines executed:100.00% of 1
  Creating 'virtio-pci.h.gcov'

  File '/home/alex/lsrc/qemu.git/include/hw/pci/pci.h'
  Lines executed:100.00% of 1
  Creating 'pci.h.gcov'

  File '/home/alex/lsrc/qemu.git/include/hw/qdev-core.h'
  Lines executed:50.00% of 2
  Creating 'qdev-core.h.gcov'

So I think if we add the runes to ensure we instantiate both types
explicitly I think we will have enough coverage.

--=20
Alex Benn=C3=A9e

