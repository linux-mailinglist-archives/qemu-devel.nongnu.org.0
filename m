Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 696B96E970E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 16:28:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppVGh-0001U5-Ld; Thu, 20 Apr 2023 10:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ppVGg-0001Tc-AO
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 10:28:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ppVGe-0007wL-P0
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 10:28:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682000891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zA7AXhEtagTkZkpFoPx2UbK4fknnVD5KFxoiQEkDJ1w=;
 b=aUQ9AfWSapwJ5mke6SCgWZlqRfkdk9l8sKahchgChQw1Bh/zgIcl+C7Oit6LjVgD+vcmC9
 eKqAUaS07NCyxIALvyZL9PBcyn3ak0YCKPTAX2E2lmP1SWULEsTBTjYMenshgbMXGLBwcb
 b+9NEPKjicBh8N5iT+4qjZjbVgZpZyU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-PzG0VWeROa65t6k5QYAf5Q-1; Thu, 20 Apr 2023 10:28:10 -0400
X-MC-Unique: PzG0VWeROa65t6k5QYAf5Q-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-5ef6c09fa0dso4329356d6.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 07:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682000890; x=1684592890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zA7AXhEtagTkZkpFoPx2UbK4fknnVD5KFxoiQEkDJ1w=;
 b=cZNttxv/IjQtvDuPxaUpDJEHyw9xmBMo79ehh4TIPymcfKpFN+YG8/4pumSgoXgqiL
 DerdGXAGDVgJJHaLPzmJXkb2se70ZZqNxuT+pYps7EwN5yax9qf/9bYfRZXFguIJ4CF0
 pECylCP4NUD/Wg6CnrgCwUtseuwwekf7dktJrV000TNjKbCnfJxN1tQ+lEnclb4j9yG6
 5ZpXfg6snq5FpqmN2p8RYaUUbJLrS878ezz3ZFRbr0GS2LhbE3Na8ZjQr2PgQMPstobC
 wPsJgKyuYWk1YhNbtJqHa97+Cobv41aOa5L3Hk4ZNBb2OUdOL8qLclcfZsEfbN7x3r4z
 LABg==
X-Gm-Message-State: AAQBX9fY0S7qB5dC3ElzKf5K36nXd0inWDxoMWyWE6PKV12+i8x5DgCs
 NKJpEKkjbqquLYdKTvuIC6CCYRjuFp/hp2HcrY1LEW9yX0mWNnZKgy2dlpDoHJWEgOBOdWFzbQJ
 v5G2RNUoT9TRhZDo=
X-Received: by 2002:a05:6214:27c2:b0:5ad:2a05:ddd1 with SMTP id
 ge2-20020a05621427c200b005ad2a05ddd1mr2089390qvb.34.1682000890080; 
 Thu, 20 Apr 2023 07:28:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350YmnUk4Qz5XBPA1ey0P+QXhbFiRhQ2P8WZZCSvsyrbk5a75MHTvo71NO3ojFv7jUIECPqUmLQ==
X-Received: by 2002:a05:6214:27c2:b0:5ad:2a05:ddd1 with SMTP id
 ge2-20020a05621427c200b005ad2a05ddd1mr2089373qvb.34.1682000889867; 
 Thu, 20 Apr 2023 07:28:09 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 r11-20020ac8520b000000b003e69d6792f6sm524024qtn.45.2023.04.20.07.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 07:28:09 -0700 (PDT)
Date: Thu, 20 Apr 2023 16:28:05 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>
Subject: Re: [PATCH v2 0/3] vhost: memslot handling improvements
Message-ID: <20230420162805.6781701b@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230316153658.214487-1-david@redhat.com>
References: <20230316153658.214487-1-david@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 16 Mar 2023 16:36:55 +0100
David Hildenbrand <david@redhat.com> wrote:

> Following up on my previous work to make virtio-mem consume multiple
> memslots dynamically [1] that requires precise accounting between used vs.
> reserved memslots, I realized that vhost makes this extra hard by
> filtering out some memory region sections (so they don't consume a
> memslot) in the vhost-user case, which messes up the whole memslot
> accounting.
> 
> This series fixes what I found to be broken and prepares for more work on
> [1]. Further, it cleanes up the merge checks that I consider unnecessary.

Acked-by: Igor Mammedov <imammedo@redhat.com>

> 
> [1] https://lkml.kernel.org/r/20211027124531.57561-8-david@redhat.com
> 
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> 
> v1 -> v2:
> - "vhost: Rework memslot filtering and fix "used_memslot" tracking"
> -- New approach: keep filtering, but make filtering less generic and
>    track separately. This should keep any existing setups working.
> - "softmmu/physmem: Fixup qemu_ram_block_from_host() documentation"
> -- As requested by Igor
> 
> David Hildenbrand (3):
>   vhost: Rework memslot filtering and fix "used_memslot" tracking
>   vhost: Remove vhost_backend_can_merge() callback
>   softmmu/physmem: Fixup qemu_ram_block_from_host() documentation
> 
>  hw/virtio/vhost-user.c            | 21 ++---------
>  hw/virtio/vhost-vdpa.c            |  1 -
>  hw/virtio/vhost.c                 | 62 ++++++++++++++++++++++++-------
>  include/exec/cpu-common.h         | 15 ++++++++
>  include/hw/virtio/vhost-backend.h |  9 +----
>  softmmu/physmem.c                 | 17 ---------
>  6 files changed, 68 insertions(+), 57 deletions(-)
> 


