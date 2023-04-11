Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3102B6DE0E5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 18:22:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmGjs-0006ly-Kp; Tue, 11 Apr 2023 12:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=EF9U=AC=zx2c4.com=Jason@kernel.org>)
 id 1pmGjq-0006lb-RJ
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 12:20:58 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=EF9U=AC=zx2c4.com=Jason@kernel.org>)
 id 1pmGjp-0001L5-1d
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 12:20:58 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 477FF62025
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 16:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DBB5C433D2
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 16:20:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="IY2z5NC7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1681230044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IAxftYI0CNigINJXKMAKYXB00rsT6TCRMyTx8yWv1w0=;
 b=IY2z5NC7B1Wo6zfCNXY2wwsJhP10u04HLYu9BUldkzhad6xxaYVpmh8GsFZFVp3pRJGdjO
 VD57HGCdDeLiRcgOH0FeuIugcG/OjSaTbE2be2bhb+NRqAtNQrPsgtdzmDMWMAX4jg9Xo2
 zMZJzIuChjT3JzzEjDW77bE/nyWdlNg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 526944e7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Tue, 11 Apr 2023 16:20:43 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id y17so7828699vsd.9
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 09:20:43 -0700 (PDT)
X-Gm-Message-State: AAQBX9f+rgwY6G6ZAZS3ejVsYPvd1oH9JdeMGh8kUfsFnI34k9uOiydn
 0cV2GNZquTNpia84xoI8wCiYxxfm9gMFJb06+CM=
X-Google-Smtp-Source: AKy350aBTXO6okhOK5aA+dv32TpPAueTpmmUQJ5TutG6JRxbZvATNUsE5D69XA8+VBJDwvrNGq+8OG6JitmgNmgYwbs=
X-Received: by 2002:a05:6102:23e5:b0:42c:5816:416a with SMTP id
 p5-20020a05610223e500b0042c5816416amr5567012vsc.5.1681230042122; Tue, 11 Apr
 2023 09:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230403105245.29499-1-bchalios@amazon.es>
 <b6724d973b276a3252e640cf687cad484fe3fbff.camel@infradead.org>
In-Reply-To: <b6724d973b276a3252e640cf687cad484fe3fbff.camel@infradead.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 11 Apr 2023 18:20:31 +0200
X-Gmail-Original-Message-ID: <CAHmME9ru1tONrB+SV2sXBLBDZey9AuLi1D7R_wzH3y00uUshQg@mail.gmail.com>
Message-ID: <CAHmME9ru1tONrB+SV2sXBLBDZey9AuLi1D7R_wzH3y00uUshQg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Implement entropy leak reporting for virtio-rng
To: Amit Shah <amit@infradead.org>
Cc: Babis Chalios <bchalios@amazon.es>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
 qemu-devel@nongnu.org, 
 sgarzare@redhat.com, graf@amazon.de, xmarcalx@amazon.co.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=EF9U=AC=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

On Tue, Apr 11, 2023 at 6:19=E2=80=AFPM Amit Shah <amit@infradead.org> wrot=
e:
>
> Hey Babis,
>
> On Mon, 2023-04-03 at 12:52 +0200, Babis Chalios wrote:
> > This patchset implements the entropy leak reporting feature proposal [1=
]
> > for virtio-rng devices.
> >
> > Entropy leaking (as defined in the specification proposal) typically
> > happens when we take a snapshot of a VM or while we resume a VM from a
> > snapshot. In these cases, we want to let the guest know so that it can
> > reset state that needs to be uniqueue, for example.
> >
> > This feature is offering functionality similar to what VMGENID does.
> > However, it allows to build mechanisms on the guest side to notify
> > user-space applications, like VMGENID for userspace and additionally fo=
r
> > kernel.
> >
> > The new specification describes two request types that the guest might
> > place in the queues for the device to perform, a fill-on-leak request
> > where the device needs to fill with random bytes a buffer and a
> > copy-on-leak request where the device needs to perform a copy between
> > two guest-provided buffers. We currently trigger the handling of guest
> > requests when saving the VM state and when loading a VM from a snapshot
> > file.
> >
> > This is an RFC, since the corresponding specification changes have not
> > yet been merged. It also aims to allow testing a respective patch-set
> > implementing the feature in the Linux front-end driver[2].
> >
> > However, I would like to ask the community's opinion regarding the
> > handling of the fill-on-leak requests. Essentially, these requests are
> > very similar to the normal virtio-rng entropy requests, with the catch
> > that we should complete these requests before resuming the VM, so that
> > we avoid race-conditions in notifying the guest about entropy leak
> > events. This means that we cannot rely on the RngBackend's API, which i=
s
> > asynchronous. At the moment, I have handled that using getrandom(), but
> > I would like a solution which doesn't work only with (relatively new)
> > Linux hosts. I am inclined to solve that by extending the RngBackend AP=
I
> > with a synchronous call to request for random bytes and I'd like to hea=
r
> > opinion's on this approach.
>
> The patch looks OK - I suggest you add a new sync call that also probes
> for the availability of getrandom().

qemu_guest_getrandom_nofail?

