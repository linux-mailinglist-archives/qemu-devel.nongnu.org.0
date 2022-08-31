Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430B05A7E4B
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 15:09:58 +0200 (CEST)
Received: from localhost ([::1]:57716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTNTh-0007Ko-Cb
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 09:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oTNPJ-0002Ah-01
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:05:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oTNPF-0003j3-T5
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661951120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q5dV2zCvAlOv7vYN6r9UAWLrQOoq+lE+SlipLzsRwko=;
 b=e/IhT+iX78Zijvk7X27KBoAMbEk73tjwhQ+A30LoIRl+BWkSJnP6IT62l2DaOMweXc1E0Z
 vmqmENDsT8gHd4IgLniKxdEeYgFzDznYDT0cH9JOIG7ZT4TQsoDeSa+o2P4TTt3rJtA7IY
 NZ4RscF8ppZlGpGiZf4CIIRwJxPYBk4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-654-uqMNQYRNO4C2T_iXii9W2Q-1; Wed, 31 Aug 2022 09:05:18 -0400
X-MC-Unique: uqMNQYRNO4C2T_iXii9W2Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 r7-20020adfbb07000000b00225b9579132so2352607wrg.6
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 06:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=Q5dV2zCvAlOv7vYN6r9UAWLrQOoq+lE+SlipLzsRwko=;
 b=FtoSuMYPx2k+IyjQLRu7hGqE/0BBO+LsR8C/vv44GEQYVfLqjr6Mem+h28na+hj9S7
 pUxAG6lzE8AP806hdHKnZHl9X7lhLQGEnUIALy7pt1KqQjQz5FS+9aBx9kdDNfKeWIL9
 X2gaktrHu0o4OQzaceIfRzqsGcqhZg2yRFL8nNIIWQcZtzIMOvDLiKQzbVeLvBjN+9cA
 ZlQRJBffRKveZQQeHZfUIRfxQR7FTNBVzUA1GgVaJckOR7rDsYo9qJbAq9b0uhWMO/D/
 p7KxR5+qvs19nppQr7/ofkNxmfaRtLVx0UJ3fK51XclPdzcFS7yGgf/0ZNsKAq389eEK
 hOvg==
X-Gm-Message-State: ACgBeo3abVX4d1o2AAhOOQK/wQ2WkCfxkdAOaiIpE2s4tO+xus7XTYFE
 VWS9ydbIyDQUGRacezYndxCIkyC0TFbA47QIAO7E0X96W6fO82Xi9LoOuBa1DO4GN0SJv+hWyWX
 yL+iIe/KszvqEnUM=
X-Received: by 2002:a05:6000:788:b0:226:e9cd:9fb8 with SMTP id
 bu8-20020a056000078800b00226e9cd9fb8mr2215599wrb.127.1661951117552; 
 Wed, 31 Aug 2022 06:05:17 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4zYvoJRfps/XtV7L2yjT5RVAdA8EQ3uD4h0op1VEqpf2Gu3DmVTuvX//SMyomQn3htXqVVXA==
X-Received: by 2002:a05:6000:788:b0:226:e9cd:9fb8 with SMTP id
 bu8-20020a056000078800b00226e9cd9fb8mr2215582wrb.127.1661951117360; 
 Wed, 31 Aug 2022 06:05:17 -0700 (PDT)
Received: from redhat.com ([2.55.191.225]) by smtp.gmail.com with ESMTPSA id
 o14-20020a05600c058e00b003a5ad7f6de2sm2172755wmd.15.2022.08.31.06.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 06:05:16 -0700 (PDT)
Date: Wed, 31 Aug 2022 09:05:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH 1/2] [hack] reserve bit KVM_HINTS_HOST_PHYS_BITS
Message-ID: <20220831090215-mutt-send-email-mst@kernel.org>
References: <20220831125059.170032-1-kraxel@redhat.com>
 <20220831125059.170032-2-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831125059.170032-2-kraxel@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 31, 2022 at 02:50:58PM +0200, Gerd Hoffmann wrote:
> The KVM_HINTS_HOST_PHYS_BITS bit indicates that qemu has host-phys-bits
> turned on.  This implies the guest can actually work with the full
> available physical address space as advertised by CPUID(0x80000008).
> 
> Temporary hack for RfC patch and testing.  This change must actually be
> done in the linux kernel, then picked up by qemu via header file sync.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/standard-headers/asm-x86/kvm_para.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/standard-headers/asm-x86/kvm_para.h b/include/standard-headers/asm-x86/kvm_para.h
> index f0235e58a1d3..105b958c0f56 100644
> --- a/include/standard-headers/asm-x86/kvm_para.h
> +++ b/include/standard-headers/asm-x86/kvm_para.h
> @@ -37,7 +37,8 @@
>  #define KVM_FEATURE_HC_MAP_GPA_RANGE	16
>  #define KVM_FEATURE_MIGRATION_CONTROL	17
>  
> -#define KVM_HINTS_REALTIME      0
> +#define KVM_HINTS_REALTIME              0
> +#define KVM_HINTS_HOST_PHYS_BITS        1
>  
>  /* The last 8 bits are used to indicate how to interpret the flags field
>   * in pvclock structure. If no bits are set, all flags are ignored.


Just a clarification.
I think what the bit means is that physical address size
data in cpuid is valid.
Accordingly I would rename it to

+#define KVM_HINTS_PHYS_ADDRESS_SIZE_DATA_VALID        1


or some such.


> -- 
> 2.37.2


