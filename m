Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB6869013C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 08:26:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ1JK-00053K-Ky; Thu, 09 Feb 2023 02:25:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1pQ1JH-000535-De
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 02:25:35 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1pQ1JF-00016v-8o
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 02:25:34 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 v18-20020a17090ae99200b00230f079dcd9so5219885pjy.1
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 23:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rmVDDhkBD33dRebxUB6WkABikP1v8rHGLOz9oy+lzOw=;
 b=Qqsr8VuFj/cb61lWwBfIJiwftaSsXtTbIODDj9kMRlVfS2CUTcXAcnkVENwaHeFXCc
 eXeZ9Y66+6ildCk3obb8k3r83H0DWVz4TJzYVPAXagF7GXjgZ3GxGOCw/EF1i0/rp5IN
 pgGJSBfHppwSSxlu/WOaFOQm7D96GzMtKBjclGwqHDQYZ8V5NNbTw5oahMvkY62J4Bcv
 xvuULTn8M1jB7ooQLdS2tItxTCRS2SNix0Lv5msweEF06EcK/+YQoovw+ALLc950AbCO
 dNuYMGg/puoIQ39KxeNIBvRe2lqaJj+1rlej0C5Dhe4aDgkWXgpDufZzv1pwpPPiB1NX
 cjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rmVDDhkBD33dRebxUB6WkABikP1v8rHGLOz9oy+lzOw=;
 b=ShK9QvMd/uCcKxyeFNoA3kiDlUzN7s6dLbKSVI7w3hHFKVh6Yg1e//5jrHuoM3zc+O
 sao3NFAITadTeFBrjICWk+mPEemlNG1udA+f4OIMxoMaXNKOkVKylNA/M7Pj004chB1d
 hs/O+SqlifbBXIeJxl0bSlUyKQJyQd6iN417aqjCBrKYGd5Tnj/jIVl8MNlocAwlDgZ6
 rHg1W9a6gVTvsMfmgGyHRYF9Td8JNR37DgvyWN6qtMwneAUk1mtzDrZBxmTvjuTdYbvU
 elFXGlvmaRwlK7v1L1KY+O5qMZXUrE/PlrD6ojDt8jIRd+fEAkNCphnOypiijiRIimyt
 YESQ==
X-Gm-Message-State: AO0yUKXc3dgwVGeIOY+rj+EtkkV7BZzoKiBkgrJbDjSrEdWcUsGPjaIc
 5P+G0HguLPE2YuIdEPoLerM=
X-Google-Smtp-Source: AK7set81TKZAFzmOrFzSNHYZptbc1qRIgjmsCDass4PkbAdTYVS+WfbfkwETMnLWvQHYBCaWiFrNHA==
X-Received: by 2002:a17:902:f2c9:b0:19a:6098:103a with SMTP id
 h9-20020a170902f2c900b0019a6098103amr325179plc.23.1675927531617; 
 Wed, 08 Feb 2023 23:25:31 -0800 (PST)
Received: from localhost ([192.55.54.55]) by smtp.gmail.com with ESMTPSA id
 n20-20020a170902d0d400b0019948184c33sm664782pln.243.2023.02.08.23.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 23:25:30 -0800 (PST)
Date: Wed, 8 Feb 2023 23:25:29 -0800
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Arnd Bergmann <arnd@arndb.de>, Naoya Horiguchi <naoya.horiguchi@nec.com>,
 Miaohe Lin <linmiaohe@huawei.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, tabba@google.com,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 wei.w.wang@intel.com, isaku.yamahata@gmail.com
Subject: Re: [PATCH v10 2/9] KVM: Introduce per-page memory attributes
Message-ID: <20230209072529.GB4175971@ls.amr.corp.intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-3-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221202061347.1070246-3-chao.p.peng@linux.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Dec 02, 2022 at 02:13:40PM +0800,
Chao Peng <chao.p.peng@linux.intel.com> wrote:

> +static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
> +					   struct kvm_memory_attributes *attrs)
> +{
> +	gfn_t start, end;
> +	unsigned long i;
> +	void *entry;
> +	u64 supported_attrs = kvm_supported_mem_attributes(kvm);
> +
> +	/* flags is currently not used. */
> +	if (attrs->flags)
> +		return -EINVAL;
> +	if (attrs->attributes & ~supported_attrs)
> +		return -EINVAL;
> +	if (attrs->size == 0 || attrs->address + attrs->size < attrs->address)
> +		return -EINVAL;
> +	if (!PAGE_ALIGNED(attrs->address) || !PAGE_ALIGNED(attrs->size))
> +		return -EINVAL;
> +
> +	start = attrs->address >> PAGE_SHIFT;
> +	end = (attrs->address + attrs->size - 1 + PAGE_SIZE) >> PAGE_SHIFT;
> +
> +	entry = attrs->attributes ? xa_mk_value(attrs->attributes) : NULL;
> +
> +	mutex_lock(&kvm->lock);
> +	for (i = start; i < end; i++)
> +		if (xa_err(xa_store(&kvm->mem_attr_array, i, entry,
> +				    GFP_KERNEL_ACCOUNT)))
> +			break;
> +	mutex_unlock(&kvm->lock);
> +
> +	attrs->address = i << PAGE_SHIFT;
> +	attrs->size = (end - i) << PAGE_SHIFT;
> +
> +	return 0;
> +}
> +#endif /* CONFIG_HAVE_KVM_MEMORY_ATTRIBUTES */
> +

If memslot isn't private, it should return error if private attribute is set.
Something like following check is needed.

+       if (attrs->flags & KVM_MEM_PRIVATE) {
+               /* non-private memory slot doesn't allow KVM_MEM_PRIVATE */
+               for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
+                       struct kvm_memslot_iter iter;
+                       struct kvm_memslots *slots;
+
+                       slots = __kvm_memslots(kvm, i);
+                       kvm_for_each_memslot_in_gfn_range(&iter, slots, start, end) {
+                               if (!kvm_slot_can_be_private(iter.slot)) {
+                                       mutex_unlock(&kvm->slots_lock);
+                                       return -EINVAL;
+                               }
+                       }
+               }
+       }
+


-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

