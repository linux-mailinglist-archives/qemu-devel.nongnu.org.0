Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E42DB618C9C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 00:12:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqjMD-0006Y6-KY; Thu, 03 Nov 2022 19:10:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oqjGs-00030t-MB
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 19:05:15 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oqjGf-0003US-Tx
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 19:05:13 -0400
Received: by mail-pj1-x102d.google.com with SMTP id gw22so3039774pjb.3
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 16:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ty7NKEPl0IHHIKXvP+jXCaEpuJOC+fqTvmEMtCpQ/20=;
 b=rQnp+SwB2zMSq0CxGruqys/HkI4BO0cs24vZcUtuIOAevup3Y78FQIob1VLtYPM4TW
 cAdQKut1sAQnbM6RE4Nm9dOd/n1bzcGOEZ2ElA8ACLK+5DrOk66Qd9UjphJMHGodCVhB
 suednwHwQu0747FO0ErJ6MskTw3c1IHuy97x4qT7qRTobrAjI2qqaQ9qrsYHObDuiLne
 9nFHuZfBYQuomcslj83mRerOA09HO4FMwWxhwjluEXAf5450VKKTvi3I6AJxRsOgPMbS
 0iZx3Y49cYnH4f0Dk4p0nvsEgI5F5O70XswxtMhuqEnZHAoYkQNfeej4jHze5fR+sQEe
 eEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ty7NKEPl0IHHIKXvP+jXCaEpuJOC+fqTvmEMtCpQ/20=;
 b=FsGlnS0FzWSIJU5m5cJdBrRHRWIkEIijcAZI8RDtBzVPwFhn1VLYKswKhxw8oMcJAD
 0wJuFxLvdWutTm9AuuxJBEUSD+03VBy6dLkhaSR8SSdBSqGqPojBy35mp4zXfFGv795+
 Kr+7o4DTSD3XlYz1/ZW7XnQp337MsXs7KGdOGnDG87yIP2MF+2TJqeDPu5+tig/S9X9A
 BnDHZDFqWpaTDl4/pCECYpDDpKelRanfIJgjOIZSzrkt048Ha6t5I0oW9v2kQhe5THxM
 l+65DcjUMMYzs12GTOMMWRBno5MxBqd75EEiuzU/H4kQPJLJkZ2DBTpL3NW3FRELXyCt
 d3+Q==
X-Gm-Message-State: ACrzQf2J9YgApQRhwOBK/87NzvyQODYXAgDMfQLrWh/NnfeyYnYlYLnQ
 hWyPBme459H+O1tB1i6aZHcOfA==
X-Google-Smtp-Source: AMsMyM4SAC4AWjYSYyCN4S3X8KC1TnM1iyPSaM02SstCPPdhS3uGTSJeL2KSiB26C81hZIhFnQ7kZg==
X-Received: by 2002:a17:902:d4ce:b0:188:5340:4a3a with SMTP id
 o14-20020a170902d4ce00b0018853404a3amr5770987plg.79.1667516698820; 
 Thu, 03 Nov 2022 16:04:58 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 x12-20020a62860c000000b0056281da3bcbsm1297475pfd.149.2022.11.03.16.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 16:04:57 -0700 (PDT)
Date: Thu, 3 Nov 2022 23:04:53 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
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
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: Re: [PATCH v9 5/8] KVM: Register/unregister the guest private memory
 regions
Message-ID: <Y2RJFWplouV2iF5E@google.com>
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <20221025151344.3784230-6-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221025151344.3784230-6-chao.p.peng@linux.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=seanjc@google.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, FSL_HELO_FAKE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Oct 25, 2022, Chao Peng wrote:
> @@ -4708,6 +4802,24 @@ static long kvm_vm_ioctl(struct file *filp,
>  		r = kvm_vm_ioctl_set_memory_region(kvm, &mem);
>  		break;
>  	}
> +#ifdef CONFIG_KVM_GENERIC_PRIVATE_MEM
> +	case KVM_MEMORY_ENCRYPT_REG_REGION:
> +	case KVM_MEMORY_ENCRYPT_UNREG_REGION: {

I'm having second thoughts about usurping KVM_MEMORY_ENCRYPT_(UN)REG_REGION.  Aside
from the fact that restricted/protected memory may not be encrypted, there are
other potential use cases for per-page memory attributes[*], e.g. to make memory
read-only (or no-exec, or exec-only, etc...) without having to modify memslots.

Any paravirt use case where the attributes of a page are effectively dictated by
the guest is going to run into the exact same performance problems with memslots,
which isn't suprising in hindsight since shared vs. private is really just an
attribute, albeit with extra special semantics.

And if we go with a brand new ioctl(), maybe someday in the very distant future
we can deprecate and delete KVM_MEMORY_ENCRYPT_(UN)REG_REGION.

Switching to a new ioctl() should be a minor change, i.e. shouldn't throw too big
of a wrench into things.

Something like:

  KVM_SET_MEMORY_ATTRIBUTES

  struct kvm_memory_attributes {
	__u64 address;
	__u64 size;
	__u64 flags;
  }

[*] https://lore.kernel.org/all/Y1a1i9vbJ%2FpVmV9r@google.com

> +		struct kvm_enc_region region;
> +		bool set = ioctl == KVM_MEMORY_ENCRYPT_REG_REGION;
> +
> +		if (!kvm_arch_has_private_mem(kvm))
> +			goto arch_vm_ioctl;
> +
> +		r = -EFAULT;
> +		if (copy_from_user(&region, argp, sizeof(region)))
> +			goto out;
> +
> +		r = kvm_vm_ioctl_set_mem_attr(kvm, region.addr,
> +					      region.size, set);
> +		break;
> +	}
> +#endif

