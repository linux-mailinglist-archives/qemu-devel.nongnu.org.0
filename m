Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21322514857
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 13:37:54 +0200 (CEST)
Received: from localhost ([::1]:55596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkOwb-0001s7-9G
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 07:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1nkOvb-0000wR-NX
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 07:36:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1nkOvY-0001I3-K7
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 07:36:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651232207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xs7xibSltSfFBYUjw6xBqS2e0JsXplY0AnS75z5I2Ak=;
 b=awS8RRtaa9T3XDbkB1iI6PLqhS51BCHDPMmMvWfcBWjM/0mk1AKE/D3DfNqrGzxeY/Nlc2
 WBlvrK7Nguv40dyALmRC6kww/KbIc0K4Olp+GmBL8zLhFbmVkG5NMkY5DYV8H6aUbN68yl
 YbyE0YA+3lLUc+4kxJAh6iIx4/ewij8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-g1KTiUvmNuK0YJFK_-bI0Q-1; Fri, 29 Apr 2022 07:36:45 -0400
X-MC-Unique: g1KTiUvmNuK0YJFK_-bI0Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 m124-20020a1c2682000000b00393fcd2722dso2377245wmm.4
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 04:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xs7xibSltSfFBYUjw6xBqS2e0JsXplY0AnS75z5I2Ak=;
 b=pcqqjyww9lY3pUH2xLAjYDLu1yBMkm6FctvphBTPRXWWGOEGEIwweQer5GzTJCdViw
 nYWgJ/+QnqOsZyNBy3rC0EEiH+4ATD4XyaCqTZNvfyjPDsAyMOF+ZdFE94YVLv2wYXqp
 sMPxe5D7jbbrHALLvbYBU7rjC4bD/jHu73B4gOnpV/CJftMsEBeIerSr6aEaWi4TyoKz
 AAhz3f/Ta1SpIbOFhfBfsgQeTQGzMjB8zZ8NKWqh6e/t5H7FnAsakfJIQ+FP8B6/sum0
 wHb/LnZToO0W9Vk6VSIjpzd5gEHkEN/heX4g+0h9JHA0OkVsXbHz1EvOSlRtFHhtoHRh
 Cx3g==
X-Gm-Message-State: AOAM530V/pmM6kHaTBNcxOeJC8d5mTfzegO4lFZsMqpl6SM35houu8Op
 8nk59UXC3dKWvvBCgWeeYxG7jrV6ZaET/Wceumb39SygqQZqSFAu7K84uWtIMxtE0ylLZhY7o1S
 fWfE1fzaU9UDLwGE=
X-Received: by 2002:a5d:47aa:0:b0:20c:4b28:3aab with SMTP id
 10-20020a5d47aa000000b0020c4b283aabmr1696570wrb.142.1651232204532; 
 Fri, 29 Apr 2022 04:36:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoo9RDFIJM6Qa7vpCgT4C5OCEbVzieTHh41kI2SqOGO9V1JCFfvhzgaewiPNVioBBcGXX+Tw==
X-Received: by 2002:a5d:47aa:0:b0:20c:4b28:3aab with SMTP id
 10-20020a5d47aa000000b0020c4b283aabmr1696527wrb.142.1651232204155; 
 Fri, 29 Apr 2022 04:36:44 -0700 (PDT)
Received: from wheatley.localdomain (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 o30-20020adf8b9e000000b0020ae802da1fsm2540537wra.90.2022.04.29.04.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 04:36:43 -0700 (PDT)
Received: by wheatley.localdomain (Postfix, from userid 1000)
 id 1706D6929894; Fri, 29 Apr 2022 13:36:43 +0200 (CEST)
Date: Fri, 29 Apr 2022 13:36:43 +0200
From: Martin Kletzander <mkletzan@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 07/18] Introduce machine's default-audiodev property
Message-ID: <YmvNyzUtCmL59gi8@wheatley>
References: <cover.1650874791.git.mkletzan@redhat.com>
 <49192ccd62fc98c474bb0b627a22cc28a634e8b8.1650874791.git.mkletzan@redhat.com>
 <Ymaq1ouZVKD5kZfV@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="a6QkXSPlD76aLoSD"
Content-Disposition: inline
In-Reply-To: <Ymaq1ouZVKD5kZfV@redhat.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mkletzan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Eduardo Habkost <eduardo@habkost.net>, Alexander Bulekov <alxndr@bu.edu>,
 Thomas Huth <huth@tuxfamily.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--a6QkXSPlD76aLoSD
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2022 at 03:06:14PM +0100, Daniel P. Berrang=E9 wrote:
>On Mon, Apr 25, 2022 at 10:21:50AM +0200, Martin Kletzander wrote:
>> Many machine types have default audio devices with no way to set the und=
erlying
>> audiodev.  Instead of adding an option for each and every one of them th=
is new
>> property can be used as a default during machine initialisation when cre=
ating
>> such devices.
>>
>> Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
>> ---
>>  hw/core/machine.c   | 23 +++++++++++++++++++++++
>>  include/hw/boards.h |  1 +
>>  2 files changed, 24 insertions(+)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index cb9bbc844d24..d055a126d398 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -596,6 +596,22 @@ static void machine_set_memdev(Object *obj, const c=
har *value, Error **errp)
>>      ms->ram_memdev_id =3D g_strdup(value);
>>  }
>>
>> +static char *machine_get_default_audiodev(Object *obj, Error **errp)
>> +{
>> +    MachineState *ms =3D MACHINE(obj);
>> +
>> +    return g_strdup(ms->default_audiodev);
>> +}
>> +
>> +static void machine_set_default_audiodev(Object *obj, const char *value,
>> +                                         Error **errp)
>> +{
>> +    MachineState *ms =3D MACHINE(obj);
>> +
>> +    g_free(ms->default_audiodev);
>> +    ms->default_audiodev =3D g_strdup(value);
>> +}
>> +
>>  HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *mach=
ine)
>>  {
>>      int i;
>> @@ -867,6 +883,12 @@ static void machine_class_init(ObjectClass *oc, voi=
d *data)
>>      object_class_property_set_description(oc, "confidential-guest-suppo=
rt",
>>                                            "Set confidential guest schem=
e to support");
>>
>> +    object_class_property_add_str(oc, "default-audiodev",
>> +                                  machine_get_default_audiodev,
>> +                                  machine_set_default_audiodev);
>> +    object_class_property_set_description(oc, "default-audiodev",
>> +                                          "Audiodev to use for default =
machine devices");
>> +
>
>Hmm, if we add this, people might reasonably question why this default
>audiodev can't be used for everything, instead of making other 'audiodev'
>parameter mandatory.
>
>For the x86 machines we have a property tied specifically to the PC
>speaker.
>
>  -machine ...,pcspk-audiodev=3D<name>
>
>
>If we assume that's the desired pattern, then every machine which has
>a built-in audio device should gain some  "{$device}-audiodev" proprerty
>where '$device' is some reasonable name for the built-in audio device
>of the machine.  This would work better if a machine ended up with
>two built-in audio devices and needed separate audiodevs for them.
>

Which is what I wanted to avoid because it creates huge amount of names
which are not easy to find out.  I imagine that the default audio
devices which already exist are not much known and mostly used as-is
without the users needing to figure out what they are.  Especially those
that are enabled even with -nodefaults.  And I expect people who just
want to just emulate an old Palm do not really want to specify the names
of both devices which need an audiodev, especially when one of them is a
touch display or something weird like that.  Moreover you cannot specify
anything for these devices currently, so you cannot use two different
backends now.

I understand that the naming suggests it would be a default audiodev for
anything without one explicitly specified, but I could not think of any
other suitable name.  And I felt like having a default that would be
used for all devices defeats the purpose of removing default audiodev.

If adding a machine option for every such device is the way to go, then
I can try changing that.  Hopefully that would not turn into another
18-patch series =3D)  So should I prefer that route?

>
>>      /* For compatibility */
>>      object_class_property_add_str(oc, "memory-encryption",
>>          machine_get_memory_encryption, machine_set_memory_encryption);
>> @@ -961,6 +983,7 @@ static void machine_finalize(Object *obj)
>>      g_free(ms->device_memory);
>>      g_free(ms->nvdimms_state);
>>      g_free(ms->numa_state);
>> +    g_free(ms->default_audiodev);
>>  }
>>
>>  bool machine_usb(MachineState *machine)
>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>> index d64b5481e834..5be1de50af03 100644
>> --- a/include/hw/boards.h
>> +++ b/include/hw/boards.h
>> @@ -346,6 +346,7 @@ struct MachineState {
>>       */
>>      MemoryRegion *ram;
>>      DeviceMemoryState *device_memory;
>> +    char *default_audiodev;
>>
>>      ram_addr_t ram_size;
>>      ram_addr_t maxram_size;
>> --
>> 2.35.1
>>
>
>With regards,
>Daniel
>--=20
>|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrang=
e :|
>|: https://libvirt.org         -o-            https://fstop138.berrange.co=
m :|
>|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrang=
e :|
>

--a6QkXSPlD76aLoSD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiXAnXDYdKAaCyvS1CB/CnyQXht0FAmJrzcoACgkQCB/CnyQX
ht1L6hAAmMVZ/BUDTGZsVp8Msf8pXJ6hsh+4ky0mjtXrSKwsf5j8EBZCgZsS2bkv
InA3tu9fZXKKiEv8EuZOjwRlqcsAw/m7aLbQRfuLlt2VBe9OBdiPBjzx471B2oTK
50TnrfcbMgwjoejjcM+xzjLfHH942DYL/WZwzqtsRCA1FJ1uXUM2ntU69rsc6IhE
xv3oLb+lE4icR5VOsXi+o6aIw5BMftBhZfHa/BwdstO2hrEChtQdY7afNRaRkSmF
MjVC0a8c7XqK57WZzqz5zAk+0RCI3s4p+hOwA3v7c1IeTv09h9euMqZ69kLyMylo
dOjos3hEF/accNB35M6SBzhzXwMjkLqe2EPHGo8cJqa+nz3I8dd7sje9yHhXr+nb
WzHpwZBJ705OPviOPqfBKMtl3mlfoRqoDxgcUDonoMOlUuWpNmdyKT7oP9Io8mMk
I6DvX0zBIgjRcC/2VAFjvaqVaeCD5TF51lXUEh07YH44JFseMAxCX+af5hxbRvhA
K/hsDnPHXmJx5c9wHFCwoRHPLq5CMpbMrmpsnv71QuF033zRPjV9q2N8x1vm/XKm
OwLjhL4ydxXcU+s43PiD8qbS63fgLlyYPFIwYdQynC51hk+1qhiWbQFTaoU0MaUw
p06DoTBa9bk8r1+vL4uzVlLm1Pci2SZ0IKWmDT21m+aVxJ2coYk=
=SorZ
-----END PGP SIGNATURE-----

--a6QkXSPlD76aLoSD--


