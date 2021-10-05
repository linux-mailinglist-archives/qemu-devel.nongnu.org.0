Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C56F4225B6
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 13:50:52 +0200 (CEST)
Received: from localhost ([::1]:34010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXiy9-0002xv-Fb
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 07:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXip4-0005CA-8P
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 07:41:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXip2-000365-Or
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 07:41:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633434084;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TXwwkGgMjylpXN9pMhxDWMzWkSi9fP1askxYcjXc23s=;
 b=a/oVWuyt8OQQQHNUqLLvYF0kNcqXJa5AI+5NPF42Nooz3N3HtjTcYkJJ7+zpEc5siJPwQI
 KrSTk50333qkfRKa386+GRLUVlZWawleRAJtC3Ih+fJdcV1tPm7+a2zv4D929WvInxLmR6
 ohfTu/z5limNc8RIax4CFwqVAKJ40mc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-hiRltyHJOHOkugCQGUqO_Q-1; Tue, 05 Oct 2021 07:41:23 -0400
X-MC-Unique: hiRltyHJOHOkugCQGUqO_Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 w2-20020a5d5442000000b0016061c95fb7so5613165wrv.12
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 04:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=TXwwkGgMjylpXN9pMhxDWMzWkSi9fP1askxYcjXc23s=;
 b=79VD6O5nAHYVrpn+oN2eUSw45WXp/6wb2bT32aL2ttNOmL4aqxPc1b1Nx+jQEhtkbp
 XGa4OdbYYxeo3fT4sPSSjwg2oNUbirfAFUkQVlAH8hv08cW5biMw0TvDAF/1sDy30CYX
 rvcbaAW3G9gpq2Pqu0dcLxILcJ2N7GwdexIs0wpUf2SRENILsPyfmUZzADk5SlXkv7/S
 TV6YzCo12RY/ZPTINuVZytzM+mppdedN2pJ8v8/KFaP4pJMEsK2McRiP5rzh4Yu6GZtm
 ixveQlPrhDbWxcQ2y+6WI+438R03k4xANEBiutWHqm6f3NhJAwM554QtfGdIpADFzKZE
 g5tA==
X-Gm-Message-State: AOAM533SoFWdvzOCTKLngSWjKb6Ym62zUr6YhZfxdBOEgvGGjHetgjDa
 vLwxZ0u3BYbT+YKWifkLBcA/Qv+acmVk287Jm618rqafkY/tLXyy/G+YVHNL/g91iPiesxS1VgR
 ue2cArdTKkF4UACo=
X-Received: by 2002:a5d:60c8:: with SMTP id x8mr21051654wrt.293.1633434082009; 
 Tue, 05 Oct 2021 04:41:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdUZyvE0fpQeyCM2Fh981++EDGFaK/Fh7rL4DDP7jvGLgJAmsoev+zZHCtQ5LWQdA2oiftUQ==
X-Received: by 2002:a5d:60c8:: with SMTP id x8mr21051614wrt.293.1633434081733; 
 Tue, 05 Oct 2021 04:41:21 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id w1sm1586797wmc.19.2021.10.05.04.41.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 04:41:21 -0700 (PDT)
Subject: Re: [PATCH v4 06/11] hw/i386: Move vIOMMU uniqueness check into pc.c
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, imammedo@redhat.com
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-7-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <5caaee59-a39f-163f-6741-413d49392d04@redhat.com>
Date: Tue, 5 Oct 2021 13:41:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211001173358.863017-7-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi jean,

On 10/1/21 7:33 PM, Jean-Philippe Brucker wrote:
> We're about to need this check for a third vIOMMU, virtio-iommu, which
> doesn't inherit X86IOMMUState as it doesn't support IRQ remapping and is
> a virtio device. Move the check into the pre_plug callback to be shared
> by all three vIOMMUs.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/i386/pc.c        | 10 +++++++++-
>  hw/i386/x86-iommu.c |  6 ------
>  2 files changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 557d49c9f8..789ccb6ef4 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1367,6 +1367,13 @@ static void pc_virtio_md_pci_unplug(HotplugHandler *hotplug_dev,
>  static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>                                            DeviceState *dev, Error **errp)
>  {
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE) &&
> +        x86_iommu_get_default()) {
> +        error_setg(errp, "QEMU does not support multiple vIOMMUs "
> +                   "for x86 yet.");
> +        return;
> +    }
> +
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>          pc_memory_pre_plug(hotplug_dev, dev, errp);
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> @@ -1428,7 +1435,8 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_CPU) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
> -        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
> +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI) ||
> +        object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE)) {
>          return HOTPLUG_HANDLER(machine);
>      }
>  
> diff --git a/hw/i386/x86-iommu.c b/hw/i386/x86-iommu.c
> index 86ad03972e..550e551993 100644
> --- a/hw/i386/x86-iommu.c
> +++ b/hw/i386/x86-iommu.c
> @@ -84,12 +84,6 @@ static void x86_iommu_set_default(X86IOMMUState *x86_iommu)
>  {
>      assert(x86_iommu);
>  
> -    if (x86_iommu_default) {
> -        error_report("QEMU does not support multiple vIOMMUs "
> -                     "for x86 yet.");
> -        exit(1);
> -    }
> -
>      x86_iommu_default = x86_iommu;
>  }
>  


