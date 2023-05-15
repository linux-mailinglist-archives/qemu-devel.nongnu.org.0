Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 620F5702DE7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:19:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyY6R-0006td-RS; Mon, 15 May 2023 09:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pyY6M-0006rb-Cc
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:18:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pyY6K-0004Nw-Dg
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:18:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684156735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H6xnjf/YvG+yyQsMinS8KQ7QfyVIiBFEp9H6O4EHNis=;
 b=ho68zc3MEcmfdLmoT0CO6SLN55/HAHK/BA3P71w0QR6H5hMbUh3/Qzfz7LCu853iqcCWpq
 F1yJx+oua+5Hq+39VY9BUWYhZHgzoQxzMK0mzbWLDwOMbsrRsRWzyZq6bEGXpmKDaX3++7
 JvS5KZyK3FEICnaBANtgOecoY4ios+Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-fjwbUD1wNva_NKyN4FnQhw-1; Mon, 15 May 2023 09:18:51 -0400
X-MC-Unique: fjwbUD1wNva_NKyN4FnQhw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8EA4A1C189A1;
 Mon, 15 May 2023 13:18:50 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.135])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 93305492B00;
 Mon, 15 May 2023 13:18:49 +0000 (UTC)
Date: Mon, 15 May 2023 15:18:48 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eesposit@redhat.com,
 vsementsov@yandex-team.ru
Subject: Re: Question about QMP and BQL
Message-ID: <ZGIxOOucbBsS1jwi@redhat.com>
References: <87h6sh2zug.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h6sh2zug.fsf@suse.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Am 12.05.2023 um 20:01 hat Fabiano Rosas geschrieben:
> Is there a way to execute a long-standing QMP command outside of the
> BQL?
> 
> The situation we're seeing is a slow query-block due to a slow system
> call (fstat over NFS) causing the main thread to spend too long
> holding the global mutex and locking up the vcpu thread when it goes
> out of the guest for MMIO.
> 
> The call chain for QMP is:
> 
> qmp_query_block
> bdrv_query_info
> bdrv_block_device_info
> bdrv_query_image_info
> bdrv_do_query_node_info
> bdrv_get_allocated_file_size
> bdrv_poll_co <- Waiting with qemu_global_mutex locked
> 
> [coroutine] bdrv_co_get_allocated_file_size_entry
> bdrv_co_get_allocated_file_size
> raw_co_get_allocated_file_size
> fstat <- SLOW!

The first part of the right solution there should be moving fstat() to a
worker thread like we do for other requests where we care about not
blocking. See existing raw_thread_pool_submit() callers for examples.

Note that this isn't the full solution yet. QMP still has to wait for
bdrv_get_allocated_file_size() to return. bdrv_poll_co() runs a nested
event loop, but it doesn't unlock the BQL.

So the second part would be converting the block-block QMP handler to
a coroutine so that it can actually yield to the main loop, which will
then drop the BQL while waiting. We would have to be careful there to
make sure that we don't break anything because the sets of things
allowed inside and outside coroutines are different.

Kevin


