Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6934753B3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 08:31:19 +0100 (CET)
Received: from localhost ([::1]:39662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxOkw-0007fX-DN
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 02:31:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mxOcA-0005LT-Fg
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:22:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mxOc7-0002yh-Kb
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:22:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639552931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LFna2c6604qoqT/QSv5/6VS5Mif4ADQp20rBSkvCSp8=;
 b=fuyWDK5b3oWw26Qh9dJs6w3sTlBBg16A1mnfvZh8oTnVUlQOj2y7Myety7nNZHEKkH8tKI
 73AGj7TvCslUQnaWDZlyBJuwHh/WL8PqdD866b9VwpIOgQW+WKFx0/m5y4x4JCicRF5lhS
 kw3hMnbO3dtqT40DXEBWXMmGSx4LAto=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-FZ07UeFMN_aCNjH_ZmSIMg-1; Wed, 15 Dec 2021 02:22:09 -0500
X-MC-Unique: FZ07UeFMN_aCNjH_ZmSIMg-1
Received: by mail-ed1-f70.google.com with SMTP id
 a3-20020a05640213c300b003e7d12bb925so19308632edx.9
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 23:22:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LFna2c6604qoqT/QSv5/6VS5Mif4ADQp20rBSkvCSp8=;
 b=TkkgaS7P+P4lOMaa1uNZ7q3YDZMApYy2CpOX0v8yhtycOGEazN4KJHqfGeeT5zTQLx
 0C9Z3ymmXayI4aEYF8w9ss0kr+sfIiI5frkdvVGw8xhZPxTeOMHhtMMXObyvxaHG0uYm
 lcLzJcNnj+R6fqlvGSmQ9kQsFvF0s4xVnWTx9mrvM14fsizQR3JE92mteb++/rNZTZRl
 mCg7GjakBye9l66X4q+UJO/oxKuW0XueZKmPjt/dzCbg+MKJ7CYHDt5WXydZRvjncgH3
 Rt0397xs+3x66Lx8PeVPWt8YeZiUAc99x/BIkaBc4RQzegFvkMA0QS/Vz57SP14UuERL
 wdSA==
X-Gm-Message-State: AOAM532SLL2lhzxnlUABKGfwNG+ZDqJqL+02Atka1eeHQIow4dT6NQLZ
 E851RsEGW1KiXj8wmPFElxGCD2pUQEfPcq/dNVNcqwwBinZ4NiOQCvsatUlcs1tiKcK7xL+fq1M
 A5girjkocPZM+dy8=
X-Received: by 2002:a17:907:8a13:: with SMTP id
 sc19mr9470198ejc.130.1639552928605; 
 Tue, 14 Dec 2021 23:22:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxCfcCYVcfn+f7UFS9QqYNuKORh+grhzvfLxL6UqrZGvGDODU3NLM++EWraEyn9FhgNTzSFWA==
X-Received: by 2002:a17:907:8a13:: with SMTP id
 sc19mr9470187ejc.130.1639552928372; 
 Tue, 14 Dec 2021 23:22:08 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207d:b04b:8335:12e0:5819:f7df])
 by smtp.gmail.com with ESMTPSA id nd36sm349491ejc.17.2021.12.14.23.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 23:22:08 -0800 (PST)
Date: Wed, 15 Dec 2021 02:22:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: modify NetdevUserOptions through QMP in QEMU 6 - how?
Message-ID: <20211215022128-mutt-send-email-mst@kernel.org>
References: <CABMV8QOQzLRjm1bMTPz66FXOWaO7kYiZOG1G3ZmLHnznxVv1Yg@mail.gmail.com>
 <007f7313-eeb2-ee6a-ae2e-9341324388c0@redhat.com>
 <20211214094355-mutt-send-email-mst@kernel.org>
 <CACGkMEvNyWxo-p3edf7Gdmv0tU8XLxzZfH4hOgzZZvtvNDH+KQ@mail.gmail.com>
 <87fsqunz2x.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87fsqunz2x.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Thomas Huth <thuth@redhat.com>, Alexander Sosedkin <asosedkin@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-discuss@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 07:48:06AM +0100, Markus Armbruster wrote:
> Jason Wang <jasowang@redhat.com> writes:
> 
> > On Tue, Dec 14, 2021 at 10:53 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >>
> >> On Mon, Dec 13, 2021 at 09:02:15AM +0100, Thomas Huth wrote:
> >> >  Hi!
> >> >
> >> > On 10/12/2021 18.02, Alexander Sosedkin wrote:
> >> > > With QEMU 5 I could totally issue a QMP netdev_add
> >> > > with the same ID to adjust the NetdevUserOptions I want,
> >> > > such as restrict or hostfwd. No deleting needed,
> >> > > just a netdev_add with what I want changed as a param.
> >> >
> >> > I'm a little bit surprised that this worked, since AFAIK there is no code in
> >> > QEMU to *change* the parameters of a running netdev... likely the code added
> >> > a new netdev with the same ID, replacing the old one?
> >> >
> >> > > With QEMU 6 it started failing, claiming the ID is already used.
> >> > > And if I do netdev_del + netdev_add, I just lose connectivity.
> >> > > What's even stranger, I still see old netdev attached in info network:
> >> > >
> >> > > > netdev_del {'id': 'net0'}
> >> > > {}
> >> > > > human-monitor-command {'command-line': 'info network'}
> >> > > virtio-net-pci.0:
> >> > > index=0,type=nic,model=virtio-net-pci,macaddr=52:54:00:12:34:56
> >> > >   \ net0: index=0,type=user,net=10.0.2.0,restrict=off
> >> >
> >> > I think that's "normal" - there used to be problems in the past that the
> >> > devices (virtio-net-pci in this case) did not like the netdevs to be removed
> >> > on the fly. So the netdevs are kept around until you remove the device, too
> >> > (i.e. issue a device_del for the virtio-net-pci device).
> >> >
> >> > > > netdev_add {'type': 'user', 'id': 'net0', 'restrict': False, 'hostfwd': [{'str': 'tcp:127.0.0.1:58239-:22'}]}
> >> > > {}
> >> > > > human-monitor-command {'command-line': 'info network'}
> >> > > unseal: virtio-net-pci.0:
> >> > > index=0,type=nic,model=virtio-net-pci,macaddr=52:54:00:12:34:56
> >> > >   \ net0: index=0,type=user,net=10.0.2.0,restrict=off
> >> > > net0: index=0,type=user,net=10.0.2.0,restrict=off
> >> > >
> >> > > What's the correct QMP command sequence to modify NetdevUserOptions?
> >> >
> >> > AFAIK there is no way to modify running netdevs - you'd have to delete the
> >> > netdev and the device, and then add both again. But I might have missed
> >> > something here, so I CC:-ed some people who might be more familiar with the
> >> > details here.
> >> >
> >> >  Thomas
> >> >
> >> >
> >> > > Please CC me on replies.
> >>
> >>
> >> Wow this really goes to show how wide our feature matrix is.
> >>
> >> Yes it's probably an unintended side effect but yes it
> >> did work it seems, so we really should not just break it
> >> without warning.
> 
> Depends.  See below.
> 
> >> Probably this one:
> >>
> >> commit 831734cce6494032e9233caff4d8442b3a1e7fef
> >> Author: Markus Armbruster <armbru@redhat.com>
> >> Date:   Wed Nov 25 11:02:20 2020 +0100
> >>
> >>     net: Fix handling of id in netdev_add and netdev_del
> 
>        CLI -netdev accumulates in option group "netdev".
> 
>        Before commit 08712fcb85 "net: Track netdevs in NetClientState rather
>        than QemuOpt", netdev_add added to the option group, and netdev_del
>        removed from it, both HMP and QMP.  Thus, every netdev had a
>        corresponding QemuOpts in this option group.
> 
>        Commit 08712fcb85 dropped this for QMP netdev_add and both netdev_del.
>        Now a netdev has a corresponding QemuOpts only when it was created
>        with CLI or HMP.  Two issues:
> 
>        * QMP and HMP netdev_del can leave QemuOpts behind, breaking HMP
>          netdev_add.  Reproducer:
> 
>            $ qemu-system-x86_64 -S -display none -nodefaults -monitor stdio
>            QEMU 5.1.92 monitor - type 'help' for more information
>            (qemu) netdev_add user,id=net0
>            (qemu) info network
>            net0: index=0,type=user,net=10.0.2.0,restrict=off
>            (qemu) netdev_del net0
>            (qemu) info network
>            (qemu) netdev_add user,id=net0
>            upstream-qemu: Duplicate ID 'net0' for netdev
>            Try "help netdev_add" for more information
> 
>          Fix by restoring the QemuOpts deletion in qmp_netdev_del(), but with
>          a guard, because the QemuOpts need not exist.
> 
>        * QMP netdev_add loses its "no duplicate ID" check.  Reproducer:
> 
>            $ qemu-system-x86_64 -S -display none -qmp stdio
>            {"QMP": {"version": {"qemu": {"micro": 92, "minor": 1, "major": 5}, "package": "v5.2.0-rc2-1-g02c1f0142c"}, "capabilities": ["oob"]}}
>            {"execute": "qmp_capabilities"}
>            {"return": {}}
>            {"execute": "netdev_add", "arguments": {"type": "user", "id":"net0"}}
>            {"return": {}}
>            {"execute": "netdev_add", "arguments": {"type": "user", "id":"net0"}}
>            {"return": {}}
> 
>          Fix by adding a duplicate ID check to net_client_init1() to replace
>          the lost one.  The check is redundant for callers where QemuOpts
>          still checks, i.e. for CLI and HMP.
> 
>        Reported-by: Andrew Melnichenko <andrew@daynix.com>
>        Fixes: 08712fcb851034228b61f75bd922863a984a4f60
>        Cc: qemu-stable@nongnu.org
>        Signed-off-by: Markus Armbruster <armbru@redhat.com>
>        Reviewed-by: Eric Blake <eblake@redhat.com>
>        Signed-off-by: Jason Wang <jasowang@redhat.com>
> 
> Both issues were regressions.
> 
> Like Thomas, I'm surprised that adding a netdev with a duplicate ID
> changes parameters.  Unintended side effect of a regression.
> 
> I suspect it only ever "worked" between commit 08712fcb85 "net: Track
> netdevs in NetClientState rather than QemuOpt" (v5.0.0) and commit
> 831734cce6 "net: Fix handling of id in netdev_add and netdev_del"
> (v6.0.0).
> 
> Got a reproducer for me so I can double-check?

Alexander?


> >> Jason, what is your take here?
> >
> > I might be wrong, but I agree with Thomas. Adding a netdev with the
> > same ID looks wrong, if it works, it looks like a bug. And I don't
> > think we support changing netdev properties.
> 
> Ability to adjust backend parameters feels like a valid feature request.
> But we shouldn't do it by exploiting a bug's side effect.  The bug may
> have other side effects, possibly bad ones.  "ID is unique" is an
> invariant.  Code may rely on it.  We don't know what happens when we
> violate it.
> 
> [...]


