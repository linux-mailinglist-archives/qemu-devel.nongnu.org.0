Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0456F68FA10
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 23:09:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPsbZ-0004MA-K4; Wed, 08 Feb 2023 17:07:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPsbX-0004LT-U1
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 17:07:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPsbW-0001SS-E7
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 17:07:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675894069;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=bMVLDa7WL4wVCBGtc5eUGVnT7CMRQqtQ/0eqVzvAIkY=;
 b=X89avjm/0iMnp/AXxMIzo5WnKMgN1stSoJ5I1ZpSOpGhYS/Tdapu4HHYa27ISVBSiW24//
 oQLsmZhkUxumfJzN323etC0dADoN2PL4jO+zeuRbhau3TPsqTz03hZczFdmxT2svtY3vxf
 XdV8IEqDDn86z5Pyw8MUBqDhxZfdaT4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-167-HspYIrRoPyqOSQ9SjoqffQ-1; Wed, 08 Feb 2023 17:07:48 -0500
X-MC-Unique: HspYIrRoPyqOSQ9SjoqffQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 fl9-20020a05600c0b8900b003dfe4bae099so107578wmb.0
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 14:07:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bMVLDa7WL4wVCBGtc5eUGVnT7CMRQqtQ/0eqVzvAIkY=;
 b=3YCctrqxbS+WuOtMYeeEnryFbi1vU1JusJ7t3A9kaBcyy+739qJNwqCiN7m13SN2g+
 y1msR5A2vG4II8hh1hRKS6j1ljzQUdLRcfbRM34TzXOTsshqdRAqK8ycd7Aewt++9/3a
 t42j1KkMqe1nE+esMgBiQtKeWeEBSlsiZmnYavFQdCUIehq99gSRkcPtG3ZJcTR6OLK8
 o+YkEVaqnsZCG6sFcCPK3/enrzj3JlRsOy/RsMGArKraSLHKcGgDIWOsGkFgBMrM3E5y
 i9SvfereHoBV9tGI4127rxuN2IlEvGUz5Q1uAWjyokgz7I2IVIR8jFCKL/WA5BlQDmXU
 gldA==
X-Gm-Message-State: AO0yUKXQFW3mjDAYypKuLBRpGqb5TAvj2oMIdSQ6xTMNRowVHsa3RCLg
 0cjqaumKvPGcU1prWAT7JLLYlPqlq42QliIJxulOQQqYY4HmnnpMFnCiDI3hMCzi/7oD03wIhIs
 iRxcCvC21WdoT62A=
X-Received: by 2002:adf:f60f:0:b0:2c3:dc62:e680 with SMTP id
 t15-20020adff60f000000b002c3dc62e680mr8081521wrp.30.1675894064883; 
 Wed, 08 Feb 2023 14:07:44 -0800 (PST)
X-Google-Smtp-Source: AK7set8jAIQi7HcZYZvh152Z2rPtzjqfCsVHCtXLRLieQ/MWinVDsAQFN66VbnQAcB0e+J9NIYcy2Q==
X-Received: by 2002:adf:f60f:0:b0:2c3:dc62:e680 with SMTP id
 t15-20020adff60f000000b002c3dc62e680mr8081498wrp.30.1675894064571; 
 Wed, 08 Feb 2023 14:07:44 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 d17-20020adff851000000b002c3dd82a0e9sm11699673wrq.91.2023.02.08.14.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 14:07:43 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  pbonzini@redhat.com,
 peter.maydell@linaro.org,  peterx@redhat.com,  david@redhat.com,
 philmd@linaro.org,  mst@redhat.com,  cohuck@redhat.com,
 dgilbert@redhat.com,  maz@kernel.org,  zhenyzha@redhat.com,
 shan.gavin@gmail.com
Subject: Re: [PATCH RFCv1 4/8] kvm: Introduce secondary dirty bitmap
In-Reply-To: <20230206112010.99871-5-gshan@redhat.com> (Gavin Shan's message
 of "Mon, 6 Feb 2023 19:20:06 +0800")
References: <20230206112010.99871-1-gshan@redhat.com>
 <20230206112010.99871-5-gshan@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 08 Feb 2023 23:07:42 +0100
Message-ID: <87k00r95g1.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Gavin Shan <gshan@redhat.com> wrote:
> When dirty ring is enabled on ARM64, the backup bitmap may be used
> to track the dirty pages in no-running-vcpu situations. The original
> bitmap is the primary one, used for the dirty ring buffer. We need
> the secondary bitmap to collect the backup bitmap for ARM64.
>
> No functional change intended.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  accel/kvm/kvm-all.c      | 50 ++++++++++++++++++++++++++++++----------
>  include/sysemu/kvm_int.h |  1 +
>  2 files changed, 39 insertions(+), 12 deletions(-)
>
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 01a6a026af..1a93985574 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -553,13 +553,29 @@ static void kvm_log_stop(MemoryListener *listener,
>      }
>  }
>  
> +static unsigned long *kvm_slot_dirty_bitmap(KVMSlot *slot, bool primary)
> +{
> +    if (primary) {
> +        return slot->dirty_bmap;
> +    }
> +
> +    return slot->dirty_bmap +
> +           slot->dirty_bmap_size / sizeof(slot->dirty_bmap[0]);
> +}


Why?
Just use two bitmaps and call it a day.

Later, Juan.


