Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EB8339011
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:32:13 +0100 (CET)
Received: from localhost ([::1]:41126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKipo-0004rc-Uh
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:32:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKiF1-0005Tc-Ij
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:54:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKiEy-00038X-5K
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:54:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615557247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2pfpNFt9KtaUvDxDSn2Az9db5Tvx/r6dQKv8zlR4m9I=;
 b=YokbQ69O/T6BzexDFaaIsG4CISut6u9kJ4mUFXfNAAAjSXnifWo/bvAnDhwAJM2E0PimhN
 zpE5xSa0s9V1PizyUgWsdopnM0k20Nkd5RnUqhoj9I5vQ9JeuH7pRlRuRBhE5I61ImMEOx
 YBcTzsevZ27Cml+wf1EZ7GriJ/jMF6Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-WYKvGT7YO2u-S7Np-ZtGug-1; Fri, 12 Mar 2021 08:54:05 -0500
X-MC-Unique: WYKvGT7YO2u-S7Np-ZtGug-1
Received: by mail-wr1-f69.google.com with SMTP id e13so11179630wrg.4
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:54:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2pfpNFt9KtaUvDxDSn2Az9db5Tvx/r6dQKv8zlR4m9I=;
 b=LnkKUWpnfmZMKMp8vH6AiPD0EEh44UQWrkbhi+BVF4WRuyY4l49H/jhGaadBYiwC60
 XvJAOb6p9fUdPWv9evymnNQQHe+TS17lYnGC0adrA9bvQAhlXkqlnflIqajvRYJcpwUf
 acGCSBWuVjqTEv31b8GeaVNqSdT6zR8G5K1P568zRufP6Rv+2hpA3qxcDSqqBwH8IJer
 8DhCHP8TUMUw8U8ckVnWgaOqN1iGJmIaMPV98SUQ84kLmdRIXt4vytai9MwXcqcVoz9d
 NVqh/YblDz6gukzIq58J8fVBG24H/bO4lgSCvBjT4NZyc0Lst0I08NIeGwMqw9vNGh0/
 nlyw==
X-Gm-Message-State: AOAM531OyYHQnxpjgAvOCcEtkSR+ceFf8VLcu4ohk8tpR6wBCHOLmj9r
 cLM6BuD6fa712I20TcDH6iVqVaWeaAbNw1/+gc+jKDLu7SKauZ/TzibiHYgyftIBLtiYgn6gDCg
 U9WAEA6dZeoDtEDw=
X-Received: by 2002:a5d:6a4c:: with SMTP id t12mr13715462wrw.289.1615557244248; 
 Fri, 12 Mar 2021 05:54:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzreTVPDe5f9/8Bs9N3HouPmIRHQp0JXRmamiO5cHt/suVV7YWytA20Qb3n8y/Q1FzarLiZQ==
X-Received: by 2002:a5d:6a4c:: with SMTP id t12mr13715444wrw.289.1615557244130; 
 Fri, 12 Mar 2021 05:54:04 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u2sm8018941wrp.12.2021.03.12.05.54.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 05:54:03 -0800 (PST)
Subject: Re: [PATCH v3] multi-process: Initialize variables declared with
 g_auto*
To: Zenghui Yu <yuzenghui@huawei.com>, elena.ufimtseva@oracle.com,
 jag.raman@oracle.com, john.g.johnson@oracle.com
References: <20210312112143.1369-1-yuzenghui@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7b0ab940-3d92-d39e-5e30-53b07397bbc3@redhat.com>
Date: Fri, 12 Mar 2021 14:54:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312112143.1369-1-yuzenghui@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: berrange@redhat.com, qemu-trivial@nongnu.org, mjt@tls.msk.ru,
 qemu-devel@nongnu.org, laurent@vivier.eu, wanghaibin.wang@huawei.com,
 Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Miroslav

On 3/12/21 12:21 PM, Zenghui Yu wrote:
> Quote docs/devel/style.rst (section "Automatic memory deallocation"):
> 
> * Variables declared with g_auto* MUST always be initialized,
>   otherwise the cleanup function will use uninitialized stack memory
> 
> Initialize @name properly to get rid of the compilation error (using
> gcc-7.3.0 on CentOS):
> 
> ../hw/remote/proxy.c: In function 'pci_proxy_dev_realize':
> /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: 'name' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>    g_free (*pp);
>    ^~~~~~~~~~~~
> ../hw/remote/proxy.c:350:30: note: 'name' was declared here
>              g_autofree char *name;
>                               ^~~~
> 
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> Reviewed-by: Jagannathan Raman <jag.raman@oracle.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> * From v2:
>   - Add OS distro and compiler version into commit message
>   - Add Philippe's R-b
>   - Cc: qemu-trivial@nongnu.org
> 
>  hw/remote/memory.c | 5 ++---
>  hw/remote/proxy.c  | 3 +--
>  2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/remote/memory.c b/hw/remote/memory.c
> index 32085b1e05..d97947d4b8 100644
> --- a/hw/remote/memory.c
> +++ b/hw/remote/memory.c
> @@ -42,10 +42,9 @@ void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp)
>  
>      remote_sysmem_reset();
>  
> -    for (region = 0; region < msg->num_fds; region++) {
> -        g_autofree char *name;
> +    for (region = 0; region < msg->num_fds; region++, suffix++) {
> +        g_autofree char *name = g_strdup_printf("remote-mem-%u", suffix);
>          subregion = g_new(MemoryRegion, 1);
> -        name = g_strdup_printf("remote-mem-%u", suffix++);
>          memory_region_init_ram_from_fd(subregion, NULL,
>                                         name, sysmem_info->sizes[region],
>                                         true, msg->fds[region],
> diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
> index 4fa4be079d..6dda705fc2 100644
> --- a/hw/remote/proxy.c
> +++ b/hw/remote/proxy.c
> @@ -347,13 +347,12 @@ static void probe_pci_info(PCIDevice *dev, Error **errp)
>                     PCI_BASE_ADDRESS_SPACE_IO : PCI_BASE_ADDRESS_SPACE_MEMORY;
>  
>          if (size) {
> -            g_autofree char *name;
> +            g_autofree char *name = g_strdup_printf("bar-region-%d", i);
>              pdev->region[i].dev = pdev;
>              pdev->region[i].present = true;
>              if (type == PCI_BASE_ADDRESS_SPACE_MEMORY) {
>                  pdev->region[i].memory = true;
>              }
> -            name = g_strdup_printf("bar-region-%d", i);
>              memory_region_init_io(&pdev->region[i].mr, OBJECT(pdev),
>                                    &proxy_mr_ops, &pdev->region[i],
>                                    name, size);
> 


