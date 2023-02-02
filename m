Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D6E687C1B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:21:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNXeq-0001iC-1W; Thu, 02 Feb 2023 06:21:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXen-0001gD-PU
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:21:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXem-0006Jh-7B
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:21:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675336891;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=6PeqD2A47Fj0xgA92WPXGYRUiSsGO/fg3M22gllaEU8=;
 b=abHsjppQ7mFhqkAurcSi5PyfFtMsDRyr2aMxP7LT2f90rFcRZE1+YegGlZbWlwLkompVEJ
 USonMx/HScdeF9pOaEZuXvG+61eZj5CidMiofLe+6f18fuDSuodmVLQ4qPmt6W6iH79rWi
 vuhkiWKxaye1HnCgo3/jCQxdCgUXu/A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-651-DGTZ5yw4Ni6p97Iw206z3w-1; Thu, 02 Feb 2023 06:21:29 -0500
X-MC-Unique: DGTZ5yw4Ni6p97Iw206z3w-1
Received: by mail-wr1-f69.google.com with SMTP id
 r6-20020adff106000000b002bfe5fb9649so178840wro.14
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 03:21:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6PeqD2A47Fj0xgA92WPXGYRUiSsGO/fg3M22gllaEU8=;
 b=v1zM8x4Ohu6ihXTEX0OVTAhBGiwTE4RO1PWLGYipC+dsIQG/9avLVng9GCS9gi2eIN
 l5LThDoc0li34SOsKzW5wYOV8OOKl0IzRPaeGHd39c7JaIkLCf3OLsMymV2GU6fcQwqS
 vxGk8qXvk+OZ2cJe6i8hXV8uHPmRnw/Kw7e0nslPJ0KwvlMBcP2fAHGrTanLqx33yQcO
 A578mtNX1NWJSgAq96ktJeoqqMTDRpkAgaHOAt647fDwt6Dg8jhW/oL+nxQnCJtIVjDG
 oDMMr2cfYX7LzFO7H6Fz4WfupWk3R2oMCLM5lySmFF1aL7M8c9UkbN1UQULBoGND/sGA
 Esiw==
X-Gm-Message-State: AO0yUKVrgQgycR5Ifa3ze+7uH/4qr7We/OKcGVnfVZlGvLq9L3ilGSaD
 S6gR0ERsG9hfxb+3A99ZwEN36AgM8RMp+DTO3fT9zFHTpw9iXw1jHV3ftvQ5iRNfExXLzPtG8qk
 pz5sNUtm0Xiwi0zI=
X-Received: by 2002:a05:600c:4e55:b0:3d9:e5d3:bf with SMTP id
 e21-20020a05600c4e5500b003d9e5d300bfmr5500140wmq.32.1675336888866; 
 Thu, 02 Feb 2023 03:21:28 -0800 (PST)
X-Google-Smtp-Source: AK7set/+IePJRCbNKN1alCHkoSPMxzt7V15sZ/0cc/8IiaBAg5fyQBooSeCdQTGvfPXGso03ARP3NA==
X-Received: by 2002:a05:600c:4e55:b0:3d9:e5d3:bf with SMTP id
 e21-20020a05600c4e5500b003d9e5d300bfmr5500127wmq.32.1675336888699; 
 Thu, 02 Feb 2023 03:21:28 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 q6-20020a05600c46c600b003dc54344764sm4983119wmo.48.2023.02.02.03.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 03:21:28 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>,  Andrey Gruzdev
 <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v1 0/5] migration/ram: background snapshot fixes and
 optimiations
In-Reply-To: <d58a6dfb-cde4-151a-b258-e7fb9431eeda@redhat.com> (David
 Hildenbrand's message of "Mon, 23 Jan 2023 15:27:13 +0100")
References: <20230105124528.93813-1-david@redhat.com>
 <d58a6dfb-cde4-151a-b258-e7fb9431eeda@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 12:21:27 +0100
Message-ID: <87bkmcqpmw.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
> On 05.01.23 13:45, David Hildenbrand wrote:
>> Playing with background snapshots in combination with hugetlb and
>> virtio-mem, I found two issues and some reasonable optimizations (skip
>> unprotecting when unregistering).
>> With virtio-mem (RamDiscardManager), we now won't be allocating
>> unnecessary
>> page tables for unplugged ranges when using uffd-wp with shmem/hugetlb.
>> Cc: Juan Quintela <quintela@redhat.com> (maintainer:Migration)
>> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com> (maintainer:Migration)
>> Cc: Peter Xu <peterx@redhat.com>
>> Cc: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>
> @Juan, David: I can take this via my tree (especially the last patch
> only optimized virtio-mem for now). Just let me know.

I reviewed everything now.

Queued on my tree.

Later, Juan.


