Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0633C68FF
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 06:02:37 +0200 (CEST)
Received: from localhost ([::1]:34398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m39cy-0003St-JG
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 00:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m39bW-0002mr-R7
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 00:01:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m39bQ-0004JA-QQ
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 00:01:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626148855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RszsJ0zJPY5XBUia7slpjXHFNrbSgQQCj4xYP0PjSX8=;
 b=i3mg0xF0LQ19scAXloSfgfxzXwv+3/Sv2NJ/KRDL2cjjh+l7EavPDs6ly3mkBHEofFjalL
 +x0kjlA3uyFf8vZNto37jqDoa1Y/eDVzJGYmMU7Qje+xbu+CV/r3Vo7WKA4llu/t4BdVMs
 YfB536jRBEzvD7AhfskJv2QS4A9y3wM=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-4smJ0bfUNUS7fRjoIhsHjQ-1; Tue, 13 Jul 2021 00:00:53 -0400
X-MC-Unique: 4smJ0bfUNUS7fRjoIhsHjQ-1
Received: by mail-pg1-f200.google.com with SMTP id
 a6-20020a63e4060000b02902272a0052cdso2076013pgi.7
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 21:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=RszsJ0zJPY5XBUia7slpjXHFNrbSgQQCj4xYP0PjSX8=;
 b=KE5o21lIkWE224ypeScl726EiskkWQtvuW2G7MzJM3DP0M8YYTAbHbb8mrpHk3bdYb
 Xaizy/MFU4Ly+NjlSuctLGlYEDw6dDWzqvn6s6VkOo+ImTZhZWbDSaGP6BSHUjM4lXG2
 zFGq+tJMgmD77xkjn2pC00UTAYuDaxQ3qLXttbWVwZXmJYRd1PKHMSLwARtCJdht15RA
 HrlrweBru63JxvHpQ6zM2QOsu9lKH2Gzt25xFmfsNGNcm7n+W1gtUaSJkSfIWCs4eYp5
 u9rJO3PhHm9t/fflahOH9zf60wV/tZVUaNFEZr2yYc1HVNTNvqPCTyvpShsoHdlfW9i7
 /Nlg==
X-Gm-Message-State: AOAM533TyLQ4dvj8ggV5ERdES47fw+413yYso8A1HukaLOc63XsAjzSF
 quR8oG8wZ2oPsjRWj6c3IjGjnJDDSH/7SpaQxtSaXcPHhM+zOLdKMsVEA8nQA0hllYQiFTIWWlB
 gY0Su+m5iY4+wZMI=
X-Received: by 2002:a65:6442:: with SMTP id s2mr2352718pgv.420.1626148852700; 
 Mon, 12 Jul 2021 21:00:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBRAPQGak5wFCUfUyhHg6rbDjP5w0TdMBoZkNaJmN5NThUXQrYCshmsABT3uIG7uJI3RHCuQ==
X-Received: by 2002:a65:6442:: with SMTP id s2mr2352696pgv.420.1626148852420; 
 Mon, 12 Jul 2021 21:00:52 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id n56sm16945133pfv.65.2021.07.12.21.00.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 21:00:51 -0700 (PDT)
Subject: Re: [PATCH RESEND v2 1/3] msix/hmp: add hmp interface to dump MSI-X
 info
To: Dongli Zhang <dongli.zhang@oracle.com>, qemu-devel@nongnu.org
References: <20210712235812.19725-1-dongli.zhang@oracle.com>
 <20210712235812.19725-2-dongli.zhang@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c5bf0e4d-e242-60b6-4150-9b52996e7b51@redhat.com>
Date: Tue, 13 Jul 2021 12:00:43 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210712235812.19725-2-dongli.zhang@oracle.com>
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
> This patch is to add the HMP interface to dump MSI-X table and PBA, in
> order to help diagnose the loss of IRQ issue in VM (e.g., if an MSI-X
> vector is erroneously masked permanently). Here is the example with
> vhost-scsi:
>
> (qemu) info msix /machine/peripheral/vscsi0
> Msg L.Addr Msg U.Addr Msg Data   Vect Ctrl
> 0xfee00000 0x00000000 0x00004041 0x00000000
> 0xfee00000 0x00000000 0x00004051 0x00000000
> 0xfee00000 0x00000000 0x00004061 0x00000000
> 0xfee00000 0x00000000 0x00004071 0x00000000
> 0xfee01000 0x00000000 0x000040b1 0x00000000
> 0xfee02000 0x00000000 0x000040c1 0x00000000
> 0xfee03000 0x00000000 0x000040d1 0x00000000
>
> MSI-X PBA
> 0 0 0 0 0 0 0
>
> Since the number of MSI-X entries is not determined and might be very
> large, it is sometimes inappropriate to dump via QMP.
>
> Therefore, this patch dumps MSI-X information only via HMP, which is
> similar to the implementation of hmp_info_mem().
>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Joe Jin <joe.jin@oracle.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hmp-commands-info.hx   | 13 +++++++++
>   hw/pci/msix.c          | 63 ++++++++++++++++++++++++++++++++++++++++++
>   include/hw/pci/msix.h  |  2 ++
>   include/monitor/hmp.h  |  1 +
>   softmmu/qdev-monitor.c | 25 +++++++++++++++++
>   5 files changed, 104 insertions(+)
>
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index 27206ac049..ce5c550d44 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -221,6 +221,19 @@ SRST
>       Show PCI information.
>   ERST
>   
> +    {
> +        .name       = "msix",
> +        .args_type  = "dev:s",
> +        .params     = "dev",
> +        .help       = "dump MSI-X information",
> +        .cmd        = hmp_info_msix,
> +    },
> +
> +SRST
> +  ``info msix`` *dev*
> +    Dump MSI-X information for device *dev*.
> +ERST
> +
>   #if defined(TARGET_I386) || defined(TARGET_SH4) || defined(TARGET_SPARC) || \
>       defined(TARGET_PPC) || defined(TARGET_XTENSA) || defined(TARGET_M68K)
>       {
> diff --git a/hw/pci/msix.c b/hw/pci/msix.c
> index ae9331cd0b..4b4ec87eee 100644
> --- a/hw/pci/msix.c
> +++ b/hw/pci/msix.c
> @@ -22,6 +22,7 @@
>   #include "sysemu/xen.h"
>   #include "migration/qemu-file-types.h"
>   #include "migration/vmstate.h"
> +#include "monitor/monitor.h"
>   #include "qemu/range.h"
>   #include "qapi/error.h"
>   #include "trace.h"
> @@ -669,3 +670,65 @@ const VMStateDescription vmstate_msix = {
>           VMSTATE_END_OF_LIST()
>       }
>   };
> +
> +static void msix_dump_table(Monitor *mon, PCIDevice *dev)
> +{
> +    int vector;
> +    uint32_t val;
> +    uint8_t *table_entry;
> +
> +    monitor_printf(mon, "Msg L.Addr ");
> +    monitor_printf(mon, "Msg U.Addr ");
> +    monitor_printf(mon, "Msg Data   ");
> +    monitor_printf(mon, "Vect Ctrl\n");
> +
> +    for (vector = 0; vector < dev->msix_entries_nr; vector++) {
> +        table_entry = dev->msix_table + vector * PCI_MSIX_ENTRY_SIZE;
> +
> +        val = pci_get_long(table_entry + PCI_MSIX_ENTRY_LOWER_ADDR);
> +        monitor_printf(mon, "0x%08x ", val);
> +
> +        val = pci_get_long(table_entry + PCI_MSIX_ENTRY_UPPER_ADDR);
> +        monitor_printf(mon, "0x%08x ", val);
> +
> +        val = pci_get_long(table_entry + PCI_MSIX_ENTRY_DATA);
> +        monitor_printf(mon, "0x%08x ", val);
> +
> +        val = pci_get_long(table_entry + PCI_MSIX_ENTRY_VECTOR_CTRL);
> +        monitor_printf(mon, "0x%08x\n", val);
> +    }
> +
> +    monitor_printf(mon, "\n");
> +}
> +
> +static void msix_dump_pba(Monitor *mon, PCIDevice *dev)
> +{
> +    int vector;
> +
> +    monitor_printf(mon, "MSI-X PBA\n");
> +
> +    for (vector = 0; vector < dev->msix_entries_nr; vector++) {
> +        monitor_printf(mon, "%d ", !!msix_is_pending(dev, vector));
> +
> +        if (vector % 16 == 15) {
> +            monitor_printf(mon, "\n");
> +        }
> +    }
> +
> +    if (vector % 16 != 15) {
> +        monitor_printf(mon, "\n");
> +    }
> +
> +    monitor_printf(mon, "\n");
> +}
> +
> +void msix_dump_info(Monitor *mon, PCIDevice *dev, Error **errp)
> +{
> +    if (!msix_present(dev)) {
> +        error_setg(errp, "MSI-X not available");
> +        return;
> +    }
> +
> +    msix_dump_table(mon, dev);
> +    msix_dump_pba(mon, dev);
> +}
> diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
> index 4c4a60c739..10a4500295 100644
> --- a/include/hw/pci/msix.h
> +++ b/include/hw/pci/msix.h
> @@ -47,6 +47,8 @@ int msix_set_vector_notifiers(PCIDevice *dev,
>                                 MSIVectorPollNotifier poll_notifier);
>   void msix_unset_vector_notifiers(PCIDevice *dev);
>   
> +void msix_dump_info(Monitor *mon, PCIDevice *dev, Error **errp);
> +
>   extern const VMStateDescription vmstate_msix;
>   
>   #define VMSTATE_MSIX_TEST(_field, _state, _test) {                   \
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index 3baa1058e2..97c040a3c8 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -36,6 +36,7 @@ void hmp_info_irq(Monitor *mon, const QDict *qdict);
>   void hmp_info_pic(Monitor *mon, const QDict *qdict);
>   void hmp_info_rdma(Monitor *mon, const QDict *qdict);
>   void hmp_info_pci(Monitor *mon, const QDict *qdict);
> +void hmp_info_msix(Monitor *mon, const QDict *qdict);
>   void hmp_info_tpm(Monitor *mon, const QDict *qdict);
>   void hmp_info_iothreads(Monitor *mon, const QDict *qdict);
>   void hmp_quit(Monitor *mon, const QDict *qdict);
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 721dec2d82..7837a17d0d 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -19,6 +19,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "hw/sysbus.h"
> +#include "hw/pci/msix.h"
>   #include "monitor/hmp.h"
>   #include "monitor/monitor.h"
>   #include "monitor/qdev.h"
> @@ -1005,3 +1006,27 @@ bool qmp_command_available(const QmpCommand *cmd, Error **errp)
>       }
>       return true;
>   }
> +
> +void hmp_info_msix(Monitor *mon, const QDict *qdict)
> +{
> +    const char *name = qdict_get_str(qdict, "dev");
> +    DeviceState *dev = find_device_state(name, NULL);
> +    PCIDevice *pci_dev;
> +    Error *err = NULL;
> +
> +    if (!dev) {
> +        error_setg(&err, "Device %s not found", name);
> +        goto exit;
> +    }
> +
> +    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        error_setg(&err, "Not a PCI device");
> +        goto exit;
> +    }
> +
> +    pci_dev = PCI_DEVICE(dev);
> +    msix_dump_info(mon, pci_dev, &err);
> +
> +exit:
> +    hmp_handle_error(mon, err);
> +}


