Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6690C4B44E2
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 09:52:10 +0100 (CET)
Received: from localhost ([::1]:50606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJX5d-0004ao-Gd
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 03:52:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nJWbm-0002Tl-Ck
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 03:21:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nJWbj-0001fz-9U
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 03:21:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644826874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+UBiBhWCmaVrmVIriRcbKEjYGxKnl5lQTPRi9aCO2V8=;
 b=a1o53ciSwfoOUOTXiECtosI/GeyZA+B/zjn6Tc97gp3rZYndZJt5CWqnXV+cT5z5HixV0h
 1y2D0qI8hnRqS53W5+1oXMwfbAQoXxQniEbsehVxvqRqq4Wcm3V26y3I1vN0ZDrj8GsoL6
 LY7aAJU/5WfLEhoN+TbTK4DSYLVUEBg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-WDGoaPrNPSKevxo7EBxQhw-1; Mon, 14 Feb 2022 03:21:11 -0500
X-MC-Unique: WDGoaPrNPSKevxo7EBxQhw-1
Received: by mail-ej1-f70.google.com with SMTP id
 v2-20020a170906292200b006a94a27f903so5513274ejd.8
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 00:21:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zgnTY6F57e1c1eijzvgou8h7c4h6j9SDwoX+tSBZBfk=;
 b=FDGsp1Yn4x3O+cnBOrNvFT7oHjpNFgjd6oVCyTxf63qee9VrCke1ZMSfFFlX9li1/G
 lsaJ615H3twQC4GPHL+6f2gmZbmVvNAHfVS6HpoRbzWNZ65L5tiNUyEu9DR7dXVbckpZ
 UK2EEcHR6BkSeqPhRoC4JTVoL29vcgXxwAPgxAYBoECqQmk9dBYHwGlTKf0FV0xPwNmC
 6Mq1Ov6QAKhrWN05cHRMN8lD0xCABRp0pDmoy8UAZ3CdPAdZhN02P/zYRd1Bgzw0tTQd
 yLo9aQ3D/xV63/1PqBjdRYi0INk5XD2CdzzhLIRzzZOQPmuxODGwDtluyEdQfuQq360Q
 3RZg==
X-Gm-Message-State: AOAM532KPLcb9vMWHYOYCbtqcnyBgP1dEz6GfNE/JZ/5GCdf1ulr/6pd
 1foL0KmOU53B8rTz6TipVUQIXYeAWb6/O8DWNnYDGzYdNruqxjTt1vCioJvzev+is/BTAAdMnCc
 9QglxxIV8Ye0RbBw=
X-Received: by 2002:aa7:d918:: with SMTP id a24mr12517965edr.315.1644826869948; 
 Mon, 14 Feb 2022 00:21:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztvkH7w4xmjLtUbbUteOasXW+VsMbc8QtRMODB/Q8KE4EYy4LFOssABJO9irdDbqnFM7UZ1A==
X-Received: by 2002:aa7:d918:: with SMTP id a24mr12517941edr.315.1644826869733; 
 Mon, 14 Feb 2022 00:21:09 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id i18sm6771338ejy.190.2022.02.14.00.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:21:08 -0800 (PST)
Date: Mon, 14 Feb 2022 09:21:07 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Yang Zhong <yang.zhong@intel.com>
Subject: Re: [PATCH v4 4/4] hw/i386/sgx: Attach SGX-EPC objects to machine
Message-ID: <20220214092107.56d3f300@redhat.com>
In-Reply-To: <20220214065857.GA5015@yangzhon-Virtual>
References: <20220205124526.500158-1-f4bug@amsat.org>
 <20220205124526.500158-5-f4bug@amsat.org>
 <20220207093752.7503b6cb@redhat.com>
 <20220214065857.GA5015@yangzhon-Virtual>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 14:58:57 +0800
Yang Zhong <yang.zhong@intel.com> wrote:

> On Mon, Feb 07, 2022 at 09:37:52AM +0100, Igor Mammedov wrote:
> > On Sat,  5 Feb 2022 13:45:26 +0100
> > Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> >  =20
> > > Previously SGX-EPC objects were exposed in the QOM tree at a path
> > >=20
> > >   /machine/unattached/device[nn]
> > >=20
> > > where the 'nn' varies depending on what devices were already created.
> > >=20
> > > With this change the SGX-EPC objects are now at
> > >=20
> > >   /machine/sgx-epc[nn]
> > >=20
> > > where the 'nn' of the first SGX-EPC object is always zero. =20
> >=20
> > yet again, why it's necessary? =20
>=20
>=20
>   Igor, Sorry for delay feedback because of Chinese New Year holiday.
>=20
>   This series patches are to fix below issues I reported before,
>   https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg05670.html
>=20
>   Since the /machine/unattached/device[0] is used by vcpu and Libvirt
>   use this interface to get unavailable-features list. But in the SGX
>   VM, the device[0] will be occupied by virtual sgx epc device, Libvirt
>   can't get unavailable-features from this device[0].
>=20
>   Although patch 2 in this series already fixed "unavailable-features" is=
sue,

I've seen patches on libvirt fixing "unavailable-features" in another way
without dependence on  /machine/unattached/device[0].
see:
 https://www.mail-archive.com/libvir-list@redhat.com/msg226244.html

>   this patch can move sgx virtual device from /machine/unattached/device[=
nn]
>   to /machine/sgx-epc[nn], which seems more clear. Thanks!

with those patches device[0] becomes non issue, and this patch also becomes
unnecessary.
I don't mind putting sgx-epc under machine, but that shall be justified
somehow. A drawback I noticed in this case is an extra manual
plumbing/wiring without apparent need for it.

PS:
general note on submitting patches.
Commit message shall
 1 describe problem (+error message/way to reproduce the issue)
 2 what patch does
 3 and why patch fixes the issue in a certain way

commit message in this patch only does #2,  without any clue
to what the problem was nor why it tries to fix it this way.

>=20
>   Yang
>  =20
>=20
> >  =20
> > >=20
> > > Reported-by: Yang Zhong <yang.zhong@intel.com>
> > > Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> > > Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > > ---
> > >  hw/i386/sgx.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
> > > index a2b318dd938..3ab2217ca43 100644
> > > --- a/hw/i386/sgx.c
> > > +++ b/hw/i386/sgx.c
> > > @@ -304,6 +304,8 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms=
)
> > >      for (list =3D x86ms->sgx_epc_list; list; list =3D list->next) {
> > >          obj =3D object_new("sgx-epc");
> > > =20
> > > +        object_property_add_child(OBJECT(pcms), "sgx-epc[*]", OBJECT=
(obj));
> > > +
> > >          /* set the memdev link with memory backend */
> > >          object_property_parse(obj, SGX_EPC_MEMDEV_PROP, list->value-=
>memdev,
> > >                                &error_fatal); =20
>=20


