Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BCC587C86
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 14:38:51 +0200 (CEST)
Received: from localhost ([::1]:34972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIrAf-0004Ll-SC
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 08:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oIr7R-0001QP-J5
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 08:35:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oIr7P-0002Co-5A
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 08:35:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659443726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zcUKoThq2w0UtA4mR07y3AcWpRMdBqBtA8x9f9v1Rvs=;
 b=YMlCGTELjG6fWcU1oNKY5R/EuCGbQAi9gWotdBZPNOjFLxylxj7zHlsG1LMb+7ipQPzqHH
 kHcEyqeX6/o8xsa97PPH/ei9wDzH6NdbzFDNeEYi5Dw1btMB/7a+bxLbZMY1SUsvcfwidz
 QO7SdDG3x3mRVVq53khlt6ASNGbua9o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-qX9pbHL-P_2D4RZyhtgkBg-1; Tue, 02 Aug 2022 08:35:21 -0400
X-MC-Unique: qX9pbHL-P_2D4RZyhtgkBg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D1F7280EE22;
 Tue,  2 Aug 2022 12:35:21 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1B4218ECC;
 Tue,  2 Aug 2022 12:35:20 +0000 (UTC)
Date: Tue, 2 Aug 2022 14:35:19 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Liang Yan <ly@xryan.net>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: Deadlock between bdrv_drain_all_begin and prepare_mmio_access
Message-ID: <YukaB8WarCdMFMmU@redhat.com>
References: <50e25c56-5624-fe2d-1327-665fc7b9bf05@xryan.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50e25c56-5624-fe2d-1327-665fc7b9bf05@xryan.net>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.07.2022 um 23:41 hat Liang Yan geschrieben:
> Hello All,
> 
> I am facing a lock situation between main-loop thread 1 and vcpu thread 4
> when doing a qmp snapshot. QEMU is running on 6.0.x, checked the upstream
> code and did not see any big change since between. Guest is a Windows 10 VM.
> Unfortunately, I could not get into the windows vm or reproduce the issue by
> myself. No iothread is used here, native aio only.
> 
> From the code,
> 
> -> AIO_WAIT_WHILE(NULL, bdrv_drain_all_poll());
> 
> --> aio_poll(qemu_get_aio_context(), true);
> 
> Mainloop mutex is locked when start snapshot in thread 1, vcpu released
> thread lock when address_space_rw and try to get thread lock again in
> prepare_mmio_access.
> 
> It seems main loop thread is stuck at aio_poll with blocking, but I can not
> figure out what the addr=4275044592 belongs to from mmio read.
> 
> I do not quite understand what really happens here, either block jobs never
> drained out or maybe a block io read from vcpu and cause a deadlock? I hope
> domain experts here could help figure out the root cause, thanks in advance
> and let me know if need any further information.

This does not look like a deadlock to me: Thread 4 is indeed waiting for
thread 1 to release the lock, but I don't think thread 1 is waiting in
any way for thread 4.

In thread 1, bdrv_drain_all_begin() waits for all in-flight I/O requests
to complete. So it looks a bit like some I/O request got stuck. If you
want to debug this a bit further, try to check what it is that makes
bdrv_drain_poll() still return true.

Please also add the QEMU command line you're using, especially the
configuration of the block device backends (for example, does this use
Linux AIO, the thread pool or io_uring?).

Kevin


