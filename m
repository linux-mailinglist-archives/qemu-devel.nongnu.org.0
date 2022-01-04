Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBED484704
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 18:32:49 +0100 (CET)
Received: from localhost ([::1]:55388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ng0-00059Y-6n
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 12:32:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1n4net-0003PD-C2
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 12:31:40 -0500
Received: from [2607:f8b0:4864:20::1032] (port=53107
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1n4ner-0003Ro-Qq
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 12:31:39 -0500
Received: by mail-pj1-x1032.google.com with SMTP id co15so31910558pjb.2
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 09:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rOI9lx3ly2W5g+I//wMzwDwVhtW2WkhsJvnaYL+oVaA=;
 b=GM1vaX8nnsQ5aen4uuxpsO114wif5ycCG9Oq+Pc5m0xedO5AWvlwlk+0nur670mGKt
 onzOYTKoI9ivHrmZ5omlX7G/9g8vG1Dk7BMz+AhbgZkQYjM5XKrkVKn/mua46+jhsgFl
 2x7N1/izW3LtGJIoZWWYJyzycZQWJVLVQuROwTwUx6Lb7wS1WfjJ2ZYfADX8e7fCk4Gv
 3x2oDnc8GvPEK74RL4V15y2/q8Wd2PT6kYpMQXV19pxe40QE3h194kOApOsI9U9v5KmD
 d9EPsZeQajXh15idUScX3jRX2SE0PftIP1z+OqwywcvLzNIoSgKRELKr5w7K0PR0/UYB
 ULOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rOI9lx3ly2W5g+I//wMzwDwVhtW2WkhsJvnaYL+oVaA=;
 b=zRhsRdgyVTPlNhB6YCgYaFeStKeXSb96e90kRq3+9YCTjuZyVSEU4gg/E3okunVINK
 STAtD/Kb0BzY61VoVfmfBWGOisfIR4KwfA3CwvY9I8ICgo/AwbOhYg1CYtUNsXAHs67/
 CIfdbtBLlQJuPNy9vt1543rp7432YKMA5CF5rtvkr3uK5EFLTxJvSQn/GdOOgFqgnjyT
 BeNetuXkJ+hXpO0c0+ihhfXtzR4sMIKibrFOOAu4ZcFh+BmD5/ZYKr/l0ut+/vF2vKYO
 Stc/q44+wpD8SgmKxFbOD1uDKCga6uGSEJpbDLH6hvG2afQR6r40gRSETfKnNMEw7coZ
 6Egw==
X-Gm-Message-State: AOAM530rumMHdi1aKG5lIoAmvPWwGVSdLz6g29zBIbysxmOO8MdCb2XU
 wtuqeoXagK9L9FcOuxoENv7I8Q==
X-Google-Smtp-Source: ABdhPJyW9pN160gPJHaycV7mP2xi077B27olHyhgGOoe6nr/BCGbiHdtFfrcOodNTbojl/LtojMyPQ==
X-Received: by 2002:a17:902:8645:b0:149:7d71:c229 with SMTP id
 y5-20020a170902864500b001497d71c229mr39146383plt.141.1641317493940; 
 Tue, 04 Jan 2022 09:31:33 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id l22sm43563684pfc.167.2022.01.04.09.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 09:31:33 -0800 (PST)
Date: Tue, 4 Jan 2022 17:31:30 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, john.ji@intel.com, susie.li@intel.com,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com
Subject: Re: [PATCH v3 kvm/queue 11/16] KVM: Add kvm_map_gfn_range
Message-ID: <YdSEcknuErGe0gQa@google.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-12-chao.p.peng@linux.intel.com>
 <YcS6m9CieYaIGA3F@google.com>
 <20211224041351.GB44042@chaop.bj.intel.com>
 <20211231023334.GA7255@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211231023334.GA7255@chaop.bj.intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=seanjc@google.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -148
X-Spam_score: -14.9
X-Spam_bar: --------------
X-Spam_report: (-14.9 / 5.0 requ) DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, FSL_HELO_FAKE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

On Fri, Dec 31, 2021, Chao Peng wrote:
> On Fri, Dec 24, 2021 at 12:13:51PM +0800, Chao Peng wrote:
> > On Thu, Dec 23, 2021 at 06:06:19PM +0000, Sean Christopherson wrote:
> > > On Thu, Dec 23, 2021, Chao Peng wrote:
> > > > This new function establishes the mapping in KVM page tables for a
> > > > given gfn range. It can be used in the memory fallocate callback for
> > > > memfd based memory to establish the mapping for KVM secondary MMU when
> > > > the pages are allocated in the memory backend.
> > > 
> > > NAK, under no circumstance should KVM install SPTEs in response to allocating
> > > memory in a file.   The correct thing to do is to invalidate the gfn range
> > > associated with the newly mapped range, i.e. wipe out any shared SPTEs associated
> > > with the memslot.
> > 
> > Right, thanks.
> 
> BTW, I think the current fallocate() callback is just useless as long as
> we don't want to install KVM SPTEs in response to allocating memory in a
> file. The invalidation of the shared SPTEs should be notified through 
> mmu_notifier of the shared memory backend, not memfd_notifier of the
> private memory backend.

No, because the private fd is the final source of truth as to whether or not a
GPA is private, e.g. userspace may choose to not unmap the shared backing.
KVM's rule per Paolo's/this proposoal is that a GPA is private if it has a private
memslot and is present in the private backing store.  And the other core rule is
that KVM must never map both the private and shared variants of a GPA into the
guest.

