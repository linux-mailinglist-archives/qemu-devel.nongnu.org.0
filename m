Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B94525528
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 20:52:34 +0200 (CEST)
Received: from localhost ([::1]:40760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npDvN-0006LU-Ax
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 14:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1npCvE-0002lU-FP
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:48:29 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:36641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1npCvB-0000De-FS
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:48:19 -0400
Received: by mail-pl1-x62f.google.com with SMTP id j14so5618749plx.3
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yMD4uNcX7nwJRnfdov6l+Is8lhR7QoKly26xhU/0yCM=;
 b=a2DxECy3eU2zyy4MddAkOcv2PBd76rNd44QMgMnvMmwYbizg7/qmN6Qry+idDfEa36
 z517rwt2kQOpPDjXoea53NJy/Myh6GWaa/TkS4GWoL64X8z0bzz5/jeeDx29hbvSWGfh
 WfNuOrkWFieGm4hfYIE0zCBngCJ9QfNm33QnCImYHgYmtySHb/olqw7UlScYH7sGOFLJ
 8lHE8hmDdpBWW3equ5E3jC4nyLnAuUrz9H/uHxc0uMUzJxtU6i6o2BadFo69ERA1vlBF
 S2e2yRCeqBj67pm1pblK+nlk2eDgIEDWMHsfwi0V4f2kZ5g5E+8yTmAd8GP7H2C5WDwh
 A0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yMD4uNcX7nwJRnfdov6l+Is8lhR7QoKly26xhU/0yCM=;
 b=TJhA8cnu7mmgeIciV9YTUIj5mcWqIOwaZJV6590CuXm6E6EiJhiJa3Gfl/KyWmgJb1
 wGnBS2D2JkaMm4SUbWj0GSMeBbWtUWpzK3V16CTn9+wV+izZxZrFEP3XzFsXMCI6gl+m
 EhOOa9QHMSDW5h5Z105DHQrkxo/VSiAB5BTW8rpB6is/xASoVOChV2eViXkl6mjHRWHc
 k/7bFqMkc8sAkoVNZbzTA1fQOiqbDn/8XkZLR8QDad/2ajoPUWWKMgrsmRlvg4uNIxYc
 DOfxTPWKQDX/I6E7rUu6UL8sDIeSGrVJ4KVMBXBioUBQ9BiC8jKLLnsSkfbvM7BrRZi7
 pyhw==
X-Gm-Message-State: AOAM533vz6VqCw/vnKhqajjrfWTxeb5TNwZAl0q7FrCq/dx85Q87R5Fu
 Q7yekW13PGQHDHDf9tyBNtk=
X-Google-Smtp-Source: ABdhPJzw+EbrJ6LJX96DmLzDfijMzsCp2s5e8tWVo6Nucj0Rqn9n2uyDg0zvF4QPYr4qTymAJVRNsw==
X-Received: by 2002:a17:902:7d89:b0:15e:e999:6b88 with SMTP id
 a9-20020a1709027d8900b0015ee9996b88mr1005914plm.98.1652377696104; 
 Thu, 12 May 2022 10:48:16 -0700 (PDT)
Received: from localhost ([192.55.54.48]) by smtp.gmail.com with ESMTPSA id
 i15-20020a655b8f000000b003c14af505fesm25838pgr.22.2022.05.12.10.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:48:15 -0700 (PDT)
Date: Thu, 12 May 2022 10:48:14 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>, isaku.yamahata@intel.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com
Subject: Re: [RFC PATCH v4 10/36] i386/kvm: Move architectural CPUID leaf
 generation to separate helper
Message-ID: <20220512174814.GE2789321@ls.amr.corp.intel.com>
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
 <20220512031803.3315890-11-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220512031803.3315890-11-xiaoyao.li@intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, May 12, 2022 at 11:17:37AM +0800,
Xiaoyao Li <xiaoyao.li@intel.com> wrote:

> diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
> index b434feaa6b1d..5c7972f617e8 100644
> --- a/target/i386/kvm/kvm_i386.h
> +++ b/target/i386/kvm/kvm_i386.h
> @@ -24,6 +24,10 @@
>  #define kvm_ioapic_in_kernel() \
>      (kvm_irqchip_in_kernel() && !kvm_irqchip_is_split())
>  
> +#define KVM_MAX_CPUID_ENTRIES  100

In Linux side, the value was bumped to 256.  Opportunistically let's make it
same.

3f4e3eb417b1 KVM: x86: bump KVM_MAX_CPUID_ENTRIES

> +uint32_t kvm_x86_arch_cpuid(CPUX86State *env, struct kvm_cpuid_entry2 *entries,
> +                            uint32_t cpuid_i);
> +
>  #else
>  
>  #define kvm_pit_in_kernel()      0
> -- 
> 2.27.0
> 
> 

-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

