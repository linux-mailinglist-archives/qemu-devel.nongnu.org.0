Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5AF3EE8C8
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 10:44:17 +0200 (CEST)
Received: from localhost ([::1]:51294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFuhk-0004NW-D2
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 04:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFugS-0003eS-CM
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 04:42:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFugQ-0000uw-IF
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 04:42:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629189773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L81Nw+qexSSmxR3PLhdRvhACgSr9ksKlNrX0xcbNPcY=;
 b=Rzusa9atBaAjLLooKh6D55J5tszOBZPzhNTsKDJm0asUb7X+J7WS5oRrq5V/UzSoX54M1a
 RFaPKgU9wuWQlXze6b6JyveMhlQ4t6A8prQu2kXjkFRIKDvc9so6EN7Vl9Yv4k5ZYP05Bn
 W+hFj13TQ7A9/Y9SX4iOonPmuRTh2u8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-BZHPOZngPG-n7I3pLyWkvg-1; Tue, 17 Aug 2021 04:42:52 -0400
X-MC-Unique: BZHPOZngPG-n7I3pLyWkvg-1
Received: by mail-wm1-f72.google.com with SMTP id
 y206-20020a1c7dd70000b02902e6a442ea44so706533wmc.9
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 01:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L81Nw+qexSSmxR3PLhdRvhACgSr9ksKlNrX0xcbNPcY=;
 b=qoOf/Ssyp9keT4ZBGu18jRcEcAKKR9uMQOz0yqw2wrddcokKfs6EbyKrfHp7RQNo/D
 MPn/pj8tnO0NCHhe71XTu6VQkwQdk3ISm89aF9PEWXiQ5w1sYcBfoRAkz9TS9sbgGNv/
 z/7U1p/F+iK/vbT/JF7jxh8avinHdnC+vy7ylV3fK3S4gsk2NQZceemvrIDVWVKNhHvq
 Dtfa6Y4fjYh+yEN3Py5jHeO9l9sJa9KGs0KFcZRgGC+f9sBt6FN6plpAfzH0I9dpBHGI
 ef4lt7j0O4epAFf1ytMeMidsC8mAIlJSEBpxDIGl/4SQgVnxYj3x3ePeyhm8uH4iSZ2N
 DbUQ==
X-Gm-Message-State: AOAM531ze40VDeBFbPnFSj/d6ZC3zrpDiIqZIyIpbDI/ev9EnHhD6npk
 TM5xsVoq5YeYxvXfCGm69hxhV1OeyjYJBa+BQjk/k1dJEtdTcCEzG/MLs7e+NZkCucVVOeVjUzR
 kgPmbn4VNOm8yyeE=
X-Received: by 2002:adf:f285:: with SMTP id k5mr2600101wro.117.1629189771615; 
 Tue, 17 Aug 2021 01:42:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgfH2NvMZQkVkf5XiQsWXVadrsZM43hkuBbs3eCvdagzAwCnxoGlDjVKqG1CivmG2Nko2RhQ==
X-Received: by 2002:adf:f285:: with SMTP id k5mr2600078wro.117.1629189771439; 
 Tue, 17 Aug 2021 01:42:51 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id y66sm1329665wmy.39.2021.08.17.01.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 01:42:50 -0700 (PDT)
Subject: Re: [PULL 24/30] spapr_pci: populate ibm,loc-code
To: David Gibson <david@gibson.dropbear.id.au>
References: <1436284182-5063-1-git-send-email-agraf@suse.de>
 <1436284182-5063-25-git-send-email-agraf@suse.de>
 <CAFEAcA9TQKAU94OUuSzYH8A_7CFfSYc+R8-Mz4mai0vwMbjsxA@mail.gmail.com>
 <YRIAr6HIW742LSZd@yekko>
 <CAFEAcA-GGNcm09xu5v65jQcghjBnj6cBtb0p0xYhOPPNt1g_sg@mail.gmail.com>
 <1daaacdf-4725-3350-601f-24025d3944f4@redhat.com> <YRnrn0EeT8apvqFI@yekko>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b247c255-c979-65ab-79f6-f893ae56edcd@redhat.com>
Date: Tue, 17 Aug 2021 10:42:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRnrn0EeT8apvqFI@yekko>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/16/21 6:37 AM, David Gibson wrote:

> From 705a10b1cfbe6bcdde37f37f3548845970dc4986 Mon Sep 17 00:00:00 2001
> From: David Gibson <david@gibson.dropbear.id.au>
> Date: Tue, 10 Aug 2021 14:28:19 +1000
> Subject: [PATCH] spapr_pci: Fix leak in spapr_phb_vfio_get_loc_code() with
>  g_autofree
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> This uses g_autofree to simplify logic in spapr_phb_vfio_get_loc_code(),
> in the process fixing a leak in one of the paths.  I'm told this fixes
> Coverity error CID 1460454
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: 16b0ea1d852 ("spapr_pci: populate ibm,loc-code")
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  hw/ppc/spapr_pci.c | 22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 7a725855f9..7430bd6314 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -782,33 +782,29 @@ static AddressSpace *spapr_pci_dma_iommu(PCIBus *bus, void *opaque, int devfn)
>  
>  static char *spapr_phb_vfio_get_loc_code(SpaprPhbState *sphb,  PCIDevice *pdev)
>  {
> -    char *path = NULL, *buf = NULL, *host = NULL;
> +    g_autofree char *path = NULL;
> +    g_autofree char *host = NULL;
> +    g_autofree char *devspec = NULL;
> +    char *buf = NULL;
>  
>      /* Get the PCI VFIO host id */
>      host = object_property_get_str(OBJECT(pdev), "host", NULL);
>      if (!host) {
> -        goto err_out;
> +        return NULL;
>      }
>  
>      /* Construct the path of the file that will give us the DT location */
>      path = g_strdup_printf("/sys/bus/pci/devices/%s/devspec", host);
> -    g_free(host);
> -    if (!g_file_get_contents(path, &buf, NULL, NULL)) {
> -        goto err_out;
> +    if (!g_file_get_contents(path, &devspec, NULL, NULL)) {
> +        return NULL;
>      }
> -    g_free(path);
>  
>      /* Construct and read from host device tree the loc-code */
> -    path = g_strdup_printf("/proc/device-tree%s/ibm,loc-code", buf);
> -    g_free(buf);
> +    path = g_strdup_printf("/proc/device-tree%s/ibm,loc-code", devspec);
>      if (!g_file_get_contents(path, &buf, NULL, NULL)) {
> -        goto err_out;
> +        return NULL;
>      }
>      return buf;
> -
> -err_out:
> -    g_free(path);
> -    return NULL;
>  }
>  
>  static char *spapr_phb_get_loc_code(SpaprPhbState *sphb, PCIDevice *pdev)
> 

LGTM.


