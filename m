Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB3B318720
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 10:36:37 +0100 (CET)
Received: from localhost ([::1]:56282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA8Oq-0001r1-Ck
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 04:36:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lA8Mn-0001Aw-34
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 04:34:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lA8Mh-00062J-3F
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 04:34:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613036059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7omdiKk1tdWO3V8Idamot+I26TwX6kp53wHmm/mbG4Y=;
 b=d/V6okkYxbpCjDptOMNgtSOQR5XZhw8/HfKIL5p/87OmAJabfK7dkRJVqvkTA3TBQ0hfPq
 ef5vPN8Whgh/Zev9lwJjTb1yKJeemOuLWbIn6EwC4wcsXxQhL+2fA82Hbv97VobBlibOat
 9OJnCWg1Kg11QFL1LMS8PYsNIOB1/yE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-ojXE3z6xMA2XIq2y9oowIA-1; Thu, 11 Feb 2021 04:34:18 -0500
X-MC-Unique: ojXE3z6xMA2XIq2y9oowIA-1
Received: by mail-ed1-f69.google.com with SMTP id t9so4388256edd.3
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 01:34:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=s6Ouyy9raVKdwIwlK796I3zE+sPodUDCCv8AAK+V2SI=;
 b=MDOea1NAbrEeSbCNIvCeh5df+Eif7JQKdY1Z5Kuf+QYV7F/ei11xPEPSlaa5J8tLK/
 OGGCGzMO0j0afBO2l/LWtuK4FNmDvnQhx0t4Gcm05L/UKqkC6KfUv/qVpqnsdoqX2YD8
 K5Ejeafbz5oxOPUx36KAPjf5HxvmGFoKi2R547rDYFNLUiIGurTMmx85aUYnsB6fEq8e
 105a7HyJxCZPo6AUZY0UbzHRQLaR/bSBHf+aBXpOOsHyeeiV2LcbWMqOnHzP1REFzSrc
 JS3jOvVm97AarxVgwTEUaD18RkzQnHyyrtXMT/NXXNZgBJKH8O3Sdfn+hvgNfZycPKMc
 S6Yw==
X-Gm-Message-State: AOAM531Akl3ZVSzHT26s1qwAFZmNJ+QD6aaOaSESAprsGQCOB6RYp6yB
 fUz836WNkZXpKbFSECIfnouC1Vfui0M+I11DnaI/oh+VFqEWSrn1wL/5OcgrNXyfiuFqgk9O6qX
 a1plw24qhzJXbxCU=
X-Received: by 2002:a17:906:d922:: with SMTP id
 rn2mr7810960ejb.414.1613036056981; 
 Thu, 11 Feb 2021 01:34:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgQPaxet3Sk5Nw5oMiNx4LgUtV9/mAJOCtRUQVYLuMK3hXNiOZ0FBwmnt5fcNvVP91thi3nw==
X-Received: by 2002:a17:906:d922:: with SMTP id
 rn2mr7810932ejb.414.1613036056788; 
 Thu, 11 Feb 2021 01:34:16 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id hy24sm3822381ejc.40.2021.02.11.01.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 01:34:16 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 00/19] i386: KVM: expand Hyper-V features early and
 provide simple 'hv-default=on' option
In-Reply-To: <20210211091430.GB1302824@redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
 <20210210165606.GM1240644@redhat.com>
 <20210210174652.GE1420762@habkost.net>
 <87ft23m2f6.fsf@vitty.brq.redhat.com>
 <20210211091430.GB1302824@redhat.com>
Date: Thu, 11 Feb 2021 10:34:15 +0100
Message-ID: <87czx7lzhk.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Feb 11, 2021 at 09:30:53AM +0100, Vitaly Kuznetsov wrote:
>> Eduardo Habkost <ehabkost@redhat.com> writes:
>>=20
>> > On Wed, Feb 10, 2021 at 04:56:06PM +0000, Daniel P. Berrang=C3=A9 wrot=
e:
>> >> On Wed, Feb 10, 2021 at 05:40:12PM +0100, Vitaly Kuznetsov wrote:
>> >> > Changes since v3:
>> >> > - Make 'hv-default' override 'hv-*' options which were already set=
=20
>> >> >   (e.g. 'hv-feature=3Don,hv-default' case) [Igor]. Make 'hv-passthr=
ough'
>> >> >   behave the same way.
>> >> > - Add "i386: be more picky about implicit 'hv-evmcs' enablement" pa=
tch to avoid
>> >> >   enabling 'hv-evmcs' with hv-default/hv-passthrough when guest CPU=
 lacks VMX.
>> >> > - Add "i386: support 'hv-passthrough,hv-feature=3Doff' on the comma=
nd line" patch
>> >> >   to make 'hv-passthrough' semantics match the newly introduced 'hv=
-default'.
>> >> > - Add "i386: track explicit 'hv-*' features enablement/disablement"=
 patch to
>> >> >   support the above mentioned changes.
>> >> > - Expand qtest to check the above mentioned improvements.
>> >> >=20
>> >> > Original description:
>> >> >=20
>> >> > Upper layer tools like libvirt want to figure out which Hyper-V fea=
tures are
>> >> > supported by the underlying stack (QEMU/KVM) but currently they are=
 unable to
>> >> > do so. We have a nice 'hv_passthrough' CPU flag supported by QEMU b=
ut it has
>> >> > no effect on e.g. QMP's=20
>> >> >=20
>> >> > query-cpu-model-expansion type=3Dfull model=3D{"name":"host","props=
":{"hv-passthrough":true}}
>> >> >=20
>> >> > command as we parse Hyper-V features after creating KVM vCPUs and n=
ot at
>> >> > feature expansion time. To support the use-case we first need to ma=
ke=20
>> >> > KVM_GET_SUPPORTED_HV_CPUID ioctl a system-wide ioctl as the existin=
g
>> >> > vCPU version can't be used that early. This is what KVM part does. =
With
>> >> > that done, we can make early Hyper-V feature expansion (this series=
).
>> >> >=20
>> >> > In addition, provide a simple 'hv-default' option which enables (an=
d
>> >> > requires from KVM) all currently supported Hyper-V enlightenments.
>> >> > Unlike 'hv-passthrough' mode, this is going to be migratable.
>> >>=20
>> >> How is it going to be migratable if the semantics vary depending on
>> >> the host kernel KVM reporting features, because different kernels
>> >> will expose different features ?
>> >
>> > "all currently supported" in this context means "all features
>> > supported when the machine type was added", not "all features
>> > supported by the host kernel".
>>=20
>> Yes, exactly.
>>=20
>> 'hv-passthrough' enables 'everything supported by the host' and this is
>> not migratable.
>>=20
>> 'hv-default' requires a certain set of features (depending on the
>> machine type) so the VM won't start if the host lacks something.
>
> Ok, so I presume HV features will only be added to hv-default when we
> know they are available in the oldest kernel we are targetting ? Upsteam
> is more conservative in this respect than downstreams,  the latter can
> guarantee much more modern kernels.
>

Yes, it is kind of an open question when a feature gets 'promoted' to
'hv-default'. Currently, the latest feature we include is
'HYPERV_FEAT_STIMER_DIRECT' which dates back to Linux 5.0. It is also
possible to use something like

'hv-default,hv-stimer-direct=3Doff,...'

when running on an older kernel (and this is still migratable).

--=20
Vitaly


