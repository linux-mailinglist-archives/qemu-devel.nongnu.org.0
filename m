Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBD952D518
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 15:52:42 +0200 (CEST)
Received: from localhost ([::1]:56138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrga1-0004Ja-Db
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 09:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nrgXv-0002Dg-Ao
 for qemu-devel@nongnu.org; Thu, 19 May 2022 09:50:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nrgXt-0000QP-Ow
 for qemu-devel@nongnu.org; Thu, 19 May 2022 09:50:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652968229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=10Z07xm9+4yDp9FHTSCirOKidiLmE/jL8kDj845Ymt8=;
 b=Lo42+tef/3XEACzeW6LcSNoD9mLiyS5e96biftNaPUdmiFOzCKcUj9UZ9pnIWbGu8V1pPN
 DBB7R3ClNryaM+hLbla1+R5sTJqM4pR/26KGl3hZDIB36KxQmZ9J9LaEvubm+B0ylG+mL0
 /1QXk55VtCUG5OTeFCF70TSPQzGaEV4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-xyEunfnLNECiEcurmJeAZg-1; Thu, 19 May 2022 09:50:20 -0400
X-MC-Unique: xyEunfnLNECiEcurmJeAZg-1
Received: by mail-wr1-f70.google.com with SMTP id
 u26-20020adfb21a000000b0020ac48a9aa4so1585615wra.5
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 06:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=10Z07xm9+4yDp9FHTSCirOKidiLmE/jL8kDj845Ymt8=;
 b=B4onGYioT0VN6bFr6PiO7r6lQJxoZrMmVKyjptqsWkGvifVYHyuzdiCgkPnorIipP3
 gc5JltPRrNcMpWIdb6IOgARkk61mC/ERGONwwNB+8lTSczsy94OjmIqCGSEfpHlDfRVx
 8V6CvpgwetGdLzIs70FTyYgdYKmVSAkxUo5R0JFAVj40RhPKfEnfzDmgpD4CQHsMoauF
 5iP+/dDJwcn7ifF6JnZEBQ/bLVcH7i5/Y+fWwT3AMZyzWkIlAUxxejOk7S4+MsO4ir8+
 zO1rFZ7w+tOEzbqrG9GWmPtHNTQp//UDJwlcK91khlVTjr5vjjhMELeXcpR6nFQ9O+e2
 bcfA==
X-Gm-Message-State: AOAM530/+J3umazhVLZHB+E5KTyw+Bt04bvZCVf999p/BrSsXyD+HP88
 4j88ukcWYkBMzsmvbSFU5v3yZiDVYukydT49vpjM0+PTtAMciBQqX89bGmX5eY3xS24IYNUHdR8
 0jtWwQ6uODkZ+S3U=
X-Received: by 2002:a7b:c94e:0:b0:397:28a6:3966 with SMTP id
 i14-20020a7bc94e000000b0039728a63966mr4390326wml.191.1652968219080; 
 Thu, 19 May 2022 06:50:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwy42Y7phuZ2O5h6x/n9NXbJ+HeD68wJztvYqDNnHKiR4c2krqc5K7DhQTdgLWZGC31VgRSmA==
X-Received: by 2002:a7b:c94e:0:b0:397:28a6:3966 with SMTP id
 i14-20020a7bc94e000000b0039728a63966mr4390307wml.191.1652968218796; 
 Thu, 19 May 2022 06:50:18 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 q9-20020adf9dc9000000b0020d02ddf4d5sm4987242wre.5.2022.05.19.06.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 06:50:18 -0700 (PDT)
Date: Thu, 19 May 2022 15:50:17 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, Dario
 Faggioli <dfaggioli@suse.com>, dzejrou@gmail.com, qemu-devel@nongnu.org,
 david@redhat.com
Subject: Re: [PATCH] hostmem: default the amount of prealloc-threads to
 smp-cpus
Message-ID: <20220519155017.71f9ec6d@redhat.com>
In-Reply-To: <9851633b-d9a3-bc71-afd1-d24fe8972177@redhat.com>
References: <20220517123858.7933-1-dzejrou@gmail.com>
 <3994597b-c559-f62f-504d-3cde3493b713@redhat.com>
 <20220518121716.658ec569@redhat.com>
 <843da9ebf73d89a5084d4e29d972fdaa8b79bfae.camel@suse.com>
 <YoT1OolqFQ9+5t/q@redhat.com>
 <9851633b-d9a3-bc71-afd1-d24fe8972177@redhat.com>
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

On Wed, 18 May 2022 16:06:47 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 5/18/22 15:31, Daniel P. Berrang=C3=A9 wrote:
> > When picking defaults there is never a perfect answer, it
> > is more a matter of the least-worst option.
> >=20
> > It is pretty clear that nthreads=3D1 is terrible for any
> > large VMs. Defaulting it to nvcpus made conceptual sense
> > as the user has implicit said that they expect the VM to
> > be able to consume nvcpus worth of CPU time on the host,
> > so we might as well consume that allotted resource.

that assumes that allocation threads a permitted to actually
use all resources and not limited to 1 pcpu only and then it
also assumes 'more vcpus' =3D> 'large RAM'.

> I agree.  Yes, one could argue that the regression was on the libvirt=20
> side, but it's easier to fix it in QEMU.

libvirt already provides means to set threads number,
what needs fixing is setting up reasonable value in config
which depends on how VM is configured and constrains mgmt/host
put on it.

> If we later add the ability to create a memory backend before machine=20
> creation (for example with a QMP-only binary), then it's of course okay=20
> for those backends to use only one thread and require a manual choice=20
> for the # or preallocation threads.

What I'm vehemently against is putting back direct machine
references into backend code. I'm fine with 'prealloc-threads'
property set from machine code (whether it's compat property or
some sugar_prop() crutch in vl.c to appease CLI users).

>=20
> Paolo
>=20


