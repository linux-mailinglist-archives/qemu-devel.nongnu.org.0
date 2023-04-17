Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C2D6E4E40
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 18:25:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poReg-00031n-F1; Mon, 17 Apr 2023 12:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poRef-00031d-9q
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 12:24:37 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poRed-0006He-6j
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 12:24:37 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f09b9ac51dso45851805e9.0
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 09:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681748671; x=1684340671;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QZwKumCvepBHfmdhF6N8J7XAEcNA1IrJD+sNrVEorvw=;
 b=t0FjjqAAevVxEwHSOTAQMMmbIvJQZ+qzehj1jhD/3IqflZwy8ovSxFNutwV6i3W/5G
 M528Os5PWgYv534qzt7/g4pXUij8xWV1BSocR3IiduJPiRFlty0stGPc5am6o34FA/pF
 DkZ8G/htDQm1KPa1YHzOkvEZzxVNKX/mwL+vg53HS5QJFnC57nk1ie/LjOSSYGYHYJah
 3HbitW9KWK6lMCCKBkY5fMdMVPaPfgPh2B7846x3Y6jsb+zOi7og4ygSwTH4O6WsMoBT
 q30mdNIq5QYohKmpJGn1S+HPjwETtlK1b/34EUVeIHm/AfgJltyZuiwBd/SU12iJWzWv
 oR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681748671; x=1684340671;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QZwKumCvepBHfmdhF6N8J7XAEcNA1IrJD+sNrVEorvw=;
 b=lYKhJ77x/4DjMz/qzIye2mKOyHTzyhR7gVL2wvsOPd6mAQ2PLuqLh+vjOjtmYMGY0A
 6PTR9xthLGh+iqzn7MGbbvCNs11I4gYpewFY0KaxAwSwSi121HA3HP2MjO+MRMksUcmd
 j6JtKUNDZzdDGzXa+EH+LgDIW8vrg7nPPLnbSJTT3zf4zsy6ywjQ83Gh07uf1rDW444B
 MYGFiqSsPfI3pmT07+o5jHXCsigTcGyuggU/Z2H8qs8/Y9KpBKBP6ZkdeSG8pkfhcMtF
 5MtZvny1OWUZGZL+S+wxzeDlVW6cGU8HrGusDgRe7NW//nsqvtGV/AiXtS7uqfQKN+Le
 c86g==
X-Gm-Message-State: AAQBX9fB6DrYKiRocWKrz7iw6vi7odA6MTldPlof/raK4CF9Md7K+jCi
 CRLl1dSl9ZLObYZl5MCbyqqJzg==
X-Google-Smtp-Source: AKy350bJXmhz5tAHCMbO0tmVlTZokj75ft2xR1zheHZ+N5Cq/A5FqXjqFYZHUCCIdrdO7U51oaANNA==
X-Received: by 2002:adf:e702:0:b0:2fb:b869:bc08 with SMTP id
 c2-20020adfe702000000b002fbb869bc08mr843357wrm.23.1681748671096; 
 Mon, 17 Apr 2023 09:24:31 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a5d4c48000000b002f587f6c9b2sm10806847wrt.107.2023.04.17.09.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 09:24:30 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 587771FFB7;
 Mon, 17 Apr 2023 17:24:30 +0100 (BST)
References: <20230414160433.2096866-1-alex.bennee@linaro.org>
 <CAJSP0QURbJrEoFY8FhMnq_B6tx-qYspfu-OB6=6hz5=qAwE=6A@mail.gmail.com>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, "Gonglei (Arei)" <arei.gonglei@huawei.com>, Paolo
 Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtio-fs@redhat.com, Erik Schilling <erik.schilling@linaro.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Eduardo
 Habkost
 <eduardo@habkost.net>, Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake
 <eblake@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Jason
 Wang <jasowang@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Gerd Hoffmann
 <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 00/12] virtio: add vhost-user-generic and reduce copy
 and paste
Date: Mon, 17 Apr 2023 17:14:59 +0100
In-reply-to: <CAJSP0QURbJrEoFY8FhMnq_B6tx-qYspfu-OB6=6hz5=qAwE=6A@mail.gmail.com>
Message-ID: <87ttxeeatd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Stefan Hajnoczi <stefanha@gmail.com> writes:

> On Fri, 14 Apr 2023 at 12:06, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> A lot of our vhost-user stubs are large chunks of boilerplate that do
>> (mostly) the same thing. This series attempts to fix that by defining
>> a new base class for vhost-user devices and then converting the rng
>> and gpio devices to be based off them. You can even use
>> vhost-user-device directly if you supply it with the right magic
>> numbers (which is helpful for development).
>>
>> However the final patch runs into the weeds because I don't yet have a
>> clean way to represent in QOM the fixing of certain properties for the
>> specialised classes.
>>
>> The series is a net reduction in code and an increase in
>> documentation but obviously needs to iron out a few more warts. I'm
>> open to suggestions on the best way to tweak the QOM stuff.
>
> --device vhost-user-device is not really possible because vhost-user
> devices are not full VIRTIO devices. vhost-user devices depend on
> device-specific code in the VMM by design.

What device specific code? You certainly need to instantiate stuff in
the DTB/ACPI tables for -M virt but everything else can be handed off to
the vhost-user daemon.

Indeed the split brain is a bit silly in some places. For example is
QEMU really the best arbiter of a block device config when the actual
backend is a separate process. We have config passing in the vhost-user
spec.

> The "subset of a VIRTIO device" design made sense for vhost_net.
> Nowadays there are other device types that are close to full VIRTIO
> devices, although the vhost-user protocol doesn't support the full
> VIRTIO device lifecycle.

What are we missing?

> I think a user-creatable --device vhost-user-device is not a good idea
> today. It creates confusion. Many people aren't aware of the
> architectural difference between vhost-user and VIRTIO devices. The
> result is that VMMs and vhost-user backends implement increasingly
> brittle VIRTIO configuration space and feature bit logic as they
> knowingly or unknowingly try to paper over the fact that a traditional
> vhost-user device isn't a full VIRTIO device.

I've always found the device feature gating in QEMU confusing. Surely we
can rely on the daemon to properly enumerate the features it supports?

> It is possible to resolve this difference and make --device
> vhost-user-device work properly for devices that want to be full
> VIRTIO devices. See "Making VMM device shims optional" here:
> https://blog.vmsplice.net/2020/09/on-unifying-vhost-user-and-virtio.html
>
> Even after extending the vhost-user protocol to solve the current
> limitations, existing backends would still only be partial VIRTIO
> devices that wouldn't work with --device vhost-user-device.

It works for RNG, GPIO (and soon I'll be testing i2c and SCSI). All we
need is the virtioid and the number of virtio queues.

> Reducing boilerplate is helpful, but I think --device
> vhost-user-device should not be user-creatable.

After this series lands it will certainly make adding new shims easier
but having a vhost-user-device will make testing of new backends easier.
Can we not simply document it as an advanced feature for those who know
what they are doing? I'm not intending to deprecate the existing shims.

>
> Stefan
>
>>
>> Alex.
>>
>> Alex Benn=C3=A9e (12):
>>   hw/virtio: fix typo in VIRTIO_CONFIG_IRQ_IDX comments
>>   include/hw/virtio: document virtio_notify_config
>>   include/hw/virtio: add kerneldoc for virtio_init
>>   include/hw/virtio: document some more usage of notifiers
>>   virtio: add generic vhost-user-device
>>   virtio: add PCI stub for vhost-user-device
>>   include: attempt to document device_class_set_props
>>   qom: allow for properties to become "fixed"
>>   hw/virtio: derive vhost-user-rng from vhost-user-device
>>   hw/virtio: add config support to vhost-user-device
>>   hw/virtio: derive vhost-user-gpio from vhost-user-device (!BROKEN)
>>   docs/system: add a basic enumeration of vhost-user devices
>>
>>  docs/system/devices/vhost-user-rng.rst |   2 +
>>  docs/system/devices/vhost-user.rst     |  41 +++
>>  qapi/qom.json                          |   2 +
>>  include/hw/qdev-core.h                 |   9 +
>>  include/hw/virtio/vhost-user-device.h  |  33 ++
>>  include/hw/virtio/vhost-user-gpio.h    |  23 +-
>>  include/hw/virtio/vhost-user-rng.h     |  11 +-
>>  include/hw/virtio/virtio.h             |  21 ++
>>  include/qom/object.h                   |  16 +-
>>  hw/display/vhost-user-gpu.c            |   4 +-
>>  hw/net/virtio-net.c                    |   4 +-
>>  hw/virtio/vhost-user-device-pci.c      |  71 +++++
>>  hw/virtio/vhost-user-device.c          | 359 ++++++++++++++++++++++
>>  hw/virtio/vhost-user-fs.c              |   4 +-
>>  hw/virtio/vhost-user-gpio.c            | 405 +------------------------
>>  hw/virtio/vhost-user-rng.c             | 264 +---------------
>>  hw/virtio/vhost-vsock-common.c         |   4 +-
>>  hw/virtio/virtio-crypto.c              |   4 +-
>>  qom/object.c                           |  14 +
>>  qom/object_interfaces.c                |   9 +-
>>  qom/qom-qmp-cmds.c                     |   1 +
>>  softmmu/qdev-monitor.c                 |   1 +
>>  hw/virtio/meson.build                  |   3 +
>>  23 files changed, 613 insertions(+), 692 deletions(-)
>>  create mode 100644 include/hw/virtio/vhost-user-device.h
>>  create mode 100644 hw/virtio/vhost-user-device-pci.c
>>  create mode 100644 hw/virtio/vhost-user-device.c
>>
>> --
>> 2.39.2
>>
>>


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

