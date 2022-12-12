Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 004BE64A352
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 15:30:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4joT-0007lB-9d; Mon, 12 Dec 2022 09:29:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4joN-0007gi-4W
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:29:43 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4joL-0006eT-7g
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:29:42 -0500
Received: by mail-wm1-x32a.google.com with SMTP id m19so5534872wms.5
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 06:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=fuRkfpt+PbnKbNQAIgpxVq6YI+F7LQQL85s8GrPg0XE=;
 b=OX8pgzfdq0H6+zzByTSSbuE6N3E1jBVVTHaTxcvWAoNXqH9REcKI3s2/gVOVfnh2c1
 6yvhGABcgMP9EuvSYXOwzfW/n7v4OhquQ5HhfcPnzxMA5PvRN7VU2M916PzEgvPA++84
 gSrdSAkmCOS+dMd5E+8aT+EecSK3tXXZtMc/qvUtS9ALD0v37iNyOSPcvpjC1kmyyg9y
 TWWQIhRLqfpDXHe5z8e2K+MH/Hj883HBn+lDPbRQMrCpVgLzLkdvLmUpNoCJbF/PpOCO
 QhMNaXa05FswEg2kjlWMXujKxQulFxOEenoPVr3nhacUNVa29zvd1x/T2gZmbVl20RUk
 ddgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fuRkfpt+PbnKbNQAIgpxVq6YI+F7LQQL85s8GrPg0XE=;
 b=0mNgPXWAEkkVskbPVscy5mz7tiHsePFD0TEreSeKKa7+cOh1wk9X6lyWOaMFB8+5P/
 LTAyMm088BJUmr2xqJb9GWiTnuIPtbkHLyVkWa0+d9tjRAC/Fb8La4hAx6nqWGjogzSE
 AlLKVQOIRi+19rWfs1DmuWLVLtuZWrS6Wx+OZD21/Oo/1ZtlFiywowi37LFliLKZdhIn
 hlZgXCN+UR5LLhlBB69gCozT/q4ENi9Qf5Pp5H/G8GTJhHpa2sJQZuZiDoSxoKKX6k2H
 YFIzaFkAYDdpD+Xm1uXEwxQaP9vdzZuDwuKxnqA1H1tqEi/r+S5wN+lbt1qJDMKF6PsQ
 8OPw==
X-Gm-Message-State: ANoB5pl5J53lZOA7eStfypCjLEnZz0qGmsAlWbnIWp7eqPgHj7kharQK
 IoTPe78DXV2rlRbz9VWDeJk=
X-Google-Smtp-Source: AA0mqf7IaL2SyhrvEjvT8Y/NbkW4edDzIR48Np/O/FsKYH53WPVU8WFqkNOeqbFjI71cfl7n542HXg==
X-Received: by 2002:a1c:6a04:0:b0:3c6:f6b4:6b0b with SMTP id
 f4-20020a1c6a04000000b003c6f6b46b0bmr12349929wmc.20.1670855379954; 
 Mon, 12 Dec 2022 06:29:39 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:a16d:8ab1:4623:169?
 ([2a00:23c5:5785:9a01:a16d:8ab1:4623:169])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c310b00b003b47e75b401sm10504649wmo.37.2022.12.12.06.29.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 06:29:39 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <58062a00-dcbe-c42c-3a18-8b55ca61939c@xen.org>
Date: Mon, 12 Dec 2022 14:29:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 12/22] hw/xen: Add xen_overlay device for emulating
 shared xenheap pages
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-13-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221209095612.689243-13-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 09/12/2022 09:56, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> For the shared info page and for grant tables, Xen shares its own pages
> from the "Xen heap" to the guest. The guest requests that a given page
> from a certain address space (XENMAPSPACE_shared_info, etc.) be mapped
> to a given GPA using the XENMEM_add_to_physmap hypercall.
> 
> To support that in qemu when *emulating* Xen, create a memory region
> (migratable) and allow it to be mapped as an overlay when requested.
> 
> Xen theoretically allows the same page to be mapped multiple times
> into the guest, but that's hard to track and reinstate over migration,
> so we automatically *unmap* any previous mapping when creating a new
> one. This approach has been used in production with.... a non-trivial
> number of guests expecting true Xen, without any problems yet being
> noticed.
> 
> This adds just the shared info page for now. The grant tables will be
> a larger region, and will need to be overlaid one page at a time. I
> think that means I need to create separate aliases for each page of
> the overall grant_frames region, so that they can be mapped individually.
> 

Is the following something you want in the commit log?

> Expecting some heckling at the use of xen_overlay_singleton. What is
> the best way to do that? Using qemu_find_recursive() every time seemed
> a bit wrong. But I suppose mapping it into the *guest* isn't a fast
> path, and if the actual grant table code is allowed to just stash the
> pointer it gets from xen_overlay_page_ptr() for later use then that
> isn't a fast path for device I/O either.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/meson.build   |   1 +
>   hw/i386/kvm/xen_overlay.c | 198 ++++++++++++++++++++++++++++++++++++++
>   hw/i386/kvm/xen_overlay.h |  14 +++
>   hw/i386/pc_piix.c         |   8 ++
>   4 files changed, 221 insertions(+)
>   create mode 100644 hw/i386/kvm/xen_overlay.c
>   create mode 100644 hw/i386/kvm/xen_overlay.h
> 
[snip]

> +static int xen_overlay_map_page_locked(uint32_t space, uint64_t idx, uint64_t gpa)
> +{
> +    MemoryRegion *ovl_page;
> +    int err;
> +
> +    if (space != XENMAPSPACE_shared_info || idx != 0)
> +        return -EINVAL;
> +
> +    if (!xen_overlay_singleton)
> +        return -ENOENT;
> +
> +    ovl_page = &xen_overlay_singleton->shinfo_mem;
> +
> +    /* Xen allows guests to map the same page as many times as it likes
> +     * into guest physical frames. We don't, because it would be hard
> +     * to track and restore them all. One mapping of each page is
> +     * perfectly sufficient for all known guests... and we've tested
> +     * that theory on a few now in other implementations. dwmw2. */
> +    if (memory_region_is_mapped(ovl_page)) {
> +        if (gpa == INVALID_GPA) {
> +            /* If removing shinfo page, turn the kernel magic off first */
> +            if (space == XENMAPSPACE_shared_info) {
> +                err = xen_overlay_set_be_shinfo(INVALID_GFN);
> +                if (err)
> +                    return err;
> +            }
> +            memory_region_del_subregion(get_system_memory(), ovl_page);
> +            goto done;

This seems a little ugly when you could...

> +        } else {
> +            /* Just move it */
> +            memory_region_set_address(ovl_page, gpa);
> +        }
> +    } else if (gpa != INVALID_GPA) {
> +        memory_region_add_subregion_overlap(get_system_memory(), gpa, ovl_page, 0);
> +    }
> +

... just wrap the following line in 'if (gpa != INVALID_GPA)'

Paul

> +    xen_overlay_set_be_shinfo(gpa >> XEN_PAGE_SHIFT);
> + done:
> +    xen_overlay_singleton->shinfo_gpa = gpa;
> +    return 0;
> +}
> +


