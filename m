Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7A853AC0D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 19:35:55 +0200 (CEST)
Received: from localhost ([::1]:56248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwSGA-0005l7-Ph
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 13:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nwS7e-0006Qc-Bg
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 13:27:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nwS7b-0007iM-It
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 13:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654104421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jzDkg+2fph5fI45ClL3UDtfIFKAFJHtGwVGpKIepteg=;
 b=QG/PkK1wY6Se8Anaxq7U5wlQHjWqShA16qq4D/hnGV4gkjZ2gU+WSFiBeVpPcsFZ0E+qoo
 fqPG+Mi8vXiOjsCQR3JW3bXfLp9E608SQ6MbJTpyt0dOSiSZE66so2piCk//94YIQUYrGP
 3cFL5LtuaYNhX/CdItqfCjyxKVj45/Y=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474--2_Ml617POG-9dKjByGfbw-1; Wed, 01 Jun 2022 13:27:00 -0400
X-MC-Unique: -2_Ml617POG-9dKjByGfbw-1
Received: by mail-il1-f197.google.com with SMTP id
 j18-20020a056e02219200b002d3aff22b4cso1637282ila.9
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 10:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=jzDkg+2fph5fI45ClL3UDtfIFKAFJHtGwVGpKIepteg=;
 b=RpyEZKZruFYY/QpJKlpYBYtOrAj1oRkhbcYERut81n5jB5ID/bAaMdyd6y6PV+jvj2
 EsuMInbVNyuU/oN6thmVKSKSrct8RMfqoas7CMFusIToCg4bmmOhjnT9LbB0EMJ7tE6O
 6thIN04F7XtYMtOGRHKkL0SXAbWovPTeji3rzOnftXJcOu0MIAmNy96MgquPDGgFTbrL
 SihStBYD3OvztUCvCrhJoOrEVORjN8Mm9F/doFScpmNQhPl7pEgGoIKKqzR8vVoecf1c
 kR2j9F1b+s+WoCigoT6Keyk6X9pfoe5TIah/TsHv4KKPUorEWZQefhNUiqrQDVuHVKEY
 pGSQ==
X-Gm-Message-State: AOAM531+qnb9BaXcCUuZstfpXa/Ji/RmYbChf/sPIvPYqaSLfVgGcKVE
 oApafFKghdLhJNthwd73EDsvi/7lJYFTxNrR7Ih4u9VObPGjtIIeOsnGZPWb3g5SqsnqMN1speS
 j+mlNjDQTcanxfQY=
X-Received: by 2002:a05:6638:2687:b0:331:6c4:891b with SMTP id
 o7-20020a056638268700b0033106c4891bmr663864jat.166.1654104420096; 
 Wed, 01 Jun 2022 10:27:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwalOnyJV6m6NqCAuByl6bePSICjgt112ETaVmSU9OWXCQHI1gA4T950+4uG0BHQW0Jzh4rA==
X-Received: by 2002:a05:6638:2687:b0:331:6c4:891b with SMTP id
 o7-20020a056638268700b0033106c4891bmr663826jat.166.1654104419836; 
 Wed, 01 Jun 2022 10:26:59 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 k11-20020a928e4b000000b002cde6e352c7sm709542ilh.17.2022.06.01.10.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 10:26:59 -0700 (PDT)
Date: Wed, 1 Jun 2022 11:26:58 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, John Johnson
 <john.g.johnson@oracle.com>, Stefan Hajnoczi <stefanha@gmail.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "thuth@redhat.com" <thuth@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>, "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "eduardo@habkost.net" <eduardo@habkost.net>, "marcel.apfelbaum@gmail.com"
 <marcel.apfelbaum@gmail.com>, "eblake@redhat.com" <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>, "peterx@redhat.com"
 <peterx@redhat.com>, "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>, Elena Ufimtseva
 <elena.ufimtseva@oracle.com>, Kanth Ghatraju <kanth.ghatraju@oracle.com>
Subject: Re: [PATCH v10 13/14] vfio-user: handle device interrupts
Message-ID: <20220601112658.07f97a9a.alex.williamson@redhat.com>
In-Reply-To: <B3FC4541-1DB2-4C1F-8CB5-01D8771C8803@oracle.com>
References: <cover.1653404595.git.jag.raman@oracle.com>
 <2a492c16e0464f70f7be1fd9c04172f4f18d14ca.1653404595.git.jag.raman@oracle.com>
 <Yo5DBb8i5SMbDKnq@stefanha-x1.localdomain>
 <E6AB9FA3-6580-44C6-93FA-AFC19477C296@oracle.com>
 <20220531141046.04b448e5.alex.williamson@redhat.com>
 <CAJSP0QU13=fLTVEjE1JbkOef5im4Dwb8x3xhpYYd7KPRJjav_Q@mail.gmail.com>
 <20220531154538.6d002124.alex.williamson@redhat.com>
 <B3FC4541-1DB2-4C1F-8CB5-01D8771C8803@oracle.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
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

On Wed, 1 Jun 2022 17:00:54 +0000
Jag Raman <jag.raman@oracle.com> wrote:
>=20
> Hi Alex,
>=20
> Just to add some more detail, the emulated PCI device in QEMU presently
> maintains a MSIx table (PCIDevice->msix_table) and Pending Bit Array. In =
the
> present VFIO PCI device implementation, QEMU leverages the same
> MSIx table for interrupt masking/unmasking. The backend PCI device (such =
as
> the passthru device) always thinks that the interrupt is unmasked and lets
> QEMU manage masking.
>=20
> Whereas in the vfio-user case, the client additionally pushes a copy of
> emulated PCI device=E2=80=99s table downstream to the remote device. We d=
id this
> to allow a small set of devices (such as e1000e) to clear the
> PBA (msix_clr_pending()). Secondly, the remote device uses its copy of the
> MSIx table to determine if interrupt should be triggered - this would pre=
vent
> an interrupt from being sent to the client unnecessarily if it's masked.
>=20
> We are wondering if pushing the MSIx table to the remote device and
> reading PBA from it would diverge from the VFIO protocol specification?
>=20
> From your comment, I understand it=E2=80=99s similar to VFIO protocol bec=
ause VFIO
> clients could mask an interrupt using VFIO_DEVICE_SET_IRQS ioctl +
> VFIO_IRQ_SET_ACTION_MASK / _UNMASK flags. I observed that QEMU presently
> does not use this approach and the kernel does not support it for MSI.

I believe the SET_IRQS ioctl definition is pre-enabled to support
masking and unmasking, we've just lacked kernel support to mask at the
device which leads to the hybrid approach we have today.  Our intention
would be to use the current uAPI, to provide that masking support, at
which point we'd leave the PBA mapped to the device.

So whether your proposal diverges from the VFIO uAPI depends on what
you mean by "pushing the MSIx table to the remote device".  If that's
done by implementing the existing SET_IRQS masking support, then you're
spot on.  OTOH, if you're actually pushing a copy of the MSIx table
from the client, that's certainly not how I had envisioned the kernel
interface.  Thanks,

Alex


