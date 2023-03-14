Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 080BB6B8EF1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 10:44:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc1BF-0005Ei-7l; Tue, 14 Mar 2023 05:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pc1BC-0005EB-Bx
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 05:42:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pc1BA-0007lu-Tb
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 05:42:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678786967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c5yBSQUpaGX+gw/cgnVLkUz9VpBzSRXh7KymxCZLqiQ=;
 b=h8lYWTBtg55QZvnO1ZZeCUhB4960ncobFiQW7gp6hatLz11q6M2/3jDA71oDMzhODTXtBY
 zpffg+s3r7YjVtkYQrDHL5fMag2dby47w2FcTTN9EvGU4MVo5S/jn+o/dbIYJ4FDvfPlwc
 w2K42vu7zQ//npzD3xSdR9wtguFkVj8=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-_4-DtHyDPiiEFR8ucQ49ow-1; Tue, 14 Mar 2023 05:42:36 -0400
X-MC-Unique: _4-DtHyDPiiEFR8ucQ49ow-1
Received: by mail-ua1-f71.google.com with SMTP id
 o4-20020ab01c44000000b0074031f8fe21so4702467uaj.18
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 02:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678786956;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c5yBSQUpaGX+gw/cgnVLkUz9VpBzSRXh7KymxCZLqiQ=;
 b=M4lMKMMCS7t151Mkt6pn8n/JW6IaGIntfvMjqQmliZcsreYSRDnwugASo99J3zFQMw
 +PQZGbZz7EJsU4RistLxtKMMBZ9TdQTruyqHSkMKsKuaCRt4p5clxmfQk2tXF7bjMwMS
 OJZTDQqQ/mMLAiffM2bQs1FeAhfdeLYHTqZOsiHIXdPuF6MKdbZv5AHceQ4i9vZE5tvu
 Ut1wizeyJF5DXbHZTtt9n3iRNPRhpAOJyLCeFqAdenGsE6Q5ApSRXn8jm6u8flX9n0qW
 oeRQDjzQ7OSmQVbA64vMgjxy9WYPmo2KZN3TNIytGrl5j/ibyX4YABEF+Ql7kWBkjJE7
 4AxA==
X-Gm-Message-State: AO0yUKWVGRd+JzBUgr/BdFhO5OXRdXjseY4dheUVe+L10OQYT1URKgTj
 rF5bmXSDxPGLY4wVfmZrSfVQd0jpmBkJ9rMnNtrlDypjsCdnwplW9oiq2cqTZ7P1U4h0XHxxshD
 cx20Bu4DVNsz3abahprpABKEXNLXf04c=
X-Received: by 2002:a67:d08c:0:b0:425:a3a9:a6e8 with SMTP id
 s12-20020a67d08c000000b00425a3a9a6e8mr1472231vsi.1.1678786956317; 
 Tue, 14 Mar 2023 02:42:36 -0700 (PDT)
X-Google-Smtp-Source: AK7set9CZF1NfC0Q/sVZc6dhudvX47bO/uEu7JOl0F2zsyCAsO1um5AXcWz4C7w5+wyE1iAKKqppBt3+vrbWOcLreEM=
X-Received: by 2002:a67:d08c:0:b0:425:a3a9:a6e8 with SMTP id
 s12-20020a67d08c000000b00425a3a9a6e8mr1472220vsi.1.1678786956072; Tue, 14 Mar
 2023 02:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230309114430.33684-1-hreitz@redhat.com>
 <88de2e68-61e2-9397-b202-d611247002ba@redhat.com>
 <CABgObfZkSt6-0-vKkUtiWUy1TtHS_kEiYM2wRh+MfjTXmW497A@mail.gmail.com>
 <7ca18cb4-eeb1-4cba-feea-90f28fb9c2fc@redhat.com>
 <3e695f64-13bb-1311-6cd6-09bffc312873@redhat.com>
 <ZAobe/wtsf//YGHJ@redhat.com>
 <a432cb4d-8d7e-8408-15a9-c84414c03196@proxmox.com>
 <ZAs92f/J9qvA6X5B@redhat.com>
 <CABgObfbJ_20fk4H=w0HUBrAtUBbrzn53euqUc-D-s5a3-Xur5w@mail.gmail.com>
 <ZA9QLvv3P7da/Rvq@redhat.com>
In-Reply-To: <ZA9QLvv3P7da/Rvq@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 14 Mar 2023 10:42:24 +0100
Message-ID: <CABgObfbkSJ-dY07QHMtigi5YN7vjqVVKpBZerY0tauQUGgqASQ@mail.gmail.com>
Subject: Re: [PATCH for-8.0] ide: Fix manual in-flight count for TRIM BH
To: Kevin Wolf <kwolf@redhat.com>
Cc: Fiona Ebner <f.ebner@proxmox.com>, Hanna Czenczek <hreitz@redhat.com>,
 qemu-block@nongnu.org, 
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>, 
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

On Mon, Mar 13, 2023 at 5:32=E2=80=AFPM Kevin Wolf <kwolf@redhat.com> wrote=
:
> > So I still think that this bug is a symptom of a problem in the design
> > of request queuing.
> >
> > In fact, shouldn't request queuing was enabled at the _end_ of
> > bdrv_drained_begin (once the BlockBackend has reached a quiescent
> > state on its own terms), rather than at the beginning (which leads to
> > deadlocks like this one)?
>
> 1. I want to have exclusive access to the node. This one wants request
>    queuing from the start to avoid losing time unnecessarily until the
>    guest stops sending new requests.
>
> 2. I want to wait for my requests to complete. This one never wants
>    request queuing. Enabling it at the end of bdrv_drained_begin()
>    wouldn't hurt it (because it has already achieved its goal then), but
>    it's also not necessary for the same reason.

Right, doing it at the end would be needed to avoid the deadlocks. On
the other hand, case 1 can (and I think should) be handled by
.drained_begin, or shortcut through aio_disable_external() for those
devices that use ioeventfd.

Paolo

> So maybe what we could take from this is that request queuing should be
> temporarily disabled while we're in blk_drain*() because these
> interfaces are only meant for case 2. In all other cases, it should
> continue to work as it does now.


