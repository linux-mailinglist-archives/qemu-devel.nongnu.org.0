Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D45436E7F2A
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 18:08:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppAKN-0008AX-Fd; Wed, 19 Apr 2023 12:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ppAKL-00089b-Jh
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:06:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ppAKI-0008A7-UR
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:06:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681920393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qE9T8fUA7hHcnoVPNi5nGq8ME97WOfVbqc/3DdBKRjk=;
 b=WGd8pj8WJOon501Q6WJ/JlZKh+NxMdpwbBqUnefNLJ0ApyroIsF4xEwWFxgn3nQughufFu
 bDs4k3J95U+rQCN79LygYrW8bLB6GEPIuBUGd437eBvYSzUVEkMtdPrAlb8VkK0g8AwwVt
 L1FhJvy8e0U9ly7cS9y/fJQ6UvkvKqI=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-q_kWkiBgNfqY6GJRlGcS5w-1; Wed, 19 Apr 2023 12:06:31 -0400
X-MC-Unique: q_kWkiBgNfqY6GJRlGcS5w-1
Received: by mail-yb1-f200.google.com with SMTP id
 e6-20020a25e706000000b00b7c653a0a4aso21913345ybh.23
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 09:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681920391; x=1684512391;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qE9T8fUA7hHcnoVPNi5nGq8ME97WOfVbqc/3DdBKRjk=;
 b=hsaoWxF4P+jarWUcotTcvZ/qOiy076cwGhUAoK9nfMlmE4R6k8QhqNKD9syFE+nYNW
 oUWpMtz5WTyu7Ovdt4VPoc2PdZlrE8dQI4PpbeobOY1pENBXuLMWlXMKS3DOgjZI2M2z
 deEIu4h34xMW+BkoZVcFAWKg+KuMSBSXPH2nMRV2ep/J0hi6BJSsN8RuEw1a0cswfMUh
 t3LBiIEK22aVC0CP5bBEYJVGnE7DU596P66KZ7HHLa1sQ5z5wK2Vr+Y3LoS216XWkypi
 PBUvCIcq5x65oGrp3U30d6kgJNnE9E7e699I49CV1XMMK+5k8tWh9ZUVGTvec+5TFB9g
 osLw==
X-Gm-Message-State: AAQBX9fpmry065C4JIy2vZ6korepGhfRlG/vHMGoJWAFhEFXOpySfylz
 DUYYEjSR1uMMp39SqacMGtI0BIBW3npeD7b9aBaRKMUOpUN3/Xi0QtzLzmA9YG/l8jH/iUDKCj3
 P8gpdcEE1E4/4BbnWioEKiAupPKEpezk=
X-Received: by 2002:a81:75c6:0:b0:54f:db74:8529 with SMTP id
 q189-20020a8175c6000000b0054fdb748529mr4485342ywc.20.1681920391236; 
 Wed, 19 Apr 2023 09:06:31 -0700 (PDT)
X-Google-Smtp-Source: AKy350bNVvecPpp+0UtfzRXXoJAfoppfhm6wmz42nErCdiU1arktLRJxTsX/OhPg1EDIdzbFzI3Fo9IvDMLbpcb6L08=
X-Received: by 2002:a81:75c6:0:b0:54f:db74:8529 with SMTP id
 q189-20020a8175c6000000b0054fdb748529mr4485329ywc.20.1681920391049; Wed, 19
 Apr 2023 09:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230414025721.10219-1-ray90514@gmail.com>
 <cover.1681819697.git.ray90514@gmail.com>
In-Reply-To: <cover.1681819697.git.ray90514@gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 19 Apr 2023 18:05:54 +0200
Message-ID: <CAJaqyWcXjRkC=q3_tU548Wrz3y1tatJQNvE0pn_yDx-KEZTabw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/2] vhost-vdpa: cache Virtio states
To: Shao-Chien Chiang <ray90514@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Apr 18, 2023 at 3:22=E2=80=AFPM Shao-Chien Chiang <ray90514@gmail.c=
om> wrote:
>
> Repetitive ioctls makes vdpa devices initialization and startup slow.
> This patch series is to cache Virtio status, features, and config.
> For each latency test, I use vdpa-sim-net as my vdpa device.
>

This one should be version 2.
* Please don't send it as a reply to the previous version, as it
confuses the tooling. I've been there myself :).
* Please include a changelog with the updates between the different
versions of the series, like:
v2: Add latency profiled numbers with virtio_sim_net.

CCing Jason.

Thanks!

> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1579
>
> Shao-Chien Chiang (2):
>   vhost-vdpa: cache device status and features
>   vhost-vdpa: cache device config
>
>  hw/virtio/vhost-vdpa.c         | 60 ++++++++++++++++++++++++++--------
>  include/hw/virtio/vhost-vdpa.h |  4 +++
>  2 files changed, 50 insertions(+), 14 deletions(-)
>
> --
> 2.25.1
>
>


