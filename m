Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4102952B69E
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 12:11:08 +0200 (CEST)
Received: from localhost ([::1]:35676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrGe1-0000vz-Fc
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 06:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nrGc1-0000Am-8s
 for qemu-devel@nongnu.org; Wed, 18 May 2022 06:09:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nrGby-0005y1-17
 for qemu-devel@nongnu.org; Wed, 18 May 2022 06:08:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652868536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IUmny+1wUciSJAUqHQt54UHG286mNbu6CLpotlOp3kw=;
 b=Xv+UA74wzlUl/LBY2fG6O0wN1ORd/jj16wrZsyAXOn5zg38KT10JY8z3ZwNud7TP/EuwC6
 Qnq+ieIk/2pTQ3oOEWP4DUxTdt8+aq07jSd+LL+KoLr+rj2YVHZ9/iITKnb1/WLfBSKv+a
 V4nY6RQqyg3cjjOiHYYX96DHG3mOU1I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-Lc37Q1LwMDy3mYkOdv1z2A-1; Wed, 18 May 2022 06:08:53 -0400
X-MC-Unique: Lc37Q1LwMDy3mYkOdv1z2A-1
Received: by mail-wr1-f70.google.com with SMTP id
 s8-20020adfecc8000000b0020d080b6fddso434054wro.20
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 03:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IUmny+1wUciSJAUqHQt54UHG286mNbu6CLpotlOp3kw=;
 b=QS4rLhddLId1IkkbyqOk2LSV3btmVManzfdJTVM592OYdlWBTjtwUT8wkxQd2tlIQq
 vSg7t5W2g1MYxGquE4UtQ2kqzhlJTonMmrcaw1F9smZz/aMrGJ3fnL+3T8dP5rTcfN94
 S6KIpqEXqOTzaRBKOrbkayVfCBn+bAYOXHK7RAqBua0w4Dd3xqqE14bY6UlhUuPgoL4B
 XNEs5OHjJoiMdHlg1UdAxydSqqu0fS41o103RDC/23QHCg9IL8SfXlwAlxfjTXAyrX2E
 PEubMmnQ+stozlndqELRBOzqrnVEBZH7DE+weKtNGVcypO79EPeMd4q5IoO9Qp10PqM8
 5L+A==
X-Gm-Message-State: AOAM532znQVdtYWyMQJiEYcy78HBBfYu+0At3tPN9WYb2I0dTUkxctP9
 1nzHjiWG4Yoei/kzoThB24eB8t2Rvzu0K3ChkPOseqzfFIGt9c9jFhhD0xmZGLesUIB1novdZya
 9sofDxFSZWRlA9qI=
X-Received: by 2002:a05:600c:600d:b0:394:5353:507a with SMTP id
 az13-20020a05600c600d00b003945353507amr25392231wmb.96.1652868532423; 
 Wed, 18 May 2022 03:08:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoMPgJqbE2pHP64FgseO4L8v+6b1qze6YVmUJqjGOH50SdHR2G7mxZLyLsK/MkOzYaw3nj+Q==
X-Received: by 2002:a05:600c:600d:b0:394:5353:507a with SMTP id
 az13-20020a05600c600d00b003945353507amr25392207wmb.96.1652868532212; 
 Wed, 18 May 2022 03:08:52 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a05600c21c100b003942a244ee6sm1234474wmj.43.2022.05.18.03.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 03:08:51 -0700 (PDT)
Date: Wed, 18 May 2022 12:08:50 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Cc: dzejrou@gmail.com, qemu-devel@nongnu.org, david@redhat.com, Michal
 Privoznik <mprivozn@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] hostmem: default the amount of prealloc-threads to
 smp-cpus
Message-ID: <20220518120850.58ab8591@redhat.com>
In-Reply-To: <YoPOclX/REvSIxZK@redhat.com>
References: <20220517123858.7933-1-dzejrou@gmail.com>
 <20220517171228.44c53748@redhat.com> <YoPOclX/REvSIxZK@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 May 2022 17:33:54 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Tue, May 17, 2022 at 05:12:28PM +0200, Igor Mammedov wrote:
> > On Tue, 17 May 2022 14:38:58 +0200
> > dzejrou@gmail.com wrote:
> >  =20
> > > From: Jaroslav Jindrak <dzejrou@gmail.com>
> > >=20
> > > Prior to the introduction of the prealloc-threads property, the amount
> > > of threads used to preallocate memory was derived from the value of
> > > smp-cpus passed to qemu, the amount of physical cpus of the host
> > > and a hardcoded maximum value. When the prealloc-threads property
> > > was introduced, it included a default of 1 in backends/hostmem.c and
> > > a default of smp-cpus using the sugar API for the property itself. The
> > > latter default is not used when the property is not specified on qemu=
's
> > > command line, so guests that were not adjusted for this change sudden=
ly
> > > started to use the default of 1 thread to preallocate memory, which
> > > resulted in observable slowdowns in guest boots for guests with large
> > > memory (e.g. when using libvirt <8.2.0 or managing guests manually). =
=20
> >=20
> > current behavior in QEMU is intentionally conservative. threads
> > number is subject to host configuration and limitations management
> > layer puts on it and it's not QEMU job to conjure magic numbers that
> > are host/workload depended. =20
>=20
> I think that's missing the point. QEMU *did* historically set the
> prealloc threads equal to num CPUs, so we have precedent here. The
> referenced commit lost that behaviour because it only wired up the
> defaults in one particular CLI scenario. That's a clear regression
> on QEMU's side.

commit preserved behavior with legacy options to reduce disturbance.
Considering that users will have update QEMU which most likely includes
newer libvirt as well which lets configure number of allocation threads [1].
Users should fix configuration rather then pulling back layer violation hac=
ks
(precedent is not a good excuse wrt reluctance to adapt to new behavior)

1) https://libvirt.org/formatdomain.html#elementsMemoryAllocation

>=20
> With regards,
> Daniel


