Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDE74CD2CE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:54:32 +0100 (CET)
Received: from localhost ([::1]:36820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ5Zv-0005y7-EL
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:54:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQ5Xd-0004GC-Q7
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:52:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQ5Xc-0003Y7-2D
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:52:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646391127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZMvOywKOef3Pv9qprJJSdWmu/krwUls4eyRmjn3sm5c=;
 b=eQD1YV9ND7WCdtiyJnjgiPKixE/gwJdn/+t2H3QdTJ5poeYWt7kKpnwiWBhxcQ9si6sIek
 uPgGNfJd6t+MrANWoN5fKi0vi0LtC0QgWv/kKxJF+jgsEmpwkXs1wLFTkYNxjyGBzvAia7
 2omjyNEFbmxwN00PMSE0kOrE9pTiBEs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-uaC9ru7OPpChb8Cs5GIwVA-1; Fri, 04 Mar 2022 05:52:06 -0500
X-MC-Unique: uaC9ru7OPpChb8Cs5GIwVA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BABE180A08E;
 Fri,  4 Mar 2022 10:52:03 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2E46842D6;
 Fri,  4 Mar 2022 10:51:44 +0000 (UTC)
Date: Fri, 4 Mar 2022 11:51:43 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v8 00/31] block layer: split block APIs in global state
 and I/O
Message-ID: <YiHvP7kEGoumeAzE@redhat.com>
References: <20220303151616.325444-1-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220303151616.325444-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 03.03.2022 um 16:15 hat Emanuele Giuseppe Esposito geschrieben:
> Currently, block layer APIs like block.h contain a mix of
> functions that are either running in the main loop and under the
> BQL, or are thread-safe functions and run in iothreads performing I/O.
> The functions running under BQL also take care of modifying the
> block graph, by using drain and/or aio_context_acquire/release.
> This makes it very confusing to understand where each function
> runs, and what assumptions it provided with regards to thread
> safety.
> 
> We call the functions running under BQL "global state (GS) API", and
> distinguish them from the thread-safe "I/O API".
> 
> The aim of this series is to split the relevant block headers in
> global state and I/O sub-headers. The division will be done in
> this way:
> header.h will be split in header-global-state.h, header-io.h and
> header-common.h. The latter will just contain the data structures
> needed by header-global-state and header-io, and common helpers
> that are neither in GS nor in I/O. header.h will remain for
> legacy and to avoid changing all includes in all QEMU c files,
> but will only include the two new headers. No function shall be
> added in header.c .
> Once we split all relevant headers, it will be much easier to see what
> uses the AioContext lock and remove it, which is the overall main
> goal of this and other series that I posted/will post.
> 
> In addition to splitting the relevant headers shown in this series,
> it is also very helpful splitting the function pointers in some
> block structures, to understand what runs under AioContext lock and
> what doesn't. This is what patches 21-27 do.
> 
> Each function in the GS API will have an assertion, checking
> that it is always running under BQL.
> I/O functions are instead thread safe (or so should be), meaning
> that they *can* run under BQL, but also in an iothread in another
> AioContext. Therefore they do not provide any assertion, and
> need to be audited manually to verify the correctness.
> 
> Adding assetions has helped finding 2 bugs already, as shown in
> my series "Migration: fix missing iothread locking".
> 
> Tested this series by running unit tests, qemu-iotests and qtests
> (x86_64).
> Some functions in the GS API are used everywhere but not
> properly tested. Therefore their assertion is never actually run in
> the tests, so despite my very careful auditing, it is not impossible
> to exclude that some will trigger while actually using QEMU.
> 
> Patch 1 introduces qemu_in_main_thread(), the function used in
> all assertions. This had to be introduced otherwise all unit tests
> would fail, since they run in the main loop but use the code in
> stubs/iothread.c
> Patches 2-27 (with the exception of patch 9-10, that are an additional
> assert) are all structured in the same way: first we split the header
> and in the next (or same, if small) patch we add assertions.
> Patch 28-31 take care instead of the block layer permission API,
> fixing some bugs where they are used in I/O functions.
> 
> This serie depends on my previous serie "block layer: permission API
> refactoring in preparation to the API split"
> 
> Based-on: <20220209105452.1694545-1-eesposit@redhat.com>
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
> v8:
> bdrv_get_full_backing_filename to GLOBAL_STATE_CODE
> blk_iostatus_is_enabled in IO_CODE
> blk_iostatus_set_err in IO_CODE
> bdrv_apply_auto_read_only in IO_CODE
> bdrv_can_set_read_only in IO_CODE
> blk_drain to GLOBAL_STATE_CODE

Thanks, fixed up the unintentional changes to bdrv_op_blocker_is_empty()
and bdrv_op_unblock_all() as discussed on IRC, and applied to the block
branch.

Kevin


