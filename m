Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A0C2D3281
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 20:03:41 +0100 (CET)
Received: from localhost ([::1]:39764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmiGz-0001GH-0l
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 14:03:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kmhfd-0004YF-Fh
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:25:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kmhfY-0000Q7-OR
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:25:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607451899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LIAWZugt9OuQWOmHztDhD7/kGmYT0F+LWmrJxxuAx+s=;
 b=D3HbiOM940lQiCHFb/83zQv+kbl9cOsCXDV5HSTvzqPeeL4c9GOGKaSV6WUIF4ar/raSBY
 b8LOf8DnNOqZuqB6k8AiP7wqDpH+XCSFLoLfNDksMXyL4eQV55L/+dRdVQ943W5G2HAy7O
 giAkkjp5rOuE1al6E6FTS+1ALsaQKY8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-9bxzYoWENzWPQz5nRuEkbg-1; Tue, 08 Dec 2020 13:24:57 -0500
X-MC-Unique: 9bxzYoWENzWPQz5nRuEkbg-1
Received: by mail-qt1-f198.google.com with SMTP id o12so14577837qtw.14
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:24:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LIAWZugt9OuQWOmHztDhD7/kGmYT0F+LWmrJxxuAx+s=;
 b=ZQyzzMNaJXtNANHgMQsAoaN+EzcC3GEGuOrbpQE1BQoqBvrDmZ9AvCJQDpLboLC6ZL
 ghyNcLlbEikec8rYJ5XkEIW/lYP+uWXWsQwoEjKz596k3WOXWfSoOxY7Bt6PO51A0Adu
 9esCyQ9Gp6DWErErlzGoVeyPstapCSSEHVFd9k8rZXktXgJe6QPV8drCgkWSnuHKCYQ4
 zmwCXx/Jj7W77LXGb0h3nK3fx+PMF+lb8ercp6sWwl/SxWrj8plZVfgyQ6TRJdOqh1yf
 Ky0xkz6ZnxAA9UDpDrJmL/iJh6ckUMBxpTb2we4RQw2vM0S+HxuFMOoCF2RoP/FE4mY4
 dgUg==
X-Gm-Message-State: AOAM531G2pWn2l2GFdHXaFNc9fSyFelxssKWH1WqRIUd38IS1Gk6sXQK
 U7OFNFdiWIlcDHifi0h+yQe0r3kSAmEDt3pVYDi+Rb+T4h0yprpO8It4Dz2a1TIJshV+inUfAcK
 uamNgPf4hbiABgDY=
X-Received: by 2002:a0c:f888:: with SMTP id u8mr5230955qvn.47.1607451896472;
 Tue, 08 Dec 2020 10:24:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwn203f0Q9zW0RcgUGrnETpZGt1q7NgNMV9tJaHDFgvuOWrtoswVU51hK4OqMkkrmfKdAX/g==
X-Received: by 2002:a0c:f888:: with SMTP id u8mr5230932qvn.47.1607451896200;
 Tue, 08 Dec 2020 10:24:56 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id 76sm14448271qkg.134.2020.12.08.10.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:24:55 -0800 (PST)
Date: Tue, 8 Dec 2020 13:24:53 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v5 0/4] migration: UFFD write-tracking migration/snapshots
Message-ID: <20201208182453.GE21402@xz-x1>
References: <20201204093103.9878-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201204093103.9878-1-andrey.gruzdev@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Fri, Dec 04, 2020 at 12:30:59PM +0300, Andrey Gruzdev wrote:
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
> 
> Changes v4->v5:
> 
> * 1. Refactored util/userfaultfd.c code to support features required by postcopy.
> * 2. Introduced checks for host kernel and guest memory backend compatibility
> *    to 'background-snapshot' branch in migrate_caps_check().
> * 3. Switched to using trace_xxx instead of info_report()/error_report() for
> *    cases when error message must be hidden (probing UFFD-IO) or info may be
> *    really littering output if goes to stderr.
> * 4  Added RCU_READ_LOCK_GUARDs to the code dealing with RAM block list.
> * 5. Added memory_region_ref() for each RAM block being wr-protected.
> * 6. Reused qemu_ram_block_from_host() instead of custom RAM block lookup routine.
> * 7. Refused from using specific hwaddr/ram_addr_t in favour of void */uint64_t.
> * 8. Currently dropped 'linear-scan-rate-limiting' patch. The reason is that
> *    that choosen criteria for high-latency fault detection (i.e. timestamp of
> *    UFFD event fetch) is not representative enough for this task.
> *    At the moment it looks somehow like premature optimization effort.
> * 8. Dropped some unnecessary/unused code.

I went over the series and it looks nice!

There're a few todos for this series, so I added them into the wiki page (I
created a "feature" section for migration todo and put live snapshot there):

https://wiki.qemu.org/ToDo/LiveMigration#Features

Anyone feel free to add..

Thanks,

-- 
Peter Xu


