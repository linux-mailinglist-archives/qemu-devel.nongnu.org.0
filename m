Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 608F8458881
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 04:57:45 +0100 (CET)
Received: from localhost ([::1]:57774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp0Se-0003uA-Gv
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 22:57:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mp0Rh-0002fx-T9
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 22:56:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mp0Rf-0005Lk-V6
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 22:56:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637553403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tsqVqkZ80Lb9ARDD+6dL9wvgN8291OdJipVR5eUAPow=;
 b=FhV9qo70GDWftL6sQvYOcG62xbiovifQXTJj4J37jtKneq5uf6GwnLet+VAF8u0sWjqUuF
 v0gwzIrxESelu030modll6xP5DoFyuW1RKQjTfbQvMSdKekM+1f6S/NJGQFHGjEDMQQrDG
 jq1ic13wdeW1CM+gWafFjSeJ2XaM9jU=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-qV4cOzdFNoOOOzRRdev2uQ-1; Sun, 21 Nov 2021 22:56:40 -0500
X-MC-Unique: qV4cOzdFNoOOOzRRdev2uQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 y40-20020a0565123f2800b003fded085638so11066868lfa.0
 for <qemu-devel@nongnu.org>; Sun, 21 Nov 2021 19:56:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tsqVqkZ80Lb9ARDD+6dL9wvgN8291OdJipVR5eUAPow=;
 b=iJgXkVeLTqAUf3gAwA/TjXmJccFuLqRoUq2Acki2g6egk0yc6a4cdmTJ9GRcQ2p3bq
 0xldkls5ZCX60EHpiveDPV9yhLrgPa/xFaeW6L5QrJ6JDhm3bzh5AGXTYSWUP3ykPQXu
 NlW5B/VBs4QYFKQrdhf8P+/WU+/yhA8BU0jl7pCi+Uqpjt2FniUjPRteQuSVnVacUqJD
 VXcYNyK0D+RJOwQYyomyrHx2HbjUzLAWhz6FJPCl9GxC/C2cdX4d+gaA6hI9huGg19vw
 Vj1FON+dciE3PUwOCBBxLWEmus5WxdBX2AKf75HEmV+0tlHDLw7FJ9nRhKJGKIRzewY6
 PhYg==
X-Gm-Message-State: AOAM5318VsUPUH2L3Y19755itv7k6ounCn4CaziOJ2UOn9Q4OSiZzFI3
 l08vILWKpbSTxsK6OLoGAHZ7Q3uX2IM+f6xmiDGWCkH1GmoBYpYtXgH5TEh/AP0mNSk1S5haPVh
 eaqcg8po7r5hL0+nX14fbQ5J+OqNQgic=
X-Received: by 2002:a2e:b88d:: with SMTP id r13mr47484916ljp.362.1637553398638; 
 Sun, 21 Nov 2021 19:56:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzE/DRQBaXtt76ObYHTFZfuvOM/piCojy5/at66HtAvMAzUp1PiteaVKpXizA12eClMDunrde8lxtM3dam8uR0=
X-Received: by 2002:a2e:b88d:: with SMTP id r13mr47484847ljp.362.1637553397918; 
 Sun, 21 Nov 2021 19:56:37 -0800 (PST)
MIME-Version: 1.0
References: <20211119102033.36149-1-eperezma@redhat.com>
In-Reply-To: <20211119102033.36149-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 22 Nov 2021 11:56:27 +0800
Message-ID: <CACGkMEsO6faPj+geYWjopTzNQLX8FX6Us7KYST400Xa5=PPuTA@mail.gmail.com>
Subject: Re: [PATCH 0/3] vdpa: Fix SIGSEGV on failed vdpa devices
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 19, 2021 at 6:20 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Qemu falls back on userland handlers even if vhost-user and vhost-vdpa
> cases. These assumes a tap device can handle the packets.
>
> If a vdpa device fail to start, it can trigger a sigsegv because of
> that. Add dummy receivers that return no progress so it can keep
> running.
>
> Tested with a modified version of vp_vdpa to fail negotiation.
>
> This is another bersion of the patch proposed in [1], but the subject
> didn't match the patch anymore.
>
> [1] https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg03719.htm=
l
>

As discussed, we need to consider fixing the gRARP transmission issue
on top, any idea on that?

Thanks

> Eugenio P=C3=A9rez (3):
>   virtio-net: Fix indentation
>   vdpa: Add dummy receive callbacks
>   virtio-net: Fix log message
>
>  hw/net/virtio-net.c | 13 +++++++------
>  net/vhost-vdpa.c    | 16 ++++++++++++++++
>  2 files changed, 23 insertions(+), 6 deletions(-)
>
> --
> 2.27.0
>
>


