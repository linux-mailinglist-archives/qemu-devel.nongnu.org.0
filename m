Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E44687C10
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:17:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNXav-0007qT-04; Thu, 02 Feb 2023 06:17:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXar-0007qH-RM
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:17:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXaq-00046z-Bj
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:17:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675336647;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=8TQeJT96atoimZnb2PC+LQ3f3jfdkGx9zagRQ0e4H6w=;
 b=NZV5FsSxm+qtEruTVYbQy/tBNmIVCXe4SSsvDiaXeFYxAyiPKrK3HdJ6mCzjWeua3P428i
 I4iX0Ff51TfGrwJkEJMIQ4PfYf9HXRQwfx/OUJcscsz+pAQrtBpgBB7IUwAF3czNneBtAg
 9FgU0kUQPGsrr1SONWmI0Thb9vHKliM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-520-BkP_SgC6NQCXmL2ddbdS7g-1; Thu, 02 Feb 2023 06:17:26 -0500
X-MC-Unique: BkP_SgC6NQCXmL2ddbdS7g-1
Received: by mail-wm1-f72.google.com with SMTP id
 l5-20020a1ced05000000b003db300f2e1cso803166wmh.0
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 03:17:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8TQeJT96atoimZnb2PC+LQ3f3jfdkGx9zagRQ0e4H6w=;
 b=axSwTM225cFWbaoclRUJv+OZf8YtYT8JR5AA1h5YlTZp0oLjePK/f4LzJuswkIkrqC
 R0uLJ/PiVvOz3xCrG8uKuQyKIRPZFRtolBjQHltWZhdGRgolVLV0kw16/oQmaGqiRD+r
 xdXP3QlN5yU/pGhtZf8pIdCLv/TBa1SMUlK/9i/UGjSNlUlr92SrDRyWf00Lr4oLj4XA
 BNy5e6lxDwLMut+MgirHRkc9r1L7htaeBWc/uT6hoegonyYbn/D6ZDlSWjNMBBCdEMKO
 9pO55jLyewbd9nbq38er7vH5JzRM0Kq+ojm1XFSlyTyBQG+dAVCSiMDfmezDnkAcJtUH
 5xiQ==
X-Gm-Message-State: AO0yUKXzhpWdTDxJDGldRRr72rf+Sqiw1EPSA/+t3D75r1wjmru0TcrY
 hRYpX2vVaqvCPbzKZXzQJsnGfhUWoZ/3bJ2YfuDZZmrAaK2ZrwMtF+GxbBHkqBO/KzaI1WcKvPs
 n4Zwiz4iXaw37sj8=
X-Received: by 2002:a5d:4d84:0:b0:2bf:b872:cf21 with SMTP id
 b4-20020a5d4d84000000b002bfb872cf21mr5459637wru.0.1675336645312; 
 Thu, 02 Feb 2023 03:17:25 -0800 (PST)
X-Google-Smtp-Source: AK7set8Pc6QoJ3RoPmRVwbSgHof/ASxT/Xz5wGugYHPVc05hU0cMXTmkNh4Se2GFN1DL5R0cI7EE+Q==
X-Received: by 2002:a5d:4d84:0:b0:2bf:b872:cf21 with SMTP id
 b4-20020a5d4d84000000b002bfb872cf21mr5459621wru.0.1675336645158; 
 Thu, 02 Feb 2023 03:17:25 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 j9-20020a5d6189000000b002c285b4d2b5sm6651100wru.101.2023.02.02.03.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 03:17:24 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>,  Andrey Gruzdev
 <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v1 3/5] migration/ram: Don't explicitly unprotect when
 unregistering uffd-wp
In-Reply-To: <20230105124528.93813-4-david@redhat.com> (David Hildenbrand's
 message of "Thu, 5 Jan 2023 13:45:26 +0100")
References: <20230105124528.93813-1-david@redhat.com>
 <20230105124528.93813-4-david@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 12:17:23 +0100
Message-ID: <87o7qcqpto.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
> When unregistering uffd-wp, older kernels before commit f369b07c86143
> ("mm/uffd:reset write protection when unregister with wp-mode") won't
> clear the uffd-wp PTE bit. When re-registering uffd-wp, the previous
> uffd-wp PTE bits would trigger again. With above commit, the kernel will
> clear the uffd-wp PTE bits when unregistering itself.
>
> Consequently, we'll clear the uffd-wp PTE bits now twice -- whereby we
> don't care about clearing them at all: a new background snapshot will
> re-register uffd-wp and re-protect all memory either way.
>
> So let's skip the manual clearing of uffd-wp. If ever relevant, we
> could clear conditionally in uffd_unregister_memory() -- we just need a
> way to figure out more recent kernels.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Fixing a bug by removing code O:-)


