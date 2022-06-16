Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EBC54E803
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 18:47:30 +0200 (CEST)
Received: from localhost ([::1]:33644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1seW-0006MO-Ql
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 12:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o1sbo-0005Is-S2
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:44:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o1sbk-00082j-Uj
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:44:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655397875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rSKr23iLE1cFIpzDb6qtGpTEmgvKl8I7MRAUiABwEOA=;
 b=MX2tL332omi/ByjnogbSgWq+1pwXcydtgV/9qciwCCCqST1hMQkrJfBoM0c+31QKui9zzw
 JbsgP1dpKGcvyxvpp4zuf7EJnKiY3rR9rViKJyRBZ9Q6lXJsUh5NmU21qG1JPn4zp+Cdp5
 l1HduHF8cMND81Y82aMNK0dQdQpNFmc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-f6h_f-SXNp2JZFN6xXYCDA-1; Thu, 16 Jun 2022 12:44:33 -0400
X-MC-Unique: f6h_f-SXNp2JZFN6xXYCDA-1
Received: by mail-wr1-f70.google.com with SMTP id
 k3-20020adfb343000000b0021a356f95c8so383990wrd.5
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 09:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=rSKr23iLE1cFIpzDb6qtGpTEmgvKl8I7MRAUiABwEOA=;
 b=vc6G1vIYXbrd8TghYqQQed7nWu1PNYxIZal2dlWWsqd7JoYpidTWdUZKO/yQsoUDHX
 X7frti8GWVMftXgdxjR+IBq07rwTev2wYr4lvIMyzuYXUTTnGlTyxb1UVJIJ3zNI07L3
 l7fOfugHzLvVclaJt1UG90QJYrTcC1dSKpUfOd/9dMbMIOFEPdQgD7OH9dLAXS9R5DjK
 JkidDHFVHoO11tZVkJKRQi3yRWXWRoOV/nKWznaxFrmNZuVDkYDwtcAOkQyBAFRcnPTd
 8FEJvt0XCEtoLCnP08Tmftw2iTc+gypb4EO+NYHSdpMkYdKy7i4rZnY6qx1I/0eEweWd
 1AIQ==
X-Gm-Message-State: AJIora80ajCY3/wyrymAbeb+XuOlrQWw0JrMTSvkL5KKSO/NvnZ6mT/j
 0Y43wD9L1TBCiXFjHfo/k9nzCueXkxz4O/aHfqhCjpy7nEqyM0ciXhOZQIP2J6ZivQy31RqgDBw
 NRzvkhRFOmIOdDvE=
X-Received: by 2002:a5d:610f:0:b0:21a:ba8:13ad with SMTP id
 v15-20020a5d610f000000b0021a0ba813admr5354983wrt.594.1655397872559; 
 Thu, 16 Jun 2022 09:44:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sHcpyNEUfIQvk0uifS+NqSBSuc85PberZJ3PYLE41tRfHJkl4A+50dq9Hn1p73tnVEsAmOvw==
X-Received: by 2002:a5d:610f:0:b0:21a:ba8:13ad with SMTP id
 v15-20020a5d610f000000b0021a0ba813admr5354967wrt.594.1655397872262; 
 Thu, 16 Jun 2022 09:44:32 -0700 (PDT)
Received: from redhat.com ([2.53.13.204]) by smtp.gmail.com with ESMTPSA id
 z7-20020a056000110700b0020c5253d8f7sm2311123wrw.67.2022.06.16.09.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 09:44:31 -0700 (PDT)
Date: Thu, 16 Jun 2022 12:44:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: =?utf-8?B?5L2V56OK?= <helei.sig11@bytedance.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 =?iso-8859-1?B?IkRhbmllbCBQIC4gQmVycmFuZ+ki?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, pizhenwei@bytedance.com, jasowang@redhat.com
Subject: Re: [Phishing Risk] [External] Re: [PATCH 4/7] crypto: Add ECDSA key
 parser
Message-ID: <20220616124414-mutt-send-email-mst@kernel.org>
References: <20220613084531.8086-1-helei.sig11@bytedance.com>
 <20220613084531.8086-5-helei.sig11@bytedance.com>
 <50d14368-8dca-0b11-d4d5-f3cd8814fe82@amsat.org>
 <F4394DBC-4594-4A45-8B11-048088A2D6D7@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F4394DBC-4594-4A45-8B11-048088A2D6D7@bytedance.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, Jun 14, 2022 at 09:43:59AM +0800, 何磊 wrote:
> Hi Philippe, lots of thanks for your review!
> 
> > On Jun 13, 2022, at 10:19 PM, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> > 
> > On 13/6/22 10:45, Lei He wrote:
> >> Add ECDSA key parser and ECDSA signautre parser.
> >> Signed-off-by: lei he <helei.sig11@bytedance.com>
> >> ---
> >>  crypto/ecdsakey-builtin.c.inc | 248 ++++++++++++++++++++++++++++++++++++++++++
> >>  crypto/ecdsakey.c             | 118 ++++++++++++++++++++
> >>  crypto/ecdsakey.h             |  66 +++++++++++
> >>  crypto/meson.build            |   1 +
> >>  4 files changed, 433 insertions(+)
> >>  create mode 100644 crypto/ecdsakey-builtin.c.inc
> >>  create mode 100644 crypto/ecdsakey.c
> >>  create mode 100644 crypto/ecdsakey.h
> >> diff --git a/crypto/ecdsakey-builtin.c.inc b/crypto/ecdsakey-builtin.c.inc
> >> new file mode 100644
> >> index 0000000000..5da317ec44
> >> --- /dev/null
> >> +++ b/crypto/ecdsakey-builtin.c.inc
> >> @@ -0,0 +1,248 @@
> >> +/*
> >> + * QEMU Crypto akcipher algorithms
> >> + *
> >> + * Copyright (c) 2022 Bytedance
> >> + * Author: lei he <helei.sig11@bytedance.com>
> >> + *
> >> + * This library is free software; you can redistribute it and/or
> >> + * modify it under the terms of the GNU Lesser General Public
> >> + * License as published by the Free Software Foundation; either
> >> + * version 2.1 of the License, or (at your option) any later version.
> >> + *
> >> + * This library is distributed in the hope that it will be useful,
> >> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> >> + * Lesser General Public License for more details.
> >> + *
> >> + * You should have received a copy of the GNU Lesser General Public
> >> + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> >> + *
> >> + */
> >> +
> >> +#include "der.h"
> >> +#include "ecdsakey.h"
> >> +
> >> +#define QCRYPTO_ECDSA_PUBKEY_FMT_UNCOMPRESSED 0x04
> >> +
> >> +static int extract_mpi(void *ctx, const uint8_t *value,
> >> +                       size_t vlen, Error **errp)
> >> +{
> >> +    QCryptoAkCipherMPI *mpi = (QCryptoAkCipherMPI *)ctx;
> >> +    if (vlen == 0) {
> >> +        error_setg(errp, "Empty mpi field");
> >> +        return -1;
> > 
> > Functions taking Error* param usually return a boolean.
> 
> It's a good idea to make such functions that only return 0 or -1 return bool directly, but this change 
> will require modification of rsakey related code. If you strongly request it, I will modify it in another patch.
> 
> > 
> >> +    }
> >> +    mpi->data = g_memdup2(value, vlen);
> >> +    mpi->len = vlen;
> >> +    return 0;
> >> +}
> >> +
> >> +static int extract_version(void *ctx, const uint8_t *value,
> >> +                           size_t vlen, Error **errp)
> >> +{
> >> +    uint8_t *version = (uint8_t *)ctx;
> >> +    if (vlen != 1 || *value > 1) {
> >> +        error_setg(errp, "Invalid rsakey version");
> >> +        return -1;
> >> +    }
> >> +    *version = *value;
> >> +    return 0;
> >> +}
> >> +
> >> +static int extract_cons_content(void *ctx, const uint8_t *value,
> >> +                                size_t vlen, Error **errp)
> >> +{
> >> +    const uint8_t **content = (const uint8_t **)ctx;
> >> +    if (vlen == 0) {
> >> +        error_setg(errp, "Empty sequence");
> >> +        return -1;
> >> +    }
> >> +    *content = value;
> > 
> > You need to check (vlen >= sizeof(uint8_t *)) to avoid overrun.
> 
> The decoder will parse the meta data of ASN1 types and pass the real data part to the callback function. 
> The above statement only saves the starting address of the ‘data part' and does not actually access the 
> data, so there is no need to check the size of vlen. 
> 
> > 
> >> +    return 0;
> >> +}
> >> +
> >> +static int __qcrypto_akcipher_builtin_ecdsa_pubkey_parse(
> >> +    QCryptoAkCipherECDSAKey *ecdsa,
> >> +    const uint8_t *key, size_t keylen, Error **errp);
> > 
> > Why use the reserved __prefix?
> 
> I will fix it later.

expect a new version then


