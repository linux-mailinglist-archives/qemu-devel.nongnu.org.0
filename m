Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079A36B498F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 16:14:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paeQr-0002ww-UL; Fri, 10 Mar 2023 10:13:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paeQp-0002ux-GH
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 10:13:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paeQm-0000wP-Uy
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 10:13:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678461195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d10TczU0zNaA1U1g/+JkUyZFKGW5YTNRG4Jx4zZzxxE=;
 b=Mh/vxeU9mVjL21GaXq2+nN5mUCD9p1vZxf98B+h/pghZTVLJ0HKXgppnl7EgjrBXAdpbzn
 NkX50iCCRI+WUbZcNdQ6WKbIASJnwqrBEzfedQgA9kvIiN1En0HtW1ModDViMSFYwbB7/O
 GgAT3SqRsiImHU4WGkTX98zsvZ/iWRE=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-u_DWJgM9MtOZR2TJSb12Qg-1; Fri, 10 Mar 2023 10:13:14 -0500
X-MC-Unique: u_DWJgM9MtOZR2TJSb12Qg-1
Received: by mail-vs1-f72.google.com with SMTP id
 bk20-20020a056102549400b0041f4b340357so1933436vsb.19
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 07:13:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678461193;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d10TczU0zNaA1U1g/+JkUyZFKGW5YTNRG4Jx4zZzxxE=;
 b=jJshQzyqZ2V4fNDdufVlifUueEXJcm6IBgV0xS1K26f834lC+mdOCzAjBQkjhfQWmK
 ATbQx+uVP0Aau/LCu/tY1bSZL455Xn6jVdA2t40YcAh/Y9lZQRs/HBdYTjNQNGiEuDQr
 BS65emU3BOvdcD6UlstPMYw7jZIPQ0DJ6/lSHN0x26WjZUq8Q+iADsPixKImlpLHU9Th
 JVIae5XQ5j7m0XIesJw0djdtc3pW+qva5i4z+K2tyR43f6eyTUTB2D58LsC1TRY1L9lv
 F2iKs56k4NaKLY0wfpLptz9WjIh5ZYLv7cIRn1OC7dSZzP+MDtlOHL8oDW3+L0A+4Pcw
 zBjA==
X-Gm-Message-State: AO0yUKWlr4pKOoBzVK9RRju+294UnaNEXw8cawr9i1s1ce2nij7pFhYK
 deUgjBgPhg416dzrrvS+4BiOSzXE1XXd8L+0iioY9UflU5juXI4AAGy995J4jfh3RngG54ULXrw
 ZMVqRtx7R7H6izHGLEsJCuTwzdfHSMeA=
X-Received: by 2002:a1f:c507:0:b0:401:2297:b2e0 with SMTP id
 v7-20020a1fc507000000b004012297b2e0mr15394121vkf.0.1678461193439; 
 Fri, 10 Mar 2023 07:13:13 -0800 (PST)
X-Google-Smtp-Source: AK7set+qqZgg0Y5H1827+R6xlX5DCcuYQyXFPiwh0gdGpH11Qsn2GntysFIn7fNm5611Rc6xsKNdoQeD2fix78lvqw8=
X-Received: by 2002:a1f:c507:0:b0:401:2297:b2e0 with SMTP id
 v7-20020a1fc507000000b004012297b2e0mr15394111vkf.0.1678461193110; Fri, 10 Mar
 2023 07:13:13 -0800 (PST)
MIME-Version: 1.0
References: <20230309114430.33684-1-hreitz@redhat.com>
 <88de2e68-61e2-9397-b202-d611247002ba@redhat.com>
 <CABgObfZkSt6-0-vKkUtiWUy1TtHS_kEiYM2wRh+MfjTXmW497A@mail.gmail.com>
 <7ca18cb4-eeb1-4cba-feea-90f28fb9c2fc@redhat.com>
 <3e695f64-13bb-1311-6cd6-09bffc312873@redhat.com>
 <ZAobe/wtsf//YGHJ@redhat.com>
 <a432cb4d-8d7e-8408-15a9-c84414c03196@proxmox.com>
 <ZAs92f/J9qvA6X5B@redhat.com>
In-Reply-To: <ZAs92f/J9qvA6X5B@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 10 Mar 2023 16:13:01 +0100
Message-ID: <CABgObfbJ_20fk4H=w0HUBrAtUBbrzn53euqUc-D-s5a3-Xur5w@mail.gmail.com>
Subject: Re: [PATCH for-8.0] ide: Fix manual in-flight count for TRIM BH
To: Kevin Wolf <kwolf@redhat.com>
Cc: Fiona Ebner <f.ebner@proxmox.com>, Hanna Czenczek <hreitz@redhat.com>,
 qemu-block@nongnu.org, 
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>, 
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Mar 10, 2023 at 3:25=E2=80=AFPM Kevin Wolf <kwolf@redhat.com> wrote=
:
> > 1. The TRIM operation should be completed on the IDE level before
> > draining ends.
> > 2. Block layer requests issued after draining has begun are queued.
> >
> > To me, the conclusion seems to be:
> > Issue all block layer requests belonging to the IDE TRIM operation up
> > front.
> >
> > The other alternative I see is to break assumption 2, introduce a way
> > to not queue certain requests while drained, and use it for the
> > recursive requests issued by ide_issue_trim_cb. But not the initial
> > one, if that would defeat the purpose of request queuing. Of course
> > this can't be done if QEMU relies on the assumption in other places
> > already.
>
> I feel like this should be allowed because if anyone has exclusive
> access in this scenario, it's IDE, so it should be able to bypass the
> queuing. Of course, the queuing is still needed if someone else drained
> the backend, so we can't just make TRIM bypass it in general. And if you
> make it conditional on IDE being in blk_drain(), it already starts to
> become ugly again...
>
> So maybe the while loop is unavoidable.
>
> Hmm... But could ide_cancel_dma_sync() just directly use
> AIO_WAIT_WHILE(s->bus->dma->aiocb) instead of using blk_drain()?

While that should work, it would not fix other uses of
bdrv_drain_all(), for example in softmmu/cpus.c. Stopping the device
model relies on those to run *until the device model has finished
submitting requests*.

So I still think that this bug is a symptom of a problem in the design
of request queuing.

In fact, shouldn't request queuing was enabled at the _end_ of
bdrv_drained_begin (once the BlockBackend has reached a quiescent
state on its own terms), rather than at the beginning (which leads to
deadlocks like this one)?

blk->quiesce_counter becomes just a nesting counter for
drained_begin/end, with no uses outside, and blk_wait_while_drained
uses a new counter. Then you have something like this in
blk_root_drained_poll:

    if (blk->dev_ops && blk->dev_ops->drained_poll) {
        busy =3D blk->dev_ops->drained_poll(blk->dev_opaque);
    }
    busy |=3D !!blk->in_flight;
    if (!busy) {
       qatomic_set(&blk->queue_requests, true);
    }
    return busy;

And there's no need to touch IDE at all.

Paolo


