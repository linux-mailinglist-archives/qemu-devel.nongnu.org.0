Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E16469437A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 11:54:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRWRn-0003d7-8C; Mon, 13 Feb 2023 05:52:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pRWRm-0003cn-15
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:52:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pRWRk-0002Qa-KU
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:52:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676285551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ySLCPjrAdl9zD2MAuOCZNIdNroMTdQU6mKIe+T/zLc=;
 b=YOclR9PuBnrbZH90KrM+kE2DnvwFRctrRGiiax5I68OE4AkX4qgpr1MnvJevlaosfFREeZ
 NuNz4qiFX5+LB6bQXteOXGmgNh7POm6+6zrbOVv2PHGiCIMlFuqfdT0Cq+q5ZpV4Eb11oA
 /+6Uc18FHd6yZIa50PWCs0BpVirmdHQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-172-WGF1cehiP1eTiZeMfePt0w-1; Mon, 13 Feb 2023 05:52:29 -0500
X-MC-Unique: WGF1cehiP1eTiZeMfePt0w-1
Received: by mail-ej1-f71.google.com with SMTP id
 wu9-20020a170906eec900b0088e1bbefaeeso7468674ejb.12
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 02:52:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0ySLCPjrAdl9zD2MAuOCZNIdNroMTdQU6mKIe+T/zLc=;
 b=mstNSiUXDpTYYTc8lQCSgDV1kFxGEaIcJqd0q1dNLxB4drP//iYdnc2+KW5OaYSNOK
 iu3CsY4HmdbG0pR4k+sSZ9aHaRlBSRnyykJJXMqpbUvvFXHVE2IaGUyqi0utJsO01A7u
 OmGwr1TAL4RUsMiTA+5z5Ks/TWjSiTReRMxBrKOdcxvPtR7rJ5RHaKRJ5P+bh8vKilRv
 y2xczdWEN6OnJC6I2B8/7jwoTGrpqpt1zihF5OdTzSSWIIww5kHf9zOB5lrJ/lzxS09u
 HTU8P1eM/qw68M83cj8TOU+ptWOtZT4vUWOpeDlqpRkmDrjp5dJS0u0dPitVtpRIdT+8
 ms7A==
X-Gm-Message-State: AO0yUKWHaLGHjwGK09ZTwuWGqDdj34e2Hp4CrJkf78bA9VYrIEGZYWXW
 aBAqYiZSAtHXMBQy2QwPxdBBjEht0AcgOCvjpgeh7oxmxQL/q8T5UC6IVwlZbhUqUm8RVRC3doX
 iPS17Upm0RB4TBpo=
X-Received: by 2002:a50:bb4e:0:b0:4aa:b40d:e0a3 with SMTP id
 y72-20020a50bb4e000000b004aab40de0a3mr25261831ede.34.1676285548850; 
 Mon, 13 Feb 2023 02:52:28 -0800 (PST)
X-Google-Smtp-Source: AK7set9q4gHWIP+AulRIRip9zwgHqs4rejuxDeqyLHLnph081DK7Xuc/6YOhZVKtLNIaFJHUxF/8Ig==
X-Received: by 2002:a50:bb4e:0:b0:4aa:b40d:e0a3 with SMTP id
 y72-20020a50bb4e000000b004aab40de0a3mr25261812ede.34.1676285548572; 
 Mon, 13 Feb 2023 02:52:28 -0800 (PST)
Received: from redhat.com ([2.52.132.212]) by smtp.gmail.com with ESMTPSA id
 cb10-20020a0564020b6a00b004ac54d4da22sm4492168edb.71.2023.02.13.02.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 02:52:28 -0800 (PST)
Date: Mon, 13 Feb 2023 05:52:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Gonglei Arei <arei.gonglei@huawei.com>, Li Qiang <liq3ea@163.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Hu Tao <hutao@cn.fujitsu.com>,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 xiaoqiang zhao <zxq_yx_007@163.com>, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v2 4/9] hw/net: Replace dev->parent_bus by
 qdev_get_parent_bus(dev)
Message-ID: <20230213055218-mutt-send-email-mst@kernel.org>
References: <20230213070423.76428-1-philmd@linaro.org>
 <20230213070423.76428-5-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230213070423.76428-5-philmd@linaro.org>
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

On Mon, Feb 13, 2023 at 08:04:18AM +0100, Philippe Mathieu-Daudé wrote:
> DeviceState::parent_bus is an internal field and should be
> accessed by the qdev_get_parent_bus() helper.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/net/virtio-net.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 3ae909041a..8bc160ab59 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3423,7 +3423,7 @@ static bool failover_replug_primary(VirtIONet *n, DeviceState *dev,
>      if (!pdev->partially_hotplugged) {
>          return true;
>      }
> -    primary_bus = dev->parent_bus;
> +    primary_bus = qdev_get_parent_bus(dev);
>      if (!primary_bus) {
>          error_setg(errp, "virtio_net: couldn't find primary bus");
>          return false;
> -- 
> 2.38.1


