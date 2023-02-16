Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676F4699692
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:03:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSeqe-00061X-IA; Thu, 16 Feb 2023 09:02:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSeqc-00061E-3d
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:02:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSeqa-0003UB-3Q
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:02:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676556170;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=N7ZnZbCCw4rhjUC7oC2HonnDEOD7N/QaAU1ICj/XzMc=;
 b=EXYAXN+2fvdQEfdmNoCWQviTd94FeSKL0RMhDM+ZjP72WGVzy//vFUrvaeUExCoGdkB8fm
 H6GfXvMORMEF7Fu0pPXMv34MS6zBsBaqiHp/GsFPGEBIxa+9TvSu4P7ynimj1AOsXZA+Da
 WlbaM8pyshF8y33UGadKwmhfh+qPPcw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-526-GMppAXMnMmyxn6V59nnE5g-1; Thu, 16 Feb 2023 09:02:49 -0500
X-MC-Unique: GMppAXMnMmyxn6V59nnE5g-1
Received: by mail-wr1-f71.google.com with SMTP id
 w9-20020a5d6089000000b002c5669766a8so253777wrt.4
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 06:02:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N7ZnZbCCw4rhjUC7oC2HonnDEOD7N/QaAU1ICj/XzMc=;
 b=Ut4js6lWUf+QxeJxonvHtI0d+lHi8NXIeypxyi/xeNdcrVlw1XBbwujvFN7QVPGl+J
 pyYk1iEggDWxM6O2kzyJwKwbsOJw/yrttBdK+45CzfdE/QQOGwdtGsywvs8beTd/ZD6c
 yssHkJZOVM5J3Y5ST9MgJREOB6bLSZijGzjEUi73MsMcCQR5r4UMrQeY3RNOwbp6kKN9
 /4/DM5sL5ZR+3WVmEJ0EkNkhlewMx8Rwo2Ai4OJ1vRWz0ekA8R50Gk4PlrmQA4ORFdIF
 HCw4R9tZYtQt4LdOH03kOZjnbWpHANF5NopJHbbYjSZmK7F/+hDHl6sgoYwJZ4vVqYtb
 xoZw==
X-Gm-Message-State: AO0yUKUf8FdOYZH+rED3ETSGa7/W3fc9A73UXcmc2lDTSHODw4Ntq6R/
 H2R/PwbREjrU+M5HcpmKs+K7ROtw2IOCaox+QT3w4J5aDg/haBVZ6Zu/mZpxHJjUF5nhiFd2LHr
 yVpJ07ozz+ZVncNU=
X-Received: by 2002:a05:600c:3107:b0:3df:b5ae:5289 with SMTP id
 g7-20020a05600c310700b003dfb5ae5289mr5339412wmo.8.1676556168010; 
 Thu, 16 Feb 2023 06:02:48 -0800 (PST)
X-Google-Smtp-Source: AK7set8WmX0QXuySFnJ3o8xSC27nHZ/yuHQiy7ADKgvutYMB1YqW2+6W20Vr2kGVmMIxT2ovKY53Xg==
X-Received: by 2002:a05:600c:3107:b0:3df:b5ae:5289 with SMTP id
 g7-20020a05600c310700b003dfb5ae5289mr5339374wmo.8.1676556167708; 
 Thu, 16 Feb 2023 06:02:47 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 1-20020a05600c028100b003e200dc15f5sm1817818wmk.42.2023.02.16.06.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 06:02:47 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,  qemu-devel@nongnu.org,  Paolo
 Bonzini <pbonzini@redhat.com>,  Paul Durrant <paul@xen.org>,  Joao Martins
 <joao.m.martins@oracle.com>,  Ankur Arora <ankur.a.arora@oracle.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Thomas Huth
 <thuth@redhat.com>,  Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr . David
 Alan Gilbert" <dgilbert@redhat.com>,  Claudio Fontana <cfontana@suse.de>,
 Julien Grall <julien@xen.org>,  "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  armbru@redhat.com,
 Stefano Stabellini <sstabellini@kernel.org>,  vikram.garhwal@amd.com
Subject: Re: [RFC PATCH v11bis 00/26] Emulated XenStore and PV backend support
In-Reply-To: <ca90895e752c860d4e7251d52bac6ee572b3874c.camel@infradead.org>
 (David Woodhouse's message of "Thu, 16 Feb 2023 14:51:01 +0100")
References: <20230216094436.2144978-1-dwmw2@infradead.org>
 <87sff5khqo.fsf@secure.mitica>
 <ca90895e752c860d4e7251d52bac6ee572b3874c.camel@infradead.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 16 Feb 2023 15:02:46 +0100
Message-ID: <871qmpk8s9.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

David Woodhouse <dwmw2@infradead.org> wrote:
> --=-jDk4SYxkcOAZoZa6DCVr
> Content-Type: text/plain; charset="UTF-8"
> Content-Transfer-Encoding: quoted-printable
>
> On Thu, 2023-02-16 at 11:49 +0100, Juan Quintela wrote:
>> David Woodhouse <dwmw2@infradead.org> wrote:
>> > The non-RFC patch submisson=C2=B9 is just the basic platform support fo=
> r Xen
>> > on KVM. This RFC series is phase 2, adding an internal XenStore and
>> > hooking up the PV back end drivers to that and the emulated grant table=
> s
>> > and event channels.
>> >=20
>> > With this, we can boot a Xen guest with PV disk, under KVM. Full suppor=
> t
>> > for migration isn't there yet because it's actually missing in the PV
>> > back end drivers in the first place (perhaps because upstream Xen doesn=
> 't
>> > yet have guest transparent live migration support anyway). I'm assuming
>> > that when the first round is merged and we drop the [RFC] from this set=
> ,
>> > that won't be a showstopper for now?
>> >=20
>> > I'd be particularly interested in opinions on the way I implemented
>> > serialization for the XenStore, by creating a GByteArray and then dumpi=
> ng
>> > it with VMSTATE_VARRAY_UINT32_ALLOC().
>>=20
>> And I was wondering why I was CC'd in the whole series O:-)
>>=20
>
> Indeed, Philippe M-D added you to Cc when discussing migrations on the
> first RFC submission back in December, and you've been included ever
> since.
>
>
>> How big is the xenstore?
>> I mean typical size and maximun size.
>>=20
>
> Booting a simple instance with a single disk:
>
> $ scripts/analyze-migration.py -f foo | grep impl_state_size
>         "impl_state_size": "0x00000634",
>
> Theoretical maximum is about 1000 nodes @2KiB, so around 2MiB.
>
>> If it is suficientely small (i.e. in the single unit megabytes), you can
>> send it as a normal device at the end of migration.
>>=20
>
> Right now it's part of the xen_xenstore device. Most of that is fairly
> simple and it's just the impl_state that's slightly different.
>
>
>> If it is bigger, I think that you are going to have to enter Migration
>> iteration stage, and have some kind of dirty bitmap to know what entries
>> are on the target and what not.
>>=20
>
> We have COW and transactions; that isn't an impossibility; I think we
> can avoid that complexity though.

It is relatively small.  I will go with migrating at the end of
migration for now.  Later we can measure if we need to improve
performance there.

Later, Juan.


