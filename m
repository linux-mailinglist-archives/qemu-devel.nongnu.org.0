Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0724458C3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 18:37:50 +0100 (CET)
Received: from localhost ([::1]:46692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miggP-0001Cs-Uh
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 13:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1migfR-0000La-Ir
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 13:36:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1migfO-0000zp-AP
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 13:36:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636047405;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qOK+ZnlJYUqOa7P8mwVBDoh7r+LrTIicXeAaDvDGRmQ=;
 b=Rnaf4ZXgeQVTNBYUSIaVlPrwD9NPM16a40+0qNObnCWFKhwAxL7CPJ+yJPy2H7QDF0kVHG
 +A6MauOhkfenQWPp3XIyhWvz20Ew0na+NqW1k3xhLcWsBfrD9chsUXxdA5VIdypBVednok
 EpKoLgYFrzBy7ArEY0uFlwrh1fZtqWo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-gCiTQMKgMYWsV6iYUsJIxw-1; Thu, 04 Nov 2021 13:36:43 -0400
X-MC-Unique: gCiTQMKgMYWsV6iYUsJIxw-1
Received: by mail-wm1-f71.google.com with SMTP id
 128-20020a1c0486000000b0030dcd45476aso2753540wme.0
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 10:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=qOK+ZnlJYUqOa7P8mwVBDoh7r+LrTIicXeAaDvDGRmQ=;
 b=jqPE7iFLYuVZfJTR9GXQjS0Qrnhcsk88YGbNHsAiN6UK2h4IJmAKoYqUgLd3Oh5EPO
 TzerXhrtrxNEIo68GNFlf2nBVsQ9C0g91XINxAknV2mgtltFqOvrwjHKNFfizret61kU
 M85INbvcLr9EgYEEkszQPjLGlqRrSQGMwXGxVhzlQvFXdep0zanPjDlRO0hIJBKZwcTr
 Sl6WXy5p1U2cJGuyXl+YbFRQ8LHvel+Qr/5nnRgKO9wK0va9Bs7OpE1dQ4RdFfj1Vqzd
 gXd6rUyy0JYJTpHoPE/SmDltEUo5whP7DYm71oPM6TX2w4Od/pTzvlzbpdL5rzY1o4Bt
 zihw==
X-Gm-Message-State: AOAM530DDSRBWPZ4sFPLxCMnQM/8rFj7kTBJtdmLBNB2yTaI0/a7sZOJ
 D08WHGOB7uZcXvo+1kiMI5RLwBsewn2EiZa+9VxQy+w2WOSiT7EH9UOqQjKrYU1msQVHnsmh4eu
 zLgMVg2IFweBlPV0=
X-Received: by 2002:a5d:6702:: with SMTP id o2mr50209991wru.108.1636047402656; 
 Thu, 04 Nov 2021 10:36:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNvJpvXmXSwyVgWIw/bdaht0QSyBQJk30MNSJIasxEE7elV4Z0UjXJQiVkEPvY/DVpffU1Cw==
X-Received: by 2002:a5d:6702:: with SMTP id o2mr50209963wru.108.1636047402477; 
 Thu, 04 Nov 2021 10:36:42 -0700 (PDT)
Received: from [192.168.1.104] (rm-19-28-6.service.infuturo.it. [151.19.28.6])
 by smtp.gmail.com with ESMTPSA id
 i20sm2954077wmq.41.2021.11.04.10.36.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 10:36:41 -0700 (PDT)
Subject: Re: [PATCH v5] tests: qtest: Add virtio-iommu test
To: Thomas Huth <thuth@redhat.com>, eric.auger.pro@gmail.com,
 pbonzini@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, jean-philippe@linaro.org
References: <20211101184858.15223-1-eric.auger@redhat.com>
 <5e8c9e6a-830c-5f47-3b19-e878f021fa6f@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <4356c06b-ee33-3763-cec1-f9f9500fb98b@redhat.com>
Date: Thu, 4 Nov 2021 18:36:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <5e8c9e6a-830c-5f47-3b19-e878f021fa6f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas,
On 11/2/21 1:58 PM, Thomas Huth wrote:
> On 01/11/2021 19.48, Eric Auger wrote:
>> Add the framework to test the virtio-iommu-pci device
>> and tests exercising the attach/detach, map/unmap API.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Tested-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>
>> ---
>>
>> v4 -> v5:
>> - remove printf and move a comment
>> - Added Jean-Philippe's T-b and R-b
>
>  Hi Eric,
>
> I tried to add this patch to my queue, but unfortunately, it fails
> some of the gitlab CI pipelines, e.g.:
>
>  https://gitlab.com/thuth/qemu/-/jobs/1739091817#L311
>
>  ...
>  Running test qtest-x86_64/qos-test
>  qemu-system-x86_64: -device virtio-iommu-pci,addr=04.0:
>  pc-i440fx-6.2 machine fails to create iommu-map device tree
>  bindings
>  Check your machine implements a hotplug handler for the
>  virtio-iommu-pci device
>  Check the guest is booted without FW or with -no-acpi
>  Broken pipe
>  ...
>
> Could you please have a look?
The test requires to be applied on top of Jean-Philippe's series
[PATCH v6 0/7] virtio-iommu: Add ACPI support (x86 part) and especially
36efa250a4  hw/i386/pc: Allow instantiating a virtio-iommu device
which allows the instantiation of the virtio-iommu on q35. The series
was merged so the problem should be resolved now.

Thanks

Eric


>
>  Thanks,
>   Thomas
>


