Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1316197A9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 14:22:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqwdz-0006Tk-Rh; Fri, 04 Nov 2022 09:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oqwdg-0006RQ-LE
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 09:21:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oqwdd-0008HY-4i
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 09:21:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667568094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=op/tD1+Qzr/PMSxQnVatboiyKejwxulB72j86lpJpqo=;
 b=JgWMCE1BCMm+9L1sJYF/k5puDw2GxYdo3feNSL5b9z3iHK5am/EoVf/bTgvEWSaDMaLafD
 oeYNq/VerTAK6xhmQ2avnuAMWmwmSLsBXY0+AD8G9BLkiIn8aYOtcq2o1l9SUqpoOv3up/
 zC47j69T8wTaqJJBzhiEcV7tpwYjqRw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-582-xlMHOUSsPby-V9GTdXbRgQ-1; Fri, 04 Nov 2022 09:21:33 -0400
X-MC-Unique: xlMHOUSsPby-V9GTdXbRgQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 dz9-20020a0564021d4900b0045d9a3aded4so3563368edb.22
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 06:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=op/tD1+Qzr/PMSxQnVatboiyKejwxulB72j86lpJpqo=;
 b=aVN7kVn0Sw9NChIIkO33wif+LamrBQ9dgehxT8Z9hh2ceIMMvI/fmmGLNP4n4y6R3r
 ZJrXohPWE5U/738k8Fwj6PId9+y4ZtdFJAukYB3mlA8BsmxBo4ZFB5fnNEj2S5MqnI+O
 hf0z1hHO4M9xsottCgWj9adTbLllTMDe07Q5uJCIROKCVn1MsEo/ubhkoXd7why/CuF+
 RknR3HckDe0+UsG2tfbCqlHbymg9YLpJAbULJuG24EtnQ3xWEGNXn1/zbFBaOlTbWIlc
 5LTPYamPWpwK4kdjVwcfkFkC3EmdgNCO2GmHkNzkks5Atr4d/h7f9MsBgvxax0k7JryM
 3v5g==
X-Gm-Message-State: ACrzQf27dN/I8bLVN9VZoC2Ji9c6d2ooNbNMdcWGCiuoxy2O6S6SiMRt
 OUGxavXXNpqNZm/2IQhBrl/BnFe/KZWEQu3wbFYj3FzzwxeQBdHgO+MGUfaWU5vfbMAfNz5+pxm
 OTy7ebkH8NIFTtPc=
X-Received: by 2002:a17:906:fe45:b0:791:9624:9ea4 with SMTP id
 wz5-20020a170906fe4500b0079196249ea4mr33983046ejb.147.1667568091974; 
 Fri, 04 Nov 2022 06:21:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6r39i6sJeYsv3oKPiYsCCTs9l3AJzLHVK9116g6urNI7kjSYkngq4oMELS1ZPCNAYqqHdYCg==
X-Received: by 2002:a17:906:fe45:b0:791:9624:9ea4 with SMTP id
 wz5-20020a170906fe4500b0079196249ea4mr33983024ejb.147.1667568091705; 
 Fri, 04 Nov 2022 06:21:31 -0700 (PDT)
Received: from fedora (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 v17-20020aa7d811000000b00459ad800bbcsm1941108edq.33.2022.11.04.06.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 06:21:31 -0700 (PDT)
Date: Fri, 4 Nov 2022 14:21:30 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Zhenyu
 Zhang <zhenyzha@redhat.com>, qemu-devel@nongnu.org, shan.gavin@gmail.com,
 liuyd.fnst@fujitsu.com, eric.auger@redhat.com
Subject: Re: [PATCH] qom.json: default the prealloc-threads to smp-cpus
Message-ID: <20221104142130.63500afe@fedora>
In-Reply-To: <87bkpn2udt.fsf@pond.sub.org>
References: <20221103104716.179635-1-zhenyzha@redhat.com>
 <7eecb87f-7d37-93d0-db93-21f7c6374d91@linaro.org>
 <87bkpn2udt.fsf@pond.sub.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 04 Nov 2022 05:53:02 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>=20
> > On 3/11/22 11:47, Zhenyu Zhang wrote: =20
> >> Since the amount of prealloc-threads to smp-cpus is
> >> defaulted in hostmem, so sync this information. =20
>=20
> Has this always defaulted to smp-cpus, or did this change along the way?
yes and no
(originally value was 1 with vl.c fixing it up to smp-cpus when
legacy -mem-prealloc was used)
  ffac16fab33bb hostmem: introduce "prealloc-threads" property
however later on
  2a4e02d104b1 hostmem: set default prealloc_threads to valid value
hack was merged (sigh),
brought back direct dependency on machine->smp.cpus to memory
allocation and that flipped default to number of smp-cpus.

> >> Signed-off-by: Zhenyu Zhang <zhenyzha@redhat.com>
> >> ---
> >>   qapi/qom.json | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >> diff --git a/qapi/qom.json b/qapi/qom.json
> >> index 87fcad2423..ac4cd213a7 100644
> >> --- a/qapi/qom.json
> >> +++ b/qapi/qom.json
> >> @@ -576,7 +576,7 @@
> >>   #
> >>   # @prealloc: if true, preallocate memory (default: false)
> >>   #
> >> -# @prealloc-threads: number of CPU threads to use for prealloc (defau=
lt: 1)
> >> +# @prealloc-threads: number of CPU threads to use for prealloc (defau=
lt: smp-cpus) (since 7.1) =20
> >
> > The property is present since 5.0. Shouldn't this be "(default: smp-cpu=
s) (since 5.0)"? =20
>=20
> Yes.
>=20
> >>   #
> >>   # @prealloc-context: thread context to use for creation of prealloca=
tion threads
> >>   #                    (default: none) (since 7.2) =20
>=20


