Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77931327910
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 09:20:07 +0100 (CET)
Received: from localhost ([::1]:49736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGdmg-0000DS-Hn
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 03:20:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGdlr-0008Eq-S6
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 03:19:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGdlq-0003Kd-5p
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 03:19:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614586753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DTfVW/ZM5hF7HyKYBV/gOdP5ZpyOXGheGf/vkVaJK1A=;
 b=ersLcYTK8vI+vOVo2Nyzbcj6wksRnPU7lOH8tG3HrY74mJfsEfrIJ9HkYAvNMqJvvtisk9
 JQSdZ+rFXS09priSkWd8JGh7WLw01zhf5Ag4m/wH2gB7pMrjo8lWMxXkx0YdQgg9K6Didh
 xXj+HdxxMBq8vOe++C3nXvX7ZFGU8uU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-GujUbMIMNuyqfCeU_XMdfQ-1; Mon, 01 Mar 2021 03:19:11 -0500
X-MC-Unique: GujUbMIMNuyqfCeU_XMdfQ-1
Received: by mail-wr1-f71.google.com with SMTP id e13so8970262wrg.4
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 00:19:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DTfVW/ZM5hF7HyKYBV/gOdP5ZpyOXGheGf/vkVaJK1A=;
 b=rYEHRMRhoQAU19pi3Wd4ria/bJCht7HkjbGSPXL6dh49Ugm4l++2St2HnwDVxM6Sdl
 PCfKcW/kKbGirauIdCjbn+PzcuDdM/XtTzs5fr8H9lxLIVmmm04dkHtNSKwMp17vq6z+
 +ON6L6hnZb7EHiUvadkF7nvkoDWk6d7UY8di6HVAOOXSV7PAEr+jq0R9PylMzpZF/D49
 mL1Ydq9twFGJwcE4Da+g1TS4tqKUuSB3PNy8C7eBRRufALuEpbUjwUPDz8hoUyYIJkXh
 DaCDBMAUT2PUFILxmdYQ1uiNpOnhszQLJOx6/OoBnEWcBF73FqxQgpa4/Vf1Znf6Ydfn
 IBnw==
X-Gm-Message-State: AOAM533UYUcHK1QAQzhQOHh99fD5tMZ+GeC3NAKY0ubXpYaevaLTMj+5
 Ns/kvH1cMv4cvuTUSou7ilMcaibQumiMBo7d7m752gujkvK9ot7WwnnAC+hvP9NQx7IBBaP+WAQ
 bXe3ergpXnpBF50Q=
X-Received: by 2002:adf:f44b:: with SMTP id f11mr11763073wrp.345.1614586750762; 
 Mon, 01 Mar 2021 00:19:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzU1HV5QGLEuW7dlbEP9dGRSF6DsiRid/PwYVZGUOhdgYaeRD7tMS7HrlV906qz44I1EHc5eQ==
X-Received: by 2002:adf:f44b:: with SMTP id f11mr11763059wrp.345.1614586750614; 
 Mon, 01 Mar 2021 00:19:10 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a131sm21998769wmc.48.2021.03.01.00.19.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 00:19:09 -0800 (PST)
Subject: Re: [PATCH] hw/pci: Have safer pcie_bus_realize() by checking error
 path
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
References: <20210201153700.618946-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1e1b3d3a-a891-c3cd-0496-2a139737ec63@redhat.com>
Date: Mon, 1 Mar 2021 09:19:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210201153700.618946-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 2/1/21 4:37 PM, Philippe Mathieu-Daudé wrote:
> While pci_bus_realize() currently does not use the Error* argument,
> it would be an error to leave pcie_bus_realize() setting bus->flags
> if pci_bus_realize() had failed.
> 
> Fix by using a local Error* and return early (propagating the error)
> if pci_bus_realize() failed.
> 
> Reported-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/pci/pci.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 512e9042ffa..0d12e94a02e 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -130,8 +130,13 @@ static void pci_bus_realize(BusState *qbus, Error **errp)
>  static void pcie_bus_realize(BusState *qbus, Error **errp)
>  {
>      PCIBus *bus = PCI_BUS(qbus);
> +    Error *local_err = NULL;
>  
> -    pci_bus_realize(qbus, errp);
> +    pci_bus_realize(qbus, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
>  
>      /*
>       * A PCI-E bus can support extended config space if it's the root
> 


