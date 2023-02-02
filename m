Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D2A687C18
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:21:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNXeR-0001Ln-V2; Thu, 02 Feb 2023 06:21:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXeN-0001LX-AC
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:21:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXeI-0006Fv-Pb
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:21:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675336861;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=cWYesjO+NE9umEzkMlX6sc+1G+nJib9FPCkATIoQkgw=;
 b=FAp9qbybfYLPS8tY9s1+6BFSKtZChduHW7Ekw3Y1GDXsbZrXYZ0vQW6CykRbLAtLLAE63Z
 i5SqDvLxmSxs3toe65QvzxkPOByvQVS2Rf/ldQYh/CeBEDQorgYaokbt2YFmRl/+o0PGmC
 eLLKLFiCLrNy4071Txle9uAHG5iiKEY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-100-9oAvsyxfPoGF0HY7089V_Q-1; Thu, 02 Feb 2023 06:21:00 -0500
X-MC-Unique: 9oAvsyxfPoGF0HY7089V_Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 o42-20020a05600c512a00b003dc5341afbaso781319wms.7
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 03:21:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cWYesjO+NE9umEzkMlX6sc+1G+nJib9FPCkATIoQkgw=;
 b=y8wUksmatHMSCbBITwbp5z8PCtIE4bhS68YQymXfpe/2x5c25Mu0r1DcQVG3c69ySj
 ABrEFnZuIMIml7k/mLqKnjD/1KwAb9CXjDIASn31RmeCqtelLpBOL/yNXXMfsg9OWBJR
 pd9UAqFFr8k1Gb/WBNapXRe3Nf6CjIDIyGi2SuP/6tfkqIlhQVjAg5Mg6d7vx3b+rzlS
 An3stq7+JekFnM7LBd4XHVwIOfFi2dKSDvtOrb85va0qMDYr50Kl27gewVKrpD9bj4F1
 zN85GV+PLV2BqOfuY8n08E39IjK5meJuZ4Lb2Tig8LcP0FSETW41ry58cb1irIQQVQfp
 z6ag==
X-Gm-Message-State: AO0yUKWZ22eimLk5Q/UKweuc6osUwEPIOFqRV8oA0g7gTUv6bYwxqpm9
 wqDRX3q+uZXrmCNo1MwZHi/yQEViCKiHiR6B85k4rsYLtZL0Rx1qBH/KrUlocoPywBpt53PZya4
 2iMOC9vvTgD9GwDQ=
X-Received: by 2002:a05:600c:4e55:b0:3d9:e5d3:bf with SMTP id
 e21-20020a05600c4e5500b003d9e5d300bfmr5498384wmq.32.1675336859127; 
 Thu, 02 Feb 2023 03:20:59 -0800 (PST)
X-Google-Smtp-Source: AK7set9ExaBybqvU+8645XRSmQgX8XF0Cd1YSfZt+etX5S/j6XKf/8KrcHtV/wGvY6R++Zall+hUlA==
X-Received: by 2002:a05:600c:4e55:b0:3d9:e5d3:bf with SMTP id
 e21-20020a05600c4e5500b003d9e5d300bfmr5498373wmq.32.1675336858958; 
 Thu, 02 Feb 2023 03:20:58 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 q10-20020a05600c330a00b003cffd3c3d6csm4348915wmp.12.2023.02.02.03.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 03:20:58 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>,  Andrey Gruzdev
 <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v1 5/5] migration/ram: Optimize
 ram_write_tracking_start() for RamDiscardManager
In-Reply-To: <20230105124528.93813-6-david@redhat.com> (David Hildenbrand's
 message of "Thu, 5 Jan 2023 13:45:28 +0100")
References: <20230105124528.93813-1-david@redhat.com>
 <20230105124528.93813-6-david@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 12:20:57 +0100
Message-ID: <87fsboqpnq.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

David Hildenbrand <david@redhat.com> wrote:
> ram_block_populate_read() already optimizes for RamDiscardManager.
> However, ram_write_tracking_start() will still try protecting discarded
> memory ranges.
>
> Let's optimize, because discarded ranges don't map any pages and
>
> (1) For anonymous memory, trying to protect using uffd-wp without a mapped
>     page is ignored by the kernel and consequently a NOP.
>
> (2) For shared/file-backed memory, we will fill present page tables in the
>     range with PTE markers. However, we will even allocate page tables
>     just to fill them with unnecessary PTE markers and effectively
>     waste memory.
>
> So let's exclude these ranges, just like ram_block_populate_read()
> already does.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


