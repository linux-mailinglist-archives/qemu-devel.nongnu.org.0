Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABC354A3C2
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 03:46:19 +0200 (CEST)
Received: from localhost ([::1]:48878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0vdK-0003em-1y
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 21:46:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o0vbJ-0002ch-5P
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 21:44:13 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:41667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o0vbD-0005L5-JX
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 21:44:10 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 g10-20020a17090a708a00b001ea8aadd42bso7747470pjk.0
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 18:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=hmWUWg9u3A5gAMVUoQkEri6hK2ftC5pcPdAsfO9H0VE=;
 b=J70BtwnUVF0Uiyi2stcZupFtVos4N+xOY3b/kBj9nQSe83v0eNelAIPSw6GfQf5Ntw
 omdtYnig4nygEHEAjCwvfe1791mGuiDIDtucEk1PL+ioXoH+6NpmBd7yQ6N4pRKVuvQV
 NJpyNT1HPLuaMWkbmhtp/xqpT3dnM4N6ADXq+kejSql/HQ7WyALFkMg9QynhXwMDSIma
 ezAWhVKrf+jXPJ5PrUxiaUODNpY0EyQrzsvV0z2PQbzUQkaOKFsichyvakEd0nzsvhBs
 61s3j8VYkRJdUTvBAzc+WhcenvOleDW8aPhzphuPYFM6wPcZGV9SqieeEwhk3nhwMHFC
 z8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=hmWUWg9u3A5gAMVUoQkEri6hK2ftC5pcPdAsfO9H0VE=;
 b=O7BAZFuTwi7427HoRq5G64FpR+jylHq6HwCvCoNUEGYCGWmG9nKojovhxFTTXs1O7V
 D9qUwg2XOrVYYcBEqLVjlxD21iPzKDwsKEjz/fgyyRAbiLaDDhfZhoEdXW+mS1QmzU0V
 EOPysXq0RKDpZ+NZt/y0s3+yP507/Nb5j3UashQR5JXxlS2VzgxFe6dW84FJu9v5iLpY
 M8VDOe60JdK+JRtmZkC9VoOvEYxxJGiFfEokHCvwOfzcfhdQ06WE7odfqsePNk0hq7RS
 Wp8QPI6UZm+1qi1T1jj0gVy1eefuFWTgJ2UP9zLN/bLGuzm+LPcivn5/ZAeas0BTfbW5
 aLHA==
X-Gm-Message-State: AJIora9RiV0J3VrM+XK21VZv/nps4vlabkdiO8R+B4sm3re1T1ZMloPl
 7tjzeBI6LCMxtSV0Q9dQxP9bRg==
X-Google-Smtp-Source: AGRyM1sZSMBy5/rzfbAn5MCEaWgTRcV2kphwoltTJoXtyQP2nEybwXRUAbpghQsqaI1Npt5GCy16cg==
X-Received: by 2002:a17:90b:4a8c:b0:1e2:f378:631d with SMTP id
 lp12-20020a17090b4a8c00b001e2f378631dmr1767955pjb.58.1655171045825; 
 Mon, 13 Jun 2022 18:44:05 -0700 (PDT)
Received: from ?IPv6:240e:305:1b80:6d48:406a:e2e:7ace:cfbf?
 ([240e:305:1b80:6d48:406a:e2e:7ace:cfbf])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a17090301cc00b0015f2b3bc97asm5772923plh.13.2022.06.13.18.44.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jun 2022 18:44:05 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [Phishing Risk] [External] Re: [PATCH 4/7] crypto: Add ECDSA key
 parser
From: =?utf-8?B?5L2V56OK?= <helei.sig11@bytedance.com>
In-Reply-To: <50d14368-8dca-0b11-d4d5-f3cd8814fe82@amsat.org>
Date: Tue, 14 Jun 2022 09:43:59 +0800
Cc: =?utf-8?B?5L2V56OK?= <helei.sig11@bytedance.com>,
 "S. Tsirkin, Michael" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 =?utf-8?Q?=22Daniel_P_=2E_Berrang=C3=A9=22?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, pizhenwei@bytedance.com, jasowang@redhat.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <F4394DBC-4594-4A45-8B11-048088A2D6D7@bytedance.com>
References: <20220613084531.8086-1-helei.sig11@bytedance.com>
 <20220613084531.8086-5-helei.sig11@bytedance.com>
 <50d14368-8dca-0b11-d4d5-f3cd8814fe82@amsat.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=helei.sig11@bytedance.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Philippe, lots of thanks for your review!

> On Jun 13, 2022, at 10:19 PM, Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org> wrote:
>=20
> On 13/6/22 10:45, Lei He wrote:
>> Add ECDSA key parser and ECDSA signautre parser.
>> Signed-off-by: lei he <helei.sig11@bytedance.com>
>> ---
>>  crypto/ecdsakey-builtin.c.inc | 248 =
++++++++++++++++++++++++++++++++++++++++++
>>  crypto/ecdsakey.c             | 118 ++++++++++++++++++++
>>  crypto/ecdsakey.h             |  66 +++++++++++
>>  crypto/meson.build            |   1 +
>>  4 files changed, 433 insertions(+)
>>  create mode 100644 crypto/ecdsakey-builtin.c.inc
>>  create mode 100644 crypto/ecdsakey.c
>>  create mode 100644 crypto/ecdsakey.h
>> diff --git a/crypto/ecdsakey-builtin.c.inc =
b/crypto/ecdsakey-builtin.c.inc
>> new file mode 100644
>> index 0000000000..5da317ec44
>> --- /dev/null
>> +++ b/crypto/ecdsakey-builtin.c.inc
>> @@ -0,0 +1,248 @@
>> +/*
>> + * QEMU Crypto akcipher algorithms
>> + *
>> + * Copyright (c) 2022 Bytedance
>> + * Author: lei he <helei.sig11@bytedance.com>
>> + *
>> + * This library is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU Lesser General Public
>> + * License as published by the Free Software Foundation; either
>> + * version 2.1 of the License, or (at your option) any later =
version.
>> + *
>> + * This library is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> + * Lesser General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU Lesser General Public
>> + * License along with this library; if not, see =
<http://www.gnu.org/licenses/>.
>> + *
>> + */
>> +
>> +#include "der.h"
>> +#include "ecdsakey.h"
>> +
>> +#define QCRYPTO_ECDSA_PUBKEY_FMT_UNCOMPRESSED 0x04
>> +
>> +static int extract_mpi(void *ctx, const uint8_t *value,
>> +                       size_t vlen, Error **errp)
>> +{
>> +    QCryptoAkCipherMPI *mpi =3D (QCryptoAkCipherMPI *)ctx;
>> +    if (vlen =3D=3D 0) {
>> +        error_setg(errp, "Empty mpi field");
>> +        return -1;
>=20
> Functions taking Error* param usually return a boolean.

It's a good idea to make such functions that only return 0 or -1 return =
bool directly, but this change=20
will require modification of rsakey related code. If you strongly =
request it, I will modify it in another patch.

>=20
>> +    }
>> +    mpi->data =3D g_memdup2(value, vlen);
>> +    mpi->len =3D vlen;
>> +    return 0;
>> +}
>> +
>> +static int extract_version(void *ctx, const uint8_t *value,
>> +                           size_t vlen, Error **errp)
>> +{
>> +    uint8_t *version =3D (uint8_t *)ctx;
>> +    if (vlen !=3D 1 || *value > 1) {
>> +        error_setg(errp, "Invalid rsakey version");
>> +        return -1;
>> +    }
>> +    *version =3D *value;
>> +    return 0;
>> +}
>> +
>> +static int extract_cons_content(void *ctx, const uint8_t *value,
>> +                                size_t vlen, Error **errp)
>> +{
>> +    const uint8_t **content =3D (const uint8_t **)ctx;
>> +    if (vlen =3D=3D 0) {
>> +        error_setg(errp, "Empty sequence");
>> +        return -1;
>> +    }
>> +    *content =3D value;
>=20
> You need to check (vlen >=3D sizeof(uint8_t *)) to avoid overrun.

The decoder will parse the meta data of ASN1 types and pass the real =
data part to the callback function.=20
The above statement only saves the starting address of the =E2=80=98data =
part' and does not actually access the=20
data, so there is no need to check the size of vlen.=20

>=20
>> +    return 0;
>> +}
>> +
>> +static int __qcrypto_akcipher_builtin_ecdsa_pubkey_parse(
>> +    QCryptoAkCipherECDSAKey *ecdsa,
>> +    const uint8_t *key, size_t keylen, Error **errp);
>=20
> Why use the reserved __prefix?

I will fix it later.


