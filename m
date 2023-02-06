Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA3068CAE6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 00:59:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPBNk-0000GC-Fc; Mon, 06 Feb 2023 18:58:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPBNb-0000Fq-7u
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 18:58:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPBNZ-0001s1-9Y
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 18:58:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675727911;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=1k3R1uZDv9Vwm8PhgAbFY4NxfH0ImyVY1f5SkwvxO18=;
 b=BUfGWouDLVEPS4nGhVtDOani+/QbdFEBPo+lk+ctLXFQwRf0Gs+vgHw5pbDdksIjnl/aGo
 dVci56Lo9FVAmGJdNsxg++6a7WCF6D+42rXmsaReRVoS5Y+u0l5Q31OHnH624SY32XHp8G
 C6LmMjS/IH4zvRgNM2wCPI7oGA0yseQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-463-GffS8GkUPsaGtscF0LhYNg-1; Mon, 06 Feb 2023 18:58:30 -0500
X-MC-Unique: GffS8GkUPsaGtscF0LhYNg-1
Received: by mail-wm1-f69.google.com with SMTP id
 fl9-20020a05600c0b8900b003dfe4bae099so6063352wmb.0
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 15:58:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1k3R1uZDv9Vwm8PhgAbFY4NxfH0ImyVY1f5SkwvxO18=;
 b=FIlc/X2QLXOxtthHt4//65v60l0COes+b0BHUUDvbgV2TmZf4lWTpcdAmIJsOmDj1z
 8aGGWlLU4aOdptgq51bVuBYRgPiAgxRr1og3yBgUVCfSxhGYOnPqZtzL93ysv8jHWW1s
 4mDJiRc2Dp8zo6comt15Se6yDmvHyW+ydmveF8HyFQS9RUFSG7g+sMbPgs1mAZR/bFm5
 xXdFbzYhCgvuokWx53KcImIMdbhiwUHj69kQMYIit0Xj6PD399TbvM3dxDL9kwJIM6zq
 8ZdyfY1COeICBMR6qSHsqzbRyZjkR1tk5GjUts3YNpto9aR9l6dT//zZJw9GSSdL8vbe
 CZuA==
X-Gm-Message-State: AO0yUKWkmf2zscHQi7CbFSXTy+399aBE905wGGG6v+qE9sqEhHRKYkro
 VAIF8KVR/9DyMdkxFSDBL6CxzCt2Ki+YBUF4VmDTQhyQuUmJN8rnrzkrh2QezAkjvJGmvc0nTAK
 Q1FBrWTgJf/4enAI=
X-Received: by 2002:a5d:438f:0:b0:2c3:e959:2697 with SMTP id
 i15-20020a5d438f000000b002c3e9592697mr706911wrq.0.1675727909003; 
 Mon, 06 Feb 2023 15:58:29 -0800 (PST)
X-Google-Smtp-Source: AK7set/ufDDPcqGCZk4bn8SnMzYTiHaIxc05IJUYI8GINR65GJrIzDjWlZqupg38qH8UUHWsKONGXQ==
X-Received: by 2002:a5d:438f:0:b0:2c3:e959:2697 with SMTP id
 i15-20020a5d438f000000b002c3e9592697mr706888wrq.0.1675727908726; 
 Mon, 06 Feb 2023 15:58:28 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 m5-20020a7bcb85000000b003de8a1b06c0sm17612504wmi.7.2023.02.06.15.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 15:58:27 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Hanna Czenczek <hreitz@redhat.com>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  virtio-fs-list <virtio-fs@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,  =?utf-8?Q?Marc-Andr?=
 =?utf-8?Q?=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Eugenio =?utf-8?Q?P=C3=A9rez?=
 <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
 Dave Gilbert <dgilbert@redhat.com>
Subject: Re: vhost-user (virtio-fs) migration: back end state
In-Reply-To: <CAJSP0QUO3i+tLfDE0sdNRePnoaqJ7TL29izmk5sDzRt83Ds8tQ@mail.gmail.com>
 (Stefan Hajnoczi's message of "Mon, 6 Feb 2023 16:16:22 -0500")
References: <fb523956-7a8c-608b-6db1-961686b73e9c@redhat.com>
 <CAJSP0QWnq6av7j6x_n-C2mLSPMYBhMeEthr6ayPN-cmsEB3UnA@mail.gmail.com>
 <87mt5qv76d.fsf@secure.mitica>
 <CAJSP0QUO3i+tLfDE0sdNRePnoaqJ7TL29izmk5sDzRt83Ds8tQ@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 07 Feb 2023 00:58:27 +0100
Message-ID: <87ilgeuz18.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
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

Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Mon, 6 Feb 2023 at 16:02, Juan Quintela <quintela@redhat.com> wrote:
>> The last two bits are on my ToDo list for the near future, but not done.
>>
>> If we ended having lots of so big devices, we are going to have to think
>> about downtimes in the order of dozens of seconds, not subsecond.
>>
>> So, if you are planning doing this in the near future, this is a good
>> time to discuss this.
>
> Can you explain the dirty bitmap requirement you mentioned further, given that:
> 1. vhost-user has dirty memory logging already, so DMA is covered.
> 2. An iterative interface allows the device to keep generating more
> state, so does QEMU really need to know if parts of the previously
> emitted binary blob have become dirty? It might allow QEMU to minimize
> the size of the savevm file, but only if the overwritten data has the
> same size.
>
> Is a dirty bitmap for the device state necessary?

Not for that.  My fault.  I was talking about a dirty bitmap because
that is how it is implemented in vfio.  Notice that qemu don't see that
bitmap.  But the device can enter the iterative stage.

The reason that I ask is if you can enter the iterative stage to send
stuff before the last stage.

If you don't have something similar to that, you need to send that in
one go, and that is going to take really a lot of time.

When we are talking about NVidia GPU's, they have two kinds of state:
- Frame buffer: they can (or at some point would have) a dirty bitmap
  and they can enter the iterative stage.
- They have internal state that is not visible to the user, that state
  is big (around 1GB) and they can't enter the iterative stage, because
  they can't know if the guest, the card, or whoever has changed that.

For vhost device:
- what is the "typical" amount of state.
- if it is more than a few megabytes, is there a way to send parts of it
  before the ending stage?  That is what I asked for a dirty bitmap for
  it, but it can be anything else.  Just that vhost-user keep track of
  what has sent to the other side and then have less state for the last
  stage?
  

Later, Juan.


