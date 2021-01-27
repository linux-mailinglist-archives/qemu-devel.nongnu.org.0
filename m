Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDA53063E3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 20:15:20 +0100 (CET)
Received: from localhost ([::1]:39244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4qHe-0008MD-LO
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 14:15:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l4qFs-0007vi-PV
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 14:13:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l4qFq-0002l7-Ib
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 14:13:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611774805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7JRwJhNswRoKdi54MfP43v0Pqv8ffR1PlfrdEPGr0y4=;
 b=MhEYmptBkuVXLjpQsLy+df5Npx0djsR1OSZmn8AovLW3arGEjaLS/vJquHFjDYZ9EKrhp3
 7huOAq5/juyHjO/Bj733cL8CP+cH+jVF3ohfHW6O3re3UqfLjgm8yCNbNdu0geTB+ckk9W
 jImKJYHNZL/gxGIXmdwVITPZH4whfBw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-dovmbmVhOMGicbURuRd1Dg-1; Wed, 27 Jan 2021 14:13:21 -0500
X-MC-Unique: dovmbmVhOMGicbURuRd1Dg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0664190D341
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 19:13:20 +0000 (UTC)
Received: from [10.3.113.91] (ovpn-113-91.phx2.redhat.com [10.3.113.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66CA760854;
 Wed, 27 Jan 2021 19:13:14 +0000 (UTC)
Subject: Re: [PATCH] coroutine-sigaltstack: Add SIGUSR2 mutex
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
References: <20210125120305.19520-1-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <8c766d8d-4deb-ccef-1be1-a26a6654a88a@redhat.com>
Date: Wed, 27 Jan 2021 13:13:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210125120305.19520-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?B?TMOhc3psw7Mgw4lyc2Vr?= <lersek@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/21 6:03 AM, Max Reitz wrote:
> Disposition (action) for any given signal is global for the process.
> When two threads run coroutine-sigaltstack's qemu_coroutine_new()
> concurrently, they may interfere with each other: One of them may revert
> the SIGUSR2 handler to SIG_DFL, between the other thread (a) setting up
> coroutine_trampoline() as the handler and (b) raising SIGUSR2.  That
> SIGUSR2 will then terminate the QEMU process abnormally.
> 
> We have to ensure that only one thread at a time can modify the
> process-global SIGUSR2 handler.  To do so, wrap the whole section where
> that is done in a mutex.
> 
> Alternatively, we could for example have the SIGUSR2 handler always be
> coroutine_trampoline(), so there would be no need to invoke sigaction()
> in qemu_coroutine_new().  Laszlo has posted a patch to do so here:
> 
>   https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg05962.html

I indeed like that one, but also concur that simplicity trumps the
uncertainty of a larger patch.  Let's get things unbroken before we
worry about optimizing things to avoid the mutex.

> 
> However, given that coroutine-sigaltstack is more of a fallback
> implementation for platforms that do not support ucontext, that change
> may be a bit too invasive to be comfortable with it.  The mutex proposed
> here may negatively impact performance, but the change is much simpler.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  util/coroutine-sigaltstack.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


