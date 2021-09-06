Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4162401C1A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:05:47 +0200 (CEST)
Received: from localhost ([::1]:39396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEJm-00074B-Pc
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNEGI-0005ew-CY
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:02:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNEGB-0007q3-JE
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:02:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630933318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YZoWQP2tQPdNN+qs+gipDIxnK7PytPTqXmGDnT1WAXU=;
 b=SPHMimWxxuO8nu/6PQcQ+/GHTIyTMtiye/DDZD6wMNIVU6isoLzLQOuOyiwju+b2hivu9r
 CS+cdmChgRlRteszCoMlKjU2x50kSmo2cYz3D2sOBCI8yZEgNDYTr/4nLipI2dDt9CdKbE
 XjZowguywkesFEchNTF9CFbt4N2wQUQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-EcUvSyeSPo2rHiznyO88_g-1; Mon, 06 Sep 2021 09:01:57 -0400
X-MC-Unique: EcUvSyeSPo2rHiznyO88_g-1
Received: by mail-wm1-f69.google.com with SMTP id
 f19-20020a1c1f13000000b002e6bd83c344so3205019wmf.3
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YZoWQP2tQPdNN+qs+gipDIxnK7PytPTqXmGDnT1WAXU=;
 b=Lo/wbY2F2i5dEhvyhwZJeVDPsJB+fzJuKCrKNwvz/VDfmZj5HShhqJei3Yh+o0R9Mz
 nYLwx0JBd4ClSJVrMmfgdfhef0005B4oIs2rT6yOF8mEdauiSkGV7uDKTVadyaSkf+wp
 NGIoba/IvAu7jmGe1ix1UL5u0SOqV2cca0sxLYPdMqqjWqibXSaeEwcrvMGsfBmpHdXW
 xSTxdwK6q7L6jN7O/ARuru4FjdRHG6FBj/LkMht1bwReDceaTqOL5Ft/PO2YaM/INDtp
 ROBizkGmPOFarFNZnfaJIvfngRy9ACcXsbiofzTXTEXeuBrVjaygS9go3F2dJgLcRDYY
 0u6w==
X-Gm-Message-State: AOAM5311LyPe0t7StA6grItEAGt7ea4IPxPAR1LTx1uRpDXJEA45dZVJ
 hxlCul9DB7VBMKWYphKusEZvyHQe0zMH5wLLBr6tmh9ApTM3ikUIzFaC5DkclGkLp4ZpH/1NYyO
 UoPESwI5Bol+5qTae6hYxMghNvwPvNgQwHTTxMsbhCY3ZSKB3gVOkHAjNr6gdJ2lr
X-Received: by 2002:a5d:62d2:: with SMTP id o18mr13546419wrv.234.1630933316127; 
 Mon, 06 Sep 2021 06:01:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfu8pyjMopT1Ao3tdbIXw18rE8PnZfLwn3X6kgtS36xA4dVsZQHHAjXHIYqXGN9nT16H6s7A==
X-Received: by 2002:a5d:62d2:: with SMTP id o18mr13546372wrv.234.1630933315720; 
 Mon, 06 Sep 2021 06:01:55 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id h16sm7857094wre.52.2021.09.06.06.01.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 06:01:55 -0700 (PDT)
Subject: Re: [PATCH] docs/devel: memory: Document MemoryRegionOps requirement
To: Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>
References: <20210906122020.5793-1-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <54817618-59b9-d6e6-f903-f7d6938c17ba@redhat.com>
Date: Mon, 6 Sep 2021 15:01:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210906122020.5793-1-bmeng.cn@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/6/21 2:20 PM, Bin Meng wrote:
> It's been a requirement that at least one function pointer for read
> and one for write are provided ever since the MemoryRegion APIs were
> introduced in 2012.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> 
>  docs/devel/memory.rst | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/docs/devel/memory.rst b/docs/devel/memory.rst
> index 5dc8a12682..7b589b21d2 100644
> --- a/docs/devel/memory.rst
> +++ b/docs/devel/memory.rst
> @@ -344,6 +344,11 @@ based on the attributes used for the memory transaction, or need
>  to be able to respond that the access should provoke a bus error
>  rather than completing successfully; those devices can use the
>  ->read_with_attrs() and ->write_with_attrs() callbacks instead.
> +The requirement for a device's MemoryRegionOps is that at least
> +one callback for read and one for write are provided. If both
> +->read() and ->read_with_attrs() are provided, the plain ->read()
> +version takes precedence over the with_attrs() version. So does
> +the write callback.

What about also adding a runtime check?

-- >8 --
diff --git a/softmmu/memory.c b/softmmu/memory.c
index bfedaf9c4df..8ab602d3379 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1516,6 +1516,17 @@ MemTxResult
memory_region_dispatch_write(MemoryRegion *mr,
     }
 }

+static void memory_region_set_ops(MemoryRegion *mr, const
MemoryRegionOps *ops)
+{
+    if (ops) {
+        assert(ops->valid.accepts || (ops->read || ops->read_with_attrs));
+        assert(ops->valid.accepts || (ops->write ||
ops->write_with_attrs));
+        mr->ops = ops;
+    } else {
+        mr->ops = &unassigned_mem_ops;
+    }
+}
+
 void memory_region_init_io(MemoryRegion *mr,
                            Object *owner,
                            const MemoryRegionOps *ops,
@@ -1524,7 +1535,7 @@ void memory_region_init_io(MemoryRegion *mr,
                            uint64_t size)
 {
     memory_region_init(mr, owner, name, size);
-    mr->ops = ops ? ops : &unassigned_mem_ops;
+    memory_region_set_ops(mr, ops);
     mr->opaque = opaque;
     mr->terminates = true;
 }
@@ -1701,7 +1712,7 @@ void
memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
     Error *err = NULL;
     assert(ops);
     memory_region_init(mr, owner, name, size);
-    mr->ops = ops;
+    memory_region_set_ops(mr, ops);
     mr->opaque = opaque;
     mr->terminates = true;
     mr->rom_device = true;
---


