Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7705A318653
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 09:32:57 +0100 (CET)
Received: from localhost ([::1]:45852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA7PE-00030I-JJ
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 03:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lA7NO-0001Vg-8l
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 03:31:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lA7NL-00044C-EV
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 03:31:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613032258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1FiChKaWDxiYmCXKm7P/X1tvh0yz7e3rBBmSy7WGMow=;
 b=MUa5gwlKHNBikVixiWJiYZbGoZgGgZBTKO3Afk10JGiASx8Xuwg3YwbyfV3t9wD05jb1uN
 rbP9LxWqOFgC4Mc2iT0LkLf/KzO8yMcH6o+39R0aqim8i/dI+oKUvpb1W9UwoqAIn/TfPI
 c1fcJGbnUlL1CxUxOkqtTD4VWG3tH30=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-lZzIJRuqO72M3j1pkLPZJA-1; Thu, 11 Feb 2021 03:30:56 -0500
X-MC-Unique: lZzIJRuqO72M3j1pkLPZJA-1
Received: by mail-ed1-f72.google.com with SMTP id bo11so4357545edb.0
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 00:30:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=i01Df5ldlJcq0HBsB/mdwTQhXC0yviWcBqIhPd06IG8=;
 b=B2+aNLJPx7KEpR/KnzukytI0+AuShS1arIDLQ99dccCF1LObUQTm0Np6X2FLIjDWZA
 sAxTW0DB7QKZcq/n9kE8KrOpxAkAgSjZoOxZKBmc2+N+e3sU6qdKvB9XEz+ERJx5c6b1
 VmHriZu4prQhykzdNgvXhpa0hhQ71S1eXlQB5aLHRl2Y0zvTuhtJK30u9BUNLcZQXF9g
 suWDA5m6l4QeRcJTEAzkK9hg72HnKvhex9/sEVobyo2PzOpc8XJWk38ndUCj40kZqkpy
 mzPhfVwGj/GV9gjqO04SSU6WXT1LhyalGB4mVh5b5MrYn7dxVUirP8ouqIhDjl0nOU2G
 jSpA==
X-Gm-Message-State: AOAM531qxPBxewYYHoAovJdzdVHbFpGkHPKCrLQQvt4WOEzghoZbA723
 EmzuqhKB+9k+m/20Rrs08NHIHRT6ZQlaldrwaMrgpwIZpwWuUF/+vTqvqjvw5x0t6x0WtEpOisy
 Ao0xSDfYlcHhndZ0=
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr7142721edd.100.1613032255044; 
 Thu, 11 Feb 2021 00:30:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJXeKISH0qcrjLmzB8FBVtsf0Ri4lvhsvDtorXVIhmR6aCm2HWY/iDMBqPfXW+4aYRxIe9gA==
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr7142680edd.100.1613032254676; 
 Thu, 11 Feb 2021 00:30:54 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id t11sm3189112edd.1.2021.02.11.00.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 00:30:54 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang?=
 =?utf-8?Q?=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 00/19] i386: KVM: expand Hyper-V features early and
 provide simple 'hv-default=on' option
In-Reply-To: <20210210174652.GE1420762@habkost.net>
References: <20210210164033.607612-1-vkuznets@redhat.com>
 <20210210165606.GM1240644@redhat.com>
 <20210210174652.GE1420762@habkost.net>
Date: Thu, 11 Feb 2021 09:30:53 +0100
Message-ID: <87ft23m2f6.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Wed, Feb 10, 2021 at 04:56:06PM +0000, Daniel P. Berrang=C3=A9 wrote:
>> On Wed, Feb 10, 2021 at 05:40:12PM +0100, Vitaly Kuznetsov wrote:
>> > Changes since v3:
>> > - Make 'hv-default' override 'hv-*' options which were already set=20
>> >   (e.g. 'hv-feature=3Don,hv-default' case) [Igor]. Make 'hv-passthroug=
h'
>> >   behave the same way.
>> > - Add "i386: be more picky about implicit 'hv-evmcs' enablement" patch=
 to avoid
>> >   enabling 'hv-evmcs' with hv-default/hv-passthrough when guest CPU la=
cks VMX.
>> > - Add "i386: support 'hv-passthrough,hv-feature=3Doff' on the command =
line" patch
>> >   to make 'hv-passthrough' semantics match the newly introduced 'hv-de=
fault'.
>> > - Add "i386: track explicit 'hv-*' features enablement/disablement" pa=
tch to
>> >   support the above mentioned changes.
>> > - Expand qtest to check the above mentioned improvements.
>> >=20
>> > Original description:
>> >=20
>> > Upper layer tools like libvirt want to figure out which Hyper-V featur=
es are
>> > supported by the underlying stack (QEMU/KVM) but currently they are un=
able to
>> > do so. We have a nice 'hv_passthrough' CPU flag supported by QEMU but =
it has
>> > no effect on e.g. QMP's=20
>> >=20
>> > query-cpu-model-expansion type=3Dfull model=3D{"name":"host","props":{=
"hv-passthrough":true}}
>> >=20
>> > command as we parse Hyper-V features after creating KVM vCPUs and not =
at
>> > feature expansion time. To support the use-case we first need to make=
=20
>> > KVM_GET_SUPPORTED_HV_CPUID ioctl a system-wide ioctl as the existing
>> > vCPU version can't be used that early. This is what KVM part does. Wit=
h
>> > that done, we can make early Hyper-V feature expansion (this series).
>> >=20
>> > In addition, provide a simple 'hv-default' option which enables (and
>> > requires from KVM) all currently supported Hyper-V enlightenments.
>> > Unlike 'hv-passthrough' mode, this is going to be migratable.
>>=20
>> How is it going to be migratable if the semantics vary depending on
>> the host kernel KVM reporting features, because different kernels
>> will expose different features ?
>
> "all currently supported" in this context means "all features
> supported when the machine type was added", not "all features
> supported by the host kernel".

Yes, exactly.

'hv-passthrough' enables 'everything supported by the host' and this is
not migratable.

'hv-default' requires a certain set of features (depending on the
machine type) so the VM won't start if the host lacks something.

--=20
Vitaly


