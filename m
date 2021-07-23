Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 458633D3C0C
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 16:54:18 +0200 (CEST)
Received: from localhost ([::1]:43606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6wZ7-0004Yz-AR
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 10:54:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6wXk-00039t-0d
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 10:52:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6wXg-0003Wb-1M
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 10:52:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627051965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9y/PqKteAfvBTq9e0oqFOyML6XICHz17CtGJQ/jKIuE=;
 b=FZai+bP2yCkd0YM9a8SF6sIoSHKFenRyU5JXt4+E5ka0UfS/RqZAC6mjJN56MB1DnR4g4L
 ivWVbGnUcPRyKyt+yvf0o/h3q6xOGKgY6ux9adw1UBP/aurVv4z7JJj+5muADOZA5BzgJh
 zdvhLaDiQP3xL9wEjUw8iE9dlqLJTFs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-6YKCFJtdOyKzEfqeeerlZw-1; Fri, 23 Jul 2021 10:52:44 -0400
X-MC-Unique: 6YKCFJtdOyKzEfqeeerlZw-1
Received: by mail-qk1-f198.google.com with SMTP id
 w26-20020a05620a129ab02903b9eeb8b45dso1177167qki.8
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 07:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9y/PqKteAfvBTq9e0oqFOyML6XICHz17CtGJQ/jKIuE=;
 b=pyj6Ci5OVBaQcrjrGW4bHHcBDlns4AbnMdnD5NloFqU6JfbKswMohs0PQXoG/NSxBK
 YeUxGlIRZzmFUgKyO8P5wC4LcynFdfKsb/oB3eDIn0Ga9if7PN+8v3JQ/FIZBZjzGBeA
 iRUEqYN4Brd8h9twsn/NKCkQqcxCUA4z2kuJaKJO4qA0mDXxk9yVCx7LvgOnpB21Lb85
 rsLPHZELzgbMD521cC7LJZb6kuijaoFa90COH9kv4tTTyt47IaH4hxuhZiWPkYSKcINS
 7M/sRLd6ZAvBM5dMZjdR0x2+qlVoaUOF5mapIxzQlmJdKcfitPyr96DrmgWuIyieXDye
 E1EA==
X-Gm-Message-State: AOAM531NJMFnR4kb9/PPKnqAi0PGQY36TQN2KTHYITfRG38U8RWTKJCZ
 Qve5IeA4xeeclwDYzgi8OTjBH6Rrf1zj7VZgMVLmS0Pd/oSluGXXFZEFm2ELPJl/0EbqAls1QQ0
 x48qVZed/jDueKbY=
X-Received: by 2002:ac8:5656:: with SMTP id 22mr4221874qtt.323.1627051964280; 
 Fri, 23 Jul 2021 07:52:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz18WgbpWfzC6cozjITgTfapyL4Tmh74sCo6NQ/5LZNf/0Q8MkokwZ0KC4gwUg32RBwSxRCPA==
X-Received: by 2002:ac8:5656:: with SMTP id 22mr4221854qtt.323.1627051964065; 
 Fri, 23 Jul 2021 07:52:44 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id z68sm14508594qke.86.2021.07.23.07.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 07:52:43 -0700 (PDT)
Date: Fri, 23 Jul 2021 10:52:42 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH resend v2 1/5] tpm: mark correct memory region range
 dirty when clearing RAM
Message-ID: <YPrXutNkup2E4k6k@t490s>
References: <20210720130304.26323-1-david@redhat.com>
 <20210720130304.26323-2-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210720130304.26323-2-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 20, 2021 at 03:03:00PM +0200, David Hildenbrand wrote:
> @@ -30,11 +30,13 @@ void tpm_ppi_reset(TPMPPI *tpmppi)
>          guest_phys_blocks_init(&guest_phys_blocks);
>          guest_phys_blocks_append(&guest_phys_blocks);
>          QTAILQ_FOREACH(block, &guest_phys_blocks.head, next) {
> +            ram_addr_t mr_start = memory_region_get_ram_addr(block->mr);
> +
>              trace_tpm_ppi_memset(block->host_addr,
>                                   block->target_end - block->target_start);
>              memset(block->host_addr, 0,
>                     block->target_end - block->target_start);
> -            memory_region_set_dirty(block->mr, 0,
> +            memory_region_set_dirty(block->mr, block->target_start - mr_start,
>                                      block->target_end - block->target_start);

target_start should falls in gpa range, while mr_start is ram_addr_t.  I am not
sure whether this is right..

Neither do I know how to get correct mr offset with the existing info we've got
from GuestPhysBlock.  Maybe we need to teach guest_phys_blocks_region_add() to
also record section->offset_within_region?

-- 
Peter Xu


