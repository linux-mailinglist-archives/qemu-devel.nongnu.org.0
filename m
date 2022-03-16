Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB074DB763
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 18:37:37 +0100 (CET)
Received: from localhost ([::1]:57034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUXaZ-0005Yx-Qi
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 13:37:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nUXZM-0004Iv-Nq
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 13:36:20 -0400
Received: from [2a00:1450:4864:20::629] (port=45821
 helo=mail-ej1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nUXZK-0005zK-JZ
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 13:36:20 -0400
Received: by mail-ej1-x629.google.com with SMTP id qa43so5650664ejc.12
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 10:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=vW6XNAt6eQnB4AP0+OpU4vOtlaWOttrO/SQ7U+YuWZE=;
 b=W0v+zcG2vu0cf6uaBgpip3B2Yw9BzH8ZucZX0UUl5Alo1JEd0ePsyWCWA0GYOmsZah
 Bv/pUR+Px4RvBuY4JiO3/KF1J8fPO37UTgVaNqZfOz52QBFo9qi4/Eqn4c8Z7arTxXEM
 OPY+Cgr/PehJyHene65XZKofFik0AgPTz64qe6tDhQTlGSencXSmdnecibsXtlucAVJL
 B7v+9N1DfW3GDNZfYcsNoSgy5KiK/8JcsOjGAgvl3gNB9HVUsut/5TAXe4geuD/Z8o6n
 2yBKcKyPcks0FrVsWIbJ5QxBhEPZmuBJaKsBn8davsLCdU423mRf85y7DfgAtv4EsptF
 gbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=vW6XNAt6eQnB4AP0+OpU4vOtlaWOttrO/SQ7U+YuWZE=;
 b=cXMMjW3iliZkoWYMhm2KlKSVS5MXdomwTmX1zy/5a1iJLWK2i8rbgf0oWMyv9M/kLL
 92s4cQoQob7y6Vd/cz7KHDxgYDNBGvVXgCYKRprh7pu/NPEGlilQ9tIRfOS5C2tT3V4h
 JnZ3rdGf+8lCdG18EcUaEcVko80QnNIGrW6hMRd2cqylsSAHSLQgwcpxXscg8uQt2nKK
 MzgJEf43JYDL1UF9RjhLHqEf8x5EZal1XqZpf+2w9eM+ZbU0EZPD/vipDvi5tpL9b9Jx
 XnaJUbZos1Ft51kFc/TQpN/B8Prn5/zAgxs6jiQSugJKKQ68c2NjmiQ53Ss7KCiCaJIQ
 CGhg==
X-Gm-Message-State: AOAM531IWamadofVH1qHIN+A03kbDTsgxQcFy6ZlUML4zVfGiWtmBp+c
 Osbg8Qa7Ek9TJ1VWybiIM6cw5Q==
X-Google-Smtp-Source: ABdhPJyY/ba7GDl9l57AXCPFIMxVV1HKaUhdnjWhVHEdjgfmP3wRBX0fRHCypK2MIRhVBzed4Etg9g==
X-Received: by 2002:a17:906:c0c9:b0:6db:207:c41f with SMTP id
 bn9-20020a170906c0c900b006db0207c41fmr963101ejb.292.1647452176751; 
 Wed, 16 Mar 2022 10:36:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a056402350d00b00416ad3dbc54sm1367296edd.0.2022.03.16.10.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 10:36:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 18A681FFB7;
 Wed, 16 Mar 2022 17:29:16 +0000 (GMT)
References: <20220309164929.19395-1-alex.bennee@linaro.org>
 <8735jrhue4.fsf@redhat.com>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [RFC PATCH] docs/devel: start documenting writing VirtIO devices
Date: Wed, 16 Mar 2022 16:41:21 +0000
In-reply-to: <8735jrhue4.fsf@redhat.com>
Message-ID: <87a6dp3ixf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::629
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 "Dr . David Alan  Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cornelia Huck <cohuck@redhat.com> writes:

> On Wed, Mar 09 2022, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
>> While writing my own VirtIO devices I've gotten confused with how
>> things are structured and what sort of shared infrastructure there is.
>> If we can document how everything is supposed to work we can then
>> maybe start cleaning up inconsistencies in the code.
>
> I agree that we could use some documentation here; OTOH, I'm a bit
> confused in turn by your patch :) Let me comment below.

Almost by design ;-)

>
>>
>> Based-on: 20220309135355.4149689-1-alex.bennee@linaro.org
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Stefan Hajnoczi <stefanha@redhat.com>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>> Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> Cc: Viresh Kumar <viresh.kumar@linaro.org>
>> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> ---
>>  docs/devel/index-internals.rst |   2 +-
>>  docs/devel/virtio-backends.rst | 139 +++++++++++++++++++++++++++++++++
>>  2 files changed, 140 insertions(+), 1 deletion(-)
>>  create mode 100644 docs/devel/virtio-backends.rst
>
> (...)
>
>> diff --git a/docs/devel/virtio-backends.rst b/docs/devel/virtio-backends=
.rst
>> new file mode 100644
>> index 0000000000..230538f46b
>> --- /dev/null
>> +++ b/docs/devel/virtio-backends.rst
>> @@ -0,0 +1,139 @@
>> +..
>> +   Copyright (c) 2022, Linaro Limited
>> +   Written by Alex Benn=C3=A9e
>> +
>> +Writing VirtIO backends for QEMU
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +This document attempts to outline the information a developer needs to
>> +know to write backends for QEMU. It is specifically focused on
>> +implementing VirtIO devices.
>
> I think you first need to define a bit more clearly what you consider a
> "backend". For virtio, it is probably "everything a device needs to
> function as a specific device type like net, block, etc., which may be
> implemented by different methods" (as you describe further below).

How about:

  This document attempts to outline the information a developer needs to
  know to write device emulations in QEMU. It is specifically focused on
  implementing VirtIO devices. For VirtIO the frontend is the driver
  running on the guest. The backend is the everything that QEMU needs to
  do to handle the emulation of the VirtIO device. This can be done
  entirely in QEMU, divided between QEMU and the kernel (vhost) or
  handled by a separate process which is configured by QEMU
  (vhost-user).

>
>> +
>> +Front End Transports
>> +--------------------
>> +
>> +VirtIO supports a number of different front end transports. The
>> +details of the device remain the same but there are differences in
>> +command line for specifying the device (e.g. -device virtio-foo
>> +and -device virtio-foo-pci). For example:
>> +
>> +.. code:: c
>> +
>> +  static const TypeInfo vhost_user_blk_info =3D {
>> +      .name =3D TYPE_VHOST_USER_BLK,
>> +      .parent =3D TYPE_VIRTIO_DEVICE,
>> +      .instance_size =3D sizeof(VHostUserBlk),
>> +      .instance_init =3D vhost_user_blk_instance_init,
>> +      .class_init =3D vhost_user_blk_class_init,
>> +  };
>> +
>> +defines ``TYPE_VHOST_USER_BLK`` as a child of the generic
>> +``TYPE_VIRTIO_DEVICE``.
>
> That's not what I'd consider a "front end", though?

Yeah clumsy wording. I'm trying to get find a good example to show how
QOM can be used to abstract the core device operation and the wrappers
for different transports. However in the code base there seems to be
considerable variation about how this is done. Any advice as to the
best exemplary device to follow is greatly welcomed.

>> And then for the PCI device it wraps around the
>> +base device (although explicitly initialising via
>> +virtio_instance_init_common):
>> +
>> +.. code:: c
>> +
>> +  struct VHostUserBlkPCI {
>> +      VirtIOPCIProxy parent_obj;
>> +      VHostUserBlk vdev;
>> +  };
>
> The VirtIOPCIProxy seems to materialize a bit out of thin air
> here... maybe the information simply needs to be structured in a
> different way? Perhaps:
>
> - describe that virtio devices consist of a part that implements the
>   device functionality, which ultimately derives from VirtIODevice (the
>   "backend"), and a part that exposes a way for the operating system to
>   discover and use the device (the "frontend", what the virtio spec
>   calls a "transport")
> - decribe how the "frontend" part works (maybe mention VirtIOPCIProxy,
>   VirtIOMMIOProxy, and VirtioCcwDevice as specialized proxy devices for
>   PCI, MMIO, and CCW devices)
> - list the different types of "backends" (as you did below), and give
>   two examples of how VirtIODevice is extended (a plain one, and a
>   vhost-user one)
> - explain how frontend and backend together create an actual device
>   (with the two device examples, and maybe also with the plain one
>   plugged as both PCI and CCW?); maybe also mention that MMIO is a bit
>   different? (it always confuses me)

OK I'll see how I can restructure things to make it clearer. Do we also
have to take into account the object heirarchy for different types of
device (i.e. block or net)? Or is that all plumbing into QEMUs
sub-system internals done in the VirtIO device objects?

>> +
>> +Back End Implementations
>> +------------------------
>> +
>> +There are a number of places where the implementation of the backend
>> +can be done:
>> +
>> +* in QEMU itself
>> +* in the host kernel (a.k.a vhost)
>> +* in a separate process (a.k.a. vhost-user)
>> +
>> +where a vhost-user implementation is being done the code in QEMU is
>> +mainly boilerplate to handle the command line definition and
>> +connection to the separate process with a socket (using the ``chardev``
>> +functionality).
>> +
>> +Implementing a vhost-user wrapper
>> +---------------------------------
>> +
>> +There are some classes defined that can wrap a lot of the common
>> +vhost-user code in a ``VhostUserBackend``. For example:
>
> Is VhostUserBackend something that is expected to be commonly used? I
> think gpu and input use it, but not virtiofs (unless I misread the
> code).

Possibly - but it does seem to be trying to avoid adding lots of
boilerplate to each individual device to setup and configure the
vhost-user backend. A problem I ran into when trying to fix the
squashing of VHOST_USER_PROTOCOL_F_CONFIG messages in
vhost_user_backend_init.

<snip>
>> +  static const TypeInfo vhost_user_gpu_info =3D {
>> +      .name =3D TYPE_VHOST_USER_GPU,
>> +      .parent =3D TYPE_VIRTIO_GPU_BASE,
>> +      .instance_size =3D sizeof(VhostUserGPU),
>> +      .instance_init =3D vhost_user_gpu_instance_init,
>> +      .class_init =3D vhost_user_gpu_class_init,
>> +      ...
>> +  };
>> +
>> +Here the ``TYPE_VHOST_USER_GPU`` is based off a shared base class
>> +(``TYPE_VIRTIO_GPU_BASE`` which itself is based on
>> +``TYPE_VIRTIO_DEVICE``). The chardev property is aliased to the
>> +VhostUserBackend chardev so it can be specified on the command line
>> +for this device.
>> +=20
>
> I think using a "base" device is something that is device-specific; for
> gpu, it makes sense as it can be implemented in different ways, but
> e.g. virtiofs does not have a "plain" implementation, and some device
> types have only "plain" implementations.

Perhaps the GPU was a bad choice here. Do we have a good example device
that has both mmio and pci (or ccw) transports as well as QEMU internal
and vhost/vhost-user implementations?

--=20
Alex Benn=C3=A9e

