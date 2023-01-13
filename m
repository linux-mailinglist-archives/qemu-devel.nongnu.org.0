Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF1766A6D1
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 00:14:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGTFB-0002OI-Ln; Fri, 13 Jan 2023 18:13:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1pGTF9-0002JN-SB
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 18:13:51 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1pGTF8-0007b0-23
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 18:13:51 -0500
Received: by mail-pj1-x102d.google.com with SMTP id q64so23852753pjq.4
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 15:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aD430Gm5/BH6KWfU6qRjnAcPFnRFXzypIgZQD78Cq8M=;
 b=J9kbXeAr7RzKUj6xWqpWYyasnI938iccbuzYevy5Kw8J6dsLK90aA073MlhfbQX7Zx
 g+GrHw5HrAqoynqitIFYrifwNYgqPzRdTko8sXY7wDB8RJJof1k0kQ/MRRNQ1eqRjcYi
 cbhX/+Qd94yu+tAum1D9Oo9mUsR4zLbdFcHsJdqJmJRogfNxVk3ex3FGBS1rfDubEwnO
 DQIlWYFYlqkXqrPcX5Qd0OI0aVEQJGn/j/r9wH/dLXSAJHp0J55zTJcP36Dgsxja9PEp
 0qQjV1iaoAynY5Qk8zGqkPmE5xPbzsoqo7Jv4RuAEZ5C2vIa1vBQUrmm/x2y5EB/PJFI
 jyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aD430Gm5/BH6KWfU6qRjnAcPFnRFXzypIgZQD78Cq8M=;
 b=SoFx0gVFf0leI7T7PiikTD1wYUFxBRKMlmG1hZ/bswMsIvmZwlHadxxaRIQsZY1+hW
 bJWp1Xr6If4jRGxOqijHZSaAncHyiabxjB3uJaurgKhHfOr52vg5nVOrdcyYz91RdgGL
 xv7tnWPXem9UevhdGE1MXrIXXclit9Y0QYt2XACdmFkfsUQC+PJVPA/Y0VGYync3EZJE
 T5mGo6uWzjj6FMrtLuxpqH78jdfbDePn0SuU2mtOH4n9G1SoMHFNf99BKvZX3bQPHkvl
 Hyb2dBplckqb4zP95hv0zc/nrWdTYm69x4n7bh6djqhJzZ3fRx51hVkB2cCaIPdCF3Ig
 0oHw==
X-Gm-Message-State: AFqh2kqCGUEyVeBo8wd34xQjgnBuJdRlOBKuny+shz8njxYhfU0LjfKE
 vYv43LEzf/IfpknefnRfHG2Vew==
X-Google-Smtp-Source: AMrXdXt6FsRHB2cphm8pjBSHUu2uqj9MrjnIMJc5jrgFlJeiijosoKXpar/7LHkVP4cLD34SofgrKQ==
X-Received: by 2002:a05:6a20:4284:b0:9d:b8e6:d8e5 with SMTP id
 o4-20020a056a20428400b0009db8e6d8e5mr1901073pzj.2.1673651628605; 
 Fri, 13 Jan 2023 15:13:48 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 k16-20020a170902c41000b00178b77b7e71sm7936571plk.188.2023.01.13.15.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 15:13:48 -0800 (PST)
Date: Fri, 13 Jan 2023 23:13:44 +0000
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
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, wei.w.wang@intel.com
Subject: Re: [PATCH v10 4/9] KVM: Add KVM_EXIT_MEMORY_FAULT exit
Message-ID: <Y8HlqMtgPACAN1i2@google.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-5-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202061347.1070246-5-chao.p.peng@linux.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=seanjc@google.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Dec 02, 2022, Chao Peng wrote:
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 99352170c130..d9edb14ce30b 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6634,6 +6634,28 @@ array field represents return values. The userspace should update the return
>  values of SBI call before resuming the VCPU. For more details on RISC-V SBI
>  spec refer, https://github.com/riscv/riscv-sbi-doc.
>  
> +::
> +
> +		/* KVM_EXIT_MEMORY_FAULT */
> +		struct {
> +  #define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1ULL << 0)

Unless there's a reason not to, we should use bit 3 to match the attributes.

