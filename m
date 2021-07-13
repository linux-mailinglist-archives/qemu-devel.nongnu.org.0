Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F663C691D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 06:16:22 +0200 (CEST)
Received: from localhost ([::1]:47038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m39qH-0003sI-CK
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 00:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m39oa-0002ON-RM
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 00:14:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m39oY-0007IQ-La
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 00:14:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626149673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6QRmVYZtFPh0orRMZTcFm1YM3cfeTe9wzgsmDxtk+1A=;
 b=ePPPIBY96dbvzoCVObKQZtITbVVYrgTTd79LaXb8uLPJjmhsA2NIWwVsPI0scdqpe6izU5
 zSqWKBbK6qvr9QIyHvhfdO/E85I1B6IZJCXGA/+STlDTWxtrGMzxA2GQxUXSc3XCh6FDas
 hss9ZNQKqedcOQlVNBlbT5FCMVSqaUE=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-qOAA-VsFNq2aWXujWf28gA-1; Tue, 13 Jul 2021 00:14:32 -0400
X-MC-Unique: qOAA-VsFNq2aWXujWf28gA-1
Received: by mail-pf1-f199.google.com with SMTP id
 124-20020a6217820000b02902feebfd791eso14334192pfx.19
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 21:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=6QRmVYZtFPh0orRMZTcFm1YM3cfeTe9wzgsmDxtk+1A=;
 b=eUO9PSIQAPRsMM+li3FVI1aVDQ4zy1dpkaYTk8vUBG0C91hujquyx9jvPTWmTHwB1L
 Pi4xn96mBBOPaG4emymVk6RhaQFXQOIdkH9eM1FDhUuaPkcgQg9bmpcgxvYHAmLQCAVX
 sjL65iuGi8Pmc/c9HbDAEkFqgimbfXwJCUfxZr9rf/SxblIvVO7OtDE+vFESvVsPO6/p
 JoKkLUgr11OW5NyxW88o121/4w9S7KTZTPHj5xTisClZ57/qbNZBAQw250en3GJLX5ik
 73alekxfSsSkHguJX3yXT+C8OtY+Z2Los07Y6cZlPKJvAKXXJEDqdSAQBFPaeYtHzuW4
 zmnw==
X-Gm-Message-State: AOAM531q4/ZBGe6WyQ6d/jmfpJJ79gDP6ZuIlMlaL7pHbAB5C4u4FlBf
 302SdtSX8JP1HsvXWlMFJyZvEEv8C1jBl9QUiA3kLSM6RbmHG+L0YRZbZsoqeiOWXdGry141KVh
 x+q5BmlW0u0vrSmc=
X-Received: by 2002:a17:903:2286:b029:129:cb04:c1d7 with SMTP id
 b6-20020a1709032286b0290129cb04c1d7mr1943150plh.58.1626149671125; 
 Mon, 12 Jul 2021 21:14:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGRK7u4kDj0/t6wdOhtyzizERqlQdn/ZHZ8jHlfiLFvWkiOQfUIiYrJ2xEjBVMKgBrY1JxsQ==
X-Received: by 2002:a17:903:2286:b029:129:cb04:c1d7 with SMTP id
 b6-20020a1709032286b0290129cb04c1d7mr1943119plh.58.1626149670842; 
 Mon, 12 Jul 2021 21:14:30 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id j3sm13128367pfc.10.2021.07.12.21.14.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 21:14:30 -0700 (PDT)
Subject: Re: [PATCH RESEND v2 2/3] msix/hmp: add interface to dump device
 specific info
To: Dongli Zhang <dongli.zhang@oracle.com>, qemu-devel@nongnu.org
References: <20210712235812.19725-1-dongli.zhang@oracle.com>
 <20210712235812.19725-3-dongli.zhang@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d90f764f-ba01-1968-3413-61b4ebbc76fb@redhat.com>
Date: Tue, 13 Jul 2021 12:14:22 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210712235812.19725-3-dongli.zhang@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 joe.jin@oracle.com, dgilbert@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/7/13 ÉÏÎç7:58, Dongli Zhang Ð´µÀ:
> While the previous patch is to dump the MSI-X table, sometimes we may
> need to dump device specific data, e.g., to help match the vector with
> the specific device queue.
>
> This patch is to add the PCI device specific interface to help dump
> those information. Any PCI device class may implement this
> PCIDeviceClass->msix_info interface.
>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Joe Jin <joe.jin@oracle.com>
> Suggested-by: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hmp-commands-info.hx   |  7 ++++---
>   include/hw/pci/pci.h   |  3 +++
>   softmmu/qdev-monitor.c | 11 +++++++++++
>   3 files changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index ce5c550d44..4e831d7ae4 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -223,9 +223,10 @@ ERST
>   
>       {
>           .name       = "msix",
> -        .args_type  = "dev:s",
> -        .params     = "dev",
> -        .help       = "dump MSI-X information",
> +        .args_type  = "info:-d,dev:s",
> +        .params     = "[-d] dev",
> +        .help       = "dump MSI-X information; "
> +                      "(-d: show device specific info)",
>           .cmd        = hmp_info_msix,
>       },
>   
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 6be4e0c460..4620b9e757 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -129,6 +129,8 @@ typedef void PCIMapIORegionFunc(PCIDevice *pci_dev, int region_num,
>                                   pcibus_t addr, pcibus_t size, int type);
>   typedef void PCIUnregisterFunc(PCIDevice *pci_dev);
>   
> +typedef void PCIMSIXInfoFunc(Monitor *mon, PCIDevice *dev, Error **errp);
> +
>   typedef struct PCIIORegion {
>       pcibus_t addr; /* current PCI mapping address. -1 means not mapped */
>   #define PCI_BAR_UNMAPPED (~(pcibus_t)0)
> @@ -224,6 +226,7 @@ struct PCIDeviceClass {
>       PCIUnregisterFunc *exit;
>       PCIConfigReadFunc *config_read;
>       PCIConfigWriteFunc *config_write;
> +    PCIMSIXInfoFunc *msix_info;
>   
>       uint16_t vendor_id;
>       uint16_t device_id;
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 7837a17d0d..7fd3fe0ada 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -1011,7 +1011,9 @@ void hmp_info_msix(Monitor *mon, const QDict *qdict)
>   {
>       const char *name = qdict_get_str(qdict, "dev");
>       DeviceState *dev = find_device_state(name, NULL);
> +    bool info = qdict_get_try_bool(qdict, "info", false);
>       PCIDevice *pci_dev;
> +    PCIDeviceClass *pc;
>       Error *err = NULL;
>   
>       if (!dev) {
> @@ -1027,6 +1029,15 @@ void hmp_info_msix(Monitor *mon, const QDict *qdict)
>       pci_dev = PCI_DEVICE(dev);
>       msix_dump_info(mon, pci_dev, &err);
>   
> +    if (info) {
> +        pc = PCI_DEVICE_GET_CLASS(pci_dev);
> +        if (pc->msix_info) {
> +            pc->msix_info(mon, pci_dev, &err);
> +        } else {
> +            error_setg(&err, "Device specific info not supported");
> +        }
> +    }
> +
>   exit:
>       hmp_handle_error(mon, err);
>   }


