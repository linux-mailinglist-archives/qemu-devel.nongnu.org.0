Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F006C32DD8E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 00:04:09 +0100 (CET)
Received: from localhost ([::1]:44072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHx0r-0006YG-1q
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 18:04:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHwxo-0004qu-Tx
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 18:01:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHwxk-0001fc-GG
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 18:00:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614898854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CyNSzgGnR6dpuiMOOqx547GSjf0UyHB2EEND6GGGj6Y=;
 b=TDUyGKkwRkkrFum9xWaPLSSgUVhbC1qEVL7yMqDsx9Ssx5kPpa3kRCkC+Ue6tJvUhOHm8G
 p8KuwrSlUWS/mgBEAvtQExWrBn5yUFN8v0NW4Um+/kKfjKhbr5ur2fRHBOLVCOdtV9ISMg
 MpApdFGJNFbDGWDDEi/FHvFG2/36bUo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-OtgsX192PTSYLDKvbUcTPQ-1; Thu, 04 Mar 2021 18:00:52 -0500
X-MC-Unique: OtgsX192PTSYLDKvbUcTPQ-1
Received: by mail-wm1-f71.google.com with SMTP id l16so33165wmc.0
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 15:00:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CyNSzgGnR6dpuiMOOqx547GSjf0UyHB2EEND6GGGj6Y=;
 b=oQ1JVvH2mfDPghHOcpkdI/0IFSmGFefWlVtQF1smELhguEkhGXZ1C6xayyFad3IDQb
 5GOndqCjzr8zXxN80aX2fOpqkq4x+cfm8ioJnQLnXkqRjbT+fTaT7ToJWptz1EXOS4Zd
 t9T7PYWR4QW/ZACdSjz4CCfbC8sBKEisWOpgcAc3SFqkb//6SKKlVZQ/4vah4jF5uJcg
 xtf3/c9mFxnc2sPMk4BE4fx7t3S2xmd8YA68pZubbqgOhe2f/zppjclv58kTyUnvd1bQ
 hjsNs+dMmLNDgwH67E33Qm2KWq8rQCBK/gH5LEN6yNTq/uFjD8NnHfw1ygezkNFg8r6q
 X4oQ==
X-Gm-Message-State: AOAM530MWpsEs/bOfoDtlK5KupEqdBtJwURuCDY8hzlE2ER8cQPdbTvB
 rmvhoAc4+x2qFXNFMDWJZhk6YFu7qLRNDlVWmYXDHey9ONyLDtQNj3xH11RtRFc1fF8E8Rp51ye
 1jAd952j1uMRIy4bd51ffl+YNaGe0QuZdTPfzD1oJIKHyKmKjyQwd0to+5MMhqOHs
X-Received: by 2002:a1c:4903:: with SMTP id w3mr6004065wma.143.1614898851449; 
 Thu, 04 Mar 2021 15:00:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkSEamCtqInPf7rTVBuQYVVYujh3/TpDoFcBRbug+keKOrTAWjXqSQUMSkSIjorqLOhn/rhg==
X-Received: by 2002:a1c:4903:: with SMTP id w3mr6004043wma.143.1614898851252; 
 Thu, 04 Mar 2021 15:00:51 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y16sm1184815wrh.3.2021.03.04.15.00.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 15:00:50 -0800 (PST)
Subject: Re: [PATCH v2] multi-process: Initialize variables declared with
 g_auto*
To: Zenghui Yu <yuzenghui@huawei.com>, elena.ufimtseva@oracle.com,
 jag.raman@oracle.com, john.g.johnson@oracle.com
References: <20210304021621.579-1-yuzenghui@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5d848d2e-0521-25ef-97b5-2dcf25ef6a1a@redhat.com>
Date: Fri, 5 Mar 2021 00:00:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210304021621.579-1-yuzenghui@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: wanghaibin.wang@huawei.com, berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/21 3:16 AM, Zenghui Yu wrote:
> Quote docs/devel/style.rst (section "Automatic memory deallocation"):
> 
> * Variables declared with g_auto* MUST always be initialized,
>   otherwise the cleanup function will use uninitialized stack memory
> 
> Initialize @name properly to get rid of the compilation error:

Maybe worth adding "(using gcc-7.3.0 on CentOS):"

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
> ---
> * From v1:
>   - Move the suffix iteration out of the loop (Philippe)
>   - Add Jagannathan's R-b
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


