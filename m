Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB6E631A1E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 08:24:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox19M-0000CP-2Z; Mon, 21 Nov 2022 02:23:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ox19J-0000BT-DF
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 02:23:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ox19F-0007u7-Tj
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 02:23:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669015400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M1oijDzSTp+a/zHpI61nuFKYiCIi6q3yF3gOeQZxu7U=;
 b=QWcutL4YcH+tFW6nnGeMijfICvMtuSuomXPb4biewxSMLrDPuG3/XCl9x0Q2ZuF6qiu5Gl
 hR43IHxw+JHypnN+kgIWYhkAt3kgTK2dwcIfoc2fsdHPZ1c0MLrBTWi/jMcol9vFqj08AW
 N5QR4VVvY7z3StVxKe3GcEKqAz9nqA8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-187-70CLI_mOMqeNeHpLV3GzFQ-1; Mon, 21 Nov 2022 02:23:18 -0500
X-MC-Unique: 70CLI_mOMqeNeHpLV3GzFQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 hr21-20020a1709073f9500b007b29ccd1228so6077092ejc.16
 for <qemu-devel@nongnu.org>; Sun, 20 Nov 2022 23:23:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M1oijDzSTp+a/zHpI61nuFKYiCIi6q3yF3gOeQZxu7U=;
 b=Wn2mZsQ3v6+PoTYqIklyh4wlrImYMZ/mLCRHHY+NkfzVmMQwkes7P0xLtVNx9pyFTi
 daZbRuwtSycAnH5etVGz6dkTMbU91uFHYYFV/M8g/y9uSJxKEVUBM0FsAeH7UzekKe/8
 CqwaVvSxWkLu10cgDCfM+L2pYjJ6utRB5YlGKSsjQK3aXtp34z0DOm6b6ztDxTpmWxX2
 yBlVI4WagOMfQURJSI6JuFRZUKphyWgJAEWwl4UH7pzz9pz8BSf2T7GPTvDMTkaUC+8z
 NDHexcltLbVEMbUCjRDvlk2+sOXeCtnzOVvVjrzS0guhWRFUd0Kvo4rmmw00wWipJfzB
 Jvbw==
X-Gm-Message-State: ANoB5pnh2MBrNLgTeSi1Sd3wRo0QSLCo0v1yMwYklXm+kjsmDzt+Sw8p
 bSukAwCRiFePdfJuTHAmjXAdkTxY4rMVgyGp4QFnMzxb/v1q8rX+QL6d44ut/D5csuIHZ0cQGmN
 VX2XCT8xFvBK87NM=
X-Received: by 2002:a17:906:402:b0:7a6:fc0f:6fe6 with SMTP id
 d2-20020a170906040200b007a6fc0f6fe6mr13617264eja.694.1669015397199; 
 Sun, 20 Nov 2022 23:23:17 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7SHg5/d35cAvfbHsxW/lI+s5PTHXc5xP6AC6jpqv2zd2IXIXSXugrGuP6W620dhB4YpysOlw==
X-Received: by 2002:a17:906:402:b0:7a6:fc0f:6fe6 with SMTP id
 d2-20020a170906040200b007a6fc0f6fe6mr13617248eja.694.1669015396977; 
 Sun, 20 Nov 2022 23:23:16 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-u.redhat.com.
 [213.175.37.12]) by smtp.gmail.com with ESMTPSA id
 kb12-20020a1709070f8c00b007a1d4944d45sm4754763ejc.142.2022.11.20.23.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 23:23:16 -0800 (PST)
Date: Mon, 21 Nov 2022 08:23:15 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Volker =?UTF-8?B?UsO8bWVsaW4=?= <vr_qemu@t-online.de>, Peter Maydell
 <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 kraxel@redhat.com, qemu-devel@nongnu.org, stefanha@gmail.com
Subject: Re: [PULL v4 46/83] acpi: pc/q35: drop ad-hoc PCI-ISA bridge AML
 routines and let bus ennumeration generate AML
Message-ID: <20221121082315.4d4a6c78@imammedo.users.ipa.redhat.com>
In-Reply-To: <20221119122129-mutt-send-email-mst@kernel.org>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-47-mst@redhat.com>
 <d1e1b4a5-1200-dad7-4e82-eacdbd71b92d@t-online.de>
 <20221118140836.73d76e08@imammedo.users.ipa.redhat.com>
 <20221118155517.2a44026d@imammedo.users.ipa.redhat.com>
 <20221119122129-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Sat, 19 Nov 2022 12:22:13 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Fri, Nov 18, 2022 at 03:55:17PM +0100, Igor Mammedov wrote:
> > On Fri, 18 Nov 2022 14:08:36 +0100
> > Igor Mammedov <imammedo@redhat.com> wrote:
> >  =20
> > > On Thu, 17 Nov 2022 22:51:46 +0100
> > > Volker R=C3=BCmelin <vr_qemu@t-online.de> wrote: =20
> > [...] =20
> > > > since this patch SeaBIOS no longer detects the PS/2 keyboard. This =
means=20
> > > > there's no keyboard in SeaBIOS, GRUB or FreeDOS. OVMF and Linux det=
ect=20
> > > > the PS/2 keyboard without issues.
> > > >=20
> > > > Here are a few lines from the SeaBIOS debug log.
> > > >=20
> > > > table(50434146)=3D0x007e1971 (via rsdt)
> > > > ACPI: parse DSDT at 0x007e0040 (len 6449)
> > > > parse_termlist: parse error, skip from 92/465
> > > > Scan for VGA option rom
> > > > Running option rom at c000:0003
> > > > Start SeaVGABIOS (version rel-1.16.0-0-gd239552ce722-prebuilt.qemu.=
org)
> > > >=20
> > > > and later
> > > >=20
> > > > SeaBIOS (version rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org)
> > > > ACPI: no PS/2 keyboard present   =20
> > it was a bug on SeaBIOS side, we need it to parse Alias term in AML
> > instead of choking on it
> >=20
> > proposed patch:
> >  https://mail.coreboot.org/hyperkitty/list/seabios@seabios.org/thread/R=
GPL7HESH5U5JRLEO6FP77CZVHZK5J65/
> >=20
> > PS:
> > it's probably too late for it to make into 7.2 =20
>=20
> Right. So revert?

let me check first what happens with migration case,
and maybe I can come up with a temporary hack to avoid aliases on QEMU side,
probably it will be something ugly but should do the job

>=20


