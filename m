Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8F4400450
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 19:49:38 +0200 (CEST)
Received: from localhost ([::1]:52572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDJp-0002Hj-2X
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 13:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDDp-00058o-8o
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:43:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDDn-0007MN-Ij
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:43:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HToSchqv8B+TwDh08Rs1kk9V3QAdaTIG66Xf3RzZbPg=;
 b=aQr5HA77dRhrBsDbmihd6dZ0Oh995qliMdnuzaoNJDCz5wNiqieUf5ZC1HxqWV9YCa/9y+
 57Vnv2M36ZuKAGiyXe+Hf6hJ8QtJRVxK7hrUomlu91vQP6g/75Ja+tJAen3TOZ6J+mJeOT
 AyWkZh4THNCoMt2S9NBxzAeVrnfuJ4Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-ql76bU2sMcGvGP-8OZRtLA-1; Fri, 03 Sep 2021 13:43:20 -0400
X-MC-Unique: ql76bU2sMcGvGP-8OZRtLA-1
Received: by mail-wm1-f72.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so43814wml.5
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HToSchqv8B+TwDh08Rs1kk9V3QAdaTIG66Xf3RzZbPg=;
 b=TIEyTsoDDAOTdL1M72ZDT5B4UeTyUdXCAkAbOW3vVE96st7RErkr+q7StcjuL/Cy2u
 zUstueaHXcB4rWcy5maxFW5LFKhI/lN7Cnx7GAYyHxxyBJoxG3fAxFscmELxew/2UofK
 Vnd5BPeI8HhC7z1+CJjkiNfT/TQNPuV5QcX7nPY63Mnjx3Z6QQGU/TYOUVl1j3HZ1Dj+
 JRwouUS/gjEDCCFSsYZIJOA/lUUmhx5H5IEdv73agltAyYfcPbSSixkLbpLHbr3xGsLA
 hhrny+s98hwNXKX3xdWGHwufyOdyr4uvXyQITGfC9AQN8xTx129jbXNGVJo1zJpKD/cq
 x6tA==
X-Gm-Message-State: AOAM530KwchMIHkOaazTeEXnmCIKi4huNOnJtI8FRZUCjgJLNytrk5hc
 h0A/kF5nJ+gNVFVFqA4frsaq5x6ACHkj/asFSDSzpupfjYgdJrCZdB0GfT8DbVHAf47+t2j4C1c
 7Vqdr8Nh1/rRUSPI=
X-Received: by 2002:a5d:4591:: with SMTP id p17mr254879wrq.57.1630690998818;
 Fri, 03 Sep 2021 10:43:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz29pGc3wNhfueyaezAd2bBAu3oJuPEypwGo6S1GlWgzN+UF2GB19S4TgbgUfUsFYZd5s7eFw==
X-Received: by 2002:a5d:4591:: with SMTP id p17mr254856wrq.57.1630690998676;
 Fri, 03 Sep 2021 10:43:18 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id m11sm5361480wrz.28.2021.09.03.10.43.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 10:43:18 -0700 (PDT)
Subject: Re: [PATCH v2 00/30] glib: Replace g_memdup() by g_memdup2()
To: qemu-devel@nongnu.org
References: <20210903174008.749126-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b9c2ff43-e663-6204-f7a9-b8c81affc222@redhat.com>
Date: Fri, 3 Sep 2021 19:43:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210903174008.749126-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.888, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 7:39 PM, Philippe Mathieu-Daudé wrote:
> Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
> 
>   The old API took the size of the memory to duplicate as a guint,
>   whereas most memory functions take memory sizes as a gsize. This
>   made it easy to accidentally pass a gsize to g_memdup(). For large
>   values, that would lead to a silent truncation of the size from 64
>   to 32 bits, and result in a heap area being returned which is
>   significantly smaller than what the caller expects. This can likely
>   be exploited in various modules to cause a heap buffer overflow.
> 
> g_memdup() as been deprecated in GLib 2.68. Since QEMU defines
> GLIB_VERSION_MAX_ALLOWED to GLIB_VERSION_2_56, the deprecation
> is not displayed (on GLib >= 2.68 such available on Fedora 34).
> However the function is still unsafe, so it is better to avoid
> its use.
> 
> This series provides the safely equivalent g_memdup2() wrapper,
> and replace all g_memdup() calls by it.
> 
> The previous link recommend to audit the call sites. Most of the
> calls use byte_size=sizeof(STRUCT), and no STRUCT appears to be
>> 4GiB.  Few calls use unsigned/size_t/uint16_t. Where code is
> doing multiplication, patches are sent as RFC. In particular:
>     hw/net/virtio-net.c
>     hw/virtio/virtio-crypto.c
> 
> Since v1:
> - Added missing g_memdup2 -> g_memdup2_qemu compat definition (danpb)
> - Do not call g_memdup2_qemu() but directly g_memdup2() (danpb)
> 
> Philippe Mathieu-Daudé (30):
>   hw/hyperv/vmbus: Remove unused vmbus_load/save_req()
>   glib-compat: Introduce g_memdup2() wrapper
>   qapi: Replace g_memdup() by g_memdup2()
>   accel/tcg: Replace g_memdup() by g_memdup2()
>   block/qcow2-bitmap: Replace g_memdup() by g_memdup2()
>   softmmu: Replace g_memdup() by g_memdup2()
>   hw/9pfs: Replace g_memdup() by g_memdup2()
>   hw/acpi: Avoid truncating acpi_data_len() to 32-bit
>   hw/acpi: Replace g_memdup() by g_memdup2()
>   hw/core/machine: Replace g_memdup() by g_memdup2()
>   hw/hppa/machine: Replace g_memdup() by g_memdup2()
>   hw/i386/multiboot: Replace g_memdup() by g_memdup2()
>   hw/net/eepro100: Replace g_memdup() by g_memdup2()
>   hw/nvram/fw_cfg: Replace g_memdup() by g_memdup2()
>   hw/scsi/mptsas: Replace g_memdup() by g_memdup2()
>   hw/ppc/spapr_pci: Replace g_memdup() by g_memdup2()
>   hw/rdma: Replace g_memdup() by g_memdup2()
>   hw/vfio/pci: Replace g_memdup() by g_memdup2()
>   RFC hw/virtio: Replace g_memdup() by g_memdup2()
>   net/colo: Replace g_memdup() by g_memdup2()
>   RFC ui/clipboard: Replace g_memdup() by g_memdup2()
>   RFC linux-user: Replace g_memdup() by g_memdup2()
>   tests/unit: Replace g_memdup() by g_memdup2()
>   tests/qtest: Replace g_memdup() by g_memdup2()
>   target/arm: Replace g_memdup() by g_memdup2()
>   target/ppc: Replace g_memdup() by g_memdup2()
>   contrib: Replace g_memdup() by g_memdup2()
>   checkpatch: Do not allow deprecated g_memdup()
>   f
>   test

I figured too late I was not placed in the correct commit,
please disregard this incomplete series...


