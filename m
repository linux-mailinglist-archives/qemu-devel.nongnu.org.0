Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F28A86EED92
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 07:34:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prXlS-00072g-K5; Wed, 26 Apr 2023 01:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1prXl4-00072E-Si
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:32:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1prXl2-0006oV-LG
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:32:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682487118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BmscPbGEWUoYLOI+zjhGWLvDj85PzgtYQxvV9mP7bKQ=;
 b=DFE6gZIoaZr0dJr0H3RVaG5L6+nnBdP3q01iw7eT/fKD802OXv+9tCyN++s6J/UKap2luQ
 hhtD1JluKKEmz6Izq1i7cXAYIoMzEle9duOtZPwVCid5jy/l7W/SfYpQH6Q/hlDoPn4yfd
 1q29v8m8LHul3JeNidg3tMyHhXw11FU=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-pl1kk_mdOtqVfwdxN1FELw-1; Wed, 26 Apr 2023 01:31:56 -0400
X-MC-Unique: pl1kk_mdOtqVfwdxN1FELw-1
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-1a685dfa3f2so68232735ad.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 22:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682487116; x=1685079116;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BmscPbGEWUoYLOI+zjhGWLvDj85PzgtYQxvV9mP7bKQ=;
 b=WXx+rkiPfe8JhbcJeD2Ob0iJp+Z07dSndPxpAeSGKXRvReNUvv1Nj2CSIzgrnUSplq
 +Z7Xo565FlNCVbGjssaACgQ2Vi66ajU674XX2Pt0oujQiLXThTkHq7SUThEX+TYsve7Z
 rQlvuCfwbwHDVZ5BhY5fEeAKB02prpPvJ595HwmbQ8YcjyP3m0iaT+cgKljW5b9MvuZN
 STZATbQjKx4UpR9k9UWoOjOchmHvFltpLvJu9w6SPevaYFfjnpXqJskHMeMjLTWSh7IK
 GCpnxJOH6lmrajYJRYN1nHpZxeU4Dtpey/uRCYkpF8G/jT8Rdziw+088QZ+gednD7Mpn
 YLPA==
X-Gm-Message-State: AC+VfDwbZQC12MhdZf3/Et6A2RB+buvTqWSsn2txaM1kSj9G6sWNY/Cx
 zyjLweM5N5ybQ4CEqgO6orr614Oz8IYgPCX5WUWrM596/rv4eSzm2qMdtCFWNrVpy2027bzB07G
 Vg0LoY4mQb++yUWA=
X-Received: by 2002:a17:902:d4cb:b0:1a9:7eea:2626 with SMTP id
 o11-20020a170902d4cb00b001a97eea2626mr9531728plg.10.1682487115802; 
 Tue, 25 Apr 2023 22:31:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6tI1ZHhgi5iuTbs7nF9T2bjuZM3ArWRrFfySr8rCSE0qqpgYR8hfOtcadfozNkDof1BQ3AwQ==
X-Received: by 2002:a17:902:d4cb:b0:1a9:7eea:2626 with SMTP id
 o11-20020a170902d4cb00b001a97eea2626mr9531707plg.10.1682487115506; 
 Tue, 25 Apr 2023 22:31:55 -0700 (PDT)
Received: from [10.72.12.241] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 jw16-20020a170903279000b0019cd1ee1523sm9155827plb.30.2023.04.25.22.31.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 22:31:55 -0700 (PDT)
Message-ID: <f169bd76-c638-edd6-a356-4ce69c19debc@redhat.com>
Date: Wed, 26 Apr 2023 13:31:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 1/4] pci: add handling of Enable bit in ATS Control
 Register
Content-Language: en-US
To: Viktor Prutyanov <viktor@daynix.com>, mst@redhat.com,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com, peterx@redhat.com,
 david@redhat.com
Cc: philmd@linaro.org, qemu-devel@nongnu.org, yan@daynix.com,
 yuri.benditovich@daynix.com
References: <20230424112147.17083-1-viktor@daynix.com>
 <20230424112147.17083-2-viktor@daynix.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20230424112147.17083-2-viktor@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


在 2023/4/24 19:21, Viktor Prutyanov 写道:
> According to PCIe Address Translation Services specification 5.1.3.,
> ATS Control Register has Enable bit to enable/disable ATS.
> Add a new field for a trigger function which is called at the Enable
> bit change, so that PCIe devices can handle ATS enable/disable.
>
> Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
> ---
>   hw/pci/pci.c                |  1 +
>   hw/pci/pcie.c               | 21 +++++++++++++++++++++
>   include/hw/pci/pci_device.h |  3 +++
>   include/hw/pci/pcie.h       |  4 ++++
>   4 files changed, 29 insertions(+)
>
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 208c16f450..79a47d2589 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1550,6 +1550,7 @@ void pci_default_write_config(PCIDevice *d, uint32_t addr, uint32_t val_in, int
>       msi_write_config(d, addr, val_in, l);
>       msix_write_config(d, addr, val_in, l);
>       pcie_sriov_config_write(d, addr, val_in, l);
> +    pcie_ats_config_write(d, addr, val_in, l);
>   }
>   
>   /***********************************************************/
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index 924fdabd15..e0217161e5 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -1057,6 +1057,27 @@ void pcie_ats_init(PCIDevice *dev, uint16_t offset, bool aligned)
>       pci_set_word(dev->wmask + dev->exp.ats_cap + PCI_ATS_CTRL, 0x800f);
>   }
>   
> +void pcie_ats_config_write(PCIDevice *dev, uint32_t address, uint32_t val,
> +                           int len)
> +{
> +    uint32_t off;
> +    uint16_t ats_cap = dev->exp.ats_cap;
> +
> +    if (!ats_cap || address < ats_cap) {
> +        return;
> +    }
> +    off = address - ats_cap;
> +    if (off >= PCI_EXT_CAP_ATS_SIZEOF) {
> +        return;
> +    }
> +
> +    if (range_covers_byte(off, len, PCI_ATS_CTRL + 1)) {


Do we really need +1 here?

The rest looks good.

Thanks


> +        if (dev->ats_ctrl_trigger) {
> +            dev->ats_ctrl_trigger(dev, !!(val & PCI_ATS_CTRL_ENABLE));
> +        }
> +    }
> +}
> +
>   /* ACS (Access Control Services) */
>   void pcie_acs_init(PCIDevice *dev, uint16_t offset)
>   {
> diff --git a/include/hw/pci/pci_device.h b/include/hw/pci/pci_device.h
> index d3dd0f64b2..2bb1d68f3b 100644
> --- a/include/hw/pci/pci_device.h
> +++ b/include/hw/pci/pci_device.h
> @@ -160,6 +160,9 @@ struct PCIDevice {
>       /* ID of standby device in net_failover pair */
>       char *failover_pair_id;
>       uint32_t acpi_index;
> +
> +    /* PCI ATS enable/disable trigger */
> +    void (*ats_ctrl_trigger)(PCIDevice *dev, bool enable);
>   };
>   
>   static inline int pci_intx(PCIDevice *pci_dev)
> diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
> index 798a262a0a..5f2dbd87cf 100644
> --- a/include/hw/pci/pcie.h
> +++ b/include/hw/pci/pcie.h
> @@ -154,4 +154,8 @@ void pcie_cap_slot_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
>                                Error **errp);
>   void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
>                                        DeviceState *dev, Error **errp);
> +
> +void pcie_ats_config_write(PCIDevice *dev, uint32_t address, uint32_t val,
> +                           int len);
> +
>   #endif /* QEMU_PCIE_H */


