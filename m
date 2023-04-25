Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1285B6EDCAD
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:33:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDA3-0005cc-Ft; Tue, 25 Apr 2023 03:32:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prD9z-0005cS-LM
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:32:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prD9w-0004V9-RT
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:32:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682407939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XE26/cpf9oLyW6D/ufScImV/wM6gcgyln3vZLDrJs8Y=;
 b=dOQ6K1bhBcTRDWO2GvtWO/qr0IQoxDy2yXS+wveyo0JmsehFUTQF1+XOegc2cAdpzMKqJ6
 KPS+pVtbCMmJwcC5Sea6z3mpArFJewTMeMQlFNYvq+5A6iHp+1kGJOjM+c+0Ze8xfVmPmM
 wBWx0HfadnxFTSpDYvFcT1JWQnBJuDQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-Sd_8blQWPTigovDnBXN7wA-1; Tue, 25 Apr 2023 03:32:18 -0400
X-MC-Unique: Sd_8blQWPTigovDnBXN7wA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2fe3fb8e36bso2948213f8f.0
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682407937; x=1684999937;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XE26/cpf9oLyW6D/ufScImV/wM6gcgyln3vZLDrJs8Y=;
 b=ToAXRYp0D4oYcRSGbco+vZIXXBXE9ZrEYHM5X/Sw7WcHZJ2nvuFlRdUSaj5lmw/e/w
 xG0L4x7iCxqcHn2YqGplNCN/5LvID6E1v6BevzdRqKdHRAAB0hyZ4xaf8qdL3xKQZgTG
 wO1ocgVHXlu8dD4o5sMMuYTOwzO3gqsCyjQDTlEoMSkwddFkRUweMR9aRmW5/Oby0s9Y
 L1booJl5CNK/lgIbPJg+mggLh8ynz2sfPjRo+bdNDBeBe1T3FOPTsFXF/nZQMR5QqMC6
 e/nC4ATseJYZVVyd1cEVR1KetafjmGOlfbcOsWXmxmb8rnRRm9URiGLmIJPINvjVUCCe
 0qqA==
X-Gm-Message-State: AAQBX9e8PGAU7g0g7UUHcxLQ2W6p+TW5E/bAkxTRYsUsnRI6uHsKNLMO
 4kkF6R/Cai7bUY1l6jVRj/DaBUMY/6fDFxmMv8hDzz/8XK9D9dBU+0nm9Ezhiig6kVd8jo708hH
 WjOvwiLBsov5zebU=
X-Received: by 2002:a5d:4563:0:b0:2ef:b433:2942 with SMTP id
 a3-20020a5d4563000000b002efb4332942mr11611118wrc.21.1682407937094; 
 Tue, 25 Apr 2023 00:32:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZQCfjujh3qa6g2A0Hdghk4SGJBf+XyK8sOu0fOgZi1ewzRoDmy+k5Wsi/u6Sm9hdpW3aIQsg==
X-Received: by 2002:a5d:4563:0:b0:2ef:b433:2942 with SMTP id
 a3-20020a5d4563000000b002efb4332942mr11611099wrc.21.1682407936816; 
 Tue, 25 Apr 2023 00:32:16 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a5d6e07000000b003048084a57asm2831785wrz.79.2023.04.25.00.32.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 00:32:15 -0700 (PDT)
Message-ID: <a40d5fb7-575c-bdfb-a9f7-4ae87cc7773f@redhat.com>
Date: Tue, 25 Apr 2023 09:32:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v8 1/8] memory: prevent dma-reentracy issues
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>
References: <20230421142736.2817601-1-alxndr@bu.edu>
 <20230421142736.2817601-2-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230421142736.2817601-2-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.194, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/04/2023 16.27, Alexander Bulekov wrote:
> Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
> This flag is set/checked prior to calling a device's MemoryRegion
> handlers, and set when device code initiates DMA.  The purpose of this
> flag is to prevent two types of DMA-based reentrancy issues:
> 
> 1.) mmio -> dma -> mmio case
> 2.) bh -> dma write -> mmio case
> 
> These issues have led to problems such as stack-exhaustion and
> use-after-frees.
> 
> Summary of the problem from Peter Maydell:
> https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1282
> Resolves: CVE-2023-0330
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>   include/exec/memory.h  |  2 ++
>   include/hw/qdev-core.h |  7 +++++++
>   softmmu/memory.c       | 14 ++++++++++++++
>   softmmu/trace-events   |  1 +
>   4 files changed, 24 insertions(+)

Reviewed-by: Thomas Huth <thuth@redhat.com>



