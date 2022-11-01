Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EDC61435A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 03:42:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ophDc-0007Zc-8x; Mon, 31 Oct 2022 22:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ophDa-0007ZI-0t
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 22:41:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ophDY-0001wp-FH
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 22:41:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667270491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DaTHESl6l1Y5CDcyEbRcPCl4blvyoVRF2GV1MjxIKrg=;
 b=CaDzKMghm+lCR2N3C2rO7qkUoCvVghXbeBZWGVtUmZBc2RluQIHpRHU4qeevVZdNCSiWSG
 P2eSxM4IYip34cBm9Vmlvf+7SobWnRUR071a1u+wepoXa88mdPYd+G58skDDCU/l0f8Qqv
 gpSVt/ArIDi8HZfP1aRhiXD//wFk1RM=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-460-84Y1aHJLOHOuBFqvoX1Mlg-1; Mon, 31 Oct 2022 22:41:30 -0400
X-MC-Unique: 84Y1aHJLOHOuBFqvoX1Mlg-1
Received: by mail-oo1-f70.google.com with SMTP id
 a11-20020a4a80cb000000b004805cba57f1so4842608oog.11
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 19:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DaTHESl6l1Y5CDcyEbRcPCl4blvyoVRF2GV1MjxIKrg=;
 b=6VdwTKvbgRaU5fat30EkwlW2MF/gDHakFrMXs3rEBox4/b3V0veeW9Mvdrzz6t3+hS
 e8T4GDbOF16XgaaCjXrMCLdsS8iuhd6WNe4Yw49m9noph2uGOyQMwHYMot2cs/Es5HNa
 pgq2+0j3FQiuT90WQf63RQ+419hTyq9S3d+4Q7cdDQFyqYP4V3AekfV9vItg8NZtlSUa
 d7c77UV7zefJ3/GT4weHvwk5tPGrjAKi3FDEf+q9FLGDhxoiMXPsehMj111oWZdRMTSp
 KLe7+Ggv82dl4YL65M7sS1T+p5pTdhM0DeU3HPT2SgTg/NS6HTbm/75Ts4h8CbTGYWB3
 JNeA==
X-Gm-Message-State: ACrzQf1Kef5/I2gowwO/+4vhBxHYv9TKzXfuJEYez4JJmWypLUX1luLW
 YIIOV0TAaX657saXThA8ZqVvIBZZ/m82af31NxVK8sBhi6aEn5x1szhAdh0jXxHmgVp6HXot/F7
 dKkNqvf1aXT4kywLWPZcINY/w9Tblj8U=
X-Received: by 2002:a05:6808:1483:b0:354:a36e:5b with SMTP id
 e3-20020a056808148300b00354a36e005bmr16510711oiw.35.1667270489888; 
 Mon, 31 Oct 2022 19:41:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Q6WtGJNIaLHY5UQ+bPDkWAut9ZzJDCKTKADbeur1hXQhGFjU7xUN7ScmeoZDgrm15rERHtt6VC9umbSQ7HvA=
X-Received: by 2002:a05:6808:1483:b0:354:a36e:5b with SMTP id
 e3-20020a056808148300b00354a36e005bmr16510707oiw.35.1667270489743; Mon, 31
 Oct 2022 19:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20221028160251.268607-1-eperezma@redhat.com>
In-Reply-To: <20221028160251.268607-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 1 Nov 2022 10:41:18 +0800
Message-ID: <CACGkMEsHccBVEaruA5QKVmSsCsg0agedqrO2K8JEaBSP=Y1-Jg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Endianess and coding style fixes for SVQ event idx
 support
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Oct 29, 2022 at 12:02 AM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
>
> Some fixes that did not get in time for the last net pull request.
>
> Eugenio P=C3=A9rez (4):
>   vhost: Delete useless casting
>   vhost: convert byte order on SVQ used event write
>   vhost: Fix lines over 80 characters
>   vhost: convert byte order on avail_event read

I've queued this for rc1.

Thanks

>
>  hw/virtio/vhost-shadow-virtqueue.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> --
> 2.31.1
>
>


