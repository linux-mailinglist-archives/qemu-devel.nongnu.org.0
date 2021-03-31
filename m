Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128D235043D
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 18:14:24 +0200 (CEST)
Received: from localhost ([::1]:38672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRdU7-0002Ac-2S
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 12:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lRdJE-0001I4-U7
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 12:03:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lRdJC-00034V-GP
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 12:03:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617206582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=68Exs8vps+/cghIZzSfas1YEDcsuJVsF93rUgca2Vic=;
 b=U5SKyupcZCaXPD1bJ+PwfMmhfEjyllYE1a6AAp69RyGgeg0bsP6zEumYmEpXns0yrLbWGP
 haUDzxIf7yia6qH24Q8wdGV1DpSlqDH71HL2GOyT3dFn/XnacWT4GYHc/RWTk5dYTiDr9t
 O/whivfzL1o59czA21wpP3oGswnrVc8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-RBF-XGitMLixEtej0iWecA-1; Wed, 31 Mar 2021 12:03:00 -0400
X-MC-Unique: RBF-XGitMLixEtej0iWecA-1
Received: by mail-qv1-f72.google.com with SMTP id n3so1516629qvr.8
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 09:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=68Exs8vps+/cghIZzSfas1YEDcsuJVsF93rUgca2Vic=;
 b=laVOpdz6Un42DHzIYiRcQ2BgrpXHjemv+QqVlAQIp8Kt0vaEbfwE7PtscBJPeXCrQo
 /8joXXC0Zkb/G1P7ABN00CSWTUSO+5TuFUHXBg80WJsjHdWTMPcOZCHQjtXHkqYoHujG
 RPnOdWlG80doS+CZ9tM2x/2QXD8KY3RGuBFMZ551LK6UlanvkvXa0SzEH+d7mobPC0BE
 wqYyiS6W/HDobp+fAh2/GCuwPeMpCE2vSWl++rLB5jdKSqHqRhHAnlHYr8QSWGKsb/Mo
 SNFp4pvmt7fUuV3YvsiRsHQgOCxVKNfGEV/yEHNX7aalhoqrmrQ/WGywztHVDcPScCsK
 ZPMg==
X-Gm-Message-State: AOAM533+eixeC7VnaexfgufJrGnRWhLZ0lj1BuQfXL3jOxYUu6L4oqNT
 MpaONpYTen7cudtyICGntcGCB69hewo7ljANdl8xSoBIMWkhPHdkLd8RzxSJ0Sg4CrsSO6x34TB
 ATdKCjx+5ScYMunc=
X-Received: by 2002:ac8:5151:: with SMTP id h17mr3125650qtn.24.1617206580054; 
 Wed, 31 Mar 2021 09:03:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSBx5Wza8s2e3iAROM1u+CeVrLsCI2Zt1QtIAmay9c4j/Sa1sZVOWW9kMKwOFw/rtd/rSlbQ==
X-Received: by 2002:ac8:5151:: with SMTP id h17mr3125606qtn.24.1617206579503; 
 Wed, 31 Mar 2021 09:02:59 -0700 (PDT)
Received: from xz-x1 (bras-base-toroon474qw-grc-82-174-91-135-175.dsl.bell.ca.
 [174.91.135.175])
 by smtp.gmail.com with ESMTPSA id d10sm1726271qko.70.2021.03.31.09.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 09:02:58 -0700 (PDT)
Date: Wed, 31 Mar 2021 12:02:57 -0400
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v2 0/3] migration: Fixes to the 'background-snapshot' code
Message-ID: <20210331160257.GO429942@xz-x1>
References: <20210331154809.86052-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210331154809.86052-1-andrey.gruzdev@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 31, 2021 at 06:48:06PM +0300, Andrey Gruzdev wrote:
> Changes v1->v2:
>  * Added comment over the overlooked qemu_flush() in bg_migration_thread
> 
> Changes v0->v1:
>  * Using qemu_real_host_page_size instead of TARGET_PAGE_SIZE for host
>    page size in ram_block_populate_pages()
>  * More elegant implementation of ram_block_populate_pages()
> 
> This patch series contains:
>  * Fix to the issue with occasionally truncated non-iterable device state
>  * Solution to compatibility issues with virtio-balloon device
>  * Fix to the issue when discarded or never populated pages miss UFFD
>    write protection and get into migration stream in dirty state
> 
> Andrey Gruzdev (3):
>   migration: Fix missing qemu_fflush() on buffer file in
>     bg_migration_thread
>   migration: Inhibit virtio-balloon for the duration of background
>     snapshot
>   migration: Pre-fault memory before starting background snasphot

Should this be 6.0-rc material, maybe?

-- 
Peter Xu


