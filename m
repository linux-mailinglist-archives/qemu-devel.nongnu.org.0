Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E9D60756D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 12:52:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpdZ-0002KH-Do
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:52:26 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloeH-0001CN-QZ
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oloe7-00008t-AI
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:48:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oloe4-0003lY-MM
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:48:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666345731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bV2zaXulo4/o29W/e6MyuweBzq44uZMfw0Dk7Oa0fNo=;
 b=CKiMzK5RvPDBH3hFXXCEN/v0ztxN54vKgHJkdoaz31gaAFSf6ERYeyqZcGugex2m4S31xq
 s9ZO73Rcprjma3hOTpjo3hGw4bEdw8D0487PE3Zhp7hpuY56041ON7EnEFwTwZ1YuCWDMd
 7TithN40sFIPL+6OXnBPuu8xSE7De4A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-3lSunoIRMkeni78UxFM8Pw-1; Fri, 21 Oct 2022 05:48:47 -0400
X-MC-Unique: 3lSunoIRMkeni78UxFM8Pw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2741C877CA4;
 Fri, 21 Oct 2022 09:48:41 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 099191759E;
 Fri, 21 Oct 2022 09:48:31 +0000 (UTC)
Date: Fri, 21 Oct 2022 11:48:30 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, Julia Suvorova <jusual@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-block@nongnu.org
Subject: Re: [PATCH] block/io_uring: revert "Use io_uring_register_ring_fd()
 to skip fd operations"
Message-ID: <Y1Jq7hQSXPzgQAxX@redhat.com>
References: <20220924144815.5591-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924144815.5591-1-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 24.09.2022 um 16:48 hat Sam Li geschrieben:
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1193
> 
> The commit "Use io_uring_register_ring_fd() to skip fd operations" broke
> when booting a guest with iothread and io_uring. That is because the
> io_uring_register_ring_fd() call is made from the main thread instead of
> IOThread where io_uring_submit() is called. It can not be guaranteed
> to register the ring fd in the correct thread or unregister the same ring
> fd if the IOThread is disabled. This optimization is not critical so we
> will revert previous commit.
> 
> This reverts commit e2848bc574fe2715c694bf8fe9a1ba7f78a1125a
> and 77e3f038af1764983087e3551a0fde9951952c4d.
> 
> Signed-off-by: Sam Li <faithilikerun@gmail.com>

Thanks, applied to the block branch.

Kevin


