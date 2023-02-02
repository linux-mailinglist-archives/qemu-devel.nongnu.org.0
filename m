Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E45F687C05
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:16:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNXZ8-000677-4X; Thu, 02 Feb 2023 06:15:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXZ4-00066g-5o
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:15:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXYz-0003Dr-OS
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:15:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675336532;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ReTuxHOjDXJuiUcGntF4s5tQdyDsPdHzkyx9T7YQgQI=;
 b=HuJOUKQ4t6/yvAyq7dyKdkQNRgRlac1+6mWHQnKhsvcFHx1RRUFC42I93gAngd1hYfl3iD
 Cm9iZbTsx3D7ahVksj7AwZmONuGFzIIKm0FPdxFQPEvi8H6b8NJ7aVi7GlNEBHTGtvxOmj
 gXyuqf6i0xRBXHlGr7nOF4vGMpH9PtU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-451-jIQJZJiROju2I2b-EI7xqw-1; Thu, 02 Feb 2023 06:15:31 -0500
X-MC-Unique: jIQJZJiROju2I2b-EI7xqw-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay19-20020a05600c1e1300b003dc54daba42so825250wmb.7
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 03:15:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ReTuxHOjDXJuiUcGntF4s5tQdyDsPdHzkyx9T7YQgQI=;
 b=8IDLEQ0TUPkDB9tEcYwjP4XDZ/tvpvsWBp8HEF3RAot80vuErBFQy6gQ00WO+CkNo4
 en6stEKfG3yjlNWsP6F+zUT/eT4V53KS0ko5/zJAv6nKiYM9LU4tzqjXUSeU4qQN/KFu
 01flgPpWKjV7WG3kPFDdG2mEMyh5LMXrTgXiR8lY+QbT2BnLWtKkJ9YYNbykdrzoOxHd
 UM/fnD823P0eLLZRdJP0UojHEyuEsSES2V1lXItb/0Y5k6u3i3b5dombR0almEnl0ubi
 oe491OraufKABl68cdqjLEzTCiMF9lj8HKZjWg1TOJYptamHHcvky46KtziQfJszs1g6
 A8Kg==
X-Gm-Message-State: AO0yUKWalmXcGKcd6VVJOOZL4ePKiZXyOcnmcy3e4VsybTrqhnVM2C8a
 NcI84rs+UfjH1Ae3DouxB/+JjFOeDgB2myjQOCYFwqMFkPvOGC/FW7mi55PorHJNjh3/UZze5An
 znytd33VxWmFc4FA=
X-Received: by 2002:a05:6000:3c6:b0:2bf:e46d:387d with SMTP id
 b6-20020a05600003c600b002bfe46d387dmr5862936wrg.53.1675336530473; 
 Thu, 02 Feb 2023 03:15:30 -0800 (PST)
X-Google-Smtp-Source: AK7set+9mBYvL4A/TU23pI5RPyRkxP9EePBHQYpfRLTK3TCAg6yRbbrNxMpZTIHnZev+iFc82PO0WQ==
X-Received: by 2002:a05:6000:3c6:b0:2bf:e46d:387d with SMTP id
 b6-20020a05600003c600b002bfe46d387dmr5862912wrg.53.1675336530230; 
 Thu, 02 Feb 2023 03:15:30 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 l15-20020a5d6d8f000000b002bfb37497a8sm20435626wrs.31.2023.02.02.03.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 03:15:29 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>,  Andrey Gruzdev
 <andrey.gruzdev@virtuozzo.com>,  qemu-stable@nongnu.org
Subject: Re: [PATCH v1 1/5] migration/ram: Fix populate_read_range()
In-Reply-To: <20230105124528.93813-2-david@redhat.com> (David Hildenbrand's
 message of "Thu, 5 Jan 2023 13:45:24 +0100")
References: <20230105124528.93813-1-david@redhat.com>
 <20230105124528.93813-2-david@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 12:15:28 +0100
Message-ID: <87wn50qpwv.fsf@secure.mitica>
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
> Unfortunately, commit f7b9dcfbcf44 broke populate_read_range(): the loop
> end condition is very wrong, resulting in that function not populating the
> full range. Lets' fix that.
>
> Fixes: f7b9dcfbcf44 ("migration/ram: Factor out populating pages readable in ram_block_populate_pages()")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


