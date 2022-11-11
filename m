Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A64625B58
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 14:41:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otUH9-0005Wm-Gt; Fri, 11 Nov 2022 08:40:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1otUH7-0005WW-SN
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 08:40:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1otUH5-00076n-U3
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 08:40:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668174050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5VtXb20+BrtijC+8wL5pfTjyQKzAsA2ZLIuSGwwjFpk=;
 b=PpeVwuIfNo8c3ZBxncpUQXQXYKQ0eMhMpHrSlSgZy2Rz+mEuRDIk0ox2l7rysiLrm3J3Ow
 9HfWP1BcA5SbgYWSG+syb3rRJU9ZlM5dbdHYkJ90UJZ21+WP0wf+ir0mY+XGVNb0BfmIC0
 auXQoEZboWoTUyQHanMzoQEmAQrP5j4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-227-4c58JEO2MJer18uVsc0o5w-1; Fri, 11 Nov 2022 08:40:48 -0500
X-MC-Unique: 4c58JEO2MJer18uVsc0o5w-1
Received: by mail-qv1-f69.google.com with SMTP id
 on28-20020a056214449c00b004bbf12d7976so3668295qvb.18
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 05:40:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5VtXb20+BrtijC+8wL5pfTjyQKzAsA2ZLIuSGwwjFpk=;
 b=rSi4o869X6tnvo37814Q7hI/Lx9vQIK/vESYcsa0Bhg1RHcxWBI4Gtb6pbqa1u/j9c
 AhdhA3mErUtjzkp3ydyYkztMr6V94YlCgxCtMrQYAMjx3mluDurbZjriYHo3TvfrOjgi
 OOrCDYVjP22ca/S7Fm99f7eG4ubTu+Da6wZGsatata40zpZYrTWYIznvyd5XqdIiIN9z
 cyQrbvCXYcdWKIPTvrIMn/ygVGdpUIhKHNIgpcKDYICJ6Hs2oYdlHax+WceJAE9IHLZT
 Eiqx5tDVBC1hpWwbBLccA3joU68D/ACrzd8i/+/TikOnHb0mk4hWsNK5p8QagF6fhAV3
 Z/CA==
X-Gm-Message-State: ANoB5plhOlUxML61k0q2AbjqRmDM2dZmkQJdKBBrCpEiqXl7CcSCUNUY
 IoK84uYv3x7z2ENb9/1N/UlMPsvjLdZ29sDm0qphjyeZDem0LmeequP2HVEwLeset4THLTpgmhz
 SYIOusnk7vv5+DdE=
X-Received: by 2002:a37:8084:0:b0:6fa:e240:fed2 with SMTP id
 b126-20020a378084000000b006fae240fed2mr1037581qkd.460.1668174046018; 
 Fri, 11 Nov 2022 05:40:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7ajPH63VHuekRwgNZEQrVqHReNfbM8o9NOK+7lnT50fo3tSvZD4RCJqqV6gCFsCmZkkS5XXg==
X-Received: by 2002:a37:8084:0:b0:6fa:e240:fed2 with SMTP id
 b126-20020a378084000000b006fae240fed2mr1037566qkd.460.1668174045763; 
 Fri, 11 Nov 2022 05:40:45 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 o16-20020a05620a2a1000b006fa617ac616sm1516137qkp.49.2022.11.11.05.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 05:40:45 -0800 (PST)
Date: Fri, 11 Nov 2022 14:40:42 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Cc: Dario Faggioli <dfaggioli@suse.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "eduardo@habkost.net" <eduardo@habkost.net>,
 "mst@redhat.com" <mst@redhat.com>, "marcel.apfelbaum@gmail.com"
 <marcel.apfelbaum@gmail.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>
Subject: Re: How about increasing max_cpus for q35 ?
Message-ID: <20221111144042.2f5cd5c6@imammedo.users.ipa.redhat.com>
In-Reply-To: <Y24oOMgmf9QYQkXm@redhat.com>
References: <c705d0d8d6ed1a520b1ff92cb2f83fef19522d30.camel@suse.com>
 <Y24oOMgmf9QYQkXm@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 11 Nov 2022 10:47:20 +0000
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Wed, Nov 09, 2022 at 01:36:07PM +0000, Dario Faggioli wrote:
> > Hello,
> >=20
> > Sorry for the potentially naive question, but I'm not clear what the
> > process would be if, say, I'd like to raise the number of maximum CPUs
> > a q35 VM can have.
> >=20
> > So, right now we have:
> >=20
> > void pc_q35_2_7_machine_options(MachineClass *m) {
> >   ...
> >   m->max_cpus =3D 255;
> > }
> >=20
> > And:
> >=20
> > void pc_q35_machine_options(MachineClass *m)
> > {
> >   ...
> >   m->max_cpus =3D 288;
> > }
> >=20
> > Focusing on the latter, it comes from this commit:
> >=20
> > https://gitlab.com/qemu-project/qemu/-/commit/00d0f9fd6602a27b204f672ef=
5bc8e69736c7ff1
> >  =20
> >   pc: q35: Bump max_cpus to 288
> >=20
> >   Along with it for machine versions 2.7 and older keep
> >   it at 255.
> >=20
> > So, it was 255 and is now 288. This seems to me to be there since QEMU
> > 2.8.0.
> >=20
> > Now, as far as I understand, KVM can handle 1024, at least since this
> > commit (and a couple of other related ones):
> >=20
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D074c82c8f7cf8a46c3b81965f122599e3a133450
> > "kvm: x86: Increase MAX_VCPUS to 1024"
> >=20
> > Which basically does:
> >=20
> > -#define KVM_MAX_VCPUS 288
> > +#define KVM_MAX_VCPUS 1024
> >=20
> > And it's included in kernels >=3D 5.15.
> >=20
> > So, what's the correct way of bumping up the limit again? Just changing
> > that assignment in pc_q35_machine_options() ? Or do we want a new
> > version of the machine type or something like that? =20
>=20
> Too late for this release, so we need to wait until the new release
> cycle opens, with thue addition of the 8.0.0 machine types. Then
> just set 'max_cpus' in the new machine type.
>=20
> In RHEL downstream we've set max_cpus =3D 710 for x86_64, because this
> is the largest that was possible without hitting SMBIOS limits. The
> problem was the use of the 32-bit entry point on PC machine types.

Just merged

    05e27d74c7dc5318 hw/smbios: add core_count2 to smbios table type 4

should have fixed the remaining issue with SMBIOS.
So we can flip default entrypoint to 64bit one for new machine
type (it's late for 7.2 but we should be able to do that for the next
one)
=20
> If we switch Q35 to use the 64-bit entry point, we should be able
> to go straight to 1024 IIUC.  We were blocked changing the entry
> point previously by need to have support in both SeaBIOS and UEFI
> builds. I'm not sure what the status of this is, for the ROMS we
> currently have in QEMU git. If both SeaBIOS and UEFI ROMs now
> support 64-bit SMBIOS, then we can switch Q35 to it.

there is UEFI issue (though not SMBIOS related one)
  https://bugzilla.redhat.com/show_bug.cgi?id=3D1983086
but now it seems that it could be fixed soon.

I'm not aware of other SeaBIOS/UEFI issues wrt large number of vCPUs.
=20
> With regards,
> Daniel


