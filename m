Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3F12D326C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:52:39 +0100 (CET)
Received: from localhost ([::1]:44590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmi6I-0008Dd-6P
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:52:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kmhQW-0006VQ-CB
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:09:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kmhQU-0007C2-0h
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:09:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607450965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J8xoHRGWFgMoTdCdKue9oQPoWPNvBzntXBkTL51+L/g=;
 b=YcG/PqOfeP/+DUVBgFPycRyPHxroIBozZEOmcIzVMl++Nnm6QGhXmypSBf18U0s5FZV4ZM
 ZFcLh4JkbS285r1Lpq9JgzLLAjaGtKXTWMd+Rv6R/uRWIr/Pz7tMlzievF41xO3jat9r8h
 Cck+XNbYuDy+g+t4/BXmu0PILGKJkyc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-554oJXusPVqVV4FAzpBj6Q-1; Tue, 08 Dec 2020 13:09:22 -0500
X-MC-Unique: 554oJXusPVqVV4FAzpBj6Q-1
Received: by mail-qt1-f198.google.com with SMTP id z8so14542419qti.17
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:09:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J8xoHRGWFgMoTdCdKue9oQPoWPNvBzntXBkTL51+L/g=;
 b=HLo8tFG6I5AKBk0jqBHzpFtrZnCLzinj5C3ajoG9RKxoi/rUgtikYI4LRlpCs0+n5g
 ET00yI8lA5ki2xfEULkMCLivqjqT0CpwCH5GqvAnGXiHQGz2UEzo8ojegj7lXZ4Srvc6
 e+Kuh+pvCWCc5TjEQGtCKM3irln8EqD6eApRuA95e4fFH+N4nBXnOI8NpSPUMHG/t050
 +Whm20AiSSINVybA8pTBTPKU6oRyiZ08cTU2xNgAEof3NXjS3ESGPwqcXE1e18ElXa3C
 anME2g740K04AVNLYUmhWX79smjtyxve8CLify7n4Zota8ca4sFGJIvWmYkaYa2nWcnq
 227g==
X-Gm-Message-State: AOAM532QbLO3FKGQXyg7NMzfqCvl58HKhBbdGoDCVwqb6qwUh1zazhpe
 AaSVy2zHiKXcORISsFpLI6BUNNQ7D3Khi8vMFeFRZ9dQEXphJUbdjX3NPaVmDX+XON1xG9rNhEL
 6Q5rMvnVYi66QbHA=
X-Received: by 2002:a0c:abc8:: with SMTP id k8mr28492031qvb.14.1607450961918; 
 Tue, 08 Dec 2020 10:09:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6Gx7zS4se+61QWmy6hVoCrQaSyPT/mCOP78NN0Efnwi50nu9NbCEQkZ1HpP8LJmqCvAtK3A==
X-Received: by 2002:a0c:abc8:: with SMTP id k8mr28492004qvb.14.1607450961699; 
 Tue, 08 Dec 2020 10:09:21 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id z186sm14525973qke.100.2020.12.08.10.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:09:21 -0800 (PST)
Date: Tue, 8 Dec 2020 13:09:19 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v5 3/4] migration: support UFFD write fault processing in
 ram_save_iterate()
Message-ID: <20201208180919.GC21402@xz-x1>
References: <20201204093103.9878-1-andrey.gruzdev@virtuozzo.com>
 <20201204093103.9878-4-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201204093103.9878-4-andrey.gruzdev@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Fri, Dec 04, 2020 at 12:31:02PM +0300, Andrey Gruzdev wrote:
> In this particular implementation the same single migration
> thread is responsible for both normal linear dirty page
> migration and procesing UFFD page fault events.
> 
> Processing write faults includes reading UFFD file descriptor,
> finding respective RAM block and saving faulting page to
> the migration stream. After page has been saved, write protection
> can be removed. Since asynchronous version of qemu_put_buffer()
> is expected to be used to save pages, we also have to flush
> migraion stream prior to un-protecting saved memory range.
> 
> Write protection is being removed for any previously protected
> memory chunk that has hit the migration stream. That's valid
> for pages from linear page scan along with write fault pages.
> 
> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>

I still think the ram_save_host_page_pre/post are a bit odd; but I think it's
good enough (at least Dave/Juan didn't complain yet, so I guess it's ok).

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu


