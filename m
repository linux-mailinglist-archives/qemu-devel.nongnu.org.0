Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1C743622A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 14:56:20 +0200 (CEST)
Received: from localhost ([::1]:39560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdXcI-0005Du-SU
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 08:56:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mdXau-0004X8-Cu
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 08:54:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mdXas-0007D1-3e
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 08:54:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634820889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hwuF1zT9+lJ/xZCf0fc227ElB/0m1lX5DfWEklhd0PY=;
 b=fEE0caFNcIaPMyBCKOGqee1ievcifBH/G3VE7swc638gfQQmOcAn/gOo40umiN+cP3nkYT
 H1aoRP4QFC3gvC3Ar6PgMwnbI9drZqmDGRA1go0jFD0Imwxxs9cBe/ujO46ayU8gBtxOAm
 aI653Eb7mgJjWSfkHI/+vUlfZHRpKho=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-TW4NSWrjPDqKKQr0GJe8AQ-1; Thu, 21 Oct 2021 08:54:48 -0400
X-MC-Unique: TW4NSWrjPDqKKQr0GJe8AQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 v10-20020a1cf70a000000b00318203a6bd1so284209wmh.6
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 05:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=hwuF1zT9+lJ/xZCf0fc227ElB/0m1lX5DfWEklhd0PY=;
 b=vN1St1DK7YhLswsj3cU70UORRDDe8StuGidhtuGzjOF0gzqmUcv62AnTRlV5dxY1VR
 170N6rcvXltOcmWX/OmYy07F+6zSpnVoU5+fOdyH0aqOVa2y7Vwop9E6bOAfYLaqqx7A
 dBsBBpALQabWKFWnweIps8aKxZUUSl/+GPJ0iLGtMn4pzdXRMB7kZvQkQUZImKABcW72
 bqtxfqUgwDP1lzdM4Efl9ostvWXnnQHf0RjD79uZj97NXZk612qEbZ98q+gBoz69K5wd
 gwR5qpcMITTl+x74v9lRqbMLUBh3JhvU/zdjG+4i693MmmawWlHB5MrCuc258+2ws1Cr
 fFxw==
X-Gm-Message-State: AOAM532uBwoV90A80MVbAj2xnQhNJZM0xQImyjFf1XVbaoVMRliZfJwe
 +ZjJP3pPdQgXXfs4EKci9ZSaf2jLYP/JsKh+aqEQaGH75VNGNDFByp8wbEL9gKYRxHQIPESFP8i
 d4PGP9lcfl9P8Rfg=
X-Received: by 2002:a5d:6ac3:: with SMTP id u3mr4551081wrw.357.1634820886933; 
 Thu, 21 Oct 2021 05:54:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxoHIoFMXp/k56j6/jEOQ8EFUCS9/b4eQE5anIx9koa7BqdT2kjRUNjLbj8Dr3OUGdmJxpgw==
X-Received: by 2002:a5d:6ac3:: with SMTP id u3mr4551039wrw.357.1634820886665; 
 Thu, 21 Oct 2021 05:54:46 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id i13sm5512735wmq.41.2021.10.21.05.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 05:54:46 -0700 (PDT)
Message-ID: <c9f5420e-c2d2-9332-8780-c8bb07827609@redhat.com>
Date: Thu, 21 Oct 2021 14:54:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 4/8] pci: Define pci_bus_fn/pci_bus_ret_fn type
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-5-peterx@redhat.com>
 <f7062eed-3040-0ba2-1d8f-0cb002640acc@redhat.com>
In-Reply-To: <f7062eed-3040-0ba2-1d8f-0cb002640acc@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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

On 10/21/21 13:44, Philippe Mathieu-Daudé wrote:
> On 10/21/21 12:42, Peter Xu wrote:
>> The pci_bus_fn is similar to pci_bus_dev_fn that only takes a PCIBus* and an
>> opaque.  The pci_bus_ret_fn is similar to pci_bus_fn but it allows to return a
>> void* pointer.
>>
>> Use them where proper in pci.[ch], and to be used elsewhere.
>>
>> Signed-off-by: Peter Xu <peterx@redhat.com>
>> ---
>>  hw/pci/pci.c         |  6 ++----
>>  include/hw/pci/pci.h | 12 +++++-------
>>  2 files changed, 7 insertions(+), 11 deletions(-)
> 
>> --- a/include/hw/pci/pci.h
>> +++ b/include/hw/pci/pci.h
>> @@ -402,6 +402,8 @@ OBJECT_DECLARE_TYPE(PCIBus, PCIBusClass, PCI_BUS)
>>  #define TYPE_PCIE_BUS "PCIE"
>>  
>>  typedef void (*pci_bus_dev_fn)(PCIBus *b, PCIDevice *d, void *opaque);
>> +typedef void (*pci_bus_fn)(PCIBus *b, void *opaque);
>> +typedef void* (*pci_bus_ret_fn)(PCIBus *b, void *opaque);

Now looking at patch #8, I wonder if it wouldn't be cleaner to have
a single:

/*
 * pci_bus_fn:
 * @bus: PCI bus
 * @opaque: Pointer to opaque pointer,
            can be used as input *and* output
 * Return #true on success, #false on failure
 */
typedef bool (*pci_bus_fn)(PCIBus *bus, void **opaque);


