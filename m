Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2ECC5147C4
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 13:08:11 +0200 (CEST)
Received: from localhost ([::1]:39858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkOTp-0003IT-Is
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 07:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1nkO0Q-0004pA-L8
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 06:37:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1nkO0N-0007Yi-2B
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 06:37:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651228659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rt0cuKRb79JXhRZPPQHSx9P4SMazNEZVYiIoQ/HGAVk=;
 b=el/4mL6AnrqlWMBEztxFAbbL1kr6iHAT2dykWGlkiQ49TFAYeCGigtX2b90o2xByeLiFpN
 UwR2oNwPJoBQvNF2IGeTqZXcGbX6PBiJYSbP54MVx2Me/jq/bplroyNCtgx+pSUjM+fg2u
 iMtMCXVDTRlVIedvTm/oDUGZxhZmPzI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-282-D4UpmozhNIyfSx75hmmELA-1; Fri, 29 Apr 2022 06:37:37 -0400
X-MC-Unique: D4UpmozhNIyfSx75hmmELA-1
Received: by mail-wr1-f70.google.com with SMTP id
 y13-20020adfc7cd000000b0020ac7c7bf2eso2914393wrg.9
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 03:37:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rt0cuKRb79JXhRZPPQHSx9P4SMazNEZVYiIoQ/HGAVk=;
 b=BIuFVLVlz6ACRN/w/TBWwH2JkNP2su9KAS1LuBQc76Ms8DU/rNX3o0syQOwbEMGrHn
 i9gGLLvFPHNPOmEDQhtfvVtnd0NNXksTj7DB8sbxXFug1CUo5uLxhNQw4JELZhG0OuuP
 +PLSGPSJ6DB3FMHDs3EPQt81NvWW/V6Uqrjdbf3CDDsv8T5572xmMu8xJeLA0kBIK9OT
 vXjSK3VyLLEG995EUoZe54XbiSZAjmwMb2V2moTT8R1HT+IfR4dX0gtx2QRw7dhh5NwI
 fh57jkbBY3mpa9RWQvN3cYA44N8YXLrqzdoVf+UqYp6txv6WUpBX7UfaiTmW7zYcjacc
 nYUg==
X-Gm-Message-State: AOAM530OaKsbRRaMDT7lK5w3gyAEdz2qnZgG+W5S03A34PdnJ2bocliK
 r+hMMv74Gj5eSuwL0x0HI81iDxi017unuf/e6gew9y4la1MGhYncSxpuOBRxE42mnnj3FVC9tOv
 DZPJ0Ws0jOHLe1SI=
X-Received: by 2002:a05:6000:1363:b0:20a:dfae:c142 with SMTP id
 q3-20020a056000136300b0020adfaec142mr17702885wrz.204.1651228656317; 
 Fri, 29 Apr 2022 03:37:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgykOKai4eNaXSGGs8oDgPB3hxWuNJbiUYMth5cdMu/v0UQOzuE8eWxvjgWwImKkoQ8hG7tQ==
X-Received: by 2002:a05:6000:1363:b0:20a:dfae:c142 with SMTP id
 q3-20020a056000136300b0020adfaec142mr17702844wrz.204.1651228655957; 
 Fri, 29 Apr 2022 03:37:35 -0700 (PDT)
Received: from wheatley.localdomain (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 b2-20020adfc742000000b0020ac89e4241sm2448751wrh.31.2022.04.29.03.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 03:37:35 -0700 (PDT)
Received: by wheatley.localdomain (Postfix, from userid 1000)
 id 94F836928A64; Fri, 29 Apr 2022 12:37:34 +0200 (CEST)
Date: Fri, 29 Apr 2022 12:37:34 +0200
From: Martin Kletzander <mkletzan@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 05/18] tests/qtest: Specify audiodev= and -audiodev
Message-ID: <Ymu/7pKr3mzxZWmi@wheatley>
References: <cover.1650874791.git.mkletzan@redhat.com>
 <6e7f2808dd40679a415812767b88f2a411fc137f.1650874791.git.mkletzan@redhat.com>
 <YmalXbNVd/knTxnB@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZIIXTvDe+IvHF93V"
Content-Disposition: inline
In-Reply-To: <YmalXbNVd/knTxnB@redhat.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mkletzan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Darren Kenny <darren.kenny@oracle.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ZIIXTvDe+IvHF93V
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2022 at 02:42:53PM +0100, Daniel P. Berrang=E9 wrote:
>On Mon, Apr 25, 2022 at 10:21:48AM +0200, Martin Kletzander wrote:
>> This will enable removing deprecated default audiodev support.
>>
>> I did not figure out how to make the audiodev represented as an
>> interface node, so this is a workaround.  I am not sure what would be
>> the proper way.
>
>Not sure I understand what you mean by this 'interface node' reference ?
>

I meant a qos node, I though that would be the proper way, but since
audiodev is a backend and not a device I wasn't able to plug it in using
qos_node_consumes().  Maybe I was just trying too hard.

>The code looks fine though
>
>Reviewed-by: Daniel P. Berrang=E9 <berrange@redhat.com>
>
>>
>> Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
>> ---
>>  tests/qtest/ac97-test.c                 |  3 ++-
>>  tests/qtest/es1370-test.c               |  3 ++-
>>  tests/qtest/fuzz/generic_fuzz_configs.h |  6 ++++--
>>  tests/qtest/intel-hda-test.c            | 15 ++++++++++-----
>>  4 files changed, 18 insertions(+), 9 deletions(-)
>>
>> diff --git a/tests/qtest/ac97-test.c b/tests/qtest/ac97-test.c
>> index e09f2495d24d..9711f1f6d966 100644
>> --- a/tests/qtest/ac97-test.c
>> +++ b/tests/qtest/ac97-test.c
>> @@ -45,7 +45,8 @@ static void *ac97_create(void *pci_bus, QGuestAllocato=
r *alloc, void *addr)
>>  static void ac97_register_nodes(void)
>>  {
>>      QOSGraphEdgeOptions opts =3D {
>> -        .extra_device_opts =3D "addr=3D04.0",
>> +        .extra_device_opts =3D "addr=3D04.0,audiodev=3Daudio0",
>> +        .before_cmd_line =3D "-audiodev driver=3Dnone,id=3Daudio0",
>>      };
>>      add_qpci_address(&opts, &(QPCIAddress) { .devfn =3D QPCI_DEVFN(4, 0=
) });
>>
>> diff --git a/tests/qtest/es1370-test.c b/tests/qtest/es1370-test.c
>> index 2fd7fd2d3d30..5facda8d0d8d 100644
>> --- a/tests/qtest/es1370-test.c
>> +++ b/tests/qtest/es1370-test.c
>> @@ -46,7 +46,8 @@ static void *es1370_create(void *pci_bus, QGuestAlloca=
tor *alloc, void *addr)
>>  static void es1370_register_nodes(void)
>>  {
>>      QOSGraphEdgeOptions opts =3D {
>> -        .extra_device_opts =3D "addr=3D04.0",
>> +        .extra_device_opts =3D "addr=3D04.0,audiodev=3Daudio0",
>> +        .before_cmd_line =3D "-audiodev driver=3Dnone,id=3Daudio0",
>>      };
>>      add_qpci_address(&opts, &(QPCIAddress) { .devfn =3D QPCI_DEVFN(4, 0=
) });
>>
>> diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/=
generic_fuzz_configs.h
>> index 004c701915e1..84a93b3c350b 100644
>> --- a/tests/qtest/fuzz/generic_fuzz_configs.h
>> +++ b/tests/qtest/fuzz/generic_fuzz_configs.h
>> @@ -101,8 +101,10 @@ const generic_fuzz_config predefined_configs[] =3D {
>>      },{
>>          .name =3D "intel-hda",
>>          .args =3D "-machine q35 -nodefaults -device intel-hda,id=3Dhda0=
 "
>> -        "-device hda-output,bus=3Dhda0.0 -device hda-micro,bus=3Dhda0.0=
 "
>> -        "-device hda-duplex,bus=3Dhda0.0",
>> +        "-audiodev driver=3Dnone,id=3Daudio0",
>> +        "-device hda-output,bus=3Dhda0.0,audiodev=3Daudio0 "
>> +        "-device hda-micro,bus=3Dhda0.0,audiodev=3Daudio0 "
>> +        "-device hda-duplex,bus=3Dhda0.0,audiodev=3Daudio0",
>>          .objects =3D "intel-hda",
>>      },{
>>          .name =3D "ide-hd",
>> diff --git a/tests/qtest/intel-hda-test.c b/tests/qtest/intel-hda-test.c
>> index a58c98e4d11b..39ced2bc6ac6 100644
>> --- a/tests/qtest/intel-hda-test.c
>> +++ b/tests/qtest/intel-hda-test.c
>> @@ -11,20 +11,24 @@
>>  #include "libqtest-single.h"
>>
>>  #define HDA_ID "hda0"
>> -#define CODEC_DEVICES " -device hda-output,bus=3D" HDA_ID ".0" \
>> -                      " -device hda-micro,bus=3D" HDA_ID ".0" \
>> -                      " -device hda-duplex,bus=3D" HDA_ID ".0"
>> +#define AUDIODEV " -audiodev driver=3Dnone,id=3Daudio0 "
>> +#define AUDIODEV_REF "audiodev=3Daudio0"
>> +#define CODEC_DEVICES " -device hda-output,bus=3D" HDA_ID ".0," AUDIODE=
V_REF \
>> +                      " -device hda-micro,bus=3D" HDA_ID ".0," AUDIODEV=
_REF \
>> +                      " -device hda-duplex,bus=3D" HDA_ID ".0," AUDIODE=
V_REF
>>
>>  /* Tests only initialization so far. TODO: Replace with functional test=
s */
>>  static void ich6_test(void)
>>  {
>> -    qtest_start("-device intel-hda,id=3D" HDA_ID CODEC_DEVICES);
>> +    qtest_start(AUDIODEV "-device intel-hda,id=3D" HDA_ID CODEC_DEVICES=
);
>>      qtest_end();
>>  }
>>
>>  static void ich9_test(void)
>>  {
>> -    qtest_start("-machine q35 -device ich9-intel-hda,bus=3Dpcie.0,addr=
=3D1b.0,id=3D"
>> +    qtest_start("-machine q35"
>> +                AUDIODEV
>> +                "-device ich9-intel-hda,bus=3Dpcie.0,addr=3D1b.0,id=3D"
>>                  HDA_ID CODEC_DEVICES);
>>      qtest_end();
>>  }
>> @@ -39,6 +43,7 @@ static void test_issue542_ich6(void)
>>      QTestState *s;
>>
>>      s =3D qtest_init("-nographic -nodefaults -M pc-q35-6.2 "
>> +                   AUDIODEV
>>                     "-device intel-hda,id=3D" HDA_ID CODEC_DEVICES);
>>
>>      qtest_outl(s, 0xcf8, 0x80000804);
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

--ZIIXTvDe+IvHF93V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiXAnXDYdKAaCyvS1CB/CnyQXht0FAmJrv+4ACgkQCB/CnyQX
ht2sGxAAkU7Du2pcTJgMvvgcx7KgOfvbK1QKCfUvObt985lZOCnvLkNpEjvF8H9J
H+slPya3Nw0wU11lNL1Hg/UZI/Vl4DOWvIBfpcWbpCcIQKt/WQZR/WtSCp6t1BU4
QLkpgp+tWPUORW6Vdlo4qOK4ouVRTEsD5JoM5vBvP5xZlNqyEZ2OJHuS8HB3UL0v
uIjmWZwbe+DZporHR4mNQPWf2xOjX7fdGRTnDy5vYHqpvazw9Gk43+guvySpdvHw
DLnBurwzufy0XDY4CcwfBQvqUlpDkfZeNpYZzj4xaQ184BopYWKFg1c9kOKLNo/k
3mYQ230v9j47MrqPpxlgekc9qUmp3nBkvsVZrAG6Y7Sq+i9d7eSfc1ddbTakju4L
wRjaL0+hbDlGx2HEeHz+phDHyvDo2CeHQmn4qypbnwKXDrmhCnLeKsRYxKVuUQCn
sBnKnyVraSWMQx5Ky+zAPpj/lCsNtzkWuniRPaauvPHL0fgfb27HC+n57A4m/eXl
uEHBoWmBafJDwaNGi1sjKZPupIzix17RNyvoc1vVmwBkO7M/QkwvTMdbWr26hNdm
CYUXTpwVcycY+9nompH0oK5VzBX2Jft7FU96GIaJQP2Lu8WAwKwVYsBlHX8E1L6Q
AwrAL0aH35vfTAY/Gwe6RVLpIxLoYcS77ASEx5z5B5Z1hDIEDnA=
=r73p
-----END PGP SIGNATURE-----

--ZIIXTvDe+IvHF93V--


