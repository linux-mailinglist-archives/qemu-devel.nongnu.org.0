Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 828DB51C566
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 18:50:01 +0200 (CEST)
Received: from localhost ([::1]:52648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmefw-0004Fh-D5
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 12:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nmeF7-0006Tg-26
 for qemu-devel@nongnu.org; Thu, 05 May 2022 12:22:17 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:43755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nmeF3-0006g6-Gs
 for qemu-devel@nongnu.org; Thu, 05 May 2022 12:22:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651767731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qvXn0QBi57tOKwMSHA44I5GoegyVwuJ+6h/Xc1lILqI=;
 b=YapVIjXXwvaY/iFoAJmGgrFx86bDan/tZup5CqbKaZzjCaIWq6CD4kO+7OeUiKhyXyyC8v
 VcS4zECtQ/TA+lFOKNn93VWQ5EcuCqJoCjeR73BKW74Q/QbzVVVkHAOgjGV9LjMFjQdiAN
 44Rdh+R5kRUEchucmSATDQvsZSvv0VU=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-13_9_IYwMVmTrzLdAzAiAA-1; Thu, 05 May 2022 12:22:10 -0400
X-MC-Unique: 13_9_IYwMVmTrzLdAzAiAA-1
Received: by mail-io1-f71.google.com with SMTP id
 t1-20020a056602140100b0065393cc1dc3so3247626iov.5
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 09:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=qvXn0QBi57tOKwMSHA44I5GoegyVwuJ+6h/Xc1lILqI=;
 b=Q/FHrh3gKtH+fJ7GZL7QFjjVZuckRCIc7v/A2ySjyneBMnir9ucX6pEdZg/NsNLFtX
 NVUkZuovmVJ52/St0+R2E0bB7Lu6Wk83Oe2DuxY/vS8k2p1uXr5KTdbIpWK5ysxZo5Em
 +l9zv9NREHusWbfpsbJKhNRB/KtlmrST3rtrISjObeFQ/xs+VmsyOORGKd+gPy9w4FeX
 3b9qCC8aHByXAFnEKrbLwumIlS0nuQNKydXnwkRxejt/fq32jZB6SiegeZDiXBthGmMm
 vg0naImSbPrFek73EM79mCbwI0vcOnbyDrsVF3BW2kSwXvTxRBNJtpfERs5oyalwfLHm
 rpBg==
X-Gm-Message-State: AOAM533eMiOaoIm1apJFwjFGbCtxYNoPtWaJjlWWclA2FIOBeCeRMYmh
 HRXHLa+RlIyI2cM2+9LfRLcllYQG+tAEk8RbRJo7kU9HPmZ1StHUjV8WxYui5QMj6BfBY8knH9M
 vwT4uctRR6ejq3bY=
X-Received: by 2002:a05:6638:411d:b0:32b:7465:fee2 with SMTP id
 ay29-20020a056638411d00b0032b7465fee2mr8329302jab.318.1651767729922; 
 Thu, 05 May 2022 09:22:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbtWkjlKoB3laox7FxvrKfVeIJBH44SMxXM6BQVIdtH/JZbNPbo9zeIjHhXWKXDnA1Be5jxA==
X-Received: by 2002:a05:6638:411d:b0:32b:7465:fee2 with SMTP id
 ay29-20020a056638411d00b0032b7465fee2mr8329280jab.318.1651767729629; 
 Thu, 05 May 2022 09:22:09 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 cd27-20020a0566381a1b00b0032b3a7817b5sm597243jab.121.2022.05.05.09.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 09:22:09 -0700 (PDT)
Date: Thu, 5 May 2022 10:22:07 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <f4bug@amsat.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "thuth@redhat.com" <thuth@redhat.com>, "bleal@redhat.com"
 <bleal@redhat.com>, "berrange@redhat.com" <berrange@redhat.com>,
 "eduardo@habkost.net" <eduardo@habkost.net>, "marcel.apfelbaum@gmail.com"
 <marcel.apfelbaum@gmail.com>, "eblake@redhat.com" <eblake@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>, Elena Ufimtseva
 <elena.ufimtseva@oracle.com>, John Johnson <john.g.johnson@oracle.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>, Jag Raman
 <jag.raman@oracle.com>
Subject: Re: [PATCH v8 15/17] vfio-user: handle device interrupts
Message-ID: <20220505102207.4aef06f6.alex.williamson@redhat.com>
In-Reply-To: <YmpkPIlq/V4rXSWj@stefanha-x1.localdomain>
References: <cover.1650379269.git.jag.raman@oracle.com>
 <847e6d373eb3d8ff4cdeb7a3ad9b935785bfbf8e.1650379269.git.jag.raman@oracle.com>
 <YmZ3nAtyjt+gjqvL@stefanha-x1.localdomain>
 <0C1A24F0-A2F5-4B08-A015-92CBAA003497@oracle.com>
 <YmpkPIlq/V4rXSWj@stefanha-x1.localdomain>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.74;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, 28 Apr 2022 10:54:04 +0100
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Mon, Apr 25, 2022 at 05:40:01PM +0000, Jag Raman wrote:
> > > On Apr 25, 2022, at 6:27 AM, Stefan Hajnoczi <stefanha@redhat.com> wr=
ote:
> > >=20
> > > On Tue, Apr 19, 2022 at 04:44:20PM -0400, Jagannathan Raman wrote: =20
> > >> +static MSIMessage vfu_object_msi_prepare_msg(PCIDevice *pci_dev,
> > >> +                                             unsigned int vector)
> > >> +{
> > >> +    MSIMessage msg;
> > >> +
> > >> +    msg.address =3D 0;
> > >> +    msg.data =3D vector;
> > >> +
> > >> +    return msg;
> > >> +}
> > >> +
> > >> +static void vfu_object_msi_trigger(PCIDevice *pci_dev, MSIMessage m=
sg)
> > >> +{
> > >> +    vfu_ctx_t *vfu_ctx =3D pci_dev->irq_opaque;
> > >> +
> > >> +    vfu_irq_trigger(vfu_ctx, msg.data);
> > >> +} =20
> > >=20
> > > Why did you switch to vfu_object_msi_prepare_msg() +
> > > vfu_object_msi_trigger() in this revision? =20
> >=20
> > We previously did not do this switch because the server didn=E2=80=99t =
get updates
> > to the MSIx table & PBA.
> >=20
> > The latest client version (which is not part of this series) forwards a=
ccesses
> > to the MSIx table & PBA over to the server. It also reads the PBA set b=
y the
> > server. These change make it possible for the server to make this switc=
h. =20
>=20
> Interesting. That's different from kernel VFIO. Before vfio-user commits
> to a new approach it would be worth checking with Alex that he agrees
> with the design.
>=20
> I remember sending an email asking about why VFIO MSI-X PBA does not
> offer the full semantics described in the PCIe spec but didn't get a
> response from Alex (Message-Id:
> YkMWp0lUJAHhivJA@stefanha-x1.localdomain).

IIUC, the question is why we redirect the MSI-X interrupt from the KVM
irqfd to be handled in QEMU when the vector is masked.  This is largely
to work around the fact that we haven't had a means to implement mask
and unmask in the kernel, therefore we leave the vector enabled and
only enable the emulated PBA if a masked vector fires.  This works
because nobody really cares about the PBA, nor operates in a mode where
vectors are masked and the PBA is polled.  Drivers that understand the
device likely have better places to poll for service requests than the
PBA.

Ideally, masking a vector would make use of the existing mask and
unmask uAPI via the SET_IRQS ioctl, but we haven't been able to
implement this due to lack of internal kernel APIs to support it.  We
may have those interfaces now, but lacking bandwidth, I haven't checked
recently and we seem to be getting by ok as is.  Thanks,

Alex


