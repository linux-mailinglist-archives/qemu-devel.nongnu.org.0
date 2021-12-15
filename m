Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7C74753A6
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 08:27:10 +0100 (CET)
Received: from localhost ([::1]:37494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxOgv-00061Q-6B
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 02:27:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mxOZc-0004E1-FC
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:19:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mxOZa-0002Tb-HU
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:19:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639552773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+DUrpMIK33zGI+v+zx6USjbVyi2aW8dSmiDjblLWRms=;
 b=UXccWMiePk05Tt83GpsUAq+Y05rdYjX3fKPB8IELJ5L3lIl8Dl5b+xo71rIlEahhXSI2lo
 9tpre8mrh/GQnc6UPfm0hZXfY2FXZdwf09KuX3sWc4bmDM9e4IcFo+S3s24craSHUyRwAV
 Hy4p3xfrdwod9jhTaeklt1ExjrZljQY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-bfJQSvh5PIaSCrkob_FPTg-1; Wed, 15 Dec 2021 02:19:32 -0500
X-MC-Unique: bfJQSvh5PIaSCrkob_FPTg-1
Received: by mail-ed1-f72.google.com with SMTP id
 v1-20020aa7cd41000000b003e80973378aso19288199edw.14
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 23:19:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+DUrpMIK33zGI+v+zx6USjbVyi2aW8dSmiDjblLWRms=;
 b=HNmWuIJv6aP6jVGbVLVN4VRrWubz2m8OcOsNvspUlRL6b4MtYDGoreBHrvwJsknvXg
 NRNleVK6WX+1uP3uizccRbiPhiRYw4o+4Ivb/qj+xIb2wrC5kN9DCePNjDRBupv29g04
 mOyWLBXb0ufgyWKWsAw8ktevzV1YaoYAuTunLobSggSaAKIN7lr+Ux6nqfJMeaBXcKxN
 Ny4Hf32TaPwsxy+dLa1S3fAgE2+znjOiJTWcYTRFfMg9acEA45aZKc7d84ZaevKR8GZo
 o9ybIow5gdEgH9L0Fz1/O7Yf/ep0YQBVPIoXJTAzSUmFTGoPLuEhPtpXS3mryFLT1+6i
 ijSw==
X-Gm-Message-State: AOAM530h3m/MEi3spSHoQgTHPKGfhEl08Nt1U8hh1rSN8M8Ecv2n6XkP
 rlCt+E2TV6znnX14LOdNWC4jG3bowqCSBYTS6RqBCUETZ8Iy3fl3/8v5VHVnZ++oAsZroPDVUIz
 JbCdcNlyShIEROQk=
X-Received: by 2002:a05:6402:1a4f:: with SMTP id
 bf15mr13503019edb.260.1639552771326; 
 Tue, 14 Dec 2021 23:19:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZ7RK4Ln2UEdUD3O7ApO/eRtSpcf+F1b7jYkqs/77wQXA3wlh/Qbf4M/fq1S41LlCBBtKXBg==
X-Received: by 2002:a05:6402:1a4f:: with SMTP id
 bf15mr13502998edb.260.1639552771003; 
 Tue, 14 Dec 2021 23:19:31 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207d:b04b:8335:12e0:5819:f7df])
 by smtp.gmail.com with ESMTPSA id gz10sm337494ejc.38.2021.12.14.23.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 23:19:30 -0800 (PST)
Date: Wed, 15 Dec 2021 02:19:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: modify NetdevUserOptions through QMP in QEMU 6 - how?
Message-ID: <20211215021826-mutt-send-email-mst@kernel.org>
References: <CABMV8QOQzLRjm1bMTPz66FXOWaO7kYiZOG1G3ZmLHnznxVv1Yg@mail.gmail.com>
 <007f7313-eeb2-ee6a-ae2e-9341324388c0@redhat.com>
 <20211214094355-mutt-send-email-mst@kernel.org>
 <CACGkMEvNyWxo-p3edf7Gdmv0tU8XLxzZfH4hOgzZZvtvNDH+KQ@mail.gmail.com>
 <f30cf42d-30e9-4529-6531-1ef9d236005a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f30cf42d-30e9-4529-6531-1ef9d236005a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexander Sosedkin <asosedkin@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-discuss@nongnu.org,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 08:03:50AM +0100, Thomas Huth wrote:
> On 15/12/2021 04.31, Jason Wang wrote:
> > On Tue, Dec 14, 2021 at 10:53 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > 
> > > On Mon, Dec 13, 2021 at 09:02:15AM +0100, Thomas Huth wrote:
> > > >   Hi!
> > > > 
> > > > On 10/12/2021 18.02, Alexander Sosedkin wrote:
> > > > > With QEMU 5 I could totally issue a QMP netdev_add
> > > > > with the same ID to adjust the NetdevUserOptions I want,
> > > > > such as restrict or hostfwd. No deleting needed,
> > > > > just a netdev_add with what I want changed as a param.
> > > > 
> > > > I'm a little bit surprised that this worked, since AFAIK there is no code in
> > > > QEMU to *change* the parameters of a running netdev... likely the code added
> > > > a new netdev with the same ID, replacing the old one?
> > > > 
> > > > > With QEMU 6 it started failing, claiming the ID is already used.
> > > > > And if I do netdev_del + netdev_add, I just lose connectivity.
> > > > > What's even stranger, I still see old netdev attached in info network:
> > > > > 
> > > > > > netdev_del {'id': 'net0'}
> > > > > {}
> > > > > > human-monitor-command {'command-line': 'info network'}
> > > > > virtio-net-pci.0:
> > > > > index=0,type=nic,model=virtio-net-pci,macaddr=52:54:00:12:34:56
> > > > >    \ net0: index=0,type=user,net=10.0.2.0,restrict=off
> > > > 
> > > > I think that's "normal" - there used to be problems in the past that the
> > > > devices (virtio-net-pci in this case) did not like the netdevs to be removed
> > > > on the fly. So the netdevs are kept around until you remove the device, too
> > > > (i.e. issue a device_del for the virtio-net-pci device).
> > > > 
> > > > > > netdev_add {'type': 'user', 'id': 'net0', 'restrict': False, 'hostfwd': [{'str': 'tcp:127.0.0.1:58239-:22'}]}
> > > > > {}
> > > > > > human-monitor-command {'command-line': 'info network'}
> > > > > unseal: virtio-net-pci.0:
> > > > > index=0,type=nic,model=virtio-net-pci,macaddr=52:54:00:12:34:56
> > > > >    \ net0: index=0,type=user,net=10.0.2.0,restrict=off
> > > > > net0: index=0,type=user,net=10.0.2.0,restrict=off
> > > > > 
> > > > > What's the correct QMP command sequence to modify NetdevUserOptions?
> > > > 
> > > > AFAIK there is no way to modify running netdevs - you'd have to delete the
> > > > netdev and the device, and then add both again. But I might have missed
> > > > something here, so I CC:-ed some people who might be more familiar with the
> > > > details here.
> > > > 
> > > >   Thomas
> > > > 
> > > > 
> > > > > Please CC me on replies.
> > > 
> > > 
> > > Wow this really goes to show how wide our feature matrix is.
> > > 
> > > Yes it's probably an unintended side effect but yes it
> > > did work it seems, so we really should not just break it
> > > without warning.
> > > 
> > > 
> > > Probably this one:
> > > 
> > > commit 831734cce6494032e9233caff4d8442b3a1e7fef
> > > Author: Markus Armbruster <armbru@redhat.com>
> > > Date:   Wed Nov 25 11:02:20 2020 +0100
> > > 
> > >      net: Fix handling of id in netdev_add and netdev_del
> > > 
> > > 
> > > 
> > > Jason, what is your take here?
> > 
> > I might be wrong, but I agree with Thomas. Adding a netdev with the
> > same ID looks wrong, if it works, it looks like a bug.
> 
> It certainly calls for trouble as soon as you try to delete the netdev again
> - does it delete the first (inactive) instance? Does it delete the second
> active one? Does it delete both? (Otherwise it will leave a dangling
> instance behind) ...
> So if changing netdev parameters on the fly is something that we want, we
> should implement this properly instead indeed, and not via such an
> accidental bug.
> 
>  Thomas


Alexander, could you supply a reporoducer so we can check in which
QEMU versions it worked?
If it worked for a long time, then even if it was a result of a bug
it's an accidental ABI and we should not just break it.

-- 
MST


