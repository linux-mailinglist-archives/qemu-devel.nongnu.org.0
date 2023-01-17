Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B0066E0D0
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 15:34:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHn1b-0000N3-P1; Tue, 17 Jan 2023 09:33:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1pHn1V-0000Ls-Vs
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 09:33:17 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1pHn1L-0003mC-DD
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 09:33:05 -0500
Received: by mail-lf1-x129.google.com with SMTP id o20so15402408lfk.5
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 06:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7yhLGsprr4iGbKzba+JN1VXXF3TeC3cedN8+F9epKwY=;
 b=BWKfON0ONcZ0E/73kUupX7eOFbsTtnf5zb0RLvmJL0YAhZl6oEvSZL3c/NoN0rNReU
 TIh5gjrwA6Bj/3YkDzJiL+Gls11L2i8ze76yowGZvwzeuvcwTzbo+PdTF5RRopZcOu67
 rqK/5DXAz0Cu8iK48baqurCP3Q8SHLQ3+La3MGi7OSiOLM50rap2pv9+NepuA7fvXVkZ
 JbAIYTYmlyf3SaXzCtregYhzAezlqMgzZgLa7aRWrX3Ls8Vi1NxO2mSedec1z7gAhtZm
 CjRS/N1ff7V0fQ/RSJMzu/O50kqFBmQcx8Ep1MMWXZfAdBITG7gqeNKqSuVwb7ryK8UD
 4kmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7yhLGsprr4iGbKzba+JN1VXXF3TeC3cedN8+F9epKwY=;
 b=IwIn7z7AJJaqqP2OhjXkUTdfzYEEMiM2d2uHOhtFy4YsLP2yhmbS8esT2r8l9DCxqT
 K96BPrmINgVKOOqpKBjWnKo8DsW/oTlWszX9pgmKNA+ROBpCGOgDbd/HwdzBiU+AHEvu
 zmTaD2lgtkyzvof9ijk6f0HVRZHGwiYnrfp0mmL5pohr7kx5V0D7QAlBGqnV2Iku3C/+
 z8uVn2ImcUvCNkZwyTbtu5FfXa8wdCpMgD9KNdONUdm24Xarq1Tv0qDWFo0WeesxGsdA
 9Boafcji9qz82nst0D/sP1f1YO3x+TgO7AZnUPic4uFlpCAgw/O1gHc6hcBMhNLe17F+
 VgCg==
X-Gm-Message-State: AFqh2krAeaWgkLBcHID3GcTyI6/NEF+70ykZHjUO5RM8cfGAfRdyV3hq
 ERuqlNnNYvYMLU4JqZ5Zpdeg9CVXDMy9k2weIapLhw==
X-Google-Smtp-Source: AMrXdXsPS/EHa9ll4sjoGtdooNfVuEuQvNaydQDhDfaDKMnyvvZ6mWGGNpzl0ThBONl2d+/I1rYOtZu/xqsiIx9Cz3Y=
X-Received: by 2002:a05:6512:3b9b:b0:4d5:850a:8330 with SMTP id
 g27-20020a0565123b9b00b004d5850a8330mr128086lfv.665.1673965976657; Tue, 17
 Jan 2023 06:32:56 -0800 (PST)
MIME-Version: 1.0
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <Y8H5Z3e4hZkFxAVS@google.com>
In-Reply-To: <Y8H5Z3e4hZkFxAVS@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Jan 2023 14:32:19 +0000
Message-ID: <CA+EHjTyVfm5L0kch2rT1HwaDHjVOxnZozV2PKWViKY00igHawg@mail.gmail.com>
Subject: Re: [PATCH v10 0/9] KVM: mm: fd-based approach for supporting KVM
To: Sean Christopherson <seanjc@google.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 Arnd Bergmann <arnd@arndb.de>, Naoya Horiguchi <naoya.horiguchi@nec.com>, 
 Miaohe Lin <linmiaohe@huawei.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, 
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>, 
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>, 
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, 
 Vishal Annapurve <vannapurve@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, 
 dave.hansen@intel.com, ak@linux.intel.com, david@redhat.com, 
 aarcange@redhat.com, ddutile@redhat.com, dhildenb@redhat.com, 
 Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>,
 mhocko@suse.com, wei.w.wang@intel.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=tabba@google.com; helo=mail-lf1-x129.google.com
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

Hi Sean,

On Sat, Jan 14, 2023 at 12:38 AM Sean Christopherson <seanjc@google.com> wrote:
>
> On Fri, Dec 02, 2022, Chao Peng wrote:
> > This patch series implements KVM guest private memory for confidential
> > computing scenarios like Intel TDX[1]. If a TDX host accesses
> > TDX-protected guest memory, machine check can happen which can further
> > crash the running host system, this is terrible for multi-tenant
> > configurations. The host accesses include those from KVM userspace like
> > QEMU. This series addresses KVM userspace induced crash by introducing
> > new mm and KVM interfaces so KVM userspace can still manage guest memory
> > via a fd-based approach, but it can never access the guest memory
> > content.
> >
> > The patch series touches both core mm and KVM code. I appreciate
> > Andrew/Hugh and Paolo/Sean can review and pick these patches. Any other
> > reviews are always welcome.
> >   - 01: mm change, target for mm tree
> >   - 02-09: KVM change, target for KVM tree
>
> A version with all of my feedback, plus reworked versions of Vishal's selftest,
> is available here:
>
>   git@github.com:sean-jc/linux.git x86/upm_base_support
>
> It compiles and passes the selftest, but it's otherwise barely tested.  There are
> a few todos (2 I think?) and many of the commits need changelogs, i.e. it's still
> a WIP.
>
> As for next steps, can you (handwaving all of the TDX folks) take a look at what
> I pushed and see if there's anything horrifically broken, and that it still works
> for TDX?
>
> Fuad (and pKVM folks) same ask for you with respect to pKVM.  Absolutely no rush
> (and I mean that).

Thanks for sharing this. I've had a look at the patches, and have
ported them to work with pKVM. At a high level, the new interface
seems fine and it works with the arm64/pKVM port. I have a couple of
comments regarding some of the details, but they can wait until v11 is
posted.

Cheers,
/fuad



> On my side, the two things on my mind are (a) tests and (b) downstream dependencies
> (SEV and TDX).  For tests, I want to build a lists of tests that are required for
> merging so that the criteria for merging are clear, and so that if the list is large
> (haven't thought much yet), the work of writing and running tests can be distributed.
>
> Regarding downstream dependencies, before this lands, I want to pull in all the
> TDX and SNP series and see how everything fits together.  Specifically, I want to
> make sure that we don't end up with a uAPI that necessitates ugly code, and that we
> don't miss an opportunity to make things simpler.  The patches in the SNP series to
> add "legacy" SEV support for UPM in particular made me slightly rethink some minor
> details.  Nothing remotely major, but something that needs attention since it'll
> be uAPI.
>
> I'm off Monday, so it'll be at least Tuesday before I make any more progress on
> my side.
>
> Thanks!

