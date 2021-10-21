Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 383384360CA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 13:49:55 +0200 (CEST)
Received: from localhost ([::1]:60486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdWa2-0000re-AM
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 07:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mdWUi-0005Zm-8i
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 07:44:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mdWUg-0000Pn-IF
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 07:44:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634816661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jUL7TZCRkcFWDhv9dT9aXibu5sp17qTG3/QssnWGD08=;
 b=Qdf+EwRVtVS2cd3HChavHC+ueEFs4xSfhzxC74Nw8AJPEGobPo/59PSXpAXF1yVJby64QD
 mdbbZh74XuwpluVUs+KuAU3u0YkQrgqn+3fVUapwPUWNcRpGNeqk+AEpx5AAVE9XMhATs+
 yN0C/BWEXWXND/pwlflVd+KesYxhq7M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-_mTp2KbJO_mstUA-ngc-aA-1; Thu, 21 Oct 2021 07:44:20 -0400
X-MC-Unique: _mTp2KbJO_mstUA-ngc-aA-1
Received: by mail-wr1-f69.google.com with SMTP id
 l6-20020adfa386000000b00160c4c1866eso98903wrb.4
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 04:44:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jUL7TZCRkcFWDhv9dT9aXibu5sp17qTG3/QssnWGD08=;
 b=AfJl2pl/ue4c4vzWCS9DA36KkqgcyPX/tAVXy25+NzOW0D224wTqIuuj+e87hxwu5H
 Pjb4/fq8wUME+/ucbBTwEm+2HEuVkbgZKio2kO7nKHAzOwDiieIwfy7QDYpno/vIeV2V
 9UdxNJZ85j6kajJBDL1UCyMqIhDmGIii/TnCEARfByyWS+fgp9ujSzCtPzeYziiQRPLf
 mhGBi235qCK6c8u+WNxUMU0abOlE7tflyvVbCmy+gsvD4qh2y8tY+xHIS6ULUD4ToXYt
 SbzkpA3n+RVvGZHKl6oLUz1FN7ZU9+YDPyJNCRuZ70EWPhUr3F+EFRWK4UZmjPm3Qe7j
 +mgg==
X-Gm-Message-State: AOAM530jtClR4jv4TujKcB9Qnxjgq3PtXmpDLzGWZhFmO+2B9qGru75q
 SOeib6auG9UG9T90EARq+ygSOPnxus+Fi6RZAXrOf9R2upglaHCDl+5uXTYpVq/S2debmIKMsS9
 BTnbPyJeEG9TMnfg=
X-Received: by 2002:a05:6000:188e:: with SMTP id
 a14mr6389997wri.223.1634816659315; 
 Thu, 21 Oct 2021 04:44:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvoSIS6zb8cWbr9J52hTQPJCYn1upy1Xq6n90Fj2gRUyUp9ohYf8Yqau0Ox/peSMbXkKhZPQ==
X-Received: by 2002:a05:6000:188e:: with SMTP id
 a14mr6389984wri.223.1634816659167; 
 Thu, 21 Oct 2021 04:44:19 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id u15sm5193569wmq.12.2021.10.21.04.44.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 04:44:18 -0700 (PDT)
Message-ID: <f7062eed-3040-0ba2-1d8f-0cb002640acc@redhat.com>
Date: Thu, 21 Oct 2021 13:44:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 4/8] pci: Define pci_bus_fn/pci_bus_ret_fn type
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-5-peterx@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211021104259.57754-5-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.867, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:42, Peter Xu wrote:
> The pci_bus_fn is similar to pci_bus_dev_fn that only takes a PCIBus* and an
> opaque.  The pci_bus_ret_fn is similar to pci_bus_fn but it allows to return a
> void* pointer.
> 
> Use them where proper in pci.[ch], and to be used elsewhere.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  hw/pci/pci.c         |  6 ++----
>  include/hw/pci/pci.h | 12 +++++-------
>  2 files changed, 7 insertions(+), 11 deletions(-)

> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -402,6 +402,8 @@ OBJECT_DECLARE_TYPE(PCIBus, PCIBusClass, PCI_BUS)
>  #define TYPE_PCIE_BUS "PCIE"
>  
>  typedef void (*pci_bus_dev_fn)(PCIBus *b, PCIDevice *d, void *opaque);
> +typedef void (*pci_bus_fn)(PCIBus *b, void *opaque);
> +typedef void* (*pci_bus_ret_fn)(PCIBus *b, void *opaque);

$ git grep -F '* (*'|wc -l
12
$ git grep -F ' *(*'|wc -l
88

Nitpicking but I'd rather follow the project typedef style, otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


