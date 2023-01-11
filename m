Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767336663E7
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 20:45:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFh0T-0002nN-Iu; Wed, 11 Jan 2023 14:43:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pFh0R-0002nF-Ma
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 14:43:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pFh0Q-0005gI-9h
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 14:43:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673466205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8t5FKN4cZwJUZ2tRi9O973C9hqVtseRr72wDS/BVfdU=;
 b=fD9/KGu85oTbyP/JsVLFVrBi2mBNljM43hZ8z7r4y6Nz3epnotLKRMHsrBNdEE9OmjttCG
 2yva5wKcvwhn3k4DT/zORRuHgS85tUqil1JNN0Xjk00tuliNhowodzDUqmsRQSMMFWCPPY
 Kl9F0Ii3tPd1Ve9xlC5fgwiOUgLfHYs=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-386-EsFdaNplMMiEPMeq4i8QMw-1; Wed, 11 Jan 2023 14:43:23 -0500
X-MC-Unique: EsFdaNplMMiEPMeq4i8QMw-1
Received: by mail-il1-f199.google.com with SMTP id
 r6-20020a92cd86000000b00304b2d1c2d7so11643484ilb.11
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 11:43:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8t5FKN4cZwJUZ2tRi9O973C9hqVtseRr72wDS/BVfdU=;
 b=okTx/lfeWpIPsqNfuCysQNrW+7sQAeuKtt1iwE2CCEnlT2xT7E9SqIh4Hm/+VaTCmg
 41i+TAnAekPWeQrQzJ/agd4HLNpC0sOoFw6P+HH91jnjv9jEf+2J+HwT5ioPyCshR1Tp
 v5Ul1Jd59fTGK8qX0sB7tR5zgNK9JZlqtk0LJJ5ZIRVLh5JdvY28xL8Csm6BP5uEhskw
 PNpTX8yCPdOU8S5VrcS3gYhRGr0zpsBSGPrb9atAOjC+M6958keWNTb33rJn566oQs/H
 3FKCzHr3abZkZCVKcyeE9xlv22VU0kVpljjMjqzImUzYGyBuiAYDqfGaF2WjKF662MA/
 ZMDg==
X-Gm-Message-State: AFqh2krYGmWeZUc7gxftywW11x8iWZBm78n0zJPejvDj1Kj8XLvgb5sY
 XMXXzdQgXMd0QBaFWs802vR8hAfptbt3pCMM5DxYbs7oB2yGdq3HW91R2CARVQaOMPHhre5Mg7S
 IsfsxIT/TrvPgrEg=
X-Received: by 2002:a6b:5a11:0:b0:704:5cb9:71f with SMTP id
 o17-20020a6b5a11000000b007045cb9071fmr4827940iob.18.1673466203089; 
 Wed, 11 Jan 2023 11:43:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvrjCrTlZCvsmTfYL4X/7P/KE8AwkSh3fQP50EAn76yESuoGPH6UzxfJiDiVFWuzN8eJMWP0w==
X-Received: by 2002:a6b:5a11:0:b0:704:5cb9:71f with SMTP id
 o17-20020a6b5a11000000b007045cb9071fmr4827923iob.18.1673466202746; 
 Wed, 11 Jan 2023 11:43:22 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 w29-20020a05660205dd00b006df3382b659sm5337264iox.42.2023.01.11.11.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 11:43:22 -0800 (PST)
Date: Wed, 11 Jan 2023 12:43:19 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Marcelo Tosatti
 <mtosatti@redhat.com>, paul@xen.org
Subject: Re: [RFC] Notify IRQ sources of level interrupt ack/EOI
Message-ID: <20230111124319.405bf5ef.alex.williamson@redhat.com>
In-Reply-To: <458b3d6af1ad4e5e44e1eac0b05692805e32a070.camel@infradead.org>
References: <23caafffdd9546b8eeff851660015f3bfc021ed3.camel@infradead.org>
 <20230111112425-mutt-send-email-mst@kernel.org>
 <70eb35a08a7c48993812b7f088fa9ae3f2c8b925.camel@infradead.org>
 <20230111112947.22237481.alex.williamson@redhat.com>
 <458b3d6af1ad4e5e44e1eac0b05692805e32a070.camel@infradead.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
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

On Wed, 11 Jan 2023 19:08:44 +0000
David Woodhouse <dwmw2@infradead.org> wrote:

> On Wed, 2023-01-11 at 11:29 -0700, Alex Williamson wrote:
> >=20
> > Nice.=C2=A0 IIRC, we ended up with the hack solution we have today in v=
fio
> > because there was too much resistance to callbacks that were only
> > necessary for vfio in the past.=C2=A0 Once we had KVM resampling suppor=
t,
> > it simply wasn't worth the effort for a higher latency solution to
> > fight that battle, so we implemented what could best be described as
> > a universal workaround embedded in vfio.
> >=20
> > Clearly a callback is preferable, and yes, that's how we operate with
> > KVM resampling and unmasking INTx, so in theory plumbing this to our
> > existing eoi callback and removing the region toggling ought to do
> > the right thing.=C2=A0 Thanks, =20
>=20
> Well, I'm happy for the Xen support be a second use case which means
> it's no longer "only necessary for VFIO", and keep prodding at it if
> that's going to be useful...

Welcome aboard.  I take it from your cover letter than non-x86
architectures would be on your todo list.  Ideally the ack callback
would simply be a requirement for any implementation of a new interrupt
controller, but that's where we get into striking a balance of device
assignment imposing requirements on arbitrary architectures that may or
may not care, or even support, device assignment.

This is the... dare I say, elegance of the region access hack.  It's
obviously not pretty or performant, but it universally provides an
approximation of the behavior of an emulated device, ie. some form of
guest access to the device is required to de-assert the interrupt.

We probably need some way to detect the interrupt controller support
for the callback mechanism so we can generate an appropriate user
warning to encourage development of that support and fall back to our
current hack for some degree of functionality.  Thanks,

Alex


