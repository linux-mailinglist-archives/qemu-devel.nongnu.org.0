Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 191706DF4A4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 14:05:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmZD4-0002Qn-24; Wed, 12 Apr 2023 08:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pmZCt-0002Pe-VU
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 08:04:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pmZCr-0006jh-3s
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 08:04:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681301047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S7ehsGFrJslBuUzlY5pohkUOivVdf5YEVUfMlZgplXk=;
 b=G0iTf7E70eRYxG+7xfKD9mDJ0vhyzjFIuvWhfVzrQM0tm7IX3Eg35W7iWXdF3zPza7FeVr
 pO3pY2orvwaUvVdojuHRXeLvsJIPJBwZPgQAq1M6+CLTWPPoAMTryLcGdujBw62+EfWINc
 CrzSV+130sLR6lScFnvsTOjbEV0KRjE=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-cljNlAkwOpCBNoEmfn_EXQ-1; Wed, 12 Apr 2023 08:04:06 -0400
X-MC-Unique: cljNlAkwOpCBNoEmfn_EXQ-1
Received: by mail-ua1-f72.google.com with SMTP id
 f18-20020ab01012000000b00771f96000f5so123830uab.19
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 05:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681301045; x=1683893045;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S7ehsGFrJslBuUzlY5pohkUOivVdf5YEVUfMlZgplXk=;
 b=CEKhMR2tGr7VY2Ex5fTKZjU7e/+nTSyfrMMJMEpAmenfGVqmkAzBB9IcZmKPndr5x0
 iz85Fe/4aMYxTS3ToqoSLQY4neRnCC8cK39aKVcoSYVo7V1i7F0HzChU0L19jDhpvzxY
 h32/qOL1mGgQdgPMLics0uRABGRF1u5C7zY2AuvCFfbtLi2V7B2dEcawq1TDljLMrqX9
 EqUfhSL/HHrpA2b69HOAlUtIUzCXLcJuh1mY2MmI8gH/6azWLp1pL2QKIZJAesCo8uHF
 0tbiekz8UUzCvFnFiqQqKd0KxGqWnkE/Xstvy3rGgRAdqJv+dkiU8YQguamCORhPL5gO
 RQ0Q==
X-Gm-Message-State: AAQBX9dOwi9/yVM2soxE/fWyw8FdGdvUKMz8rbbLujmye5O5KgaAWWFz
 AqQ/MK40lvRhHjujAQbASEfs5ilX6cVU5CAvlkVN0W9U6YWi74KaIp+8A/NUpbcJTdksoktUHde
 dePhyTyM6XbNv0cFHUp59MytH9Fl5zHCYGLSFAAk=
X-Received: by 2002:a67:d20f:0:b0:426:392a:92bc with SMTP id
 y15-20020a67d20f000000b00426392a92bcmr4011490vsi.1.1681301045361; 
 Wed, 12 Apr 2023 05:04:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350bE/3b7WS11mi4y2Cw2RuQ8vgtoDiBVrVuWHoWmUE1YqUT7lVyJi3m9hY6Hz6YZRWzq02iaImc8iLANSf6H57w=
X-Received: by 2002:a67:d20f:0:b0:426:392a:92bc with SMTP id
 y15-20020a67d20f000000b00426392a92bcmr4011471vsi.1.1681301044992; Wed, 12 Apr
 2023 05:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230405161752.194727-1-pbonzini@redhat.com>
 <20230405163109.197876-1-pbonzini@redhat.com>
 <29c84ebf-62e6-e90a-b75e-137cb76195de@redhat.com>
In-Reply-To: <29c84ebf-62e6-e90a-b75e-137cb76195de@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 12 Apr 2023 14:03:52 +0200
Message-ID: <CABgObfa22ZKG-MfrfpQqGpX07q4kUVmi9dk_=4jqHi69c4LQzQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] block-backend: delay application of request queuing
To: Hanna Czenczek <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, Fiona Ebner <f.ebner@proxmox.com>
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

On Wed, Apr 12, 2023 at 1:54=E2=80=AFPM Hanna Czenczek <hreitz@redhat.com> =
wrote:
> On 05.04.23 18:31, Paolo Bonzini wrote:
> > +    if (busy || blk->in_flight) {
> > +        return true;
> > +    }
> > +
> > +    if (qatomic_read(&blk->request_queuing) =3D=3D BLK_QUEUE_READY) {
> > +        qatomic_set(&blk->request_queuing, BLK_QUEUE_QUIESCENT);
> > +    }
> > +    return false;
> >   }
>
> This implicitly relies on nobody increasing blk->in_flight (or
> dev_ops->drained_poll() returning `true` again) while the BB is starting
> to be drained, because if the function were to be called again after it
> has returned `false` once per drained section (not sure if that=E2=80=99s
> possible![1]), then we=E2=80=99d end up in the original situation, with
> in_flight elevated and queuing enabled.

Yes, it does.

> Is that really strictly guaranteed somehow or is it rather a complex
> conglomerate of many cases that in the end happen to work out
> individually?  I mean, I could imagine that running
> BlockDevOps.drained_begin() is supposed to guarantee that, but it can=E2=
=80=99t,
> because only NBD seems to implement it.  The commit message talks about
> IDE being fine (by accident?) because it needs BQL availability to
> submit new requests.  But that=E2=80=99s very complex and I=E2=80=99d rat=
her have a
> strict requirement to guarantee correctness.

It's a conglomerate of three cases each of which is sufficient (BQL,
aio_disable_external, bdrv_drained_begin---plus just not using
blk_inc_in_flight could be a fourth, of course). Of these,
aio_disable_external() is going away in favor of the
.bdrv_drained_begin callback; and blk_inc_in_flight() is used rarely
in the first place so I thought it'd be not too hard to have this
requirement.

> [1] If the blk_root_drained_poll() isn=E2=80=99t called anymore after ret=
urning
> `false`, all will be good, but I assume it will be, because we have a
> quiesce_counter, not a quiesce_bool.  We could kind of emulate this by
> continuing to return `false` after blk_root_drained_poll() has returned
> `false` once, until the quiesce_counter becomes 0.
> We could also have blk_root_drained_poll(), if it sees in_flight > 0 &&
> request_queuing =3D=3D BLK_QUEUE_QUIESCENT, revert request_queuing to
> BLK_QUEUE_READY and resume all queued requests.

The intended long term fix is to remove request queuing and, if a
request is submitted while BLK_QUEUE_QUIESCENT, give an assertion
failure.

But since the hang requires blk_inc_in_flight() in the device, perhaps
in the short term documenting it in blk_inc_in_flight() may be enough?

Paolo


