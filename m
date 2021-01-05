Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 447DB2EB38B
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 20:38:14 +0100 (CET)
Received: from localhost ([::1]:58972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kws9l-0003Qj-CC
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 14:38:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kws8k-0002yS-1t
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 14:37:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kws8f-00045u-B7
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 14:37:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609875423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FsDI1+p3FrcepYL3MTeLSfWKDhD48mldYY3L8psWXqA=;
 b=UMPwhT1faYMSfKH6vzXk1N8XnBipwonLpinuSIUoEGC3WGshSsFfciQvboRSm9PRKQOPRf
 VkCjNfx6Pn4JXQKQpL59riHCQkk1FPl0bbuqI6GPQQt1loUkEDl2DGoHYdIrqG7hPykPU+
 fGZPwYAfepUUaP9/nEnX1Mk5aXJk7wo=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-8JYMOwYMNpC1_n9eRnzTog-1; Tue, 05 Jan 2021 14:37:01 -0500
X-MC-Unique: 8JYMOwYMNpC1_n9eRnzTog-1
Received: by mail-qv1-f72.google.com with SMTP id v1so516439qvb.2
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 11:37:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FsDI1+p3FrcepYL3MTeLSfWKDhD48mldYY3L8psWXqA=;
 b=UG1hN3FUB9LUuFh3CBN+w+xwctPeh0ZciVHgAGb1XgfNAALjW2hO4bGS55cdo1r/zf
 PgRqE5LpM5w6DUqENmi+ACnIsoZEh8rriJWa3KNvJgBHtUn8HCpzWPd6EPr+1sKE3PAF
 Lkgpwg1TWWycMtczooOIAQsxJIbFndx2m+z1ZxgZRxgSzHq9e9KO+69s06dlf/FWIhzR
 V+h96ONWDs8fd0x4ZQl884xIHbXAKYuSPVB2SUVRSEhjAvAR3JIokkWq0+8r3tiN0yNJ
 ELfJH7cmLdy0/aVf4im+fAP4G0oYBqS1td6e44y71KEJrhWvZDHL/lotHjwYJmU2aiVc
 vuDw==
X-Gm-Message-State: AOAM530tezdWGMp8VjP0Mi8xlsZondlQzTyZ2agZlIUWRLNEJvoeQCFg
 u1G/MdIUAaLuxURRA2GSrEcYH3Q2vbvm226vzRWI2rcJm7FoIE7fBBIyfiB5WprhOHJbwaYFKqD
 yS6UY8E3i1QQWlHY=
X-Received: by 2002:a05:620a:145a:: with SMTP id
 i26mr1072779qkl.31.1609875421389; 
 Tue, 05 Jan 2021 11:37:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx23LqDK6gOFWsiFxESK7lU7bVZmsNIz8ZIP9oP6KsNOVzBQcx0ZOXSjX213QMpkoLDiyEXOg==
X-Received: by 2002:a05:620a:145a:: with SMTP id
 i26mr1072764qkl.31.1609875421139; 
 Tue, 05 Jan 2021 11:37:01 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id b78sm146974qkg.29.2021.01.05.11.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 11:37:00 -0800 (PST)
Date: Tue, 5 Jan 2021 14:36:58 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v10 0/5] UFFD write-tracking migration/snapshots
Message-ID: <20210105193658.GE149908@xz-x1>
References: <20201217165712.369061-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201217165712.369061-1-andrey.gruzdev@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 17, 2020 at 07:57:07PM +0300, Andrey Gruzdev wrote:
> This patch series is a kind of 'rethinking' of Denis Plotnikov's ideas he's
> implemented in his series '[PATCH v0 0/4] migration: add background snapshot'.
> 
> Currently the only way to make (external) live VM snapshot is using existing
> dirty page logging migration mechanism. The main problem is that it tends to
> produce a lot of page duplicates while running VM goes on updating already
> saved pages. That leads to the fact that vmstate image size is commonly several
> times bigger then non-zero part of virtual machine's RSS. Time required to
> converge RAM migration and the size of snapshot image severely depend on the
> guest memory write rate, sometimes resulting in unacceptably long snapshot
> creation time and huge image size.
> 
> This series propose a way to solve the aforementioned problems. This is done
> by using different RAM migration mechanism based on UFFD write protection
> management introduced in v5.7 kernel. The migration strategy is to 'freeze'
> guest RAM content using write-protection and iteratively release protection
> for memory ranges that have already been saved to the migration stream.
> At the same time we read in pending UFFD write fault events and save those
> pages out-of-order with higher priority.
> 
> How to use:
> 1. Enable write-tracking migration capability
>    virsh qemu-monitor-command <domain> --hmp migrate_set_capability.
> track-writes-ram on
> 
> 2. Start the external migration to a file
>    virsh qemu-monitor-command <domain> --hmp migrate exec:'cat > ./vm_state'
> 
> 3. Wait for the migration finish and check that the migration has completed.
> state.

For the rest patches:

Acked-by: Peter Xu <peterx@redhat.com>

Dave, considering the live snapshot series has been dangling for quite some
time upstream (starting from Denis's work), do you have plan to review/merge it
in the near future?

I believe there're still quite a few things missing, but imho most of them
should be doable on top too.

Thanks!

-- 
Peter Xu


