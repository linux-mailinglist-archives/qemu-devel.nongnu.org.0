Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C1952F2E1
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 20:33:20 +0200 (CEST)
Received: from localhost ([::1]:43162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns7R9-0003a5-9v
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 14:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1ns7P6-0002sh-0s
 for qemu-devel@nongnu.org; Fri, 20 May 2022 14:31:12 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:35357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1ns7P2-0000h2-TF
 for qemu-devel@nongnu.org; Fri, 20 May 2022 14:31:11 -0400
Received: by mail-pf1-x434.google.com with SMTP id c14so8444055pfn.2
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 11:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/D44zTPGmOvqCz58NoXY7GJ7Oz3KVoVYsKXMavYtIGY=;
 b=hXnBtM8ClLBza+ZRSfpaH9QJs4e70zsjGGwXTB768f+j3vqY+PwjCmxCHfgcbOWUIo
 WkA4z40qGEeH8ye8nA+9vKsDvo6jzo3aKNFN66eMopiC5L5Nz2Rul1xe3uZjLa1NNsDS
 u417yZ070yvLbJ7u7T7AavZQoAUrK7xIHezbfLj969JZM7ZTkx89y4HMQ1l2TNDF2Sq2
 0LpzAaltp9AMFcI6xh0jpic9+djmA9wPzf6w2Yikovx4w7ogKachx1moE40EDvrT0Jd+
 1BUoZb8r51kRFW2pPCxPq3BYf2iYgtUzn0y36Ygbn7Tx0RaCNfgu370pJo+mNPyz2DS+
 NhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/D44zTPGmOvqCz58NoXY7GJ7Oz3KVoVYsKXMavYtIGY=;
 b=O/X5aIRZdvxFzDttElHwKTSbkPqrnOPmIDwm1v//VN2uxYhU+FdcFBsFH8iIABhSiq
 e73vMaZmFqjM91FCBoamJGg/enUGr6t/cKN/GTCjMO9K/BRMPUH5movZfdlfF4oXLgNA
 HbTPc+Ntg50Vcrt0hYu6AXW63qFTQsESxK6Rm/ZtRng92canT5zfLFDeZPrmQJwHuckz
 kP3qxgi9ROk4NHGrwB/Kzuv/L3BpD0/qTidPNX4YresG2YSf+gaT2VsH3ZpgaEABYRpX
 BGd3uCIrcoh//blEI0JVnDAaaqcjKSzkoeZesnUegWdbuak2xCbz/MJ58/20Bg8dZdCS
 VZKQ==
X-Gm-Message-State: AOAM532ZLbuLUpo3GUCtQx9Y0VXkPdUlYxULBzUAlX48fwtK0K698AW1
 xFPSbzPB7Q52kcHSb9NQEmKROg==
X-Google-Smtp-Source: ABdhPJyXfnLY4U/z7B1YcpHIUBMTDAqIQuWt14grJnUQKMT9mxPH1mHBF0sFVeaMIPjRZNdy0Y/CKw==
X-Received: by 2002:a63:8243:0:b0:3f9:6c94:5112 with SMTP id
 w64-20020a638243000000b003f96c945112mr2534146pgd.173.1653071466429; 
 Fri, 20 May 2022 11:31:06 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 a201-20020a621ad2000000b0050dc76281e9sm2105316pfa.195.2022.05.20.11.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 11:31:05 -0700 (PDT)
Date: Fri, 20 May 2022 18:31:02 +0000
From: Sean Christopherson <seanjc@google.com>
To: Andy Lutomirski <luto@kernel.org>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com
Subject: Re: [PATCH v6 4/8] KVM: Extend the memslot to support fd-based
 private memory
Message-ID: <YofeZps9YXgtP3f1@google.com>
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
 <20220519153713.819591-5-chao.p.peng@linux.intel.com>
 <8840b360-cdb2-244c-bfb6-9a0e7306c188@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8840b360-cdb2-244c-bfb6-9a0e7306c188@kernel.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=seanjc@google.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 20, 2022, Andy Lutomirski wrote:
> The alternative would be to have some kind of separate table or bitmap (part
> of the memslot?) that tells KVM whether a GPA should map to the fd.
> 
> What do you all think?

My original proposal was to have expolicit shared vs. private memslots, and punch
holes in KVM's memslots on conversion, but due to the way KVM (and userspace)
handle memslot updates, conversions would be painfully slow.  That's how we ended
up with the current propsoal.

But a dedicated KVM ioctl() to add/remove shared ranges would be easy to implement
and wouldn't necessarily even need to interact with the memslots.  It could be a
consumer of memslots, e.g. if we wanted to disallow registering regions without an
associated memslot, but I think we'd want to avoid even that because things will
get messy during memslot updates, e.g. if dirty logging is toggled or a shared
memory region is temporarily removed then we wouldn't want to destroy the tracking.

I don't think we'd want to use a bitmap, e.g. for a well-behaved guest, XArray
should be far more efficient.

One benefit to explicitly tracking this in KVM is that it might be useful for
software-only protected VMs, e.g. KVM could mark a region in the XArray as "pending"
based on guest hypercalls to share/unshare memory, and then complete the transaction
when userspace invokes the ioctl() to complete the share/unshare.

