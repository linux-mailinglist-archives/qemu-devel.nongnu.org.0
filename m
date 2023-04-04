Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B36DF6D6051
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 14:27:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjfjd-0006Ie-6l; Tue, 04 Apr 2023 08:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pjfjb-0006IN-F0
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 08:25:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pjfjZ-0008SP-PH
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 08:25:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680611156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OnQ+4V4JUcC+1PmeTVsoyTZvteUrx3UcOw3Ck/zmaiY=;
 b=Sazkcfr/vyIiXCVTOFUfR8AldXPGOvLbJiAdSNblxo62HdY/aYMqkfPFh6eYcNf/tlIzFL
 7Nmd4jqZo/+V/vUhGRSWVS/Ndhj3a0H0bE/FTLOlL7a5jUVluohBg/l2RyH7fJ9UhAikYa
 WGVPPuLbWHxzOcfWQFJVt108duN0Q9A=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-nD5tO-WLOUOSnH2jr3MyVw-1; Tue, 04 Apr 2023 08:25:55 -0400
X-MC-Unique: nD5tO-WLOUOSnH2jr3MyVw-1
Received: by mail-ed1-f72.google.com with SMTP id
 b6-20020a509f06000000b005029d95390aso9326440edf.2
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 05:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680611154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OnQ+4V4JUcC+1PmeTVsoyTZvteUrx3UcOw3Ck/zmaiY=;
 b=5xgT03GWNv92i/1pIN6R2prc9aWgm9+t7aoGPBo3tHnj5gP+0ExUz/UteACWEBEcSX
 BfpQud9B521c/AL7f36qqaghpR1tYw+cMNS4Bg7SOIs/ZyfdTvXBPNW300eG2TZMWrCp
 NSqpHURB5Kz2uJq7Ym7QGzr7PBAxDpHvfVlSSz/0hldHT2/M1WQR8ffnH76jvmtiPGAq
 LCJs9b+iLcleBFuHu2aFpQB/Jw+ZzxMIufDRE/Ag1vJIXWo/ZECo0QNIpft3LO3jNWh0
 fbSXMxXpTRw7YJjjAEIegvQyaL+9t5mLzvUoDHiPwQgBbkYBMSHK4M7ajZDoybJAR+2i
 Xi3w==
X-Gm-Message-State: AAQBX9cnol0elCMCbsJ7dwiYSCnbtlkoDUArk7EcOqFvE18oGCYJHktx
 +Lj/xQQtdWZImQWYfZTCo2nt+SM2pYvZrVHWbuH+9DlXeaRD38BOq0+GG92aZ7EpIzAjAdeSYNG
 Hvm9XqDRVPyFhrj8=
X-Received: by 2002:a17:907:8d88:b0:93e:5baa:d443 with SMTP id
 tf8-20020a1709078d8800b0093e5baad443mr2159793ejc.63.1680611154543; 
 Tue, 04 Apr 2023 05:25:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350bSZzqJtF7qvfkVrFNuOdg0jgu9YPrAG7nfx2xYLKyqmmcXlmQdRL6QW9WB935ja4dQx11CWQ==
X-Received: by 2002:a17:907:8d88:b0:93e:5baa:d443 with SMTP id
 tf8-20020a1709078d8800b0093e5baad443mr2159778ejc.63.1680611154302; 
 Tue, 04 Apr 2023 05:25:54 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 t13-20020a1709067c0d00b009353047c02dsm5876414ejo.167.2023.04.04.05.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 05:25:53 -0700 (PDT)
Date: Tue, 4 Apr 2023 14:25:53 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jinpu Wang <jinpu.wang@ionos.com>
Cc: Yu Zhang <yu.zhang@ionos.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Elmar Gerdes <elmar.gerdes@ionos.com>
Subject: Re: an issue for device hot-unplug
Message-ID: <20230404142553.31030bb7@imammedo.users.ipa.redhat.com>
In-Reply-To: <CAMGffE=cxQzMrT+wbPazApmsGfgAx6z8O0DzEJfWyMQaGFs80w@mail.gmail.com>
References: <CAHEcVy5SV34jaubY5F-q=H+smvMVOzKbb=rTaNJDNXyGdFaLZg@mail.gmail.com>
 <94e21f89-0a3e-701b-7171-7398dff9ce46@redhat.com>
 <CAHEcVy5TiQwYofhCe3RpdFopYzYWbGnL7EO5nE_HQTAVEeaqAg@mail.gmail.com>
 <CAMGffE=cxQzMrT+wbPazApmsGfgAx6z8O0DzEJfWyMQaGFs80w@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
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

On Tue, 4 Apr 2023 08:45:54 +0200
Jinpu Wang <jinpu.wang@ionos.com> wrote:

> Hi Yu,
>=20
> On Mon, Apr 3, 2023 at 6:59=E2=80=AFPM Yu Zhang <yu.zhang@ionos.com> wrot=
e:
> >
> > Dear Laurent,
> >
> > Thank you for your quick reply. We used qemu-7.1, but it is reproducibl=
e with qemu from v6.2 to the recent v8.0 release candidates.
> > I found that it's introduced by the commit  9323f892b39 (between v6.2.0=
-rc2 and v6.2.0-rc3).
> >
> > If it doesn't break anything else, it suffices to remove the line below=
 from acpi_pcihp_device_unplug_request_cb():
> >
> >     pdev->qdev.pending_deleted_event =3D true;
> >
> > but you may have a reason to keep it. First of all, I'll open a bug in =
the bug tracker and let you know.
> >
> > Best regards,
> > Yu Zhang =20
> This patch from Igor Mammedov seems relevant,
> https://lore.kernel.org/qemu-devel/20230403131833-mutt-send-email-mst@ker=
nel.org/T/#t

this patch targets corner case of early boot where
guest hasn't initialized ACPI subsystem yet and 'broken'
management asking to unplug device too early which leads
to device stuck in being unplugged state due to regression
in QEMU.
However, It doesn't apply to fully booted guest.

[...]

> >> > The purpose is for detecting the end of the PCI device hot-unplug. H=
owever, we feel the
> >> > error confusing. How is it possible that a disk "is already in the p=
rocess of unplug"
> >> > during the first hot-unplug attempt? So far as I know, the issue was=
 also encountered by
> >> > libvirt, but they simply ignored it:
> >> >
> >> > https://bugzilla.redhat.com/show_bug.cgi?id=3D1878659
> >> > <https://bugzilla.redhat.com/show_bug.cgi?id=3D1878659>
see my other reply email/BZ comment 17.

[...]


