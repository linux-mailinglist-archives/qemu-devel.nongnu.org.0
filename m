Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D53453A5E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 20:45:56 +0100 (CET)
Received: from localhost ([::1]:46292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn4Ow-0000QT-Th
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 14:45:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mn4L8-0005m4-ON
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 14:41:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mn4L6-0005Md-CC
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 14:41:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637091715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ZERi1McBT0JrLKlP6Adv93yEdl+tE+oLsybJTuDxCU=;
 b=HAwzusqGAm0ytkLI0fHV5/Q61SNAD6o6eawW1egi1qvl27ikgj8O/cO/6vPHLrCeQERP9u
 AOfw5gyoeIdLsoVpTPf1MruIzVixEGJDnehNY6uluVhBRcNymFIEaa4fO4k6qIUI64hdL/
 yeQAR4FR+Fhy9q30rOPNL5x6pQUO/nk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-WcIxbdtUN7SmHpeCTMCzww-1; Tue, 16 Nov 2021 14:41:52 -0500
X-MC-Unique: WcIxbdtUN7SmHpeCTMCzww-1
Received: by mail-ed1-f69.google.com with SMTP id
 r16-20020a056402019000b003e6cbb77ed2so8271987edv.10
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 11:41:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7pUzVb/g3vWDkNT1eMM4Imep1YYRzytUyqcHL+kys8w=;
 b=PT+G48Zix6QhUi+aHJQdeG5CqTbjw30BMd5w2MfYxRE2I0q3HzwU4jkuJL5xMNx+ZG
 6BXjTHUyjoh6e/mbZ5T3HIHQ13m/mWR8qNLkRC6LRkBZ5GjqVTcbYB02ZETNj4Znzbct
 CMKM8sywo8tZFukqXXETN3Z0PhX15oVuuGbfOItaX8BDPaVxAWkwgDcbnfXkXSO4kiqD
 BDUPE2qZHMagZH8MIaLDjrPb5+qOYXyy+uijze6mVGmFDxPsa7nTnxktfSzOksinalGK
 3xlg542633aYBZbZuRhdqFOKTwcYmX/hAw1Xjq1McEvpCD16MIGx37MgtW/un5osNZR8
 Y1+w==
X-Gm-Message-State: AOAM530vCWSG8fWLI0reZ7HOGVeYWqF495/G/VGd/4JdRLYrBKwnB6sR
 O/2tLvH0guP2RENCOrBpa1+NCkBwCv9y5jNzJV/DEv6VBJ9Givff63DT3bVr6HunmVlfSxMAxnd
 Xr+QuRPfNb/rxlVw=
X-Received: by 2002:a50:d883:: with SMTP id p3mr13276978edj.94.1637091711362; 
 Tue, 16 Nov 2021 11:41:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJze+D4RdCLAiCZPn6GAjsbdrZ/xnBM1UJRkb7X9M7XGJEOgGYu7m3ocdSXHqTs6y3e9JwHEdg==
X-Received: by 2002:a50:d883:: with SMTP id p3mr13276954edj.94.1637091711143; 
 Tue, 16 Nov 2021 11:41:51 -0800 (PST)
Received: from localhost ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id f18sm10560664edd.10.2021.11.16.11.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 11:41:50 -0800 (PST)
Date: Tue, 16 Nov 2021 20:41:49 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Brian Rak <brak@vultr.com>
Subject: Re: Guests wont start with 15 pcie-root-port devices
Message-ID: <20211116204149.512d1dc2@redhat.com>
In-Reply-To: <7ffcc650-0d75-f327-6508-ec3805316a6c@gameservers.com>
References: <abff2095-9ac8-c115-bc7f-6a19b9defe51@gameservers.com>
 <YY6qJt0lXEc2SAtc@redhat.com> <20211112215111.6f854f7a@redhat.com>
 <7ffcc650-0d75-f327-6508-ec3805316a6c@gameservers.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: brak@gameservers.com,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Nov 2021 11:57:43 -0500
Brian Rak <brak@vultr.com> wrote:

> Will this fix make it into 6.2?

yes,
it was just merged 2aa1842d6d79..7e6055c99f2f1f

PS:
Native PCIe hotplug fixes from Gerd were merged as well,
so if you'd like to use native hotplug, use=20
  --global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=3Doff
to turn off ACPI hotplug.

> On 11/12/2021 3:51 PM, Igor Mammedov wrote:
> > On Fri, 12 Nov 2021 17:53:42 +0000
> > Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> > =20
> >> On Fri, Nov 12, 2021 at 12:35:07PM -0500, Brian Rak wrote: =20
> >>> In 6.1, a guest with 15 empty pcie-root-port devices will not boot pr=
operly
> >>> - it just hangs on "Guest has not initialized the display (yet).".=C2=
=A0 As soon
> >>> as I remove the last pcie-root-port, the guest begins starting up nor=
mally. =20
> >> Yes, QEMU 6.1 has a regression
> >>
> >>    https://gitlab.com/qemu-project/qemu/-/issues/641
> >>
> >> =20
> >>> commit e2a6290aab578b2170c1f5909fa556385dc0d820
> >>> Author: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> >>> Date:=C2=A0=C2=A0 Mon Aug 2 12:00:57 2021 +0300
> >>>
> >>>  =C2=A0=C2=A0=C2=A0 hw/pcie-root-port: Fix hotplug for PCI devices re=
quiring IO
> >>>
> >>> Although I can't say I really understand why that commit triggered it=
. =20
> >> It caused the firmware to always allocate I/O space for every port
> >> and there's limited total I/O space, so it runs out at 15 devices. =20
> > alternatively instead of reverting to native PCIe hotplug as in the iss=
ue
> > Daniel's mentioned, you can apply following fix
> >   https://patchew.org/QEMU/20211112110857.3116853-1-imammedo@redhat.com=
/
> > =20
> >> Regards,
> >> Daniel =20
>=20


