Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A636E48E739
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 10:16:38 +0100 (CET)
Received: from localhost ([::1]:35676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8IhJ-0002Az-PQ
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 04:16:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n8IaW-0002P9-4A
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 04:09:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n8IaT-0002eg-Fp
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 04:09:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642151372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RO4tp7XZHn6SUunt9iF1lZTPRft2gYXUZZBK62WVdb0=;
 b=UuUubWWE17P8oSc8R/1bmhxPi/28JDYrDVsZj8GgjREzfYfc95Rw0ZZtQeVuOWC2o4V8ia
 1T68zYikXkgLfZ7t2zlHPyI3WuAiWwPY58+5YByPtJ3BBxz470tO+A56bk6ngZgY4neufb
 /PSeXpN3hTQ38UPb6kJX1AsdvAZ5HZY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-AdGopnYJMCavfJjZFfkLmw-1; Fri, 14 Jan 2022 04:09:29 -0500
X-MC-Unique: AdGopnYJMCavfJjZFfkLmw-1
Received: by mail-wr1-f69.google.com with SMTP id
 i8-20020adfa508000000b001ad5418833cso1583932wrb.5
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 01:09:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RO4tp7XZHn6SUunt9iF1lZTPRft2gYXUZZBK62WVdb0=;
 b=UniNTDuctlqJXNhMD0YUJPreagWQA1c58S1yakAHU6dYZUt49GJq/ATDdDqpmh2jNd
 4E2BF1hWnSyiE7B22mwFpDDgO9VhqvZJGXZF5HIEjeWthDTxWzncOS9wQU872D7ZNQjG
 20rfGCQSSkvSVoQA+Koyp5Ylxy/30zsIfEy+Sfvp9bM62Knesk2ofhS5F6z6Ul9lJtVy
 sqQ0l/EY5kfGtQv1P+ooAC64THzeOsqtiQg/6VBfubTNf7xHEfepiVWhrcvXyY62Nh81
 ylmoNOf93I7C4SlZUOJ8gHLfOJxAt/TOiW3bhQN62Woz4HqY4hp3H1f1sIHOHilYAjGb
 9C5A==
X-Gm-Message-State: AOAM5324XqWB2TQuYHGhPU1Yx1IqTA+CvF3JDabSt1QWfRR/DcdhNXRX
 /L8Va89T+bYpoIRvaL/OtncHkMNzTJ1OShFp1suKEG/55JVnLZnj3/W/K34SpNTitGOQ01kfD4f
 FjTWXzxCITxDsQZg=
X-Received: by 2002:a7b:cc12:: with SMTP id f18mr10188121wmh.42.1642151367992; 
 Fri, 14 Jan 2022 01:09:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9V423RG7rYzIfIVDgf6l63BsG6T987nS4rxTpScMvTW6vaX8qIzG0xtMKhlxb8ayJA95zvQ==
X-Received: by 2002:a7b:cc12:: with SMTP id f18mr10188096wmh.42.1642151367732; 
 Fri, 14 Jan 2022 01:09:27 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id f9sm5571635wry.115.2022.01.14.01.09.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 01:09:27 -0800 (PST)
Message-ID: <31563516-8bee-9a61-5f68-dcc672b12211@redhat.com>
Date: Fri, 14 Jan 2022 10:09:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 6/6] tests/qtest/libqos: Add pci-arm and add a pci-arm
 producer in arm-virt machine
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 pbonzini@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org
References: <20220110211915.2749082-1-eric.auger@redhat.com>
 <20220110211915.2749082-7-eric.auger@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220110211915.2749082-7-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: jean-philippe@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/01/2022 22.19, Eric Auger wrote:
> Up to now the virt-machine node contains a virtio-mmio node.
> However no driver produces any PCI interface node. Hence, PCI
> tests cannot be run with aarch64 binary.
> 
> Add a GPEX driver node that produces a pci interface node. This latter
> then can be consumed by all the pci tests. One of the first motivation
> was to be able to run the virtio-iommu-pci tests.
> 
> We still face an issue with pci hotplug tests as hotplug cannot happen
> on the pcie root bus and require a generic root port. This will be
> addressed later on.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   tests/qtest/libqos/arm-virt-machine.c |  47 +++++-
>   tests/qtest/libqos/meson.build        |   3 +
>   tests/qtest/libqos/pci-arm.c          | 219 ++++++++++++++++++++++++++
>   tests/qtest/libqos/pci-arm.h          |  56 +++++++
>   tests/qtest/libqos/pci.h              |   1 +
>   tests/qtest/libqos/qgraph.c           |   7 +
>   tests/qtest/libqos/qgraph.h           |  15 ++
>   7 files changed, 344 insertions(+), 4 deletions(-)
>   create mode 100644 tests/qtest/libqos/pci-arm.c
>   create mode 100644 tests/qtest/libqos/pci-arm.h
[...]
> diff --git a/tests/qtest/libqos/pci-arm.c b/tests/qtest/libqos/pci-arm.c
> new file mode 100644
> index 00000000000..64d826bb3c7
> --- /dev/null
> +++ b/tests/qtest/libqos/pci-arm.c
> @@ -0,0 +1,219 @@
> +/*
> + * libqos PCI bindings for ARM
> + *
> + * Copyright Red Hat Inc., 2021

You might want to update to 2022 now.

Apart from that:
Acked-by: Thomas Huth <thuth@redhat.com>

Let me know if I should take this through my qtest branch - otherwise I'll 
assume it will go via Peter's arm branch.

  Thomas


