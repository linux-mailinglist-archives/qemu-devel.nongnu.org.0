Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A06065F588
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 22:12:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDXWy-0001J7-2q; Thu, 05 Jan 2023 16:12:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pDXWu-0001IH-B3
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 16:12:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pDXWs-0001yN-AF
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 16:12:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672953120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=idNY/7Ggg6yZJwa6CHHm7JPilbVdI9CIsVrYJn0Mjo4=;
 b=OiiEvsw9BaBVQl2iwTUh3LrO9W2iFU5AH15ej+/Mbpqm2Go9lRGX5hic2mggmqEsdyeUFy
 1jyrrO6bxMGCrA8VWc9oDbhCEtyAYyHsNIZ0oPfA2Jx42moRK9RO5ReJq6Gkzpu/MNKOHg
 MrVvo78FL1iFwO10QiqLjkcTZpkbiU0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-320-LvP3i_0tP0eDg2TA0GDNvQ-1; Thu, 05 Jan 2023 16:11:59 -0500
X-MC-Unique: LvP3i_0tP0eDg2TA0GDNvQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 z16-20020ac84550000000b003a807d816b2so13647284qtn.4
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 13:11:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=idNY/7Ggg6yZJwa6CHHm7JPilbVdI9CIsVrYJn0Mjo4=;
 b=pdZ+bOHuG0j7xljLpz+uwTXAA4ljxINhkEqCE/dPItjFHQPwNtdsGhL5bdZAEMKkGt
 IcmCL3LJS7I0FGFMHrAcCDgfDLQDR5nCE24IK5r9HHWG8fg/0wZW+LfReYEVHIS70+UL
 945PuwACLfF2ad8aVoQdaUcoeK2a1VhlldBUeQEF+8kgiQEJny4uk0zucuf/C1a0R0Nr
 yt/dOdwlJq0hkSgrbslg86L8pvhlqhV8xyIf6Eyb6P85cQPlEgobENZ6tPZK88jbh05Y
 gKWzqkPRwKDKxjL9yDrDFJ4yJ6K6lMkAH/mamiOzaZu8KGRMonqubndYAXRsQxPtphYL
 aSGA==
X-Gm-Message-State: AFqh2krFlYDti/4hnOb4r55YWT59fGYgcw2ecDjV6YZR36r2S4SdNTuB
 BbrI0nHaDob4yK7am+3nB+Mj4lK+C2XXo7iyRfC1DAJMI+xD0vZxFp6coyIUrBm7OM8ldHqYlKG
 QQlLU+GIoT1RluaM=
X-Received: by 2002:ac8:7354:0:b0:3a6:a699:3cd8 with SMTP id
 q20-20020ac87354000000b003a6a6993cd8mr70241690qtp.57.1672953119070; 
 Thu, 05 Jan 2023 13:11:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvrziIj1SHfbH7mLHApSnrPI0cEUt16oXW2Zng5Rfu8VTO8N93fI9RA7jX7v61lMcUiY8brzQ==
X-Received: by 2002:ac8:7354:0:b0:3a6:a699:3cd8 with SMTP id
 q20-20020ac87354000000b003a6a6993cd8mr70241672qtp.57.1672953118829; 
 Thu, 05 Jan 2023 13:11:58 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-39-70-52-228-144.dsl.bell.ca.
 [70.52.228.144]) by smtp.gmail.com with ESMTPSA id
 i10-20020ac813ca000000b003a6847d6386sm21756581qtj.68.2023.01.05.13.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 13:11:57 -0800 (PST)
Date: Thu, 5 Jan 2023 16:11:57 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v1 0/5] migration/ram: background snapshot fixes and
 optimiations
Message-ID: <Y7c9He14F8kKkffw@x1n>
References: <20230105124528.93813-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230105124528.93813-1-david@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Thu, Jan 05, 2023 at 01:45:23PM +0100, David Hildenbrand wrote:
> Playing with background snapshots in combination with hugetlb and
> virtio-mem, I found two issues and some reasonable optimizations (skip
> unprotecting when unregistering).
> 
> With virtio-mem (RamDiscardManager), we now won't be allocating unnecessary
> page tables for unplugged ranges when using uffd-wp with shmem/hugetlb.
> 
> Cc: Juan Quintela <quintela@redhat.com> (maintainer:Migration)
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com> (maintainer:Migration)
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
> 
> David Hildenbrand (5):
>   migration/ram: Fix populate_read_range()
>   migration/ram: Fix error handling in ram_write_tracking_start()
>   migration/ram: Don't explicitly unprotect when unregistering uffd-wp
>   migration/ram: Rely on used_length for uffd_change_protection()
>   migration/ram: Optimize ram_write_tracking_start() for
>     RamDiscardManager

For the series:

Acked-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu


