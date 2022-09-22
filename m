Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0523A5E6C23
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 21:53:57 +0200 (CEST)
Received: from localhost ([::1]:47338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obSGh-0002Ve-Sj
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 15:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1obSCN-0005fv-3b
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 15:49:28 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:43539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1obSCL-0001S9-0i
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 15:49:26 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 g1-20020a17090a708100b00203c1c66ae3so3261248pjk.2
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 12:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=AOIMXA4PI9BYXrk6/Ja2mOKlrFIROrj5K/ieUQQwXS4=;
 b=h1quGJbzNcYbvksztMmJbAj4021+BcmdngI9oVLKqryAXjZOZrGY+bZOFcLzMWlozZ
 LAcA23Adi1Jic4pRnJCptlWTG4EcoRJkXHfvedp0K1HaJOCXyEXxuhzgdof/jPIDOZEe
 ebqjyLF5ANcpzYiinKi6eaQnqth3W4n2V8+InjN4EWNaK7npJ/bYc7FhRS+iyNb4HHPb
 Efk7QXZ7wTcSNyFHTH7NWGDPMQ4YLD125sVU1j3HVB2TkIAvgthLngw1wMrAfORH5ZfR
 U8+tmRxUsuSWAVFhBHQcUHbhvue7DyoPTDpJKMkc7xktoeaZV8RiJlYUMocHTDHlXZyf
 XJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=AOIMXA4PI9BYXrk6/Ja2mOKlrFIROrj5K/ieUQQwXS4=;
 b=INPcTCaYI4JGmZeInwaVRRivHFHFbO6Ip/T8xwSBoA/O0TONxfhlaLGWmBJMHryx9A
 8u6tVp8JNbexjPpAtgx9SJKeuDzbfyi4CRSfPw3irA8qgh26OoKB5LX7MEpWdOZnwZqk
 KPIwR4QihFvWPkmPvU20pEcUP1uLD4kfNFFX806MqtiLxlPi2vnI2e2jUENW8DASmS4J
 oRnDogow7bmuzxiv8q0yVKyFno6VNP2EHvoVXDrAakVeYk3Km+mm/YSlM/rEUdgfsL95
 s/JnsOVdEs66V4cjZ0KZSbpoREn+9mQZnYNSbiyeDJsHygF+qkHJkxDIcUqYpjBcIWPq
 42Rg==
X-Gm-Message-State: ACrzQf0j3I+NVMvsMgptTs6JT80WNDMUCknmt8oGrNdP1J6DbBxygoOz
 QitVuQgvbTXYesorkkylGt0KuA==
X-Google-Smtp-Source: AMsMyM7xkIpUg/GEtYg3CdJDso/M2NS+vljJqn+Iz/Og0ecRlPYRkH7bufKUsfNRGuIjAMJq7OVhXg==
X-Received: by 2002:a17:90a:644e:b0:200:422c:6b1 with SMTP id
 y14-20020a17090a644e00b00200422c06b1mr5394594pjm.183.1663876162098; 
 Thu, 22 Sep 2022 12:49:22 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 a10-20020a170902ecca00b00172897952a0sm4576315plh.283.2022.09.22.12.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 12:49:21 -0700 (PDT)
Date: Thu, 22 Sep 2022 19:49:18 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Wang, Wei W" <wei.w.wang@intel.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "x86@kernel.org" <x86@kernel.org>,
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
 "Lutomirski, Andy" <luto@kernel.org>,
 "Nakajima, Jun" <jun.nakajima@intel.com>,
 "Hansen, Dave" <dave.hansen@intel.com>,
 "ak@linux.intel.com" <ak@linux.intel.com>,
 "david@redhat.com" <david@redhat.com>,
 "aarcange@redhat.com" <aarcange@redhat.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>,
 "dhildenb@redhat.com" <dhildenb@redhat.com>,
 Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>,
 "Hocko, Michal" <mhocko@suse.com>, Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v8 1/8] mm/memfd: Introduce userspace inaccessible memfd
Message-ID: <Yyy8Pp0Y4NRzIzNw@google.com>
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
 <DS0PR11MB63734D4DF4C4F368805EC97DDC4E9@DS0PR11MB6373.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS0PR11MB63734D4DF4C4F368805EC97DDC4E9@DS0PR11MB6373.namprd11.prod.outlook.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=seanjc@google.com; helo=mail-pj1-x102f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 22, 2022, Wang, Wei W wrote:
> On Thursday, September 15, 2022 10:29 PM, Chao Peng wrote:
> > +int inaccessible_get_pfn(struct file *file, pgoff_t offset, pfn_t *pfn,
> > +			 int *order)
> 
> Better to remove "order" from this interface?

Hard 'no'.

> Some callers only need to get pfn, and no need to bother with
> defining and inputting something unused. For callers who need the "order",
> can easily get it via thp_order(pfn_to_page(pfn)) on their own.

That requires (a) assuming the pfn is backed by struct page, and (b) assuming the
struct page is a transparent huge page.  That might be true for the current
implementation, but it most certainly will not always be true.

KVM originally did things like this, where there was dedicated code for THP vs.
HugeTLB, and it was a mess.  The goal here is very much to avoid repeating those
mistakes.  Have the backing store _tell_ KVM how big the mapping is, don't force
KVM to rediscover the info on its own.

