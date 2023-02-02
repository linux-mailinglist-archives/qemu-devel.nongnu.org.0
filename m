Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B43687C08
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:17:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNXZk-0006ZT-JM; Thu, 02 Feb 2023 06:16:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXZh-0006Vr-2J
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:16:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXZf-0003qR-L1
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:16:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675336574;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=rglh106TZOZ53HwhifFj0LTWfOkxLVwvVKp/kYfNKDY=;
 b=DufVgw/DAHCGROYyGPkd4SQW5MacS1QwO0ttJrCYTvUbKfd89T/KkDzu8T7UiDUoG9XFZs
 +iJnKo5k3c+zQ6MJJeD5Dfqq+AlmIBc3m8KuArxy0hVO6Y/P0Z0l54bhN7/9QzknoM5oQS
 ALg49mV+mjsAiSxpYrKbuN3meRDMISE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-418-PMuMI0IeNCGpH4yQ6U0GhA-1; Thu, 02 Feb 2023 06:16:13 -0500
X-MC-Unique: PMuMI0IeNCGpH4yQ6U0GhA-1
Received: by mail-wr1-f70.google.com with SMTP id
 v15-20020adfe4cf000000b002bf9413bc50so173254wrm.16
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 03:16:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rglh106TZOZ53HwhifFj0LTWfOkxLVwvVKp/kYfNKDY=;
 b=I/IbkyY88oW9d4rHNk4DMW+1ytyrMngSNunvS1Kv3a9kyHTs2NK78TXUZ1k5Jh7iO0
 YlGrctOydxbbN9UTVuSJp1EeKc2C+UgoC3hoi84HTMHK8R3yYLDfyXQn0K0jVzlM9W/n
 wd+rid2eTkv3Sm/kz0XQX8b1dflUrK5cBPRrqO7WiUSS2VO1C2fZTDYfMauFJ6sb6lUW
 Hm9KDOAxaK0QQ5HWgwq/1iVaPyNK4Kx5M3UBbKsDxroaYCGCPL7vaG+A6b01asGlf27W
 pRNAbpYoSo+jLGzlkMbre9KO1S96MKOhGAxK0uGL17zrQ/CtOgFhU3jmsgQdx9Pl1zpo
 tdIA==
X-Gm-Message-State: AO0yUKWivb1Enx3aeEkeVr+baR8rquIwzj1D9QudQArAOByGSEIZrO9F
 H6Oll5BQyIHyBJqn5XZ2wwzvXamHkXbp6E0JsbZarzLWMxh16xs4KkGU0N2GwM4L2Tawhts2aF5
 wz5YJWqxFo+OmGEk=
X-Received: by 2002:a05:600c:4f07:b0:3dc:50c1:5fd4 with SMTP id
 l7-20020a05600c4f0700b003dc50c15fd4mr5966315wmq.15.1675336572742; 
 Thu, 02 Feb 2023 03:16:12 -0800 (PST)
X-Google-Smtp-Source: AK7set9xsPukHgIVYPKJbHePgPhtttIgNYVX8+1m3vSPLjAsjqTq5pte/lIZFxVUXQW3m/yxypGx1w==
X-Received: by 2002:a05:600c:4f07:b0:3dc:50c1:5fd4 with SMTP id
 l7-20020a05600c4f0700b003dc50c15fd4mr5966294wmq.15.1675336572531; 
 Thu, 02 Feb 2023 03:16:12 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 ip23-20020a05600ca69700b003dc59d6f2f8sm4206078wmb.17.2023.02.02.03.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 03:16:11 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>,  Andrey Gruzdev
 <andrey.gruzdev@virtuozzo.com>,  qemu-stable@nongnu.org
Subject: Re: [PATCH v1 2/5] migration/ram: Fix error handling in
 ram_write_tracking_start()
In-Reply-To: <20230105124528.93813-3-david@redhat.com> (David Hildenbrand's
 message of "Thu, 5 Jan 2023 13:45:25 +0100")
References: <20230105124528.93813-1-david@redhat.com>
 <20230105124528.93813-3-david@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 12:16:11 +0100
Message-ID: <87sffoqpvo.fsf@secure.mitica>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> If something goes wrong during uffd_change_protection(), we would miss
> to unregister uffd-wp and not release our reference. Fix it by
> performing the uffd_change_protection(true) last.
>
> Note that a uffd_change_protection(false) on the recovery path without a
> prior uffd_change_protection(false) is fine.
>
> Fixes: 278e2f551a09 ("migration: support UFFD write fault processing in ram_save_iterate()")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


