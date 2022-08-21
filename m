Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D79359B204
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Aug 2022 07:18:49 +0200 (CEST)
Received: from localhost ([::1]:39026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPdMF-0000v1-Tw
	for lists+qemu-devel@lfdr.de; Sun, 21 Aug 2022 01:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hughd@google.com>) id 1oPdJW-0007m1-6C
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 01:15:58 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:35820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hughd@google.com>) id 1oPdJU-00079M-Jb
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 01:15:57 -0400
Received: by mail-qk1-x729.google.com with SMTP id b9so5900312qka.2
 for <qemu-devel@nongnu.org>; Sat, 20 Aug 2022 22:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:from:to:cc;
 bh=ICbJbu994zVr5Xs1z95aw5HWEa26kaUMyLqHNb1JBhY=;
 b=PN7QnVx2jBrgPHqyqwc/bGpaE8KQadBOlUYLB6T+dOoTpwUJFZfkh7+JVXHp8AIDdn
 aHVqAoV2ZwSdEszZ8lrHjiDGK+3Uii266yrUQ3R+HEjiDpKwO+93234VMS0VxIslm3a2
 GnKw+ulrN3ttL/lmXtLFPyG1MFfOBD03JI5VIL8VtHlzN+J13QiCn0MqBcDQjVUJ2yxu
 YXyfDyjsbE5tLakbt0uihPXt6VtlTnTU8qek0GTcV92IjJUEcnKUo2hYjjstnq3Z/sjr
 QdiFfxuMoiaHkH94kHcVhCTjcWUnNDlAi3dffLlojPKp6NroKfJZsJrztnzru2HRTkKk
 WHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc;
 bh=ICbJbu994zVr5Xs1z95aw5HWEa26kaUMyLqHNb1JBhY=;
 b=CkEvAJby4VyIZmTCuNL+R9LERm8I2rFC3RA1hKq81JhlL9sX+JzlXJ8/9LOhJNwgJV
 wS15Ul7qkTcl7a0lM/po3+PCpbEUISWfN6VOoFU+yRwHVCRsy6RfoHFvjDmX0HtvXLUy
 G99AQFlOT2H02x3qzBK+ZuDANGWngWGFLwO9H5VZ9ng5Fishp3FHF+r0kZZHVlJFo4hK
 nIcvp4ManMESE+dRzthyRCKkBneUvpJn33q0CjPkZdG01/6GPqiKUGehDfPgQgHWBGR5
 RkUKZ994P5q1yVQRk+VnbPP/W6I4keD8xtXl61p4vvTLMqyJJ6i0XmCP6jWOa4ng6Z44
 oAiw==
X-Gm-Message-State: ACgBeo1sod0P/5YBYkt04A2zKDzKo1OSG/rEsRmkwfDtnlf4Hf3nwptj
 7nIB/cppBYum01w4ki9LzVH+lg==
X-Google-Smtp-Source: AA6agR68yl2fr8PEnDujhC7M2MHll9zueDCXCVVuM/SRsb8w23zlYBdOQcq71uTGZEOLB6PPe+MzJQ==
X-Received: by 2002:a05:620a:70a:b0:6b6:1997:b7f2 with SMTP id
 10-20020a05620a070a00b006b61997b7f2mr9605948qkc.417.1661058954697; 
 Sat, 20 Aug 2022 22:15:54 -0700 (PDT)
Received: from ripple.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a05620a0bcb00b006bb9125363fsm7972537qki.121.2022.08.20.22.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Aug 2022 22:15:53 -0700 (PDT)
Date: Sat, 20 Aug 2022 22:15:32 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.anvils
To: "Kirill A. Shutemov" <kirill@shutemov.name>
cc: Hugh Dickins <hughd@google.com>, 
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, 
 Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H . Peter Anvin" <hpa@zytor.com>, Jeff Layton <jlayton@kernel.org>, 
 "J . Bruce Fields" <bfields@fieldses.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>, 
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>, 
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
 Yu Zhang <yu.c.zhang@linux.intel.com>, luto@kernel.org, 
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com, 
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com, 
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>, 
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, 
 Muchun Song <songmuchun@bytedance.com>, 
 "Gupta, Pankaj" <pankaj.gupta@amd.com>
Subject: Re: [PATCH v7 00/14] KVM: mm: fd-based approach for supporting KVM
 guest private memory
In-Reply-To: <20220820002700.6yflrxklmpsavdzi@box.shutemov.name>
Message-ID: <c194262b-b634-4baf-abf0-dc727e8f1d7@google.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <ff5c5b97-acdf-9745-ebe5-c6609dd6322e@google.com>
 <20220818132421.6xmjqduempmxnnu2@box>
 <c6ccbb96-5849-2e2f-3b49-4ea711af525d@google.com>
 <20220820002700.6yflrxklmpsavdzi@box.shutemov.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=hughd@google.com; helo=mail-qk1-x729.google.com
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

On Sat, 20 Aug 2022, Kirill A. Shutemov wrote:
> 
> Yes, INACCESSIBLE is increase of complexity which you do not want to deal
> with in shmem.c. It get it.

It's not so much that INACCESSIBLE increases the complexity of
memfd/shmem/tmpfs, as that it is completely foreign to it.

And by handling all those foreign needs at the KVM end (where you
can be sure that the mem attached to the fd is INACCESSIBLE because
you have given nobody access to it - no handshaking with 3rd party
required).

> 
> I will try next week to rework it as shim to top of shmem. Does it work
> for you?

Yes, please do, thanks.  It's a compromise between us: the initial TDX
case has no justification to use shmem at all, but doing it that way
will help you with some of the infrastructure, and will probably be
easiest for KVM to extend to other more relaxed fd cases later.

> 
> But I think it is wrong to throw it over the fence to KVM folks and say it
> is your problem. Core MM has to manage it.

We disagree on who is throwing over the fence to whom :)

Core MM should manage the core MM parts and KVM should manage the KVM
parts.  What makes this rather different from most driver usage of MM,
is that KVM seems likely to use a great proportion of memory this way.
With great memory usage comes great responsibility: I don't think
all those flags and seals and notifiers let KVM escape from that.

Hugh

