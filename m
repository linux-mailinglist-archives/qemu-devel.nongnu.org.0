Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE576F4E28
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 02:33:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu0QH-0007gq-DK; Tue, 02 May 2023 20:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1pu0QE-0007gi-EX
 for qemu-devel@nongnu.org; Tue, 02 May 2023 20:32:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1pu0QC-0006Ts-Kk
 for qemu-devel@nongnu.org; Tue, 02 May 2023 20:32:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683073959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jP7Xb60Rt20Hzxq+/xNuwIevKyiJ3I+jtXojyrQkRWA=;
 b=Hlo6voYc783OO3UDsrXDeO+UkrGviyT6Vdjf8XJUofz9LXQYqULzoxX84P9jGAvajcPI0T
 clQirp05UaBwtpt7R3qHLsSWOERTe1C/x+7BM6LqdaBlMOl4GJXt56Vr88yLiYyVeOFYqe
 CwFewiKTN76pmkOt0T5Hd4m1yEKTxoI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-O1lZzD12NWiKbxHGeLWs9g-1; Tue, 02 May 2023 20:32:37 -0400
X-MC-Unique: O1lZzD12NWiKbxHGeLWs9g-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-5ef626ad00fso68712856d6.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 17:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683073957; x=1685665957;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jP7Xb60Rt20Hzxq+/xNuwIevKyiJ3I+jtXojyrQkRWA=;
 b=NCvRg2chvpcx46fxJ0pJYzd3e6/do5V2Ec2TpGiggSKc4jHjU7orxqXAUFJPaO/rRz
 wrNW7jJvfSDlcTET3shxjT3sjzK4jvb5nqDgl4FYW+qJoA2t0dHCjMeXxUWVeOLCEF9y
 qpDl2iQb6tV65LvRgVUOTCb/dbQcTVx7VHIJq+byH/MDYnYxNA2YcLMFmC8ZyKr4VXmH
 CwtKhuQKfg8pGjN/qPJ/kR+Rxs/okiv9b/ObbENaHeXxvHQ8qjpaJYGmA9kXVg0g1mS0
 CR1UDxbH1NwHlrat3z/AAJeXSpYNJkVD75XpHHABxaePPt7FSsEbmRL4oS8AH49BFhy2
 gaCg==
X-Gm-Message-State: AC+VfDzUcHmqf3Fl26RAMo3edVuyV1epJXoDPdVV50NJZK0UrSlDZEq7
 Xx/uycVyr6AEv5ER6MBS/G5Y4OgvmZaVrT93WAHf5SOsKswtrJ3oeA6OV4jEXJ/1of6sZYIdW/D
 2wKRxhWeYeo41HOU=
X-Received: by 2002:a05:6214:518c:b0:5b8:6efe:77f4 with SMTP id
 kl12-20020a056214518c00b005b86efe77f4mr7669315qvb.46.1683073957429; 
 Tue, 02 May 2023 17:32:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7sUgPhvR+GqJM7skiOIkjco4Pa4dq5AvO1Uj3Cthx8k+gVijkKNI1zee4WEMsqHi5dnOJd6g==
X-Received: by 2002:a05:6214:518c:b0:5b8:6efe:77f4 with SMTP id
 kl12-20020a056214518c00b005b86efe77f4mr7669290qvb.46.1683073957072; 
 Tue, 02 May 2023 17:32:37 -0700 (PDT)
Received: from ?IPv6:2804:1b3:a802:fb9f:720f:65e5:7914:9a9b?
 ([2804:1b3:a802:fb9f:720f:65e5:7914:9a9b])
 by smtp.gmail.com with ESMTPSA id
 y26-20020a05620a0e1a00b0074f4edb7007sm7606548qkm.112.2023.05.02.17.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 17:32:36 -0700 (PDT)
Message-ID: <109bc1e721e009894bf4b1529fe1904afce1e13e.camel@redhat.com>
Subject: Re: [PULL 61/73] hw/pci/aer: Implement PCI_ERR_UNCOR_MASK register
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: quintela@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>, Fan Ni <fan.ni@samsung.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>
Date: Tue, 02 May 2023 21:32:34 -0300
In-Reply-To: <875y9jglfr.fsf@secure.mitica>
References: <cover.1678237635.git.mst@redhat.com>
 <010746ae1db7f52700cb2e2c46eb94f299cfa0d2.1678237635.git.mst@redhat.com>
 <ZEhzaWpNM+NvZCUw@x1n> <20230426021019-mutt-send-email-mst@kernel.org>
 <875y9jglfr.fsf@secure.mitica>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hello Michael, Juan, Peter,

On Wed, 2023-04-26 at 09:19 +0200, Juan Quintela wrote:
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > On Tue, Apr 25, 2023 at 08:42:17PM -0400, Peter Xu wrote:
> > > Hi, Michael, Jonathan,
> > >=20
> > > On Tue, Mar 07, 2023 at 08:13:53PM -0500, Michael S. Tsirkin wrote:
> > > This breaks the simplest migration from QEMU 8.0->7.2 binaries on all
> > > machine types I think as long as the cap is present, e.g. the default
> > > e1000e provided by the default q35 machine can already hit it with al=
l
> > > default cmdline:
> > >=20
> > >   ./qemu-system-x86_64 -M pc-q35-7.2 [-incoming XXX]
> > >=20
> > > 7.2 binary will have empty wmask for PCI_ERR_UNCOR_MASK, meanwhile I =
think
> > > it can also see a non-zero value, then the migration will fail at:
> > >=20
> > > vmstate_load 0000:00:02.0/e1000e, e1000e                             =
                     =20
> > > qemu-7.2: get_pci_config_device: Bad config data: i=3D0x10a read: 40 =
device: 0 cmask: ff wmask: 0 w1cmask:0
> > > qemu-7.2: Failed to load PCIDevice:config  =20
> > > qemu-7.2: Failed to load e1000e:parent_obj                           =
                    =20
> > > qemu-7.2: error while loading state for instance 0x0 of device '0000:=
00:02.0/e1000e'     =20
> > > qemu-7.2: load of migration failed: Invalid argument
> > >=20
> > > We probably at least want to have the default value to be still zero,=
 and
> > > we'd need to make sure it'll not be modified by the guest, iiuc.
> > >=20
> > > Below oneliner works for me and makes the migration work again:
> > >=20
> > > =3D=3D=3D8<=3D=3D=3D
> > > diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
> > > index 103667c368..563a37b79c 100644
> > > --- a/hw/pci/pcie_aer.c
> > > +++ b/hw/pci/pcie_aer.c
> > > @@ -113,7 +113,7 @@ int pcie_aer_init(PCIDevice *dev, uint8_t cap_ver=
, uint16_t offset,
> > >      pci_set_long(dev->w1cmask + offset + PCI_ERR_UNCOR_STATUS,
> > >                   PCI_ERR_UNC_SUPPORTED);
> > >      pci_set_long(dev->config + offset + PCI_ERR_UNCOR_MASK,
> > > -                 PCI_ERR_UNC_MASK_DEFAULT);
> > > +                 0/*PCI_ERR_UNC_MASK_DEFAULT*/);
> > >      pci_set_long(dev->wmask + offset + PCI_ERR_UNCOR_MASK,
> > >                   PCI_ERR_UNC_SUPPORTED);
> > > =3D=3D=3D8<=3D=3D=3D
> > >=20
> > > Anyone could have a look on a solid solution from PCI side?
> > >=20
> > > Copy Juan and Leonardo.
> > >=20
> > > Thanks,
> >=20
> > My bad, I forgot about this =F0=9F=A4=A6.
> > So we need a property and tweak it with compat machinery depending on
> > machine type. Jonathan, can you work on this pls?
> > Or I can revert for now to relieve the time pressure,
> > redo the patch at your leasure.
>=20
> I agree with Michael here, the best option is adding a new property.
>=20
> Later, Juan.
>=20

I sent a patch implementing the suggested fix:
https://lore.kernel.org/qemu-devel/20230503002701.854329-1-leobras@redhat.c=
om/T/#u

Please let me know of anything to improve.

Best regards,
Leo


