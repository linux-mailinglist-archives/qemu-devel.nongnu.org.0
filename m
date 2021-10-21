Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12511435FF6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 13:07:00 +0200 (CEST)
Received: from localhost ([::1]:51668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdVuV-0006gC-4j
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 07:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mdVkI-0003to-Sk
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:56:27 -0400
Received: from usb-smtp-delivery-124.mimecast.com ([170.10.151.124]:57677
 helo=us-smtp-delivery-124.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mdVkG-0006HL-Cy
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:56:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634813783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HhtzGeCyWBuOJpTpRgZj/9JmBasFcegrVE6CV9THBrk=;
 b=GIkqtOKVby5VLIeJm5IkxQ/iE0rpxXXXPvZqzSBq9LMw21V6eWDN2yG/Eblip5iqQGMy/l
 G4G0GDKCOFdBldCOimSvDxhyrHRYhHeUFC40FN/BBlfclUCasvo8qloHqSXpg9F47X1lSF
 hy6i8Zy0qNuFM30S72eDPF59tjpoigE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-BF3pgI7CMn-hY0Eox4jC9g-1; Thu, 21 Oct 2021 06:56:22 -0400
X-MC-Unique: BF3pgI7CMn-hY0Eox4jC9g-1
Received: by mail-wr1-f72.google.com with SMTP id
 41-20020adf802c000000b00161123698e0so55962wrk.12
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 03:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HhtzGeCyWBuOJpTpRgZj/9JmBasFcegrVE6CV9THBrk=;
 b=TsGsV+4gQBCucmgU4J0jP/GLQ99UawW+nY0XHr1dD4Z7cChzh/yCh5J16yGX/afsQY
 VQhr+AaaJ8mFfDEHoOfc6ADJAzG92h78iIoLSBSGPwtcpIKMeCzpcnOctvEPplnbVG3A
 7rj1kwikNsbAl8S9gjkmXaczEss6w3xqKSwhQgZvTS2bAixfST371sXncC5qv3PCMn69
 X2rnZYSsnYBaQxBdhSbZZZ/thMNkk013wPv8ePwsncQ6qAMet4xBxCFDiiLN//reNCzt
 mZet4Pz828qSWANP3jpdRwza+Gc7hBkCcVA1YQ8DB8dFiOP6awcAWBv9iVb97lB+Rugt
 evYQ==
X-Gm-Message-State: AOAM533qWqwycceCruWtLwe4tYnk8mLmTdqlc29eUDY6geZRw9FAbxyV
 a/OZmWlqcDRne5QJwErKQHK3jXyivauPw5MAQaRr4hQhOel/gO+JH1drLZQHrSaGelekuTG85FA
 4MTjhZTU120rm8e4=
X-Received: by 2002:a05:600c:35d4:: with SMTP id
 r20mr20113718wmq.24.1634813781247; 
 Thu, 21 Oct 2021 03:56:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyQRbL5DsYfEk0JBraW0Q/kxNDlGp307eo+oCYX+WGBaycDyiF2aXXpkads3gtVbl8GEG+2A==
X-Received: by 2002:a05:600c:35d4:: with SMTP id
 r20mr20113690wmq.24.1634813781039; 
 Thu, 21 Oct 2021 03:56:21 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23aba.dip0.t-ipconnect.de. [79.242.58.186])
 by smtp.gmail.com with ESMTPSA id r5sm7341909wmh.28.2021.10.21.03.56.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 03:56:20 -0700 (PDT)
Message-ID: <90527c0c-2d7b-d9dd-448b-78f2325f5a29@redhat.com>
Date: Thu, 21 Oct 2021 12:56:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 3/8] pci: Use pci_for_each_device_under_bus*()
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-4-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211021104259.57754-4-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.151.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.10.21 12:42, Peter Xu wrote:
> Replace all the call sites of existing pci_for_each_device*() where the bus
> number is calculated from a PCIBus* already.  It should avoid the lookup of the
> PCIBus again.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  hw/i386/acpi-build.c       |  5 ++---
>  hw/pci/pcie.c              |  4 +---
>  hw/ppc/spapr_pci.c         | 12 +++++-------
>  hw/ppc/spapr_pci_nvlink2.c |  7 +++----
>  hw/ppc/spapr_pci_vfio.c    |  4 ++--
>  hw/s390x/s390-pci-bus.c    |  5 ++---
>  hw/xen/xen_pt.c            |  4 ++--
>  7 files changed, 17 insertions(+), 24 deletions(-)
> 

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


