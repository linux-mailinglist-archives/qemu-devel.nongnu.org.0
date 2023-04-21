Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6216EA599
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 10:10:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pplpx-0007R0-CA; Fri, 21 Apr 2023 04:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pplpv-0007Qs-MG
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 04:09:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pplpu-0004mb-7t
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 04:09:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682064581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/yaIg1UTJfdOeUT+Um7CauHj9viiP95uNwx0XKeE8AU=;
 b=QbHrzoLaTEwJs6UT0PTDy89rbHhCkOevOjMwaF6nAYPfUbwx4hcghHzm18B7S8ocypyXI4
 sjYWON9GHTvecPcOGyRbtO6G90n4NSsA69g5gBfvuf5Qfpx62NbczrVp48sMRmi0xVtPhM
 ZSXn8xDBLRZTLesm1ucMw9BVLI6mXQU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-2oytcp5oMC6f8efSWtnsWA-1; Fri, 21 Apr 2023 04:09:39 -0400
X-MC-Unique: 2oytcp5oMC6f8efSWtnsWA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f17b8d2496so5661595e9.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 01:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682064578; x=1684656578;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/yaIg1UTJfdOeUT+Um7CauHj9viiP95uNwx0XKeE8AU=;
 b=GdFWwbS5y9ZFvxSRxuIQqcL24Yi4z9OAk3qlAh6sUHBAWBg9762Y5YiSvHnE3/yPyb
 fHH857qe4wcJkFJHDg1dxxk+VvcB0dhf1j7PItbHl+5IaDYCvjk7WAplRxLXKxgNtowm
 8SzmZwF5cD33JeUsrw3HFTp7dWuUdo5qW+6ehpgG+/LOXDKyCV90dxHcA+IqTM17ToIH
 X1lU7pOYqP0M2M4o3xRnIyeXAbcUy+6axb5FIj6A2Qt4zBF8QlA3BqSgJAulf78rD+yV
 K9ZvccquZOCJwjWkWSqZVbPxQK5gPHEqVklsOJv8XQRhP9sPqZPd12j2ajQgPIuZSieY
 vsWA==
X-Gm-Message-State: AAQBX9d2PBnV1quFHVozP+l+tC9Uv75cVCmtr7ffIWl4kzLSVXm6yRMi
 aFIjjhSkr6lHon6CK9llU4gSuGjLX27tbYmP0yJyMOdCbOTKlHa68qyIklYIsdyecKqT/YQRdi4
 sXQC2BqDiBea9Sy4=
X-Received: by 2002:adf:e391:0:b0:2ff:f37:9d18 with SMTP id
 e17-20020adfe391000000b002ff0f379d18mr3271118wrm.58.1682064577791; 
 Fri, 21 Apr 2023 01:09:37 -0700 (PDT)
X-Google-Smtp-Source: AKy350aUPdYDQ3wboWaOPNB284QXxVBsuzmqQN0a8LxgiQSsS/kqSVGzTf9gJ03V/5XYcbVKVsli9g==
X-Received: by 2002:adf:e391:0:b0:2ff:f37:9d18 with SMTP id
 e17-20020adfe391000000b002ff0f379d18mr3271099wrm.58.1682064577435; 
 Fri, 21 Apr 2023 01:09:37 -0700 (PDT)
Received: from redhat.com ([2.55.62.70]) by smtp.gmail.com with ESMTPSA id
 m6-20020a5d6246000000b002feea065cc9sm3775570wrv.111.2023.04.21.01.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 01:09:36 -0700 (PDT)
Date: Fri, 21 Apr 2023 04:09:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] pcie: Release references of virtual functions
Message-ID: <20230421040908-mutt-send-email-mst@kernel.org>
References: <20230411090408.48366-1-akihiko.odaki@daynix.com>
 <44853d32-38cc-eec0-c96f-31c898104e7d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44853d32-38cc-eec0-c96f-31c898104e7d@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Tue, Apr 11, 2023 at 12:11:30PM +0200, Philippe Mathieu-Daudé wrote:
> On 11/4/23 11:04, Akihiko Odaki wrote:
> > pci_new() automatically retains a reference to a virtual function when
> > registering it so we need to release the reference when unregistering.
> > 
> > Fixes: 7c0fa8dff8 ("pcie: Add support for Single Root I/O Virtualization (SR/IOV)")
> > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> > ---
> >   hw/pci/pcie_sriov.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/hw/pci/pcie_sriov.c b/hw/pci/pcie_sriov.c
> > index aa5a757b11..76a3b6917e 100644
> > --- a/hw/pci/pcie_sriov.c
> > +++ b/hw/pci/pcie_sriov.c
> > @@ -211,6 +211,7 @@ static void unregister_vfs(PCIDevice *dev)
> >               error_free(local_err);
> >           }
> >           object_unparent(OBJECT(vf));
> > +        object_unref(OBJECT(vf));
> >       }
> >       g_free(dev->exp.sriov_pf.vf);
> >       dev->exp.sriov_pf.vf = NULL;
> 
> It feels the issue is at the device creation.
> 
> [/me looking at the code]
> 
> What about:
> 
> -- >8 --
> diff --git a/hw/pci/pcie_sriov.c b/hw/pci/pcie_sriov.c
> index aa5a757b11..fca3bf6e72 100644
> --- a/hw/pci/pcie_sriov.c
> +++ b/hw/pci/pcie_sriov.c
> @@ -150,7 +150,7 @@ static PCIDevice *register_vf(PCIDevice *pf, int devfn,
> const char *name,
>      PCIBus *bus = pci_get_bus(pf);
>      Error *local_err = NULL;
> 
> -    qdev_realize(&dev->qdev, &bus->qbus, &local_err);
> +    pci_realize_and_unref(dev, bus, &local_err);
>      if (local_err) {
>          error_report_err(local_err);
>          return NULL;

ok you want to repost this or Akihiko convinced you?


> ---


