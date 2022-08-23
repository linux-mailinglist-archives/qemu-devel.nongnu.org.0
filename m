Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DA859CDCF
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 03:27:12 +0200 (CEST)
Received: from localhost ([::1]:52998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQIhD-0004il-Hb
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 21:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1oQIfr-0003Bs-Fj
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 21:25:47 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:44025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1oQIfp-0008Vr-VW
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 21:25:47 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so13126903pjf.2
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 18:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=zUw74NM1PF7THinMe6GlF9fUaFjzhhz/u/PvpW+nALE=;
 b=Q64HD9FubVrlP5FmJOhxKQUOt96oa1y4u811xQjDNizh82sETFqtDd7YBhlyq7Fdxb
 rLbPDmVH9HGNC5K/UDeLYv14kfMyzYjVa50MOJ3QGeHCfs4+qrFqcTtzZArm4uraIU/C
 Nvrv9grRvmRE9oXrd0tzcZWKDezpB1lWXwmfxeu/1emkEXRpVPM/7arbKBomI1miyiS1
 hy+2xHiijPE8GCpoe5wjF/dscpP7+aowXMXjkAsfFbEH43jZ108/WVH0r9AZlzcMQqx9
 hVVjlHJU7iqLQKQKcheYNF9PR/qe1ORY2lIlJGzxRCAvGY1+/1jjiSLaSTUkLSyqVi90
 uW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=zUw74NM1PF7THinMe6GlF9fUaFjzhhz/u/PvpW+nALE=;
 b=2dm5W8L7LO3fXW7f7xnZ320KiN2IJHmEJ2DbJ88baQ0QyXiOcrycnYRMeIPPaoHQfQ
 IAkP4VRDAk4PukNzqRA3C2FsOi14ClZ9wg2mSsibNp/ZmiUU+h9+s+uSjKIDx2vPOeQj
 sXsQdMz51TYMVYhTMkUT6fhfwvLfzJkT4+N9pvDauL8gis+vB11MScR6js2J4TjD0sX6
 JZqoG+VjVN9UjHiMwYHQ5lZMwslFnB6NeEkkoOVURc71FmT5dR+yKm8PEcpMfaTaam+W
 F6QpPeOjgD09ioBqZll4BuTMr48ji8wlK+Sqfgn/Wm5LNZTjQN6f9jdm61hNerRzkiQ1
 QdeA==
X-Gm-Message-State: ACgBeo1hTwnqUQQo84nzBDKCk8gqGsbNmv3mg4yjjRNCAForneQYP9rq
 6BNYiQFQHignEe2Frz1TSSg=
X-Google-Smtp-Source: AA6agR6cK3+6tkV4eQf/7WDt9r9QaUp4zK5IzLni0B+GqaZ9vscYfOKokN6RflRUU0B5j2K2m/fZsQ==
X-Received: by 2002:a17:902:9886:b0:172:bb36:70f1 with SMTP id
 s6-20020a170902988600b00172bb3670f1mr21126201plp.139.1661217943863; 
 Mon, 22 Aug 2022 18:25:43 -0700 (PDT)
Received: from localhost ([192.55.55.51]) by smtp.gmail.com with ESMTPSA id
 d10-20020a17090ab30a00b001fb53587166sm1055886pjr.28.2022.08.22.18.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 18:25:43 -0700 (PDT)
Date: Mon, 22 Aug 2022 18:25:41 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Michael Roth <michael.roth@amd.com>
Cc: Sean Christopherson <seanjc@google.com>,
 "Gupta, Pankaj" <pankaj.gupta@amd.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Chao Peng <chao.p.peng@linux.intel.com>,
 "Nikunj A. Dadhania" <nikunj@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
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
 Yu Zhang <yu.c.zhang@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 mhocko@suse.com, Muchun Song <songmuchun@bytedance.com>,
 bharata@amd.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, linux-fsdevel@vger.kernel.org,
 isaku.yamahata@gmail.com
Subject: Re: [PATCH v7 00/14] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <20220823012541.GA2147148@ls.amr.corp.intel.com>
References: <422b9f97-fdf5-54bf-6c56-3c45eff5e174@amd.com>
 <1407c70c-0c0b-6955-10bb-d44c5928f2d9@amd.com>
 <1136925c-2e37-6af4-acac-be8bed9f6ed5@amd.com>
 <1b02db9d-f2f1-94dd-6f37-59481525abff@amd.com>
 <20220815130411.GA1073443@chaop.bj.intel.com>
 <f0094f31-9669-47b5-eb52-6754a13ce757@amd.com>
 <20220816122457.2fjyd4uz5hp5cani@box.shutemov.name>
 <f95f35af-4824-2a2a-7cd0-71d1fda6867a@amd.com>
 <Yvu54I7Y+/ybVyec@google.com>
 <20220817152719.g7pgu34syekzkha5@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220817152719.g7pgu34syekzkha5@amd.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pj1-x1033.google.com
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

On Wed, Aug 17, 2022 at 10:27:19AM -0500,
Michael Roth <michael.roth@amd.com> wrote:

> > I think the best approach is to turn KVM_TDX_INIT_MEM_REGION into a generic
> > vCPU-scoped ioctl() that allows userspace to pre-map guest memory.  Supporting
> > initializing guest private memory with a source page can be implemented via a
> > flag.  That also gives KVM line of sight to in-place "conversion", e.g. another
> > flag could be added to say that the dest is also the source.
> 
> So is this proposed ioctl only intended to handle the initial encrypted
> payload, and the KVM_MEMORY_ENCRYPT_{REG,UNREG}_REGION ioctls would
> still be used for conversions post-boot?

Yes.  It is called before running any vcpu.  At run time (after running vcpus),
KVM_MEMORY_ENCRYPT_{REG,UNREG}_REGION is used.
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

