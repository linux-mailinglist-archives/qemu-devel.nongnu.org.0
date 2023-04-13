Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3546C6E17E3
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 01:09:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn62R-0004We-A3; Thu, 13 Apr 2023 19:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3L4s4ZAYKClAAws51uy66y3w.u648w4C-vwDw3565y5C.69y@flex--seanjc.bounces.google.com>)
 id 1pn62O-0004WW-J5
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 19:07:32 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3L4s4ZAYKClAAws51uy66y3w.u648w4C-vwDw3565y5C.69y@flex--seanjc.bounces.google.com>)
 id 1pn62M-0000yq-Ss
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 19:07:32 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-54ee397553eso169925027b3.19
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 16:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1681427248; x=1684019248;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=m0eoChJ3C+wX0j/cXmxt8QdAgHqIaCqFV7218jkkfFU=;
 b=cUBnq6doIYuLvUGVyiYaA7jpkgVtHOtimIKcwt2fzUEGbTagC+SbFxwzie3YwQBvoi
 2tvxYDlX35dBRsyJ0dqJ0imqCLe7ogS8WTyC7A5vLzXCTzi2nfvrTc7VxeigvLRuypoj
 d9zWu9lsiLRAeEcyRqF2vB0H2fEa6JEL4FKRXo81NT0wlQUQMuRZJC6/qqZxiWVlFuvs
 rCpdS64PxIo7V8SajS2etdSOROdKTmlVD4sBgXB1W2FZSMb7wXUNI2yqiz+J9cWyF9eb
 0i6PytQOESujv8I6M/6hszVyOyKaqVF3BjpcBY+b2iw09H2OLHz5o/ci5kucUCGLlxuh
 5zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681427248; x=1684019248;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m0eoChJ3C+wX0j/cXmxt8QdAgHqIaCqFV7218jkkfFU=;
 b=G7wiqnwBT2GOA8sN/t2UaXuOu9yP/mCypCOM9OnyBSAGyVFTxVSBlehgaKpq/aBFQl
 uJW1FS1iNIiwFAo1COvjFizwryMquTmEWoDfujMcqzvJqC4SPz5LU9v2P3f3V9ucHrwi
 XrBYk74VIXCnl58m4vWS8xgom0UV66pZwfioso5tVOqWXl6K2fByWRlKujGocgt9iCaK
 AIf0VjckLn0JKFD3IfMjXYXlc+qH+lr3XV07V5QDfiZUOeELM50DMnJ7ZM3CdcNWi1WO
 Dicx2HNHFuY5xClll/gJoHGZcvP3+GOLiUvnguIR5CUJEOwseUPi+maRwwnmwb2bZu9s
 tRDQ==
X-Gm-Message-State: AAQBX9ff2hoHwQQpxAHKIVfav7oS+l0DE5LgiKwOh+gi0B8gyEi21tF1
 S7LCzEQD4jOENKvvUMdcPiPMq/NPTYo=
X-Google-Smtp-Source: AKy350amwDqyJa+LlzM7biYAI+3i1mkieCfxZS836tmzptZ4SOWRoy5g8JqAYQ9+zKy/xdEKWNYlO5mXB8A=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:d0d6:0:b0:b8f:559f:bd49 with SMTP id
 h205-20020a25d0d6000000b00b8f559fbd49mr2479865ybg.6.1681427247867; Thu, 13
 Apr 2023 16:07:27 -0700 (PDT)
Date: Thu, 13 Apr 2023 23:07:26 +0000
In-Reply-To: <diqzedono0m5.fsf@ackerleytng-cloudtop.c.googlers.com>
Mime-Version: 1.0
References: <20230412-kurzweilig-unsummen-3c1136f7f437@brauner>
 <diqzedono0m5.fsf@ackerleytng-cloudtop.c.googlers.com>
Message-ID: <ZDiLLih4XHUCCwFY@google.com>
Subject: Re: [RFC PATCH v3 1/2] mm: restrictedmem: Allow userspace to specify
 mount for memfd_restricted
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Christian Brauner <brauner@kernel.org>, kvm@vger.kernel.org,
 linux-api@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, qemu-devel@nongnu.org, aarcange@redhat.com, 
 ak@linux.intel.com, akpm@linux-foundation.org, arnd@arndb.de, 
 bfields@fieldses.org, bp@alien8.de, chao.p.peng@linux.intel.com, 
 corbet@lwn.net, dave.hansen@intel.com, david@redhat.com, ddutile@redhat.com, 
 dhildenb@redhat.com, hpa@zytor.com, hughd@google.com, jlayton@kernel.org, 
 jmattson@google.com, joro@8bytes.org, jun.nakajima@intel.com, 
 kirill.shutemov@linux.intel.com, linmiaohe@huawei.com, luto@kernel.org, 
 mail@maciej.szmigiero.name, mhocko@suse.com, michael.roth@amd.com, 
 mingo@redhat.com, naoya.horiguchi@nec.com, pbonzini@redhat.com, 
 qperret@google.com, rppt@kernel.org, shuah@kernel.org, steven.price@arm.com, 
 tabba@google.com, tglx@linutronix.de, vannapurve@google.com, vbabka@suse.cz, 
 vkuznets@redhat.com, wanpengli@tencent.com, wei.w.wang@intel.com, 
 x86@kernel.org, yu.c.zhang@linux.intel.com
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3L4s4ZAYKClAAws51uy66y3w.u648w4C-vwDw3565y5C.69y@flex--seanjc.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

On Thu, Apr 13, 2023, Ackerley Tng wrote:
> Christian Brauner <brauner@kernel.org> writes:
> > I'm curious, is there an LSFMM session for this?
> 
> As far as I know, there is no LSFMM session for this.

Correct, no LSFMM session.  In hindsight, that's obviously something we should
have pursued :-(

