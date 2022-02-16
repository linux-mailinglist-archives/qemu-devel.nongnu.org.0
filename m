Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF96D4B8398
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:05:46 +0100 (CET)
Received: from localhost ([::1]:42448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKGFt-0007iE-RK
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:05:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nKGBc-0004eR-TO
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:01:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nKGBY-00042x-8e
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:01:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645002074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TKeHIkENSwCLZh0+2NhTQ+iBjBj6faGQPYbVl5qsHBY=;
 b=OGFmCKuSo7gdaekD0ewAo4DcKxN1WItdHN627297hxx2zEzdU5hRDEcuGajzTI0JPdfnd8
 gfOQ6CbA1xfqBb3lpvTpC35K2a0bIKwtAgT18l4u4ySnZAaKWYt8/CTLzS9pjt3iagZK0V
 GfQ8mj+6s1LH85Vr4bQNmadJGg7XmC0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-hgZVcdk3Nf-qJiESApFaKA-1; Wed, 16 Feb 2022 04:01:09 -0500
X-MC-Unique: hgZVcdk3Nf-qJiESApFaKA-1
Received: by mail-ed1-f69.google.com with SMTP id
 g5-20020a056402090500b0040f28e1da47so1165823edz.8
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 01:01:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TKeHIkENSwCLZh0+2NhTQ+iBjBj6faGQPYbVl5qsHBY=;
 b=4U0cOrfrbQ2YrGF7C4t8wSqcBlZEF5fLJnZCUrKulcWkYzsFWFjUDJooy1/wzrB7Ih
 4E4VT3hFQs92b4S5Ezzu290ZZvnGoCjWCOpVjYlegO/qbWKl1bG/E6hN6NZ+p/53tKic
 jcWP6hn8tAKdnUtPDLaedzpxa16h2jcNQMOtKxHMwUDD3uvLAe0BTQKikB4o5oyJZxTW
 uXf08TGpyq+QYop9z7MFTx5p2LLAJ8it+8gUS9t5CiaNHQMKM6ekrcl1uh5BiwB8uEkw
 XoajzKoImRtmDUpn/QcUu38/ZJaJvhPbTkKL90+pw6Q3hf6TKQeLeGYC42/XX4ic4vpW
 3LZQ==
X-Gm-Message-State: AOAM533Me+INsrU3E2MFwDo9z7zacRh8qg0lNTxINyuER8rk0M5pa5gZ
 Egdpf1CcdZ/ZlX4mCtumquQfIBE1RV14xThG7z0HBsvyT/LfCYzVX74TLQQ+iQN7s46SsiOPm7H
 RqdUl3PtaBN8rhBE=
X-Received: by 2002:a17:906:360a:b0:6a6:a997:8297 with SMTP id
 q10-20020a170906360a00b006a6a9978297mr1488812ejb.180.1645002067749; 
 Wed, 16 Feb 2022 01:01:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbIgu85MltKFRP7zcFZF6pZgwK+QzTFqaHPaZivkSLQO479fSBLNjg10Qw07bb0mk0H3bCYQ==
X-Received: by 2002:a17:906:360a:b0:6a6:a997:8297 with SMTP id
 q10-20020a170906360a00b006a6a9978297mr1488793ejb.180.1645002067504; 
 Wed, 16 Feb 2022 01:01:07 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id c6sm2989189ejs.130.2022.02.16.01.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 01:01:06 -0800 (PST)
Date: Wed, 16 Feb 2022 10:01:02 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [PATCH v4 4/4] hw/i386/sgx: Attach SGX-EPC objects to machine
Message-ID: <20220216100102.1414d720@redhat.com>
In-Reply-To: <YgovOszouLTQfZgI@redhat.com>
References: <20220205124526.500158-1-f4bug@amsat.org>
 <20220205124526.500158-5-f4bug@amsat.org>
 <20220207093752.7503b6cb@redhat.com>
 <20220214065857.GA5015@yangzhon-Virtual>
 <20220214092107.56d3f300@redhat.com> <YgovOszouLTQfZgI@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?= =?UTF-8?B?w6k=?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 10:30:18 +0000
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Mon, Feb 14, 2022 at 09:21:07AM +0100, Igor Mammedov wrote:
> > On Mon, 14 Feb 2022 14:58:57 +0800
> > Yang Zhong <yang.zhong@intel.com> wrote:
> >  =20
> > > On Mon, Feb 07, 2022 at 09:37:52AM +0100, Igor Mammedov wrote: =20
> > > > On Sat,  5 Feb 2022 13:45:26 +0100
> > > > Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> > > >    =20
> > > > > Previously SGX-EPC objects were exposed in the QOM tree at a path
> > > > >=20
> > > > >   /machine/unattached/device[nn]
> > > > >=20
> > > > > where the 'nn' varies depending on what devices were already crea=
ted.
> > > > >=20
> > > > > With this change the SGX-EPC objects are now at
> > > > >=20
> > > > >   /machine/sgx-epc[nn]
> > > > >=20
> > > > > where the 'nn' of the first SGX-EPC object is always zero.   =20
> > > >=20
> > > > yet again, why it's necessary?   =20
> > >=20
> > >=20
> > >   Igor, Sorry for delay feedback because of Chinese New Year holiday.
> > >=20
> > >   This series patches are to fix below issues I reported before,
> > >   https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg05670.h=
tml
> > >=20
> > >   Since the /machine/unattached/device[0] is used by vcpu and Libvirt
> > >   use this interface to get unavailable-features list. But in the SGX
> > >   VM, the device[0] will be occupied by virtual sgx epc device, Libvi=
rt
> > >   can't get unavailable-features from this device[0].
> > >=20
> > >   Although patch 2 in this series already fixed "unavailable-features=
" issue, =20
> >=20
> > I've seen patches on libvirt fixing "unavailable-features" in another w=
ay
> > without dependence on  /machine/unattached/device[0].
> > see:
> >  https://www.mail-archive.com/libvir-list@redhat.com/msg226244.html
> >  =20
> > >   this patch can move sgx virtual device from /machine/unattached/dev=
ice[nn]
> > >   to /machine/sgx-epc[nn], which seems more clear. Thanks! =20
> >=20
> > with those patches device[0] becomes non issue, and this patch also bec=
omes
> > unnecessary.
> > I don't mind putting sgx-epc under machine, but that shall be justified
> > somehow. A drawback I noticed in this case is an extra manual
> > plumbing/wiring without apparent need for it. =20
>=20
> This is effectively questioning why we have a QOM hierarchy with
> named devices at all. IMHO we don't need to justify giving explicitly
> named nodes under QOM beyond  "this is normal QOM modelling", and
> anything under '/unattached' is subject to being fixed in this way.

I agree that we should fix '/unattached', however blindly naming and
moving it wherever just because we can is not the fixing I've have had
in the mind.

With QOM device models, I'd try to compose parent/child relationships
like it's done in real hardware (ex: apic is a part of x86 CPU, so we
made cpu its parent, there are many ARM device models that follow
the same suit.)

In commit message, there must be a reason/explanation as to why
proposed parent has been chosen.
The current reason (lets get it out of the way just because some
userspace abused direct access to QOM) in commit message in not
a valid (I'd even say wasn't valid to begin with).
All I'm asking for is for sane commit message explaining why
something is moved to where it's proposed so that others can
understand it when looking at it.

With this patch I'm not sure if SGX should be a part of machine
or a part of CPU device model. (it seem SGX is a CPU feature
after all)
=20
> Regards,
> Daniel


