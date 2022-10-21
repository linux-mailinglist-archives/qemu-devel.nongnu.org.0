Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD8B607E9A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 21:03:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1olxAj-0005ea-Cf; Fri, 21 Oct 2022 14:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oluj2-0007MO-Gm
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 12:18:24 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oluiy-0000QM-IE
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 12:18:24 -0400
Received: by mail-pl1-x629.google.com with SMTP id f23so2785929plr.6
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 09:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PIRb6+ovxp5J4uJ1hVDeWHpfyBDCzaaTh1iPpdxBBXo=;
 b=LBbRjb9HoKMsM0BrB5Yx8EKkNw2z2slGB6RREjreEOgAz6cf4w0roEfiOfI1ISkxC3
 umCpqoYJ+BxiTeH6mDoFf2MIPMRAa8KHajTmAG5q0NIMZtDgJyPYDAp4OEAVmIJyfonP
 YVdGEHCQT54p0r2x+JlsthZbC8pGVdj+LT/dxHs3Utvt9tNW6l/hE2qLrAwkHAoOVZeH
 cqWWQ1T7dnKxpoX4VIogeOoRSjB+ibtFx6bQv9mAbDdRyNK9AcGDi4qG7P8xM/rtcTeQ
 giQByT9/HXaV3sGzuy8Kux9ZJVNncssFk2zzM8JEHArzX1QytiIWnjlmf1c2NjGzQeqm
 YCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PIRb6+ovxp5J4uJ1hVDeWHpfyBDCzaaTh1iPpdxBBXo=;
 b=BQ4O27+MfHqOjWrDJ6JvKpLtfDXyiZR6K27kLi33Eufbt6SnEfA5HDoVLh+C3ZupzN
 9CY9wDcjkv9OS66UlJevNBOGgmLjq3ajHEXMpzBG32OF8VTBuyit9lJXpZGXn9EtDPQy
 bmm501MrDXQcjq93JPfNO5qUUxL4IXiyG8YRQPQoLKrt/yc1W5ZEWXgdDF37MDM67u9M
 J+iMoWY0dbO2hKO/XOyUcdY4RwicotabMsMU3IJSNfQD26e6bZ2IbRCDs1CrD+oJCrVq
 11Kz01Tja0XWfZLyxo23XWrq4kdXkZL6pQzJq2yH5ZLbDZAbytmfdbXhBSki8FsEDg9X
 VCgg==
X-Gm-Message-State: ACrzQf2Jj2HmIJRUZCkDifMctyvLT1WTeOeK7lHvWzmMI6Hg63/EVPw2
 NhM4HIPW+7Kd5s0PisCRRSrrjA==
X-Google-Smtp-Source: AMsMyM7vsZ30ExGufg/GPlnIb76AAev1l4p5ZYo9iokYaR6mEcu4bpMFXgiNWD7ik43HxyivyjTj/A==
X-Received: by 2002:a17:903:50e:b0:182:631b:df6f with SMTP id
 jn14-20020a170903050e00b00182631bdf6fmr20228449plb.66.1666369098415; 
 Fri, 21 Oct 2022 09:18:18 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 t3-20020a170902b20300b0017f61576dbesm14948739plr.304.2022.10.21.09.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 09:18:17 -0700 (PDT)
Date: Fri, 21 Oct 2022 16:18:14 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Vishal Annapurve <vannapurve@google.com>, kvm@vger.kernel.org,
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
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: Re: [PATCH v8 1/8] mm/memfd: Introduce userspace inaccessible memfd
Message-ID: <Y1LGRvVaWwHS+Zna@google.com>
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
 <CAGtprH_MiCxT2xSxD2UrM4M+ghL0V=XEZzEX4Fo5wQKV4fAL4w@mail.gmail.com>
 <20221021134711.GA3607894@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021134711.GA3607894@chaop.bj.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=seanjc@google.com; helo=mail-pl1-x629.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 21, 2022, Chao Peng wrote:
> > 
> > In the context of userspace inaccessible memfd, what would be a
> > suggested way to enforce NUMA memory policy for physical memory
> > allocation? mbind[1] won't work here in absence of virtual address
> > range.
> 
> How about set_mempolicy():
> https://www.man7.org/linux/man-pages/man2/set_mempolicy.2.html

Andy Lutomirski brought this up in an off-list discussion way back when the whole
private-fd thing was first being proposed.

  : The current Linux NUMA APIs (mbind, move_pages) work on virtual addresses.  If
  : we want to support them for TDX private memory, we either need TDX private
  : memory to have an HVA or we need file-based equivalents. Arguably we should add
  : fmove_pages and fbind syscalls anyway, since the current API is quite awkward
  : even for tools like numactl.

