Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A013248C2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 03:10:50 +0100 (CET)
Received: from localhost ([::1]:34542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF677-0007lY-A3
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 21:10:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lF66J-0007KD-Bi; Wed, 24 Feb 2021 21:09:59 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:44357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lF66H-0002mI-F7; Wed, 24 Feb 2021 21:09:58 -0500
Received: by mail-ed1-x531.google.com with SMTP id g3so4912904edb.11;
 Wed, 24 Feb 2021 18:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3DaYH/CF0Yu3QovFoRMdTXfSadcp8Zuf+4k4Qt3PMRY=;
 b=pp3QvXP8Dm1YVOAQg5NfrYuKQphu/+beLW/mQ5hINGMAiHCvfjxgXAuhvOtnFaqf16
 UWkWVRr4twVTDIl4Jh9Ynhw+vJVTCv2s3XFkR765uy2G0w/6SubukKd6EXFdSf3ECdxr
 kaPdSQEiwJfPwxdkO18uagTLoEyFV5YlpLA771j9g5yKD/Z9iJ0sSWrAlhqfE3h/S2Hb
 ghCuTVJXsWJYJ7R8tsioac+MH44AdQ2rO1r3LtosJUacGL5rtka2s6VWAot17XWBFpWp
 9NTsByGD3br7O/JHCi9eyVBUNuW0vsG7biMM4MrsAIGea1PzjhScFdT49vfBJqFI7CZq
 ct3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3DaYH/CF0Yu3QovFoRMdTXfSadcp8Zuf+4k4Qt3PMRY=;
 b=Y4FI2PC5NW9wLdk/Sn/dmfj/3VfDrlobUE9H/jxDH84vjKdsLKLf6nizda8PCIbWXG
 IKVweUesvOqOmNfBWpHe9twCAj7UdSJXeqY+plygg7uzwXnUBKCqlTT23Jo+g462Gprb
 aBH3lPX8V2CEQYjPMqk72rCiwltv9XZd95j2k0jNB3GMCRWsmMufuZ6hysbx5WPK6zUz
 4dAXxgak1JrCBWM3aDiqTqlyZHrdlio0G0bKFuXeYs4hNoY2Lc3k5XD9UMB1WvDCeVuW
 XL2SBqBH5xuoXemear7JAQ6iJW8E7TsT3pO+Y+lBcIgup5j2ms7viZpVBhmwqNls/74a
 OX5Q==
X-Gm-Message-State: AOAM533okhxGGetIPIcJv/ZqyV1OyZzAY3oWExtxa8oWX3YalJxPOGsL
 hSTh/r7y6Kh3wGH9bjbE556s7rw6+13FzXD6QoE=
X-Google-Smtp-Source: ABdhPJxVU0zzA/fLpzHvZAi6JxpmSAA+F5ppLDnUCiJNOatGhzwfU03ZEWwPw8A2F4FTIE0J+zEzGvYelq/fSejHpiE=
X-Received: by 2002:a50:ff0d:: with SMTP id a13mr662646edu.321.1614218994986; 
 Wed, 24 Feb 2021 18:09:54 -0800 (PST)
MIME-Version: 1.0
References: <20210219085148.90545-1-akihiko.odaki@gmail.com>
 <YDZ+gVgfvNejLfFQ@stefanha-x1.localdomain>
 <20210224173056.GH11025@merkur.fritz.box>
In-Reply-To: <20210224173056.GH11025@merkur.fritz.box>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Thu, 25 Feb 2021 11:09:44 +0900
Message-ID: <CAMVc7JVi7DAsppMVwoUF-ntqmgXJ8FKV9WQ-kh00if4UL6+69g@mail.gmail.com>
Subject: Re: [PATCH] block/file-posix: Optimize for macOS
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, pkrempa@redhat.com, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B42=E6=9C=8825=E6=97=A5(=E6=9C=A8) 2:31 Kevin Wolf <kwolf@redhat=
.com>:
>
> Am 24.02.2021 um 17:27 hat Stefan Hajnoczi geschrieben:
> > On Fri, Feb 19, 2021 at 05:51:48PM +0900, Akihiko Odaki wrote:
> > > This commit introduces "punch hole" operation and optimizes transfer
> > > block size for macOS.
> > >
> > > This commit introduces two additional members,
> > > discard_granularity and opt_io to BlockSizes type in
> > > include/block/block.h. Also, the members of the type are now
> > > optional. Set -1 to discard_granularity and 0 to other members
> > > for the default values.
> >
> > I remember BlockSizes was added specifically for s390 DASD devices.
> > Normally QEMU does not automatically expose details of the underlying
> > hardware to the guest because it breaks live migration compatibility.
> >
> > If a VM is running on host A where the value happens to be 512 bytes an=
d
> > is migrated to host B where the value happens to be 4KB then:
> >
> > 1. The value reported to the guest by the storage device will change
> >    unexpectedly and the guest software is probably not prepared for thi=
s
> >    to happen.
> >
> > 2. I/O requests that violate the constraint imposed by host B's value
> >    will suddenly start failing and the VM may no longer be operational.
> >
> > I think there was an argument that DASDs are passthrough devices and th=
e
> > user always knows what they are doing, so we can ignore this problem fo=
r
> > DASDs.
> >
> > This reasoning does not apply to POSIX files on macOS hosts, so I think
> > we need to figure out what to do here. The easiest option is not to
> > merge this patch series, but if this feature is important to you then w=
e
> > need to think about how to extend the block size probing to be live
> > migration friendly or to change the QEMU command-line to support this
> > use case without unexpected live migration breakage.
>
> Dave actually made a good point on IRC: Even if we change live migration
> so that it doesn't break when we move to a host where different defaults
> are autodetected (we could do this by including these values in the
> migration stream and letting that override what the user specific on the
> command line), it still means that the guest visible device would change
> after the next reboot.
>
> The same can happen without live migration, either by copying the image
> to a different host, or by changing the hardware of the host.
>
> I'm not sure how critical such changes are now, but I seem to remember
> that in the past, one big reason to avoid them was that Windows guests
> would require reactivation after a few changes.
>
> (Also adding Peter to CC as the libvirt representative who, I suspect,
> might not like the idea of autodetecting by default very much :-))
>
> Kevin

The "copy" concern perhaps also applies to the host device backend,
which already has some auto detections. When the physical backend
device fails, a user may create a live snapshot, "dd" it to another
disk, and resume with the new disk, which can have different block
sizes.

I wonder if it is worthwhile to have an option to disable any kind of
autodetection depending on the host, including those of the host
device backend and maybe of subsystems other than block devices.

Regards,
Akihiko Odaki

