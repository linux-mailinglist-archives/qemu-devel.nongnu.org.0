Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796903EE71B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 09:25:19 +0200 (CEST)
Received: from localhost ([::1]:34410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFtTK-0002dU-GB
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 03:25:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mFtSF-0001jW-9U
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 03:24:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mFtSD-0001Hs-Pb
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 03:24:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629185048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iUAMDeO6pJ+tuAVDt1fpgCcaxa/AwaEpb2Ou4hn427o=;
 b=XADgf/xrhinnmc1gM4pdf5vnK6jYQRkuqBMmiIGrV898flmNnGhFy4ZK9Xfe9d2mVvzOj1
 zdEQYJ1AMvLrEJT6fDIKgP/wQP3ft7bCWOE10KnTVV7nRlOzN7uh6FSrEL/sLGRbYjz0vR
 KDsGuJVkUVVLxFNMoY1rz2tbur5DqpI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-NL7GxSbmPiOD0y5q0dz0Hg-1; Tue, 17 Aug 2021 03:24:07 -0400
X-MC-Unique: NL7GxSbmPiOD0y5q0dz0Hg-1
Received: by mail-wr1-f71.google.com with SMTP id
 p2-20020a5d48c20000b0290150e4a5e7e0so6204084wrs.13
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 00:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=iUAMDeO6pJ+tuAVDt1fpgCcaxa/AwaEpb2Ou4hn427o=;
 b=IWoyk1nmQb3eq102cx9lBieR9OSK3vgW+6p8cIvHWQ0fUEgeEyS9+YCwWpF7n76f7+
 w9/hopWmuyinm5IhiQ41O7akz+3VpyEUB/4ik3ibOh3Pb+rGyqjR6OxGejEMFX0WA+5k
 53y9KiE2gybcF5uRTr7OU/3MqJR3kZsl/ig9IeRT5QqFagR5KcLrnUaY2Y5xHOtls+Ru
 GZR3qg2SS0h2j/YMRel/pDbYhgBrTtjjicYMlWCAm5TVGAe+VcXwjKtLe01DsJCkBg0i
 OHRhKwIDDTd72FEYqRv54Rw83U87eHaeYGriJ+qADK+wvP133X8iDS67bIEzER7cdlYE
 ppWQ==
X-Gm-Message-State: AOAM5336xuKmu7Sj76mWrH1ReFO3d9HXF1RgqtHGQv5RD7/iZ055BPLp
 HmMP3i6IJYZLqXDXaciqCeIUGpRFKnWbr7YzYXJHvU3/5f1rJ+ihzcG2rMb5TT5zato7i/fEh/i
 t7vPt4tJd7HOX4KU=
X-Received: by 2002:a05:6000:114d:: with SMTP id
 d13mr2211536wrx.295.1629185046432; 
 Tue, 17 Aug 2021 00:24:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2ye+fkHeeRzIgZxgAAaG3pBnL6JWPd8qfG2RJUvxguqcHYFElqJLmlI/sewE/xSNm1jzq7Q==
X-Received: by 2002:a05:6000:114d:: with SMTP id
 d13mr2211522wrx.295.1629185046292; 
 Tue, 17 Aug 2021 00:24:06 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c65c6.dip0.t-ipconnect.de. [91.12.101.198])
 by smtp.gmail.com with ESMTPSA id d9sm1337816wrw.26.2021.08.17.00.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 00:24:05 -0700 (PDT)
Subject: Re: [PATCH RESEND 1/2] memory: Name all the memory listeners
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210817013553.30584-1-peterx@redhat.com>
 <20210817013553.30584-2-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <504a7fc3-59ea-257c-b516-3fbb26f31de0@redhat.com>
Date: Tue, 17 Aug 2021 09:24:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817013553.30584-2-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.08.21 03:35, Peter Xu wrote:
> Provide a name field for all the memory listeners.  It can be used to identify
> which memory listener is which.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   accel/hvf/hvf-accel-ops.c         | 1 +
>   accel/kvm/kvm-all.c               | 7 +++++--
>   hw/i386/xen/xen-hvm.c             | 2 ++
>   hw/intc/openpic_kvm.c             | 1 +
>   hw/remote/proxy-memory-listener.c | 1 +
>   hw/vfio/common.c                  | 1 +
>   hw/vfio/spapr.c                   | 1 +
>   hw/virtio/vhost-vdpa.c            | 1 +
>   hw/virtio/vhost.c                 | 2 ++
>   hw/virtio/virtio.c                | 1 +
>   hw/xen/xen_pt.c                   | 2 ++
>   include/exec/memory.h             | 8 ++++++++
>   include/sysemu/kvm_int.h          | 2 +-
>   softmmu/physmem.c                 | 1 +
>   target/arm/kvm.c                  | 1 +
>   target/i386/hax/hax-mem.c         | 1 +
>   target/i386/kvm/kvm.c             | 2 +-
>   target/i386/nvmm/nvmm-all.c       | 1 +
>   target/i386/whpx/whpx-all.c       | 1 +
>   19 files changed, 33 insertions(+), 4 deletions(-)
> 


[...]

>   static const MemoryListener xen_pt_io_listener = {
> +    .name = "xen-pt-io",
>       .region_add = xen_pt_io_region_add,
>       .region_del = xen_pt_io_region_del,
>       .priority = 10,
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index c3d417d317..ac79fee250 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -979,6 +979,14 @@ struct MemoryListener {
>        */
>       unsigned priority;
>   
> +    /**
> +     * @name:
> +     *
> +     * Name of the listener.  It can be used in contexts where we'd like to
> +     * identify one memory listener with the rest. > +     */

Not a native speaker, maybe simply "Name of the listener, primarily 
useful for debugging. Names can change in the future and are not fixed."

Apart from that LGTM

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


