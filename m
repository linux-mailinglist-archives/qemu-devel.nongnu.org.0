Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F238C4F6AE5
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 22:09:00 +0200 (CEST)
Received: from localhost ([::1]:53932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncBxb-0005cH-Kw
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 16:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncBwP-0004xI-EB
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 16:07:45 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:45585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncBwN-00057M-4k
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 16:07:45 -0400
Received: by mail-ej1-x632.google.com with SMTP id ot30so6458704ejb.12
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 13:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=RNw2vRys+m9pc9mXbBu1LkCGLd5Cc6ZS6GJwGOgOfH0=;
 b=gqCNxgTt6t1e0Wvw2fmpjN42tN5BVTzDW0lY6psmI6zMlXqIDmCV625NCFGl/c1LzM
 5DHuShQYxBrZtuVWzsws+YiRY6nhoL2TOx5a1OCPXP1I7p1EK0cPn2TH4HI684fSF/wX
 vFCyH1CMk/TfsK9W3MWOczErZa6LytEcGaO+rheVmpfXk4dp4QUvoNaIutHli9o/7OYR
 e64BwS+2yoPU3CBhaNC/CgQqtvjHG0HoctA2WpWKLUfUEPSNcv4Tmp8DrbPPPHFyV1GY
 kO8p8psYlEmO8y9OnaMNi1FhrCyICLvT8zANbAxVAj5CjgVYyWjHKroSt9rhSSvbfuJw
 GEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=RNw2vRys+m9pc9mXbBu1LkCGLd5Cc6ZS6GJwGOgOfH0=;
 b=QPOUbV+whIJhfVjN3DVx3AGrTVPnkger7XF1Kv5OXAQ/qxtTD3OUD/wVzC36td9AEf
 lbFnUJ7hNc6UyRBXtpk3RswzX0rfMKRGGy/+A+y1u5Vlz40s9SW9BP3B2rJVYUxkRyT7
 ZK0PahX1Axqt5lp83ZvQTNlP3NS7zWJ4Z9Zta5y/te+7l1WESyQ7GJao4KYfAFxfIeCW
 7sFFdNm+PlAc56rpmxksD2gkiSsTz9I3wqMwMwhDIilBcCZvyZ2MsK/wrB5CFeQxmaaf
 iCyahVnVir8fbasQnvm0HXBEj5tdZQG6/dFMsU58TKrD8J5TTrL52lRrJzpPCxSQCNYL
 6vWw==
X-Gm-Message-State: AOAM5318CyWF4+mQtyfGFsToYABjZYNn1O93VvgriDCIdrgH7VHfr+wI
 vWxCiGDbcAwJ4O/L+05c0s99Pw==
X-Google-Smtp-Source: ABdhPJx0J6CYPDXBp49r/6dGvBHPzMWHoKsVKKYWTtH0Gpm0Eu3gW8ECmLXmSYVpt1Za48m4gjayNQ==
X-Received: by 2002:a17:906:69c5:b0:6cf:d164:8b32 with SMTP id
 g5-20020a17090669c500b006cfd1648b32mr9829989ejs.233.1649275661137; 
 Wed, 06 Apr 2022 13:07:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a50cf01000000b0041cb7e02a5csm6457436edk.87.2022.04.06.13.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 13:07:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6F8B71FFB7;
 Wed,  6 Apr 2022 21:07:39 +0100 (BST)
References: <20220406173356.1891500-1-alex.bennee@linaro.org>
 <CAFEAcA-iFROkDQ=myCjbBxo5jJKqwCjQb_3tbANYdeNk=YizLw@mail.gmail.com>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH] tests/qtest: properly initialise the vring used idx
Date: Wed, 06 Apr 2022 21:06:15 +0100
In-reply-to: <CAFEAcA-iFROkDQ=myCjbBxo5jJKqwCjQb_3tbANYdeNk=YizLw@mail.gmail.com>
Message-ID: <87wng2ht6c.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Eric Auger <eric.auger@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 6 Apr 2022 at 18:36, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> Eric noticed while attempting to enable the vhost-user-blk-test for
>> Aarch64 that that things didn't work unless he put in a dummy
>> guest_malloc() at the start of the test. Without it
>> qvirtio_wait_used_elem() would assert when it reads a junk value for
>> idx resulting in:
>>
>>   qvirtqueue_get_buf: idx:2401 last_idx:0
>>   qvirtqueue_get_buf: 0x7ffcb6d3fe74, (nil)
>>   qvirtio_wait_used_elem: 3000000/0
>>   ERROR:../../tests/qtest/libqos/virtio.c:226:qvirtio_wait_used_elem: as=
sertion failed (got_desc_idx =3D=3D desc_idx): (50331648 =3D=3D 0)
>>   Bail out! ERROR:../../tests/qtest/libqos/virtio.c:226:qvirtio_wait_use=
d_elem: assertion failed (got_desc_idx =3D=3D desc_idx): (50331648 =3D=3D 0)
>>
>> What was actually happening is the guest_malloc() effectively pushed
>> the allocation of the vring into the next page which just happened to
>> have clear memory. After much tedious tracing of the code I could see
>> that qvring_init() does attempt initialise a bunch of the vring
>> structures but skips the vring->used.idx value. It is probably not
>> wise to assume guest memory is zeroed anyway. Once the ring is
>> properly initialised the hack is no longer needed to get things
>> working.
>
> Guest memory is generally zero at startup. Do we manage to
> hit the bit of memory at the start of the virt machine's RAM
> where we store the DTB ? (As you say, initializing the data
> structures is the right thing anyway.)

I don't know - where is the DTB loaded? Currently we are using the first
couple of pages in qtest because that where the qtest allocater is
initialised:

  static void *qos_create_machine_arm_virt(QTestState *qts)
  {
      QVirtMachine *machine =3D g_new0(QVirtMachine, 1);

      alloc_init(&machine->alloc, 0,
                 ARM_VIRT_RAM_ADDR,
                 ARM_VIRT_RAM_ADDR + ARM_VIRT_RAM_SIZE,
                 ARM_PAGE_SIZE);
      qvirtio_mmio_init_device(&machine->virtio_mmio, qts, VIRTIO_MMIO_BASE=
_ADDR,
                               VIRTIO_MMIO_SIZE);

      qos_create_generic_pcihost(&machine->bridge, qts, &machine->alloc);

      machine->obj.get_device =3D virt_get_device;
      machine->obj.get_driver =3D virt_get_driver;
      machine->obj.destructor =3D virt_destructor;
      return machine;
  }

I don't know if there is a more sane piece of memory we should be using.


>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

