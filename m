Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD4E38C347
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 11:36:05 +0200 (CEST)
Received: from localhost ([::1]:41462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk1Zb-0003Ai-Lz
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 05:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1lk1W5-0001Dy-4H
 for qemu-devel@nongnu.org; Fri, 21 May 2021 05:32:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1lk1W2-00037T-LG
 for qemu-devel@nongnu.org; Fri, 21 May 2021 05:32:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621589540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YRftKvJEhe26LE0jXDhzfwXfpW9ZQCt/u/zjiDPwli4=;
 b=ByfnnpqytKxG0XSWHASKu1x6a8qrDCnAS2TytvijPE1dxpWKRHb4FyiHfQp04lC6AFKD+G
 oZA9qtFrFVEHP9QMJwq5jBoJR9sYZ1ihBu2lbnqfurd8hWmLdJDiaCFj8Uh8kMMUZN33nP
 tNjoNfswdT9cT+C/MYPcum3UE63CYRM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-24nfJZGoMb6ABMt9tPet8w-1; Fri, 21 May 2021 05:32:19 -0400
X-MC-Unique: 24nfJZGoMb6ABMt9tPet8w-1
Received: by mail-wm1-f72.google.com with SMTP id
 z25-20020a7bc7d90000b0290181c7ca930eso115651wmk.3
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 02:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YRftKvJEhe26LE0jXDhzfwXfpW9ZQCt/u/zjiDPwli4=;
 b=njuSQlJjk9jCxrWgiQ6g1P7ZdItuMJikDZowRjcrb0XzaB5797+c9/kvrnF55aDfSz
 Ge8kNxBETXxCkhCuU/jHd3RyXjU/w7PdhGg1X3eRKBFhdIamt4rrhqTcnaa73UYICtgA
 gB86T3ub8Q8kIZgk2GnmwRVW+VHdY3Sar56q4mZcnFHsbq9QBhl5o8XpiPlUxdEHBYU9
 01F/Bsr3pNIN3eC1T9K2Mqj2LSzD+UdCxDfJTpPplp9+NQD4U4nHW1OnszP7KOoQ/YWx
 Jzi43OfFFEomoFbu+HrOoLAAOSshYjnyxaMFvctHLUrNmNPEiXrBBFlV79DEnh5lzisB
 g/lw==
X-Gm-Message-State: AOAM531+puiGr9BrNwyh/BreBh0ac5stwE+nlYxqTcXw5SMMbh/T+bSr
 y+HYotUqaK/bdP0WgTOmoU+BuI/5m71mMrJrc23pfKvGhS9aXqCkDX8ZRcGbQsc8A4QdmSdJiZ0
 h3NbSANv6RJ8EhjQ=
X-Received: by 2002:a05:600c:154e:: with SMTP id
 f14mr8412597wmg.36.1621589538204; 
 Fri, 21 May 2021 02:32:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5oYXEW0w81Ak3232PF9HWecKelXNnq57LrU5YlMscVTWTAG5UUCcNZf6s241I04ZbNBOs9Q==
X-Received: by 2002:a05:600c:154e:: with SMTP id
 f14mr8412580wmg.36.1621589538032; 
 Fri, 21 May 2021 02:32:18 -0700 (PDT)
Received: from ?IPv6:2a01:4240:5f52:a011::110? ([2a01:4240:5f52:a011::110])
 by smtp.gmail.com with ESMTPSA id x11sm1433376wrl.13.2021.05.21.02.32.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 02:32:17 -0700 (PDT)
Subject: Re: [PULL 12/25] virtio-gpu: move virgl realize + properties
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210510132051.2208563-1-kraxel@redhat.com>
 <20210510132051.2208563-13-kraxel@redhat.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
Message-ID: <a86e2a07-a803-cd00-849e-96a30e8839d3@redhat.com>
Date: Fri, 21 May 2021 11:32:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210510132051.2208563-13-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/10/21 3:20 PM, Gerd Hoffmann wrote:
> Move device init (realize) and properties.
> 
> Drop the virgl property, the virtio-gpu-gl-device has virgl enabled no
> matter what.  Just use virtio-gpu-device instead if you don't want
> enable virgl and opengl.  This simplifies the logic and reduces the test
> matrix.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Message-id: 20210430113547.1816178-1-kraxel@redhat.com
> Message-Id: <20210430113547.1816178-4-kraxel@redhat.com>
> ---
>  include/hw/virtio/virtio-gpu.h |  1 +
>  hw/display/virtio-gpu-gl.c     | 33 +++++++++++++++++++++++++++++++++
>  hw/display/virtio-gpu.c        | 23 +----------------------
>  3 files changed, 35 insertions(+), 22 deletions(-)
> 

> @@ -1251,12 +1236,6 @@ static Property virtio_gpu_properties[] = {
>      VIRTIO_GPU_BASE_PROPERTIES(VirtIOGPU, parent_obj.conf),
>      DEFINE_PROP_SIZE("max_hostmem", VirtIOGPU, conf_max_hostmem,
>                       256 * MiB),
> -#ifdef CONFIG_VIRGL
> -    DEFINE_PROP_BIT("virgl", VirtIOGPU, parent_obj.conf.flags,
> -                    VIRTIO_GPU_FLAG_VIRGL_ENABLED, true),
> -    DEFINE_PROP_BIT("stats", VirtIOGPU, parent_obj.conf.flags,
> -                    VIRTIO_GPU_FLAG_STATS_ENABLED, false),
> -#endif
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> 

Sorry for catching this a bit late, but libvirt is looking for "virgl"
property when guest XML has 3D acceleration enabled:

    <video>
      <model type='virtio' heads='1' primary='yes'>
        <acceleration accel3d='yes'/>
      </model>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x02'
function='0x0'/>
    </video>

This is the corresponding part of cmd line:

  -device virtio-vga,id=video0,virgl=on,max_outputs=1,bus=pci.0,addr=0x2

The commit message suggests that virtio-gpu-gl-device should be used
instead. Fair enough, so IIUC the cmd line should be changed to:

  -device virtio-gpu-gl-device,id=video0,max_outputs=1,bus=pci.0,addr=0x2


Michal


