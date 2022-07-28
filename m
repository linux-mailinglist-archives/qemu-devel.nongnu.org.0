Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 280115838B6
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 08:26:32 +0200 (CEST)
Received: from localhost ([::1]:40250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGwyc-0003HK-U2
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 02:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGwi7-0003Le-OG
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 02:09:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGwi5-0000Dp-SQ
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 02:09:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658988565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iPyOEtTS6jU/WZeHZiIsQ7dz/8iTplsRxF8h90kUVUE=;
 b=Wup+JLQg33HuvC9fcqst1zu9pswyJ8+xEL0caQXPEKtsuOU28wvF8pZY2exI45RPD01WyM
 TPoFulSPwZWLk1BTygqSnT0X9JSRHG64cXhGFyNzuZecnWjlidoAbZzPk3A00qSDImLYB7
 ZiNXuHgpEIBpXKUfjS8NjBljx+81NmM=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-dd0w3pBaM862Hhn0u0I83g-1; Thu, 28 Jul 2022 02:09:22 -0400
X-MC-Unique: dd0w3pBaM862Hhn0u0I83g-1
Received: by mail-pl1-f198.google.com with SMTP id
 n15-20020a170902d2cf00b0016d68b4fcc0so675681plc.8
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 23:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iPyOEtTS6jU/WZeHZiIsQ7dz/8iTplsRxF8h90kUVUE=;
 b=tRo35TGVAn2I+gDf+2yLCLOfPDcCVayUE+oJ6mIJQ2JI+R3ziN60Lbeg3u5dfDENLi
 teesx9ido/m/h6Wz/xUXeFtJ/PgBoXSXhCoYFUcKdZA/EA328RYr6aYyCtiNFi3OA+G7
 xRR49Mmcs+pu2lJUEQRLS7miIFTMTTLtVfnF3CJSegTyS9rjOq2f54qpheyXbKKdilb1
 Tg8w9nLKxvkMD5Rdhk48brNy6CBpaDBri6UkXFkYbbKEICO5JtJxqImIf54rGMR7XYr4
 G4+MWyoQq5U8P6Udnyy0So8Et8oE3sPxI2ufTLJ/kP72YhTnZlkPJbceaWqtIVm5ovjv
 O7eQ==
X-Gm-Message-State: AJIora8t+skMwFhuS9qL4quYb54mUIpbzUVXIHwkF0tZTOToa5V/OQJh
 HyKXLsnLEPdhXy3uDodvgRhl2eg4auDWvNT41NtytChNnmwUQLXOROCyuCwwpzCIbDHo2rnUh2U
 JPaE0nD+KHhVi5ic=
X-Received: by 2002:a17:902:cec8:b0:16d:8eb5:1d4c with SMTP id
 d8-20020a170902cec800b0016d8eb51d4cmr14014112plg.129.1658988561175; 
 Wed, 27 Jul 2022 23:09:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uByWjuZmKIMvC1JzC7YmAlM5P6cH1HbRxOOF/ra+LcLaI1r1tzdc7BJtMxEL+u4WBJg2gdTQ==
X-Received: by 2002:a17:902:cec8:b0:16d:8eb5:1d4c with SMTP id
 d8-20020a170902cec800b0016d8eb51d4cmr14014088plg.129.1658988560930; 
 Wed, 27 Jul 2022 23:09:20 -0700 (PDT)
Received: from [10.72.12.154] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 9-20020a621609000000b005286a4ca9c8sm14891501pfw.211.2022.07.27.23.09.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 23:09:19 -0700 (PDT)
Message-ID: <84d50edc-73f7-dbea-f64b-e340598fa139@redhat.com>
Date: Thu, 28 Jul 2022 14:09:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v3 04/21] hw/virtio: log potentially buggy guest drivers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
 <20220726192150.2435175-5-alex.bennee@linaro.org>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220726192150.2435175-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/7/27 03:21, Alex Bennée 写道:
> If the guest driver attempts to use the UNUSED(30) bit it is
> potentially buggy as 6.3 Legacy Interface: Reserved Feature Bits
> states it "SHOULD NOT be negotiated". For now just log this guest
> error.
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/virtio/virtio.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 5d607aeaa0..97a6307c0f 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2980,6 +2980,13 @@ int virtio_set_features(VirtIODevice *vdev, uint64_t val)
>       if (vdev->status & VIRTIO_CONFIG_S_FEATURES_OK) {
>           return -EINVAL;
>       }
> +
> +    if (val & (1ull << VIRTIO_F_BAD_FEATURE)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: guest driver for %s has enabled UNUSED(30) feature bit!\n",
> +                      __func__, vdev->name);
> +    }
> +
>       ret = virtio_set_features_nocheck(vdev, val);
>       if (virtio_vdev_has_feature(vdev, VIRTIO_RING_F_EVENT_IDX)) {
>           /* VIRTIO_RING_F_EVENT_IDX changes the size of the caches.  */


