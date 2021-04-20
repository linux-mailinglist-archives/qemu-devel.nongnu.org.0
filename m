Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3393F365624
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 12:28:15 +0200 (CEST)
Received: from localhost ([::1]:45368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYnc6-00079W-8I
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 06:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYnZW-000647-9T
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:25:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYnZS-0005iJ-V3
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:25:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618914330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NIza8JwVI0nKRgUrDbTIvq62ysUBiJYq88c0Gp+nce4=;
 b=ezs5S9bcFm+lMsmq9TxUDh8nAAnEfxJnEY7RjdJiPgohB0wECRB+++iOu6aM9dvwEU4uwn
 WEa6gMbE3ozHHDjAmEvfxvbT80bD2rwm12HOPl5R6YyqhPaL7hdRMxzxgHJCjp9Ux+yb6M
 yacEMckpxiK7vRB4M1XRcfXr2p3C6s8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-tY_hOVY7Nb6S_sx2A0EBQw-1; Tue, 20 Apr 2021 06:25:28 -0400
X-MC-Unique: tY_hOVY7Nb6S_sx2A0EBQw-1
Received: by mail-wm1-f70.google.com with SMTP id
 j128-20020a1c55860000b02901384b712094so771075wmb.2
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 03:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NIza8JwVI0nKRgUrDbTIvq62ysUBiJYq88c0Gp+nce4=;
 b=iJ4f+ZUbcwMGFVL5QLaJ7EGMZPibmyknlB+NhpY7oby4a3w0dFaAiSRUz+OqrlMco5
 IxYa+fuNLIYQOA2MkXi560EVS8TRtMT/SZb0AuUxYMth6n2CefwUfPiUrvKKZjQ/0RXz
 ZUaZgiDITnHXUy/S9wqJU6rOo2PiRYB6AMHja93nNQyIhebxjI+bw90ykKCfMECfGG/m
 T6PyUbmGr4Tt1VVy736inGniS02+GKEsKXJV7tR5XguiT52U6qFJvhX/I2uvr5S8sS1T
 QJx9Bpnx4C+8Uulqk1j5i2gwz22vbH8ys0xz6nJEk+oKPIouIiiaf6Rv7rtgdoWniwPR
 C4rg==
X-Gm-Message-State: AOAM531vAe7CPEp414Wt6cyxG2F0biQVdS2nn2A8SIHZPk1XnoBsv98q
 IVQfiLaGjQByhfnQNn5PIgVTivwudTHn0A7vo12PVenrWLHvVIv42AiaJBA7cnPNIUKOrIESykR
 hEmIEnmRFwo+AgJA=
X-Received: by 2002:a1c:23c2:: with SMTP id j185mr3624420wmj.67.1618914327628; 
 Tue, 20 Apr 2021 03:25:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCQ05+FDhZiNj1FgOCGhKvElU6uiQH4p4DTEiabHlq56zEuhf7Ak7a4OuaX7KdrYjXAx0tdA==
X-Received: by 2002:a1c:23c2:: with SMTP id j185mr3624399wmj.67.1618914327484; 
 Tue, 20 Apr 2021 03:25:27 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id c1sm26218214wrx.89.2021.04.20.03.25.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 03:25:27 -0700 (PDT)
Subject: Re: [PATCH v5 07/14] memory: Introduce RAM_NORESERVE and wire it up
 in qemu_ram_mmap()
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210413091421.7707-1-david@redhat.com>
 <20210413091421.7707-8-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <09bdc792-2930-f3be-2e2a-b6f0b558c785@redhat.com>
Date: Tue, 20 Apr 2021 12:25:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413091421.7707-8-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 11:14 AM, David Hildenbrand wrote:
> Let's introduce RAM_NORESERVE, allowing mmap'ing with MAP_NORESERVE. The
> new flag has the following semantics:
> 
> "
> RAM is mmap-ed with MAP_NORESERVE. When set, reserving swap space (or huge
> pages if applicable) is skipped: will bail out if not supported. When not
> set, the OS will do the reservation, if supported for the memory type.
> "
> 
> Allow passing it into:
> - memory_region_init_ram_nomigrate()
> - memory_region_init_resizeable_ram()
> - memory_region_init_ram_from_file()
> 
> ... and teach qemu_ram_mmap() and qemu_anon_ram_alloc() about the flag.
> Bail out if the flag is not supported, which is the case right now for
> both, POSIX and win32. We will add Linux support next and allow specifying
> RAM_NORESERVE via memory backends.
> 
> The target use case is virtio-mem, which dynamically exposes memory
> inside a large, sparse memory area to the VM.
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/exec/cpu-common.h |  1 +
>  include/exec/memory.h     | 15 ++++++++++++---
>  include/exec/ram_addr.h   |  3 ++-
>  include/qemu/osdep.h      |  9 ++++++++-
>  migration/ram.c           |  3 +--
>  softmmu/physmem.c         | 15 +++++++++++----
>  util/mmap-alloc.c         |  7 +++++++
>  util/oslib-posix.c        |  6 ++++--
>  util/oslib-win32.c        | 13 ++++++++++++-
>  9 files changed, 58 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


