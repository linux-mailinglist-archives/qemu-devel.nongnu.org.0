Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C51D5454526
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 11:45:08 +0100 (CET)
Received: from localhost ([::1]:38834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnIR9-0001CO-DK
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 05:45:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1mnIQG-0000VZ-Pm
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 05:44:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1mnIQD-0003XM-N8
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 05:44:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637145837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=usppqUpW+NPjp6M+6uTVXXat88J2rlGQwD3aTNFe5oM=;
 b=Bxp5CT0Ci+TKXJ41PJUOVxpEpKydeJWmDeX4VnzeI0S6taQoNVGUz1lgBBNRHiLHIZlMxs
 bcC7Ll5vumEWxweLKZBf97W4pt/0LGNtZCebA/F0VHMnif1QXBpiBzzFUM1hMbUQI/5bVn
 EalIeuqFT07+mo7Hlqd5+lYVif9cYw4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-r45ZnsQTPbiAe-nQ3HWTKA-1; Wed, 17 Nov 2021 05:43:56 -0500
X-MC-Unique: r45ZnsQTPbiAe-nQ3HWTKA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66D4F10168CF
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 10:43:55 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.195.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0D6B100164A;
 Wed, 17 Nov 2021 10:43:44 +0000 (UTC)
Subject: Re: [PATCH v2] dump-guest-memory: Use BQL to protect dump finalize
 process
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20211116135441.7711-1-peterx@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <88ea78f1-7633-b8e0-d2f7-42be598e8a22@redhat.com>
Date: Wed, 17 Nov 2021 11:43:42 +0100
MIME-Version: 1.0
In-Reply-To: <20211116135441.7711-1-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 14:54, Peter Xu wrote:
> When finalizing the dump-guest-memory with detached mode, we'll first set dump
> status to either FAIL or COMPLETE before doing the cleanup, however right after
> the dump status change it's possible that another dump-guest-memory qmp command
> is sent so both the main thread and dump thread (which is during cleanup) could
> be accessing dump state in parallel.  That's racy.
> 
> Fix it by protecting the finalizing phase of dump-guest-memory using BQL as
> well, as qmp_dump_guest_memory() (which is the QEMU main thread) requires BQL.
> To do that, we expand the BQL from dump_cleanup() into dump_process(), so we
> will take the BQL longer than before.  The critical section must cover the
> status switch from ACTIVE->{FAIL|COMPLETE} so as to make sure there's no race
> any more.
> 
> We can also just introduce a specific mutex to serialize the dump process, but
> BQL should be enough for now so far, not to mention vm_start() in dump_cleanup
> will need BQL anyway, so maybe easier to just use the same mutex.
> 
> Reported-by: Laszlo Ersek <lersek@redhat.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
> v2:
> - Fix parallel spelling [Marc-Andre]
> - Add r-b for Marc-Andre
> - Mention that qmp_dump_guest_memory() is with BQL held [Laszlo]
> ---
>  dump/dump.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

Thank you!
Laszlo


