Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA09D566031
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 02:56:35 +0200 (CEST)
Received: from localhost ([::1]:35990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Wri-000346-L3
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 20:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o8Wpe-0001P2-TB
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 20:54:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o8Wpb-0006yW-1L
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 20:54:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656982461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MYSULrZFydu7Vr8rmPKQ5QytDYvbBEw1Lb/O1eJum9k=;
 b=jNp9DubDhPZUfYvcXHSnpuFkn3UyPtOssjnHzSzdNq3yhONogFEUkMYseOJbwtxSmxbjzC
 qhvLayw/+0SLYmTXYS+54Y+TMyDGfmn9qBohetxxbuZQwaXa3Q8rhwVaIklSw26m3hW00R
 ycMuvFzxdcM7g6yX60I0DAcNXqQWOxE=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-norYPRjlOVm_9nbWZMRTwQ-1; Mon, 04 Jul 2022 20:54:20 -0400
X-MC-Unique: norYPRjlOVm_9nbWZMRTwQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 b40-20020a2ebc28000000b0025c047ea79dso3134387ljf.23
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 17:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MYSULrZFydu7Vr8rmPKQ5QytDYvbBEw1Lb/O1eJum9k=;
 b=JbzUuyFED1h9Gybe7N0rkbRpSjIaJmeD1txb65HQ057lZgLG/tVhmiV/VQySOU4SWX
 5WmJAYKBrJfHNDW1GR2Y//KuSz1oUA3nEQz5fq3WXV/lxL9wxIzRWTvpptvMXlDtfiFD
 BD0x2cHfdWxtwlJhBc++ndXtVYJEQp9eMUBMV5aRW38hP1DsyLGoqsGWDK0Bp6/R4sCc
 sVpm39H3MagB/SX1MfL9lClj/1WzjdQw2dFaUgJUambJnzNe4zWNLt/LkYVk782Rud+w
 RKjF2L6ER8w7QTMF/oCKOLAn6cb2WT9rw24esT6BhWFDP49DnkyM+q7y3UpTya5wU+4Y
 02BQ==
X-Gm-Message-State: AJIora+3O/ryqqLMvbqK4N2qIySDJQzbEj2MBuDkNPSG0JGq02KiwzTb
 l9Vl5vlKaKc45hLTiWgDAPgZfs4vDSG1ekcZ5gmxBNym3kVMR8BFjeXbuuEZYxmgYjgAm15+u96
 ssNcHQmwFj0gkTQF89c8OVuJ6fEg7uBk=
X-Received: by 2002:a2e:aaa5:0:b0:25b:ae57:4ad7 with SMTP id
 bj37-20020a2eaaa5000000b0025bae574ad7mr18519173ljb.323.1656982458950; 
 Mon, 04 Jul 2022 17:54:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tQFW+Qrns4H/MQmyhtIZNz2I3posIyb2Vx0O9zFhJPrd9wOE6zI5A7tkkdV8adyvgUPgg3pUE8FdNykfazUh8=
X-Received: by 2002:a2e:aaa5:0:b0:25b:ae57:4ad7 with SMTP id
 bj37-20020a2eaaa5000000b0025bae574ad7mr18519162ljb.323.1656982458694; Mon, 04
 Jul 2022 17:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220629094026.558-1-dinghui@sangfor.com.cn>
 <9f349685-b935-942b-57ac-ff5499cda210@redhat.com>
 <bf4885f2-9ed5-2c17-0b2e-e3f677a52ed1@sangfor.com.cn>
In-Reply-To: <bf4885f2-9ed5-2c17-0b2e-e3f677a52ed1@sangfor.com.cn>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 5 Jul 2022 08:54:07 +0800
Message-ID: <CACGkMEtV+nETesuFv7VyA2V8Ni73phXFueCX9-GN+uts6H0-ug@mail.gmail.com>
Subject: Re: [PATCH] e1000: set RX descriptor status in a separate operation
To: Ding Hui <dinghui@sangfor.com.cn>
Cc: asm@asm.pp.ru, qemu-devel <qemu-devel@nongnu.org>, zhangjing@sangfor.com.cn,
 lifan38153@sangfor.com.cn, Stefan Hajnoczi <stefanha@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 4, 2022 at 5:05 PM Ding Hui <dinghui@sangfor.com.cn> wrote:
>
> On 2022/7/4 15:10, Jason Wang wrote:
> >
> > =E5=9C=A8 2022/6/29 17:40, Ding Hui =E5=86=99=E9=81=93:
> >> @@ -1013,6 +1013,9 @@ e1000_receive_iov(NetClientState *nc, const
> >> struct iovec *iov, int iovcnt)
> >>               DBGOUT(RX, "Null RX descriptor!!\n");
> >>           }
> >>           pci_dma_write(d, base, &desc, sizeof(desc));
> >> +        desc.status |=3D (vlan_status | E1000_RXD_STAT_DD);
> >> +        pci_dma_write(d, base + offsetof(struct e1000_rx_desc, status=
),
> >> +                      &desc.status, sizeof(desc.status));
> >
> >
> > Good catch, but to be more safe, I wonder if we can simply use
> > stx_le_pci_dma() here?
> >
>
> Do you mean stb_le_pci_dma(d, base + offsetof(struct e1000_rx_desc,
> status), desc.status, MEMTXATTRS_UNSPECIFIED)?
>
> I checked both pci_dma_write() and stb_le_pci_dma(), there is no
> difference between them,

I think the difference is that the stx_xxx() can guarantee the atomicy
when it is allowed by the arch.

> but I'm not sure whether it is proper to mixed
> use address based api and value based api, besides that it's OK to me.
>
> Thanks for reply.

I apply this patch as is.

Thanks

>
> --
> Thanks,
> - Ding Hui
>
>


