Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79D869437C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 11:54:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRWSj-0004I6-CC; Mon, 13 Feb 2023 05:53:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pRWSh-0004Fb-Hp
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:53:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pRWSf-0002gG-6f
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:53:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676285608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yjanpHYGbViO0wfRYuI5cLpsgBOxa3liu/BCd1ceazE=;
 b=UCK42p5Ea3nXwyLqxzPEks8kQXu0JRZX0Yg5N4mqvqQIszzJLuowW2YuQyMvVYQwGsDvRk
 NbB0OtLg+yarewQoTK7QcpBhYL1NtjtUIINWrOMKGjSEnqEyR8gNef9iexicLGJyqQ/k5M
 Hq66gKnMWZ5pIWrLekA86B/qKqLvWvQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-467-WvljnTMBMca2thjdfhtZhA-1; Mon, 13 Feb 2023 05:53:27 -0500
X-MC-Unique: WvljnTMBMca2thjdfhtZhA-1
Received: by mail-ej1-f71.google.com with SMTP id
 lf9-20020a170907174900b0087861282038so7331747ejc.6
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 02:53:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yjanpHYGbViO0wfRYuI5cLpsgBOxa3liu/BCd1ceazE=;
 b=FiI65BlF/rnJiD7IGQ992sa8iSmky6gHh1Oetnovxdz6kGbAWhmSRELzWh42hBWCgv
 jLQbrgpsH5gUIAPPrKh/znUV79hXIyWq4BfB3dpKOtmjbK/xZwM/RuAnaQv21c09kjxg
 F/UNt2JAxwLp9KT3zuODwrAnOLaLehT06xYTBZ66CULt4O020t5M9iB29j3u+6dIt7pP
 Xr3rmMuvHWXrAuInmrvXtHfdvNkHSTigJwxtPpI4X7GBviaEGbQrmLitkVtAEOWa7pBk
 sQ9esFCNlUu0gcDshSeIohkXJ78otoTJ7nJzDC1EOA00zq2GVgqqUz6tno1d9KZNuyKW
 KMjA==
X-Gm-Message-State: AO0yUKVKUsoe8S+WLPy+aQ39kVC0oZ5UwLEV0EgwNa4ZgaBXlEyjTk5+
 JlCl1oqH2njKgyv3i4YKva+R1Y1YRuKmvs6w4ut8ZrGWXSK/iX042HDLD3RCmY136glrFeqFxEE
 f4rLZLu00hW79mzE=
X-Received: by 2002:a17:907:a4c7:b0:8af:1a8c:f148 with SMTP id
 vq7-20020a170907a4c700b008af1a8cf148mr20867558ejc.34.1676285606455; 
 Mon, 13 Feb 2023 02:53:26 -0800 (PST)
X-Google-Smtp-Source: AK7set+bLac/d/o4GfjIsNZfwc6rsk7UjUT2iQxUm2mvlixcBRBnTSSFc4hRYGTvn/bcWH/OHV0woA==
X-Received: by 2002:a17:907:a4c7:b0:8af:1a8c:f148 with SMTP id
 vq7-20020a170907a4c700b008af1a8cf148mr20867544ejc.34.1676285606284; 
 Mon, 13 Feb 2023 02:53:26 -0800 (PST)
Received: from redhat.com ([2.52.132.212]) by smtp.gmail.com with ESMTPSA id
 mj11-20020a170906af8b00b008787134a939sm6689020ejb.18.2023.02.13.02.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 02:53:25 -0800 (PST)
Date: Mon, 13 Feb 2023 05:53:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Gonglei Arei <arei.gonglei@huawei.com>, Li Qiang <liq3ea@163.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Hu Tao <hutao@cn.fujitsu.com>,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 xiaoqiang zhao <zxq_yx_007@163.com>
Subject: Re: [PATCH v2 0/9] hw/qdev: Housekeeping around qdev_get_parent_bus()
Message-ID: <20230213055302-mutt-send-email-mst@kernel.org>
References: <20230213070423.76428-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230213070423.76428-1-philmd@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Mon, Feb 13, 2023 at 08:04:14AM +0100, Philippe Mathieu-Daudé wrote:
> v2: Convert more qdev_get_parent_bus()
> 
> DeviceState::parent_bus is an internal field and should be
> accessed by the qdev_get_parent_bus() helper. Replace most uses.

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

who's merging this?


> Philippe Mathieu-Daudé (9):
>   hw/qdev: Constify DeviceState* argument of qdev_get_parent_bus()
>   hw/audio: Replace dev->parent_bus by qdev_get_parent_bus(dev)
>   hw/block: Replace dev->parent_bus by qdev_get_parent_bus(dev)
>   hw/net: Replace dev->parent_bus by qdev_get_parent_bus(dev)
>   hw/pci: Replace dev->parent_bus by qdev_get_parent_bus(dev)
>   hw/ppc: Replace dev->parent_bus by qdev_get_parent_bus(dev)
>   hw/usb: Replace dev->parent_bus by qdev_get_parent_bus(dev)
>   hw: Use qdev_get_parent_bus() in
>     qdev_get_own_fw_dev_path_from_handler()
>   qdev-monitor: Use qdev_get_parent_bus() in bus_print_dev()
> 
>  hw/audio/intel-hda.c                | 10 +++++-----
>  hw/block/fdc.c                      |  2 +-
>  hw/block/swim.c                     |  2 +-
>  hw/core/qdev-fw.c                   |  9 +++++----
>  hw/core/qdev.c                      |  2 +-
>  hw/ide/qdev.c                       |  6 +++---
>  hw/net/virtio-net.c                 |  2 +-
>  hw/pci-bridge/pci_expander_bridge.c |  2 +-
>  hw/ppc/spapr_vio.c                  |  4 ++--
>  hw/scsi/scsi-bus.c                  | 18 +++++++++---------
>  hw/usb/bus.c                        |  2 +-
>  hw/usb/desc.c                       |  2 +-
>  hw/usb/dev-smartcard-reader.c       | 16 ++++++++--------
>  include/hw/qdev-core.h              |  4 ++--
>  include/hw/scsi/scsi.h              |  2 +-
>  include/hw/usb.h                    |  2 +-
>  softmmu/bootdevice.c                |  2 +-
>  softmmu/qdev-monitor.c              |  6 +++---
>  18 files changed, 47 insertions(+), 46 deletions(-)
> 
> -- 
> 2.38.1
> 
> 
> 


