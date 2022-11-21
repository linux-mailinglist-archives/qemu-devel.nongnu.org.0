Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3615631A44
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 08:28:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox1Do-0001yv-FZ; Mon, 21 Nov 2022 02:28:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ox1Dm-0001yh-AG
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 02:28:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ox1Dk-0000Sb-Nk
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 02:28:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669015679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+1nfwIhCTzkBJXl7MkqjNsiEMPG3UqffwcS2HFlG/Qk=;
 b=dJ7tQfAP1IqAHfjDwm5u169v6jVmb8HWB0ueJf/L/k/SLI1l83VdohSN9ecB2avN8Rdz4h
 8HUQgGX5opNK8XJXUI4P962JGjXhLig5ANnd1kS3LlNj8w41OxMvUAk+WWTQAhu665yL/P
 5MBjOsyBEOwSpAosXrmCGdXf+Q/RcjY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-88-UPX5q9tRNyetLrqJi9BVTw-1; Mon, 21 Nov 2022 02:27:58 -0500
X-MC-Unique: UPX5q9tRNyetLrqJi9BVTw-1
Received: by mail-ej1-f71.google.com with SMTP id
 hs34-20020a1709073ea200b007ad86f91d39so6164979ejc.10
 for <qemu-devel@nongnu.org>; Sun, 20 Nov 2022 23:27:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+1nfwIhCTzkBJXl7MkqjNsiEMPG3UqffwcS2HFlG/Qk=;
 b=ZO7o4VGYqRLdE0LpZIIRbbECiXRtOzUwFWqQfPtgxgT4TJzW0CNX9vfMbUi24dgokR
 Wr10NsGZVrVZAfplIE8re+YPLo5T2FEVqw8ghQ88/vEGV7zLLzaOS9MStUv2xUb8Pm+V
 cFDWtl8jd00hWzYXeyb0xgjlRVNxseLzMISAnKhHQyr5/0C++Cz2b7YwthwY40y+9iFZ
 drBRNDHC834/WlPjaFwV915O9flU5TvpJlTtezr7N//ggBK3BOrvggkJntDsd0jLAFuX
 SjHllDwmI9na3hWH4coo07Cko5mQeEMW/TxlNVpSQwnjjzfALanFV0LdxRWM2TDC0gF1
 Br/Q==
X-Gm-Message-State: ANoB5pnp2W8DfDq4fJK4SclrXDOTgXJqpneeiqFIVaD1/t1z6bq4qdCo
 UFtLkATkIIPt+OWdFDn1jMEj3vlaU7r/t1+WxgHQ+6tGoHdNFmNzhaPab8/D6cisC4r+0s7xXbd
 MZbOpRSnwuEz7XfA=
X-Received: by 2002:a17:906:2dcb:b0:7b2:8a70:8fb7 with SMTP id
 h11-20020a1709062dcb00b007b28a708fb7mr14406934eji.163.1669015676847; 
 Sun, 20 Nov 2022 23:27:56 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4IBg6vzOecmNALntA572OWyrVMoZwsZ1DHWQXmFnwG3QF5eX6dzgewqUMg5CUK1XVhBkQ5Ew==
X-Received: by 2002:a17:906:2dcb:b0:7b2:8a70:8fb7 with SMTP id
 h11-20020a1709062dcb00b007b28a708fb7mr14406920eji.163.1669015676656; 
 Sun, 20 Nov 2022 23:27:56 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-u.redhat.com.
 [213.175.37.12]) by smtp.gmail.com with ESMTPSA id
 g3-20020aa7c843000000b0043bbb3535d6sm4811700edt.66.2022.11.20.23.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 23:27:56 -0800 (PST)
Date: Mon, 21 Nov 2022 08:27:55 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Volker =?UTF-8?B?UsO8bWVsaW4=?= <vr_qemu@t-online.de>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 kraxel@redhat.com, stefanha@gmail.com, qemu-devel@nongnu.org
Subject: Re: [PULL v4 46/83] acpi: pc/q35: drop ad-hoc PCI-ISA bridge AML
 routines and let bus ennumeration generate AML
Message-ID: <20221121082755.6b0de000@imammedo.users.ipa.redhat.com>
In-Reply-To: <d40911ad-201f-7367-cb3e-5fcaf5ad4710@t-online.de>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-47-mst@redhat.com>
 <d1e1b4a5-1200-dad7-4e82-eacdbd71b92d@t-online.de>
 <20221118140836.73d76e08@imammedo.users.ipa.redhat.com>
 <20221118155517.2a44026d@imammedo.users.ipa.redhat.com>
 <d40911ad-201f-7367-cb3e-5fcaf5ad4710@t-online.de>
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

On Sat, 19 Nov 2022 09:49:39 +0100
Volker R=C3=BCmelin <vr_qemu@t-online.de> wrote:

> Am 18.11.22 um 15:55 schrieb Igor Mammedov:
> > On Fri, 18 Nov 2022 14:08:36 +0100
> > Igor Mammedov <imammedo@redhat.com> wrote:
> > =20
> >> On Thu, 17 Nov 2022 22:51:46 +0100
> >> Volker R=C3=BCmelin <vr_qemu@t-online.de> wrote: =20
> > [...] =20
> >>> since this patch SeaBIOS no longer detects the PS/2 keyboard. This me=
ans
> >>> there's no keyboard in SeaBIOS, GRUB or FreeDOS. OVMF and Linux detect
> >>> the PS/2 keyboard without issues.
> >>>
> >>> Here are a few lines from the SeaBIOS debug log.
> >>>
> >>> table(50434146)=3D0x007e1971 (via rsdt)
> >>> ACPI: parse DSDT at 0x007e0040 (len 6449)
> >>> parse_termlist: parse error, skip from 92/465
> >>> Scan for VGA option rom
> >>> Running option rom at c000:0003
> >>> Start SeaVGABIOS (version rel-1.16.0-0-gd239552ce722-prebuilt.qemu.or=
g)
> >>>
> >>> and later
> >>>
> >>> SeaBIOS (version rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org)
> >>> ACPI: no PS/2 keyboard present =20
> > it was a bug on SeaBIOS side, we need it to parse Alias term in AML
> > instead of choking on it
> >
> > proposed patch:
> >   https://mail.coreboot.org/hyperkitty/list/seabios@seabios.org/thread/=
RGPL7HESH5U5JRLEO6FP77CZVHZK5J65/
> >
> > PS:
> > it's probably too late for it to make into 7.2
> > =20
>=20
> The proposed patch works.
>=20
> It may still be an option to revert the commit 47a373faa6 (acpi: pc/q35:=
=20
> drop ad-hoc PCI-ISA bridge AML routines and let bus ennumeration=20
> generate AML). If an older QEMU version is migrated to QEMU 7.2.0 and=20
> later and the guest reboots afterwards, it may end up without a working=20
> keyboard because the migrated SeaBIOS is an older version.

ACPI blobs generated on old QEMU should be migrated as well,
so I'd expect it should be fine.
Problem will manifest itself only after VM was shut down and started anew.

Anyways lets see if a QEMU workaround is possible.

> With best regards,
> Volker
>=20


