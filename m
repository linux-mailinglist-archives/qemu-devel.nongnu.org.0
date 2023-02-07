Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6D368DCAB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 16:14:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPPf0-0006z8-Lx; Tue, 07 Feb 2023 10:13:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPPez-0006z0-86
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:13:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPPex-0000CM-HG
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:13:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675782806;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LA1blfgMeNCuZWNDRMVJhtCMOegnhM79b1AmRRpXVfE=;
 b=b7llCjnEbF/fqMRqoCM6OIwSOCwqtFTAdw6Hg80DxBxKcH9kOEnNcznk3sh5CsMC3skESi
 6hiaNof8Fk0+ES7CIpPyl5vJ9Hrp66RM1ORg970Ej0Tt41VB0GjjkMKmHG4u245RR99g71
 gcw6mR74/o/8h5mio+U+2Y3QfhF7Nok=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-497-MC95rPyEP_eVxy--z2QZag-1; Tue, 07 Feb 2023 10:13:25 -0500
X-MC-Unique: MC95rPyEP_eVxy--z2QZag-1
Received: by mail-wr1-f70.google.com with SMTP id
 o9-20020adfa109000000b002bfc062eaa8so2175729wro.20
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 07:13:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LA1blfgMeNCuZWNDRMVJhtCMOegnhM79b1AmRRpXVfE=;
 b=siBSjpLVFUyPTxkUN5ko+mA3eCFR21QpjPMe3vsJTRyoOdW0gEchkDX3PQP7RiOj1I
 JNA25vrMsx0toXEIGWELQohLfbp4uGgH5q0Vn2v9Yn5qeboMTWPE/PuOUY8NWRoYYhvn
 BrcVI4q3Sg1tJI3ZFGMD95WRKPZI3FZEyo7YVy4eUuCmOpfKeW/nVAo8af0LWRS3UdTR
 Pu0s9H8/T89E2n4O6rWKiX+illETcqbJUdN7b/kQtkTOxnbQ+YJsEqyY2T+/vR8qXBVK
 w2eUa5Hm9H5hSacgk7Q5q7j0TcboB/6uAZZWTsJ2RFmqX7KxyxnKVYYDygc7y7cGhvAf
 jHyQ==
X-Gm-Message-State: AO0yUKWvMUHnXjzYeYVpgLZm7elBdRNIkGsF0p4o/auacOk9i9zSANsN
 rGETTgkbvSkWmoP3u+h1tgHffT1XAevsKg3It6NWO0bs9fe/7PCHquOD+OOD34E/vTAvHxtZRhN
 may2SzU8+3IugJiY=
X-Received: by 2002:a5d:4f0e:0:b0:2c3:e87f:e3f0 with SMTP id
 c14-20020a5d4f0e000000b002c3e87fe3f0mr2993650wru.53.1675782803632; 
 Tue, 07 Feb 2023 07:13:23 -0800 (PST)
X-Google-Smtp-Source: AK7set8zRsImEBsLldjf5ZlV7T7vzDshXHiWzPXKRWjyhSb2bqbsgg2oc6wURiDvVGfdi7pJFkg79w==
X-Received: by 2002:a5d:4f0e:0:b0:2c3:e87f:e3f0 with SMTP id
 c14-20020a5d4f0e000000b002c3e87fe3f0mr2993624wru.53.1675782803409; 
 Tue, 07 Feb 2023 07:13:23 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 t1-20020a5d4601000000b002bdfe3aca17sm11433148wrq.51.2023.02.07.07.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 07:13:22 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Hanna Czenczek <hreitz@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  virtio-fs-list <virtio-fs@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,  =?utf-8?Q?Marc-Andr?=
 =?utf-8?Q?=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Eugenio =?utf-8?Q?P=C3=A9rez?=
 <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
 Dave Gilbert <dgilbert@redhat.com>
Subject: Re: vhost-user (virtio-fs) migration: back end state
In-Reply-To: <ec3a9cf9-1e43-f91a-b64d-9bd57b93fc16@redhat.com> (Hanna
 Czenczek's message of "Tue, 7 Feb 2023 10:35:30 +0100")
References: <fb523956-7a8c-608b-6db1-961686b73e9c@redhat.com>
 <CAJSP0QWnq6av7j6x_n-C2mLSPMYBhMeEthr6ayPN-cmsEB3UnA@mail.gmail.com>
 <87mt5qv76d.fsf@secure.mitica>
 <ec3a9cf9-1e43-f91a-b64d-9bd57b93fc16@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 07 Feb 2023 16:13:21 +0100
Message-ID: <87lel9o6em.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hanna Czenczek <hreitz@redhat.com> wrote:
> On 06.02.23 22:02, Juan Quintela wrote:
>> Stefan Hajnoczi <stefanha@gmail.com> wrote:
>>> On Mon, 6 Feb 2023 at 07:36, Hanna Czenczek <hreitz@redhat.com> wrote:
>>>> Hi Stefan,
>>>>
>>>> For true virtio-fs migration, we need to migrate the daemon=E2=80=99s =
(back
>>>> end=E2=80=99s) state somehow.  I=E2=80=99m addressing you because you =
had a talk on this
>>>> topic at KVM Forum 2021. :)
>>>>
>>>> As far as I understood your talk, the only standardized way to migrate=
 a
>>>> vhost-user back end=E2=80=99s state is via dbus-vmstate.  I believe th=
at
>>>> interface is unsuitable for our use case, because we will need to
>>>> migrate more than 1 MB of state.  Now, that 1 MB limit has supposedly
>>>> been chosen arbitrarily, but the introducing commit=E2=80=99s message =
says that
>>>> it=E2=80=99s based on the idea that the data must be supplied basically
>>>> immediately anyway (due to both dbus and qemu migration requirements),
>>>> and I don=E2=80=99t think we can meet that requirement.
>>> Yes, dbus-vmstate is the available today. It's independent of
>>> vhost-user and VIRTIO.
>> Once that we are here:
>> - typical size of your starte (either vhost-user or whatever)
>
> Difficult to say, completely depends on the use case.=C2=A0 When
> identifying files by path and organizing them in a tree structure,
> probably ~48 bytes per indexed file, plus, say, 16 bytes per open
> file.
>
> So for a small shared filesystem, the state can be very small, but
> we=E2=80=99ll also have to prepare for cases where it is in the range of
> several MB.

That is not two bad.  Anything below a few tens megabytes is easy to
manage.  Anything in the hundred of megabytes or more really need thought.

> The main problem isn=E2=80=99t size but that (when identifying files by p=
ath)
> we=E2=80=99ll probably want to construct the paths when migrating, which =
won=E2=80=99t
> be done instantaneously.
>
>> - what are the posibilities that you can enter the iterative stage
>>    negotiation (i.e. that you can create a dirty bitmap about your state)
>
> Very good.=C2=A0 We should know when parts of the state (information about
> a specific indexed or open file) changes.=C2=A0 (Exceptions apply, but th=
ey
> mostly come down to whether indexed files are identified by path or
> file handle, which is a choice the user will probably need to make.=C2=A0
> Either one comes with caveats.)

That is good.

>> How much is migration to file used in practice?
>> I would like to have some information here.
>> It could be necessary probably to be able to encrypt it.  And that is a
>> (different) whole can of worms.
>
> I don=E2=80=99t think virtio-fs state needs to be encrypted any more than=
 any
> other state.=C2=A0 It=E2=80=99ll basically just map FUSE inode IDs to a f=
ile in the
> shared directory, either via path or file handle; and then also track
> open(2) flags for opened files.=C2=A0 (At least that=E2=80=99s what=E2=80=
=99s currently on
> my radar.)=C2=A0 That information should actually be replicated in the
> guest, too (because it too will have mapped the filesystem paths to
> FUSE inode IDs), so isn=E2=80=99t more security relevant than guest memor=
y.

Oh, that was not about virtio-fs at all.

Is because you talked about file migration.

Right now, we need to use exec migration to do this.  but it is clearly
suboptimal.  Basically we just do a normal migration, but that means
that we have a lot of duplicated pages on the destination.

But we can do better.  Just create a file that is as big as the memory,
and write everypage in its own place.  So loading is going to be really
fast.  (yes holes on RAM is a different issue, but we can ignore that
for now).
And the other thing is that we have to really encrypt it somehow, so I
guess that a block cipher should work, but encryption is not my field of
expertise at all.

In vhost-user-fs case, I fully agree with you that if you are
"exporting" part of the local filesystem, encryption don't buy you
anything.

Later, Juan.



