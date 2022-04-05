Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3B64F3C68
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 17:46:54 +0200 (CEST)
Received: from localhost ([::1]:39956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nblOP-0001A8-LS
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 11:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nblKa-0007S4-GU
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 11:42:56 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:41983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nblKY-0005WU-9n
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 11:42:56 -0400
Received: by mail-ej1-x636.google.com with SMTP id bh17so27571210ejb.8
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 08:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=UooR7JVqylZ5R38yccDh8mPN2Ywn47P9L/a4rQ5ZRwA=;
 b=cKzoVpvd113iXHeuaNbCTPad9psxmD+aM/tJn4lVbxBTh6B5iE4NDx/mpDVpaM0giZ
 8I5fkyvKvWQ8et8GulvxQe+Wh7ZOVEwK5UEeKZfwBUA43bkq7nw/+pg1coNMV1UaJcj5
 rMi6zZs2BLOOv2h+5PYCMwWCWqkeGNwiBbz7YCfKe37aINxi9buF2oKpZtmE54CODaIB
 fzyKSksZXU7Jc6NMYWtoEkqZD9Y2LF6Hn05YzPIot3B9lubZL66rJTTmC5CWrp2ASLqn
 sVE8Hgpb0UfbZ9eLY1WGp15GbtBC5EwfzG+XYxOiC1M503vGT/a9/WZOMxjMRXxwmUKK
 C68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=UooR7JVqylZ5R38yccDh8mPN2Ywn47P9L/a4rQ5ZRwA=;
 b=nPQD5TATBwDBXfKCEWlUF3ZQ6GAKlGA/jlm9oQaEYaclxi5NUe95fxwVYCeFhLpmFF
 67SMV78ZYpCr7cdTv1N8CTAENEoPAjHJIJ+ofbEmIWLyF0Eax6rNy44g6k1M9T009HwM
 a8QY/7x2zLlqz9kD+2iP2upYBuruTvVD8mdTtcWTJXyUetdWm19cktpgODYmVpBdkohl
 wnD1ee8bYZ9TBTkpeUTjhhASsMAV9qmsqyZv7itqEhXlO+qopyeuxuEE264Zt4I2URkR
 nyxcMmbRgTB38JiifZtUN821c13oQltRNDbNqQjG/Vsl/2xfDKgynv185a3BNhknZUB0
 ofnw==
X-Gm-Message-State: AOAM532EmN2+nH7X8ii57jxDFb1q6e+KERLuRsVwuLNtnzHZkCpaVfs3
 DXv7k5Vo8WQekybnpT7sTkPiJA==
X-Google-Smtp-Source: ABdhPJwtZl5amULyVYtCea4RxtCKhx9YrZ66mEeRwBeN/s1CtBmKSML5bzCFm4GUb3L48KuVRrchFg==
X-Received: by 2002:a17:907:1c9e:b0:6e0:2fed:869a with SMTP id
 nb30-20020a1709071c9e00b006e02fed869amr4115838ejc.122.1649173372498; 
 Tue, 05 Apr 2022 08:42:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 mp19-20020a1709071b1300b006dfdfe15cf8sm5761593ejc.196.2022.04.05.08.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 08:42:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EDA001FFB7;
 Tue,  5 Apr 2022 16:42:50 +0100 (BST)
References: <20220309164929.19395-1-alex.bennee@linaro.org>
 <8735jrhue4.fsf@redhat.com> <87a6dp3ixf.fsf@linaro.org>
 <87bkxffu37.fsf@redhat.com>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [RFC PATCH] docs/devel: start documenting writing VirtIO devices
Date: Tue, 05 Apr 2022 16:35:26 +0100
In-reply-to: <87bkxffu37.fsf@redhat.com>
Message-ID: <87v8vnk03p.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 "Dr . David Alan  Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cornelia Huck <cohuck@redhat.com> writes:

> On Wed, Mar 16 2022, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
>> Cornelia Huck <cohuck@redhat.com> writes:
>>
>>> On Wed, Mar 09 2022, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
>>>> +Writing VirtIO backends for QEMU
>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> +
>>>> +This document attempts to outline the information a developer needs to
>>>> +know to write backends for QEMU. It is specifically focused on
>>>> +implementing VirtIO devices.
>>>
>>> I think you first need to define a bit more clearly what you consider a
>>> "backend". For virtio, it is probably "everything a device needs to
>>> function as a specific device type like net, block, etc., which may be
>>> implemented by different methods" (as you describe further below).
>>
>> How about:
>>
>>   This document attempts to outline the information a developer needs to
>>   know to write device emulations in QEMU. It is specifically focused on
>>   implementing VirtIO devices. For VirtIO the frontend is the driver
>>   running on the guest. The backend is the everything that QEMU needs to
>>   do to handle the emulation of the VirtIO device. This can be done
>>   entirely in QEMU, divided between QEMU and the kernel (vhost) or
>>   handled by a separate process which is configured by QEMU
>>   (vhost-user).
>
> I'm afraid that confuses me even more :)
>
> This sounds to me like frontend =3D=3D driver (in virtio spec terminology)
> and backend =3D=3D device. Is that really what you meant?

I think so. To be honest it's the different types of backend (in QEMU,
vhost and vhost-user) I'm trying to be clear about here. The
frontend/driver is just mentioned for completeness.

>
>>
>>>
>>>> +
>>>> +Front End Transports
>>>> +--------------------
>>>> +
>>>> +VirtIO supports a number of different front end transports. The
>>>> +details of the device remain the same but there are differences in
>>>> +command line for specifying the device (e.g. -device virtio-foo
>>>> +and -device virtio-foo-pci). For example:
>>>> +
>>>> +.. code:: c
>>>> +
>>>> +  static const TypeInfo vhost_user_blk_info =3D {
>>>> +      .name =3D TYPE_VHOST_USER_BLK,
>>>> +      .parent =3D TYPE_VIRTIO_DEVICE,
>>>> +      .instance_size =3D sizeof(VHostUserBlk),
>>>> +      .instance_init =3D vhost_user_blk_instance_init,
>>>> +      .class_init =3D vhost_user_blk_class_init,
>>>> +  };
>>>> +
>>>> +defines ``TYPE_VHOST_USER_BLK`` as a child of the generic
>>>> +``TYPE_VIRTIO_DEVICE``.
>>>
>>> That's not what I'd consider a "front end", though?
>>
>> Yeah clumsy wording. I'm trying to get find a good example to show how
>> QOM can be used to abstract the core device operation and the wrappers
>> for different transports. However in the code base there seems to be
>> considerable variation about how this is done. Any advice as to the
>> best exemplary device to follow is greatly welcomed.
>
> I'm not sure which of the example we can really consider a "good"
> device; the normal modus operandi when writing a new device seems to be
> "pick the first device you can think of and copy whatever it
> does".

Yeah the QEMU curse. Hence trying to document the "best" approach or at
least make the picking of a reference a little less random ;-)

> Personally, I usally look at blk or net, but those carry a lot of
> legacy baggage; so maybe a modern virtio-1 only device like gpu? That
> one also has the advantage of not being pci-only.
>
> Does anyone else have a good suggestion here?

Sorry I totally forgot to include you in the Cc of the v1 posting:

  Subject: [PATCH  v1 09/13] docs/devel: start documenting writing VirtIO d=
evices
  Date: Mon, 21 Mar 2022 15:30:33 +0000
  Message-Id: <20220321153037.3622127-10-alex.bennee@linaro.org>

although expect a v2 soonish (once I can get a reasonable qos-test
vhost-user test working).

>
>>
>>>> And then for the PCI device it wraps around the
>>>> +base device (although explicitly initialising via
>>>> +virtio_instance_init_common):
>>>> +
>>>> +.. code:: c
>>>> +
>>>> +  struct VHostUserBlkPCI {
>>>> +      VirtIOPCIProxy parent_obj;
>>>> +      VHostUserBlk vdev;
>>>> +  };
>>>
>>> The VirtIOPCIProxy seems to materialize a bit out of thin air
>>> here... maybe the information simply needs to be structured in a
>>> different way? Perhaps:
>>>
>>> - describe that virtio devices consist of a part that implements the
>>>   device functionality, which ultimately derives from VirtIODevice (the
>>>   "backend"), and a part that exposes a way for the operating system to
>>>   discover and use the device (the "frontend", what the virtio spec
>>>   calls a "transport")
>>> - decribe how the "frontend" part works (maybe mention VirtIOPCIProxy,
>>>   VirtIOMMIOProxy, and VirtioCcwDevice as specialized proxy devices for
>>>   PCI, MMIO, and CCW devices)
>>> - list the different types of "backends" (as you did below), and give
>>>   two examples of how VirtIODevice is extended (a plain one, and a
>>>   vhost-user one)
>>> - explain how frontend and backend together create an actual device
>>>   (with the two device examples, and maybe also with the plain one
>>>   plugged as both PCI and CCW?); maybe also mention that MMIO is a bit
>>>   different? (it always confuses me)
>>
>> OK I'll see how I can restructure things to make it clearer. Do we also
>> have to take into account the object heirarchy for different types of
>> device (i.e. block or net)? Or is that all plumbing into QEMUs
>> sub-system internals done in the VirtIO device objects?
>
> An example of how a device plugs into a bigger infrastructure like the
> block layer might be helpful, but it also might complicate the
> documentation (as you probably won't need to do anything like that if
> you write a device that does not use any established infrastructure.)
> Maybe just gloss over it for now?

Yeah. Certainly not the block layer as that is one of my blind spots
right now...

>
>>
>>>> +
>>>> +Back End Implementations
>>>> +------------------------
>>>> +
>>>> +There are a number of places where the implementation of the backend
>>>> +can be done:
>>>> +
>>>> +* in QEMU itself
>>>> +* in the host kernel (a.k.a vhost)
>>>> +* in a separate process (a.k.a. vhost-user)
>>>> +
>>>> +where a vhost-user implementation is being done the code in QEMU is
>>>> +mainly boilerplate to handle the command line definition and
>>>> +connection to the separate process with a socket (using the ``chardev=
``
>>>> +functionality).
>>>> +
>>>> +Implementing a vhost-user wrapper
>>>> +---------------------------------
>>>> +
>>>> +There are some classes defined that can wrap a lot of the common
>>>> +vhost-user code in a ``VhostUserBackend``. For example:
>>>
>>> Is VhostUserBackend something that is expected to be commonly used? I
>>> think gpu and input use it, but not virtiofs (unless I misread the
>>> code).
>>
>> Possibly - but it does seem to be trying to avoid adding lots of
>> boilerplate to each individual device to setup and configure the
>> vhost-user backend. A problem I ran into when trying to fix the
>> squashing of VHOST_USER_PROTOCOL_F_CONFIG messages in
>> vhost_user_backend_init.
>
> Yeah. I think a lot of that comes from the "pick a random existing
> device as a template" procedure I mentioned above. Maybe we really
> should recommend using that common structure in new device
> implementations.

I often point people at the unimp device but as a project it would be
nice if we could identify some best in class device types as references.
We give out the "pick a recent device" advice quite a lot.

>
>>
>> <snip>
>>>> +  static const TypeInfo vhost_user_gpu_info =3D {
>>>> +      .name =3D TYPE_VHOST_USER_GPU,
>>>> +      .parent =3D TYPE_VIRTIO_GPU_BASE,
>>>> +      .instance_size =3D sizeof(VhostUserGPU),
>>>> +      .instance_init =3D vhost_user_gpu_instance_init,
>>>> +      .class_init =3D vhost_user_gpu_class_init,
>>>> +      ...
>>>> +  };
>>>> +
>>>> +Here the ``TYPE_VHOST_USER_GPU`` is based off a shared base class
>>>> +(``TYPE_VIRTIO_GPU_BASE`` which itself is based on
>>>> +``TYPE_VIRTIO_DEVICE``). The chardev property is aliased to the
>>>> +VhostUserBackend chardev so it can be specified on the command line
>>>> +for this device.
>>>> +=20
>>>
>>> I think using a "base" device is something that is device-specific; for
>>> gpu, it makes sense as it can be implemented in different ways, but
>>> e.g. virtiofs does not have a "plain" implementation, and some device
>>> types have only "plain" implementations.
>>
>> Perhaps the GPU was a bad choice here. Do we have a good example device
>> that has both mmio and pci (or ccw) transports as well as QEMU internal
>> and vhost/vhost-user implementations?
>
> Ugh. Maybe scsi? It carries a bit of legacy stuff, though.

virtio-rng is pretty simple and has a range of backend approaches?

--=20
Alex Benn=C3=A9e

