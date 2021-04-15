Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D466361694
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 01:51:36 +0200 (CEST)
Received: from localhost ([::1]:60022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXBlm-0001H1-Gi
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 19:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lXBkw-0000jI-US
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 19:50:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lXBkt-0007QE-Nv
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 19:50:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618530637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xKI8qPdKskAIgJYwwIZR15rxXmoSaIBzLuBuScUxZYY=;
 b=CtfQ4RV/w5qULLIjblKeDsnVcIhzvh743cFlj35Kq+NpTeiPBkLEboUj6tzc4pIytl8rd1
 DB1AgfhKxFc+m+DTBR9dU0gTjvKNizL7+XQVHl9hyoKbEDydMqnns0KEcYLAhi2rMUvtYA
 Z7/RppXz34eJPi0aFN4Vw9v6kkZfSl0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-LigELX6mOmCJ0VHrdZe4OQ-1; Thu, 15 Apr 2021 19:50:36 -0400
X-MC-Unique: LigELX6mOmCJ0VHrdZe4OQ-1
Received: by mail-qk1-f197.google.com with SMTP id o4so2643231qkg.2
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 16:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xKI8qPdKskAIgJYwwIZR15rxXmoSaIBzLuBuScUxZYY=;
 b=raTnCTt/wDJuai9qrzwSikHfZ26Yj1Cy2oG8ox8IdvWiemtdHhvlcURoTi4YyjVjzz
 KgDjUZx0Hrm7sLwYEj2d50p2ny/T6xgr9W3DdQ+YRsMXzFGKpG860Erbup8YYkRrwXPM
 dFQ6fsDBHY+1oySve8wrrHQIcJDPelNlmr/imiaco7SRhZG00ABK/rEwlOHZuqRwj3nR
 ABWaYQ3ZGSVc9JF3/WNMrNhjGpCSOO2AVyDEE4eMhfkqhcWo0vGJc8a5qkn3gGMEfRAR
 JiXP6JSQslDAt+yVc/LQN3iQhVQ3WF5KwhOYWhvT/YjKph6hDd2VvbXn71pc6tgGptBM
 rDTg==
X-Gm-Message-State: AOAM533o6lXnstdWrI66wFLvlr6+nzu+2M/BKyor1T2C26/zD3pFVrTq
 ZC5d0EO7yCnO0M7Vq7uMBvUE6Vn1d190+0E3KjKv5vagvks/61d8GG7CA0QKoptzHirBuapweSB
 PZ9t0QDSkqH0ppsM=
X-Received: by 2002:a05:620a:b04:: with SMTP id
 t4mr2307918qkg.41.1618530635534; 
 Thu, 15 Apr 2021 16:50:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEBoWDcjatPsq/ev0Y/hizrvT0xzLfJ4dUcwRqU6n2ZEsJ4LKLtEkhdUf5fXq91Fgws1ApCg==
X-Received: by 2002:a05:620a:b04:: with SMTP id
 t4mr2307900qkg.41.1618530635205; 
 Thu, 15 Apr 2021 16:50:35 -0700 (PDT)
Received: from xz-x1 (bras-base-toroon474qw-grc-88-174-93-75-154.dsl.bell.ca.
 [174.93.75.154])
 by smtp.gmail.com with ESMTPSA id i12sm3066968qkl.49.2021.04.15.16.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 16:50:34 -0700 (PDT)
Date: Thu, 15 Apr 2021 19:50:32 -0400
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [RFC PATCH 0/9] migration/snap-tool: External snapshot utility
Message-ID: <20210415235032.GS4440@xz-x1>
References: <20210317163222.182609-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210317163222.182609-1-andrey.gruzdev@virtuozzo.com>
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
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 17, 2021 at 07:32:13PM +0300, Andrey Gruzdev wrote:
> This series is a kind of PoC for asynchronous snapshot reverting. This is
> about external snapshots only and doesn't involve block devices. Thus, it's
> mainly intended to be used with the new 'background-snapshot' migration
> capability and otherwise standard QEMU migration mechanism.
> 
> The major ideas behind this first version were:
>   * Make it compatible with 'exec:'-style migration - options can be create
>     some separate tool or integrate into qemu-system.
>   * Support asynchronous revert stage by using unaltered postcopy logic
>     at destination. To do this, we should be capable of saving RAM pages
>     so that any particular page can be directly addressed by it's block ID
>     and page offset. Possible solutions here seem to be:
>       use separate index (and storing it somewhere)
>       create sparse file on host FS and address pages with file offset
>       use QCOW2 (or other) image container with inherent sparsity support
>   * Make snapshot image file dense on the host FS so we don't depend on
>     copy/backup tools and how they deal with sparse files. Off course,
>     there's some performance cost for this choice.
>   * Make the code which is parsing unstructered format of migration stream,
>     at least, not very sophisticated. Also, try to have minimum dependencies
>     on QEMU migration code, both RAM and device.
>   * Try to keep page save latencies small while not degrading migration
>     bandwidth too much.
> 
> For this first version I decided not to integrate into main QEMU code but
> create a separate tool. The main reason is that there's not too much migration
> code that is target-specific and can be used in it's unmodified form. Also,
> it's still not very clear how to make 'qemu-system' integration in terms of
> command-line (or monitor/QMP?) interface extension.
> 
> For the storage format, QCOW2 as a container and large (1MB) cluster size seem
> to be an optimal choice. Larger cluster is beneficial for performance particularly
> in the case when image preallocation is disabled. Such cluster size does not result
> in too high internal fragmentation level (~10% of space waste in most cases) yet
> allows to reduce significantly the number of expensive cluster allocations.
> 
> A bit tricky part is dispatching QEMU migration stream cause it is mostly
> unstructered and depends on configuration parameters like 'send-configuration'
> and 'send-section-footer'. But, for the case with default values in migration
> globals it seems that implemented dispatching code works well and won't have
> compatibility issues in a reasonably long time frame.
> 
> I decided to keep RAM save path synchronous, anyhow it's better to use writeback
> cache mode for the live snapshots cause of it's interleaving page address pattern.
> Page coalescing buffer is used to merge contiguous pages to optimize block layer
> writes.
> 
> Since for snapshot loading opening image file in cached mode would not do any good,
> it implies that Linux native AIO and O_DIRECT mode is used in a common scenario.
> AIO support in RAM loading path is implemented by using a ring of preallocated
> fixed-sized buffers in such a way that there's always a number of outstanding block
> requests anytime. It also ensures in-order request completion.
> 
> How to use:
> 
> **Save:**
> * qemu> migrate_set_capability background-snapshot on
> * qemu> migrate "exec:<qemu-bin-path>/qemu-snap -s <virtual-size>
>            --cache=writeback --aio=threads save <image-file.qcow2>"
> 
> **Load:**
> * Use 'qemu-system-* -incoming defer'
> * qemu> migrate_incoming "exec:<qemu-bin-path>/qemu-snap
>           --cache=none --aio=native load <image-file.qcow2>"
> 
> **Load with postcopy:**
> * Use 'qemu-system-* -incoming defer'
> * qemu> migrate_set_capability postcopy-ram on
> * qemu> migrate_incoming "exec:<qemu-bin-path>/qemu-snap --postcopy=60
>           --cache=none --aio=native load <image-file.qcow2>"
> 
> And yes, asynchronous revert works well only with SSD, not with rotational disk..
> 
> Some performance stats:
> * SATA SSD drive with ~500/450 MB/s sequantial read/write and ~60K IOPS max.
> * 220 MB/s average save rate (depends on workload)
> * 440 MB/s average load rate in precopy
> * 260 MB/s average load rate in postcopy

Andrey,

Before I try to read it (since I'm probably not the best person to review
it..).. Would you remind me on the major difference of external snapshots
comparing to the existing one, and problems to solve?

Thanks,

-- 
Peter Xu


