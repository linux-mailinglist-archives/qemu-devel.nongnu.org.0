Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9690D3521AB
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 23:34:19 +0200 (CEST)
Received: from localhost ([::1]:56140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS4xB-0000F0-13
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 17:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lS4vi-0008F0-4K
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 17:32:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lS4ve-00011Q-KJ
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 17:32:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617312757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EAmtNU2AfdkxBRHWM7ghD8RkiyfXO9BgQXewU5vvqcQ=;
 b=EYQbQmmayz4JqjWFZMW3VqPixwE/aet0UMYnXUXU3ZxP/xVy5hfkwm1zT8u2IDBUb4hLWp
 KFV3rGZM6QCPZ98XU+oNSaZwwNZmcZSGOUI5Pi2IkWNpdUO0jnPKORw1lhmD0nobFzQ4Vb
 w1slbMidYcAUhcoUBSZ4NvQUsPpMa9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-vaFaY-jJMbSNuXVOGM2q0g-1; Thu, 01 Apr 2021 17:32:33 -0400
X-MC-Unique: vaFaY-jJMbSNuXVOGM2q0g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C0F7189CD01;
 Thu,  1 Apr 2021 21:32:32 +0000 (UTC)
Received: from localhost (unknown [10.40.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97CAC6F13A;
 Thu,  1 Apr 2021 21:32:27 +0000 (UTC)
Date: Thu, 1 Apr 2021 23:32:25 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Vincent Bernat <vincent@bernat.ch>
Subject: Re: [PATCH v3] hw/smbios: support for type 41 (onboard devices
 extended information)
Message-ID: <20210401233225.16e572e4@redhat.com>
In-Reply-To: <m37dllk939.fsf@bernat.ch>
References: <20210401122658.37842-1-vincent@bernat.ch>
 <20210401225846.411ebd76@redhat.com> <m37dllk939.fsf@bernat.ch>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 01 Apr 2021 23:07:06 +0200
Vincent Bernat <vincent@bernat.ch> wrote:

>  =E2=9D=A6  1 avril 2021 22:58 +02, Igor Mammedov:
>=20
> >> This can be invoked with:
> >>=20
> >>     $QEMU -netdev user,id=3Dinternet
> >>           -device virtio-net-pci,mac=3D50:54:00:00:00:42,netdev=3Dinte=
rnet,id=3Dinternet-dev \
> >>           -smbios type=3D41,designation=3D'Onboard LAN',instance=3D1,k=
ind=3Dethernet,pcidev=3Dinternet-dev =20
> >
> > an ACPI alternative was merged recently (current master).
> > assigning 'designation=3D' wasn't implemented there, but important part
> > of giving users control over PCI devices 'eno' index is implemented.
> >
> > When I looked into the issue, smbios way was a bit over-kill for the ta=
sk
> > and didn't really work if hotplug were used.
> >
> > See, for example how to use new feature:
> >  https://www.mail-archive.com/qemu-devel@nongnu.org/msg794164.html =20
>=20
> It seems simpler this way. I don't think my patch is needed then.

SMBIOS ways is fine for static configs where no hot-plug is involved.
Also potentially SMBIOS way may be used by arm/virt board,
since acpi-index shares a lot with ACPI PCI hotplug infrastructure
and we haven't ported that to arm/virt impl. yet.

It also won't work for Q35 at the moment, but Julia is working
on adding support for ACPI PCI hotplug to it, and once it arrives
acpi-index will become available there.

Perhaps we should also add support for ACPI PCI hotplug to virt/arm,
along with Q35.


