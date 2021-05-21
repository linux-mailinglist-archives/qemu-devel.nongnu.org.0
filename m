Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CF738C073
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 09:10:50 +0200 (CEST)
Received: from localhost ([::1]:36868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljzJ3-0002gX-Fk
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 03:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljzID-0001ac-04
 for qemu-devel@nongnu.org; Fri, 21 May 2021 03:09:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljzIA-0000cm-E0
 for qemu-devel@nongnu.org; Fri, 21 May 2021 03:09:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621580993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nu37QqqnLXalc1kkYPPqb8gHK7SvIhK8mhl8w8NQ52s=;
 b=F5vh7Ten7NMN93m4nMVqmLz8QE+wUwZagJWqdKYEZDY2sY3DUF9CJ0y/nJaAn7Rk2YCyEt
 RbtoKh+gg6Q0ueCQvyiSYKsY1JF88Am/tUgx0nS5a9FoRAVz0kOhb3DTjPWIXLKHQXYgyV
 Yy7dq3LR2ZK0TSKFuxjYqaPe4v9vIyk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-79_rwFLpNmGfAy-jfHx5KQ-1; Fri, 21 May 2021 03:09:52 -0400
X-MC-Unique: 79_rwFLpNmGfAy-jfHx5KQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F072107ACC7;
 Fri, 21 May 2021 07:09:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD99C62466;
 Fri, 21 May 2021 07:09:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 54C67113865F; Fri, 21 May 2021 09:09:46 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 01/11] hw/isa: Explode pci_create_simple() calls
References: <20210518215545.1793947-1-philmd@redhat.com>
 <20210518215545.1793947-2-philmd@redhat.com>
Date: Fri, 21 May 2021 09:09:46 +0200
In-Reply-To: <20210518215545.1793947-2-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 18 May 2021 23:55:35
 +0200")
Message-ID: <87tumwpnph.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> To be able to set a property on the ISA-IDE bridges objects
> before they are realized, explode the pci_create_simple()
> calls as pci_new() + pci_realize_and_unref().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/i386/pc_piix.c   | 5 +++--
>  hw/isa/piix4.c      | 3 ++-
>  hw/mips/fuloong2e.c | 3 ++-
>  hw/ppc/pegasos2.c   | 3 ++-
>  4 files changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 30b8bd6ea92..fb606c14768 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -244,8 +244,9 @@ static void pc_init1(MachineState *machine,
>      if (pcmc->pci_enabled) {
>          PCIDevice *dev;
> =20
> -        dev =3D pci_create_simple(pci_bus, piix3_devfn + 1,
> -                                xen_enabled() ? "piix3-ide-xen" : "piix3=
-ide");
> +        dev =3D pci_new(piix3_devfn + 1,
> +                      xen_enabled() ? "piix3-ide-xen" : "piix3-ide");
> +        pci_realize_and_unref(dev, pci_bus, &error_abort);
>          pci_ide_create_devs(dev);
>          idebus[0] =3D qdev_get_child_bus(&dev->qdev, "ide.0");
>          idebus[1] =3D qdev_get_child_bus(&dev->qdev, "ide.1");

This replaces pci_create_simple()'s &error_fatal by &error_abort.
Intentional?  If yes, the commit message should briefly explain why
errors are not expected to happen.

Same for the other hunks.

[...]


