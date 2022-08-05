Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6887158AB8D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 15:25:01 +0200 (CEST)
Received: from localhost ([::1]:44930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJxK0-0007Mj-Au
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 09:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oJxIB-00059F-74
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 09:23:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oJxI9-0001KK-In
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 09:23:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659705785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cvTnOWMtENdA0lewWHSDMt4C5p+Z0vLjSaKneQSan0A=;
 b=BGOnIsYYyWd0V9WzIRZqQ422E4dg1Kq6/GwbNLVLfvfstFjsY5jyeAuQFHH8VM97bDeEzv
 i6SQLr5PlAT5Logsl1b8p38adfAOQ3U+hOSjeZ3wqGojexofmO6gEmE1QBcqDoUHq2RnKK
 w6drTMDNfTgtZJPSX1XLsTVC8+TKP+g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-2Vof4jKXNQeyGCsWui2acg-1; Fri, 05 Aug 2022 09:23:02 -0400
X-MC-Unique: 2Vof4jKXNQeyGCsWui2acg-1
Received: by mail-wm1-f69.google.com with SMTP id
 n19-20020a05600c3b9300b003a314062cf4so3555785wms.0
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 06:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=cvTnOWMtENdA0lewWHSDMt4C5p+Z0vLjSaKneQSan0A=;
 b=CiImyneI8x2dmVnRMfIwh3COktLkXSXO7oXVYFYMSUFk2cTTjsMDYD1kcI6jh6WLdy
 dtLpRkMnMdrSQDQOPm/YGF6LW37Tr0ycfrNNtcLnW1IHOw7Lxq2tqxYaycT+YJL6PLvb
 0tzdgNR13yyZNtJmqWmwDS6y320iDl0DnGuzuMITxVfw+13Dmyo2sy9PCGAQLgZizowR
 fIoekvpogAz2k+hEWwOxK8E4LDL0jytVSNeaMRMfNAUS9gUtRlzMwmf1SXPxarxLLU4/
 jG04BWW9JhEAmhwqVZUgvRCBXUlK+Ho29e9EZ/OHhCFy4S46p1+Z3pHpl0jGvptDy9WS
 /3sw==
X-Gm-Message-State: ACgBeo2cTHzdy9R15sr2u2CGg7VeXtSzYKUc6qeTUJ7GBRMUlOMcJOk1
 806vZEM/8c2ebvgR1D88HD/AB/+Ty7ufdHOH5b0szHqFLpJafbUFZyaLJ1q8nwXlffje4vbO9Hc
 mSpWmD0znqE6Mfls=
X-Received: by 2002:adf:ce92:0:b0:220:5ef0:876d with SMTP id
 r18-20020adfce92000000b002205ef0876dmr4402384wrn.647.1659705781190; 
 Fri, 05 Aug 2022 06:23:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4uPBaWEs/z4mc87PDNQd0FqLSk3+CEo5G4UY36ZDFdxSdxTMNZ5FFOGBR2vXXQe8nDaUxZUw==
X-Received: by 2002:adf:ce92:0:b0:220:5ef0:876d with SMTP id
 r18-20020adfce92000000b002205ef0876dmr4402357wrn.647.1659705780923; 
 Fri, 05 Aug 2022 06:23:00 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:fb00:f5c3:24b2:3d03:9d52?
 (p200300cbc706fb00f5c324b23d039d52.dip0.t-ipconnect.de.
 [2003:cb:c706:fb00:f5c3:24b2:3d03:9d52])
 by smtp.gmail.com with ESMTPSA id
 h36-20020a05600c49a400b003a2c7bf0497sm4326304wmp.16.2022.08.05.06.22.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 06:23:00 -0700 (PDT)
Message-ID: <13394075-fca0-6f2b-92a2-f1291fcec9a3@redhat.com>
Date: Fri, 5 Aug 2022 15:22:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>, "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 aarcange@redhat.com, ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>,
 mhocko@suse.com, Muchun Song <songmuchun@bytedance.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-4-chao.p.peng@linux.intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v7 03/14] mm: Introduce memfile_notifier
In-Reply-To: <20220706082016.2603916-4-chao.p.peng@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 06.07.22 10:20, Chao Peng wrote:
> This patch introduces memfile_notifier facility so existing memory file
> subsystems (e.g. tmpfs/hugetlbfs) can provide memory pages to allow a
> third kernel component to make use of memory bookmarked in the memory
> file and gets notified when the pages in the memory file become
> invalidated.

Stupid question, but why is this called "memfile_notifier" and not
"memfd_notifier". We're only dealing with memfd's after all ... which
are anonymous files essentially. Or what am I missing? Are there any
other plans for fs than plain memfd support that I am not aware of?

> 
> It will be used for KVM to use a file descriptor as the guest memory
> backing store and KVM will use this memfile_notifier interface to
> interact with memory file subsystems. In the future there might be other
> consumers (e.g. VFIO with encrypted device memory).
> 
> It consists below components:
>  - memfile_backing_store: Each supported memory file subsystem can be
>    implemented as a memory backing store which bookmarks memory and
>    provides callbacks for other kernel systems (memfile_notifier
>    consumers) to interact with.
>  - memfile_notifier: memfile_notifier consumers defines callbacks and
>    associate them to a file using memfile_register_notifier().
>  - memfile_node: A memfile_node is associated with the file (inode) from
>    the backing store and includes feature flags and a list of registered
>    memfile_notifier for notifying.
> 
> In KVM usages, userspace is in charge of guest memory lifecycle: it first
> allocates pages in memory backing store and then passes the fd to KVM and
> lets KVM register memory slot to memory backing store via
> memfile_register_notifier.

Can we add documentation/description in any form how the different
functions exposed in linux/memfile_notifier.h are supposed to be used?

Staring at memfile_node_set_flags() and memfile_notifier_invalidate()
it's not immediately clear to me who's supposed to call that and under
which conditions.

-- 
Thanks,

David / dhildenb


