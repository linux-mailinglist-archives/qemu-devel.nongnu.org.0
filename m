Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE85863C8B2
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 20:44:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p06V6-0006zW-D8; Tue, 29 Nov 2022 14:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1p06V3-0006yv-QP
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 14:42:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1p06V2-0006CR-3z
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 14:42:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669750955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+EVzcjdERSGA8DVi6l1GUxKZt2xt+2T3C4TMKGfMpJs=;
 b=CAJjBiiFwkfi79d/pfc9o3M9668yZKAkq0HHoq2nC/kb28PUPq9f2oOjl1Gaoc6MGp1WBE
 qU590WLNkHnj8OFIy8Cu+ksaP7y8ONOTtuFU7wPekZz+XvfZYdCcoUMvgxZGn4aAojeKpI
 uQ0QyffiSgn39ybAoSid1fPDhV3hd+s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-537-5YCGDL0mM2eWGVvrONnqDQ-1; Tue, 29 Nov 2022 14:42:33 -0500
X-MC-Unique: 5YCGDL0mM2eWGVvrONnqDQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 o5-20020a05600c510500b003cfca1a327fso8282831wms.8
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 11:42:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+EVzcjdERSGA8DVi6l1GUxKZt2xt+2T3C4TMKGfMpJs=;
 b=OrS2tG6F+9I+u4Ldc3vZJDojgf8+6Q8Ik3x+cKMhzuVI9DjUQi5RHmxp8nxJJiQZH/
 PQEYvqd3nxzqPo45NdvPmdMvVuMHTgTtGNEEl/ssB2eKft8fMb9tSiWGrmuxfSCPYyKB
 C2b37rtDxBO1v0EUNHAtFOP+cZBvu86LlQEyOO/aAZRyUu4pX7UtZqjwIQlCFmM6iSz/
 mSlxUYwG6Ai+iZQN/7mM3udLaRnfp4ikOKNXriVZFqRRjzCD42vG3uVlbZGC3Zh/9Bsc
 MV9vZfyxxg5Q+oVFRbj4DPPWCX5wqYKWDSzVeIFAPLwAoTAEvfqgOBPyccYGI1gkVH+Q
 aCSA==
X-Gm-Message-State: ANoB5plMcXRfsIVrEUFr5ZEOabLGTdeVgDZsQzWrdytY9fe+3AYdep5m
 4UwiCmexUoab6cV4FAzYWODWl6+k+XxutGjjle9jA+nyjsYCyaPk+k2Caqrt6q2roNr7CkXfVH7
 0mR6O+Abcobk4jOI=
X-Received: by 2002:adf:f650:0:b0:241:f0c6:11bb with SMTP id
 x16-20020adff650000000b00241f0c611bbmr19996455wrp.389.1669750952298; 
 Tue, 29 Nov 2022 11:42:32 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6fnYVyfTlW8xcFhz/0a4vvkn8hpIJQzxGGmi/8WnMRPb/p1Ua2/4wkEMVUB05WMDIEFa80hQ==
X-Received: by 2002:adf:f650:0:b0:241:f0c6:11bb with SMTP id
 x16-20020adff650000000b00241f0c611bbmr19996448wrp.389.1669750952049; 
 Tue, 29 Nov 2022 11:42:32 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05600c474c00b003b435c41103sm4147131wmo.0.2022.11.29.11.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 11:42:31 -0800 (PST)
Date: Tue, 29 Nov 2022 19:42:29 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, marcel.apfelbaum@gmail.com
Subject: Re: [PATCH 12/12] pci: Improve do_pcie_aer_inject_error()'s error
 messages
Message-ID: <Y4ZgpfZ4xRbd1OBy@work-vm>
References: <20221128080202.2570543-1-armbru@redhat.com>
 <20221128080202.2570543-13-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128080202.2570543-13-armbru@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Markus Armbruster (armbru@redhat.com) wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  hw/pci/pci-hmp-cmds.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/pci/pci-hmp-cmds.c b/hw/pci/pci-hmp-cmds.c
> index 0807a206e4..279851bfe6 100644
> --- a/hw/pci/pci-hmp-cmds.c
> +++ b/hw/pci/pci-hmp-cmds.c
> @@ -161,6 +161,7 @@ void pcibus_dev_print(Monitor *mon, DeviceState *dev, int indent)
>  
>  void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict)
>  {
> +    Error *err = NULL;
>      const char *id = qdict_get_str(qdict, "id");
>      const char *error_name;
>      uint32_t error_status;
> @@ -171,25 +172,21 @@ void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict)
>      int ret;
>  
>      ret = pci_qdev_find_device(id, &dev);
> -    if (ret < 0) {
> -        monitor_printf(mon,
> -                       "id or pci device path is invalid or device not "
> -                       "found. %s\n", id);
> -        return;
> +    if (ret == -ENODEV) {
> +        error_setg(&err, "device '%s' not found", id);
> +        goto out;
>      }
> -    if (!pci_is_express(dev)) {
> -        monitor_printf(mon, "the device doesn't support pci express. %s\n",
> -                       id);
> -        return;
> +    if (ret < 0 || !pci_is_express(dev)) {
> +        error_setg(&err, "device '%s' is not a PCIe device", id);
> +        goto out;
>      }
>  
>      error_name = qdict_get_str(qdict, "error_status");
>      if (pcie_aer_parse_error_string(error_name, &error_status, &correctable)) {
>          if (qemu_strtoul(error_name, NULL, 0, &num) < 0
>              || num > UINT32_MAX) {
> -            monitor_printf(mon, "invalid error status value. \"%s\"",
> -                           error_name);
> -            return;
> +            error_setg(&err, "invalid error status value '%s'", error_name);
> +            goto out;
>          }
>          error_status = num;
>          correctable = qdict_get_try_bool(qdict, "correctable", false);
> @@ -223,12 +220,15 @@ void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict)
>  
>      ret = pcie_aer_inject_error(dev, &aer_err);
>      if (ret < 0) {
> -        monitor_printf(mon, "failed to inject error: %s\n",
> -                       strerror(-ret));
> -        return;
> +        error_setg_errno(&err, -ret, "failed to inject error");
> +        goto out;
>      }
>  
> +
>      monitor_printf(mon, "OK id: %s root bus: %s, bus: %x devfn: %x.%x\n",
>                     id, pci_root_bus_path(dev), pci_dev_bus_num(dev),
>                     PCI_SLOT(dev->devfn), PCI_FUNC(dev->devfn));
> +
> +out:
> +    hmp_handle_error(mon, err);
>  }
> -- 
> 2.37.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


