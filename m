Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9460E53371D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 09:11:53 +0200 (CEST)
Received: from localhost ([::1]:56054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntlBQ-0001n7-A0
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 03:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ntl57-00054j-Bg
 for qemu-devel@nongnu.org; Wed, 25 May 2022 03:05:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ntl54-0001PL-8F
 for qemu-devel@nongnu.org; Wed, 25 May 2022 03:05:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653462317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=adsngsYHfk1UWYfYgZniLB3RrZMuGPkFD6OCwydYkyc=;
 b=O0nmjl4x6N2vc/a2BZcIRWT/iIfKRg9LGN6Yc1n5ILxiRLN0W54fcBgsMYc1BM7YeLhDtK
 w0Ac+LBw2bInRbPezm2Z+L3WTBdoIAYLDTEMHDajzGmOhuIOkrawDz1gyBWlfhqgOZXV6y
 A/PGodsbEATctYRy3F6cJcKCY8Rlf2s=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-l66My9iEOqe8lDL7EtnlOA-1; Wed, 25 May 2022 03:05:10 -0400
X-MC-Unique: l66My9iEOqe8lDL7EtnlOA-1
Received: by mail-ej1-f70.google.com with SMTP id
 ks1-20020a170906f84100b006fee53b22c2so4002100ejb.10
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 00:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=adsngsYHfk1UWYfYgZniLB3RrZMuGPkFD6OCwydYkyc=;
 b=uEH/KnyJ4noRUWhpoezMiilkLrQFVUR2LY0AORiWQIkVf/SmLz0OCbrebqVJMca6Nn
 qaj9qxoNhsBkadQNEGjWpBR4gtnFz82hjq+oJXKSSmkyEpT15u/zy+MEGN83qXx4/cpY
 I+amdHfU0prhtZIwU/tia9rS1yfXBLVSMqmT9wKKWoePiyMDeo5eaB91AmsiN/DnzEl5
 H4JQzgu567fqIw14r5c3bLUEWYBj+gYrYjYtIANIZo6xWLElIH74cfXODNmCOpIrieFP
 mKVAnlsbhg2IvqRFIW3R1MPro6euqSzWigIM/tEzjJn3urtx4OQmGJno1g/1Nhkj8SWm
 CHqg==
X-Gm-Message-State: AOAM530bRd4tG5Wtnm0QOKQjRu3NGwTM1Vh6TWwVO+yWpcujfL/EG+a5
 I/vRtT6oTU7hFLGMp+4SVd3NwIOesD5c36O0tk/afrGtaeI9IF6hD5GF4+ser3VBYkjOtW3Evjw
 b6Z1ijsCfdinT5MM=
X-Received: by 2002:a17:906:3104:b0:6ce:6b85:ecc9 with SMTP id
 4-20020a170906310400b006ce6b85ecc9mr27161270ejx.339.1653462308864; 
 Wed, 25 May 2022 00:05:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMdO2zzDR4HQ8D02laLKFbjeEhH6jmR0Smo/f8Uc99FnYsjEKxInOYijrBE/vLNBzxdZl/aQ==
X-Received: by 2002:a17:906:3104:b0:6ce:6b85:ecc9 with SMTP id
 4-20020a170906310400b006ce6b85ecc9mr27161247ejx.339.1653462308586; 
 Wed, 25 May 2022 00:05:08 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 u27-20020a170906069b00b006fec2097d53sm4080161ejb.118.2022.05.25.00.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 00:05:08 -0700 (PDT)
Date: Wed, 25 May 2022 09:05:06 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Moger, Babu" <babu.moger@amd.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] i386: fixup number of logical CPUs when
 host-cache-info=on
Message-ID: <20220525090506.63f55b4c@redhat.com>
In-Reply-To: <e4df1ba6-1a11-21e8-e344-f5e24fa49ce8@amd.com>
References: <20220524151020.2541698-1-imammedo@redhat.com>
 <20220524171949.47508d9b@redhat.com>
 <e4df1ba6-1a11-21e8-e344-f5e24fa49ce8@amd.com>
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

On Tue, 24 May 2022 14:48:29 -0500
"Moger, Babu" <babu.moger@amd.com> wrote:

> On 5/24/22 10:19, Igor Mammedov wrote:
> > On Tue, 24 May 2022 11:10:18 -0400
> > Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > CCing AMD folks as that might be of interest to them =20
>=20
> I am trying to recreate the bug on my AMD system here.. Seeing this messa=
ge..
>=20
> qemu-system-x86_64: -numa node,nodeid=3D0,memdev=3Dram-node0: memdev=3Dra=
m-node0
> is ambiguous
>=20
> Here is my command line..
>=20
> #qemu-system-x86_64 -name rhel8 -m 4096 -hda vdisk.qcow2 -enable-kvm -net
> nic=C2=A0 -nographic -machine q35,accel=3Dkvm -cpu
> host,host-cache-info=3Don,l3-cache=3Doff -smp
> 20,sockets=3D2,dies=3D1,cores=3D10,threads=3D1 -numa
> node,nodeid=3D0,memdev=3Dram-node0 -numa node,nodeid=3D1,memdev=3Dram-nod=
e1 -numa
> cpu,socket-id=3D0,node-id=3D0 -numa cpu,socket-id=3D1,node-id=3D1
>=20
> Am I missing something?
Yep, sorry I've omitted -object memory-backend-foo definitions for
ram-node0 and ram-node1

one can use any memory backend, it doesn't really matter in this case,
for example following should do:
  -object memory-backend-ram,id=3Dram-node0,size=3D2G \
  -object memory-backend-ram,id=3Dram-node1,size=3D2G=20


>=20
>=20
> > =20
> >> Igor Mammedov (2):
> >>   x86: cpu: make sure number of addressable IDs for processor cores
> >>     meets the spec
> >>   x86: cpu: fixup number of addressable IDs for logical processors
> >>     sharing cache
> >>
> >>  target/i386/cpu.c | 20 ++++++++++++++++----
> >>  1 file changed, 16 insertions(+), 4 deletions(-)
> >> =20


