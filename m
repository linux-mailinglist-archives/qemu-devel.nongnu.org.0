Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59D44540C6
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 07:15:09 +0100 (CET)
Received: from localhost ([::1]:47502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnEDr-0000Cd-BV
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 01:15:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mnE9D-0007VW-OW
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 01:10:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mnE97-0006Nf-M0
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 01:10:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637129409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DxNslZMmmAeqs6SXBpy66acCQqlEbnvMLkNxhOkt6ug=;
 b=eMDI0WbggkzgAS5ogV6PUh9TsJkK7yGHCf6qF8EjqjLjZXLbXLkgtoW6TER6VrIhzQS872
 3XiK+0AmihwQd8rTEmoYmMYG7mvDhJ3U2B0mfAPs3HmX/eUOmvBh9EW475GIQFGTXRKDZw
 rr1yhoZXxq6L8SkPIZT1e7kXSNfZ+5Q=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-gQJubeHsMOWzLhdul8NnrA-1; Wed, 17 Nov 2021 01:10:05 -0500
X-MC-Unique: gQJubeHsMOWzLhdul8NnrA-1
Received: by mail-lf1-f70.google.com with SMTP id
 c14-20020a056512104e00b004036d17f91bso798023lfb.17
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 22:10:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DxNslZMmmAeqs6SXBpy66acCQqlEbnvMLkNxhOkt6ug=;
 b=7nZQNmjgkm/HboadOf6AdEPuahxfbfwHbl58tjgEJBnGgYpRLAhJ3Dyfq5Y9GjQqkw
 3NGneRu/EXzcrSur419kn8BfoXwJ6CjMdpLT/llU00jYiaoVHk39bfUBT8DUvtHrFNt0
 3mVxOs53bRfPFYW5qi/dmjSDrAkcNv2GHuRyqoV0qKxJvj2fELPMw95L6cH219qtzeTi
 2K8VhrshtygE6Zdk/CrYgL7G+6WMwpyE+TAwHf19wFUBa9uZTnOFgl/81ZOG2YaZGX4p
 sXU8zJojmlgq5MrxjQkvbLo2JWFk+zp7yLeftTznEgLCFpkWgFT2KclVnuTdrXuRQg1W
 2Cuw==
X-Gm-Message-State: AOAM530MH+rso5W0yCR69ORKfSxx34ALnDCCnkrV4QS0pwEuIMXfZgE3
 g4WI99ijTzwcY9UqdAIsawRFiH6NvP2OZ0w3nEzZI2tA2OwIPxOqYNSfTmZgi3d0Jym7HsQ3E8p
 hhnkWKT28YKY3HvDKTcf2U/VPFoMu88I=
X-Received: by 2002:ac2:518b:: with SMTP id u11mr12574586lfi.498.1637129403754; 
 Tue, 16 Nov 2021 22:10:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBJ90ur/NfryYxBWLptQNE4KFIWb7oUEclkKFVxZOWpXXtBI1CKo5DsXfmnHVYcWKbWbJOQ3Nuv8yed7uCkaQ=
X-Received: by 2002:ac2:518b:: with SMTP id u11mr12574550lfi.498.1637129403370; 
 Tue, 16 Nov 2021 22:10:03 -0800 (PST)
MIME-Version: 1.0
References: <20211112091414.34223-1-yaroshchuk2000@gmail.com>
 <CACGkMEuiXy+OhGxq0aR=f0HuvFAbN427m=HL035WuJLsOsGpSg@mail.gmail.com>
 <CADO9X9Rqcn_Bg=pg=14Y=rxXV6AniPAfPTfvHW9=NrXTpjo1oQ@mail.gmail.com>
 <CACGkMEtRg6SmSYm3TH5zc-VWUSKf=n9GKtV9VbVchrE1j-osDA@mail.gmail.com>
 <CADO9X9TXGvPi6DF2gSgaM+=buJCiD-P-4_O8vPfusXG8AGYouA@mail.gmail.com>
In-Reply-To: <CADO9X9TXGvPi6DF2gSgaM+=buJCiD-P-4_O8vPfusXG8AGYouA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 17 Nov 2021 14:09:52 +0800
Message-ID: <CACGkMEuSV8d0Hw-SrPGhk+HkwWLhH_x_MF-q5G8quUe_W9a5gw@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add vmnet.framework based network backend
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: phillip.ennen@gmail.com, qemu-devel <qemu-devel@nongnu.org>, "Armbruster,
 Markus" <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Phillip Tennen <phillip@axleos.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>, Alessio Dionisi <hello@adns.io>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 16, 2021 at 11:30 PM Vladislav Yaroshchuk
<yaroshchuk2000@gmail.com> wrote:
>
>
>
> =D0=B2=D1=82, 16 =D0=BD=D0=BE=D1=8F=D0=B1. 2021 =D0=B3. =D0=B2 10:23, Jas=
on Wang <jasowang@redhat.com>:
>>
>> On Mon, Nov 15, 2021 at 6:45 PM Vladislav Yaroshchuk
>> <yaroshchuk2000@gmail.com> wrote:
>> >
>> >
>> >
>> > =D0=BF=D0=BD, 15 =D0=BD=D0=BE=D1=8F=D0=B1. 2021 =D0=B3. =D0=B2 07:53, =
Jason Wang <jasowang@redhat.com>:
>> >>
>> >> On Fri, Nov 12, 2021 at 5:14 PM Vladislav Yaroshchuk
>> >> <yaroshchuk2000@gmail.com> wrote:
>> >> >
>> >> > macOS provides networking API for VMs called 'vmnet.framework':
>> >> > https://developer.apple.com/documentation/vmnet
>> >> >
>> >> > We can provide its support as the new QEMU network backends which
>> >> > represent three different vmnet.framework interface usage modes:
>> >> >
>> >> >   * `vmnet-shared`:
>> >> >     allows the guest to communicate with other guests in shared mod=
e and
>> >> >     also with external network (Internet) via NAT. Has (macOS-provi=
ded)
>> >> >     DHCP server; subnet mask and IP range can be configured;
>> >> >
>> >> >   * `vmnet-host`:
>> >> >     allows the guest to communicate with other guests in host mode.
>> >> >     By default has enabled DHCP as `vmnet-shared`, but providing
>> >> >     network unique id (uuid) can make `vmnet-host` interfaces isola=
ted
>> >> >     from each other and also disables DHCP.
>> >> >
>> >> >   * `vmnet-bridged`:
>> >> >     bridges the guest with a physical network interface.
>> >> >
>> >> > This backends cannot work on macOS Catalina 10.15 cause we use
>> >> > vmnet.framework API provided only with macOS 11 and newer. Seems
>> >> > that it is not a problem, because QEMU guarantees to work on two mo=
st
>> >> > recent versions of macOS which now are Big Sur (11) and Monterey (1=
2).
>> >> >
>> >> > Also, we have one inconvenient restriction: vmnet.framework interfa=
ces
>> >> > can create only privileged user:
>> >> > `$ sudo qemu-system-x86_64 -nic vmnet-shared`
>> >> >
>> >> > Attempt of `vmnet-*` netdev creation being unprivileged user fails =
with
>> >> > vmnet's 'general failure'.
>> >> >
>> >> > This happens because vmnet.framework requires `com.apple.vm.network=
ing`
>> >> > entitlement which is: "restricted to developers of virtualization s=
oftware.
>> >> > To request this entitlement, contact your Apple representative." as=
 Apple
>> >> > documentation says:
>> >> > https://developer.apple.com/documentation/bundleresources/entitleme=
nts/com_apple_vm_networking
>> >>
>> >> Do you know how multipass work? Looks like it uses vmnet without priv=
ileges.
>> >>
>> >
>> > I've just checked this, and they still need root privileges. They have=
 a
>> > `multipassd` daemon which is launched as root by launchd by default.
>> >
>> > ```
>> > bash-5.1$ ps axo ruser,ruid,comm | grep multipass
>> > root                 0 /Library/Application Support/com.canonical.mult=
ipass/bin/multipassd
>> > root                 0 /Library/Application Support/com.canonical.mult=
ipass/bin/hyperkit
>> > ```
>> >
>> > That's the reason why it's required to 'enter a password' while multip=
ass installation:
>> > it creates launchd plist (kinda launch rule) and places it to /Library=
/LaunchDaemons/,
>> > which can be done only with root privileges.
>> >
>> > ```
>> > bash-5.1$ ll /Library/LaunchDaemons | grep multipass
>> > -rw-r--r--   1 root  wheel   1.1K 15 Nov 12:47 com.canonical.multipass=
d.plist
>> > ```
>> >
>> > And after this launchd launches this multipassd daemon as root every b=
oot.
>> >
>> > So an unprivileged user can launch a multipass VM instance, but actual=
ly the
>> > `hyperkit` process which interacts with vmnet is gonna be launched by =
multipassd
>> > running as root.
>>
>> I wonder how it passes the vmnet object to qemu? Nothing obvious from
>> the qemu command line that multipass launched:
>>
>> -nic vmnet-macos,mode=3Dshared,model=3Dvirtio-net-pci,mac=3D52:54:00:52:=
e8:e4
>>
>> (But I haven't had time to check their qemu codes).
>>
>
> It seems they just use QEMU with patch by Phillip Tennen:
> https://patchew.org/QEMU/20210218134947.1860-1-phillip.ennen@gmail.com/
>
> In that patch he does quite the same as we in this series, the
> difference remains in foreground: he creates one new 'vmnet-macos'
> netdev, and uses 'mode=3Dshared' property to choose vmnet
> operating mode. I decided to create three different netdevs instead
> (vmnet-shared, vmnet-host, vmnet-bridged). Also I've added some
> features related to isolation and ipv6.

Ok.

>
> > I wonder how it passes the vmnet object to qemu
> I hope I clearly described this.

A silly question, how did the 'hyperkit' process pass the vmnet object to q=
emu?

>
>> >
>> > tl;dr sadly, we can't interact with vmnet.framework without having our=
 binary correctly
>> > signed and being an unprivileged user. Root privileges or special sign=
ature with
>> > entitlement is required.
>>
>> This is something similar to what happens in other OS. E.g for the tap
>> backend, it can't be created without privileges. So qemu allows to:
>>
>> 1) the TAP to be created by privileged program like libvirt, and its
>> fd could be passed to qemu via SCM_RIGHTS
>> 2) run a set-uid helper to create and config TAP
>>
>> This is something we need to consider now or in the future probably.
>>
>
> Seems we can do nothing with this if we have qemu-bundled &
> direct vmnet.framework interaction, it always requires privileges
> or entitlement.
> The workaround can be moving vmnet-related things to
> another helper binary running with privileges, and usage of
> this helper somewhere between qemu and vmnet.

Yes, that's my point.

>
> I think for now it's applicable to leave it as is, having qemu
> that requires privileges for vmnet.framework usage.

Right, but we need to consider it for the future.

Btw, if you wish, you can list yourself as the maintainer for this backend.

Thanks

>
>>
>> Thanks
>>
>> >
>> >
>> >> Thanks
>> >>
>> >
>> > Thank you for your review, I will check it this week and reply as soon=
 as possible.
>> >
>> >>
>> >> >
>> >> > One more note: we still have quite useful but not supported
>> >> > 'vmnet.framework' features as creating port forwarding rules, IPv6
>> >> > NAT prefix specifying and so on.
>> >> >
>> >> > Nevertheless, new backends work fine and tested within `qemu-system=
-x86-64`
>> >> > on macOS Bir Sur 11.5.2 host with such nic models:
>> >> >   * e1000-82545em
>> >> >   * virtio-net-pci
>> >> >   * vmxnet3
>> >> >
>> >> > The guests were:
>> >> >   * macOS 10.15.7
>> >> >   * Ubuntu Bionic (server cloudimg)
>> >> >
>> >> >
>> >> > This series partially reuses patches by Phillip Tennen:
>> >> > https://patchew.org/QEMU/20210218134947.1860-1-phillip.ennen@gmail.=
com/
>> >> > So I included his signed-off line into one of the commit messages a=
nd
>> >> > also here.
>> >> >
>> >> > v1 -> v2:
>> >> >  Since v1 minor typos were fixed, patches rebased onto latest maste=
r,
>> >> >  redundant changes removed (small commits squashed)
>> >> >
>> >> > v2 -> v3:
>> >> >  - QAPI style fixes
>> >> >  - Typos fixes in comments
>> >> >  - `#include`'s updated to be in sync with recent master
>> >> > v3 -> v4:
>> >> >  - Support vmnet interfaces isolation feature
>> >> >  - Support vmnet-host network uuid setting feature
>> >> >  - Refactored sources a bit
>> >> > v4 -> v5:
>> >> >  - Missed 6.2 boat, now 7.0 candidate
>> >> >  - Fix qapi netdev descriptions and styles
>> >> >    (@subnetmask -> @subnet-mask)
>> >> >  - Support vmnet-shared IPv6 prefix setting feature
>> >> >
>> >> > Signed-off-by: Phillip Tennen <phillip@axleos.com>
>> >> > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
>> >> >
>> >> > Vladislav Yaroshchuk (6):
>> >> >   net/vmnet: add vmnet dependency and customizable option
>> >> >   net/vmnet: add vmnet backends to qapi/net
>> >> >   net/vmnet: implement shared mode (vmnet-shared)
>> >> >   net/vmnet: implement host mode (vmnet-host)
>> >> >   net/vmnet: implement bridged mode (vmnet-bridged)
>> >> >   net/vmnet: update qemu-options.hx
>> >> >
>> >> >  meson.build                   |   4 +
>> >> >  meson_options.txt             |   2 +
>> >> >  net/clients.h                 |  11 ++
>> >> >  net/meson.build               |   7 +
>> >> >  net/net.c                     |  10 ++
>> >> >  net/vmnet-bridged.m           | 111 ++++++++++++
>> >> >  net/vmnet-common.m            | 325 ++++++++++++++++++++++++++++++=
++++
>> >> >  net/vmnet-host.c              | 111 ++++++++++++
>> >> >  net/vmnet-shared.c            |  92 ++++++++++
>> >> >  net/vmnet_int.h               |  48 +++++
>> >> >  qapi/net.json                 | 127 ++++++++++++-
>> >> >  qemu-options.hx               |  25 +++
>> >> >  scripts/meson-buildoptions.sh |   3 +
>> >> >  13 files changed, 874 insertions(+), 2 deletions(-)
>> >> >  create mode 100644 net/vmnet-bridged.m
>> >> >  create mode 100644 net/vmnet-common.m
>> >> >  create mode 100644 net/vmnet-host.c
>> >> >  create mode 100644 net/vmnet-shared.c
>> >> >  create mode 100644 net/vmnet_int.h
>> >> >
>> >> > --
>> >> > 2.23.0
>> >> >
>> >>
>> >
>> >
>> > --
>> > Best Regards,
>> >
>> > Vladislav Yaroshchuk
>>
>
>
> --
> Best Regards,
>
> Vladislav Yaroshchuk


