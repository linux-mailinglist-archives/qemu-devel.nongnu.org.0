Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12588690BA1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 15:23:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ7pH-0007Ki-Ex; Thu, 09 Feb 2023 09:23:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pQ7pF-0007Jd-0L
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 09:23:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pQ7pD-0003EQ-CY
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 09:23:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675952578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/4PEDUA4ZHwOiKFMnmioDw5G9w75wZZDXHjawbe7jQk=;
 b=J8qBu6wUFyGOqjRCIsei9V4OMgjdHhKm7XZJQ25PogcqIxLDcfRV36rEk6MCXnhbjd2xjl
 XqJliuxbIkhUhivq9VyQHqfjNM1Z50TLJ4K+aVRwrOvanysH3ECuqMRKL4ZAsyfMXn6pQy
 8Djc4resJH4nVUJ752wekfNnSc72TxA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-407-PFrBYn78NeC_iI6zdOdfBg-1; Thu, 09 Feb 2023 09:22:57 -0500
X-MC-Unique: PFrBYn78NeC_iI6zdOdfBg-1
Received: by mail-qv1-f70.google.com with SMTP id
 i7-20020a056214020700b004ffce246a2bso1322831qvt.3
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 06:22:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/4PEDUA4ZHwOiKFMnmioDw5G9w75wZZDXHjawbe7jQk=;
 b=1UAGXaKqCNyE5QbPB9n07Jug8ATzNScf2fPZ+BZEAmIQ775Rm1Fheg512BJDjnak+Y
 +QWv49s6eIoSNAlGDPOG7JDETH9lH8fs9jsy5ze4llquVf5w5pOmy4uIKmoQswoOFEkQ
 U7eelwBMtSEVeEQUu3IANBO5CO0ZmPVR9Oxk6CgSrDU1E+fKUQK+WitC49T4NBhmGiWS
 5IXKi7LSF+nrDdGhuU/HQU7IHeZ7EfvuMSw7S3b38gbc8jW1JCriOQ/b12qk9rO/M02B
 AvfTG1/cVz+0Jagqmr8B7qE/qljbtMkIatKasFAsfs0GXVlb+luAdFIkpDsrj36LHtuq
 SUsA==
X-Gm-Message-State: AO0yUKWLitkG/maIXmArSMFm2q7Z54bYKFogHtESPwAzDVWKlmPqqEdD
 of63H+7qtFwIrfZ5x5my36I4XkkV9i10MANf/J7Q8RsgQeG9nBWHoEz2RS8cD+x7j4//oiHo95C
 bnkt4IrFZeG/1GxA=
X-Received: by 2002:ac8:4e8d:0:b0:3ba:1ace:8bae with SMTP id
 13-20020ac84e8d000000b003ba1ace8baemr20501227qtp.0.1675952575871; 
 Thu, 09 Feb 2023 06:22:55 -0800 (PST)
X-Google-Smtp-Source: AK7set8ZSUwJwrQFORKi9+R+64M73mVFZHgz0aHv0gyRFVUunGQw2xhnE+N9KGE22EB4s5RqpTy06w==
X-Received: by 2002:ac8:4e8d:0:b0:3ba:1ace:8bae with SMTP id
 13-20020ac84e8d000000b003ba1ace8baemr20501194qtp.0.1675952575531; 
 Thu, 09 Feb 2023 06:22:55 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 hf22-20020a05622a609600b003b80a69d353sm797462qtb.49.2023.02.09.06.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 06:22:54 -0800 (PST)
Date: Thu, 9 Feb 2023 09:22:53 -0500
From: Peter Xu <peterx@redhat.com>
To: Leonardo =?utf-8?B?QnLDoXM=?= <leobras@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, Li Xiaohui <xiaohli@redhat.com>
Subject: Re: [PATCH v1 1/1] migration: Fix yank on postcopy multifd crashing
 guest after migration
Message-ID: <Y+UBvUfHlkqFcoUn@x1n>
References: <20221109055629.789795-1-leobras@redhat.com> <Y3+WGof3MQtaCYdS@x1n>
 <CAJ6HWG4KaEbUYHe75i4ty66nosHEM8ZJW0c1W4Q=s4YeNnP_rA@mail.gmail.com>
 <Y4ZwhZVDh9ac6MH8@x1n>
 <038b3c6d5f0ee3b3da5c9e53029a51b8b39d4922.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <038b3c6d5f0ee3b3da5c9e53029a51b8b39d4922.camel@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 09, 2023 at 01:14:12AM -0300, Leonardo Brás wrote:
> I got side-tracked on this issue.
> 
> Is there any patch disabling multifd + postcopy, or would it be fine to go back
> working on a V2 for this one?

IMHO it'll always make sense to post a new version for the immediate crash.

Personally I still think we should disable the two features being present
together until the full solution, but that can be discussed separately.

Thanks,

-- 
Peter Xu


