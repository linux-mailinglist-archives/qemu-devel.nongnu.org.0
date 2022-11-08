Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD6B6206DA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 03:40:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osEVy-0007wb-DU; Mon, 07 Nov 2022 21:39:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1osEVv-0007vy-FW
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 21:38:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1osEVu-0005AN-4O
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 21:38:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667875134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VsSNAVtj6WsSAsMIncgaGi9ew26+bRToNlEdfk6EMRs=;
 b=Uc2/fvvMEx7KYA33F+DY9WttpOibt1a41sxhZ8wHwlLFsMZRDVPgSNuVmTDxW2bP+8e7yk
 Ik4sahkDvi0bCnRJ/DXXMan3GQUVlNn3uYEoSpnUuVl+1PiM35bjNfgFSoN/s/AMaKh3WK
 D8HwTVAKc9kQgux4zW7e2QikMcyef3Q=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-384-DgJBu0QNNY21zDCOb3DGIQ-1; Mon, 07 Nov 2022 21:38:53 -0500
X-MC-Unique: DgJBu0QNNY21zDCOb3DGIQ-1
Received: by mail-ot1-f71.google.com with SMTP id
 r17-20020a056830135100b0066c3ca9c6d8so6414165otq.15
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 18:38:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VsSNAVtj6WsSAsMIncgaGi9ew26+bRToNlEdfk6EMRs=;
 b=jyLvznDPTaXU8t2lmcXuZ62OGOQHiSVgH/PR4wYjnXA8uFYEqZ+Kg8HISinZgW47vT
 KcRZzxLWCd/AO9Nwrw7T0EmMvCZGamIKsu0teOnGO7uT/ZHl/uJiqmvunfjueXcrKM53
 ur+MT9pa+MOmnRG+oTTH6I+DJqxJXT/sPnMVRsJcTNlHhp2S6NoMy3EjBXo2vgAEIPQ8
 /Ml97OGU8Nti+SUM1D96TCmsxO2F1919HXvGMmqPSzJdc7Gj2GBLLAyGysungXwbqoBk
 0pgcYyX5VCeznghnCDuoesu/1q6EEHLfIA+5REqGBZ71RBuOHuQbXfJrYvCiOZfUbr28
 ELXg==
X-Gm-Message-State: ACrzQf0YyiQ6MHtQ0XkYBffDhOpZicZ4yyPibKRQZBInqgY12LSzoED6
 jLzW6AjwE/Jw9qLMCf/yK8ASCVsGB9CAr44TVYTzCqbwdc+bEDGKElUsQ9c2Z4saBIh4rQqI2Af
 aJTqEawwXZ3XLu5iJaIRv/FolvV73pw4=
X-Received: by 2002:a05:6830:16c5:b0:66c:6a63:dd4c with SMTP id
 l5-20020a05683016c500b0066c6a63dd4cmr18243650otr.201.1667875132613; 
 Mon, 07 Nov 2022 18:38:52 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7/+x1ABwnLDKBe6ZR84GcoXL/niJI+9amY2OVsGgjZNDqAHb9SPFoVe+00ppPn2+x8G2vkG2UGe73bsJtOaRg=
X-Received: by 2002:a05:6830:16c5:b0:66c:6a63:dd4c with SMTP id
 l5-20020a05683016c500b0066c6a63dd4cmr18243639otr.201.1667875132392; Mon, 07
 Nov 2022 18:38:52 -0800 (PST)
MIME-Version: 1.0
References: <20221108004157.1112-1-longpeng2@huawei.com>
 <20221108004157.1112-5-longpeng2@huawei.com>
In-Reply-To: <20221108004157.1112-5-longpeng2@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 8 Nov 2022 10:38:40 +0800
Message-ID: <CACGkMEvPgjXTuhpCmQWVR4tMKTc0igeMZ7JfxB6fCA==xbuApA@mail.gmail.com>
Subject: Re: [PATCH v8 4/5] vdpa-dev: mark the device as unmigratable
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Cc: stefanha@redhat.com, mst@redhat.com, sgarzare@redhat.com, 
 cohuck@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com, 
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org, 
 xiehong@huawei.com
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Nov 8, 2022 at 8:42 AM Longpeng(Mike) <longpeng2@huawei.com> wrote:
>
> From: Longpeng <longpeng2@huawei.com>
>
> The generic vDPA device doesn't support migration currently, so
> mark it as unmigratable temporarily.
>
> Signed-off-by: Longpeng <longpeng2@huawei.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  hw/virtio/vdpa-dev.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
> index 2885d06cbe..62d83d3423 100644
> --- a/hw/virtio/vdpa-dev.c
> +++ b/hw/virtio/vdpa-dev.c
> @@ -327,6 +327,7 @@ static Property vhost_vdpa_device_properties[] = {
>
>  static const VMStateDescription vmstate_vhost_vdpa_device = {
>      .name = "vhost-vdpa-device",
> +    .unmigratable = 1,
>      .minimum_version_id = 1,
>      .version_id = 1,
>      .fields = (VMStateField[]) {
> --
> 2.23.0
>


