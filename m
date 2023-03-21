Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E41C6C2842
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 03:33:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peRnn-00015K-HG; Mon, 20 Mar 2023 22:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1peRnW-00014A-69
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 22:32:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1peRnU-0006xG-QR
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 22:32:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679365944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3RG/b0bCXgzHnja1xdfbqL85250oFIMcBMlyYGxZXi0=;
 b=hgHFL03R+N9s0OuRDz1esR+bviPqg4Q0HoOzm7qdUALk1VLQiuKXxRj5s3pV0vSLoPAWKr
 dAzH3uv41qdYmueMuSknV7DPnYhZyAAN2vcFZFNDDtjgKVpv24Z8H0E2jJ1hD6VoN2BZdm
 FlkBkiqPIKSxLSBPywUDqOypr72FOdg=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-GIoHpk3cMy-CM-cgKPcsMg-1; Mon, 20 Mar 2023 22:32:22 -0400
X-MC-Unique: GIoHpk3cMy-CM-cgKPcsMg-1
Received: by mail-ot1-f69.google.com with SMTP id
 71-20020a9d064d000000b00697e5dc461bso6494718otn.7
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 19:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679365941;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3RG/b0bCXgzHnja1xdfbqL85250oFIMcBMlyYGxZXi0=;
 b=Ow7h8H+L8RHoJmef5qSt1Kh8E/J50RO2MBO+Lzwm4bgmzPH5cGv/E1sGeaHSSP6T5f
 AQ/a70EfjmzylIENXb7N3bEnKO5YuEsMiyP9TwmXfrACV++kHIgIYe0iF3pFFrqqbS7G
 EZgC7GHf0M6A5banKmgtxNuF1zErYlo3tL3FGJfKF94caOVafx8AI6BU+y4T4+6AeAGN
 PKW+My2VPFsxEXJHl7NPKkLbtlb80Am5vSOeK3R43TfxjHiyRUqDnMHEzcfyXIreYD38
 1R0vSOvp10crVFpiOz5tmbUEmlOZ+iHI7ROFzfx7UTXHot6PDiV4A0zoBITzUei9vP7h
 Cr1A==
X-Gm-Message-State: AO0yUKX2Xf3t3zre+kn2lFz0NJ+8CYuqDfPcu3PGdMl0XcDNL0tmcRS6
 Jnbs7HOQBehHp8HtML/7esNEpEmEZh7FeUixUZ6QT/tLegwTxX6FnbiOdkuvrTWFB39dZS/JI1P
 Ej/MVVhUSdqYm17yiCFzgAYSbuqUeOoY=
X-Received: by 2002:a05:6808:616:b0:384:27f0:bd0a with SMTP id
 y22-20020a056808061600b0038427f0bd0amr151691oih.9.1679365941767; 
 Mon, 20 Mar 2023 19:32:21 -0700 (PDT)
X-Google-Smtp-Source: AK7set+oR/UhmBh2Tg1Rdd675rKNu5/qKIahhUQZNYt4bashwZJZEnQU/MQk9sGq8WKK7Ev3Xg/dxIC4UaLuxB6tmcw=
X-Received: by 2002:a05:6808:616:b0:384:27f0:bd0a with SMTP id
 y22-20020a056808061600b0038427f0bd0amr151686oih.9.1679365941518; Mon, 20 Mar
 2023 19:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230320161959.650841-1-lulu@redhat.com>
 <20230320161959.650841-3-lulu@redhat.com>
In-Reply-To: <20230320161959.650841-3-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 21 Mar 2023 10:32:10 +0800
Message-ID: <CACGkMEta6NAz7qgCb+L_=773z0nA36p3cx0HQhYdM4YTkfZ12Q@mail.gmail.com>
Subject: Re: [PATCH v14 2/4] vhost_vdpa: fix the input in
 trace_vhost_vdpa_listener_region_del()
To: Cindy Lu <lulu@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Tue, Mar 21, 2023 at 12:20=E2=80=AFAM Cindy Lu <lulu@redhat.com> wrote:
>
> In trace_vhost_vdpa_listener_region_del, the value for llend
> should change to int128_get64(int128_sub(llend, int128_one()))
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
>  hw/virtio/vhost-vdpa.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index bc6bad23d5..92c2413c76 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -288,7 +288,8 @@ static void vhost_vdpa_listener_region_del(MemoryList=
ener *listener,
>      iova =3D TARGET_PAGE_ALIGN(section->offset_within_address_space);
>      llend =3D vhost_vdpa_section_end(section);
>
> -    trace_vhost_vdpa_listener_region_del(v, iova, int128_get64(llend));
> +    trace_vhost_vdpa_listener_region_del(v, iova,
> +        int128_get64(int128_sub(llend, int128_one())));
>
>      if (int128_ge(int128_make64(iova), llend)) {
>          return;
> --
> 2.34.3
>


