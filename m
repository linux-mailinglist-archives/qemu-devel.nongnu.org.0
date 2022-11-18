Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE7E62F880
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 15:56:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow2m8-0003Ie-1C; Fri, 18 Nov 2022 09:55:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ow2m4-0003IK-TE
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 09:55:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ow2m2-0006tq-RT
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 09:55:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668783321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ySJXdIfLfWxhrd3x4LU5ddJUwaAIP0PXtdpGbSfQgWY=;
 b=cxfvXl6oP+zdxofs7LC1fID3cILI+ay6zhp78b6CGZuPQzjjLSz5qIufrK6GfVtcKqNb7O
 xe82gW+/HAET9na7mWHJoE6/bZyxCASY70U4CJnGy3FWS0PTeJSUDO+3+xGFFz5caFC2BN
 VQF13Sw9UX2kzxMIikqZ1NJ/ZS8A8BQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-278-xVMeadfwO7mSeaNSp4xH8A-1; Fri, 18 Nov 2022 09:55:20 -0500
X-MC-Unique: xVMeadfwO7mSeaNSp4xH8A-1
Received: by mail-ej1-f71.google.com with SMTP id
 hq18-20020a1709073f1200b007ade8dd3494so3143868ejc.2
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 06:55:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ySJXdIfLfWxhrd3x4LU5ddJUwaAIP0PXtdpGbSfQgWY=;
 b=zUPPiswrmA5+odJlwzjzACgw+cbywXephFNeVNvVl22qtk1Lycw8ouXz9Wnxqshazb
 4mJqhgwCvwagKrmpBIpDzKyMdW0unx95Bl8N/aRp40jt1PQM5iPyKoQfBTc5fhbPgIKw
 vVq+Hu2fXFfsVBALUYli3aB/58ZOL7AfrzL+W3KJVOXSqE7yGGPGhNM+i8g601EY9QGV
 XwIeA0aHb30hJ889sEPgfQqu1mJPPpT04IMUxBn/ITDWCzirEBwVsKAyEpbPPqW2+lIB
 g0v5Z2gNoy/EFV613vdJJ9AEV1gc3dsfTylLfk6PWZciXGUn4TuLLdlEdpZqvV7gBRcC
 H1xg==
X-Gm-Message-State: ANoB5pkw+meekHMVUapdmsQXYR15XmuYppcwT0poqXtSCB6GATmADzF9
 9r5rSXbxCZXfl0NJFhG8Ys4FV4lBzzo1nqLLVR3Rdr1TtJOmnBA6qmex7iM9CuTPHcMsf/TfAzM
 7goD7SNP1nc0NUVo=
X-Received: by 2002:a17:907:b60f:b0:787:8884:78df with SMTP id
 vl15-20020a170907b60f00b00787888478dfmr6108133ejc.246.1668783319431; 
 Fri, 18 Nov 2022 06:55:19 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6tE+18ugmXDEw20UJRJjyxi0bs/Mlyd2Eif1SxjstrMIegbJZugwCSNE6nDCgFtbsleLh/jQ==
X-Received: by 2002:a17:907:b60f:b0:787:8884:78df with SMTP id
 vl15-20020a170907b60f00b00787888478dfmr6108110ejc.246.1668783319110; 
 Fri, 18 Nov 2022 06:55:19 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 r9-20020a17090609c900b0077b2b0563f4sm1793947eje.173.2022.11.18.06.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 06:55:18 -0800 (PST)
Date: Fri, 18 Nov 2022 15:55:17 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Volker =?UTF-8?B?UsO8bWVsaW4=?= <vr_qemu@t-online.de>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 kraxel@redhat.com, qemu-devel@nongnu.org, stefanha@gmail.com
Subject: Re: [PULL v4 46/83] acpi: pc/q35: drop ad-hoc PCI-ISA bridge AML
 routines and let bus ennumeration generate AML
Message-ID: <20221118155517.2a44026d@imammedo.users.ipa.redhat.com>
In-Reply-To: <20221118140836.73d76e08@imammedo.users.ipa.redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-47-mst@redhat.com>
 <d1e1b4a5-1200-dad7-4e82-eacdbd71b92d@t-online.de>
 <20221118140836.73d76e08@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 18 Nov 2022 14:08:36 +0100
Igor Mammedov <imammedo@redhat.com> wrote:

> On Thu, 17 Nov 2022 22:51:46 +0100
> Volker R=C3=BCmelin <vr_qemu@t-online.de> wrote:
[...]
> > since this patch SeaBIOS no longer detects the PS/2 keyboard. This mean=
s=20
> > there's no keyboard in SeaBIOS, GRUB or FreeDOS. OVMF and Linux detect=
=20
> > the PS/2 keyboard without issues.
> >=20
> > Here are a few lines from the SeaBIOS debug log.
> >=20
> > table(50434146)=3D0x007e1971 (via rsdt)
> > ACPI: parse DSDT at 0x007e0040 (len 6449)
> > parse_termlist: parse error, skip from 92/465
> > Scan for VGA option rom
> > Running option rom at c000:0003
> > Start SeaVGABIOS (version rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org)
> >=20
> > and later
> >=20
> > SeaBIOS (version rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org)
> > ACPI: no PS/2 keyboard present =20
it was a bug on SeaBIOS side, we need it to parse Alias term in AML
instead of choking on it

proposed patch:
 https://mail.coreboot.org/hyperkitty/list/seabios@seabios.org/thread/RGPL7=
HESH5U5JRLEO6FP77CZVHZK5J65/

PS:
it's probably too late for it to make into 7.2


