Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1237F687CB6
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:53:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNY9E-0000yD-Jc; Thu, 02 Feb 2023 06:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNY8z-0000v3-Dk
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:52:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNY8w-0003w4-Ms
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:52:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675338762;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=pCOl4P6w9txNMk2ybql+fCaFHu/p5e15aULYB6QHj3Y=;
 b=esaIhQBZ2JOxwTp2zqDB6ngTOV6ebI0Dn6wK/TNau7dgHGPwkZyAtrpR9fgON2uayR7SmL
 vNnFtk1JC0FnurVHYhgnWlfLbqqojTyJAcqJybcuJviIcNu5jg9n/dClYq7ONEPBg3FiNH
 HzXvfTYpjGbYekSXUKpBiMqZFkoHftI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-wOXwxxorOMueMz0UuDRRmg-1; Thu, 02 Feb 2023 06:52:41 -0500
X-MC-Unique: wOXwxxorOMueMz0UuDRRmg-1
Received: by mail-wm1-f71.google.com with SMTP id
 j20-20020a05600c1c1400b003dc5dd44c0cso871168wms.8
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 03:52:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pCOl4P6w9txNMk2ybql+fCaFHu/p5e15aULYB6QHj3Y=;
 b=uckOPXJIkkM/fKRflBKOYkKnMxaIiY7rBnPHszaYmDuD+XuIHasadHUQWJYFHSiAMu
 quaNaXjXwazu3hk+pxL1ssmLhO9zEtS5yD1ncVlQ+GOEw8jR21DTGlpELlLTu+rcFqd5
 cGynb8ljcVlkmmJvgh8huvrSj4HBkxmPUCdCJGVYh0ofJU94kKwznOIAekcxTWX2GD8R
 GmXm7XxDdiNIbykGlGDy7vy4U4TWsA2Ywbv3ncx+wD7VfnKerjsQrC2L6y1SbNKEK/As
 OHQIN1drr9MI1Ve1RGMFBrLVAkO8kOZvUuWLeuo1LguuUf7Kg1kYPtqe+0XOCBBWrOOp
 AZQw==
X-Gm-Message-State: AO0yUKUMWvXfrzGvis6a5wyTtjMr21v+YdLqOisoT7jmCnmwEwxCjBtZ
 Fi+2QKrtHf6dqtia1G7vp+1t6tzuZd24XvJAZ4Wy8Yf+sjIgCqxCXzwVHpA/nWcCyykif0csU8V
 CXLUp1t9WfZ0HhfU=
X-Received: by 2002:a05:600c:4fc8:b0:3cf:7704:50ce with SMTP id
 o8-20020a05600c4fc800b003cf770450cemr5664214wmq.38.1675338758631; 
 Thu, 02 Feb 2023 03:52:38 -0800 (PST)
X-Google-Smtp-Source: AK7set/QoNlmcuPpesDB2ecoV6NMkCcynkmCQbDgk72Ui+ZI3yq8F+FGyBwgJ+NckLJ38NQDHZBVeQ==
X-Received: by 2002:a05:600c:4fc8:b0:3cf:7704:50ce with SMTP id
 o8-20020a05600c4fc800b003cf770450cemr5664199wmq.38.1675338758420; 
 Thu, 02 Feb 2023 03:52:38 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 y13-20020a1c4b0d000000b003dc4aae4739sm4485877wma.27.2023.02.02.03.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 03:52:37 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>,  "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v5 6/8] virtio-mem: Fail if a memory backend with
 "prealloc=on" is specified
In-Reply-To: <20230117112249.244096-7-david@redhat.com> (David Hildenbrand's
 message of "Tue, 17 Jan 2023 12:22:47 +0100")
References: <20230117112249.244096-1-david@redhat.com>
 <20230117112249.244096-7-david@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 12:52:37 +0100
Message-ID: <87lelgnv22.fsf@secure.mitica>
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
> "prealloc=on" for the memory backend does not work as expected, as
> virtio-mem will simply discard all preallocated memory immediately again.
> In the best case, it's an expensive NOP. In the worst case, it's an
> unexpected allocation error.
>
> Instead, "prealloc=on" should be specified for the virtio-mem device only,
> such that virtio-mem will try preallocating memory before plugging
> memory dynamically to the guest. Fail if such a memory backend is
> provided.
>
> Tested-by: Michal Privoznik <mprivozn@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


