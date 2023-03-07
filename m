Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B13356AE7DE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 18:04:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZajC-0004rO-Te; Tue, 07 Mar 2023 12:03:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZait-0004aO-2h
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:03:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZaio-0003be-P0
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:03:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678208603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DCgfow+t3H4ZaOyMK6C/8DGLrqK3LFOoXeBF0xOrVGs=;
 b=Ubrq90leBT1CKO9WF5WFHPAkKsV+wpvJJ6/3VBU3KeeIKpzT4QStakq2fJO8wWwi88ALfL
 lVUdVMV/vKm+B3/7yJX7rDW8yqAND84oaWIeOJTFmuz40G2+ZacKE0x1kQl9FadF5Z7urS
 0vKt+bL3V7qXR13Y1584/npgj/bTy7A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-0AnR5DAlOjSspXZgOqDiPg-1; Tue, 07 Mar 2023 12:02:19 -0500
X-MC-Unique: 0AnR5DAlOjSspXZgOqDiPg-1
Received: by mail-wm1-f69.google.com with SMTP id
 x18-20020a1c7c12000000b003e1e7d3cf9fso8509051wmc.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:02:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678208519;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DCgfow+t3H4ZaOyMK6C/8DGLrqK3LFOoXeBF0xOrVGs=;
 b=eKClgA3MdisTnMQK0K3NfwhE0KoFuL/GkceGIloDtykeJgZllbDJEjOv1MESFsUMCc
 OAo3u6cv39sxh9fQXtihYQAlFRaL31kuo+8kqPZswE9hg/XmEATeLZT7NLD+Vhq1kxrQ
 Z/TNw+TEOfku8zM0mNvTvMCAg+JpYZ5IbKLbY0UwgcCGHhMuMuIxZzOimeOhXrWJuBAo
 SwXaySGvrqqKl5zCRyO37UueqFxfpu/v/CaERFHpZ0hStBQLgvpyWirMt0SrwMZbCQvW
 6pFBCMw95a9ZFtTbetdxT6zKCfGX27lPQaPiN5GEGnLexbBPzQRZfDd4AJP9481feeVY
 uebQ==
X-Gm-Message-State: AO0yUKWrdG/ACK72ponbf9C/aQBSMgPRPwGgE75jgpYcPTy/X3sbn0pG
 EpFpbVwY27fdkhel8Wx22ruzmMlW6GAHAbQsFOSsPbF3jOk7Rxq00HdLmWsNASF8FhvR7FYS2Ms
 nYFH6/TSgp7L+WbX3Koi/Ujc=
X-Received: by 2002:adf:df8f:0:b0:2c7:1b3d:1fb9 with SMTP id
 z15-20020adfdf8f000000b002c71b3d1fb9mr9715674wrl.50.1678208519314; 
 Tue, 07 Mar 2023 09:01:59 -0800 (PST)
X-Google-Smtp-Source: AK7set87N3Ar6dR4xj5IagsZlg0vdebK6UB2Q6R8G0MGeHmSpdO9bqa+ZxUCTMeQopWfQvVv1XLG6g==
X-Received: by 2002:adf:df8f:0:b0:2c7:1b3d:1fb9 with SMTP id
 z15-20020adfdf8f000000b002c71b3d1fb9mr9715650wrl.50.1678208518966; 
 Tue, 07 Mar 2023 09:01:58 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 j21-20020a05600c075500b003e0238d9101sm13238011wmn.31.2023.03.07.09.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:01:58 -0800 (PST)
Date: Tue, 7 Mar 2023 12:01:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Alvaro Karsz <alvaro.karsz@solid-run.com>,
 Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH for 8.1] vdpa: accept VIRTIO_NET_F_SPEED_DUPLEX in SVQ
Message-ID: <20230307120103-mutt-send-email-mst@kernel.org>
References: <20230307170018.260557-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230307170018.260557-1-eperezma@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Tue, Mar 07, 2023 at 06:00:18PM +0100, Eugenio Pérez wrote:
> There is no reason to block it as it has nothing to do with the vrings.
> All the support of the feature comes via config space.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> Suggested-by: Alvaro Karsz <alvaro.karsz@solid-run.com>

do we need to version this with machine type btw?

> ---
>  net/vhost-vdpa.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index de5ed8ff22..8b25559320 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -99,7 +99,8 @@ static const uint64_t vdpa_svq_device_features =
>      BIT_ULL(VIRTIO_F_ANY_LAYOUT) |
>      BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR) |
>      BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
> -    BIT_ULL(VIRTIO_NET_F_STANDBY);
> +    BIT_ULL(VIRTIO_NET_F_STANDBY) |
> +    BIT_ULL(VIRTIO_NET_F_SPEED_DUPLEX);
>  
>  #define VHOST_VDPA_NET_CVQ_ASID 1
>  
> -- 
> 2.31.1


