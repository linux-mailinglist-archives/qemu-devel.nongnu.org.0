Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4928E463A34
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 16:36:24 +0100 (CET)
Received: from localhost ([::1]:50106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms5B6-0003HE-Jp
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 10:36:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1ms594-0001HH-2V
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 10:34:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1ms591-0003SK-B1
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 10:34:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638286450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9qe448Dkogpc5XjmBcouLjGtGeEJpp1aZFFhOSJNopw=;
 b=R8Kom7uTZ+M440T/iTfQk6smb7m/zdqZyzE52JpqONvaYT+23Vg0DYdK/sr0sn5xP8KW+v
 rDGOgUmpeHN1bKiwg/aHP9xcxT0U4flJU7Np2qNpqAB9B5EzHqax6J+z52kONZdMCaqLF+
 FhtxDPdgh4s2CjGDOOY5DP3gVTmfQ1Q=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-k30AotjAMnqC8aigMpkpBw-1; Tue, 30 Nov 2021 10:34:07 -0500
X-MC-Unique: k30AotjAMnqC8aigMpkpBw-1
Received: by mail-ed1-f71.google.com with SMTP id
 p4-20020aa7d304000000b003e7ef120a37so17221256edq.16
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 07:34:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9qe448Dkogpc5XjmBcouLjGtGeEJpp1aZFFhOSJNopw=;
 b=D2iKYNQd+ZQfx/xWQjkhR3vESoB1GkOmY2D3E/Euryv+hTvdQnShipubHg/bIxPKKA
 dhPXA8O1QwycrNQBIGcl7gZvumiIPiuYt4px4t3SpJ9lBGTZcDbYlDVeDmz7M3YPP6fb
 DhmhvS8ABJYizgbo5BzM0w35tVHMa8eDdsyHS5uuf2Qg3miZoOtSR2LTEezpm2Ix+qYv
 XS7Q0XQT81HHAovZMl4roGlfpPQ5l+IT/y3VImITvXnspF6mMXRm2ayP6OPW+7ZFYHLd
 gsx6RvIodV81nRt+aQTJulcbvc1fJL306tAdhhB6XhBMgjaK8xPPLyRNQt1/gtY+tMYF
 6D/w==
X-Gm-Message-State: AOAM531KCv03TR+0CoK//GyvccOl+82vJVqfOBU2Se9egH/cSLbDVccf
 ADkfQkPzJlUSiz+6SuA1Aj5lvEQqFjiQIBe9VGCc97wtKcRFApGoPJ1r1RpNzOCqQINIaNi2yrH
 C0Zbe/HAxTyVa14s=
X-Received: by 2002:a17:907:961e:: with SMTP id
 gb30mr68011725ejc.436.1638286446014; 
 Tue, 30 Nov 2021 07:34:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJye9TZQSDXun94yASwlWKr0oGffcV2IS/7dVbu+ZJTgsXHnr6NMjFx2vbnQw6zbzW68K2tRmg==
X-Received: by 2002:a17:907:961e:: with SMTP id
 gb30mr68011687ejc.436.1638286445764; 
 Tue, 30 Nov 2021 07:34:05 -0800 (PST)
Received: from [10.43.2.64] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id d23sm3780409edq.51.2021.11.30.07.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 07:34:05 -0800 (PST)
Message-ID: <e83221df-1a1d-6b74-ea29-84a1f5558258@redhat.com>
Date: Tue, 30 Nov 2021 16:34:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v1 1/3] linux-headers: sync
 VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20211130092838.24224-1-david@redhat.com>
 <20211130092838.24224-2-david@redhat.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <20211130092838.24224-2-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.211, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Gavin Shan <gshan@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Hui Zhu <teawater@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/21 10:28, David Hildenbrand wrote:
> TODO: replace by a proper header sync.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/standard-headers/linux/virtio_mem.h | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/include/standard-headers/linux/virtio_mem.h b/include/standard-headers/linux/virtio_mem.h
> index 05e5ade75d..18c74c527c 100644
> --- a/include/standard-headers/linux/virtio_mem.h
> +++ b/include/standard-headers/linux/virtio_mem.h
> @@ -68,9 +68,10 @@
>   * explicitly triggered (VIRTIO_MEM_REQ_UNPLUG).
>   *
>   * There are no guarantees what will happen if unplugged memory is
> - * read/written. Such memory should, in general, not be touched. E.g.,
> - * even writing might succeed, but the values will simply be discarded at
> - * random points in time.
> + * read/written. In general, unplugged memory should not be touched, because
> + * the resulting action is undefined. There is one exception: without
> + * VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE, unplugged memory inside the usable
> + * region can be read, to simplify creation of memory dumps.
>   *
>   * It can happen that the device cannot process a request, because it is
>   * busy. The device driver has to retry later.
> @@ -87,6 +88,8 @@
>  
>  /* node_id is an ACPI PXM and is valid */
>  #define VIRTIO_MEM_F_ACPI_PXM		0
> +/* unplugged memory must not be accessed */
> +#define VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE	1
>  
>  
>  /* --- virtio-mem: guest -> host requests --- */
> 

This is verbatim copy of kernel commit of 61082ad6a6e1f.

Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

Michal


